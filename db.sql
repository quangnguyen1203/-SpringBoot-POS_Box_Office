-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: box-office
-- ------------------------------------------------------
-- Server version	8.0.24

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
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Đồ ăn'),(2,'Đồ uống');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_products`
--

DROP TABLE IF EXISTS `categories_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_products` (
  `category_category_id` bigint NOT NULL,
  `products_product_id` bigint NOT NULL,
  UNIQUE KEY `UK_g1g4fl8pt4xsutvejxvt02sqp` (`products_product_id`),
  KEY `FK6aweqa9namwcbfpy2nc123g7x` (`category_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_products`
--

LOCK TABLES `categories_products` WRITE;
/*!40000 ALTER TABLE `categories_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `class_id` bigint NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) DEFAULT NULL,
  `percent_discount` int DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'STAR',10),(2,'GOLD',15),(3,'DIAMOND',20);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `date_revenue`
--

DROP TABLE IF EXISTS `date_revenue`;
/*!50001 DROP VIEW IF EXISTS `date_revenue`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `date_revenue` AS SELECT 
 1 AS `date`,
 1 AS `sum_product`,
 1 AS `sum_ticket`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films` (
  `film_id` bigint NOT NULL AUTO_INCREMENT,
  `admit` bigint DEFAULT '0',
  `description` longtext,
  `duration` varchar(255) DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `film_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT '0',
  `rel_date` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`film_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,9,'Một trong những lí do khiến Black Widow được đông đảo khán giả mong chờ chính là vì đây là bộ phim đầu tiên mở màn cho giai đoạn thứ 4 của Vũ trụ điện ảnh Marvel (MCU). Được lấy bối cảnh ngay sau sự kiện Captain America: Civil War, trong bộ phim lần này nữ điệp viên phải đối diện với những câu hỏi đầy bí ẩn trong nguồn gốc của mình. Những câu hỏi sẽ dẫn Natasha quay trở lại Budapest, nơi cô được luyện tập để trở thành siêu điệp viên của Nga. Tuy nhiên đơn thân độc mã chống lại cả một tổ chức là điều bất khả thi. Đấy là lúc Natasha phải tìm đến những đồng minh trong quá khứ. Cô tìm về với những Black Widow khác, những người đã từng là gia đình của cô.\nCâu chuyện càng trở nên bí ẩn hơn khi mối quan hệ giữa Natasha và Yelena không chỉ đơn thuần là đồng đội, họ là những người chị em thân thiết trong quá khứ. Tuy nhiên nhiệm vụ của họ bị ngăn cản bởi một tên lính đánh thuê nguy hiểm với cái tên Taskmaster. Black Widow được dự kiến phát hành vào ngày 09/07/2021.','2:33:00','2021-08-29','Black Widow','blackwidow.jpg',0,'2021-08-17',0),(2,0,'Nằm trong danh sách phim chiếu rạp 2021, Godzilla vs. Kong có lẽ sẽ là bộ phim bom tấn được mong đợi nhất trong vũ trụ điện ảnh của các quái vật trên thế giới. Godzilla và King Kong, những quái vật nổi tiếng nhất trên màn ảnh sẽ được tái hiện chung trong một bộ phim riêng.\n','02:00:00','2021-08-22','Godzilla vs. Kong','godzilla.jpg',0,'2021-08-17',0),(3,0,'Tựa game đình đám với thế hệ 8x Mortal Kombat, hay còn được biết đến với tên gọi Rồng Đen, đang rục rịch trở lại màn ảnh vào tháng 4 này. Theo lịch quốc tế phim dự kiến sẽ phát hành ngày 23/4/2021, tuy nhiên khán giả Việt Nam sẽ được xem trước 2 tuần so với fan quốc tế (phim chính thức phát hành tại Việt Nam ngày 9/4/2021).','2:21:30','2021-08-27','Mortal Kombat: Cuộc chiến sinh tử','mortalcombat.jpg',0,'2021-08-20',0),(4,3,'Sau khi thoát chết ở cuối phần 8, nhân vật phản diện chính của phim – hacker Cipher (Charlize Theron) sẽ quay trở lại với nhiều chiêu trò nguy hiểm, nhằm hạ gục Dominic và gia đình anh.\n\nPhần phim này sẽ vắng bóng “The Rock” Dwayne Johnson và Jason Statham. Nhưng Fast & Furious 9 đã mời được một gương mặt vàng thay thế – huyền thoại đô vật John Cena. Thông tin về vai diễn của anh vẫn đang nằm trong vòng bí mật. Đạo diễn Justin Lin, cùng biên kịch quen thuộc Chris Morgan hứa hẹn sẽ viết nên chương mới đầy hào hùng cho đại gia đình Fast & Furious. Phim được dời lịch chiếu đến ngày 28/05/2021.','2:30:32','2021-08-31','Fast and Furious 9','fastandfurios.jpg',0,'2021-08-24',1),(5,12,'Hai phần phim trước G.I. Joe: The Rise of Cobra (2009) và G.I. Joe: Retaliation (2013) gây ấn tượng mạnh nhờ những pha hành động đẹp mắt và công nghệ vũ khí hiện đại. Thì danh sách phim hay 2021 không thể bỏ qua G.I.Joe 3 với nội dung chi tiết của Snake Eyes vẫn đang được giữ kín nhưng qua những teaser gần đây, người hâm mộ cho rằng phim sẽ đào sâu vào quá khứ nhân vật Snakes Eyes, một thành viên cốt cán của tổ chức G.I.Joe.\n\nSiêu phẩm phần 3 tiếp tục tái xuất sau 7 năm vắng bóng trên màn ảnh rộng\n\nNam diễn viên điển trai Henry Golding được mời nhận vai Snake Eyes. Bên cạnh đó các thành viên chủ chốt khác của tổ chức G.I.Joe sẽ được đảm nhiệm bởi Andre Koji (Storm Shadow), Iko Uwais (Hard Master), Úrsula Corberó (Baroness) và Samara Weaving (Scarlett). Phim phát hành chính thức vào 23/07/2021.','2:10:45','2021-09-03','Snake Eyes: G.I.Joe Origins','snakeeyes.jpg',0,'2021-08-18',1);
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `member_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `class_id` bigint DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `FKkvqxwxftmbnko9aah81rjp7t6` (`class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'chuong@gmail.com','Phan Gia Thành Chương','0904050607',1),(2,'quang@gmail.com','Nguyễn Lê Nhật Quang','0905910001',1),(3,'long@gmail.com','Hoàng Long','0987654321',1);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `monthly_revenue`
--

DROP TABLE IF EXISTS `monthly_revenue`;
/*!50001 DROP VIEW IF EXISTS `monthly_revenue`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `monthly_revenue` AS SELECT 
 1 AS `month`,
 1 AS `sum_product`,
 1 AS `sum_ticket`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_detail_id` bigint NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `product_amount` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,15000,'1','7 Up ',1),(2,15000,'1','Bắp ngọt',1),(3,15000,'1','7 Up ',18),(4,15000,'1','Bắp ngọt',18),(5,15000,'1','7 Up ',19),(6,15000,'1','Bắp ngọt',19);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `order_date` date DEFAULT NULL,
  `order_time` time DEFAULT NULL,
  `total_price` double NOT NULL,
  `total_product` double NOT NULL,
  `total_ticket` double NOT NULL,
  `member_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK2vq7lo4gkknrmghj3rqpqqg6s` (`member_id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2021-08-17','10:13:32',130000,30000,100000,NULL,3),(3,'2021-08-17','10:33:52',250000,0,250000,NULL,3),(4,'2021-08-17','10:35:54',150000,0,150000,NULL,3),(5,'2021-08-17','11:33:50',100000,0,100000,NULL,3),(6,'2021-08-17','17:16:17',530000,0,530000,NULL,3),(18,'2021-08-18','10:08:50',127000,27000,100000,2,3),(19,'2021-08-30','08:35:55',130000,30000,100000,NULL,3);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` bigint NOT NULL AUTO_INCREMENT,
  `amount` bigint DEFAULT NULL,
  `description` longtext,
  `is_delete` tinyint(1) DEFAULT '0',
  `price` double NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,NULL,'Màu đỏ của Coca Cola truyền thống, màu trắng của Diet Coke, màu xanh Sprite, màu cam Fanta…. Bảng màu nhận diện là những tông màu cơ bản nhưng quen thuộc và nổi bật nên khách hàng dễ dàng nhận ra các sản phẩm của Coca Cola',0,15000,'Coca Cola',2),(2,NULL,'Sản phẩm khá chất lượng',0,15000,'Bắp ngọt',1),(3,NULL,'Nước uống Isotonic 7 Up Revive chai 500ml là sự kết hợp các vitamin cần thiết (B3, B6, B12), khoáng chất, chất điện giải (Natri, Kali) cùng lượng gas vừa đủ giúp bù nước và muối khoáng để đánh tan cơn khát trong bạn. Nước uống bù nước I-hydro, mang lại cảm giác sảng khoái.',0,15000,'7 Up ',2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMIN','ROLE_ADMIN'),(2,'PROJECTION','ROLE_PROJECTION'),(3,'STAFF','ROLE_STAFF');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_users` (
  `role_id` bigint NOT NULL,
  `users_id` bigint NOT NULL,
  UNIQUE KEY `UK_snx09g5kxfrdi207cl1jhjmev` (`users_id`),
  KEY `FKsmos02hm32191ogexm2ljik9x` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `room_id` bigint NOT NULL AUTO_INCREMENT,
  `is_full` tinyint(1) DEFAULT '0',
  `room_name` varchar(255) DEFAULT NULL,
  `show_id` bigint DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `FK7gyqgo49yt87nf4i2g1a6wb0j` (`show_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,0,'R1',1),(2,0,'R1',2),(3,0,'R2',NULL),(4,0,'R2',NULL),(5,0,'R1',NULL),(6,0,'R1',NULL),(7,0,'R1',NULL),(8,0,'R1',NULL),(9,0,'R2',NULL),(10,0,'R1',NULL),(11,0,'R1',NULL),(12,0,'R1',NULL);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedules` (
  `schedule_id` bigint NOT NULL AUTO_INCREMENT,
  `schedule_date` date DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  UNIQUE KEY `UK_9dqmu18gjrkipg014a7blo26p` (`schedule_date`),
  KEY `FKd4y4xekwahv9boo6lc8gfl3jv` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (1,'2021-08-17',2),(2,'2021-08-25',2),(3,'2021-08-26',2),(4,'2021-08-21',2),(5,'2021-08-18',2),(6,'2021-08-19',2),(7,'2021-08-20',2),(8,'2021-08-27',2),(9,'2021-08-30',2),(10,'2021-08-31',2);
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat_status`
--

DROP TABLE IF EXISTS `seat_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_status`
--

LOCK TABLES `seat_status` WRITE;
/*!40000 ALTER TABLE `seat_status` DISABLE KEYS */;
INSERT INTO `seat_status` VALUES (1,'EMPTY'),(2,'CHOOSING'),(3,'TAKEN');
/*!40000 ALTER TABLE `seat_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `seat_id` bigint NOT NULL AUTO_INCREMENT,
  `seat_name` varchar(255) DEFAULT NULL,
  `room_id` bigint DEFAULT NULL,
  `status_id` bigint DEFAULT NULL,
  `type_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT '1',
  PRIMARY KEY (`seat_id`),
  KEY `FKg993pi7ucgy616icmddq8u335` (`room_id`),
  KEY `FK8rog8cau367sg80jp91qea5ak` (`status_id`),
  KEY `FK66k4sy9mowhtw9rgdkpcwcpq0` (`type_id`),
  KEY `FK6k1o4fm1a3ipwguktr45y5wi4` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES (1,'A1',1,1,1,1),(2,'A2',1,1,1,1),(3,'A3',1,1,1,1),(4,'A4',1,1,1,1),(5,'A5',1,1,1,1),(6,'A6',1,1,1,1),(7,'A7',1,1,1,1),(8,'A8',1,1,1,1),(9,'A9',1,1,1,1),(10,'A10',1,1,1,1),(11,'B1',1,1,1,1),(12,'B2',1,1,1,1),(13,'B3',1,1,1,1),(14,'B4',1,1,1,1),(15,'B5',1,1,1,1),(16,'B6',1,1,1,1),(17,'B7',1,1,1,1),(18,'B8',1,1,1,1),(19,'B9',1,1,1,1),(20,'B10',1,1,1,1),(21,'C1',1,1,1,1),(22,'C2',1,1,1,1),(23,'C3',1,1,1,1),(24,'C4',1,1,1,1),(25,'C5',1,1,1,1),(26,'C6',1,1,1,1),(27,'C7',1,1,1,1),(28,'C8',1,1,1,1),(29,'C9',1,1,1,1),(30,'C10',1,1,1,1),(31,'D1',1,1,1,1),(32,'D2',1,1,1,1),(33,'D3',1,1,1,1),(34,'D4',1,1,1,1),(35,'D5',1,1,1,1),(36,'D6',1,1,1,1),(37,'D7',1,1,1,1),(38,'D8',1,1,1,1),(39,'D9',1,1,1,1),(40,'D10',1,1,1,1),(41,'E1',1,1,1,1),(42,'E2',1,1,1,1),(43,'E3',1,1,1,1),(44,'E4',1,1,1,1),(45,'E5',1,1,1,1),(46,'E6',1,1,1,1),(47,'E7',1,1,1,1),(48,'E8',1,1,1,1),(49,'E9',1,1,1,1),(50,'E10',1,1,1,1),(51,'F1',1,1,1,1),(52,'F2',1,1,1,1),(53,'F3',1,1,1,1),(54,'F4',1,1,2,1),(55,'F5',1,1,2,1),(56,'F6',1,1,2,1),(57,'F7',1,1,2,1),(58,'F8',1,1,2,1),(59,'F9',1,1,1,1),(60,'F10',1,1,1,1),(61,'G1',1,1,1,1),(62,'G2',1,1,1,1),(63,'G3',1,1,2,1),(64,'G4',1,1,2,1),(65,'G5',1,1,2,1),(66,'G6',1,1,2,1),(67,'G7',1,1,2,1),(68,'G8',1,1,2,1),(69,'G9',1,1,1,1),(70,'G10',1,1,1,1),(71,'H1',1,1,1,1),(72,'H2',1,1,1,1),(73,'H3',1,1,2,1),(74,'H4',1,1,2,1),(75,'H5',1,1,2,1),(76,'H6',1,1,2,1),(77,'H7',1,1,2,1),(78,'H8',1,1,2,1),(79,'H9',1,1,1,1),(80,'H10',1,1,1,1),(81,'I1',1,1,1,1),(82,'I2',1,1,1,1),(83,'I3',1,1,2,1),(84,'I4',1,1,2,1),(85,'I5',1,1,2,1),(86,'I6',1,1,2,1),(87,'I7',1,1,2,1),(88,'I8',1,1,2,1),(89,'I9',1,1,1,1),(90,'I10',1,1,1,1),(91,'J1',1,1,1,1),(92,'J2',1,1,1,1),(93,'J3',1,1,1,1),(94,'J4',1,1,1,1),(95,'J5',1,1,1,1),(96,'J6',1,1,1,1),(97,'J7',1,1,1,1),(98,'J8',1,1,1,1),(99,'J9',1,1,1,1),(100,'J10',1,1,1,1),(101,'A1',2,3,1,3),(102,'A2',2,3,1,3),(103,'A3',2,3,1,3),(104,'A4',2,3,1,3),(105,'A5',2,3,1,3),(106,'A6',2,3,1,3),(107,'A7',2,3,1,3),(108,'A8',2,3,1,3),(109,'A9',2,3,1,3),(110,'A10',2,1,1,1),(111,'B1',2,1,1,1),(112,'B2',2,1,1,1),(113,'B3',2,1,1,1),(114,'B4',2,1,1,1),(115,'B5',2,1,1,1),(116,'B6',2,1,1,1),(117,'B7',2,1,1,1),(118,'B8',2,1,1,1),(119,'B9',2,1,1,1),(120,'B10',2,1,1,1),(121,'C1',2,1,1,1),(122,'C2',2,1,1,1),(123,'C3',2,1,1,1),(124,'C4',2,1,1,1),(125,'C5',2,1,1,1),(126,'C6',2,1,1,1),(127,'C7',2,1,1,1),(128,'C8',2,1,1,1),(129,'C9',2,1,1,1),(130,'C10',2,1,1,1),(131,'D1',2,1,1,1),(132,'D2',2,1,1,1),(133,'D3',2,1,1,1),(134,'D4',2,1,1,1),(135,'D5',2,1,1,1),(136,'D6',2,1,1,1),(137,'D7',2,1,1,1),(138,'D8',2,1,1,1),(139,'D9',2,1,1,1),(140,'D10',2,1,1,1),(141,'E1',2,1,1,1),(142,'E2',2,1,1,1),(143,'E3',2,1,1,1),(144,'E4',2,1,1,1),(145,'E5',2,1,1,1),(146,'E6',2,1,1,1),(147,'E7',2,1,1,1),(148,'E8',2,1,1,1),(149,'E9',2,1,1,1),(150,'E10',2,1,1,1),(151,'F1',2,1,1,1),(152,'F2',2,1,1,1),(153,'F3',2,1,1,1),(154,'F4',2,1,2,1),(155,'F5',2,1,2,1),(156,'F6',2,1,2,1),(157,'F7',2,1,2,1),(158,'F8',2,1,2,1),(159,'F9',2,1,1,1),(160,'F10',2,1,1,1),(161,'G1',2,1,1,1),(162,'G2',2,1,1,1),(163,'G3',2,1,2,1),(164,'G4',2,1,2,1),(165,'G5',2,1,2,1),(166,'G6',2,1,2,1),(167,'G7',2,1,2,1),(168,'G8',2,1,2,1),(169,'G9',2,1,1,1),(170,'G10',2,1,1,1),(171,'H1',2,1,1,1),(172,'H2',2,1,1,1),(173,'H3',2,1,2,1),(174,'H4',2,1,2,1),(175,'H5',2,1,2,1),(176,'H6',2,1,2,1),(177,'H7',2,1,2,1),(178,'H8',2,1,2,1),(179,'H9',2,1,1,1),(180,'H10',2,1,1,1),(181,'I1',2,1,1,1),(182,'I2',2,1,1,1),(183,'I3',2,1,2,1),(184,'I4',2,1,2,1),(185,'I5',2,1,2,1),(186,'I6',2,1,2,1),(187,'I7',2,1,2,1),(188,'I8',2,1,2,1),(189,'I9',2,1,1,1),(190,'I10',2,1,1,1),(191,'J1',2,1,1,1),(192,'J2',2,1,1,1),(193,'J3',2,1,1,1),(194,'J4',2,1,1,1),(195,'J5',2,1,1,1),(196,'J6',2,1,1,1),(197,'J7',2,1,1,1),(198,'J8',2,1,1,1),(199,'J9',2,1,1,1),(200,'J10',2,1,1,1),(201,'A1',3,1,1,1),(202,'A2',3,1,1,1),(203,'A3',3,1,1,1),(204,'A4',3,1,1,1),(205,'A5',3,1,1,1),(206,'A6',3,1,1,1),(207,'A7',3,1,1,1),(208,'A8',3,1,1,1),(209,'A9',3,1,1,1),(210,'A10',3,1,1,1),(211,'B1',3,1,1,1),(212,'B2',3,1,1,1),(213,'B3',3,1,1,1),(214,'B4',3,1,1,1),(215,'B5',3,1,1,1),(216,'B6',3,1,1,1),(217,'B7',3,1,1,1),(218,'B8',3,1,1,1),(219,'B9',3,1,1,1),(220,'B10',3,1,1,1),(221,'C1',3,1,1,1),(222,'C2',3,1,1,1),(223,'C3',3,1,1,1),(224,'C4',3,1,1,1),(225,'C5',3,1,1,1),(226,'C6',3,1,1,1),(227,'C7',3,1,1,1),(228,'C8',3,1,1,1),(229,'C9',3,1,1,1),(230,'C10',3,1,1,1),(231,'D1',3,1,1,1),(232,'D2',3,1,1,1),(233,'D3',3,1,1,1),(234,'D4',3,1,1,1),(235,'D5',3,1,1,1),(236,'D6',3,1,1,1),(237,'D7',3,1,1,1),(238,'D8',3,1,1,1),(239,'D9',3,1,1,1),(240,'D10',3,1,1,1),(241,'E1',3,1,1,1),(242,'E2',3,1,1,1),(243,'E3',3,1,1,1),(244,'E4',3,1,1,1),(245,'E5',3,1,1,1),(246,'E6',3,1,1,1),(247,'E7',3,1,1,1),(248,'E8',3,1,1,1),(249,'E9',3,1,1,1),(250,'E10',3,1,1,1),(251,'F1',3,1,1,1),(252,'F2',3,1,1,1),(253,'F3',3,1,1,1),(254,'F4',3,1,2,1),(255,'F5',3,1,2,1),(256,'F6',3,1,2,1),(257,'F7',3,1,2,1),(258,'F8',3,1,2,1),(259,'F9',3,1,1,1),(260,'F10',3,1,1,1),(261,'G1',3,1,1,1),(262,'G2',3,1,1,1),(263,'G3',3,1,2,1),(264,'G4',3,1,2,1),(265,'G5',3,1,2,1),(266,'G6',3,1,2,1),(267,'G7',3,1,2,1),(268,'G8',3,1,2,1),(269,'G9',3,1,1,1),(270,'G10',3,1,1,1),(271,'H1',3,1,1,1),(272,'H2',3,1,1,1),(273,'H3',3,1,2,1),(274,'H4',3,1,2,1),(275,'H5',3,1,2,1),(276,'H6',3,1,2,1),(277,'H7',3,1,2,1),(278,'H8',3,1,2,1),(279,'H9',3,1,1,1),(280,'H10',3,1,1,1),(281,'I1',3,1,1,1),(282,'I2',3,1,1,1),(283,'I3',3,1,2,1),(284,'I4',3,1,2,1),(285,'I5',3,1,2,1),(286,'I6',3,1,2,1),(287,'I7',3,1,2,1),(288,'I8',3,1,2,1),(289,'I9',3,1,1,1),(290,'I10',3,1,1,1),(291,'J1',3,1,1,1),(292,'J2',3,1,1,1),(293,'J3',3,1,1,1),(294,'J4',3,1,1,1),(295,'J5',3,1,1,1),(296,'J6',3,1,1,1),(297,'J7',3,1,1,1),(298,'J8',3,1,1,1),(299,'J9',3,1,1,1),(300,'J10',3,1,1,1),(301,'A1',4,3,1,3),(302,'A2',4,3,1,3),(303,'A3',4,3,1,3),(304,'A4',4,1,1,1),(305,'A5',4,1,1,1),(306,'A6',4,1,1,1),(307,'A7',4,1,1,1),(308,'A8',4,1,1,1),(309,'A9',4,1,1,1),(310,'A10',4,1,1,1),(311,'B1',4,1,1,1),(312,'B2',4,1,1,1),(313,'B3',4,1,1,1),(314,'B4',4,1,1,1),(315,'B5',4,1,1,1),(316,'B6',4,1,1,1),(317,'B7',4,1,1,1),(318,'B8',4,1,1,1),(319,'B9',4,1,1,1),(320,'B10',4,1,1,1),(321,'C1',4,1,1,1),(322,'C2',4,1,1,1),(323,'C3',4,1,1,1),(324,'C4',4,1,1,1),(325,'C5',4,1,1,1),(326,'C6',4,1,1,1),(327,'C7',4,1,1,1),(328,'C8',4,1,1,1),(329,'C9',4,1,1,1),(330,'C10',4,1,1,1),(331,'D1',4,1,1,1),(332,'D2',4,1,1,1),(333,'D3',4,1,1,1),(334,'D4',4,1,1,1),(335,'D5',4,1,1,1),(336,'D6',4,1,1,1),(337,'D7',4,1,1,1),(338,'D8',4,1,1,1),(339,'D9',4,1,1,1),(340,'D10',4,1,1,1),(341,'E1',4,1,1,1),(342,'E2',4,1,1,1),(343,'E3',4,1,1,1),(344,'E4',4,1,1,1),(345,'E5',4,1,1,1),(346,'E6',4,1,1,1),(347,'E7',4,1,1,1),(348,'E8',4,1,1,1),(349,'E9',4,1,1,1),(350,'E10',4,1,1,1),(351,'F1',4,1,1,1),(352,'F2',4,1,1,1),(353,'F3',4,1,1,1),(354,'F4',4,1,2,1),(355,'F5',4,1,2,1),(356,'F6',4,1,2,1),(357,'F7',4,1,2,1),(358,'F8',4,1,2,1),(359,'F9',4,1,1,1),(360,'F10',4,1,1,1),(361,'G1',4,1,1,1),(362,'G2',4,1,1,1),(363,'G3',4,1,2,1),(364,'G4',4,1,2,1),(365,'G5',4,1,2,1),(366,'G6',4,1,2,1),(367,'G7',4,1,2,1),(368,'G8',4,1,2,1),(369,'G9',4,1,1,1),(370,'G10',4,1,1,1),(371,'H1',4,1,1,1),(372,'H2',4,1,1,1),(373,'H3',4,1,2,1),(374,'H4',4,1,2,1),(375,'H5',4,1,2,1),(376,'H6',4,1,2,1),(377,'H7',4,1,2,1),(378,'H8',4,1,2,1),(379,'H9',4,1,1,1),(380,'H10',4,1,1,1),(381,'I1',4,1,1,1),(382,'I2',4,1,1,1),(383,'I3',4,1,2,1),(384,'I4',4,1,2,1),(385,'I5',4,1,2,1),(386,'I6',4,1,2,1),(387,'I7',4,1,2,1),(388,'I8',4,1,2,1),(389,'I9',4,1,1,1),(390,'I10',4,1,1,1),(391,'J1',4,1,1,1),(392,'J2',4,1,1,1),(393,'J3',4,1,1,1),(394,'J4',4,1,1,1),(395,'J5',4,1,1,1),(396,'J6',4,1,1,1),(397,'J7',4,1,1,1),(398,'J8',4,1,1,1),(399,'J9',4,1,1,1),(400,'J10',4,1,1,1),(401,'A1',5,3,1,3),(402,'A2',5,1,1,1),(403,'A3',5,1,1,1),(404,'A4',5,1,1,1),(405,'A5',5,1,1,1),(406,'A6',5,1,1,1),(407,'A7',5,1,1,1),(408,'A8',5,1,1,1),(409,'A9',5,1,1,1),(410,'A10',5,1,1,1),(411,'B1',5,1,1,1),(412,'B2',5,3,1,3),(413,'B3',5,1,1,1),(414,'B4',5,1,1,1),(415,'B5',5,1,1,1),(416,'B6',5,1,1,1),(417,'B7',5,1,1,1),(418,'B8',5,1,1,1),(419,'B9',5,1,1,1),(420,'B10',5,1,1,1),(421,'C1',5,1,1,1),(422,'C2',5,1,1,1),(423,'C3',5,3,1,3),(424,'C4',5,1,1,1),(425,'C5',5,1,1,1),(426,'C6',5,1,1,1),(427,'C7',5,1,1,1),(428,'C8',5,1,1,1),(429,'C9',5,1,1,1),(430,'C10',5,1,1,1),(431,'D1',5,1,1,1),(432,'D2',5,1,1,1),(433,'D3',5,1,1,1),(434,'D4',5,3,1,3),(435,'D5',5,1,1,1),(436,'D6',5,1,1,1),(437,'D7',5,1,1,1),(438,'D8',5,1,1,1),(439,'D9',5,1,1,1),(440,'D10',5,1,1,1),(441,'E1',5,1,1,1),(442,'E2',5,1,1,1),(443,'E3',5,1,1,1),(444,'E4',5,1,1,1),(445,'E5',5,3,1,3),(446,'E6',5,1,1,1),(447,'E7',5,1,1,1),(448,'E8',5,1,1,1),(449,'E9',5,1,1,1),(450,'E10',5,1,1,1),(451,'F1',5,1,1,1),(452,'F2',5,2,1,1),(453,'F3',5,1,1,1),(454,'F4',5,1,2,1),(455,'F5',5,1,2,1),(456,'F6',5,3,2,3),(457,'F7',5,2,2,1),(458,'F8',5,2,2,1),(459,'F9',5,1,1,1),(460,'F10',5,1,1,1),(461,'G1',5,1,1,1),(462,'G2',5,1,1,1),(463,'G3',5,1,2,1),(464,'G4',5,1,2,1),(465,'G5',5,1,2,1),(466,'G6',5,1,2,1),(467,'G7',5,3,2,3),(468,'G8',5,1,2,1),(469,'G9',5,1,1,1),(470,'G10',5,1,1,1),(471,'H1',5,1,1,1),(472,'H2',5,1,1,1),(473,'H3',5,1,2,1),(474,'H4',5,1,2,1),(475,'H5',5,1,2,1),(476,'H6',5,1,2,1),(477,'H7',5,1,2,1),(478,'H8',5,3,2,3),(479,'H9',5,1,1,1),(480,'H10',5,1,1,1),(481,'I1',5,1,1,1),(482,'I2',5,1,1,1),(483,'I3',5,1,2,1),(484,'I4',5,1,2,1),(485,'I5',5,1,2,1),(486,'I6',5,1,2,1),(487,'I7',5,1,2,1),(488,'I8',5,1,2,1),(489,'I9',5,3,1,3),(490,'I10',5,1,1,1),(491,'J1',5,1,1,1),(492,'J2',5,1,1,1),(493,'J3',5,1,1,1),(494,'J4',5,1,1,1),(495,'J5',5,1,1,1),(496,'J6',5,1,1,1),(497,'J7',5,1,1,1),(498,'J8',5,1,1,1),(499,'J9',5,1,1,1),(500,'J10',5,3,1,3),(501,'A1',6,1,1,1),(502,'A2',6,1,1,1),(503,'A3',6,1,1,1),(504,'A4',6,1,1,1),(505,'A5',6,1,1,1),(506,'A6',6,1,1,1),(507,'A7',6,1,1,1),(508,'A8',6,1,1,1),(509,'A9',6,1,1,1),(510,'A10',6,1,1,1),(511,'B1',6,1,1,1),(512,'B2',6,1,1,1),(513,'B3',6,1,1,1),(514,'B4',6,1,1,1),(515,'B5',6,1,1,1),(516,'B6',6,1,1,1),(517,'B7',6,1,1,1),(518,'B8',6,1,1,1),(519,'B9',6,1,1,1),(520,'B10',6,1,1,1),(521,'C1',6,1,1,1),(522,'C2',6,1,1,1),(523,'C3',6,1,1,1),(524,'C4',6,1,1,1),(525,'C5',6,1,1,1),(526,'C6',6,1,1,1),(527,'C7',6,1,1,1),(528,'C8',6,1,1,1),(529,'C9',6,1,1,1),(530,'C10',6,1,1,1),(531,'D1',6,1,1,1),(532,'D2',6,1,1,1),(533,'D3',6,1,1,1),(534,'D4',6,1,1,1),(535,'D5',6,1,1,1),(536,'D6',6,1,1,1),(537,'D7',6,1,1,1),(538,'D8',6,1,1,1),(539,'D9',6,1,1,1),(540,'D10',6,1,1,1),(541,'E1',6,1,1,1),(542,'E2',6,1,1,1),(543,'E3',6,1,1,1),(544,'E4',6,1,1,1),(545,'E5',6,1,1,1),(546,'E6',6,1,1,1),(547,'E7',6,1,1,1),(548,'E8',6,1,1,1),(549,'E9',6,1,1,1),(550,'E10',6,1,1,1),(551,'F1',6,1,1,1),(552,'F2',6,1,1,1),(553,'F3',6,1,1,1),(554,'F4',6,1,2,1),(555,'F5',6,1,2,1),(556,'F6',6,1,2,1),(557,'F7',6,1,2,1),(558,'F8',6,1,2,1),(559,'F9',6,1,1,1),(560,'F10',6,1,1,1),(561,'G1',6,1,1,1),(562,'G2',6,1,1,1),(563,'G3',6,1,2,1),(564,'G4',6,1,2,1),(565,'G5',6,1,2,1),(566,'G6',6,1,2,1),(567,'G7',6,1,2,1),(568,'G8',6,1,2,1),(569,'G9',6,1,1,1),(570,'G10',6,1,1,1),(571,'H1',6,1,1,1),(572,'H2',6,1,1,1),(573,'H3',6,1,2,1),(574,'H4',6,1,2,1),(575,'H5',6,1,2,1),(576,'H6',6,1,2,1),(577,'H7',6,1,2,1),(578,'H8',6,1,2,1),(579,'H9',6,1,1,1),(580,'H10',6,1,1,1),(581,'I1',6,1,1,1),(582,'I2',6,1,1,1),(583,'I3',6,1,2,1),(584,'I4',6,1,2,1),(585,'I5',6,1,2,1),(586,'I6',6,1,2,1),(587,'I7',6,1,2,1),(588,'I8',6,1,2,1),(589,'I9',6,1,1,1),(590,'I10',6,1,1,1),(591,'J1',6,1,1,1),(592,'J2',6,1,1,1),(593,'J3',6,1,1,1),(594,'J4',6,1,1,1),(595,'J5',6,1,1,1),(596,'J6',6,1,1,1),(597,'J7',6,1,1,1),(598,'J8',6,1,1,1),(599,'J9',6,1,1,1),(600,'J10',6,1,1,1),(601,'A1',7,3,1,3),(602,'A2',7,3,1,3),(603,'A3',7,2,1,1),(604,'A4',7,2,1,1),(605,'A5',7,1,1,1),(606,'A6',7,1,1,1),(607,'A7',7,1,1,1),(608,'A8',7,1,1,1),(609,'A9',7,1,1,1),(610,'A10',7,1,1,1),(611,'B1',7,1,1,1),(612,'B2',7,1,1,1),(613,'B3',7,1,1,1),(614,'B4',7,1,1,1),(615,'B5',7,1,1,1),(616,'B6',7,1,1,1),(617,'B7',7,1,1,1),(618,'B8',7,1,1,1),(619,'B9',7,1,1,1),(620,'B10',7,1,1,1),(621,'C1',7,1,1,1),(622,'C2',7,1,1,1),(623,'C3',7,1,1,1),(624,'C4',7,1,1,1),(625,'C5',7,1,1,1),(626,'C6',7,1,1,1),(627,'C7',7,1,1,1),(628,'C8',7,1,1,1),(629,'C9',7,1,1,1),(630,'C10',7,1,1,1),(631,'D1',7,1,1,1),(632,'D2',7,1,1,1),(633,'D3',7,1,1,1),(634,'D4',7,1,1,1),(635,'D5',7,1,1,1),(636,'D6',7,1,1,1),(637,'D7',7,1,1,1),(638,'D8',7,1,1,1),(639,'D9',7,1,1,1),(640,'D10',7,1,1,1),(641,'E1',7,1,1,1),(642,'E2',7,1,1,1),(643,'E3',7,1,1,1),(644,'E4',7,1,1,1),(645,'E5',7,1,1,1),(646,'E6',7,1,1,1),(647,'E7',7,1,1,1),(648,'E8',7,1,1,1),(649,'E9',7,1,1,1),(650,'E10',7,1,1,1),(651,'F1',7,1,1,1),(652,'F2',7,1,1,1),(653,'F3',7,1,1,1),(654,'F4',7,1,2,1),(655,'F5',7,1,2,1),(656,'F6',7,1,2,1),(657,'F7',7,1,2,1),(658,'F8',7,1,2,1),(659,'F9',7,1,1,1),(660,'F10',7,1,1,1),(661,'G1',7,1,1,1),(662,'G2',7,1,1,1),(663,'G3',7,1,2,1),(664,'G4',7,1,2,1),(665,'G5',7,1,2,1),(666,'G6',7,1,2,1),(667,'G7',7,1,2,1),(668,'G8',7,1,2,1),(669,'G9',7,1,1,1),(670,'G10',7,1,1,1),(671,'H1',7,1,1,1),(672,'H2',7,1,1,1),(673,'H3',7,1,2,1),(674,'H4',7,1,2,1),(675,'H5',7,1,2,1),(676,'H6',7,1,2,1),(677,'H7',7,1,2,1),(678,'H8',7,1,2,1),(679,'H9',7,1,1,1),(680,'H10',7,1,1,1),(681,'I1',7,1,1,1),(682,'I2',7,1,1,1),(683,'I3',7,1,2,1),(684,'I4',7,1,2,1),(685,'I5',7,1,2,1),(686,'I6',7,1,2,1),(687,'I7',7,1,2,1),(688,'I8',7,1,2,1),(689,'I9',7,1,1,1),(690,'I10',7,1,1,1),(691,'J1',7,1,1,1),(692,'J2',7,1,1,1),(693,'J3',7,1,1,1),(694,'J4',7,1,1,1),(695,'J5',7,1,1,1),(696,'J6',7,1,1,1),(697,'J7',7,1,1,1),(698,'J8',7,1,1,1),(699,'J9',7,1,1,1),(700,'J10',7,1,1,1),(701,'A1',8,1,1,1),(702,'A2',8,1,1,1),(703,'A3',8,1,1,1),(704,'A4',8,1,1,1),(705,'A5',8,1,1,1),(706,'A6',8,1,1,1),(707,'A7',8,1,1,1),(708,'A8',8,1,1,1),(709,'A9',8,1,1,1),(710,'A10',8,1,1,1),(711,'B1',8,1,1,1),(712,'B2',8,1,1,1),(713,'B3',8,1,1,1),(714,'B4',8,1,1,1),(715,'B5',8,1,1,1),(716,'B6',8,1,1,1),(717,'B7',8,1,1,1),(718,'B8',8,1,1,1),(719,'B9',8,1,1,1),(720,'B10',8,1,1,1),(721,'C1',8,1,1,1),(722,'C2',8,1,1,1),(723,'C3',8,1,1,1),(724,'C4',8,1,1,1),(725,'C5',8,1,1,1),(726,'C6',8,1,1,1),(727,'C7',8,1,1,1),(728,'C8',8,1,1,1),(729,'C9',8,1,1,1),(730,'C10',8,1,1,1),(731,'D1',8,1,1,1),(732,'D2',8,1,1,1),(733,'D3',8,1,1,1),(734,'D4',8,1,1,1),(735,'D5',8,1,1,1),(736,'D6',8,1,1,1),(737,'D7',8,1,1,1),(738,'D8',8,1,1,1),(739,'D9',8,1,1,1),(740,'D10',8,1,1,1),(741,'E1',8,1,1,1),(742,'E2',8,1,1,1),(743,'E3',8,1,1,1),(744,'E4',8,1,1,1),(745,'E5',8,1,1,1),(746,'E6',8,1,1,1),(747,'E7',8,1,1,1),(748,'E8',8,1,1,1),(749,'E9',8,1,1,1),(750,'E10',8,1,1,1),(751,'F1',8,1,1,1),(752,'F2',8,1,1,1),(753,'F3',8,1,1,1),(754,'F4',8,1,2,1),(755,'F5',8,1,2,1),(756,'F6',8,1,2,1),(757,'F7',8,1,2,1),(758,'F8',8,1,2,1),(759,'F9',8,1,1,1),(760,'F10',8,1,1,1),(761,'G1',8,1,1,1),(762,'G2',8,1,1,1),(763,'G3',8,1,2,1),(764,'G4',8,1,2,1),(765,'G5',8,1,2,1),(766,'G6',8,1,2,1),(767,'G7',8,1,2,1),(768,'G8',8,1,2,1),(769,'G9',8,1,1,1),(770,'G10',8,1,1,1),(771,'H1',8,1,1,1),(772,'H2',8,1,1,1),(773,'H3',8,1,2,1),(774,'H4',8,1,2,1),(775,'H5',8,1,2,1),(776,'H6',8,1,2,1),(777,'H7',8,1,2,1),(778,'H8',8,1,2,1),(779,'H9',8,1,1,1),(780,'H10',8,1,1,1),(781,'I1',8,1,1,1),(782,'I2',8,1,1,1),(783,'I3',8,1,2,1),(784,'I4',8,1,2,1),(785,'I5',8,1,2,1),(786,'I6',8,1,2,1),(787,'I7',8,1,2,1),(788,'I8',8,1,2,1),(789,'I9',8,1,1,1),(790,'I10',8,1,1,1),(791,'J1',8,1,1,1),(792,'J2',8,1,1,1),(793,'J3',8,1,1,1),(794,'J4',8,1,1,1),(795,'J5',8,1,1,1),(796,'J6',8,1,1,1),(797,'J7',8,1,1,1),(798,'J8',8,1,1,1),(799,'J9',8,1,1,1),(800,'J10',8,1,1,1),(801,'A1',9,1,1,1),(802,'A2',9,1,1,1),(803,'A3',9,1,1,1),(804,'A4',9,1,1,1),(805,'A5',9,1,1,1),(806,'A6',9,1,1,1),(807,'A7',9,1,1,1),(808,'A8',9,1,1,1),(809,'A9',9,1,1,1),(810,'A10',9,1,1,1),(811,'B1',9,1,1,1),(812,'B2',9,1,1,1),(813,'B3',9,1,1,1),(814,'B4',9,1,1,1),(815,'B5',9,1,1,1),(816,'B6',9,1,1,1),(817,'B7',9,1,1,1),(818,'B8',9,1,1,1),(819,'B9',9,1,1,1),(820,'B10',9,1,1,1),(821,'C1',9,1,1,1),(822,'C2',9,1,1,1),(823,'C3',9,1,1,1),(824,'C4',9,1,1,1),(825,'C5',9,1,1,1),(826,'C6',9,1,1,1),(827,'C7',9,1,1,1),(828,'C8',9,1,1,1),(829,'C9',9,1,1,1),(830,'C10',9,1,1,1),(831,'D1',9,1,1,1),(832,'D2',9,1,1,1),(833,'D3',9,1,1,1),(834,'D4',9,1,1,1),(835,'D5',9,1,1,1),(836,'D6',9,1,1,1),(837,'D7',9,1,1,1),(838,'D8',9,1,1,1),(839,'D9',9,1,1,1),(840,'D10',9,1,1,1),(841,'E1',9,1,1,1),(842,'E2',9,1,1,1),(843,'E3',9,1,1,1),(844,'E4',9,1,1,1),(845,'E5',9,1,1,1),(846,'E6',9,1,1,1),(847,'E7',9,1,1,1),(848,'E8',9,1,1,1),(849,'E9',9,1,1,1),(850,'E10',9,1,1,1),(851,'F1',9,1,1,1),(852,'F2',9,1,1,1),(853,'F3',9,1,1,1),(854,'F4',9,1,2,1),(855,'F5',9,1,2,1),(856,'F6',9,1,2,1),(857,'F7',9,1,2,1),(858,'F8',9,1,2,1),(859,'F9',9,1,1,1),(860,'F10',9,1,1,1),(861,'G1',9,1,1,1),(862,'G2',9,1,1,1),(863,'G3',9,1,2,1),(864,'G4',9,1,2,1),(865,'G5',9,1,2,1),(866,'G6',9,1,2,1),(867,'G7',9,1,2,1),(868,'G8',9,1,2,1),(869,'G9',9,1,1,1),(870,'G10',9,1,1,1),(871,'H1',9,1,1,1),(872,'H2',9,1,1,1),(873,'H3',9,1,2,1),(874,'H4',9,1,2,1),(875,'H5',9,1,2,1),(876,'H6',9,1,2,1),(877,'H7',9,1,2,1),(878,'H8',9,1,2,1),(879,'H9',9,1,1,1),(880,'H10',9,1,1,1),(881,'I1',9,1,1,1),(882,'I2',9,1,1,1),(883,'I3',9,1,2,1),(884,'I4',9,1,2,1),(885,'I5',9,1,2,1),(886,'I6',9,1,2,1),(887,'I7',9,1,2,1),(888,'I8',9,1,2,1),(889,'I9',9,1,1,1),(890,'I10',9,1,1,1),(891,'J1',9,1,1,1),(892,'J2',9,1,1,1),(893,'J3',9,1,1,1),(894,'J4',9,1,1,1),(895,'J5',9,1,1,1),(896,'J6',9,1,1,1),(897,'J7',9,1,1,1),(898,'J8',9,1,1,1),(899,'J9',9,1,1,1),(900,'J10',9,1,1,1),(901,'A1',10,1,1,1),(902,'A2',10,1,1,1),(903,'A3',10,1,1,1),(904,'A4',10,1,1,1),(905,'A5',10,1,1,1),(906,'A6',10,1,1,1),(907,'A7',10,1,1,1),(908,'A8',10,1,1,1),(909,'A9',10,1,1,1),(910,'A10',10,1,1,1),(911,'B1',10,1,1,1),(912,'B2',10,1,1,1),(913,'B3',10,1,1,1),(914,'B4',10,1,1,1),(915,'B5',10,1,1,1),(916,'B6',10,1,1,1),(917,'B7',10,1,1,1),(918,'B8',10,1,1,1),(919,'B9',10,1,1,1),(920,'B10',10,1,1,1),(921,'C1',10,1,1,1),(922,'C2',10,1,1,1),(923,'C3',10,1,1,1),(924,'C4',10,1,1,1),(925,'C5',10,1,1,1),(926,'C6',10,1,1,1),(927,'C7',10,1,1,1),(928,'C8',10,1,1,1),(929,'C9',10,1,1,1),(930,'C10',10,1,1,1),(931,'D1',10,1,1,1),(932,'D2',10,1,1,1),(933,'D3',10,1,1,1),(934,'D4',10,1,1,1),(935,'D5',10,1,1,1),(936,'D6',10,1,1,1),(937,'D7',10,1,1,1),(938,'D8',10,1,1,1),(939,'D9',10,1,1,1),(940,'D10',10,1,1,1),(941,'E1',10,1,1,1),(942,'E2',10,1,1,1),(943,'E3',10,1,1,1),(944,'E4',10,1,1,1),(945,'E5',10,1,1,1),(946,'E6',10,1,1,1),(947,'E7',10,1,1,1),(948,'E8',10,1,1,1),(949,'E9',10,1,1,1),(950,'E10',10,1,1,1),(951,'F1',10,1,1,1),(952,'F2',10,1,1,1),(953,'F3',10,1,1,1),(954,'F4',10,1,2,1),(955,'F5',10,1,2,1),(956,'F6',10,1,2,1),(957,'F7',10,1,2,1),(958,'F8',10,1,2,1),(959,'F9',10,1,1,1),(960,'F10',10,1,1,1),(961,'G1',10,1,1,1),(962,'G2',10,1,1,1),(963,'G3',10,1,2,1),(964,'G4',10,1,2,1),(965,'G5',10,1,2,1),(966,'G6',10,1,2,1),(967,'G7',10,1,2,1),(968,'G8',10,1,2,1),(969,'G9',10,1,1,1),(970,'G10',10,1,1,1),(971,'H1',10,1,1,1),(972,'H2',10,1,1,1),(973,'H3',10,1,2,1),(974,'H4',10,1,2,1),(975,'H5',10,1,2,1),(976,'H6',10,1,2,1),(977,'H7',10,1,2,1),(978,'H8',10,1,2,1),(979,'H9',10,1,1,1),(980,'H10',10,1,1,1),(981,'I1',10,1,1,1),(982,'I2',10,1,1,1),(983,'I3',10,1,2,1),(984,'I4',10,1,2,1),(985,'I5',10,1,2,1),(986,'I6',10,1,2,1),(987,'I7',10,1,2,1),(988,'I8',10,1,2,1),(989,'I9',10,1,1,1),(990,'I10',10,1,1,1),(991,'J1',10,1,1,1),(992,'J2',10,1,1,1),(993,'J3',10,1,1,1),(994,'J4',10,1,1,1),(995,'J5',10,1,1,1),(996,'J6',10,1,1,1),(997,'J7',10,1,1,1),(998,'J8',10,1,1,1),(999,'J9',10,1,1,1),(1000,'J10',10,1,1,1),(1001,'A1',11,2,1,3),(1002,'A2',11,2,1,3),(1003,'A3',11,2,1,3),(1004,'A4',11,2,1,3),(1005,'A5',11,1,1,3),(1006,'A6',11,2,1,7),(1007,'A7',11,1,1,7),(1008,'A8',11,1,1,1),(1009,'A9',11,1,1,1),(1010,'A10',11,1,1,1),(1011,'B1',11,1,1,1),(1012,'B2',11,1,1,1),(1013,'B3',11,1,1,1),(1014,'B4',11,1,1,1),(1015,'B5',11,1,1,1),(1016,'B6',11,1,1,1),(1017,'B7',11,1,1,1),(1018,'B8',11,1,1,1),(1019,'B9',11,1,1,1),(1020,'B10',11,1,1,1),(1021,'C1',11,1,1,1),(1022,'C2',11,1,1,1),(1023,'C3',11,1,1,1),(1024,'C4',11,1,1,1),(1025,'C5',11,1,1,1),(1026,'C6',11,1,1,1),(1027,'C7',11,1,1,1),(1028,'C8',11,1,1,1),(1029,'C9',11,1,1,1),(1030,'C10',11,1,1,1),(1031,'D1',11,1,1,1),(1032,'D2',11,1,1,1),(1033,'D3',11,1,1,1),(1034,'D4',11,1,1,1),(1035,'D5',11,1,1,1),(1036,'D6',11,1,1,1),(1037,'D7',11,1,1,1),(1038,'D8',11,1,1,1),(1039,'D9',11,1,1,1),(1040,'D10',11,1,1,1),(1041,'E1',11,1,1,1),(1042,'E2',11,1,1,1),(1043,'E3',11,1,1,1),(1044,'E4',11,1,1,1),(1045,'E5',11,1,1,1),(1046,'E6',11,1,1,1),(1047,'E7',11,1,1,1),(1048,'E8',11,1,1,1),(1049,'E9',11,1,1,1),(1050,'E10',11,1,1,1),(1051,'F1',11,1,1,1),(1052,'F2',11,1,1,1),(1053,'F3',11,1,1,1),(1054,'F4',11,1,2,1),(1055,'F5',11,1,2,1),(1056,'F6',11,1,2,1),(1057,'F7',11,1,2,1),(1058,'F8',11,1,2,1),(1059,'F9',11,1,1,1),(1060,'F10',11,1,1,1),(1061,'G1',11,1,1,1),(1062,'G2',11,1,1,1),(1063,'G3',11,1,2,1),(1064,'G4',11,1,2,1),(1065,'G5',11,1,2,1),(1066,'G6',11,1,2,1),(1067,'G7',11,1,2,1),(1068,'G8',11,1,2,1),(1069,'G9',11,1,1,1),(1070,'G10',11,1,1,1),(1071,'H1',11,1,1,1),(1072,'H2',11,1,1,1),(1073,'H3',11,1,2,1),(1074,'H4',11,1,2,1),(1075,'H5',11,1,2,1),(1076,'H6',11,1,2,1),(1077,'H7',11,1,2,1),(1078,'H8',11,1,2,1),(1079,'H9',11,1,1,1),(1080,'H10',11,1,1,1),(1081,'I1',11,1,1,1),(1082,'I2',11,1,1,1),(1083,'I3',11,1,2,1),(1084,'I4',11,1,2,1),(1085,'I5',11,1,2,1),(1086,'I6',11,1,2,1),(1087,'I7',11,1,2,1),(1088,'I8',11,1,2,1),(1089,'I9',11,1,1,1),(1090,'I10',11,1,1,1),(1091,'J1',11,1,1,1),(1092,'J2',11,1,1,1),(1093,'J3',11,1,1,1),(1094,'J4',11,1,1,1),(1095,'J5',11,1,1,1),(1096,'J6',11,1,1,1),(1097,'J7',11,1,1,1),(1098,'J8',11,1,1,1),(1099,'J9',11,1,1,1),(1100,'J10',11,1,1,1),(1101,'A1',12,2,1,7),(1102,'A2',12,2,1,7),(1103,'A3',12,3,1,3),(1104,'A4',12,3,1,3),(1105,'A5',12,1,1,1),(1106,'A6',12,1,1,1),(1107,'A7',12,1,1,1),(1108,'A8',12,1,1,1),(1109,'A9',12,1,1,1),(1110,'A10',12,1,1,1),(1111,'B1',12,1,1,1),(1112,'B2',12,1,1,1),(1113,'B3',12,1,1,1),(1114,'B4',12,1,1,1),(1115,'B5',12,1,1,1),(1116,'B6',12,1,1,1),(1117,'B7',12,1,1,1),(1118,'B8',12,1,1,1),(1119,'B9',12,1,1,1),(1120,'B10',12,1,1,1),(1121,'C1',12,1,1,1),(1122,'C2',12,1,1,1),(1123,'C3',12,1,1,1),(1124,'C4',12,1,1,1),(1125,'C5',12,1,1,1),(1126,'C6',12,1,1,1),(1127,'C7',12,1,1,1),(1128,'C8',12,1,1,1),(1129,'C9',12,1,1,1),(1130,'C10',12,1,1,1),(1131,'D1',12,1,1,1),(1132,'D2',12,1,1,1),(1133,'D3',12,1,1,1),(1134,'D4',12,1,1,1),(1135,'D5',12,1,1,1),(1136,'D6',12,1,1,1),(1137,'D7',12,1,1,1),(1138,'D8',12,1,1,1),(1139,'D9',12,1,1,1),(1140,'D10',12,1,1,1),(1141,'E1',12,1,1,1),(1142,'E2',12,1,1,1),(1143,'E3',12,1,1,1),(1144,'E4',12,1,1,1),(1145,'E5',12,1,1,1),(1146,'E6',12,1,1,1),(1147,'E7',12,1,1,1),(1148,'E8',12,1,1,1),(1149,'E9',12,1,1,1),(1150,'E10',12,1,1,1),(1151,'F1',12,1,1,1),(1152,'F2',12,1,1,1),(1153,'F3',12,1,1,1),(1154,'F4',12,1,2,1),(1155,'F5',12,1,2,1),(1156,'F6',12,1,2,1),(1157,'F7',12,1,2,1),(1158,'F8',12,1,2,1),(1159,'F9',12,1,1,1),(1160,'F10',12,1,1,1),(1161,'G1',12,1,1,1),(1162,'G2',12,1,1,1),(1163,'G3',12,1,2,1),(1164,'G4',12,1,2,1),(1165,'G5',12,1,2,1),(1166,'G6',12,1,2,1),(1167,'G7',12,1,2,1),(1168,'G8',12,1,2,1),(1169,'G9',12,1,1,1),(1170,'G10',12,1,1,1),(1171,'H1',12,1,1,1),(1172,'H2',12,1,1,1),(1173,'H3',12,1,2,1),(1174,'H4',12,1,2,1),(1175,'H5',12,1,2,1),(1176,'H6',12,1,2,1),(1177,'H7',12,1,2,1),(1178,'H8',12,1,2,1),(1179,'H9',12,1,1,1),(1180,'H10',12,1,1,1),(1181,'I1',12,1,1,1),(1182,'I2',12,1,1,1),(1183,'I3',12,1,2,1),(1184,'I4',12,1,2,1),(1185,'I5',12,1,2,1),(1186,'I6',12,1,2,1),(1187,'I7',12,1,2,1),(1188,'I8',12,1,2,1),(1189,'I9',12,1,1,1),(1190,'I10',12,1,1,1),(1191,'J1',12,1,1,1),(1192,'J2',12,1,1,1),(1193,'J3',12,1,1,1),(1194,'J4',12,1,1,1),(1195,'J5',12,1,1,1),(1196,'J6',12,1,1,1),(1197,'J7',12,1,1,1),(1198,'J8',12,1,1,1),(1199,'J9',12,1,1,1),(1200,'J10',12,1,1,1);
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shows` (
  `show_id` bigint NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) DEFAULT '1',
  `time_end` time DEFAULT NULL,
  `time_start` time DEFAULT NULL,
  `film_id` bigint DEFAULT NULL,
  `room_id` bigint DEFAULT NULL,
  `schedule_id` bigint DEFAULT NULL,
  PRIMARY KEY (`show_id`),
  KEY `FKaa9n2krenumc2w8hx22s1mc0w` (`film_id`),
  KEY `FKqmmpdmpgjcu5urrusr1dx7avw` (`room_id`),
  KEY `FKr6xl1yhpikjqbbsaj9w8932bk` (`schedule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows`
--

LOCK TABLES `shows` WRITE;
/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
INSERT INTO `shows` VALUES (1,1,'11:30:00','10:00:00',1,1,1),(2,1,'13:30:00','12:00:00',1,2,1),(3,0,'10:40:45','08:00:00',5,3,1),(4,1,'15:00:32','12:00:00',4,4,3),(5,1,'19:40:45','17:00:00',5,5,1),(6,0,'12:55:45','10:15:00',5,6,3),(7,1,'13:40:45','11:00:00',5,7,5),(8,0,'20:40:45','18:00:00',5,11,8),(9,1,'12:40:45','10:00:00',5,12,9);
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `ticket_id` bigint NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `seat_id` bigint DEFAULT NULL,
  `show_id` bigint DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `FKqgi3sbv1u45s41wawh75ut8ph` (`order_id`),
  KEY `FK1f6n3pv4b80wl6gj4ra32ctxk` (`seat_id`),
  KEY `FKosj8dc2tn2tcidsfimopidq13` (`show_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,50000,1,102,2),(2,50000,1,101,2),(3,50000,3,103,2),(4,50000,3,104,2),(5,50000,3,105,2),(6,50000,3,106,2),(7,50000,3,107,2),(8,50000,4,301,4),(9,50000,4,303,4),(10,50000,4,302,4),(11,50000,5,108,2),(12,50000,5,109,2),(13,50000,6,401,5),(14,50000,6,445,5),(15,50000,6,412,5),(16,50000,6,423,5),(17,60000,6,456,5),(18,50000,6,434,5),(19,60000,6,467,5),(20,50000,6,489,5),(21,60000,6,478,5),(22,50000,6,500,5),(23,50000,18,601,7),(24,50000,18,602,7),(25,50000,19,1104,9),(26,50000,19,1103,9);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) DEFAULT '0',
  `token` varchar(1000) DEFAULT NULL,
  `token_exp_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeseats`
--

DROP TABLE IF EXISTS `typeseats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typeseats` (
  `type_id` bigint NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeseats`
--

LOCK TABLES `typeseats` WRITE;
/*!40000 ALTER TABLE `typeseats` DISABLE KEYS */;
INSERT INTO `typeseats` VALUES (1,50000,'NORMAL'),(2,60000,'VIP');
/*!40000 ALTER TABLE `typeseats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,0,'admin@gmail.com','Admin','$2a$10$z58oyk/wi9vXXo2Db9c3Ju6xP1hJVGXcHzrIFJ4ybFiv3XGNTI4Yq','0987654321','admin',1),(2,0,'projection@gmail.com','Projection','$2a$10$z58oyk/wi9vXXo2Db9c3Ju6xP1hJVGXcHzrIFJ4ybFiv3XGNTI4Yq','0934563789','projection',2),(3,0,'staff@gmail.com','Staff','$2a$10$z58oyk/wi9vXXo2Db9c3Ju6xP1hJVGXcHzrIFJ4ybFiv3XGNTI4Yq','0987654322','staff',3),(6,0,'nhatquang120396@gmail.com','Nguyễn Lê Nhật Quang','$2a$10$cwlNDmfvH.kY67wLVYYzpux2K5URzfPYjJZoZbaB43mQnD/ZK4Rym','0905910001','quang',1),(7,1,'longhoang@gmail.com','Hoàng Long','$2a$10$cwlNDmfvH.kY67wLVYYzpux2K5URzfPYjJZoZbaB43mQnD/ZK4Rym','0333924120','long',3),(9,0,'zirewifuh@mailinator.com','Megan Richardson','$2a$10$yLI84o0Uk7Q0Jq/NL41TqeEuZxKUPbsV1zCyF8sv3/HTT0QSIrl6u','0912345678','hoanglong',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visits` (
  `visit_id` bigint NOT NULL AUTO_INCREMENT,
  `exp_date` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `rel_date` date DEFAULT NULL,
  `member_id` bigint DEFAULT NULL,
  PRIMARY KEY (`visit_id`),
  KEY `FKccmjnq4me8y22g4bsnjfuxtob` (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (1,'2022-08-18',1,'2021-08-18',2);
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `week_revenue`
--

DROP TABLE IF EXISTS `week_revenue`;
/*!50001 DROP VIEW IF EXISTS `week_revenue`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `week_revenue` AS SELECT 
 1 AS `week`,
 1 AS `sum_product`,
 1 AS `sum_ticket`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `year_revenue`
--

DROP TABLE IF EXISTS `year_revenue`;
/*!50001 DROP VIEW IF EXISTS `year_revenue`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `year_revenue` AS SELECT 
 1 AS `year`,
 1 AS `sum_product`,
 1 AS `sum_ticket`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `date_revenue`
--

/*!50001 DROP VIEW IF EXISTS `date_revenue`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `date_revenue` AS select cast(`o`.`order_date` as date) AS `date`,sum(`o`.`total_product`) AS `sum_product`,sum(`o`.`total_ticket`) AS `sum_ticket`,sum(`o`.`total_price`) AS `total` from `orders` `o` group by cast(`o`.`order_date` as date) order by `o`.`order_date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `monthly_revenue`
--

/*!50001 DROP VIEW IF EXISTS `monthly_revenue`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `monthly_revenue` AS select month(`o`.`order_date`) AS `month`,sum(`o`.`total_product`) AS `sum_product`,sum(`o`.`total_ticket`) AS `sum_ticket`,sum(`o`.`total_price`) AS `total` from `orders` `o` where (0 <> year(`o`.`order_date`)) group by month(`o`.`order_date`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `week_revenue`
--

/*!50001 DROP VIEW IF EXISTS `week_revenue`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `week_revenue` AS select week(`o`.`order_date`,0) AS `week`,sum(`o`.`total_product`) AS `sum_product`,sum(`o`.`total_ticket`) AS `sum_ticket`,sum(`o`.`total_price`) AS `total` from `orders` `o` group by week(`o`.`order_date`,0) order by week(`o`.`order_date`,0) desc limit 4 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `year_revenue`
--

/*!50001 DROP VIEW IF EXISTS `year_revenue`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `year_revenue` AS select year(`o`.`order_date`) AS `year`,sum(`o`.`total_product`) AS `sum_product`,sum(`o`.`total_ticket`) AS `sum_ticket`,sum(`o`.`total_price`) AS `total` from `orders` `o` where (0 <> year(`o`.`order_date`)) group by month(`o`.`order_date`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-31 10:42:47
