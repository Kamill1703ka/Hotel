CREATE DATABASE  IF NOT EXISTS `shop_shoes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shop_shoes`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shop_shoes
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id_categories` int NOT NULL AUTO_INCREMENT,
  `title_category` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categories`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Женская обувь'),(2,'Мужская обувь');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufactures`
--

DROP TABLE IF EXISTS `manufactures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufactures` (
  `id_manufactures` int NOT NULL AUTO_INCREMENT,
  `title_manufacture` varchar(60) NOT NULL,
  PRIMARY KEY (`id_manufactures`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufactures`
--

LOCK TABLES `manufactures` WRITE;
/*!40000 ALTER TABLE `manufactures` DISABLE KEYS */;
INSERT INTO `manufactures` VALUES (1,'Alessio Nesca'),(2,'CROSBY'),(3,'Kari'),(4,'Marco Tozzi'),(5,'Rieker'),(6,'Рос');
/*!40000 ALTER TABLE `manufactures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `date_order` date NOT NULL,
  `date_delivery` date NOT NULL,
  `id_pickup_point` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `code_delivery` varchar(10) DEFAULT NULL,
  `status_order` enum('Завершен','Новый') NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `id_pickup_points_fk1_idx` (`id_pickup_point`),
  KEY `id_user_idx` (`id_user`),
  CONSTRAINT `id_pickup_points_fk1` FOREIGN KEY (`id_pickup_point`) REFERENCES `pickup_points` (`id_pickup_points`),
  CONSTRAINT `id_user_fk2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2025-02-27','2025-04-20',1,10,'901','Завершен'),(2,'2026-02-06','2025-04-21',3,5,'902','Завершен'),(3,'2025-03-21','2025-04-22',2,7,'903','Завершен'),(5,'2025-03-17','2025-04-24',2,10,'905','Завершен'),(6,'2025-03-01','2025-04-25',15,5,'906','Завершен'),(7,'2025-03-30','2025-04-26',3,7,'907','Завершен'),(8,'2025-03-31','2025-04-27',19,6,'908','Новый'),(9,'2025-04-02','2025-04-28',5,10,'909','Новый'),(10,'2025-04-03','2025-04-29',19,10,'910','Новый'),(11,'2025-04-03','2025-04-29',19,10,'911','Новый'),(12,'2026-02-06','2026-02-08',1,7,'912','Новый'),(14,'2026-02-06','2026-02-06',4,10,'914','Новый'),(16,'2026-02-06','2026-02-21',11,8,'915','Новый'),(17,'2026-02-06','2026-02-15',27,5,'916','Новый'),(18,'2026-02-06','2026-02-12',21,7,'917','Новый'),(19,'2026-02-06','2026-02-08',18,7,'918','Новый'),(20,'2026-02-16','2026-02-19',4,6,NULL,'Новый');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pickup_points`
--

DROP TABLE IF EXISTS `pickup_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pickup_points` (
  `id_pickup_points` int NOT NULL AUTO_INCREMENT,
  `index_pickup_point` varchar(6) NOT NULL,
  `city_pickup_point` varchar(45) NOT NULL,
  `street_pickup_point` varchar(45) NOT NULL,
  `number_house_pickup_point` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pickup_points`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pickup_points`
--

LOCK TABLES `pickup_points` WRITE;
/*!40000 ALTER TABLE `pickup_points` DISABLE KEYS */;
INSERT INTO `pickup_points` VALUES (1,'420151','Лесной','Вишневая','32'),(2,'125061','Лесной','Подгорная','8'),(3,'630370','Лесной','Шоссейная','24'),(4,'400562','Лесной','Зеленая','32'),(5,'614510','Лесной','Маяковского','47'),(6,'410542','Лесной','Светлая','46'),(7,'620839','Лесной','Цветочная','8'),(8,'443890','Лесной','Коммунистическая','1'),(9,'603379','Лесной','Спортивная','46'),(10,'603721','Лесной','Гоголя','41'),(11,'410172','Лесной','Северная','13'),(12,'614611','Лесной','Молодежная','50'),(13,'454311','Лесной','Новая','19'),(14,'660007','Лесной','Октябрьская','19'),(15,'603036','Лесной','Садовая','4'),(16,'394060','Лесной','Фрунзе','43'),(17,'410661','Лесной','Школьная','50'),(18,'625590','Лесной','Коммунистическая','20'),(19,'625683','Лесной','8Марта','90'),(20,'450983','Лесной','Комсомольская','26'),(21,'394782','Лесной','Чехова','3'),(22,'603002','Лесной','Дзержинского','28'),(23,'450558','Лесной','Набережная','30'),(24,'344288','Лесной','Чехова','1'),(25,'614164','Лесной','Степная','30'),(26,'394242','Лесной','Коммунистическая','43'),(27,'660540','Лесной','Солнечная','25'),(28,'125837','Лесной','Шоссейная','40'),(29,'125703','Лесной','Партизанская','49'),(30,'625283','Лесной','Победы','46'),(31,'614753','Лесной','Полевая','35'),(32,'426030','Лесной','Маяковского','44'),(33,'450375','Лесной','Клубная','44'),(34,'625560','Лесной','Некрасова','12'),(35,'630201','Лесной','Комсомольская','17'),(36,'190949','Лесной','Мичурина','26');
/*!40000 ALTER TABLE `pickup_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structure_order`
--

DROP TABLE IF EXISTS `structure_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structure_order` (
  `id_structure_order` int NOT NULL AUTO_INCREMENT,
  `id_order` int NOT NULL,
  `id_tovar` varchar(6) NOT NULL,
  `count_tovar_structure_order` int NOT NULL,
  PRIMARY KEY (`id_structure_order`),
  KEY `id_order_fk1_idx` (`id_order`),
  KEY `id_tovar_fk2_idx` (`id_tovar`),
  CONSTRAINT `id_order_fk1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`),
  CONSTRAINT `id_tovar_fk2` FOREIGN KEY (`id_tovar`) REFERENCES `tovars` (`article_tovar`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structure_order`
--

LOCK TABLES `structure_order` WRITE;
/*!40000 ALTER TABLE `structure_order` DISABLE KEYS */;
INSERT INTO `structure_order` VALUES (1,1,'А112Т4',2),(2,2,'H782T5',1),(3,3,'J384T6',10),(5,5,'А112Т4',2),(6,6,'H782T5',1),(7,7,'J384T6',10),(9,9,'B320R5',5),(10,10,'S213E3',5),(11,1,'F635R4',2),(12,2,'G783F5',1),(13,3,'D572U8',10),(15,5,'F635R4',2),(16,6,'G783F5',1),(17,7,'D572U8',10),(19,9,'G432E4',1),(20,10,'E482R4',5);
/*!40000 ALTER TABLE `structure_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id_suppliers` int NOT NULL AUTO_INCREMENT,
  `title_supplier` varchar(45) NOT NULL,
  PRIMARY KEY (`id_suppliers`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Kari'),(2,'Обувь для вас');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tovars`
--

DROP TABLE IF EXISTS `tovars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tovars` (
  `article_tovar` varchar(6) NOT NULL,
  `title_tovar` varchar(100) NOT NULL,
  `units _tovar` varchar(45) NOT NULL,
  `price_tovar` decimal(8,2) NOT NULL,
  `id_supplier` int NOT NULL,
  `id_manufacture` int NOT NULL,
  `id_category` int NOT NULL,
  `current_dicsount_tovar` int NOT NULL,
  `count_tovar` int NOT NULL,
  `description_tovar` text,
  `image_tovar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`article_tovar`),
  KEY `id_categories_fk3_idx` (`id_category`),
  KEY `id_manufacture_fk2_idx` (`id_manufacture`),
  KEY `id_supplier_fk1_idx` (`id_supplier`),
  CONSTRAINT `id_categories_fk3` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_categories`),
  CONSTRAINT `id_manufacture_fk2` FOREIGN KEY (`id_manufacture`) REFERENCES `manufactures` (`id_manufactures`),
  CONSTRAINT `id_supplier_fk1` FOREIGN KEY (`id_supplier`) REFERENCES `suppliers` (`id_suppliers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tovars`
--

LOCK TABLES `tovars` WRITE;
/*!40000 ALTER TABLE `tovars` DISABLE KEYS */;
INSERT INTO `tovars` VALUES ('B320R5','Туфли','шт.',4300.00,1,5,1,0,6,'Туфли Rieker женские демисезонные, размер 41, цвет коричневый','9.jpg'),('B431R5','Ботинки','шт.',2700.00,2,5,2,2,5,'Мужские кожаные ботинки/мужские ботинки',''),('BJH34H','Кроссовки','шт.',5000.00,2,2,1,5,9,'Красивая, удобная обувь','product_639080101588284420.jpg'),('C436G5','Ботинки','шт.',10200.00,1,1,1,15,9,'Ботинки женские, ARGO, размер 40',''),('D268G5','Туфли','шт.',4399.00,2,5,1,3,12,'Туфли Rieker женские демисезонные, размер 36, цвет коричневый',''),('D329H3','Полуботинки','шт.',1890.00,2,1,1,4,4,'Полуботинки Alessio Nesca женские 3-30797-47, размер 37, цвет: бордовый','8.jpg'),('D364R4','Туфли','шт.',12400.00,1,3,1,16,5,'Туфли Luiza Belly женские Kate-lazo черные из натуральной замши',''),('D572U8','Кроссовки','шт.',4100.00,2,6,2,3,6,'129615-4 Кроссовки мужские','6.jpg'),('D772I9','yugugu','шт',1.00,2,3,1,100,0,'efwregve','product_639068401449812003.jpg'),('E482R4','Полуботинки','шт.',1800.00,1,3,1,2,14,'Полуботинки kari женские MYZ20S-149, размер 41, цвет: черный',''),('F427R5','Ботинки','шт.',11800.00,2,5,1,15,11,'Ботинки на молнии с декоративной пряжкой FRAU',''),('F572H7','Туфли','шт.',2700.00,1,4,1,2,14,'Туфли Marco Tozzi женские летние, размер 39, цвет черный','7.jpg'),('F635R4','Ботинки','шт.',3244.00,2,4,1,2,13,'Ботинки Marco Tozzi женские демисезонные, размер 39, цвет бежевый','2.jpg'),('FF7777','rjifgnheqqqqqqqqqqqq','шт.',600.00,2,2,2,10,7,'','product_639060159909156892.jpg'),('FY6G88','fgbvetfgbv','шт.',180000.80,2,2,2,99,0,'',''),('G432E4','Туфли','шт.',2800.00,1,3,1,3,15,'Туфли kari женские TR-YR-413017, размер 37, цвет: черный','10.jpg'),('G531F4','Ботинки','шт.',6600.00,1,3,1,12,9,'Ботинки женские зимние ROMER арт. 893167-01 Черный',''),('G783F5','Ботинки','шт.',5900.00,1,6,2,2,8,'Мужские ботинки Рос-Обувь кожаные с натуральным мехом','product_639068385929098261.jpg'),('G78FJ8','dgvbedfbe','шт.',4000.00,2,3,1,26,4,'аукаккккккккккккккккккккккккк',''),('H782T5','Туфли','шт.',4499.00,1,3,2,2,5,'Туфли kari мужские классика MYZ21AW-450A, размер 43, цвет: черный','product_639068388521130280.jpg'),('J384T6','Ботинки','шт.',3800.00,2,5,2,2,16,'B3430/14 Полуботинки мужские Rieker','5.jpg'),('J542F5','Тапочки','шт.',500.00,1,3,2,13,0,'Тапочки мужские Арт.70701-55-67син р.41',NULL),('K345R4','Полуботинки','шт.',2100.00,2,2,2,2,3,'407700/01-02 Полуботинки мужские CROSBY',''),('K358H6','Тапочки','шт.',599.00,1,5,2,20,2,'Тапочки мужские син р.41',''),('L754R4','Полуботинки','шт.',1700.00,1,3,1,2,7,'Полуботинки kari женские WB2020SS-26, размер 38, цвет: черный',''),('M542T5','Кроссовки','шт.',2800.00,2,5,2,18,3,'Кроссовки мужские TOFA',''),('N457T5','Полуботинки','шт.',4600.00,1,2,1,3,13,'Полуботинки Ботинки черные зимние, мех',''),('O754F4','Туфли','шт.',5400.00,2,5,1,4,18,'Туфли женские демисезонные Rieker артикул 55073-68/37',''),('P764G4','Туфли','шт.',6800.00,1,2,1,15,15,'Туфли женские, ARGO, размер 38',''),('S213E3','Полуботинки','шт.',2156.00,2,2,2,3,6,'407700/01-01 Полуботинки мужские CROSBY',''),('S326R5','Тапочки','шт.',9900.00,2,2,2,17,15,'Мужские кожаные тапочки \"Профиль С.Дали\" ',''),('S634B5','Кеды','шт.',5500.00,2,2,2,3,0,'Кеды Caprice мужские демисезонные, размер 42, цвет черный',''),('T324F5','Сапоги','шт.',4699.00,1,2,1,2,5,'Сапоги замша Цвет: синий',''),('UF67FD','Кроссовки','шт.',5000.00,2,2,1,5,9,'Красивая, удобная обувь','product_639080101588284420.jpg'),('А112Т4','Ботинки','шт.',4990.00,1,3,1,3,6,'Женские Ботинки демисезонные kari','1.jpg');
/*!40000 ALTER TABLE `tovars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_users` int NOT NULL AUTO_INCREMENT,
  `role_user` enum('Авторизированный клиент','Администратор','Менеджер') NOT NULL,
  `surname_user` varchar(60) NOT NULL,
  `name_user` varchar(60) NOT NULL,
  `lastname_user` varchar(60) NOT NULL,
  `login_user` varchar(45) NOT NULL,
  `password_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id_users`),
  UNIQUE KEY `login_user_UNIQUE` (`login_user`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Авторизированный клиент','Ворсин','Петр','Евгеньевич','1qz4kw@mail.com','gynQMT'),(2,'Авторизированный клиент','Михайлюк','Анна','Вячеславовна','5d4zbu@tutanota.com','rwVDh9'),(3,'Авторизированный клиент','Ситдикова','Елена','Анатольевна','ptec8ym@yahoo.com','LdNyos'),(4,'Авторизированный клиент','Старикова','Елена','Павловна','4np6se@mail.com','AtnDjr'),(5,'Администратор','Никифорова','Весения','Николаевна','94d5ous@gmail.com','uzWC67'),(6,'Администратор','Одинцов','Серафим','Артёмович','yzls62@outlook.com','JlFRCZ'),(7,'Администратор','Сазонов','Руслан','Германович','uth4iz@mail.com','2L6KZG'),(8,'Менеджер','Ворсин','Петр','Евгеньевич','tjde7c@yahoo.com','YOyhfR'),(9,'Менеджер','Старикова','Елена','Павловна','wpmrc3do@tutanota.com','RSbvHv'),(10,'Менеджер','Степанов','Михаил','Артёмович','1diph5e@tutanota.com','8ntwUp');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-03  9:00:41
