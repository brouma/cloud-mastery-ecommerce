import 'dotenv/config';
import { PrismaClient } from '@prisma/client';
import { SEED_CUSTOMERS } from './data';

const prisma = new PrismaClient();

async function main() {
  console.log('Seeding customers from prisma/customers/data.ts ...');

  const seedEmails = SEED_CUSTOMERS.map((customer) => customer.email);

  // Keep seeded customer dataset exact by removing stale soko.test records.
  await prisma.customer.deleteMany({
    where: {
      email: {
        endsWith: '@soko.test',
        notIn: seedEmails,
      },
    },
  });

  let created = 0;
  let updated = 0;

  for (const customer of SEED_CUSTOMERS) {
    const existing = await prisma.customer.findUnique({
      where: { email: customer.email },
      select: { id: true },
    });

    if (existing) {
      await prisma.customer.update({
        where: { id: existing.id },
        data: {
          firstName: customer.firstName,
          lastName: customer.lastName,
          phone: customer.phone,
          address: customer.address,
          city: customer.city,
        },
      });
      updated += 1;
      continue;
    }

    await prisma.customer.create({
      data: customer,
    });
    created += 1;
  }

  const total = await prisma.customer.count();

  console.log(`Customers created: ${created}`);
  console.log(`Customers updated: ${updated}`);
  console.log(`Total customers in DB: ${total}`);
}

main()
  .catch((error) => {
    console.error('Customer seed failed:', error);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });