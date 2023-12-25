-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add product image',8,'add_productimage'),(30,'Can change product image',8,'change_productimage'),(31,'Can delete product image',8,'delete_productimage'),(32,'Can view product image',8,'view_productimage'),(33,'Can add product',9,'add_product'),(34,'Can change product',9,'change_product'),(35,'Can delete product',9,'delete_product'),(36,'Can view product',9,'view_product'),(37,'Can add review',10,'add_review'),(38,'Can change review',10,'change_review'),(39,'Can delete review',10,'delete_review'),(40,'Can view review',10,'view_review'),(41,'Can add cart item',11,'add_cartitem'),(42,'Can change cart item',11,'change_cartitem'),(43,'Can delete cart item',11,'delete_cartitem'),(44,'Can view cart item',11,'view_cartitem'),(45,'Can add order',12,'add_order'),(46,'Can change order',12,'change_order'),(47,'Can delete order',12,'delete_order'),(48,'Can view order',12,'view_order'),(49,'Can add cart',13,'add_cart'),(50,'Can change cart',13,'change_cart'),(51,'Can delete cart',13,'delete_cart'),(52,'Can view cart',13,'view_cart'),(53,'Can add customer',14,'add_customer'),(54,'Can change customer',14,'change_customer'),(55,'Can delete customer',14,'delete_customer'),(56,'Can view customer',14,'view_customer'),(57,'Can add order item',15,'add_orderitem'),(58,'Can change order item',15,'change_orderitem'),(59,'Can delete order item',15,'delete_orderitem'),(60,'Can view order item',15,'view_orderitem');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user`
--

DROP TABLE IF EXISTS `core_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `core_user_email_92a71487_uniq` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user`
--

