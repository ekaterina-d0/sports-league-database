-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: 127.0.0.1    Database: final_task3
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `EMERG_CONTACTS`
--

DROP TABLE IF EXISTS `EMERG_CONTACTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMERG_CONTACTS` (
  `Emerg_ContactID` int NOT NULL,
  `Contact_FName` varchar(50) DEFAULT NULL,
  `Contact_LName` varchar(50) DEFAULT NULL,
  `Contact_Number` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Emerg_ContactID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMERG_CONTACTS`
--

LOCK TABLES `EMERG_CONTACTS` WRITE;
/*!40000 ALTER TABLE `EMERG_CONTACTS` DISABLE KEYS */;
INSERT INTO `EMERG_CONTACTS` VALUES (1,'Alan','Jones','555-7890'),(2,'Beth','Smith','555-0987'),(3,'Chris','Brown','555-4444'),(4,'Diana','Ross','555-5555');
/*!40000 ALTER TABLE `EMERG_CONTACTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GAME`
--

DROP TABLE IF EXISTS `GAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GAME` (
  `GameID` int NOT NULL,
  `Date_Played` date DEFAULT NULL,
  `Score` varchar(5) DEFAULT NULL,
  `Result` int DEFAULT NULL,
  `Season` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`GameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GAME`
--

LOCK TABLES `GAME` WRITE;
/*!40000 ALTER TABLE `GAME` DISABLE KEYS */;
INSERT INTO `GAME` VALUES (1,'2024-03-01','3-2',1,'2023-2024'),(2,'2024-03-15','1-1',3,'2023-2024'),(3,'2024-03-22','2-2',3,'2023-2024'),(4,'2024-04-02','0-1',2,'2023-2024');
/*!40000 ALTER TABLE `GAME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYER_EMERG`
--

DROP TABLE IF EXISTS `PLAYER_EMERG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLAYER_EMERG` (
  `PlayerID` int NOT NULL,
  `Emerg_ContactID` int NOT NULL,
  PRIMARY KEY (`PlayerID`,`Emerg_ContactID`),
  KEY `Emerg_ContactID` (`Emerg_ContactID`),
  CONSTRAINT `player_emerg_ibfk_1` FOREIGN KEY (`Emerg_ContactID`) REFERENCES `EMERG_CONTACTS` (`Emerg_ContactID`),
  CONSTRAINT `player_emerg_ibfk_2` FOREIGN KEY (`PlayerID`) REFERENCES `PLAYERS` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYER_EMERG`
--

LOCK TABLES `PLAYER_EMERG` WRITE;
/*!40000 ALTER TABLE `PLAYER_EMERG` DISABLE KEYS */;
INSERT INTO `PLAYER_EMERG` VALUES (1,1),(5,1),(2,2),(6,2),(3,3),(4,4);
/*!40000 ALTER TABLE `PLAYER_EMERG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYER_MATCH`
--

DROP TABLE IF EXISTS `PLAYER_MATCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLAYER_MATCH` (
  `GameID` int NOT NULL,
  `PlayerID` int NOT NULL,
  `Minutes_Played` int DEFAULT NULL,
  `Goals` int DEFAULT NULL,
  `Assists` int DEFAULT NULL,
  PRIMARY KEY (`GameID`,`PlayerID`),
  KEY `PlayerID` (`PlayerID`),
  CONSTRAINT `player_match_ibfk_1` FOREIGN KEY (`GameID`) REFERENCES `GAME` (`GameID`),
  CONSTRAINT `player_match_ibfk_2` FOREIGN KEY (`PlayerID`) REFERENCES `PLAYERS` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYER_MATCH`
--

LOCK TABLES `PLAYER_MATCH` WRITE;
/*!40000 ALTER TABLE `PLAYER_MATCH` DISABLE KEYS */;
INSERT INTO `PLAYER_MATCH` VALUES (1,1,90,2,0),(1,2,85,1,1),(3,3,90,0,0),(3,4,90,0,0),(4,1,90,0,0),(4,4,90,1,0);
/*!40000 ALTER TABLE `PLAYER_MATCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYERS`
--

DROP TABLE IF EXISTS `PLAYERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLAYERS` (
  `PlayerID` int NOT NULL,
  `PlayerNum` int DEFAULT NULL,
  `Player_FName` varchar(50) DEFAULT NULL,
  `Player_LName` varchar(50) DEFAULT NULL,
  `Player_Position` varchar(50) DEFAULT NULL,
  `Minutes_Played` int DEFAULT NULL,
  `TeamID` int DEFAULT NULL,
  `Emerg_ContactID` int DEFAULT NULL,
  PRIMARY KEY (`PlayerID`),
  KEY `TeamID` (`TeamID`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `TEAMS` (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYERS`
--

LOCK TABLES `PLAYERS` WRITE;
/*!40000 ALTER TABLE `PLAYERS` DISABLE KEYS */;
INSERT INTO `PLAYERS` VALUES (1,9,'Mike','Jones','Forward',90,1,1),(2,10,'Sara','Smith','Midfielder',85,2,2),(3,11,'Tom','Harris','Defender',90,3,3),(4,12,'Emily','Clark','Goalkeeper',90,4,4),(5,8,'Luke','Jordan','Midfielder',75,1,1),(6,7,'Olivia','Grant','Forward',80,2,2);
/*!40000 ALTER TABLE `PLAYERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REFS`
--

DROP TABLE IF EXISTS `REFS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REFS` (
  `RefID` int NOT NULL,
  `Ref_FName` varchar(50) DEFAULT NULL,
  `Ref_LName` varchar(50) DEFAULT NULL,
  `Ref_Number` varchar(15) DEFAULT NULL,
  `Ref_Zip` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`RefID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REFS`
--

LOCK TABLES `REFS` WRITE;
/*!40000 ALTER TABLE `REFS` DISABLE KEYS */;
INSERT INTO `REFS` VALUES (1,'John','Doe','555-1234','55601'),(2,'Jane','Smith','555-5678','55602'),(3,'Alice','Walker','555-2222','55603'),(4,'Bob','Johnson','555-3333','55604');
/*!40000 ALTER TABLE `REFS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REFS_GAME`
--

DROP TABLE IF EXISTS `REFS_GAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REFS_GAME` (
  `RefID` int NOT NULL,
  `GameID` int NOT NULL,
  PRIMARY KEY (`RefID`,`GameID`),
  KEY `GameID` (`GameID`),
  CONSTRAINT `refs_game_ibfk_1` FOREIGN KEY (`RefID`) REFERENCES `REFS` (`RefID`),
  CONSTRAINT `refs_game_ibfk_2` FOREIGN KEY (`GameID`) REFERENCES `GAME` (`GameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REFS_GAME`
--

LOCK TABLES `REFS_GAME` WRITE;
/*!40000 ALTER TABLE `REFS_GAME` DISABLE KEYS */;
INSERT INTO `REFS_GAME` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `REFS_GAME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCHOOLS`
--

DROP TABLE IF EXISTS `SCHOOLS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCHOOLS` (
  `SchoolID` int NOT NULL,
  `SchoolName` varchar(100) DEFAULT NULL,
  `SchoolAdress` varchar(100) DEFAULT NULL,
  `SchoolCity` varchar(50) DEFAULT NULL,
  `SchoolZip` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`SchoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCHOOLS`
--

LOCK TABLES `SCHOOLS` WRITE;
/*!40000 ALTER TABLE `SCHOOLS` DISABLE KEYS */;
INSERT INTO `SCHOOLS` VALUES (1,'Lincoln High','101 Patriot Way','Springfield','55501'),(2,'Roosevelt Academy','202 Freedom Blvd','Liberty','55502'),(3,'Jefferson Prep','303 Liberty St','Centerville','55503'),(4,'Washington High','404 Union Ave','Smalltown','55504');
/*!40000 ALTER TABLE `SCHOOLS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEAM_GAME`
--

DROP TABLE IF EXISTS `TEAM_GAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEAM_GAME` (
  `Game` int NOT NULL,
  `Teams` int NOT NULL,
  PRIMARY KEY (`Game`,`Teams`),
  KEY `Teams` (`Teams`),
  CONSTRAINT `team_game_ibfk_1` FOREIGN KEY (`Teams`) REFERENCES `TEAMS` (`TeamID`),
  CONSTRAINT `team_game_ibfk_2` FOREIGN KEY (`Game`) REFERENCES `GAME` (`GameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEAM_GAME`
--

LOCK TABLES `TEAM_GAME` WRITE;
/*!40000 ALTER TABLE `TEAM_GAME` DISABLE KEYS */;
INSERT INTO `TEAM_GAME` VALUES (1,1),(2,1),(4,1),(1,2),(2,2),(3,3),(3,4),(4,4);
/*!40000 ALTER TABLE `TEAM_GAME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEAMS`
--

DROP TABLE IF EXISTS `TEAMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEAMS` (
  `TeamID` int NOT NULL,
  `SchoolID` int DEFAULT NULL,
  `TeamName` varchar(80) DEFAULT NULL,
  `TeamColor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`TeamID`),
  KEY `SchoolID` (`SchoolID`),
  CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`SchoolID`) REFERENCES `SCHOOLS` (`SchoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEAMS`
--

LOCK TABLES `TEAMS` WRITE;
/*!40000 ALTER TABLE `TEAMS` DISABLE KEYS */;
INSERT INTO `TEAMS` VALUES (1,1,'Lincoln Lions','Blue'),(2,2,'Roosevelt Ravens','Red'),(3,3,'Jefferson Jaguars','Green'),(4,4,'Washington Wolves','Yellow');
/*!40000 ALTER TABLE `TEAMS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-13 18:51:20
