-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: cloud-mastery-test
-- ------------------------------------------------------
-- Server version	8.0.44-google

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `cloud-mastery-test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cloud_mastery_sample` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `cloud_mastery_sample`;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('30efd8e9-4ff9-4db7-bcfc-3f8e77aa3367','bdf9e383aed2c2bf638593a52ef7d4f617b055f23113c72875edf0f620975e47','2026-06-25 08:57:19.095','20260507113944_denormalize_order_details',NULL,NULL,'2026-06-25 08:57:18.187',1),('5bc62370-1f49-4d72-967e-d2645937fb6f','c17a7af7e70b7acc26ed62482758e1a0769a55924561c766b8800246c318f97a','2026-06-25 08:57:14.705','20260408121043_init',NULL,NULL,'2026-06-25 08:57:13.835',1),('a4c86c12-4f58-4f43-b4d8-03f4500c232e','a27df7bb1e5c81b69803b28e9018b6912cb082a2d6085bc55b6abd55fbcd4563','2026-06-25 08:57:13.361','20250522133130_init',NULL,NULL,'2026-06-25 08:57:11.932',1),('a571bb08-8f27-4945-8c7b-9619c4089bb3','022d9b57cf437477efc0f560d574240dad6a6cd56659b5c24b37a910c2c04120','2026-06-25 08:57:17.868','20260507112627_denormalize_order_details',NULL,NULL,'2026-06-25 08:57:17.049',1),('b0047a6b-8ae4-42fd-939f-bd5a0aed9acf','c3b25e4d0a77befa6051f65bcaa7e529d5d6fc2b8df92c25beb98eb18386380f','2026-06-25 08:57:16.775','20260507085407_denormalize_order_details',NULL,NULL,'2026-06-25 08:57:16.022',1),('b44d6de4-d391-4242-915b-07c04a90a372','008b33bb082c8b6a93df326eb1ed3001f6434347ec566d35b85579f53a818d19','2026-06-25 08:57:15.765','20260507071625_add_order_details_fields',NULL,NULL,'2026-06-25 08:57:15.017',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_key` (`email`),
  KEY `customers_firstName_lastName_email_idx` (`firstName`,`lastName`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('2d7a4b10-70e8-4252-8aa6-ed43f0a5cb15','Laura','Ongeri','customer.0712345678@soko.user','0712345678','Westlands','Westlands','2026-07-15 09:17:00.219000','2026-07-15 09:17:00.219000'),('38e2c3dd-ac51-40e9-b204-cb3158398eab','Linet','Nyambura','linet.nyambura.42@soko.test','+254720000041','51 Market Street','Mombasa','2026-06-29 06:55:26.343000','2026-06-29 10:14:48.362000'),('449ae58a-6fb6-488f-ae71-9c5a6ff16db0','Nelly','Kipruto','nelly.kipruto.44@soko.test','+254720000043','53 Market Street','Nakuru','2026-06-29 06:55:26.346000','2026-06-29 10:14:48.367000'),('87671d2a-619c-4d58-ac68-e43eced908ff','Dennis','Were','dennis.were.41@soko.test','+254720000040','50 Market Street','Nairobi','2026-06-29 06:55:26.341000','2026-06-29 10:14:48.360000'),('93b87328-c9de-4090-8408-35909e3d0e0b','Isaac','Kariuki','isaac.kariuki.45@soko.test','+254720000044','54 Market Street','Eldoret','2026-06-29 06:55:26.347000','2026-06-29 10:14:48.368000'),('cd44fd2d-0f70-4754-8043-5e49d1548fbf','Brenda','Wairimu','brenda.wairimu.46@soko.test','+254720000045','55 Market Street','Thika','2026-06-29 06:55:26.348000','2026-06-29 10:14:48.370000'),('f113bc33-36c2-4799-a37c-90eef36cae22','Kevin','Kamau','kevin.kamau.43@soko.test','+254720000042','52 Market Street','Kisumu','2026-06-29 06:55:26.345000','2026-06-29 10:14:48.365000');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unitCost` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `totalCost` decimal(10,2) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `order_date` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `paymentMethod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(511) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_details_order_id_fkey` (`order_id`),
  KEY `order_details_product_id_fkey` (`product_id`),
  CONSTRAINT `order_details_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `order_details_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderAmount` decimal(10,2) NOT NULL,
  `orderDate` datetime(3) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `paymentMethod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shippingAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `orders_customer_id_fkey` (`customer_id`),
  CONSTRAINT `orders_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unitCost` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `totalCost` decimal(10,2) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_idx` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('00f3cd83-c9d1-4b08-b3ef-e9e9380307f1','Tilapia Whole Fish 500g','Freshwater tilapia from Lake Victoria. Cleaned and scaled. Chilled, not frozen.','Proteins',250.00,70,17500.00,'2026-06-29 10:17:07.962000','2026-07-03 09:27:39.000000','https://storage.googleapis.com/cloud_mastery_images/screen-shot-2020-05-20-at-105115-am.png'),('03975ed0-ad8e-4665-8e9d-81b00d43af72','Eveready AA Batteries 4pk','Eveready Gold alkaline AA batteries. 10-year shelf life. Made in Kenya.','Electronics',145.00,380,55100.00,'2026-06-29 10:17:07.962000','2026-07-03 07:25:15.000000','https://storage.googleapis.com/cloud_mastery_images/ever-ready-battery.jpeg'),('04e2bd1a-da81-419f-9f87-da263c19912f','Bananas 1kg','Sweet Cavendish bananas from Thika and Murang\'a. Ripe and ready to eat.','Fruits',80.00,310,24800.00,'2026-06-29 10:17:07.962000','2026-07-03 06:55:24.000000','https://storage.cloud.google.com/cloud_mastery_images/Cavendish_Banana_DS.jpg'),('059882df-75b3-4081-b1cf-9e223196ad56','KCC Butter 250g','Kenya Cooperative Creameries salted butter. Rich and creamy from grass-fed Kenyan cows.','Dairy',245.00,180,44100.00,'2026-06-29 10:17:07.962000','2026-07-03 07:44:50.000000','https://storage.googleapis.com/cloud_mastery_images/kcc_butter.avif'),('06307e4c-624c-413a-9f3f-e4f72d95aff9','Sukuma Wiki (Kale) 250g','Fresh sukuma wiki (kale) harvested same-day from Kiambu farms.','Vegetables',35.00,420,14700.00,'2026-06-29 10:17:07.962000','2026-07-03 09:21:06.000000','https://storage.googleapis.com/cloud_mastery_images/tXqLX_Freshly-Harvested-Kale-Sukuma-Wiki.jpg'),('0b4e95b9-6bee-4b10-9570-52085d3fefbc','Jogoo Maize Flour 2kg','Jogoo maize flour — smooth texture, consistent cook. Trusted by Kenyan households since 1972.','Grains & Flour',138.00,290,40020.00,'2026-06-29 10:17:07.962000','2026-07-03 09:21:49.000000','https://storage.googleapis.com/cloud_mastery_images/jogoo.jpg'),('106df7e2-25a1-4f7d-9806-96a01f48fd21','Ariel Washing Powder 500g','Ariel with Febreze freshness. Stain removal in one wash. Suitable for hand and machine wash.','Household Cleaning',175.00,240,42000.00,'2026-06-29 10:17:07.962000','2026-07-03 09:22:39.000000','https://storage.googleapis.com/cloud_mastery_images/ariel_powder.avif'),('1782b6a1-5ffe-4ab1-aaa7-02ca8125d5b7','Daima Long-Life Milk 1L','Daima UHT whole milk. Fortified with vitamins A and D. No refrigeration needed.','Dairy',125.00,360,45000.00,'2026-06-29 10:17:07.962000','2026-07-03 09:23:32.000000','https://storage.googleapis.com/cloud_mastery_images/daima-milk.avif'),('179112f3-0fe8-4134-871d-9dbf7b9816e1','Avocados 3 pcs','Large Kenyan Hass avocados from Muranga. Ripe — eat within 2 days.','Fruits',120.00,190,22800.00,'2026-06-29 10:17:07.962000','2026-07-03 09:24:38.000000','https://storage.googleapis.com/cloud_mastery_images/avocado.jpeg'),('1b595bd9-3aaa-4a71-94d8-864e007ff5e5','Always Pads Regular 10s','Always Regular pads with wings. Leakage barriers for 8-hour protection.','Personal Care',185.00,320,59200.00,'2026-06-29 10:17:07.962000','2026-07-03 09:55:23.000000','https://storage.googleapis.com/cloud_mastery_images/always.jpg'),('258a830d-5a9b-493c-ace0-4e9407141257','Mumias Sugar 1kg','Fine white granulated cane sugar from Mumias Sugar Company, Western Kenya.','Sugar & Sweeteners',155.00,410,63550.00,'2026-06-29 10:17:07.962000','2026-07-03 10:00:31.000000','https://storage.googleapis.com/cloud_mastery_images/mumias_sugar.jpg'),('27562bd8-8f1e-4c2a-929c-3b28b0d2b9cf','Irish Potatoes 2kg','Fresh Irish potatoes from Meru. Good for roasting, frying, and stews.','Vegetables',130.00,250,32500.00,'2026-06-29 10:17:07.962000','2026-07-03 09:43:59.000000','https://storage.googleapis.com/cloud_mastery_images/potatos.jpeg'),('2c7b0d0e-fb21-47e4-b167-bd45a24fd452','Elianto Cooking Oil 1L','Refined sunflower oil. Zero cholesterol. High smoke point for frying and sautéing.','Cooking Oils',280.00,380,106400.00,'2026-06-29 10:17:07.962000','2026-07-06 06:58:23.000000','https://storage.googleapis.com/cloud_mastery_images/elianto.avif'),('2ffb5a52-7418-488a-88ea-7d0b4a5c338b','Kenchic Chicken Sausages 500g','Kenchic chicken sausages. Lightly smoked. Ready to fry or grill.','Proteins',425.00,110,46750.00,'2026-06-29 10:17:07.962000','2026-07-06 06:47:34.000000','https://storage.googleapis.com/cloud_mastery_images/sausages.avif'),('30ce7088-2e85-4bb4-835a-3c9bbc5de074','Kericho Gold Tea 100g','Premium Kenyan tea from the Kericho highlands. Bold flavour, rich aroma. Orthodox cut.','Beverages',135.00,560,75600.00,'2026-06-29 10:17:07.962000','2026-07-03 09:53:16.000000','https://storage.googleapis.com/cloud_mastery_images/kericho_gold.jpeg'),('3f4f68da-ab9e-46c7-b81c-9a890b0d6073','Brookside UHT Milk 500ml','Long-life whole milk. No refrigeration before opening. 6-month shelf life.','Dairy',65.00,480,31200.00,'2026-06-29 10:17:07.962000','2026-07-06 07:00:32.000000','https://storage.googleapis.com/cloud_mastery_images/brookside_frsh.jpg'),('4968c823-b2b2-4808-85e4-f6949ee65674','Colgate Toothpaste 75ml','Colgate Maximum Cavity Protection. Fluoride toothpaste. Mint flavour.','Personal Care',145.00,430,62350.00,'2026-06-29 10:17:07.962000','2026-07-03 07:41:59.000000','https://storage.googleapis.com/cloud_mastery_images/Colgate-Cavity-Protection-Toothpaste-with-Fluoride-Minty-Great-Flavor-2-5-oz-Tube_3fd969aa-b443-4a5d-9bd9-39732bbf5d69.77b808d3dc7ef4e9247ea3b5577f5c86.avif'),('4c5a8285-5ea1-4f43-af2f-06a6e454a0ef','Egg Half Tray 15 pcs','Half tray — ideal for small households. Same Grade A quality eggs.','Proteins',270.00,220,59400.00,'2026-06-29 10:17:07.962000','2026-07-06 06:44:22.000000','https://storage.googleapis.com/cloud_mastery_images/eggs_half_dozen.jpg'),('5350a474-5d96-4331-baf7-fc9647298a66','Brookside Fresh Milk 1L','Fresh pasteurised whole milk from Kenyan dairy farms. Refrigerate after opening.','Dairy',95.00,320,30400.00,'2026-06-29 10:17:07.962000','2026-07-06 06:46:29.000000','https://storage.googleapis.com/cloud_mastery_images/brookside_frsh.jpg'),('5a744f64-17f3-4e55-90df-dd9586fc3878','Pediasure Vanilla 400g','Complete nutritional supplement for children 1-10 years. Vanilla flavour.','Baby Care',2250.00,55,123750.00,'2026-06-29 10:17:07.962000','2026-07-06 07:02:19.000000','https://storage.googleapis.com/cloud_mastery_images/pediasure'),('6298c91e-6d8f-4f11-8786-39b8b8ff4b64','Basmati Rice 1kg','Extra long grain basmati rice, imported and packed for the Kenyan market.','Grains & Flour',175.00,240,42000.00,'2026-06-29 10:17:07.962000','2026-07-06 07:08:47.000000','https://storage.googleapis.com/cloud_mastery_images/basmati_rice.jpg'),('642a4f7b-5892-480e-9da1-fdd8c512f833','Onions 1kg','Red onions from Kajiado and Naivasha farms. Firm and aromatic.','Vegetables',75.00,380,28500.00,'2026-06-29 10:17:07.962000','2026-07-03 09:48:11.000000','https://storage.googleapis.com/cloud_mastery_images/onions.webp'),('68515565-6dc6-4234-9a84-1740f1c548f1','Chicken Breast 500g','Boneless skinless chicken breast. Halal certified. Packed fresh.','Proteins',355.00,95,33725.00,'2026-06-29 10:17:07.962000','2026-07-03 07:39:13.000000','https://storage.googleapis.com/cloud_mastery_images/CHICKEN-LEG-BONELESS-500G-2.jpg'),('73ba0ea0-1d22-4d3f-ab1a-99fec802aa9c','Fresha Yoghurt 500ml','Natural stirred yoghurt with live cultures. Strawberry and plain variants available.','Dairy',135.00,195,26325.00,'2026-06-29 10:17:07.962000','2026-07-06 07:02:59.000000','https://storage.googleapis.com/cloud_mastery_images/fresha_yoghurt.avif'),('74e6f8e7-c936-497b-beda-d612c0e2b6f3','Elianto Cooking Oil 3L','Economy family jerry can. Same premium Elianto quality at lower cost per litre.','Cooking Oils',790.00,155,122450.00,'2026-06-29 10:17:07.962000','2026-07-03 07:43:27.000000','https://storage.googleapis.com/cloud_mastery_images/Elianto-3L_ae4c4065-4e67-4533-bd7d-a874daba0308.webp'),('7c518d04-ca1e-478c-ae80-fa9c40a09051','Wheat Flour 2kg','All-purpose Ajab wheat flour — bakeries and home bakers\' choice.','Grains & Flour',160.00,200,32000.00,'2026-06-29 10:17:07.962000','2026-07-06 07:04:19.000000','https://storage.googleapis.com/cloud_mastery_images/ajab_flour.avif'),('7ed4213c-3b86-453d-8363-7dab39fc45e0','Fresh Fri Vegetable Fat 500g','Semi-solid vegetable cooking fat. Ideal for deep frying mandazi, samosas, and fries.','Cooking Oils',165.00,290,47850.00,'2026-06-29 10:17:07.962000','2026-07-03 09:54:29.000000','https://storage.googleapis.com/cloud_mastery_images/freshfri.jpg'),('85a2d179-1d04-4162-8ba5-de759e072a82','Egg Tray 30 pcs','Fresh Grade A hen eggs. Sourced from Kenyan poultry farms. Refrigerate after purchase.','Proteins',520.00,140,72800.00,'2026-06-29 10:17:07.962000','2026-07-03 06:57:12.000000','https://storage.cloud.google.com/cloud_mastery_images/eggs_30.png'),('8bc39570-5a9c-48dc-8078-8b2cedbdb4be','Jik Bleach 750ml','Original Jik bleach. Kills 99.9% of bacteria and viruses. Multi-surface safe.','Household Cleaning',145.00,310,44950.00,'2026-06-29 10:17:07.962000','2026-07-03 09:49:04.000000','https://storage.googleapis.com/cloud_mastery_images/jik750.jpeg'),('8bcee3c7-72ef-4007-949c-391de8ff141a','Beef Mince 500g','Freshly minced lean beef. 85% lean. Packed and refrigerated same-day.','Proteins',395.00,85,33575.00,'2026-06-29 10:17:07.962000','2026-07-03 06:40:21.000000','https://storage.cloud.google.com/cloud_mastery_images/5%20Star%20Beef%20Mince%20500g.avif'),('8da5213b-91d2-4bcf-aefc-1c0dcfb2526e','Kericho Gold Tea 500g','Large pack for offices and large families. Same premium highland tea, better value.','Beverages',565.00,195,110175.00,'2026-06-29 10:17:07.962000','2026-07-03 09:50:22.000000','https://storage.googleapis.com/cloud_mastery_images/kericho_gold_500.jpg'),('910bf552-5025-4ab7-b19f-423815c11ea6','Zesta Sunflower Oil 2L','Premium cold-pressed sunflower oil. Fortified with vitamins A, D, and E.','Cooking Oils',550.00,170,93500.00,'2026-06-29 10:17:07.962000','2026-07-06 07:06:20.000000','https://storage.googleapis.com/cloud_mastery_images/zesta_sunflower.webp'),('936f91ca-b209-4205-bf2d-217ae28b3240','Pampers Baby Dry Size 3 (36s)','Pampers Baby-Dry size 3 (6-10kg). 12-hour dryness. Breathable cover.','Baby Care',1195.00,95,113525.00,'2026-06-29 10:17:07.962000','2026-07-06 07:06:59.000000','https://storage.googleapis.com/cloud_mastery_images/pampers.png'),('a4b327df-7c10-4415-bd07-a7029b835ccc','Dove Shampoo 200ml','Dove Intensive Repair shampoo. Strengthens damaged hair from roots to tips.','Personal Care',395.00,210,82950.00,'2026-06-29 10:17:07.962000','2026-07-06 07:07:41.000000','https://storage.googleapis.com/cloud_mastery_images/dove_shampoo.webp'),('a58c86a3-5508-4641-addd-c36bc46fc796','Maggi Tomato Sauce 700g','Thick Maggi tomato ketchup. Tangy sweetness. No artificial preservatives.','Condiments',245.00,210,51450.00,'2026-06-29 10:17:07.962000','2026-07-03 09:51:17.000000','https://storage.googleapis.com/cloud_mastery_images/maggi_sauce.jpg'),('a63f686b-1f11-4cb1-a025-b033a33eba07','Nescafe Original 200g','Nescafe Original instant coffee. Rich, smooth taste. 100% pure coffee.','Beverages',745.00,155,115475.00,'2026-06-29 10:17:07.962000','2026-07-06 07:05:22.000000','https://storage.googleapis.com/cloud_mastery_images/Nescafe-classic-200g-300x300.jpg'),('a8d8dfd8-fc36-4ddd-beb2-82c845116e38','Milo Tin 400g','Nestle Milo chocolate malt drink. Enriched with ACTIGEN-E and vitamins.','Beverages',595.00,175,104125.00,'2026-06-29 10:17:07.962000','2026-07-03 09:19:48.000000','https://storage.googleapis.com/cloud_mastery_images/Nestle-Milo-Active-400g.jpg'),('b27cf0d9-ca53-489b-974e-b2a695366f95','Lux Soap Bar 175g','Lux moisturising beauty bar with Jasmine extract. Long-lasting lather.','Personal Care',95.00,580,55100.00,'2026-06-29 10:17:07.962000','2026-07-03 09:52:28.000000','https://storage.googleapis.com/cloud_mastery_images/lux_soap.webp'),('b2833caa-96cc-484e-94a3-32ef13a16d54','Dettol Soap 100g','Dettol antibacterial soap. Protects against a broad spectrum of bacteria and viruses.','Personal Care',110.00,490,53900.00,'2026-06-29 10:17:07.962000','2026-07-03 09:58:37.000000','https://storage.googleapis.com/cloud_mastery_images/dettol_soap.jpg'),('ba2a1f48-d4e9-4062-ae88-e5b996c66cae','Pishori Rice 5kg','5kg family pack Mwea Pishori rice. Certified organic. Cook time 18 minutes.','Grains & Flour',940.00,95,89300.00,'2026-06-29 10:17:07.962000','2026-07-03 09:45:03.000000','https://storage.googleapis.com/cloud_mastery_images/pearl_rice_5kg.jpeg'),('bcb1b3e5-4471-408e-a785-096806866657','Omo Washing Powder 1kg','Concentrated laundry powder. Works in cold and warm water. Fresh scent.','Household Cleaning',295.00,195,57525.00,'2026-06-29 10:17:07.962000','2026-07-06 06:48:34.000000','https://storage.googleapis.com/cloud_mastery_images/omo_powder.webp'),('c161795f-b9d2-4138-ae5d-13543e44e26b','Supaloaf Brown Bread 400g','Wholemeal brown bread. Fortified with iron and B-vitamins. Good source of fibre.','Bread & Bakery',75.00,275,20625.00,'2026-06-29 10:17:07.962000','2026-07-03 10:03:40.000000','https://storage.googleapis.com/cloud_mastery_images/supaloaf_400.jpg'),('c6c4c491-9560-4467-84c6-2a24a84bb5e6','Java House Ground Coffee 250g','Medium-roast single-origin Kenyan AA coffee. Notes of blackcurrant and citrus.','Beverages',895.00,110,98450.00,'2026-06-29 10:17:07.962000','2026-07-03 09:47:21.000000','https://storage.googleapis.com/cloud_mastery_images/jawa_coffeee.webp'),('cf6f9b41-c7b7-456b-ab70-d50272c24547','Bakers Inn White Bread 400g','Soft sliced white bread. Best before 5 days. The everyday loaf for Kenyan families.','Bread & Bakery',65.00,390,25350.00,'2026-06-29 10:17:07.962000','2026-07-03 10:01:58.000000','https://storage.googleapis.com/cloud_mastery_images/bakersInnPremium-Soft-White.webp'),('d2524133-7425-4294-b155-68fcd9d0ff87','Harpic Toilet Cleaner 500ml','Harpic Power Plus. Kills germs under the rim. Pine fragrance.','Household Cleaning',235.00,185,43475.00,'2026-06-29 10:17:07.962000','2026-07-03 09:46:23.000000','https://storage.googleapis.com/cloud_mastery_images/harpic.jpg'),('d7711875-96d4-4ea3-ab03-0eb269cae3e5','Pembe Maize Flour 5kg','Economy pack Pembe maize flour for families. Best value per gram.','Grains & Flour',340.00,180,61200.00,'2026-06-29 10:17:07.962000','2026-07-03 09:32:38.000000','https://storage.googleapis.com/cloud_mastery_images/pembe_5kg.avif'),('dd30007c-28f2-4b9c-9bf0-6802d8e00726','Pembe Maize Flour 2kg','Finely milled white maize flour, ideal for ugali. Kenya\'s top-selling unga brand.','Grains & Flour',145.00,320,46400.00,'2026-06-29 10:17:07.962000','2026-07-03 09:31:50.000000','https://storage.googleapis.com/cloud_mastery_images/pembe_2kg.jpeg'),('e45f5eab-be5a-496e-895f-900bd7167edc','Tomatoes 1kg','Fresh Kenyan tomatoes from Kirinyaga and Meru farms. Mix of sizes.','Vegetables',90.00,300,27000.00,'2026-06-29 10:17:07.962000','2026-07-03 09:30:49.000000','https://storage.googleapis.com/cloud_mastery_images/tomotas_1kg.avif'),('ec22bba6-e6e3-4bdb-a53e-24eb45b3cd66','Mumias Sugar 2kg','Economy 2kg pack Mumias cane sugar. Best seller across all SokoAI zones.','Sugar & Sweeteners',295.00,230,67850.00,'2026-06-29 10:17:07.962000','2026-07-03 09:37:45.000000','https://storage.googleapis.com/cloud_mastery_images/mumias_2kg.jpg'),('ffe41277-db35-486e-a813-5ebcd72cd86f','Pishori Rice 1kg','Premium Mwea Pishori rice — long grain, aromatic, grown in Kirinyaga County.','Grains & Flour',195.00,210,40950.00,'2026-06-29 10:17:07.962000','2026-07-06 07:01:39.000000','https://storage.googleapis.com/cloud_mastery_images/basmati_rice.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_finance`
--

DROP TABLE IF EXISTS `table_finance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_finance` (
  `id` varchar(36) NOT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productType` varchar(100) DEFAULT NULL,
  `subType` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `description` text,
  `bestFor` varchar(255) DEFAULT NULL,
  `minInvestmentKes` decimal(15,2) DEFAULT NULL,
  `expectedReturnPct` decimal(10,6) DEFAULT NULL,
  `tenor` varchar(100) DEFAULT NULL,
  `liquidity` varchar(255) DEFAULT NULL,
  `riskLevel` varchar(50) DEFAULT NULL,
  `regulatedBy` varchar(100) DEFAULT NULL,
  `targetAgeMin` int DEFAULT NULL,
  `targetAgeMax` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_finance`
--

LOCK TABLES `table_finance` WRITE;
/*!40000 ALTER TABLE `table_finance` DISABLE KEYS */;
INSERT INTO `table_finance` VALUES ('00bb809f-5b0b-4694-8569-c4721163e66b','WLT-012','Safaricom PLC Shares','Stock / ETF','Blue Chip Equity','Safaricom PLC','Safaricom is East Africa\'s largest company by market cap. M-Pesa ecosystem drives double-digit earnings growth. Historically pays KES 0.60-0.76 dividend per share. Buy through a licensed stockbroker.','Growth investors, dividend seekers',1000.00,0.120000,'Open-ended','T+3 settlement','Medium-High','CMA Kenya',21,55,'2026-06-30 08:38:06','2026-06-30 08:38:06'),('05240343-2f51-48af-a9c7-d064cfa0739d','WLT-007','Old Mutual Enhanced Income','MMF','Enhanced Income','Old Mutual Investment Group','Old Mutual\'s Enhanced Income Fund invests in slightly longer-tenor government securities for a yield premium over standard MMFs. Weekly liquidity. Minimum KES 5,000.','Income-oriented investors',5000.00,0.114000,'Open-ended','Weekly (T+3)','Low-Medium','CMA Kenya',21,60,'2026-06-30 08:38:01','2026-06-30 08:38:01'),('05ff6976-af17-4e57-b3ee-aa3e032282bf','WLT-011','New Gold ETF (GLD)','Stock / ETF','Gold ETF','Absa CIB / JSE','New Gold ETF tracks the gold spot price in KES terms. One unit = 1/100th of a troy ounce of gold. Trades on NSE. Ideal for investors seeking a hedge against KES depreciation and inflation.','Inflation hedge, diversification seekers',5000.00,0.085000,'Open-ended','T+3 settlement','Medium-High','CMA Kenya / JSE',21,55,'2026-06-30 08:38:05','2026-06-30 08:38:05'),('1fbb86d7-7439-48ab-85ad-53389efee303','WLT-016','182-Day Treasury Bill','Government Security','T-Bill','Central Bank of Kenya','Kenya 182-day T-Bill. Better yield than 91-day for slightly longer lock-in. Same minimum. Zero credit risk. Ideal for money not needed for 6 months.','Medium short-term government savings',49680.00,0.152000,'182 days','End of tenor','Very Low','CBK',21,75,'2026-06-30 08:38:10','2026-06-30 08:38:10'),('211cd525-76b9-4c27-b422-1ee8243b73a5','WLT-003','Cytonn High Yield Fund','MMF','High-Yield','Cytonn Asset Management','Cytonn HYF invests in corporate bonds, real estate notes, and structured credit. Higher yield than T-Bill-backed MMFs, with commensurate credit risk. Minimum KES 10,000.','Investors seeking higher short-term returns',10000.00,0.138000,'Open-ended','Weekly (T+5)','Medium','CMA Kenya',25,55,'2026-06-30 08:37:58','2026-06-30 08:37:58'),('23832c3f-da9b-40d6-8d6e-f53bf216915e','WLT-019','Equity Bank Fixed Deposit','Fixed Deposit','Term Deposit','Equity Bank','Equity Bank 12-month fixed deposit. KDIC-insured up to KES 500,000. Interest paid at maturity. Good for capital that must be preserved with a guaranteed return.','Safety-first, short-term capital preservation',50000.00,0.095000,'12 months','End of tenor','Very Low','CBK',18,75,'2026-06-30 08:38:13','2026-06-30 08:38:13'),('3095e70f-04b1-46f4-b47f-4ded98ebec0d','WLT-010','Harambee Sacco Deposits','Sacco','FOSA Fixed Deposit','Harambee Co-op Sacco','Harambee FOSA fixed deposits earn 9-10% p.a. for 12-month tenors. Open to civil servants and the general public. Deposits are protected by DCS (Deposit Compensation Scheme).','Civil servants, NGO workers',10000.00,0.095000,'12 months','End of tenor','Low-Medium','SASRA',21,65,'2026-06-30 08:38:04','2026-06-30 08:38:04'),('49b5a19a-3c35-4c04-86ef-69fb752f77b9','WLT-006','ICEA Lion Money Market','MMF','Money Market','ICEA Lion Asset Management','ICEA Lion MMF combines safety and liquidity for professionals managing working capital or emergency savings. Portfolio: 60% government securities, 40% bank placements.','Professionals, SME working capital',1000.00,0.103000,'Open-ended','Daily (T+1)','Low','CMA Kenya',18,65,'2026-06-30 08:38:00','2026-06-30 08:38:00'),('5fffcdaa-e1d9-4817-bf99-c2d3be74321c','WLT-001','CIC Money Market Fund','MMF','Money Market','CIC Asset Management','CIC MMF is Kenya\'s most accessible money market fund. Earn daily interest on savings from KES 1,000. Backed by T-Bills, commercial paper, and bank deposits. Interest paid daily. Withdraw next business day.','First-time investors, emergency fund',1000.00,0.102000,'Open-ended','Daily (T+1)','Low','CMA Kenya',18,65,'2026-06-30 08:37:55','2026-06-30 08:37:55'),('91fc90be-723e-4d56-a793-151276f2758d','WLT-009','Mwalimu National Sacco Shares','Sacco','Share Capital','Mwalimu National Sacco','Mwalimu National Sacco — Kenya\'s largest Sacco by asset base. 13-15% annual dividends on share capital. Membership open to all TSC-registered teachers. FOSA accounts earn 4% p.a. on savings.','Teachers, TSC employees',10000.00,0.132000,'Annual','Annual dividends','Medium','SASRA',25,65,'2026-06-30 08:38:03','2026-06-30 08:38:03'),('96fd93f5-a58a-4141-ba38-b899f879db11','WLT-014','KCB Group Shares','Stock / ETF','Blue Chip Equity','KCB Group','KCB Group is Kenya\'s largest bank by assets. Strong regional footprint. DRC operations a growth catalyst. Dividend yield approximately 8-10%.','Banking sector, value investors',1000.00,0.115000,'Open-ended','T+3 settlement','Medium-High','CMA Kenya',21,55,'2026-06-30 08:38:08','2026-06-30 08:38:08'),('abc8958f-2eaa-451e-8fa4-02aa3fca3da7','WLT-002','Sanlam Money Market Fund','MMF','Money Market','Sanlam Investments Kenya','Sanlam MMF offers competitive daily yields backed by a diversified portfolio of government securities and bank deposits. Minimum KES 1,000. No lock-in period. Top-10 performing MMF in Kenya.','Conservative savers, short-term parking',1000.00,0.105000,'Open-ended','Daily (T+1)','Low','CMA Kenya',18,65,'2026-06-30 08:37:57','2026-06-30 08:37:57'),('af3e3d14-0c42-468e-9530-f92f074ebd45','WLT-017','364-Day Treasury Bill','Government Security','T-Bill','Central Bank of Kenya','Kenya 364-day T-Bill — highest yield in the T-Bill curve. 1-year lock-in. Minimum KES 50,000 face value. Competitive vs. bank FDs with zero credit risk.','Individuals seeking best short-term government yield',49680.00,0.156000,'364 days','End of tenor','Very Low','CBK',21,75,'2026-06-30 08:38:11','2026-06-30 08:38:11'),('aff0294e-1ac8-4592-80ec-1a6d56559d81','WLT-013','Equity Group Holdings Shares','Stock / ETF','Blue Chip Equity','Equity Group','Equity Bank — one of Africa\'s most profitable banks by ROE. Pan-African presence across 7 countries. Strong dividend track record: KES 4.00 per share (FY2024). Accessible via NSE.','Financial sector exposure, dividends',1000.00,0.140000,'Open-ended','T+3 settlement','Medium-High','CMA Kenya',21,55,'2026-06-30 08:38:07','2026-06-30 08:38:07'),('c33dff14-f9cd-4cb9-8c33-b18ccd3ea629','WLT-005','Britam Money Market Fund','MMF','Money Market','Britam Asset Management','Kenya\'s lowest MMF minimum at KES 500. Britam MMF is ideal for young earners starting their savings journey. Interest earned daily and reinvested automatically.','First-time investors, low-income savers',500.00,0.099000,'Open-ended','Daily (T+1)','Low','CMA Kenya',18,70,'2026-06-30 08:37:59','2026-06-30 08:37:59'),('cf3b5dd7-7eff-40ac-9314-e306dbc8d95f','WLT-004','Nabo Africa Money Market','MMF','Money Market','Nabo Capital','Nabo MMF is available in KES and USD. Ideal for diaspora remittances. Daily interest compounded. KES minimum 1,000 or USD 10 equivalent.','Diaspora investors, USD earners',1000.00,0.108000,'Open-ended','Daily (T+1)','Low','CMA Kenya',18,65,'2026-06-30 08:37:58','2026-06-30 08:37:58'),('df168eef-c603-4c23-a763-9a2a71e78053','WLT-018','Infrastructure Bond IFB1/2025/10','Government Security','Infrastructure Bond','National Treasury Kenya','Kenya Infrastructure Bond — interest income is TAX FREE. 10-year tenor. Semi-annual coupon payments. Funds earmarked for road, energy, and water infrastructure. Highly sought after by retail investors.','Long-term wealth builders, tax-efficient investors',50000.00,0.168000,'10 years','Semi-annual interest (TAX FREE)','Very Low','CBK',25,65,'2026-06-30 08:38:12','2026-06-30 08:38:12'),('e486402d-a298-43c1-a415-0ab4b25d1ac4','WLT-020','KCB Bank Fixed Deposit','Fixed Deposit','Term Deposit','KCB Bank','KCB 12-month FD. Negotiable rate for amounts above KES 1M. KDIC-insured. Can be used as collateral for an emergency loan at KCB.','Corporate and individual capital parking',50000.00,0.090000,'12 months','End of tenor','Very Low','CBK',18,75,'2026-06-30 08:38:14','2026-06-30 08:38:14'),('e983aba5-76e4-48ec-bbe4-c817ff9d6699','WLT-008','Stima Sacco Share Capital','Sacco','Share Capital','Stima Sacco Society','Stima Sacco\'s share capital consistently delivers 14-16% annual dividend. Open to Kenya Power employees and the public (through BOSA and FOSA accounts). Minimum 50 shares at KES 100 each.','KPLC, Power sector employees, public',5000.00,0.145000,'Annual','Annual dividends','Medium','SASRA',18,65,'2026-06-30 08:38:02','2026-06-30 08:38:02'),('f9db9a68-5fdc-4413-af07-63dc35a0276b','WLT-015','91-Day Treasury Bill','Government Security','T-Bill','Central Bank of Kenya','Kenya 91-day T-Bill. Sold at a discount. Minimum purchase one face value unit (KES 50,000 face). Historically 13-16% p.a. equivalent. No default risk. Buy through CBK DhowCSD portal or commercial bank.','Safety-first investors, idle cash deployment',49680.00,0.148000,'91 days','End of tenor','Very Low','CBK',21,75,'2026-06-30 08:38:09','2026-06-30 08:38:09');
/*!40000 ALTER TABLE `table_finance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_parts_catalog`
--

DROP TABLE IF EXISTS `table_parts_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_parts_catalog` (
  `id` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `yearFrom` int DEFAULT NULL,
  `yearTo` int DEFAULT NULL,
  `engineCc` int DEFAULT NULL,
  `batteryType` varchar(255) DEFAULT NULL,
  `voltage` int DEFAULT NULL,
  `capacityAh` int DEFAULT NULL,
  `cca` int DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `priceKes` float DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `branchLocation` varchar(255) DEFAULT NULL,
  `warrantyMonths` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_parts_catalog`
--

LOCK TABLES `table_parts_catalog` WRITE;
/*!40000 ALTER TABLE `table_parts_catalog` DISABLE KEYS */;
INSERT INTO `table_parts_catalog` VALUES ('d78a22c3-0252-431a-b81c-a561573e25fd','PRT-047','Suzuki','Swift',2010,2017,1200,'NS40ZL',12,36,340,'Chloride',8500,10,'CBD',18,'https://storage.googleapis.com/cloud_mastery_images/chloride_exide_battery.jpg','2026-06-30 08:35:21','2026-06-30 08:35:21'),('4e2f7ece-e63b-4e94-8a0c-bdf296bc9890','PRT-001','Toyota','Vitz',2010,2014,1000,'NS40ZL',12,36,340,'ExideGold',8500,12,'Westlands',18,'https://storage.googleapis.com/cloud_mastery_images/exide-gold-80r.jpg','2026-06-30 08:34:34','2026-06-30 08:34:34'),('a1795497-1850-45ac-bf77-d3d3a2f765fa','PRT-023','Nissan','Note',2012,2016,1200,'NS40ZL',12,36,340,'ExideGold',8500,11,'CBD',18,'https://storage.googleapis.com/cloud_mastery_images/exide-gold-80r.jpg','2026-06-30 08:34:58','2026-06-30 08:34:58'),('1f2248ef-eb86-41a6-ab74-68d8345da6da','PRT-015','Mazda','Demio',2008,2014,1300,'NS40ZL',12,36,340,'Chloride',8800,9,'CBD',18,'https://storage.googleapis.com/cloud_mastery_images/chloride_exide_battery.jpg','2026-06-30 08:34:50','2026-06-30 08:34:50'),('14f7f900-fcf8-43eb-a8a8-a7c9b274ab71','PRT-024','Nissan','Note',2017,2024,1200,'NS40ZL',12,36,340,'Chloride',8800,9,'Kilimani',18,'https://storage.googleapis.com/cloud_mastery_images/chloride_exide_battery.jpg','2026-06-30 08:34:59','2026-06-30 08:34:59'),('2cbeaf0a-de72-4c43-bc6c-ec7ee7245b56','PRT-016','Mazda','Demio',2015,2019,1300,'NS40ZL',12,36,340,'Amaron',9200,7,'Kilimani',18,'https://storage.googleapis.com/cloud_mastery_images/amaron_battery.png','2026-06-30 08:34:51','2026-06-30 08:34:51'),('707d2e1a-caf2-4eb9-a24f-96cab12fce66','PRT-048','Suzuki','Swift',2018,2024,1200,'NS40ZL',12,36,340,'Amaron',9200,7,'Langata',18,'https://storage.googleapis.com/cloud_mastery_images/amaron_battery.png','2026-06-30 08:35:22','2026-06-30 08:35:22'),('ee5d1a01-3607-46f3-8e87-55be19e646d2','PRT-002','Toyota','Vitz',2015,2019,1000,'NS40ZL',12,36,340,'Amaron',9200,8,'Karen',18,'https://storage.googleapis.com/cloud_mastery_images/amaron_battery.png','2026-06-30 08:34:36','2026-06-30 08:34:36'),('1e96c91e-7769-425b-95c8-238534632679','PRT-017','Mazda','Demio',2020,2024,1500,'NS40ZL',12,36,340,'Bosch',9800,5,'Karen',24,'https://storage.googleapis.com/cloud_mastery_images/bosch_battery.jpg','2026-06-30 08:34:52','2026-06-30 08:34:52'),('8ac72f91-2c9c-46da-9cb3-a105b9b6031e','PRT-003','Toyota','Vitz',2020,2024,1000,'NS40ZL',12,36,340,'Bosch',9800,6,'CBD',24,'https://storage.googleapis.com/cloud_mastery_images/bosch_battery.jpg','2026-06-30 08:34:37','2026-06-30 08:34:37'),('3a63330e-f74d-43ad-9730-c7477ea3124c','PRT-018','Mazda','Axela',2010,2016,1600,'NS60',12,45,430,'ExideGold',11000,8,'Westlands',18,'https://storage.googleapis.com/cloud_mastery_images/exide-gold-80r.jpg','2026-06-30 08:34:53','2026-06-30 08:34:53'),('e2c38a0b-9f33-4e12-a0d2-b4e2fed21282','PRT-042','Honda','Fit',2008,2014,1300,'NS60',12,45,430,'ExideGold',11000,7,'Westlands',18,'https://storage.googleapis.com/cloud_mastery_images/exide-gold-80r.jpg','2026-06-30 08:35:16','2026-06-30 08:35:16'),('adfc9a7a-6e17-451b-a999-96501968c9db','PRT-004','Toyota','Fielder',2004,2012,1500,'NS60',12,45,430,'ExideGold',11000,10,'Langata',18,'https://storage.googleapis.com/cloud_mastery_images/exide-gold-80r.jpg','2026-06-30 08:34:39','2026-06-30 08:34:39'),('76ae257d-e235-4325-b30b-8c27a0032f03','PRT-014','Toyota','Wish',2009,2018,1800,'NS60',12,45,430,'ExideGold',11500,6,'Langata',18,'https://storage.googleapis.com/cloud_mastery_images/exide-gold-80r.jpg','2026-06-30 08:34:49','2026-06-30 08:34:49'),('9468e7bf-fe90-485c-80b8-ddd5b89ea17d','PRT-028','Nissan','Tiida',2009,2016,1500,'NS60',12,45,430,'Amaron',11500,7,'Langata',18,'https://storage.googleapis.com/cloud_mastery_images/amaron_battery.png','2026-06-30 08:35:03','2026-06-30 08:35:03'),('9e03753c-1831-477e-b4ec-cefb29c9218f','PRT-043','Honda','Fit',2015,2020,1500,'NS60',12,45,430,'Chloride',11500,6,'CBD',18,'https://storage.googleapis.com/cloud_mastery_images/chloride_exide_battery.jpg','2026-06-30 08:35:17','2026-06-30 08:35:17'),('f497f668-0f22-492e-80f2-7c6b6d1ab9ba','PRT-029','Nissan','Sylphy',2013,2020,1600,'NS60',12,45,430,'ExideGold',12000,5,'Karen',18,'https://storage.googleapis.com/cloud_mastery_images/exide-gold-80r.jpg','2026-06-30 08:35:03','2026-06-30 08:35:03'),('5aa4de6e-4d7c-4da0-bc31-9fd539cbf0e2','PRT-049','Suzuki','Vitara',2015,2023,1600,'NS60',12,45,430,'ExideGold',12000,5,'Karen',18,'https://storage.googleapis.com/cloud_mastery_images/exide-gold-80r.jpg','2026-06-30 08:35:23','2026-06-30 08:35:23'),('0c9222ea-e32f-46f8-80f1-e20eebe9ef87','PRT-005','Toyota','Fielder',2013,2020,1500,'NS60',12,45,430,'Amaron',12500,7,'Westlands',18,'https://storage.googleapis.com/cloud_mastery_images/amaron_battery.png','2026-06-30 08:34:39','2026-06-30 08:34:39'),('dc020696-68b7-40d4-b570-e3acbff68c41','PRT-040','Mitsubishi','ASX',2011,2020,1800,'NS60',12,45,430,'Amaron',12500,5,'CBD',18,'https://storage.googleapis.com/cloud_mastery_images/amaron_battery.png','2026-06-30 08:35:14','2026-06-30 08:35:14'),('1f051b8b-014f-43e4-80b0-30d01f0df547','PRT-019','Mazda','Axela',2017,2023,2000,'NS60',12,45,430,'Bosch',13000,5,'CBD',24,'https://storage.googleapis.com/cloud_mastery_images/bosch_battery.jpg','2026-06-30 08:34:54','2026-06-30 08:34:54'),('d6b34866-519b-4192-92eb-fca33f670e2e','PRT-037','Mitsubishi','Outlander',2012,2016,2400,'S85D26R',12,55,490,'ExideGold',17000,4,'Kilimani',18,'https://storage.googleapis.com/cloud_mastery_images/exide-gold-80r.jpg','2026-06-30 08:35:11','2026-06-30 08:35:11'),('b4fdbb26-6ecd-4286-b728-0facc0cb8340','PRT-025','Nissan','X-Trail T31',2008,2014,2000,'S85D26R',12,55,490,'Bosch',17000,5,'Karen',24,'https://storage.googleapis.com/cloud_mastery_images/bosch_battery.jpg','2026-06-30 08:35:00','2026-06-30 08:35:00'),('f984defe-8d21-471f-a6d3-9f0d830e8d7c','PRT-006','Toyota','RAV4',2006,2012,2000,'S85D26R',12,55,490,'Bosch',17500,5,'Karen',24,'https://storage.googleapis.com/cloud_mastery_images/bosch_battery.jpg','2026-06-30 08:34:40','2026-06-30 08:34:40'),('2c2086b9-6ca4-4e46-a61c-8e693597f17d','PRT-036','Subaru','Legacy',2010,2018,2000,'S85D26L',12,55,490,'Amaron',17500,4,'CBD',24,'https://storage.googleapis.com/cloud_mastery_images/amaron_battery.png','2026-06-30 08:35:10','2026-06-30 08:35:10'),('c8cf4ac7-e7b9-4bda-8618-bc2e07e4be63','PRT-020','Mazda','CX-5',2013,2017,2000,'S85D26R',12,55,490,'GS Yuasa',18000,4,'Karen',24,'https://storage.googleapis.com/cloud_mastery_images/gsyuasa_battery.jpg','2026-06-30 08:34:55','2026-06-30 08:34:55'),('7e0aa394-dc07-45a4-96a8-0cbacc80e89b','PRT-046','Honda','Accord',2010,2018,2400,'S85D26R',12,55,490,'Varta',18000,4,'Westlands',24,'https://storage.googleapis.com/cloud_mastery_images/varta_battery.jpg','2026-06-30 08:35:20','2026-06-30 08:35:20'),('eaf648cb-03ec-4100-b152-46bb54ce005e','PRT-041','Mitsubishi','Eclipse Cross',2018,2024,1500,'S85D26R',12,55,490,'Bosch',18500,3,'Langata',24,'https://storage.googleapis.com/cloud_mastery_images/bosch_battery.jpg','2026-06-30 08:35:15','2026-06-30 08:35:15'),('d4188e2e-552a-49b1-a9f4-8bc77dc4097f','PRT-031','Subaru','Forester SH',2009,2013,2000,'S85D26L',12,55,490,'GS Yuasa',18500,4,'CBD',24,'https://storage.googleapis.com/cloud_mastery_images/gsyuasa_battery.jpg','2026-06-30 08:35:05','2026-06-30 08:35:05'),('28e4b09f-79df-4c79-bd6e-58c39763b77d','PRT-013','Toyota','Harrier',2014,2020,2000,'S95D26R',12,65,550,'Amaron',20000,4,'Westlands',18,'https://storage.googleapis.com/cloud_mastery_images/amaron_battery.png','2026-06-30 08:34:48','2026-06-30 08:34:48'),('3bc386d6-b1cd-40ae-b67a-bcad170d9d35','PRT-022','Mazda','Atenza',2012,2019,2000,'S95D26R',12,65,550,'Amaron',20500,4,'Westlands',18,'https://storage.googleapis.com/cloud_mastery_images/amaron_battery.png','2026-06-30 08:34:57','2026-06-30 08:34:57'),('8ddfca55-87a6-4056-b260-facd9b492292','PRT-044','Honda','CR-V',2012,2017,2000,'S95D26R',12,65,550,'Bosch',20500,4,'Karen',24,'https://storage.googleapis.com/cloud_mastery_images/bosch_battery.jpg','2026-06-30 08:35:18','2026-06-30 08:35:18'),('8cc7078e-9711-4135-8463-f22e9f98754e','PRT-032','Subaru','Forester SJ',2013,2018,2000,'S95D26L',12,65,550,'Bosch',21000,3,'Karen',24,'https://storage.googleapis.com/cloud_mastery_images/bosch_battery.jpg','2026-06-30 08:35:06','2026-06-30 08:35:06'),('f261e8c6-22cf-488e-b659-7442310e6ab2','PRT-007','Toyota','RAV4',2013,2018,2000,'S95D26R',12,65,550,'Bosch',21000,4,'CBD',24,'https://storage.googleapis.com/cloud_mastery_images/bosch_battery.jpg','2026-06-30 08:34:41','2026-06-30 08:34:41'),('a5f8f51b-9b6d-4ba6-9556-02836609678c','PRT-038','Mitsubishi','Outlander',2017,2023,2400,'S95D26R',12,65,550,'GS Yuasa',21500,3,'Westlands',24,'https://storage.googleapis.com/cloud_mastery_images/gsyuasa_battery.jpg','2026-06-30 08:35:12','2026-06-30 08:35:12'),('a356a2ae-b2d6-46d2-999d-09552681788b','PRT-026','Nissan','X-Trail T32',2014,2019,2000,'S95D26R',12,65,550,'GS Yuasa',21500,4,'Westlands',24,'https://storage.googleapis.com/cloud_mastery_images/gsyuasa_battery.jpg','2026-06-30 08:35:01','2026-06-30 08:35:01'),('c323fd19-a176-4019-884b-53f7dd3960dd','PRT-045','Honda','CR-V',2018,2023,2000,'S95D26R',12,65,550,'GS Yuasa',22000,3,'Kilimani',24,'https://storage.googleapis.com/cloud_mastery_images/gsyuasa_battery.jpg','2026-06-30 08:35:19','2026-06-30 08:35:19'),('5aa08471-598a-4648-bbd1-9a2d241877c9','PRT-021','Mazda','CX-5',2018,2023,2500,'S95D26R',12,65,550,'Bosch',22000,3,'Langata',24,'https://storage.googleapis.com/cloud_mastery_images/bosch_battery.jpg','2026-06-30 08:34:56','2026-06-30 08:34:56'),('6b718513-fa7b-4410-972b-d65f4f69eb43','PRT-008','Toyota','RAV4',2019,2024,2500,'S95D26R',12,65,550,'GS Yuasa',22500,3,'Kilimani',24,'https://storage.googleapis.com/cloud_mastery_images/gsyuasa_battery.jpg','2026-06-30 08:34:42','2026-06-30 08:34:42'),('8a1ba5b4-0e3d-4d72-a1c4-ee38c340bfd3','PRT-027','Nissan','X-Trail T32',2020,2024,2500,'S95D26R',12,65,550,'Varta',23000,3,'CBD',24,'https://storage.googleapis.com/cloud_mastery_images/varta_battery.jpg','2026-06-30 08:35:02','2026-06-30 08:35:02'),('076447eb-52b6-4dcc-8e48-4e461ac5acbc','PRT-033','Subaru','Forester SK',2018,2024,2500,'S95D26L',12,65,550,'Varta',23500,3,'Westlands',24,'https://storage.googleapis.com/cloud_mastery_images/varta_battery.jpg','2026-06-30 08:35:07','2026-06-30 08:35:07'),('0aacc4f4-c159-4bf8-8a07-009e8377b9f9','PRT-009','Toyota','Prado 150',2010,2017,2700,'N70',12,70,590,'ExideGold',23500,4,'Karen',18,'https://storage.googleapis.com/cloud_mastery_images/exide-gold-80r.jpg','2026-06-30 08:34:43','2026-06-30 08:34:43'),('278c4f82-222d-4688-b08b-14a6b631ce2b','PRT-039','Mitsubishi','Pajero',2005,2014,3200,'N70',12,70,590,'Bosch',24000,3,'Karen',24,'https://storage.googleapis.com/cloud_mastery_images/bosch_battery.jpg','2026-06-30 08:35:13','2026-06-30 08:35:13'),('4d23e820-2d64-440a-8e1e-a25de5557cda','PRT-030','Nissan','Navara',2015,2024,2500,'N70',12,70,590,'Bosch',25500,3,'Westlands',24,'https://storage.googleapis.com/cloud_mastery_images/bosch_battery.jpg','2026-06-30 08:35:04','2026-06-30 08:35:04'),('5bc6e564-8413-4e70-81f6-9034d1193b69','PRT-010','Toyota','Prado 150',2018,2024,2700,'N70',12,70,590,'Bosch',26000,3,'Westlands',24,'https://storage.googleapis.com/cloud_mastery_images/bosch_battery.jpg','2026-06-30 08:34:44','2026-06-30 08:34:44'),('93ef272f-bba3-4c4a-ba36-9057d27297fe','PRT-012','Toyota','Hilux Revo',2015,2024,2800,'N70',12,70,590,'Varta',27500,3,'CBD',24,'https://storage.googleapis.com/cloud_mastery_images/varta_battery.jpg','2026-06-30 08:34:47','2026-06-30 08:34:47'),('6ab43e98-185f-418c-9250-b4aa822dfc44','PRT-034','Subaru','Outback',2009,2014,2500,'S115D31L',12,80,640,'GS Yuasa',26000,2,'Langata',24,'https://storage.googleapis.com/cloud_mastery_images/gsyuasa_battery.jpg','2026-06-30 08:35:08','2026-06-30 08:35:08'),('5987394c-d007-49aa-bd32-0a6dd5b0b425','PRT-035','Subaru','Outback',2015,2023,2500,'S115D31L',12,80,640,'Bosch',28500,2,'Karen',24,'https://storage.googleapis.com/cloud_mastery_images/bosch_battery.jpg','2026-06-30 08:35:09','2026-06-30 08:35:09'),('7727773c-8d8a-4c17-bf10-9939cfff0ec2','PRT-011','Toyota','Land Cruiser V8',2010,2024,4500,'N100',12,100,760,'GS Yuasa',36000,2,'Karen',24,'https://storage.googleapis.com/cloud_mastery_images/gsyuasa_battery.jpg','2026-06-30 08:34:46','2026-06-30 08:34:46');
/*!40000 ALTER TABLE `table_parts_catalog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-15 18:32:51
