export type SeedCustomer = {
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
  address: string;
  city: string;
};

const FIRST_NAMES = [
  "Amani",
  "Wanjiku",
  "Otieno",
  "Barasa",
  "Chebet",
  "Mutiso",
  "Akinyi",
  "Mwangi",
  "Atieno",
  "Mohamed",
  "Faith",
  "Brian",
  "Sharon",
  "Kelvin",
  "Mercy",
  "Dennis",
  "Linet",
  "Kevin",
  "Nelly",
  "Isaac",
  "Brenda",
  "Victor",
  "Joy",
  "Ian",
  "Rose",
];

const LAST_NAMES = [
  "Njoroge",
  "Kamau",
  "Achieng",
  "Wekesa",
  "Kipruto",
  "Munyoki",
  "Odhiambo",
  "Kariuki",
  "Okoth",
  "Abdalla",
  "Wairimu",
  "Kimani",
  "Mutua",
  "Chepkoech",
  "Mwende",
  "Maina",
  "Ouma",
  "Cherono",
  "Kilonzo",
  "Muthoni",
  "Were",
  "Rono",
  "Jepkosgei",
  "Nyambura",
  "Kigen",
];

const CITIES = [
  "Nairobi",
  "Mombasa",
  "Kisumu",
  "Nakuru",
  "Eldoret",
  "Thika",
  "Machakos",
  "Meru",
  "Nyeri",
  "Kakamega",
];

export const SEED_CUSTOMERS: SeedCustomer[] = Array.from({ length: 50 }, (_, index) => {
  const firstName = FIRST_NAMES[index % FIRST_NAMES.length];
  const lastName = LAST_NAMES[(index * 3) % LAST_NAMES.length];
  const city = CITIES[index % CITIES.length];
  const emailLocal = `${firstName}.${lastName}.${String(index + 1).padStart(2, "0")}`.toLowerCase();
  const phone = `+2547${String(20000000 + index).padStart(8, "0")}`;

  return {
    firstName,
    lastName,
    email: `${emailLocal}@soko.test`,
    phone,
    address: `${10 + index} Market Street`,
    city,
  };
});
