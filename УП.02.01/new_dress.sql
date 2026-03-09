CREATE DATABASE  IF NOT EXISTS `shop_dress` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shop_dress`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shop_dress
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
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id_cart` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `date_created_cart` datetime NOT NULL,
  `status_cart` enum('активная','оформлена') NOT NULL DEFAULT 'активная',
  PRIMARY KEY (`id_cart`),
  KEY `id_user_fk1_idx` (`id_user`),
  CONSTRAINT `id_user_fk1_idx` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,1,'2026-02-28 00:00:00','активная'),(2,2,'2026-02-27 20:27:02','оформлена'),(3,2,'2026-02-27 21:46:01','оформлена'),(4,2,'2026-02-27 21:47:22','оформлена'),(5,2,'2026-02-27 21:48:13','оформлена'),(6,2,'2026-02-27 21:52:47','оформлена'),(7,2,'2026-02-27 22:29:21','активная'),(8,3,'2026-02-27 22:35:50','оформлена');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts_items`
--

DROP TABLE IF EXISTS `carts_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts_items` (
  `id_carts_items` int NOT NULL AUTO_INCREMENT,
  `id_cart` int NOT NULL,
  `article_tovar` varchar(6) NOT NULL,
  `count_tovar_cart` int NOT NULL,
  PRIMARY KEY (`id_carts_items`),
  KEY `id_cart_fk1_idx` (`id_cart`),
  KEY `article_tovar_fk2_idx` (`article_tovar`),
  CONSTRAINT `article_tovar_fk2` FOREIGN KEY (`article_tovar`) REFERENCES `tovars` (`article_tovar`),
  CONSTRAINT `id_cart_fk1` FOREIGN KEY (`id_cart`) REFERENCES `carts` (`id_cart`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts_items`
--