LOCK TABLES `core_user` WRITE;
/*!40000 ALTER TABLE `core_user` DISABLE KEYS */;
INSERT INTO `core_user` VALUES (1,'pbkdf2_sha256$720000$xH75Dr4aMeqltQlzJo1fAv$wiRcAds/VvnK9VkEtFsSPB5zZCBab0xNziSlyLeUPxU=','2023-12-06 16:14:00.000000',1,'admin',1,1,'2023-12-05 11:04:10.000000','Admin','Admin','admin@abc.com'),(2,'pbkdf2_sha256$720000$9FgA4VKtSXWrNIlwuq0xyS$fDKtTuQdiwdhsQuz9uj1HZo0AqN58Ts/ALAakvidamI=','2023-12-16 14:32:38.539450',0,'shania',0,1,'2023-12-05 22:08:59.000000','Shania','Holz','shania@example.com'),(3,'pbkdf2_sha256$720000$WUg6Rs9PiyVhSkpNvXyceB$Csmpc9M/Zapa0VaSSjEtby7S6ldrmhOit5gsoUXACcw=',NULL,0,'sonya',0,1,'2023-12-05 23:07:37.000000','Sonya','Sharma','sonya@example.com'),(4,'pbkdf2_sha256$720000$SjNjzlFDAfbx52wVAIl4FC$YTArNg+j9//MRvU54T4IUYGqM1K8EVeM3P/YDlKMJR8=','2023-12-07 15:00:06.273726',0,'ranbir',0,1,'2023-12-05 23:09:10.059131','Ranbir','Kapoor','ranbir@example.com'),(5,'pbkdf2_sha256$720000$LzfrWpNQ7sey6gqCi7hSUM$nK5yqxqyISwJuKbdqPSS1cbhHrGIeQk4499rHoxgiJ8=',NULL,0,'salman',0,1,'2023-12-05 23:13:42.112190','Salman','Khan','salman@example.com'),(6,'pbkdf2_sha256$720000$ZASY80OljkPXI2jY7LTNfJ$Lsv3rKq59w90OIXadrEpyB6tmtYsHES4/cQLn3OOxfk=',NULL,0,'deepika',0,1,'2023-12-06 17:59:52.634019','Deepika','Padukane','deepika@example.com'),(7,'pbkdf2_sha256$720000$4W0JkxSxd3zcRu3blHrAwg$CKEQJLUXJ7QCaK6x1cmmvnPiAz2ivdrguAn6EJV4Cow=',NULL,0,'kareena',0,1,'2023-12-07 13:46:43.310010','Kareena','Pradhan','kareena@example.com'),(8,'pbkdf2_sha256$720000$nE1jwwYOKnehNF8soQsQlg$kGLIhJBTgPhbVZdO4ri/AikVs7BIyFAwzN6yGqNdKv4=',NULL,0,'barun',0,0,'2023-12-12 12:26:02.813341','Barun','Dhawan','barun@example.com'),(9,'pbkdf2_sha256$720000$6ayRejWGLc19lDmtf2ezYF$lOvTn20XDYm0cLz2OPYlKXESwQkLMXh+pd6cqHE9nxg=',NULL,0,'taylor',0,1,'2023-12-12 12:27:30.000000','Taylor','Swift','taylor@example.com'),(45,'pbkdf2_sha256$720000$VNSswpywbrkJLF3Zc1HusZ$m8SlOjzpqdg0ihdjQaV4rB8w4fWzMFPRo00vKF+zlHw=',NULL,0,'alia',0,1,'2023-12-13 11:43:20.000000','Alia','Bhatt','alia@example.com'),(47,'pbkdf2_sha256$720000$OM2ZJoWzP1qcbyw6k5Dcza$W1r28eBD8r0SlxP0auq+0oeeKntTAG00llg4TRBe9iQ=','2023-12-13 19:59:12.944975',0,'christian',0,1,'2023-12-13 19:48:28.071154','Christian','Neuer','christian@example.com'),(67,'pbkdf2_sha256$720000$Aee5muuJuXZgAXYJ8IESsS$lxgrcxpv0jszE/d7TIpqVrcpXGWDGMECzFGNByL4Zmc=',NULL,0,'sadfsadfasdf',0,1,'2023-12-15 14:05:52.521701','asdfasdf','asdfasdf','asdfbob@blabla.com');
/*!40000 ALTER TABLE `core_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_groups`
--

DROP TABLE IF EXISTS `core_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_user_groups_user_id_group_id_c82fcad1_uniq` (`user_id`,`group_id`),
  KEY `core_user_groups_group_id_fe8c697f_fk_auth_group_id` (`group_id`),
  CONSTRAINT `core_user_groups_group_id_fe8c697f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `core_user_groups_user_id_70b4d9b8_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_groups`
--

LOCK TABLES `core_user_groups` WRITE;
/*!40000 ALTER TABLE `core_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_user_permissions`
--

DROP TABLE IF EXISTS `core_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_user_user_permissions_user_id_permission_id_73ea0daa_uniq` (`user_id`,`permission_id`),
  KEY `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` (`permission_id`),
  CONSTRAINT `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `core_user_user_permissions_user_id_085123d3_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_user_permissions`
--

LOCK TABLES `core_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `core_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_core_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-12-05 15:35:10.823895','1','Clothes',1,'[{\"added\": {}}]',7,1),(2,'2023-12-05 21:17:21.034223','1','Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',1,'[{\"added\": {}}]',9,1),(3,'2023-12-05 21:17:49.982456','2','Mens Casual Premium Slim Fit T-Shirts',1,'[{\"added\": {}}]',9,1),(4,'2023-12-05 21:18:20.163266','3','Mens Cotton Jacket',1,'[{\"added\": {}}]',9,1),(5,'2023-12-05 21:19:08.697314','4','Mens Casual Slim Fit',1,'[{\"added\": {}}]',9,1),(6,'2023-12-05 21:19:33.369498','5','John Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet',1,'[{\"added\": {}}]',9,1),(7,'2023-12-05 21:19:49.621301','5','John Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',9,1),(8,'2023-12-05 21:20:26.833754','6','Solid Gold Petite Micropave',1,'[{\"added\": {}}]',9,1),(9,'2023-12-05 21:20:56.613179','7','SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s',1,'[{\"added\": {}}]',9,1),(10,'2023-12-05 21:51:23.156136','7','SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"ProductImage object (1)\"}}]',9,1),(11,'2023-12-05 22:09:00.762595','2','Shania Holz',1,'[{\"added\": {}}]',6,1),(12,'2023-12-05 22:20:51.747201','1','Order object (1)',1,'[{\"added\": {}}]',12,1),(13,'2023-12-05 22:23:06.592079','1','Order object (1)',2,'[{\"added\": {\"name\": \"order item\", \"object\": \"OrderItem object (1)\"}}]',12,1),(14,'2023-12-05 22:35:56.183890','8','White Gold Plated Princess',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"White Gold Plated Princess\"}}]',9,1),(15,'2023-12-05 22:36:40.434494','8','White Gold Plated Princess',2,'[{\"deleted\": {\"name\": \"product image\", \"object\": \"White Gold Plated Princess\"}}]',9,1),(16,'2023-12-05 22:37:20.286691','8','White Gold Plated Princess',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"White Gold Plated Princess\"}}]',9,1),(17,'2023-12-05 22:38:10.804588','9','Pierced Owl Rose Gold Plated Stainless Steel Double',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Pierced Owl Rose Gold Plated Stainless Steel Double\"}}]',9,1),(18,'2023-12-05 22:39:18.142165','10','WD 2TB Elements Portable External Hard Drive - USB 3.0',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"WD 2TB Elements Portable External Hard Drive - USB 3.0\"}}]',9,1),(19,'2023-12-05 22:39:44.751397','7','SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s',2,'[{\"changed\": {\"name\": \"product image\", \"object\": \"SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s\", \"fields\": [\"Image\"]}}]',9,1),(20,'2023-12-05 22:40:32.168801','11','Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5\"}}]',9,1),(21,'2023-12-05 22:41:19.109679','12','WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive\"}}]',9,1),(22,'2023-12-05 22:42:18.836549','13','Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin\"}}]',9,1),(23,'2023-12-05 22:43:00.923865','14','Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) – Super Ultrawide Screen QLED',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) \\u2013 Super Ultrawide Screen QLED\"}}]',9,1),(24,'2023-12-05 22:43:50.695711','15','BIYLACLESEN Women\'s 3-in-1 Snowboard Jacket Winter Coats\", \"price\": 56.99,',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"BIYLACLESEN Women\'s 3-in-1 Snowboard Jacket Winter Coats\\\", \\\"price\\\": 56.99,\"}}]',9,1),(25,'2023-12-05 22:44:29.043969','16','Lock and Love Women\'s Removable Hooded Faux Leather Moto Biker Jacket',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Lock and Love Women\'s Removable Hooded Faux Leather Moto Biker Jacket\"}}]',9,1),(26,'2023-12-05 22:45:03.937938','17','Rain Jacket Women Windbreaker Striped Climbing Raincoats',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Rain Jacket Women Windbreaker Striped Climbing Raincoats\"}}]',9,1),(27,'2023-12-05 22:45:51.023988','18','MBJ Women\'s Solid Short Sleeve Boat Neck V',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"MBJ Women\'s Solid Short Sleeve Boat Neck V\"}}]',9,1),(28,'2023-12-05 22:46:31.210363','19','Opna Women\'s Short Sleeve Moisture',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Opna Women\'s Short Sleeve Moisture\"}}]',9,1),(29,'2023-12-05 22:47:10.866262','20','DANVOUY Womens T Shirt Casual Cotton Short',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"DANVOUY Womens T Shirt Casual Cotton Short\"}}]',9,1),(30,'2023-12-05 22:54:22.075917','21','CARO-Möbel Polsterbett Ohio Bettgestell',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"CARO-M\\u00f6bel Polsterbett Ohio Bettgestell\"}}]',9,1),(31,'2023-12-05 22:55:59.016816','22','Flash Furniture office chair, Metal',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Flash Furniture office chair, Metal\"}}]',9,1),(32,'2023-12-05 22:56:22.862180','21','Polster Bed Ohio',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',9,1),(33,'2023-12-05 22:58:09.944795','23','Tokio V Corner Sofa with Sleep Function Best Sofa Bed Corner Couch Living Room Upholstered Furniture with Sleep Function Sofa Bed with Bed Box',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Tokio V Corner Sofa with Sleep Function Best Sofa Bed Corner Couch Living Room Upholstered Furniture with Sleep Function Sofa Bed with Bed Box\"}}]',9,1),(34,'2023-12-05 22:59:39.118822','24','Vasagle Shoe Bench with Seat Cushion',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Vasagle Shoe Bench with Seat Cushion\"}}]',9,1),(35,'2023-12-05 23:01:39.955697','25','Vans Men\'s Ward Trainers',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Vans Men\'s Ward Trainers\"}}]',9,1),(36,'2023-12-05 23:02:31.672860','26','Rieker Mens 38419-24 Fashion Boots',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"Rieker Mens 38419-24 Fashion Boots\"}}]',9,1),(37,'2023-12-05 23:03:26.694310','27','bugatti Herren Mattia Derbys',1,'[{\"added\": {}}]',9,1),(38,'2023-12-05 23:03:39.980162','27','bugatti Herren Mattia Derbys',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"bugatti Herren Mattia Derbys\"}}]',9,1),(39,'2023-12-05 23:05:25.987759','2','Order object (2)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"order item\", \"object\": \"OrderItem object (2)\"}}, {\"added\": {\"name\": \"order item\", \"object\": \"OrderItem object (3)\"}}]',12,1),(40,'2023-12-05 23:07:37.896770','3','Sharma Sharma',1,'[{\"added\": {}}]',6,1),(41,'2023-12-05 23:08:23.211671','3','Sonya Sharma',2,'[{\"changed\": {\"fields\": [\"First name\"]}}]',6,1),(42,'2023-12-05 23:09:10.863126','4','Ranbir Kapoor',1,'[{\"added\": {}}]',6,1),(43,'2023-12-05 23:13:42.963192','5','Salman Khan',1,'[{\"added\": {}}]',6,1),(44,'2023-12-05 23:14:53.922858','3','Order object (3)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"order item\", \"object\": \"OrderItem object (4)\"}}, {\"added\": {\"name\": \"order item\", \"object\": \"OrderItem object (5)\"}}]',12,1),(45,'2023-12-05 23:15:33.181515','4','Order object (4)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"order item\", \"object\": \"OrderItem object (6)\"}}]',12,1),(46,'2023-12-05 23:16:05.723912','5','Order object (5)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"order item\", \"object\": \"OrderItem object (7)\"}}, {\"added\": {\"name\": \"order item\", \"object\": \"OrderItem object (8)\"}}]',12,1),(47,'2023-12-06 19:07:01.262712','1','Admin Admin',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',6,1),(48,'2023-12-06 20:34:54.948522','6','Admin Admin',1,'[{\"added\": {}}]',14,1),(49,'2023-12-07 09:51:58.135767','3','Order object (3)',3,'',12,1),(50,'2023-12-07 09:51:58.144771','2','Order object (2)',3,'',12,1),(51,'2023-12-07 09:51:58.149768','1','Order object (1)',3,'',12,1),(52,'2023-12-08 22:20:11.444004','1','Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops\"}}]',9,1),(53,'2023-12-08 22:20:23.613880','2','Mens Casual Premium Slim Fit T-Shirts',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Mens Casual Premium Slim Fit T-Shirts\"}}]',9,1),(54,'2023-12-08 22:20:34.820544','3','Mens Cotton Jacket',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Mens Cotton Jacket\"}}]',9,1),(55,'2023-12-08 22:20:45.853494','4','Mens Casual Slim Fit',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Mens Casual Slim Fit\"}}]',9,1),(56,'2023-12-08 22:20:58.614510','5','John Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"John Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet\"}}]',9,1),(57,'2023-12-08 22:21:10.739307','6','Solid Gold Petite Micropave',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"Solid Gold Petite Micropave\"}}]',9,1),(58,'2023-12-12 10:57:53.633442','24','Vasagle Shoe Bench with Seat Cushion',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',9,1),(59,'2023-12-12 12:47:47.220546','10','asdf asdf',3,'',6,1),(60,'2023-12-12 12:47:47.227542','11','asdf asdf',3,'',6,1),(61,'2023-12-12 12:55:05.788576','12','Bob marley',3,'',6,1),(62,'2023-12-12 12:55:32.238011','13','sdgfsdafsdaf asdfsdaf',1,'[{\"added\": {}}]',6,1),(63,'2023-12-12 12:55:56.363082','13','sdgfsdafsdaf asdfsdaf',3,'',6,1),(64,'2023-12-12 13:10:42.462324','14','asdf Marley',3,'',6,1),(65,'2023-12-12 13:10:51.927749','15','sdafasdf adsfadsfsdaf',3,'',6,1),(66,'2023-12-12 13:19:22.370742','17',' ',3,'',6,1),(67,'2023-12-12 13:19:22.377748','16','dsaf dsasdfsdaf',3,'',6,1),(68,'2023-12-12 13:45:04.168246','20','asdfasdf asdfa',3,'',6,1),(69,'2023-12-12 13:45:04.176246','18','asdfsdafsdf asdfdsaf',3,'',6,1),(70,'2023-12-12 13:45:04.181244','19','asdfdsaf asdghsdf',3,'',6,1),(71,'2023-12-12 13:45:04.185246','21','adsfdasf asdfsdafsdf',3,'',6,1),(72,'2023-12-12 13:49:17.353302','22','Alia Bhatt',3,'',6,1),(73,'2023-12-12 13:49:17.359311','23','Christian Neuer',3,'',6,1),(74,'2023-12-12 15:27:40.183975','24','Christian Neuer',3,'',6,1),(75,'2023-12-12 16:25:49.009768','25','Christian Neuer',3,'',6,1),(76,'2023-12-12 16:27:56.302493','26','Christian Neuer',3,'',6,1),(77,'2023-12-12 16:43:40.259982','27','Christian Neuer',3,'',6,1),(78,'2023-12-12 16:45:41.705220','28','Christian Neuer',3,'',6,1),(79,'2023-12-12 16:47:14.941729','29','Christian Neuer',3,'',6,1),(80,'2023-12-12 16:47:44.888448','30','Christian Neuer',3,'',6,1),(81,'2023-12-12 16:53:03.692063','31','Christian Neuer',3,'',6,1),(82,'2023-12-12 17:28:41.501882','32','Christian Neuer',3,'',6,1),(83,'2023-12-12 18:00:39.681408','33','Christian Neuer',3,'',6,1),(84,'2023-12-12 18:01:41.251531','34','Christian Neuer',3,'',6,1),(85,'2023-12-12 18:02:43.317626','35','Christian Neuer',3,'',6,1),(86,'2023-12-12 18:22:08.502791','36','Christian Neuer',3,'',6,1),(87,'2023-12-12 18:26:12.269277','37','Christian Neuer',3,'',6,1),(88,'2023-12-12 18:48:49.585733','38','Christian Neuer',3,'',6,1),(89,'2023-12-12 18:52:07.767811','39','Christian Neuer',3,'',6,1),(90,'2023-12-12 18:53:38.033019','40','Christian Neuer',3,'',6,1),(91,'2023-12-12 18:57:23.770491','41','Christian Neuer',3,'',6,1),(92,'2023-12-12 21:25:03.278103','2','Shania Holz',2,'[]',6,1),(93,'2023-12-12 21:26:33.379543','42','Christian Neuer',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',6,1),(94,'2023-12-12 21:26:41.259431','9','Taylor Swift',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',6,1),(95,'2023-12-13 11:41:43.491248','44','Alia Bhatt',3,'',6,1),(96,'2023-12-13 11:45:47.717089','45','Alia Bhatt',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',6,1),(97,'2023-12-13 17:19:29.072826','42','Christian Neuer',3,'',6,1),(98,'2023-12-13 17:25:12.645988','46','Christian Neuer',3,'',6,1),(99,'2023-12-13 19:52:02.350714','48','asdf asdfsadf',3,'',6,1),(100,'2023-12-14 12:44:13.752656','49','asdf asdfsadf',3,'',6,1),(101,'2023-12-14 12:45:58.617703','50','asdf asdfsadf',3,'',6,1),(102,'2023-12-14 12:47:06.795489','51','asdf asdfsadf',3,'',6,1),(103,'2023-12-14 12:51:44.735061','52','asdf asdfsadf',3,'',6,1),(104,'2023-12-14 12:55:05.379277','53','asdf asdfsadf',3,'',6,1),(105,'2023-12-14 12:57:08.680320','54','asdf asdfsadf',3,'',6,1),(106,'2023-12-14 13:05:56.990371','55','asdf asdfsadf',3,'',6,1),(107,'2023-12-14 13:08:23.634816','56','asdf asdfsadf',3,'',6,1),(108,'2023-12-14 13:09:55.292849','57','asdf asdfsadf',3,'',6,1),(109,'2023-12-14 14:30:24.271503','58','asdf asdfsadf',3,'',6,1),(110,'2023-12-14 15:36:46.189867','59','asdf asdfsadf',3,'',6,1),(111,'2023-12-14 15:38:43.428652','60','asdf asdfsadf',3,'',6,1),(112,'2023-12-14 15:41:53.415468','61','asdf asdfsadf',3,'',6,1),(113,'2023-12-14 15:43:17.158796','62','asdf asdfsadf',3,'',6,1),(114,'2023-12-14 15:47:50.762359','43','dfasddf asdfadsf',3,'',6,1),(115,'2023-12-14 15:47:58.979548','63','asdf asdfsadf',3,'',6,1),(116,'2023-12-14 15:52:25.248377','64','asdf asdfsadf',3,'',6,1),(117,'2023-12-14 15:55:17.616418','65','asdf asdfsadf',3,'',6,1),(118,'2023-12-14 16:18:34.890388','66','asdf asdfsadf',3,'',6,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(6,'core','user'),(5,'sessions','session'),(13,'store','cart'),(11,'store','cartitem'),(7,'store','category'),(14,'store','customer'),(12,'store','order'),(15,'store','orderitem'),(9,'store','product'),(8,'store','productimage'),(10,'store','review');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-12-05 11:01:23.413301'),(2,'contenttypes','0002_remove_content_type_name','2023-12-05 11:01:23.551341'),(3,'auth','0001_initial','2023-12-05 11:01:24.034036'),(4,'auth','0002_alter_permission_name_max_length','2023-12-05 11:01:24.155030'),(5,'auth','0003_alter_user_email_max_length','2023-12-05 11:01:24.169031'),(6,'auth','0004_alter_user_username_opts','2023-12-05 11:01:24.181036'),(7,'auth','0005_alter_user_last_login_null','2023-12-05 11:01:24.194781'),(8,'auth','0006_require_contenttypes_0002','2023-12-05 11:01:24.200777'),(9,'auth','0007_alter_validators_add_error_messages','2023-12-05 11:01:24.214975'),(10,'auth','0008_alter_user_username_max_length','2023-12-05 11:01:24.232568'),(11,'auth','0009_alter_user_last_name_max_length','2023-12-05 11:01:24.249573'),(12,'auth','0010_alter_group_name_max_length','2023-12-05 11:01:24.290420'),(13,'auth','0011_update_proxy_permissions','2023-12-05 11:01:24.307418'),(14,'auth','0012_alter_user_first_name_max_length','2023-12-05 11:01:24.321426'),(15,'core','0001_initial','2023-12-05 11:01:24.867454'),(16,'admin','0001_initial','2023-12-05 11:01:25.233406'),(17,'admin','0002_logentry_remove_auto_add','2023-12-05 11:01:25.249410'),(18,'admin','0003_logentry_add_action_flag_choices','2023-12-05 11:01:25.268412'),(19,'sessions','0001_initial','2023-12-05 11:01:25.348452'),(20,'store','0001_initial','2023-12-05 15:30:21.262394'),(21,'store','0002_cart_customer_order_orderitem_review_cartitem','2023-12-05 18:28:17.691298'),(22,'store','0003_alter_orderitem_order_alter_orderitem_product','2023-12-07 09:22:46.651393'),(23,'core','0002_alter_user_email_alter_user_first_name_and_more','2023-12-12 13:22:32.141964'),(24,'core','0003_alter_user_managers_alter_user_email_and_more','2023-12-16 14:28:13.275023'),(25,'store','0004_cart_customer','2023-12-16 14:28:13.401171'),(26,'store','0005_remove_cart_customer','2023-12-16 20:34:56.723084'),(27,'store','0006_cart_customer','2023-12-16 20:37:22.672132'),(28,'store','0007_remove_cart_customer','2023-12-16 20:54:38.031380');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('bksq7ek0lm1c34uxmmfbhm2pbqlhi6ur','.eJxVjMsOwiAQRf-FtSFMoTxcuvcbyDADUjU0Ke3K-O_apAvd3nPOfYmI21rj1vMSJxZnMYjT75aQHrntgO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddv7ZkIk7LAavQFgwbHDG40xSIQDyXp4GxCQE8akkeNSNlkG8goKCzeHwJhON0:1rEViY:rqn3m6fwKHHqEq7d62g_XheqCvE_7wbg7Y5MNLWy4SA','2023-12-30 14:32:38.579296');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_cart`
--

DROP TABLE IF EXISTS `store_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_cart` (
  `id` char(32) NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_cart`
--

LOCK TABLES `store_cart` WRITE;
/*!40000 ALTER TABLE `store_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_cartitem`
--

DROP TABLE IF EXISTS `store_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_cartitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` smallint unsigned NOT NULL,
  `cart_id` char(32) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_cartitem_cart_id_product_id_bd38e607_uniq` (`cart_id`,`product_id`),
  KEY `store_cartitem_product_id_4238d443_fk_store_product_id` (`product_id`),
  CONSTRAINT `store_cartitem_cart_id_4f60ac05_fk_store_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `store_cart` (`id`),
  CONSTRAINT `store_cartitem_product_id_4238d443_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`),
  CONSTRAINT `store_cartitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_cartitem`
--

LOCK TABLES `store_cartitem` WRITE;
/*!40000 ALTER TABLE `store_cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_category`
--

DROP TABLE IF EXISTS `store_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_category`
--

LOCK TABLES `store_category` WRITE;
/*!40000 ALTER TABLE `store_category` DISABLE KEYS */;
INSERT INTO `store_category` VALUES (1,'Clothes'),(2,'electronics'),(3,'Furniture'),(6,'Jewelery'),(5,'Miscellaneous'),(4,'Shoes');
/*!40000 ALTER TABLE `store_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_customer`
--

DROP TABLE IF EXISTS `store_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `birth_date` date DEFAULT NULL,
  `membership` varchar(1) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `store_customer_user_id_04276401_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_customer`
--

LOCK TABLES `store_customer` WRITE;
/*!40000 ALTER TABLE `store_customer` DISABLE KEYS */;
INSERT INTO `store_customer` VALUES (1,NULL,'P',2),(2,NULL,'N',3),(3,NULL,'N',4),(4,NULL,'N',5),(5,NULL,'N',6),(6,'1990-10-01','P',1),(7,NULL,'N',7),(8,NULL,'N',8),(9,NULL,'N',9),(45,NULL,'N',45),(47,NULL,'N',47),(67,NULL,'N',67);
/*!40000 ALTER TABLE `store_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_order`
--

DROP TABLE IF EXISTS `store_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `placed_on` datetime(6) NOT NULL,
  `payment_status` varchar(1) NOT NULL,
  `customer_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_order_customer_id_13d6d43e_fk_store_customer_id` (`customer_id`),
  CONSTRAINT `store_order_customer_id_13d6d43e_fk_store_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `store_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_order`
--

LOCK TABLES `store_order` WRITE;
/*!40000 ALTER TABLE `store_order` DISABLE KEYS */;
INSERT INTO `store_order` VALUES (40,'2023-12-20 13:10:43.641657','C',1),(41,'2023-12-20 13:29:10.759203','C',1),(42,'2023-12-20 13:33:28.567422','C',1);
/*!40000 ALTER TABLE `store_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_orderitem`
--

DROP TABLE IF EXISTS `store_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` smallint unsigned NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_orderitem_order_id_acf8722d_fk_store_order_id` (`order_id`),
  KEY `store_orderitem_product_id_f2b098d4_fk_store_product_id` (`product_id`),
  CONSTRAINT `store_orderitem_order_id_acf8722d_fk_store_order_id` FOREIGN KEY (`order_id`) REFERENCES `store_order` (`id`),
  CONSTRAINT `store_orderitem_product_id_f2b098d4_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`),
  CONSTRAINT `store_orderitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_orderitem`
--

LOCK TABLES `store_orderitem` WRITE;
/*!40000 ALTER TABLE `store_orderitem` DISABLE KEYS */;
INSERT INTO `store_orderitem` VALUES (35,2,40,2),(36,1,40,8),(37,1,41,2),(38,1,41,20),(39,1,42,7),(40,1,42,10);
/*!40000 ALTER TABLE `store_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_product`
--

DROP TABLE IF EXISTS `store_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(300) NOT NULL,
  `description` longtext,
  `price` decimal(6,2) NOT NULL,
  `date_created` date NOT NULL,
  `last_updated` date NOT NULL,
  `inventory` int NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `store_product_category_id_574bae65_fk_store_category_id` (`category_id`),
  KEY `store_product_slug_6de8ee4b` (`slug`),
  CONSTRAINT `store_product_category_id_574bae65_fk_store_category_id` FOREIGN KEY (`category_id`) REFERENCES `store_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_product`
--

LOCK TABLES `store_product` WRITE;
/*!40000 ALTER TABLE `store_product` DISABLE KEYS */;
INSERT INTO `store_product` VALUES (1,'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops','fjallraven-foldsack-no-1-backpack-fits-15-laptops','Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday',99.99,'2023-12-05','2023-12-08',80,1),(2,'Mens Casual Premium Slim Fit T-Shirts','mens-casual-premium-slim-fit-t-shirts','Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.',89.90,'2023-12-05','2023-12-08',55,1),(3,'Mens Cotton Jacket','mens-cotton-jacket','great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.\",\r\n\"category\": \"men\'s clothing',129.90,'2023-12-05','2023-12-08',45,1),(4,'Mens Casual Slim Fit','mens-casual-slim-fit','The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.',79.90,'2023-12-05','2023-12-08',90,1),(5,'John Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet','john-hardy-womens-legends-naga-gold-silver-dragon-station-chain-bracelet','From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean\'s pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.',69.90,'2023-12-05','2023-12-08',35,6),(6,'Solid Gold Petite Micropave','solid-gold-petite-micropave','Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.',199.90,'2023-12-05','2023-12-08',100,6),(7,'SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s','sandisk-ssd-plus-1tb-internal-ssd-sata-iii-6-gbs','Easy upgrade for faster boot up, shutdown, application load and response (As compared to 5400 RPM SATA 2.5” hard drive; Based on published specifications and internal benchmarking tests using PCMark vantage scores) Boosts burst write performance, making it ideal for typical PC workloads The perfect balance of performance and reliability Read/write speeds of up to 535MB/s/450MB/s (Based on internal testing; Performance may vary depending upon drive capacity, host device, OS and application.)',229.90,'2023-12-05','2023-12-05',70,2),(8,'White Gold Plated Princess','white-gold-plated-princess','Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine\'s Day...',59.99,'2023-12-05','2023-12-05',25,6),(9,'Pierced Owl Rose Gold Plated Stainless Steel Double','pierced-owl-rose-gold-plated-stainless-steel-double','Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel',79.99,'2023-12-05','2023-12-05',20,6),(10,'WD 2TB Elements Portable External Hard Drive - USB 3.0','wd-2tb-elements-portable-external-hard-drive-usb-30','USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7; Reformatting may be required for other operating systems; Compatibility may vary depending on user’s hardware configuration and operating system.',199.99,'2023-12-05','2023-12-05',9,2),(11,'Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5','silicon-power-256gb-ssd-3d-nand-a55-slc-cache-performance-boost-sata-iii-25','3D NAND flash are applied to deliver high transfer speeds Remarkable transfer speeds that enable faster bootup and improved overall system performance. The advanced SLC Cache Technology allows performance boost and longer lifespan 7mm slim design suitable for Ultrabooks and Ultra-slim notebooks. Supports TRIM command, Garbage Collection technology, RAID, and ECC (Error Checking & Correction) to provide the optimized performance and enhanced reliability.',99.99,'2023-12-05','2023-12-05',8,2),(12,'WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive','wd-4tb-gaming-drive-works-with-playstation-4-portable-external-hard-drive','Expand your PS4 gaming experience, Play anywhere Fast and easy, setup Sleek design with high capacity, 3-year manufacturer\'s limited warranty',249.90,'2023-12-05','2023-12-05',9,2),(13,'Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin','acer-sb220q-bi-215-inches-full-hd-1920-x-1080-ips-ultra-thin','21. 5 inches Full HD (1920 x 1080) widescreen IPS display And Radeon free Sync technology. No compatibility for VESA Mount Refresh Rate: 75Hz - Using HDMI port Zero-frame design | ultra-thin | 4ms response time | IPS panel Aspect ratio - 16: 9. Color Supported - 16. 7 million colors. Brightness - 250 nit Tilt angle -5 degree to 15 degree. Horizontal viewing angle-178 degree. Vertical viewing angle-178 degree 75 hertz.',399.99,'2023-12-05','2023-12-05',7,2),(14,'Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) – Super Ultrawide Screen QLED','samsung-49-inch-chg90-144hz-curved-gaming-monitor-lc49hg90dmnxza-super-ultrawide-screen-qled','49 INCH SUPER ULTRAWIDE 32:9 CURVED GAMING MONITOR with dual 27 inch screen side by side QUANTUM DOT (QLED) TECHNOLOGY, HDR support and factory calibration provides stunningly realistic and accurate color and contrast 144HZ HIGH REFRESH RATE and 1ms ultra fast response time work to eliminate motion blur, ghosting, and reduce input lag',599.99,'2023-12-05','2023-12-05',11,2),(15,'BIYLACLESEN Women\'s 3-in-1 Snowboard Jacket Winter Coats\", \"price\": 56.99,','biylaclesen-womens-3-in-1-snowboard-jacket-winter-coats-price-5699','Note:The Jackets is US standard size, Please choose size as your usual wear Material: 100% Polyester; Detachable Liner Fabric: Warm Fleece. Detachable Functional Liner: Skin Friendly, Lightweigt and Warm.Stand Collar Liner jacket, keep you warm in cold weather. Zippered Pockets: 2 Zippered Hand Pockets, 2 Zippered Pockets on Chest (enough to keep cards or keys)and 1 Hidden Pocket Inside.Zippered Hand Pockets and Hidden Pocket keep your things secure. Humanized Design: Adjustable and Detachable Hood and Adjustable cuff to prevent the wind and water,for a comfortable fit. 3 in 1 Detachable Design provide more convenience, you can separate the coat and inner as needed, or wear it together. It is suitable for different season and help you adapt to different climates.',69.90,'2023-12-05','2023-12-05',7,1),(16,'Lock and Love Women\'s Removable Hooded Faux Leather Moto Biker Jacket','lock-and-love-womens-removable-hooded-faux-leather-moto-biker-jacket','100% POLYURETHANE(shell) 100% POLYESTER(lining) 75% POLYESTER 25% COTTON (SWEATER), Faux leather material for style and comfort / 2 pockets of front, 2-For-One Hooded denim style faux leather jacket, Button detail on waist / Detail stitching at sides, HAND WASH ONLY / DO NOT BLEACH / LINE DRY / DO NOT IRON.',79.90,'2023-12-05','2023-12-05',20,1),(17,'Rain Jacket Women Windbreaker Striped Climbing Raincoats','rain-jacket-women-windbreaker-striped-climbing-raincoats','Lightweight perfet for trip or casual wear---Long sleeve with hooded, adjustable drawstring waist design. Button and zipper front closure raincoat, fully stripes Lined and The Raincoat has 2 side pockets are a good size to hold all kinds of things, it covers the hips, and the hood is generous but doesn\'t overdo it.Attached Cotton Lined Hood with Adjustable Drawstrings give it a real styled look.',89.90,'2023-12-05','2023-12-05',30,1),(18,'MBJ Women\'s Solid Short Sleeve Boat Neck V','mbj-womens-solid-short-sleeve-boat-neck-v','95% RAYON 5% SPANDEX, Made in USA or Imported, Do Not Bleach, Lightweight fabric with great stretch for comfort, Ribbed on sleeves and neckline / Double stitching on bottom hem.',49.90,'2023-12-05','2023-12-05',14,1),(19,'Opna Women\'s Short Sleeve Moisture','opna-womens-short-sleeve-moisture','100% Polyester, Machine wash, 100% cationic polyester interlock, Machine Wash & Pre Shrunk for a Great Fit, Lightweight, roomy and highly breathable with moisture wicking fabric which helps to keep moisture away, Soft Lightweight Fabric with comfortable V-neck collar and a slimmer fit, delivers a sleek, more feminine silhouette and Added Comfort.',39.49,'2023-12-05','2023-12-05',40,1),(20,'DANVOUY Womens T Shirt Casual Cotton Short','danvouy-womens-t-shirt-casual-cotton-short','95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print,V-Neck,Fashion Tees, The fabric is soft and has some stretch., Occasion: Casual/Office/Beach/School/Home/Street. Season: Spring,Summer,Autumn,Winter',59.00,'2023-12-05','2023-12-05',23,1),(21,'Polster Bed Ohio','polster-bed-ohio','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et odio pellentesque diam volutpat commodo sed egestas egestas. Lorem ipsum dolor sit amet consectetur. At tempor commodo ullamcorper a. Pharetra massa massa ultricies mi quis hendrerit dolor magna eget. Augue neque gravida in fermentum et.',150.00,'2023-12-05','2023-12-05',12,3),(22,'Flash Furniture office chair, Metal','flash-furniture-office-chair-metal','Lorem ipsum dolor sit amet consectetur. At tempor commodo ullamcorper a. Pharetra massa massa ultricies mi quis hendrerit dolor magna eget. Augue neque gravida in fermentum et. Mattis nunc sed blandit libero volutpat sed. Nec dui nunc mattis enim ut tellus elementum sagittis vitae.',189.00,'2023-12-05','2023-12-05',6,3),(23,'Tokio V Corner Sofa with Sleep Function Best Sofa Bed Corner Couch Living Room Upholstered Furniture with Sleep Function Sofa Bed with Bed Box','tokio-v-corner-sofa-with-sleep-function-best-sofa-bed-corner-couch-living-room-upholstered-furniture-with-sleep-function-sofa-bed-with-bed-box','The focus of your living room should be comfortable and functional upholstered furniture. The furniture should attract the attention of every guest. The reliable DL machine helps you open and fold the furniture every time. Corner sofa with sleeping function. Corner sofa with sleeping function and bed box.',179.90,'2023-12-05','2023-12-05',18,3),(24,'Vasagle Shoe Bench with Seat Cushion','vasagle-shoe-bench-with-seat-cushion','Do you regularly get out of balance when putting on your shoes? Sit comfortably on this padded shoe bench and tie your shoes effortlessly. The robust structure made of chipboard can hold up to 150 kg. The removable faux linen cover is easy to clean',45.90,'2023-12-05','2023-12-12',7,3),(25,'Vans Men\'s Ward Trainers','vans-mens-ward-trainers','Lorem ipsum dolor sit amet consectetur adipiscing elit ut aliquam. Pellentesque id nibh tortor id aliquet lectus proin nibh. Eget nunc scelerisque viverra mauris. Ut ornare lectus sit amet.',45.00,'2023-12-06','2023-12-06',19,4),(26,'Rieker Mens 38419-24 Fashion Boots','rieker-mens-38419-24-fashion-boots','Laoreet suspendisse interdum consectetur libero. Facilisis mauris sit amet massa. Nisl vel pretium lectus quam id leo in. Odio eu feugiat pretium nibh ipsum consequat nisl vel.',64.90,'2023-12-06','2023-12-06',24,4),(27,'bugatti Herren Mattia Derbys','bugatti-herren-mattia-derbys','Aliquet porttitor lacus luctus accumsan tortor. Non odio euismod lacinia at quis risus sed.',69.00,'2023-12-06','2023-12-06',9,4);
/*!40000 ALTER TABLE `store_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_productimage`
--

DROP TABLE IF EXISTS `store_productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_productimage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_productimage_product_id_e50e4046_fk_store_product_id` (`product_id`),
  CONSTRAINT `store_productimage_product_id_e50e4046_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_productimage`
--

LOCK TABLES `store_productimage` WRITE;
/*!40000 ALTER TABLE `store_productimage` DISABLE KEYS */;
INSERT INTO `store_productimage` VALUES (1,'mybazaar/images/10_1.jpg',7),(3,'mybazaar/images/7_1_xuU5EXG.jpg',8),(4,'mybazaar/images/8_1.jpg',9),(5,'mybazaar/images/9_1_y9AKgjB.jpg',10),(6,'mybazaar/images/11_1.jpg',11),(7,'mybazaar/images/12_1.jpg',12),(8,'mybazaar/images/13_1.jpg',13),(9,'mybazaar/images/14_1.jpg',14),(10,'mybazaar/images/15_1.jpg',15),(11,'mybazaar/images/16_1.jpg',16),(12,'mybazaar/images/17_1.jpg',17),(13,'mybazaar/images/18_1.jpg',18),(14,'mybazaar/images/19_1.jpg',19),(15,'mybazaar/images/20_1.jpg',20),(16,'mybazaar/images/bed1.jpg',21),(17,'mybazaar/images/chair1.jpg',22),(18,'mybazaar/images/sofa1.jpg',23),(19,'mybazaar/images/shoe_bench1.jpg',24),(20,'mybazaar/images/shoe1.jpg',25),(21,'mybazaar/images/shoe2.jpg',26),(22,'mybazaar/images/shoe3.jpg',27),(23,'mybazaar/images/1_1.jpg',1),(24,'mybazaar/images/2_1.jpg',2),(25,'mybazaar/images/3_1.jpg',3),(26,'mybazaar/images/4.jpg',4),(27,'mybazaar/images/5_1.jpg',5),(28,'mybazaar/images/6_1.jpg',6);
/*!40000 ALTER TABLE `store_productimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_review`
--

DROP TABLE IF EXISTS `store_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `date` date NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_review_product_id_abc413b2_fk_store_product_id` (`product_id`),
  CONSTRAINT `store_review_product_id_abc413b2_fk_store_product_id` FOREIGN KEY (`product_id`) REFERENCES `store_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_review`
--

LOCK TABLES `store_review` WRITE;
/*!40000 ALTER TABLE `store_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-21 12:08:47
