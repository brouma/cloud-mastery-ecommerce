import 'dotenv/config';
import { PrismaClient } from '@prisma/client';
import { faker } from '@faker-js/faker';
import { SEED_CUSTOMERS } from './customers/data';
import * as fs from 'node:fs';
import * as path from 'node:path';

const prisma = new PrismaClient();

type CsvProduct = {
  name: string;
  category: string;
  description: string;
  unitCost: number;
  quantity: number;
  totalCost: number;
  imageUrl: string;
};

function parseNumeric(value: string | undefined): number {
  const normalized = (value || '').replace(/[^0-9.-]/g, '');
  const parsed = Number(normalized);
  return Number.isFinite(parsed) ? parsed : 0;
}

function parseCsvRow(line: string): string[] {
  const fields: string[] = [];
  let current = '';
  let inQuotes = false;

  for (let i = 0; i < line.length; i += 1) {
    const char = line[i];

    if (char === '"') {
      const nextChar = line[i + 1];
      if (inQuotes && nextChar === '"') {
        current += '"';
        i += 1;
      } else {
        inQuotes = !inQuotes;
      }
      continue;
    }

    if (char === ',' && !inQuotes) {
      fields.push(current.trim());
      current = '';
      continue;
    }

    current += char;
  }

  fields.push(current.trim());
  return fields;
}

function loadProductsFromCsv(): CsvProduct[] {
  const csvPath = path.resolve(process.cwd(), '..', 'Soko Shop.csv');

  if (!fs.existsSync(csvPath)) {
    throw new Error(`CSV file not found at ${csvPath}`);
  }

  const raw = fs.readFileSync(csvPath, 'utf8').replace(/^\uFEFF/, '');
  const lines = raw.split(/\r?\n/).filter((line) => line.trim().length > 0);

  if (lines.length < 2) {
    throw new Error('Soko Shop.csv has no product rows.');
  }

  const header = parseCsvRow(lines[0]);
  const idxName = header.indexOf('Name');
  const idxCategory = header.indexOf('Category');
  const idxDescription = header.indexOf('Description');
  const idxPrice = header.indexOf('Price_KES');
  const idxStock = header.indexOf('Stock_Qty');

  const requiredIndexes = [idxName, idxCategory, idxDescription, idxPrice, idxStock];
  if (requiredIndexes.some((idx) => idx < 0)) {
    throw new Error('Soko Shop.csv is missing one or more required columns.');
  }

  return lines.slice(1).map((line) => {
    const cols = parseCsvRow(line);
    const name = cols[idxName] || 'Unknown Product';
    const category = cols[idxCategory] || 'Uncategorized';
    const description = cols[idxDescription] || '';
    const unitCost = parseNumeric(cols[idxPrice]);
    const quantity = Math.max(0, Math.trunc(parseNumeric(cols[idxStock])));

    return {
      name,
      category,
      description,
      unitCost,
      quantity,
      totalCost: unitCost * quantity,
      imageUrl: `https://placehold.co/600x400/png?text=${encodeURIComponent(name)}`,
    };
  });
}