LOCK TABLES `carts_items` WRITE;
/*!40000 ALTER TABLE `carts_items` DISABLE KEYS */;
INSERT INTO `carts_items` VALUES (1,1,'K714D2',3),(5,2,'G336K0',1),(6,2,'B893J5',4),(7,2,'B119S2',1),(8,2,'D643G8',3),(9,3,'D772I9',2),(10,4,'B119S2',1),(12,5,'C350U7',1),(17,6,'J587F3',1),(18,6,'H357E5',1),(19,6,'K714D2',2),(24,7,'B893J5',1),(25,7,'E559M7',2),(30,8,'A215B7',1),(31,8,'B119S2',2),(32,7,'D643G8',3);
/*!40000 ALTER TABLE `carts_items` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Платье макси'),(2,'Платье миди'),(3,'Платье мини');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufactures`
--

LOCK TABLES `manufactures` WRITE;
/*!40000 ALTER TABLE `manufactures` DISABLE KEYS */;
INSERT INTO `manufactures` VALUES (1,'Elena Verna'),(2,'Gracia'),(3,'Love Republic'),(4,'Reserved');
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
  `code_delivery_pickup_point` varchar(5) DEFAULT NULL,
  `status_pickup_point` enum('Завершен','Новый') NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `id_user_fk1_idx` (`id_user`),
  KEY `id_pickup_point_fk2_idx` (`id_pickup_point`),
  CONSTRAINT `id_pickup_point_fk2` FOREIGN KEY (`id_pickup_point`) REFERENCES `pickup_points` (`id_pickup_points`),
  CONSTRAINT `id_user_fk1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_users`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2025-02-27','2025-04-20',1,1,'2783','Завершен'),(2,'2022-09-28','2025-04-21',11,3,'3544','Завершен'),(3,'2025-03-21','2025-04-22',2,4,'1896','Завершен'),(4,'2025-02-20','2025-04-23',11,2,'8382','Завершен'),(5,'2025-03-17','2025-04-24',2,3,'1992','Завершен'),(6,'2025-03-01','2025-04-25',15,4,'8986','Завершен'),(7,'2025-03-30','2025-04-26',3,4,'4244','Завершен'),(8,'2025-03-31','2025-04-27',19,2,'7674','Новый'),(9,'2025-04-02','2025-04-28',5,1,'4565','Новый'),(10,'2025-04-03','2025-04-29',19,2,'7669','Завершен'),(11,'2026-02-28','2026-03-03',1,2,'2562','Завершен'),(12,'2026-02-28','2026-03-03',1,2,'5366','Новый'),(13,'2026-02-28','2026-03-03',1,2,'3576','Новый'),(14,'2026-02-28','2026-03-03',1,2,'8982','Новый'),(15,'2026-02-28','2026-03-03',1,2,'4648','Новый'),(16,'2026-02-28','2026-03-03',1,3,'2565','Новый');
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
INSERT INTO `pickup_points` VALUES (1,'450000','Уфа','Ленина','15'),(2,'450099','Уфа','Октябрьской Революции','25'),(3,'450077','Уфа','Коммунистическая','47'),(4,'450076','Уфа','пр-кт Октября','12'),(5,'450068','Уфа','Менделеева','38'),(6,'450055','Уфа','Рихарда Зорге','9'),(7,'450022','Уфа','Цюрупы','32'),(8,'450015','Уфа','Айская','7'),(9,'450008','Уфа','Карла Маркса','55'),(10,'450078','Уфа','Российская','21'),(11,'450071','Уфа','Блюхера','18'),(12,'450039','Уфа','Бакалинская','30'),(13,'450106','Уфа','Гафури','3'),(14,'450112','Уфа','Софьи Перовской','28'),(15,'450097','Уфа','Пушкина','96'),(16,'450074','Уфа','Зорге','14'),(17,'450092','Уфа','50 лет СССР','20'),(18,'450059','Уфа','Мингажева','5'),(19,'450041','Уфа','Заки Валиди','42'),(20,'450033','Уфа','Революционная','17'),(21,'450027','Уфа','Матросова','10'),(22,'450019','Уфа','Сельская Богородская','33'),(23,'450011','Уфа','Степана Кувыкина','6'),(24,'450005','Уфа','Бельская','2'),(25,'450001','Уфа','Трамвайная','24'),(26,'450044','Уфа','Авроры','13'),(27,'450052','Уфа','Юрия Гагарина','8'),(28,'450061','Уфа','Алтайская','19'),(29,'450066','Уфа','Братьев Кадомцевых','4'),(30,'450070','Уфа','Генерала Горбатова','11'),(31,'450081','Уфа','Димитрова','29'),(32,'450085','Уфа','Энтузиастов','37'),(33,'450089','Уфа','Жукова','22'),(34,'450091','Уфа','Зелёная','50'),(35,'450095','Уфа','Индустриальное шоссе','45'),(36,'450023','Уфа','Береговая','18');
/*!40000 ALTER TABLE `pickup_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structure_orders`
--

DROP TABLE IF EXISTS `structure_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structure_orders` (
  `id_structure_order` int NOT NULL AUTO_INCREMENT,
  `id_order` int NOT NULL,
  `id_article_tovar` varchar(6) NOT NULL,
  `count_tovar_structure_order` int NOT NULL,
  PRIMARY KEY (`id_structure_order`),
  KEY `id_tovar_fk1_idx` (`id_article_tovar`),
  KEY `id_order_fk2_idx` (`id_order`),
  CONSTRAINT `id_article_fk1` FOREIGN KEY (`id_article_tovar`) REFERENCES `tovars` (`article_tovar`),
  CONSTRAINT `id_order_fk2` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structure_orders`
--

LOCK TABLES `structure_orders` WRITE;
/*!40000 ALTER TABLE `structure_orders` DISABLE KEYS */;
INSERT INTO `structure_orders` VALUES (1,1,'B119S2',2),(2,2,'B893J5',1),(3,3,'C350U7',3),(4,4,'D643G8',5),(5,5,'D771X3',2),(6,6,'D772I9',1),(7,7,'D882B4',4),(8,8,'E559M7',1),(9,9,'F481H1',1),(10,10,'F739C2',5),(11,1,'F993V5',2),(12,2,'G224E6',1),(13,3,'G336K0',1),(14,4,'G675Q9',4),(15,5,'H357E5',2),(16,6,'H896D4',1),(17,7,'J587F3',2),(18,8,'J702R8',4),(19,9,'K467O3',1),(20,10,'K714D2',3),(21,11,'G336K0',1),(22,11,'B893J5',4),(23,11,'B119S2',1),(24,11,'D643G8',3),(25,12,'D772I9',2),(26,13,'B119S2',1),(27,14,'C350U7',1),(28,15,'J587F3',1),(29,15,'H357E5',1),(30,15,'K714D2',2),(31,16,'A215B7',1),(32,16,'B119S2',2);
/*!40000 ALTER TABLE `structure_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id_suppliers` int NOT NULL AUTO_INCREMENT,
  `title_suppliers` varchar(45) NOT NULL,
  PRIMARY KEY (`id_suppliers`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Belle Couture'),(2,'Elite Wear'),(3,'Fashion House');
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
  `price_tovar` decimal(10,2) NOT NULL,
  `id_manufacture` int NOT NULL,
  `id_supplier` int NOT NULL,
  `id_category` int NOT NULL,
  `current_discount_tovar` int NOT NULL,
  `count_tovar` int NOT NULL,
  `description_tovar` text,
  `image_tovar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`article_tovar`),
  KEY `id_manufacture_fk1_idx` (`id_manufacture`),
  KEY `id_suppliers_idx` (`id_supplier`),
  KEY `id_category_fk3_idx` (`id_category`),
  CONSTRAINT `id_category_fk3` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_categories`),
  CONSTRAINT `id_manufacture_fk1` FOREIGN KEY (`id_manufacture`) REFERENCES `manufactures` (`id_manufactures`),
  CONSTRAINT `id_suppliers_fk2` FOREIGN KEY (`id_supplier`) REFERENCES `suppliers` (`id_suppliers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tovars`
--

LOCK TABLES `tovars` WRITE;
/*!40000 ALTER TABLE `tovars` DISABLE KEYS */;
INSERT INTO `tovars` VALUES ('A215B7','Платье вечернее',15490.00,3,2,1,0,5,'Атласное вечернее платье макси с V-вырезом и разрезом. Для торжеств.','1.jpg'),('B119S2','Платье средней длины',10700.00,2,1,2,5,1,'Джинсовое платье миди с заклёпками. Современный casual.','18.jpg'),('B893J5','Платье повседневные',4300.00,1,3,1,10,2,'Длинное платье-свитер макси из кашемира. Уютный повседневный образ.','9.jpg'),('C350U7','Платье повседневные',4990.00,1,3,3,15,8,'Футболка-платье мини оверсайз с принтом. Максимальный комфорт.','20.jpg'),('D643G8','Платье летние',2999.00,3,2,3,7,3,'Сарафан в горошек мини с квадратным вырезом. Ретро стиль.','6.jpg'),('D771X3','Платье средней длины',15700.00,3,2,2,16,5,'Жаккардовое платье миди с воротником-стойкой. Деловой шик.','23.jpg'),('D772I9','Платье средней длины',2890.00,3,2,2,9,2,'Платье-рубашка миди свободного кроя с поясом. Небрежная элегантность.','8.jpg'),('D882B4','Платье вечернее',10400.00,4,1,2,5,12,'Платье-футляр миди с открытыми плечами. Сдержанность.','27.jpg'),('E559M7','Платье повседневные',2600.00,2,1,2,2,14,'Платье-трапеция миди с геометрическим принтом. Яркий акцент.','12.jpg'),('F481H1','Платье вечернее',7700.00,4,1,1,3,14,'Шифоновое платье макси с пайетками и асимметричным подолом. Мерцающий эффект.','7.jpg'),('F739C2','Платье летние',3244.00,1,3,2,4,13,'Хлопковое летнее платье миди с цветочным принтом и завязками. Лёгкое и удобное.','2.jpg'),('F993V5','Платье повседневные',7300.00,3,2,2,15,11,'Платье-комбинация миди из шёлка с кружевом. Изысканная простота.','21.jpg'),('G224E6','Платье вечернее',8900.00,4,1,1,2,8,'Бархатное вечернее платье макси с открытой спиной. Драматичный вечерний образ.','4.jpg'),('G336K0','Платье летние',3800.00,3,1,3,3,14,'Коктейльное платье мини с кружевными вставками. Романтичный наряд.','10.jpg'),('G675Q9','Платье вечернее',22500.00,3,2,3,12,9,'Платье мини с баской и стеклярусом. Голливудский гламур.','16.jpg'),('H357E5','Платье летние',6500.00,3,2,2,5,6,'Платье-халат миди из шёлка с восточным принтом. Богемный шик.','30.jpg'),('H896D4','Платье летние',5999.00,2,2,3,4,5,'Льняное платье мини с пуговицами и карманами. Повседневный шик.','3.jpg'),('J587F3','Платье средней длины',4800.00,1,3,2,2,15,'Приталенное платье-футляр миди из костюмной ткани. Для офиса и встреч.','5.jpg'),('J702R8','Платье вечернее',3500.00,1,3,1,20,9,'Атласное платье макси с запахом. Скрытая притягательность.','noimage.jpg'),('K467O3','Платье вечернее',11200.00,1,3,3,3,3,'Платье-бандо мини с пайетками и юбкой-туту. Смелый клубный образ.','14.jpg'),('K714D2','Платье вечернее',2600.00,4,1,1,20,0,'Платье макси из гипюра с корсетным лифом. Сказочный образ для бала.','29.jpg'),('L635Z1','Платье вечернее',5200.00,4,1,1,2,7,'Кружевное платье макси с длинными рукавами. Викторианская романтика.','25.jpg'),('M249A8','Платье летние',3280.00,3,2,3,18,3,'Платье-комбинация мини из сатина с разрезами. Ночной городской образ.','26.jpg'),('N526W4','Платье летние',4600.00,3,2,2,3,13,'Платье миди в полоску с рукавами-фонариками. Морской стиль.','22.jpg'),('O938P6','Платье средней длины',5400.00,3,2,2,4,18,'Плиссированное платье миди из жаккарда. Винтажный стиль.','15.jpg'),('P284T1','Платье летние',8800.00,1,3,3,15,15,'Льняное платье мини с вышивкой. Этно-мотивы для фестиваля.','19.jpg'),('S148L2','Платье вечернее',15000.00,2,1,1,20,6,'Шёлковое платье макси в греческом стиле с драпировкой. Королевский шик.','11.jpg'),('S408Y6','Платье вечернее',29999.00,4,1,3,8,15,'Платье-бюстье мини с пышной тюлевой юбкой. Для выпускного или свадьбы.','24.jpg'),('S821N4','Платье летние',6500.00,3,2,3,3,0,'Пляжное платье мини из шифона с завязкой на шее. Лёгкое как ветерок.','13.jpg'),('T593C9','Платье повседневные',3900.00,4,1,2,5,5,'Велюровое платье миди свободного кроя. Уютный осенний образ.','28.jpg');
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
  `surname_user` varchar(45) DEFAULT NULL,
  `name_user` varchar(45) NOT NULL,
  `lastname_user` varchar(45) DEFAULT NULL,
  `email_user` varchar(45) NOT NULL,
  `password_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id_users`),
  UNIQUE KEY `email_user_UNIQUE` (`email_user`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Авторизированный клиент','Михайлюк','Анна','Вячеславовна','5d4zbu@tutanota.com','rwVDh9'),(2,'Авторизированный клиент','Орлов','Матвей','Денисович','ptec8ym@yahoo.com','LdNyos'),(3,'Авторизированный клиент','Воронцова','Вероника','Ильинична','1qz4kw@mail.com','gynQMT'),(4,'Авторизированный клиент','Тимофеева','Мелания','Робертовна','4np6se@mail.com','AtnDjr'),(5,'Администратор','Новикова','Ксения','Борисовна','94d5ous@gmail.com','uzWC67'),(6,'Администратор','Егорова','Марина','Витальевна','uth4iz@mail.com','2L6KZG'),(7,'Администратор','Громов','Александр','Сергеевич','yzls62@outlook.com','JlFRCZ'),(8,'Менеджер','Соколов','Кирилл','Андреевич','1diph5e@tutanota.com','8ntwUp'),(9,'Менеджер','Трофимова','Ангелина','Семёновна','tjde7c@yahoo.com','YOyhfR'),(10,'Менеджер','Лебедева','Ульяна','Вадимовна','wpmrc3do@tutanota.com','RSbvHv');
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

-- Dump completed on 2026-03-03  8:59:37
