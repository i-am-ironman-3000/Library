-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `books` (
  `bname` varchar(30) DEFAULT NULL,
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) DEFAULT NULL,
  `price` decimal(18,2) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('advance mathematics',1,1,1000.00,8,'images/0.jpg'),('engineering mathematics vol-1',2,1,500.00,5,'images/1.jpg'),('let us C',3,2,800.00,10,'images/2.jpg'),('c programming',4,2,500.00,10,'images/3.jpg'),('java programming for beginners',5,3,1000.00,5,'images/4.jpg'),('java',6,3,800.00,5,'images/5.jpg'),('discrete mathematics',7,1,750.00,10,'images/6.jpg'),('oxford discrete mathematics',8,1,1000.00,5,'images/7.jpg'),('operating system',11,2,800.00,1,'images/10.jpg');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catogery`
--

DROP TABLE IF EXISTS `catogery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `catogery` (
  `catid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catogery`
--

LOCK TABLES `catogery` WRITE;
/*!40000 ALTER TABLE `catogery` DISABLE KEYS */;
INSERT INTO `catogery` VALUES (1,'Mathematics'),(2,'C Programming'),(3,'Java Programming');
/*!40000 ALTER TABLE `catogery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fine`
--

DROP TABLE IF EXISTS `fine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fine` (
  `d` date DEFAULT NULL,
  `fine` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fine`
--

LOCK TABLES `fine` WRITE;
/*!40000 ALTER TABLE `fine` DISABLE KEYS */;
INSERT INTO `fine` VALUES ('2020-07-23',30.00),('2020-07-23',0.00),('2020-07-23',30.00),('2020-07-23',0.00),('2020-07-23',20.00),('2020-07-24',1000.00);
/*!40000 ALTER TABLE `fine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuebook`
--

DROP TABLE IF EXISTS `issuebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `issuebook` (
  `bid` int(11) DEFAULT NULL,
  `uname` varchar(20) DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuebook`
--

LOCK TABLES `issuebook` WRITE;
/*!40000 ALTER TABLE `issuebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `notification` (
  `uname` varchar(20) DEFAULT NULL,
  `notifi` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES ('Vaibhav','Issued a book Book Id:1 On Date2020-07-13'),('Vaibhav','Issued a book Book Id:1 On Date2020-07-13'),('Vaibhav','Book Issued:advance mathematics on Date:2020-07-13 fine:0 Of total days:10'),('Vaibhav','Book Issued:advance mathematics on Date:2020-07-13 fine:0 Of total days:10'),('Vaibhav','You Have Submitted your Book:1 on Thu Jul 23 15:10:46 IST 2020 With Fine of rs:-0'),('Vaibhav','Issued a book Book Id:3 On Date2020-07-10'),('Vaibhav','Book Issued:let us C on Date:2020-07-10 fine:30 Of total days:13'),('Vaibhav','You Have Submitted your Book:3 on Thu Jul 23 15:14:25 IST 2020 With Fine of rs:-30'),('Vaibhav','Issued a book Book Id:1 On Date2020-07-23'),('akash','Issued a book Book Id:11 On Date2020-07-23'),('akash','You Have Submitted your Book:11 on Thu Jul 23 16:29:45 IST 2020 With Fine of rs:-0'),('Vaibhav','Book Issued:advance mathematics on Date:2020-07-23 fine:0 Of total days:0'),('Vaibhav','Book Issued:advance mathematics on Date:2020-07-23 fine:0 Of total days:0'),('shivam','Issued a book Book Id:3 On Date2020-07-10'),('Vaibhav','Book Issued:advance mathematics on Date:2020-07-23 fine:0 Of total days:0'),('shivam','Book Issued:let us C on Date:2020-07-10 fine:30 Of total days:13'),('Vaibhav','Book Issued:advance mathematics on Date:2020-07-23 fine:0 Of total days:0'),('shivam','Book Issued:let us C on Date:2020-07-10 fine:30 Of total days:13'),('shivam','You Have Submitted your Book:3 on Thu Jul 23 23:00:31 IST 2020 With Fine of rs:-30'),('shivam','Issued a book Book Id:1 On Date2020-07-10'),('shivam','Issued a book Book Id:1 On Date2020-07-10'),('Vaibhav','Book Issued:advance mathematics on Date:2020-07-23 fine:0 Of total days:0'),('shivam','Book Issued:advance mathematics on Date:2020-07-10 fine:30 Of total days:13'),('shivam','Book Issued:advance mathematics on Date:2020-07-10 fine:30 Of total days:13'),('aditya@gmail.com','Issued a book Book Id:1 On Date2020-07-18'),('aditya@gmail.com','You Have Submitted your Book:1 on Thu Jul 23 23:07:56 IST 2020 With Fine of rs:-0'),('shivam','You Have Submitted your Book:1 on Thu Jul 23 23:11:05 IST 2020 With Fine of rs:-30'),('Vaibhav','You Have Submitted your Book:1 on Thu Jul 23 23:12:12 IST 2020 With Fine of rs:-0'),('aditya@gmail.com','Issued a book Book Id:1 On Date2020-07-11'),('aditya@gmail.com','You Have Submitted your Book:1 on Thu Jul 23 23:13:09 IST 2020 With Fine of rs:-20'),('shivam','You Lost a bookadvance mathematics, and Pay the fine1000');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student` (
  `name` varchar(20) DEFAULT NULL,
  `uname` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `amt` decimal(18,2) DEFAULT NULL,
  `pic` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('Vaibhav Mishra','Vaibhav','Male','bbdn',0.00,'images/Vaibhav.jpg'),('Shivam Kumar','shivam','Male','bbd',0.00,'images/shivam.jpg'),('Shashwat Maurya','shaan','Male','lko',0.00,'images/shaan.jpg'),('Harsh Dubey','Harsh','Male','dubeey',0.00,'images/Harsh.jpg'),('Abhishek Chaurasia','Abhishek','Male','bbdn',0.00,'images/Abhishek.jpg'),('Praveen Patel','praveen','Male','pune',0.00,'images/praveen.jpg'),('Alok Maurya','Alok','Male','alok',0.00,'images/Alok.jpg'),('Aditya Singh','Aditya','Male','rajput',0.00,'images/Aditya.jpg'),('Anurag Ashthana','anurag','Male','ashthana',0.00,'images/anurag.jpg'),('Ashutosh Dixit','Ashu','Male','dixit',0.00,'images/Ashu.jpg');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `uname` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pic` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('Harshit','Harshit Tiwari','bbdn','harshit@gmail.com','images/h.jpg'),('Shashwat','Shashwat Maurya','lko','shaan@gmail.com',NULL),('Vaibhav','Vaibhav Mishra','bbd','vmisra@gmail.com',NULL);
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

-- Dump completed on 2020-07-26 11:07:02