async function main() {
  console.log('Starting seed using products from Soko Shop.csv ...');
  const customerDateWindow = {
    gte: new Date('2026-06-29T00:00:00.000Z'),
    lt: new Date('2026-06-30T00:00:00.000Z'),
  };

  const existingCustomersCount = await prisma.customer.count();
  if (existingCustomersCount === 0) {
    console.log('No customers found. Seeding customers from prisma/customers...');
    for (const customer of SEED_CUSTOMERS) {
      await prisma.customer.create({ data: customer });
    }
  }

  const createdCustomers = await prisma.customer.findMany({
    where: {
      createdAt: customerDateWindow,
    },
  });

  console.log(`Using ${createdCustomers.length} customers created on 2026-06-29.`);

  console.log('Removing current orders and products...');
  await prisma.order_detail.deleteMany({});
  await prisma.order.deleteMany({});
  await prisma.product.deleteMany({});

  const csvProducts = loadProductsFromCsv();
  console.log(`Importing ${csvProducts.length} products from Soko Shop.csv ...`);

  await prisma.product.createMany({
    data: csvProducts,
  });

  const createdProducts = await prisma.product.findMany();

  // Generate 50 orders with line items based on imported products.
  if (createdCustomers.length > 0 && createdProducts.length > 0) {
    console.log('Creating 50 orders with items...');
    const paymentMethods = ['VISA', 'MASTERCARD', 'PAYPAL', 'CASH', 'BANK_TRANSFER', 'MPESA'];
    const statuses = ['pending', 'confirmed', 'shipped', 'delivered', 'cancelled'];
    
    let orderBatch = [];
    
    for (let i = 0; i < 50; i++) {
      const customer = faker.helpers.arrayElement(createdCustomers);
      const orderDate = faker.date.recent({ days: 90 }); // Random date within last 90 days
      const orderNumber = `ORD-${Date.now()}-${faker.string.alphanumeric(6).toUpperCase()}`;

      // Generate paymentMethod and status before orderItems so they can be copied into each detail row
      const paymentMethod = faker.helpers.arrayElement(paymentMethods);
      const status = faker.helpers.arrayElement(statuses);

      // Randomly select 1-5 products for this order
      const numberOfItems = faker.number.int({ min: 1, max: 5 });
      const selectedProducts = faker.helpers.arrayElements(createdProducts, numberOfItems);
      
      // Calculate order total and create order items (denormalized with parent order fields)
      let orderTotal = 0;
      const orderItems = selectedProducts.map(product => {
        const quantity = faker.number.int({ min: 1, max: 5 });
        const itemTotal = Number(product.unitCost) * quantity;
        orderTotal += itemTotal;

        return {
          productId: product.id,
          customerName: `${customer.firstName} ${customer.lastName}`,
          phoneNumber: customer.phone,
          productName: product.name,
          category: product.category,
          unitCost: product.unitCost,
          quantity: quantity,
          totalCost: itemTotal,
          paymentMethod: paymentMethod, // denormalized copy from parent order
          status: status,               // denormalized copy from parent order
          city: customer.city ?? '',
          orderDate: orderDate,         // denormalized copy from parent order
        };
      });

      const orderData = {
        customerId: customer.id,
        orderNumber: orderNumber,
        orderAmount: orderTotal,
        orderDate: orderDate,
        description: faker.lorem.sentence(),
        paymentMethod: paymentMethod,
        shippingAddress: `${customer.address}, ${customer.city}`,
        status: status,
        items: {
          create: orderItems
        }
      };

      orderBatch.push(orderData);
      
      if (orderBatch.length === 10 || i === 49) {
        try {
          const batchResults = await Promise.allSettled(
            orderBatch.map(order => 
              prisma.order.create({
                data: order,
                include: { items: true }
              })
            )
          );
          
          const successCount = batchResults.filter(result => result.status === 'fulfilled').length;
          // Log any failures with their actual error messages
          batchResults.forEach((result, idx) => {
            if (result.status === 'rejected') {
              console.error(`Order ${idx} in batch failed:`, result.reason?.message ?? result.reason);
            }
          });
          console.log(`Created orders batch: ${Math.min(i + 1, 50)}/50 (${successCount} successful in this batch)`);
          
        } catch (error) {
          console.error('Order batch creation error:', error);
        }
        
        orderBatch = [];
      }
    }
  }

  console.log('Seed completed successfully!');

  // Final count
  const finalCustomersCount = await prisma.customer.count();
  const finalProductsCount = await prisma.product.count();
  const finalOrdersCount = await prisma.order.count();
  const finalOrderItemsCount = await prisma.order_detail.count();
  
  console.log(`Final database state:`);
  console.log(`- Customers: ${finalCustomersCount}`);
  console.log(`- Products: ${finalProductsCount}`);
  console.log(`- Orders: ${finalOrdersCount}`);
  console.log(`- Order Items: ${finalOrderItemsCount}`);
}

main()
  .catch((e) => {
    console.error('Error during seed:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });