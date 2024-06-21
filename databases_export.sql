-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: financemanagement
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `big_product_agency`
--

DROP TABLE IF EXISTS `big_product_agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `big_product_agency` (
  `Date` date DEFAULT NULL,
  `Invoice/Bill_No` varchar(50) DEFAULT NULL,
  `Bill_Amount` decimal(10,2) DEFAULT NULL,
  `Transaction` enum('Credit','Debit') DEFAULT NULL,
  `Total_Credit_Amount` decimal(10,2) DEFAULT NULL,
  `Total_Debit_Amount` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) GENERATED ALWAYS AS ((`Total_Credit_Amount` - `Total_Debit_Amount`)) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `big_product_agency`
--

LOCK TABLES `big_product_agency` WRITE;
/*!40000 ALTER TABLE `big_product_agency` DISABLE KEYS */;
INSERT INTO `big_product_agency` (`Date`, `Invoice/Bill_No`, `Bill_Amount`, `Transaction`, `Total_Credit_Amount`, `Total_Debit_Amount`) VALUES ('2024-05-02','BP001',50000.00,'Credit',50000.00,0.00),('2024-05-06','BP002',30000.00,'Debit',0.00,30000.00),('2024-05-11','BP003',45000.00,'Credit',45000.00,0.00),('2024-05-16','BP004',35000.00,'Debit',0.00,35000.00),('2024-05-21','BP005',60000.00,'Credit',60000.00,0.00),('2024-05-26','BP006',40000.00,'Debit',0.00,40000.00);
/*!40000 ALTER TABLE `big_product_agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `india_agency`
--

DROP TABLE IF EXISTS `india_agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `india_agency` (
  `Date` date DEFAULT NULL,
  `Invoice/Bill_No` varchar(50) DEFAULT NULL,
  `Bill_Amount` decimal(10,2) DEFAULT NULL,
  `Transaction` enum('Credit','Debit') DEFAULT NULL,
  `Total_Credit_Amount` decimal(10,2) DEFAULT NULL,
  `Total_Debit_Amount` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) GENERATED ALWAYS AS ((`Total_Credit_Amount` - `Total_Debit_Amount`)) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `india_agency`
--

LOCK TABLES `india_agency` WRITE;
/*!40000 ALTER TABLE `india_agency` DISABLE KEYS */;
INSERT INTO `india_agency` (`Date`, `Invoice/Bill_No`, `Bill_Amount`, `Transaction`, `Total_Credit_Amount`, `Total_Debit_Amount`) VALUES ('2024-05-03','IND001',7000.00,'Credit',7000.00,0.00),('2024-05-07','IND002',9000.00,'Debit',0.00,9000.00),('2024-05-12','IND003',8000.00,'Credit',8000.00,0.00),('2024-05-17','IND004',7500.00,'Debit',0.00,7500.00),('2024-05-22','IND005',8500.00,'Credit',8500.00,0.00),('2024-05-27','IND006',6500.00,'Debit',0.00,6500.00);
/*!40000 ALTER TABLE `india_agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mixer_agency`
--

DROP TABLE IF EXISTS `mixer_agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mixer_agency` (
  `Date` date DEFAULT NULL,
  `Invoice/Bill_No` varchar(50) DEFAULT NULL,
  `Bill_Amount` decimal(10,2) DEFAULT NULL,
  `Transaction` enum('Credit','Debit') DEFAULT NULL,
  `Total_Credit_Amount` decimal(10,2) DEFAULT NULL,
  `Total_Debit_Amount` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) GENERATED ALWAYS AS ((`Total_Credit_Amount` - `Total_Debit_Amount`)) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mixer_agency`
--

