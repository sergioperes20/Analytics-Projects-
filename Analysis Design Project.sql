-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: captiosus
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `brandID` int NOT NULL,
  `brand_name` varchar(45) NOT NULL,
  `brand_headquarters` varchar(90) NOT NULL,
  `headquarters_address` varchar(60) NOT NULL,
  PRIMARY KEY (`brandID`),
  KEY `index` (`brandID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'SpeedX','Spain','Avda. de Concha Espina 1, 28036; Madrid '),(2,'Haussmart','USA','21420 Second Path Street, Miami, FL'),(3,'Xpbeta','Brazil','Rua T-29 N 74 Apto 703 Ed Tayama '),(4,'OregonPW','Neitherlands','Nieuwe Nieuwstraat 32HS, Amsterdam');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel` (
  `channelID` int NOT NULL AUTO_INCREMENT,
  `channel_type` varchar(45) NOT NULL,
  `IP_address` varchar(45) NOT NULL,
  `orderID` char(3) NOT NULL,
  PRIMARY KEY (`channelID`),
  UNIQUE KEY `IP_address_UNIQUE` (`IP_address`),
  KEY `foreign4_idx` (`orderID`),
  KEY `INDEX` (`channelID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` VALUES (7,'Webpage Ads','192.168.1.16','A55'),(9,'Google','195.145.1.16','B56'),(11,'Instagram','197.150.1.26','E27'),(13,'Facebook','192.168.1.91','K23'),(17,'Twitter','145.168.5.80','O45');
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerprofile`
--

DROP TABLE IF EXISTS `customerprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerprofile` (
  `customerID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` tinytext NOT NULL,
  `address` varchar(80) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  PRIMARY KEY (`customerID`),
  KEY `index` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerprofile`
--

LOCK TABLES `customerprofile` WRITE;
/*!40000 ALTER TABLE `customerprofile` DISABLE KEYS */;
INSERT INTO `customerprofile` VALUES (20,'sergo126','Accepted2024','1600 Taft street, Miami, FL','Sergio','Peres','118156037572'),(21,'thiago22','Valeria22','21420 Miami Street, Ives, FL ','Thiago','Bandeira','18235677889'),(22,'ronilda57','Vaoor57275','34560 Hollywood Street, Davie, FL','Ronilda','Santos','18906786657'),(23,'junior85','Valencia56789','23486 Boulevar Down, States,  AZ','Junior ','Almeida','15674833231'),(24,'bruno56','Familia19083','1200 Space Street, New York, NY','Bruno','Silva','18907654532');
/*!40000 ALTER TABLE `customerprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `orderID` char(3) NOT NULL,
  `order_date` datetime NOT NULL,
  `paymentID` varchar(5) NOT NULL,
  `shipperID` int NOT NULL,
  `shopping_sessionID` bigint NOT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`orderID`),
  UNIQUE KEY `orderID_UNIQUE` (`orderID`),
  KEY `index` (`orderID`) /*!80000 INVISIBLE */,
  KEY `index_idx` (`order_date`),
  KEY `foreign_idx9` (`shipperID`),
  KEY `index2` (`username`) /*!80000 INVISIBLE */,
  CONSTRAINT `foreign2` FOREIGN KEY (`username`) REFERENCES `customerprofile` (`username`),
  CONSTRAINT `foreign5` FOREIGN KEY (`orderID`) REFERENCES `channel` (`orderID`),
  CONSTRAINT `foreign9` FOREIGN KEY (`shipperID`) REFERENCES `shipper` (`shipperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('A55','2023-01-29 14:54:00','D',60,4000,'junior85'),('B56','2023-01-22 13:34:50','B',70,5670,'bruno56'),('E27','2022-11-21 13:23:44','A',30,2001,'sergo126'),('K23','2022-10-29 14:56:59','E',50,3000,'ronilda57'),('O45','2022-11-10 15:45:21','C',40,2500,'thiago22');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `orderdetailsID` int NOT NULL AUTO_INCREMENT,
  `productID` bigint NOT NULL,
  `orderID` char(3) NOT NULL,
  `quantity` int NOT NULL,
  `total_purchase` decimal(7,2) NOT NULL,
  PRIMARY KEY (`orderdetailsID`,`orderID`),
  KEY `foreign_idx` (`productID`),
  KEY `foreign3_idx` (`total_purchase`),
  CONSTRAINT `foreign 2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`),
  CONSTRAINT `foreign3` FOREIGN KEY (`total_purchase`) REFERENCES `payment` (`total_amount`)
) ENGINE=InnoDB AUTO_INCREMENT=1251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1050,567,'E27',5,3947.80),(1077,231,'O45',1,967.70),(1100,231,'K23',4,3870.80),(1200,345,'A55',2,695.36),(1250,456,'B56',2,471.56);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `paymentID` varchar(5) NOT NULL,
  `payment_type` varchar(45) NOT NULL,
  `status` varchar(30) NOT NULL,
  `total_amount` decimal(7,2) NOT NULL,
  PRIMARY KEY (`paymentID`,`payment_type`),
  KEY `index` (`total_amount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('A','Credit Card','Processing',3947.80),('B','Debit Card','Confirmed',471.56),('C','Online Deposit','Confirmed',967.70),('D','Bank Transfer','Processing',695.36),('E','CashApp','Confirmed',3870.80);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productID` bigint NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `brandID` int NOT NULL,
  `unitprice` decimal(5,2) NOT NULL,
  PRIMARY KEY (`productID`),
  KEY `foreign_idx` (`brandID`),
  KEY `index` (`productID`),
  CONSTRAINT `foreign` FOREIGN KEY (`brandID`) REFERENCES `brand` (`brandID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (231,'Verzona67',4,967.70),(345,'Xphone10',2,347.68),(456,'verona',1,235.78),(567,'XmindY45',3,789.56);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referral`
--

DROP TABLE IF EXISTS `referral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referral` (
  `referralID` bigint NOT NULL AUTO_INCREMENT,
  `referral_type` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `channelID` int NOT NULL,
  PRIMARY KEY (`referralID`),
  KEY `foreign4_idx` (`channelID`) /*!80000 INVISIBLE */,
  KEY `foreign3_idx` (`username`),
  CONSTRAINT `foreifn4` FOREIGN KEY (`username`) REFERENCES `customerprofile` (`username`),
  CONSTRAINT `foreign4` FOREIGN KEY (`channelID`) REFERENCES `channel` (`channelID`)
) ENGINE=InnoDB AUTO_INCREMENT=789608 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referral`
--

LOCK TABLES `referral` WRITE;
/*!40000 ALTER TABLE `referral` DISABLE KEYS */;
INSERT INTO `referral` VALUES (23567,'Social Media','sergo126',11),(45678,'Social Media','thiago22',17),(123678,'Social Media','ronilda57',13),(564738,'WebSite','bruno56',9),(789607,'OnlineAd','junior85',7);
/*!40000 ALTER TABLE `referral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipper`
--

DROP TABLE IF EXISTS `shipper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipper` (
  `shipperID` int NOT NULL,
  `company_name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `contact_info` varchar(14) NOT NULL,
  `shipping_type` varchar(45) NOT NULL,
  PRIMARY KEY (`shipperID`),
  KEY `index` (`shipperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipper`
--

LOCK TABLES `shipper` WRITE;
/*!40000 ALTER TABLE `shipper` DISABLE KEYS */;
INSERT INTO `shipper` VALUES (30,'FAD Speedy','Miami, USA','17865900989','Express shipping'),(40,'MLX Express','Boston, USA','18097899089','Express shipping'),(50,'OPA United','Chicago, USA','12334455678','Same-Day Delivery'),(60,'Corona2022','Barcelona, Spain','235678904545','International shipping'),(70,'Vertex AB','Goiania, Brazil','55997262900','International shipping');
/*!40000 ALTER TABLE `shipper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_session`
--

DROP TABLE IF EXISTS `shopping_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_session` (
  `shopping_sessionID` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `total_amount` decimal(7,2) NOT NULL,
  `order_date` datetime NOT NULL,
  PRIMARY KEY (`shopping_sessionID`),
  KEY `index2` (`shopping_sessionID`),
  KEY `index` (`total_amount`) /*!80000 INVISIBLE */,
  KEY `index4` (`order_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5671 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_session`
--

LOCK TABLES `shopping_session` WRITE;
/*!40000 ALTER TABLE `shopping_session` DISABLE KEYS */;
INSERT INTO `shopping_session` VALUES (2001,'sergo126',3947.80,'2022-11-21 13:23:44'),(2500,'thiago22',967.70,'2022-11-10 15:45:21'),(3000,'ronilda57',3870.80,'2022-10-29 14:56:59'),(4000,'junior85',695.36,'2023-01-29 14:54:00'),(5670,'bruno56',471.56,'2023-01-22 13:34:50');
/*!40000 ALTER TABLE `shopping_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-23 16:20:31
