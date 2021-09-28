-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: gms
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `contact` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'sundar','sundar12','NULL');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `catid` int(11) NOT NULL AUTO_INCREMENT,
  `catname` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Chocolate','Yes'),(2,'Noodles','Yes'),(5,'Wheat','No'),(7,'Rice','Yes'),(9,'detergent','Yes');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `location` varchar(50) NOT NULL,
  `gender` varchar(20) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (5,'Bivek','981222102','gangabu','Male');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `prodid` int(11) NOT NULL AUTO_INCREMENT,
  `prodname` varchar(50) DEFAULT NULL,
  `mfgdate` varchar(100) DEFAULT NULL,
  `expirydate` varchar(100) DEFAULT NULL,
  `catidfk` int(11) NOT NULL,
  PRIMARY KEY (`prodid`),
  KEY `catidfk` (`catidfk`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`catidfk`) REFERENCES `category` (`catid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (4,'Wai Wai','30 Aug 2019 18:15:00 ','8 Sep 2020 18:15:00 ',2),(5,'Gyan Chakki Aata','5 Oct 2019 11:05:26 ','9 Oct 2020 11:05:33 ',5),(7,'kitkat','1 Jun 2020 18:15:00 ','11 Jun 2025 01:31:57 ',1),(8,'Ramen korean','15 Jun 2021 21:51:47 ','22 Jun 2023 18:15:00 ',2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productprice`
--

DROP TABLE IF EXISTS `productprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productprice` (
  `price_id` int(11) NOT NULL AUTO_INCREMENT,
  `buying_price` float NOT NULL,
  `profit_percentage` float NOT NULL,
  `discount_percentage` float NOT NULL,
  `final_sp` float NOT NULL,
  `prod_id_fk` int(11) NOT NULL,
  PRIMARY KEY (`price_id`),
  KEY `prod_id_fk` (`prod_id_fk`),
  CONSTRAINT `productprice_ibfk_1` FOREIGN KEY (`prod_id_fk`) REFERENCES `product` (`prodid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productprice`
--

LOCK TABLES `productprice` WRITE;
/*!40000 ALTER TABLE `productprice` DISABLE KEYS */;
INSERT INTO `productprice` VALUES (3,145,20,5,166.75,5),(4,50,10,5,52.5,7);
/*!40000 ALTER TABLE `productprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseinvoice`
--

DROP TABLE IF EXISTS `purchaseinvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchaseinvoice` (
  `invoiceid` int(11) NOT NULL AUTO_INCREMENT,
  `supplier` varchar(50) DEFAULT NULL,
  `productid` int(11) NOT NULL,
  `product` varchar(50) DEFAULT NULL,
  `perunitprice` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`invoiceid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseinvoice`
--

LOCK TABLES `purchaseinvoice` WRITE;
/*!40000 ALTER TABLE `purchaseinvoice` DISABLE KEYS */;
INSERT INTO `purchaseinvoice` VALUES (1,'ABCD',3,'Cadburry Dairy milk',200,121,240),(2,'Shree Ridhi Sidhi Store',4,'Wai Wai',20,120,2400),(8,'Shree Ridhi Sidhi Store',5,'Gyan Chakki Aata',40,120,4800),(9,'Shree Ridhi Sidhi Store',4,'Wai Wai',20,100,2000);
/*!40000 ALTER TABLE `purchaseinvoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sales_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`sales_id`),
  KEY `product` (`product`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`product`) REFERENCES `product` (`prodid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_detail`
--

DROP TABLE IF EXISTS `sales_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_detail` (
  `sales_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_id` int(11) NOT NULL,
  `amt_given` float NOT NULL,
  `discount` float NOT NULL,
  `returned_amt` float NOT NULL,
  PRIMARY KEY (`sales_detail_id`),
  KEY `sales_detail_ibfk_1` (`sales_id`),
  CONSTRAINT `sales_detail_ibfk_1` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`sales_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_detail`
--

LOCK TABLES `sales_detail` WRITE;
/*!40000 ALTER TABLE `sales_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_refund`
--

DROP TABLE IF EXISTS `sales_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_refund` (
  `refund_id` int(11) NOT NULL AUTO_INCREMENT,
  `refund_amt` float NOT NULL,
  `refund_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `refund_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`refund_id`),
  KEY `sales_refund_ibfk_1` (`refund_product`),
  CONSTRAINT `sales_refund_ibfk_1` FOREIGN KEY (`refund_product`) REFERENCES `product` (`prodid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_refund`
--

LOCK TABLES `sales_refund` WRITE;
/*!40000 ALTER TABLE `sales_refund` DISABLE KEYS */;
INSERT INTO `sales_refund` VALUES (1,1665.5,5,10,'2021-09-27 03:28:48');
/*!40000 ALTER TABLE `sales_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(30) NOT NULL,
  `staff_password` varchar(30) NOT NULL,
  `phone_no` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'himal','himal@12','9804459171','hhpandey@gmail.com','Active'),(11,'David123','David123','9239290920','david12@gmail.com','Active'),(12,'Yajju12','Yajju12','9892932923','yajju12@gmail.com','Active'),(13,'bivek12','Bivek12','9811211231','bvek@gmail.com','Active'),(14,'shyam12','Shyam@12','9812222109','sam@gmaa.co','Active');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `quantity_available` int(11) NOT NULL,
  PRIMARY KEY (`stock_id`),
  UNIQUE KEY `product` (`product`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`product`) REFERENCES `product` (`prodid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (4,5,200);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `supplierid` int(11) NOT NULL AUTO_INCREMENT,
  `suppliername` varchar(50) DEFAULT NULL,
  `contactperson` varchar(50) DEFAULT NULL,
  `phoneno` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `panno` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`supplierid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (2,'ABCD','hari','9829389829','gongabu','12-233-1233','Active'),(3,'Shree Ridhi Sidhi Store','Hem Bahadhur','12838919','Bhairahawa','901929','Active'),(4,'New Pasa Shop','Pasa dai','988191918','duwakot','818182','Active'),(5,'patel supplier brothers','patel bhai','9812129012','biratnagar','80121012','Active');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-28  2:08:31
