-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gamepickerdb
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `distributors`
--

DROP TABLE IF EXISTS `distributors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distributors` (
  `DistributorName` varchar(255) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DistributorName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributors`
--

LOCK TABLES `distributors` WRITE;
/*!40000 ALTER TABLE `distributors` DISABLE KEYS */;
INSERT INTO `distributors` VALUES ('Epic Games','https://epicgamesdb.info/'),('GOG','https://www.gogdb.org/'),('Steam','https://steamdb.info/');
/*!40000 ALTER TABLE `distributors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamedistributorpricing`
--

DROP TABLE IF EXISTS `gamedistributorpricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamedistributorpricing` (
  `GameID` int NOT NULL,
  `DistributorName` varchar(255) NOT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`GameID`,`DistributorName`),
  KEY `DistributorName` (`DistributorName`),
  CONSTRAINT `gamedistributorpricing_ibfk_1` FOREIGN KEY (`GameID`) REFERENCES `games` (`GameID`),
  CONSTRAINT `gamedistributorpricing_ibfk_2` FOREIGN KEY (`DistributorName`) REFERENCES `distributors` (`DistributorName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamedistributorpricing`
--

LOCK TABLES `gamedistributorpricing` WRITE;
/*!40000 ALTER TABLE `gamedistributorpricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `gamedistributorpricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamegenres`
--

DROP TABLE IF EXISTS `gamegenres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamegenres` (
  `GameID` int NOT NULL,
  `GenreID` int NOT NULL,
  PRIMARY KEY (`GameID`,`GenreID`),
  KEY `GenreID` (`GenreID`),
  CONSTRAINT `gamegenres_ibfk_1` FOREIGN KEY (`GameID`) REFERENCES `games` (`GameID`),
  CONSTRAINT `gamegenres_ibfk_2` FOREIGN KEY (`GenreID`) REFERENCES `genres` (`GenreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamegenres`
--

LOCK TABLES `gamegenres` WRITE;
/*!40000 ALTER TABLE `gamegenres` DISABLE KEYS */;
/*!40000 ALTER TABLE `gamegenres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `GameID` int NOT NULL AUTO_INCREMENT,
  `GameName` varchar(255) DEFAULT NULL,
  `ReleaseDate` date DEFAULT NULL,
  `Rating` decimal(3,2) DEFAULT NULL,
  `Description` text,
  `GenreID` int DEFAULT NULL,
  `Developer` text,
  PRIMARY KEY (`GameID`),
  KEY `GenreID_idx` (`GenreID`),
  CONSTRAINT `GenreID` FOREIGN KEY (`GenreID`) REFERENCES `genres` (`GenreID`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1000,'Cyberpunk 2077','2020-12-10',5.00,'Cyberpunk 2077 is an open-world, action-adventure RPG set in the dark future of Night City â€” a dangerous megalopolis obsessed with power, glamor, and ceaseless body modification.',2,'Cd Projekt Red'),(1001,'Bioshock Infinite','2013-03-26',5.00,'Indebted to the wrong people, with his life on the line, veteran of the U.S. Cavalry and now hired gun, Booker DeWitt has only one opportunity to wipe his slate clean. He must rescue Elizabeth, a mysterious girl imprisoned since childhood and locked up in the flying city of Columbia.',5,'Irrational Games'),(1002,'Dark Souls 3','2023-10-01',5.00,'Dark Souls continues to push the boundaries with the latest, ambitious chapter in the critically-acclaimed and genre-defining series. Prepare yourself and Embrace The Darkness!',6,'From Software'),(1003,'Elden Ring','2023-10-02',5.00,'Elden Ring is a 2022 action role-playing game developed by FromSoftware. It was directed by Hidetaka Miyazaki with worldbuilding provided by fantasy writer George R. R. Martin.',2,'From Software'),(1004,'Baldur\'s Gate 3','2023-10-03',5.00,'Baldur\'s Gate 3 is a role-playing video game developed and published by Larian Studios. It is the third main game in the Baldur\'s Gate series, based on the tabletop role-playing system of Dungeons & Dragons',2,'Larian Studios'),(1005,'Battlefield 2042','2021-11-19',2.00,'Battlefieldâ„¢ 2042 is a first-person shooter that marks the return to the iconic all-out warfare of the franchise.',9,'Dice'),(1006,'Hollow Knight','2017-02-24',5.00,'Forge your own path in Hollow Knight! An epic action adventure through a vast ruined kingdom of insects and heroes. Explore twisting caverns, battle tainted creatures and befriend bizarre bugs, all in a classic, hand-drawn 2D style.',5,'Team Cherry'),(1007,'Dying Light: Definitive Edition','2021-05-27',3.00,'First-person action survival game set in a post-apocalyptic open world overrun by flesh-hungry zombies. Roam a city devastated by a mysterious virus epidemic. Scavenge for supplies, craft weapons, and face hordes of the infected.',3,'Techland'),(1008,'The Elder Scrolls V: Skyrim Special Edition\n','2016-10-28',4.00,'Winner of more than 200 Game of the Year Awards, Skyrim Special Edition brings the epic fantasy to life in stunning detail. The Special Edition includes the critically acclaimed game and add-ons with all-new features like remastered art and effects, volumetric god rays, dynamic depth of field, screen-space reflections, and more.\n',3,'Bethesda Game Studios'),(1009,'Borderlands 3','2019-09-13',3.00,'The original shooter-looter returns, packing bazillions of guns and a mayhem-fueled adventure! Blast through new worlds and enemies as one of four new Vault Hunters.',9,'Gearbox Software'),(1010,'Hades','2018-12-06',5.00,'Defy the god of the dead as you hack and slash out of the Underworld in this rogue-like dungeon crawler from the creators of Bastion, Transistor, and Pyre.',10,'Supergiant games');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `GenreID` int NOT NULL AUTO_INCREMENT,
  `GenreName` varchar(255) NOT NULL,
  `Description` text,
  PRIMARY KEY (`GenreID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Simulations','https://en.wikipedia.org/wiki/Simulation_video_game'),(2,'RPG','https://en.wikipedia.org/wiki/Role-playing_game'),(3,'Openworld','https://en.wikipedia.org/wiki/Open_world'),(4,'Visual Novel','https://en.wikipedia.org/wiki/Visual_novel'),(5,'Action','https://en.wikipedia.org/wiki/Action_game'),(6,'Adventure','https://en.wikipedia.org/wiki/Adventure_game'),(7,'Strategy','https://en.wikipedia.org/wiki/Strategy_game'),(8,'Platformer','https://en.wikipedia.org/wiki/Platformer'),(9,'Shooter','https://en.wikipedia.org/wiki/Shooter_game'),(10,'Rogue Like','https://en.wikipedia.org/wiki/Roguelike');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchasehistory`
--

DROP TABLE IF EXISTS `purchasehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchasehistory` (
  `PurchaseID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `GameID` int DEFAULT NULL,
  PRIMARY KEY (`PurchaseID`),
  KEY `UserID` (`UserID`),
  KEY `GameID` (`GameID`),
  CONSTRAINT `purchasehistory_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `purchasehistory_ibfk_2` FOREIGN KEY (`GameID`) REFERENCES `games` (`GameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasehistory`
--

LOCK TABLES `purchasehistory` WRITE;
/*!40000 ALTER TABLE `purchasehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchasehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestlist`
--

DROP TABLE IF EXISTS `requestlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requestlist` (
  `RequestID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `GameID` int DEFAULT NULL,
  `GameName` varchar(45) NOT NULL,
  `WebsiteUrl` varchar(255) NOT NULL,
  `DateAdded` date NOT NULL,
  PRIMARY KEY (`RequestID`),
  KEY `GameID` (`GameID`),
  KEY `requestlist_ibfk_1` (`UserID`),
  CONSTRAINT `requestlist_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `requestlist_ibfk_2` FOREIGN KEY (`GameID`) REFERENCES `games` (`GameID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestlist`
--

LOCK TABLES `requestlist` WRITE;
/*!40000 ALTER TABLE `requestlist` DISABLE KEYS */;
INSERT INTO `requestlist` VALUES (1,1001,NULL,'Hogwards','https://www.greenmangaming.com/games/hogwarts-legacy-pc/','2023-10-01'),(2,1001,NULL,'Starfield','https://store.steampowered.com/app/1716740/Starfield/','2023-10-01'),(3,1005,NULL,'SackboyTm: A Big Adventure\n','https://store.steampowered.com/app/1599660/Sackboy_A_Big_Adventure/','2023-10-01'),(4,1003,NULL,'EA SPORTS FC TM 24\n','https://store.steampowered.com/app/2195250/EA_SPORTS_FC_24/','2023-10-01'),(5,1002,NULL,'NBA 2K23\n','https://store.steampowered.com/app/1919590/NBA_2K23/','2023-10-01');
/*!40000 ALTER TABLE `requestlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userreviews`
--

DROP TABLE IF EXISTS `userreviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userreviews` (
  `ReviewID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `GameID` int DEFAULT NULL,
  `Rating` decimal(3,2) DEFAULT NULL,
  `ReviewText` text,
  `ReviewDate` date DEFAULT NULL,
  PRIMARY KEY (`ReviewID`),
  KEY `UserID` (`UserID`),
  KEY `GameID` (`GameID`),
  CONSTRAINT `userreviews_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `userreviews_ibfk_2` FOREIGN KEY (`GameID`) REFERENCES `games` (`GameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userreviews`
--

LOCK TABLES `userreviews` WRITE;
/*!40000 ALTER TABLE `userreviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `userreviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1000,'random1@example.com','random1','R@nd0m#1'),(1001,' user1234@mail.com','user1234','P@ssw0rd1234'),(1002,'testemail55@gmail.com','testemail55','SecurePass55'),(1003,'random@email.net','random','R3@llyR@nd0m'),(1004,'projectuser77@outlook.com','projectuser77',' Pr0j3ctUs3r77'),(1005,'gamer99@yahoo.com','gamer99','G@m3rP@ss99'),(1006,'demoemail22@hotmail.com','demoemail22','D3m0P@ss22');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `WishlistID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `GameID` int DEFAULT NULL,
  `DateAdded` date DEFAULT NULL,
  PRIMARY KEY (`WishlistID`),
  KEY `UserID` (`UserID`),
  KEY `GameID` (`GameID`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`GameID`) REFERENCES `games` (`GameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-01 15:34:36