LOCK TABLES `mixer_agency` WRITE;
/*!40000 ALTER TABLE `mixer_agency` DISABLE KEYS */;
INSERT INTO `mixer_agency` (`Date`, `Invoice/Bill_No`, `Bill_Amount`, `Transaction`, `Total_Credit_Amount`, `Total_Debit_Amount`) VALUES ('2024-05-01','INV001',10000.00,'Credit',10000.00,0.00),('2024-05-05','INV002',15000.00,'Debit',0.00,15000.00),('2024-05-10','INV003',20000.00,'Credit',20000.00,0.00),('2024-05-15','INV004',12000.00,'Debit',0.00,12000.00),('2024-05-20','INV005',25000.00,'Credit',25000.00,0.00),('2024-05-25','INV006',18000.00,'Debit',0.00,18000.00);
/*!40000 ALTER TABLE `mixer_agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'financemanagement'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-21 15:44:32
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: productmanagement
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `ac`
--

DROP TABLE IF EXISTS `ac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `category` enum('Inverter','Regular(On/Off)') NOT NULL,
  `model` varchar(100) NOT NULL,
  `capacity_ton` decimal(3,1) NOT NULL,
  `mrp_inr` decimal(10,2) NOT NULL,
  `cp_inr` decimal(10,2) NOT NULL,
  `sp_inr` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac`
--

LOCK TABLES `ac` WRITE;
/*!40000 ALTER TABLE `ac` DISABLE KEYS */;
INSERT INTO `ac` VALUES (1,'Inverter AC','Daikin','Inverter','AC456',1.5,40000.00,35000.00,38000.00,10),(2,'Regular AC','Voltas','Regular(On/Off)','AC789',1.8,35000.00,30000.00,32000.00,12),(3,'Inverter AC','Hitachi','Inverter','AC012',2.0,45000.00,40000.00,42000.00,8),(4,'Window AC','Blue Star','Regular(On/Off)','AC345',1.5,30000.00,25000.00,27000.00,15),(5,'Split AC','Carrier','Regular(On/Off)','AC678',1.2,28000.00,23000.00,25000.00,20);
/*!40000 ALTER TABLE `ac` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`InventorySystem`@`%`*/ /*!50003 TRIGGER `update_total_quantity_ac` AFTER UPDATE ON `ac` FOR EACH ROW BEGIN
        SET @row_number = (SELECT COUNT(*) FROM ac WHERE quantity <= NEW.quantity);
        IF @row_number BETWEEN 36 AND 40 THEN
            UPDATE inventorymanagementsystem.total_quantity
            SET Quantity = NEW.quantity
            WHERE id = @row_number;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cooler`
--

DROP TABLE IF EXISTS `cooler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cooler` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `capacity_litres` int NOT NULL,
  `mrp_inr` decimal(10,2) NOT NULL,
  `cp_inr` decimal(10,2) NOT NULL,
  `sp_inr` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cooler`
--

LOCK TABLES `cooler` WRITE;
/*!40000 ALTER TABLE `cooler` DISABLE KEYS */;
INSERT INTO `cooler` VALUES (1,'Desert Cooler','Symphony','DC123',50,8000.00,6000.00,7000.00,20),(2,'Tower Cooler','Bajaj','TC456',30,6000.00,5000.00,5500.00,25),(3,'Personal Cooler','Orient','PC789',20,5000.00,4000.00,4500.00,30),(4,'Window Cooler','Kenstar','WC123',40,7000.00,5500.00,6000.00,15),(5,'Room Cooler','Usha','RC456',35,6500.00,5200.00,5800.00,18);
/*!40000 ALTER TABLE `cooler` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`InventorySystem`@`%`*/ /*!50003 TRIGGER `update_total_quantity_cooler` AFTER UPDATE ON `cooler` FOR EACH ROW BEGIN
        SET @row_number = (SELECT COUNT(*) FROM cooler WHERE quantity <= NEW.quantity);
        IF @row_number BETWEEN 11 AND 15 THEN
            UPDATE inventorymanagementsystem.total_quantity
            SET Quantity = NEW.quantity
            WHERE id = @row_number;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fan`
--

DROP TABLE IF EXISTS `fan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fan` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `category` enum('Ceiling Fan','Wall Fan','Table Fan','Pedestal Fan','Exhaust Fan') NOT NULL,
  `model` varchar(100) NOT NULL,
  `wattage` int NOT NULL,
  `mrp_inr` decimal(10,2) NOT NULL,
  `cp_inr` decimal(10,2) NOT NULL,
  `sp_inr` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fan`
--

LOCK TABLES `fan` WRITE;
/*!40000 ALTER TABLE `fan` DISABLE KEYS */;
INSERT INTO `fan` VALUES (1,'Ceiling Fan','Crompton','Ceiling Fan','CF789',120,2000.00,1500.00,1800.00,60),(2,'Wall Fan','Usha','Wall Fan','WF123',45,1500.00,1200.00,1400.00,40),(3,'Table Fan','Orient','Table Fan','TF456',30,1000.00,800.00,900.00,50),(4,'Pedestal Fan','Havells','Pedestal Fan','PF789',60,2500.00,2000.00,2200.00,35),(5,'Exhaust Fan','Bajaj','Exhaust Fan','EF123',25,1200.00,1000.00,1100.00,45);
/*!40000 ALTER TABLE `fan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`InventorySystem`@`%`*/ /*!50003 TRIGGER `update_total_quantity_fan` AFTER UPDATE ON `fan` FOR EACH ROW BEGIN
        SET @row_number = (SELECT COUNT(*) FROM fan WHERE quantity <= NEW.quantity);
        IF @row_number BETWEEN 26 AND 30 THEN
            UPDATE inventorymanagementsystem.total_quantity
            SET Quantity = NEW.quantity
            WHERE id = @row_number;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `induction`
--

DROP TABLE IF EXISTS `induction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `induction` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `wattage` int NOT NULL,
  `mrp_inr` decimal(10,2) NOT NULL,
  `cp_inr` decimal(10,2) NOT NULL,
  `sp_inr` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `induction`
--

LOCK TABLES `induction` WRITE;
/*!40000 ALTER TABLE `induction` DISABLE KEYS */;
INSERT INTO `induction` VALUES (1,'Induction Cooktop','Prestige','IC789',1800,3000.00,2500.00,2800.00,40),(2,'Induction Stove','Philips','IS123',2000,3500.00,3000.00,3300.00,35),(3,'Induction Hob','Bajaj','IH456',2200,4000.00,3500.00,3800.00,30),(4,'Portable Induction','Havells','PI789',1500,2800.00,2400.00,2700.00,45),(5,'Slim Induction','Pigeon','SI123',1700,3200.00,2700.00,3100.00,25);
/*!40000 ALTER TABLE `induction` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`InventorySystem`@`%`*/ /*!50003 TRIGGER `update_total_quantity_induction` AFTER UPDATE ON `induction` FOR EACH ROW BEGIN
        SET @row_number = (SELECT COUNT(*) FROM induction WHERE quantity <= NEW.quantity);
        IF @row_number BETWEEN 16 AND 20 THEN
            UPDATE inventorymanagementsystem.total_quantity
            SET Quantity = NEW.quantity
            WHERE id = @row_number;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `led_tv`
--

DROP TABLE IF EXISTS `led_tv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `led_tv` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `technology` enum('normal','android','smart','google') NOT NULL,
  `size_cms` decimal(6,2) NOT NULL,
  `mrp_inr` decimal(10,2) NOT NULL,
  `cp_inr` decimal(10,2) NOT NULL,
  `sp_inr` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `led_tv`
--

LOCK TABLES `led_tv` WRITE;
/*!40000 ALTER TABLE `led_tv` DISABLE KEYS */;
INSERT INTO `led_tv` VALUES (1,'Smart LED TV','Sony','XYZ123','smart',120.00,45000.00,35000.00,40000.00,75),(2,'Android LED TV','Samsung','ABC789','android',108.00,40000.00,32000.00,37000.00,35),(3,'Google LED TV','LG','DEF456','google',130.00,50000.00,42000.00,46000.00,45),(4,'Normal LED TV','Panasonic','GHI123','normal',90.00,30000.00,25000.00,28000.00,50),(5,'Smart LED TV','Toshiba','JKL789','smart',115.00,38000.00,30000.00,34000.00,60);
/*!40000 ALTER TABLE `led_tv` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`InventorySystem`@`%`*/ /*!50003 TRIGGER `update_total_quantity_led_tv` AFTER UPDATE ON `led_tv` FOR EACH ROW BEGIN
        SET @row_number = (SELECT COUNT(*) FROM led_tv WHERE quantity <= NEW.quantity);
        IF @row_number BETWEEN 1 AND 5 THEN
            UPDATE inventorymanagementsystem.total_quantity
            SET Quantity = NEW.quantity
            WHERE id = @row_number;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `microwave`
--

DROP TABLE IF EXISTS `microwave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `microwave` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `mrp_inr` decimal(10,2) NOT NULL,
  `cp_inr` decimal(10,2) NOT NULL,
  `sp_inr` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `microwave`
--

LOCK TABLES `microwave` WRITE;
/*!40000 ALTER TABLE `microwave` DISABLE KEYS */;
INSERT INTO `microwave` VALUES (1,'Microwave Oven','LG','MO789',8000.00,6000.00,6500.00,5),(2,'Grill Microwave','Samsung','GM123',9000.00,7000.00,7500.00,8),(3,'Convection Microwave','IFB','CM456',10000.00,8000.00,8500.00,6),(4,'Solo Microwave','Panasonic','SM789',7000.00,5000.00,5500.00,10),(5,'Over-the-Range Microwave','Whirlpool','OM012',12000.00,9500.00,10000.00,5);
/*!40000 ALTER TABLE `microwave` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`InventorySystem`@`%`*/ /*!50003 TRIGGER `update_total_quantity_microwave` AFTER UPDATE ON `microwave` FOR EACH ROW BEGIN
        SET @row_number = (SELECT COUNT(*) FROM microwave WHERE quantity <= NEW.quantity);
        IF @row_number BETWEEN 41 AND 45 THEN
            UPDATE inventorymanagementsystem.total_quantity
            SET Quantity = NEW.quantity
            WHERE id = @row_number;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mixer_juicer`
--

DROP TABLE IF EXISTS `mixer_juicer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mixer_juicer` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `category` enum('Mixer','Juicer') NOT NULL,
  `model` varchar(100) NOT NULL,
  `wattage` int NOT NULL,
  `mrp_inr` decimal(10,2) NOT NULL,
  `cp_inr` decimal(10,2) NOT NULL,
  `sp_inr` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mixer_juicer`
--

LOCK TABLES `mixer_juicer` WRITE;
/*!40000 ALTER TABLE `mixer_juicer` DISABLE KEYS */;
INSERT INTO `mixer_juicer` VALUES (1,'Juicer','Philips','Juicer','MJ456',500,4000.00,3500.00,3800.00,25),(2,'Mixer Grinder','Bajaj','Mixer','MG123',750,3500.00,3000.00,3300.00,20),(3,'Juicer Mixer','Preethi','Juicer','JM789',600,4200.00,3700.00,4000.00,18),(4,'Hand Mixer','Maharaja','Mixer','HM456',300,2500.00,2000.00,2300.00,30),(5,'Centrifugal Juicer','Sujata','Juicer','CJ123',800,4500.00,4000.00,4300.00,22);
/*!40000 ALTER TABLE `mixer_juicer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`InventorySystem`@`%`*/ /*!50003 TRIGGER `update_total_quantity_mixer_juicer` AFTER UPDATE ON `mixer_juicer` FOR EACH ROW BEGIN
        SET @row_number = (SELECT COUNT(*) FROM mixer_juicer WHERE quantity <= NEW.quantity);
        IF @row_number BETWEEN 21 AND 25 THEN
            UPDATE inventorymanagementsystem.total_quantity
            SET Quantity = NEW.quantity
            WHERE id = @row_number;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `refrigerator`
--

DROP TABLE IF EXISTS `refrigerator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refrigerator` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `technology` enum('Refrigerator','Deep Freezer') NOT NULL,
  `capacity_litres` int NOT NULL,
  `mrp_inr` decimal(10,2) NOT NULL,
  `cp_inr` decimal(10,2) NOT NULL,
  `sp_inr` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refrigerator`
--

LOCK TABLES `refrigerator` WRITE;
/*!40000 ALTER TABLE `refrigerator` DISABLE KEYS */;
INSERT INTO `refrigerator` VALUES (1,'Double Door Refrigerator','LG','ABC456','Refrigerator',300,25000.00,20000.00,22000.00,30),(2,'Single Door Refrigerator','Samsung','DEF789','Refrigerator',200,18000.00,15000.00,16000.00,25),(3,'Deep Freezer','Whirlpool','GHI123','Deep Freezer',400,35000.00,30000.00,32000.00,20),(4,'Side by Side Refrigerator','Bosch','JKL456','Refrigerator',500,45000.00,38000.00,40000.00,15),(5,'Mini Refrigerator','Haier','MNO789','Refrigerator',100,12000.00,10000.00,11000.00,40);
/*!40000 ALTER TABLE `refrigerator` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`InventorySystem`@`%`*/ /*!50003 TRIGGER `update_total_quantity_refrigerator` AFTER UPDATE ON `refrigerator` FOR EACH ROW BEGIN
        SET @row_number = (SELECT COUNT(*) FROM refrigerator WHERE quantity <= NEW.quantity);
        IF @row_number BETWEEN 6 AND 10 THEN
            UPDATE inventorymanagementsystem.total_quantity
            SET Quantity = NEW.quantity
            WHERE id = @row_number;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `stabilizer`
--

DROP TABLE IF EXISTS `stabilizer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stabilizer` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `category` enum('AC','Refrigerator','LED TV','Home') NOT NULL,
  `model` varchar(100) NOT NULL,
  `mrp_inr` decimal(10,2) NOT NULL,
  `cp_inr` decimal(10,2) NOT NULL,
  `sp_inr` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stabilizer`
--

LOCK TABLES `stabilizer` WRITE;
/*!40000 ALTER TABLE `stabilizer` DISABLE KEYS */;
INSERT INTO `stabilizer` VALUES (1,'AC Stabilizer','V-Guard','AC','ST123',3000.00,2500.00,2800.00,8),(2,'Refrigerator Stabilizer','Microtek','Refrigerator','ST456',2000.00,1500.00,1800.00,10),(3,'LED TV Stabilizer','Syspro','LED TV','ST789',2500.00,2000.00,2300.00,12),(4,'Home Stabilizer','Havells','Home','ST012',3500.00,3000.00,3200.00,5),(5,'Multi-Purpose Stabilizer','Everest','Home','ST345',4000.00,3500.00,3800.00,6);
/*!40000 ALTER TABLE `stabilizer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`InventorySystem`@`%`*/ /*!50003 TRIGGER `update_total_quantity_stabilizer` AFTER UPDATE ON `stabilizer` FOR EACH ROW BEGIN
        SET @row_number = (SELECT COUNT(*) FROM stabilizer WHERE quantity <= NEW.quantity);
        IF @row_number BETWEEN 46 AND 50 THEN
            UPDATE inventorymanagementsystem.total_quantity
            SET Quantity = NEW.quantity
            WHERE id = @row_number;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `washing_machine`
--

DROP TABLE IF EXISTS `washing_machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `washing_machine` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `category` enum('Semi-automatic','Automatic') NOT NULL,
  `model` varchar(100) NOT NULL,
  `capacity_kgs` decimal(5,2) NOT NULL,
  `mrp_inr` decimal(10,2) NOT NULL,
  `cp_inr` decimal(10,2) NOT NULL,
  `sp_inr` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `washing_machine`
--

LOCK TABLES `washing_machine` WRITE;
/*!40000 ALTER TABLE `washing_machine` DISABLE KEYS */;
INSERT INTO `washing_machine` VALUES (1,'Front Load Automatic','Samsung','Automatic','WM123',7.00,30000.00,25000.00,28000.00,15),(2,'Top Load Semi-automatic','LG','Semi-automatic','WM456',6.50,18000.00,15000.00,17000.00,20),(3,'Front Load Automatic','Bosch','Automatic','WM789',8.00,35000.00,30000.00,32000.00,10),(4,'Top Load Automatic','Whirlpool','Automatic','WM012',7.50,25000.00,20000.00,23000.00,12),(5,'Semi-automatic','IFB','Semi-automatic','WM345',6.00,15000.00,12000.00,14000.00,18);
/*!40000 ALTER TABLE `washing_machine` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`InventorySystem`@`%`*/ /*!50003 TRIGGER `update_total_quantity_washing_machine` AFTER UPDATE ON `washing_machine` FOR EACH ROW BEGIN
        SET @row_number = (SELECT COUNT(*) FROM washing_machine WHERE quantity <= NEW.quantity);
        IF @row_number BETWEEN 31 AND 35 THEN
            UPDATE inventorymanagementsystem.total_quantity
            SET Quantity = NEW.quantity
            WHERE id = @row_number;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'productmanagement'
--
/*!50003 DROP PROCEDURE IF EXISTS `update_quantity_in_productmanagement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`InventorySystem`@`localhost` PROCEDURE `update_quantity_in_productmanagement`(
        IN p_Product VARCHAR(255),
        IN p_Category VARCHAR(255),
        IN p_Model VARCHAR(255),
        IN p_Brand VARCHAR(255),
        IN p_Quantity INT
    )
BEGIN
        DECLARE table_exists INT DEFAULT 0;
        
        -- Check if the table exists
        SET @check_table_query = CONCAT('SELECT COUNT(*) INTO @table_exists FROM information_schema.tables WHERE table_schema = "productmanagement" AND table_name = "', p_Category, '"');
        PREPARE stmt FROM @check_table_query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
        
        IF table_exists > 0 THEN
            -- Update the quantity in the relevant table
            SET @update_query = CONCAT('UPDATE productmanagement.', p_Category, ' SET quantity = ', p_Quantity, ' WHERE product_name = "', p_Product, '" AND brand = "', p_Brand, '" AND model = "', p_Model, '"');
            PREPARE stmt FROM @update_query;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
        END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-21 15:44:33
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: inventorymanagementsystem
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Messages` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
INSERT INTO `alert` VALUES (1,'Welcome to system.','2024-05-26','12:48:19');
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electricalsseries`
--

DROP TABLE IF EXISTS `electricalsseries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electricalsseries` (
  `Product_Name` varchar(255) NOT NULL,
  `Havells_CP` decimal(10,2) DEFAULT NULL,
  `Havells_SP` decimal(10,2) DEFAULT NULL,
  `Havells_Quantity` int DEFAULT NULL,
  `IndoAsian_CP` decimal(10,2) DEFAULT NULL,
  `IndoAsian_SP` decimal(10,2) DEFAULT NULL,
  `IndoAsian_Quantity` int DEFAULT NULL,
  PRIMARY KEY (`Product_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electricalsseries`
--

LOCK TABLES `electricalsseries` WRITE;
/*!40000 ALTER TABLE `electricalsseries` DISABLE KEYS */;
INSERT INTO `electricalsseries` VALUES ('2 pin socket',8.40,9.66,600,7.84,9.02,500),('2 way switch',15.75,18.11,350,14.70,16.91,300),('3 pin / 5 pin socket',12.60,14.49,450,11.76,13.53,400),('Bell Switch 1 mod',21.00,24.15,250,19.60,22.54,200),('Bell Switch 2 mod',26.25,30.19,200,24.50,28.18,150),('Blank Cover',2.10,2.42,1500,1.96,2.25,1300),('Ceiling Rose',10.50,12.08,750,9.80,11.27,650),('Holder',3.15,3.62,1000,2.94,3.38,900),('Indicator',5.25,6.04,800,4.90,5.64,700),('iso 40A',315.00,362.25,200,294.00,338.10,180),('iso 63A',472.50,543.38,150,441.00,507.15,120),('Mcb',210.00,241.50,300,196.00,225.40,260),('Mini Mcb',157.50,181.13,400,147.00,169.05,380),('Plate 1 way',52.50,60.38,700,49.00,56.35,600),('Plate 12 way',168.00,193.20,300,156.80,180.32,250),('Plate 18 way',210.00,241.50,250,196.00,225.40,200),('Plate 2 way',63.00,72.45,600,58.80,67.62,550),('Plate 3 way',73.50,84.53,550,68.60,79.41,500),('Plate 4 way',84.00,96.60,500,78.40,90.16,450),('Plate 6 way',105.00,120.75,400,98.00,112.70,350),('Plate 8 way',126.00,144.90,350,117.60,135.24,300),('power socket 16A',25.20,29.00,200,23.52,27.05,180),('power socket 25A',33.60,38.64,150,31.36,36.06,120),('power switch',16.80,19.32,300,15.68,18.03,250),('Regulator 4step',42.00,48.30,500,39.20,45.08,450),('Regulator 5step',52.50,60.38,400,49.00,56.35,200),('Regulator normal',31.50,36.23,300,29.40,33.81,280),('Switch',10.50,12.08,500,9.80,11.27,400);
/*!40000 ALTER TABLE `electricalsseries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `Serial_No` int NOT NULL AUTO_INCREMENT,
  `Invoice_No` varchar(255) NOT NULL,
  `Product_Name` varchar(255) NOT NULL,
  `Month&Date` date NOT NULL,
  `Profit/Loss` decimal(10,2) NOT NULL,
  `Invoice_file` varchar(255) NOT NULL,
  `sales_price` decimal(10,2) NOT NULL,
  `status` enum('Paid','Unpaid') NOT NULL,
  `profit_amt/loss_amt` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Serial_No`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,'INV001','Inverter AC','2024-01-01',30000.00,'invoice_001.pdf',380000.00,'Paid',30000.00),(2,'INV002','Regular AC','2024-02-02',-50000.00,'invoice_002.pdf',31000.00,'Unpaid',-50000.00),(3,'INV003','Ceiling Fan','2023-08-03',300000.00,'invoice_003.pdf',1800.00,'Paid',300000.00),(4,'INV004','Induction Cooktop','2023-10-04',0.00,'invoice_004.pdf',200.00,'Unpaid',0.00),(5,'INV005','Desert Cooler','2023-11-05',15000.00,'invoice_005.pdf',7000.00,'Paid',15000.00),(6,'INV006','Google LED TV','2024-03-06',75658.00,'invoice_006.pdf',46000.00,'Paid',75658.00),(7,'INV007','Microwave Oven','2024-04-17',80080.00,'invoice_007.pdf',6500.00,'Unpaid',80080.00),(8,'INV008','Mixer Grinder','2024-05-08',30050.00,'invoice_008.pdf',3300.00,'Paid',30050.00),(9,'INV009','Double Door Refrigerator','2023-12-09',250900.00,'invoice_009.pdf',22000.00,'Unpaid',250900.00),(10,'INV010','Front Load Automatic','2024-06-10',90320.00,'invoice_010.pdf',28000.00,'Paid',90320.00);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxes`
--

DROP TABLE IF EXISTS `taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Product` varchar(255) DEFAULT NULL,
  `Tax_Rate` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxes`
--

LOCK TABLES `taxes` WRITE;
/*!40000 ALTER TABLE `taxes` DISABLE KEYS */;
INSERT INTO `taxes` VALUES (1,'LED_TV',18.00),(2,'Refrigerator',18.00),(3,'Cooler',18.00),(4,'Induction',18.00),(5,'Mixer_Juicer',18.00),(6,'Fan',18.00),(7,'Washing_Machine',18.00),(8,'AC',28.00),(9,'Microwave',18.00),(10,'Stabilizer',18.00);
/*!40000 ALTER TABLE `taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `total_quantity`
--

DROP TABLE IF EXISTS `total_quantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `total_quantity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Product` varchar(255) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `Model` varchar(255) DEFAULT NULL,
  `Brand` varchar(255) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `units_sold` int DEFAULT '0',
  `cp` decimal(10,2) DEFAULT NULL,
  `sp` decimal(10,2) NOT NULL,
  `profit_loss` decimal(10,2) DEFAULT NULL,
  `total_profit_loss` decimal(10,2) DEFAULT NULL,
  `total_revenue` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_quantity`
--

LOCK TABLES `total_quantity` WRITE;
/*!40000 ALTER TABLE `total_quantity` DISABLE KEYS */;
INSERT INTO `total_quantity` VALUES (1,'Smart LED TV','LED_TV','XYZ123','Sony',75,24,35000.00,40000.00,5000.00,120000.00,960000.00),(2,'Android LED TV','LED_TV','ABC789','Samsung',35,21,32000.00,37000.00,5000.00,105000.00,777000.00),(3,'Google LED TV','LED_TV','DEF456','LG',45,32,42000.00,46000.00,4000.00,128000.00,1472000.00),(4,'Normal LED TV','LED_TV','GHI123','Panasonic',50,56,25000.00,28000.00,3000.00,168000.00,1568000.00),(5,'Smart LED TV','LED_TV','JKL789','Toshiba',75,55,30000.00,34000.00,4000.00,220000.00,1870000.00),(6,'Double Door Refrigerator','Refrigerator','ABC456','LG',30,21,20000.00,22000.00,2000.00,42000.00,462000.00),(7,'Single Door Refrigerator','Refrigerator','DEF789','Samsung',25,32,15000.00,16000.00,1000.00,32000.00,512000.00),(8,'Deep Freezer','Refrigerator','GHI123','Whirlpool',20,21,30000.00,32000.00,2000.00,42000.00,672000.00),(9,'Side by Side Refrigerator','Refrigerator','JKL456','Bosch',15,22,38000.00,40000.00,2000.00,44000.00,880000.00),(10,'Mini Refrigerator','Refrigerator','MNO789','Haier',40,6,10000.00,11000.00,1000.00,6000.00,66000.00),(11,'Desert Cooler','Cooler','DC123','Symphony',20,54,6000.00,7000.00,1000.00,54000.00,378000.00),(12,'Tower Cooler','Cooler','TC456','Bajaj',25,60,5000.00,5500.00,500.00,30000.00,330000.00),(13,'Personal Cooler','Cooler','PC789','Orient',28,47,4000.00,4500.00,500.00,23500.00,211500.00),(14,'Window Cooler','Cooler','WC123','Kenstar',15,70,5500.00,6000.00,500.00,35000.00,420000.00),(15,'Room Cooler','Cooler','RC456','Usha',18,152,5200.00,5800.00,600.00,91200.00,881600.00),(16,'Induction Cooktop','Induction','IC789','Prestige',40,205,2500.00,2800.00,300.00,61500.00,574000.00),(17,'Induction Stove','Induction','IS123','Philips',25,30,3000.00,3300.00,300.00,9000.00,99000.00),(18,'Induction Hob','Induction','IH456','Bajaj',30,563,3500.00,3800.00,300.00,168900.00,2139400.00),(19,'Portable Induction','Induction','PI789','Havells',45,23,2400.00,2700.00,300.00,6900.00,62100.00),(20,'Slim Induction','Induction','SI123','Pigeon',25,23,2700.00,3100.00,400.00,9200.00,71300.00),(21,'Juicer','Mixer_Juicer','MJ456','Philips',25,530,3500.00,3800.00,300.00,159000.00,2014000.00),(22,'Mixer Grinder','Mixer_Juicer','MG123','Bajaj',20,323,3000.00,3300.00,300.00,96900.00,1065900.00),(23,'Juicer Mixer','Mixer_Juicer','JM789','Preethi',18,23,3700.00,4000.00,300.00,6900.00,92000.00),(24,'Hand Mixer','Mixer_Juicer','HM456','Maharaja',30,233,2000.00,2300.00,300.00,69900.00,535900.00),(25,'Centrifugal Juicer','Mixer_Juicer','CJ123','Sujata',22,533,4000.00,4300.00,300.00,159900.00,2291900.00),(26,'Ceiling Fan','Fan','CF789','Crompton',60,23,1500.00,1800.00,300.00,6900.00,41400.00),(27,'Wall Fan','Fan','WF123','Usha',40,32,1200.00,1400.00,200.00,6400.00,44800.00),(28,'Table Fan','Fan','TF456','Orient',50,36,800.00,900.00,100.00,3600.00,32400.00),(29,'Pedestal Fan','Fan','PF789','Havells',35,53,2000.00,2200.00,200.00,10600.00,116600.00),(30,'Exhaust Fan','Fan','EF123','Bajaj',45,213,1000.00,1100.00,100.00,21300.00,234300.00),(31,'Front Load Automatic','Washing_Machine','WM123','Samsung',15,32,25000.00,28000.00,3000.00,96000.00,896000.00),(32,'Top Load Semi-automatic','Washing_Machine','WM456','LG',20,32,15000.00,17000.00,2000.00,64000.00,544000.00),(33,'Front Load Automatic','Washing_Machine','WM789','Bosch',10,23,30000.00,32000.00,2000.00,46000.00,736000.00),(34,'Top Load Automatic','Washing_Machine','WM012','Whirlpool',12,13,20000.00,23000.00,3000.00,39000.00,299000.00),(35,'Semi-automatic','Washing_Machine','WM345','IFB',18,65,12000.00,14000.00,2000.00,130000.00,910000.00),(36,'Inverter AC','AC','AC456','Daikin',10,35,35000.00,38000.00,3000.00,105000.00,1330000.00),(37,'Regular AC','AC','AC789','Voltas',12,47,30000.00,32000.00,2000.00,94000.00,1504000.00),(38,'Inverter AC','AC','AC012','Hitachi',8,55,40000.00,42000.00,2000.00,110000.00,2310000.00),(39,'Window AC','AC','AC345','Blue Star',15,19,25000.00,27000.00,2000.00,38000.00,513000.00),(40,'Split AC','AC','AC678','Carrier',20,27,23000.00,25000.00,2000.00,54000.00,675000.00),(41,'Microwave Oven','Microwave','MO789','LG',5,25,6000.00,6500.00,500.00,12500.00,162500.00),(42,'Grill Microwave','Microwave','GM123','Samsung',8,51,7000.00,7500.00,500.00,25500.00,382500.00),(43,'Convection Microwave','Microwave','CM456','IFB',6,47,8000.00,8500.00,500.00,23500.00,399500.00),(44,'Solo Microwave','Microwave','SM789','Panasonic',10,69,5000.00,5500.00,500.00,34500.00,379500.00),(45,'Over-the-Range Microwave','Microwave','OM012','Whirlpool',5,35,9500.00,10000.00,500.00,17500.00,350000.00),(46,'AC Stabilizer','Stabilizer','ST123','V-Guard',8,102,2500.00,2800.00,300.00,30600.00,285600.00),(47,'Refrigerator Stabilizer','Stabilizer','ST456','Microtek',10,76,1500.00,1800.00,300.00,22800.00,136800.00),(48,'LED TV Stabilizer','Stabilizer','ST789','Syspro',12,95,2000.00,2300.00,300.00,28500.00,218500.00),(49,'Home Stabilizer','Stabilizer','ST012','Havells',5,87,3000.00,3200.00,200.00,17400.00,278400.00),(50,'Multi-Purpose Stabilizer','Stabilizer','ST345','Everest',6,63,3500.00,3800.00,300.00,18900.00,239400.00);
/*!40000 ALTER TABLE `total_quantity` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`InventorySystem`@`%`*/ /*!50003 TRIGGER `update_profit_loss_trigger` BEFORE INSERT ON `total_quantity` FOR EACH ROW BEGIN
    SET NEW.profit_loss = NEW.sp - NEW.cp;
    SET NEW.total_profit_loss = NEW.profit_loss * NEW.units_sold;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`InventorySystem`@`%`*/ /*!50003 TRIGGER `update_profit_loss` BEFORE INSERT ON `total_quantity` FOR EACH ROW BEGIN
    SET NEW.profit_loss = NEW.sp - NEW.cp;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`InventorySystem`@`%`*/ /*!50003 TRIGGER `update_total_revenue_trigger` BEFORE INSERT ON `total_quantity` FOR EACH ROW BEGIN
    SET NEW.total_revenue = NEW.sp * NEW.units_sold;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`InventorySystem`@`%`*/ /*!50003 TRIGGER `update_profit_loss_trigger_update` BEFORE UPDATE ON `total_quantity` FOR EACH ROW BEGIN
    SET NEW.profit_loss = NEW.sp - NEW.cp;
    SET NEW.total_profit_loss = NEW.profit_loss * NEW.units_sold;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`InventorySystem`@`%`*/ /*!50003 TRIGGER `update_total_revenue_trigger_update` BEFORE UPDATE ON `total_quantity` FOR EACH ROW BEGIN
    SET NEW.total_revenue = NEW.sp * NEW.units_sold;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usercredentials`
--

DROP TABLE IF EXISTS `usercredentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usercredentials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile_number` bigint NOT NULL,
  `security_question1` varchar(255) NOT NULL,
  `security_answer1` varchar(255) NOT NULL,
  `security_question2` varchar(255) NOT NULL,
  `security_answer2` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercredentials`
--

LOCK TABLES `usercredentials` WRITE;
/*!40000 ALTER TABLE `usercredentials` DISABLE KEYS */;
INSERT INTO `usercredentials` VALUES (1,'John Doe','johndoe','john@example.com',1234567890,'What\'s your favorite color?','Blue','Who was your first teacher?','Mrs. Smith','1234'),(2,'Shivam Soni','ngvh','hejegugeve@jollyfree.com',7024364032,'What is the title of your favorite song?','Nothing','What is your Dream job?','Nothing','123456');
/*!40000 ALTER TABLE `usercredentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wires`
--

DROP TABLE IF EXISTS `wires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wires` (
  `Size` varchar(10) NOT NULL,
  `Havells_CP` decimal(10,2) DEFAULT NULL,
  `Havells_SP` decimal(10,2) DEFAULT NULL,
  `Havells_Quantity` int DEFAULT NULL,
  `Polycab_CP` decimal(10,2) DEFAULT NULL,
  `Polycab_SP` decimal(10,2) DEFAULT NULL,
  `Polycab_Quantity` int DEFAULT NULL,
  PRIMARY KEY (`Size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wires`
--

LOCK TABLES `wires` WRITE;
/*!40000 ALTER TABLE `wires` DISABLE KEYS */;
INSERT INTO `wires` VALUES ('0.75 mm',500.00,575.00,100,480.00,552.00,95),('1 mm',750.00,862.50,130,720.00,828.00,125),('1.5 mm',1125.00,1293.75,85,1080.00,1242.00,68),('10 mm',7500.00,8625.00,20,7200.00,8280.00,15),('2.5 mm',1875.00,2156.25,100,1800.00,2070.00,115),('4 mm',3000.00,3450.00,65,2880.00,3312.00,45),('6 mm',4500.00,5175.00,30,4320.00,4968.00,35),('8 mm',6000.00,6900.00,25,5760.00,6624.00,25);
/*!40000 ALTER TABLE `wires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'inventorymanagementsystem'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-21 15:44:33
