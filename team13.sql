-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: gamepickerdb
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `CurrentPrice`
--

DROP TABLE IF EXISTS `CurrentPrice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CurrentPrice` (
  `GameID` int DEFAULT NULL,
  `DistributorName` varchar(255) DEFAULT NULL,
  `PriceID` int NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `DateUpdated` date NOT NULL,
  `Link` text NOT NULL,
  PRIMARY KEY (`PriceID`),
  KEY `GameID` (`GameID`),
  KEY `DistributorName` (`DistributorName`),
  CONSTRAINT `currentprice_ibfk_1` FOREIGN KEY (`GameID`) REFERENCES `Game` (`GameID`),
  CONSTRAINT `currentprice_ibfk_2` FOREIGN KEY (`DistributorName`) REFERENCES `Distributor` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CurrentPrice`
--

LOCK TABLES `CurrentPrice` WRITE;
/*!40000 ALTER TABLE `CurrentPrice` DISABLE KEYS */;
INSERT INTO `CurrentPrice` VALUES (1000,'Steam',1,59.99,'2023-10-01','https://store.steampowered.com/app/1091500/Cyberpunk_2077/'),(1001,'Steam',2,7.49,'2023-10-01','https://store.steampowered.com/app/8870/BioShock_Infinite/'),(1002,'Steam',3,59.99,'2023-10-01','https://store.steampowered.com/app/374320/DARK_SOULS_III/'),(1003,'Steam',4,59.99,'2023-10-01','https://store.steampowered.com/app/1245620/ELDEN_RING/'),(1004,'Steam',5,59.99,'2023-10-01','https://store.steampowered.com/app/1086940/Baldurs_Gate_3/'),(1005,'Steam',6,59.99,'2023-10-01','https://store.steampowered.com/app/1517290/Battlefield_2042/'),(1006,'Steam',7,14.99,'2023-10-01','https://store.steampowered.com/app/367520/Hollow_Knight/'),(1007,'Steam',8,8.99,'2023-10-01','https://store.steampowered.com/app/239140/Dying_Light/'),(1008,'Steam',9,39.99,'2023-10-01','https://store.steampowered.com/app/489830/The_Elder_Scrolls_V_Skyrim_Special_Edition/'),(1009,'Steam',10,59.99,'2023-10-01','https://store.steampowered.com/app/397540/Borderlands_3/'),(1010,'Steam',11,24.99,'2023-10-01','https://store.steampowered.com/app/1145360/Hades/'),(1000,'Epic Games',12,59.99,'2023-10-01','https://store.epicgames.com/en-US/p/cyberpunk-2077'),(1001,'Epic Games',13,54.95,'2023-10-01','https://store.epicgames.com/en-US/p/bioshock-infinite-complete-edition'),(1005,'Epic Games',14,59.99,'2023-10-01','https://store.epicgames.com/en-US/p/battlefield-2042'),(1007,'Epic Games',15,24.99,'2023-10-01','https://store.epicgames.com/en-US/p/dying-light--definitive-edition-upgrade'),(1008,'Epic Games',16,39.99,'2023-10-01','https://store.epicgames.com/en-US/p/skyrim'),(1009,'Epic Games',17,59.99,'2023-10-01','https://store.epicgames.com/en-US/p/borderlands-3'),(1010,'Epic Games',18,24.99,'2023-10-01','https://store.epicgames.com/en-US/p/hades'),(1000,'GOG',19,35.99,'2023-10-01','https://www.gog.com/en/game/cyberpunk_2077'),(1001,'GOG',20,10.99,'2023-10-01','https://www.gog.com/en/game/bioshock_infinite'),(1004,'GOG',21,59.99,'2023-10-01','https://www.gog.com/en/game/baldurs_gate_iii'),(1006,'GOG',22,14.99,'2023-10-01','https://www.gog.com/en/game/hollow_knight'),(1007,'GOG',23,49.99,'2023-10-01','https://www.gog.com/en/game/dying_light_definitive_edition'),(1008,'GOG',24,9.99,'2023-10-01','https://www.gog.com/en/game/the_elder_scrolls_v_skyrim_special_edition');
/*!40000 ALTER TABLE `CurrentPrice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Distributor`
--

DROP TABLE IF EXISTS `Distributor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Distributor` (
  `Name` varchar(255) NOT NULL,
  `WebsiteURL` varchar(255) NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Distributor`
--

LOCK TABLES `Distributor` WRITE;
/*!40000 ALTER TABLE `Distributor` DISABLE KEYS */;
INSERT INTO `Distributor` VALUES ('Epic Games','https://epicgamesdb.info/'),('GOG','https://www.gogdb.org/'),('Steam','https://steamdb.info/');
/*!40000 ALTER TABLE `Distributor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Game`
--

DROP TABLE IF EXISTS `Game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Game` (
  `GameID` int NOT NULL,
  `GameName` varchar(255) NOT NULL,
  `ReleaseDate` date NOT NULL,
  `Developer` varchar(255) NOT NULL,
  `GenreID` int NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`GameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Game`
--

LOCK TABLES `Game` WRITE;
/*!40000 ALTER TABLE `Game` DISABLE KEYS */;
INSERT INTO `Game` VALUES (1000,'Cyberpunk 2077','2020-12-10','Cd Projekt Red',2,'Cyberpunk 2077 is an open-world, action-adventure RPG set in the dark future of Night City — a dangerous megalopolis obsessed with power, glamor, and ceaseless body modification.'),(1001,'Bioshock Infinite','2013-03-26','Irrational Games',5,'Indebted to the wrong people, with his life on the line, veteran of the U.S. Cavalry and now hired gun, Booker DeWitt has only one opportunity to wipe his slate clean. He must rescue Elizabeth, a mysterious girl imprisoned since childhood and locked up in the flying city of Columbia.'),(1002,'Dark Souls 3','2023-10-01','From Software',6,'Dark Souls continues to push the boundaries with the latest, ambitious chapter in the critically-acclaimed and genre-defining series. Prepare yourself and Embrace The Darkness!'),(1003,'Elden Ring','2023-10-02','From Software',2,'Elden Ring is a 2022 action role-playing game developed by FromSoftware. It was directed by Hidetaka Miyazaki with worldbuilding provided by fantasy writer George R. R. Martin.'),(1004,'Baldur\'s Gate 3','2023-10-03','Larian Studios',2,'Baldur\'s Gate 3 is a role-playing video game developed and published by Larian Studios. It is the third main game in the Baldur\'s Gate series, based on the tabletop role-playing system of Dungeons & Dragons'),(1005,'Battlefield 2042','2021-11-19','Dice',9,'Battlefield™ 2042 is a first-person shooter that marks the return to the iconic all-out warfare of the franchise.'),(1006,'Hollow Knight','2017-02-24','Team Cherry',5,'Forge your own path in Hollow Knight! An epic action adventure through a vast ruined kingdom of insects and heroes. Explore twisting caverns, battle tainted creatures and befriend bizarre bugs, all in a classic, hand-drawn 2D style.'),(1007,'Dying Light: Definitive Edition','2021-05-27','Techland',3,'First-person action survival game set in a post-apocalyptic open world overrun by flesh-hungry zombies. Roam a city devastated by a mysterious virus epidemic. Scavenge for supplies, craft weapons, and face hordes of the infected.'),(1008,'The Elder Scrolls V: Skyrim Special Edition','2016-10-28','Bethesda Game Studios',3,'Winner of more than 200 Game of the Year Awards, Skyrim Special Edition brings the epic fantasy to life in stunning detail. The Special Edition includes the critically acclaimed game and add-ons with all-new features like remastered art and effects, volumetric god rays, dynamic depth of field, screen-space reflections, and more.'),(1009,'Borderlands 3','2019-09-13','Gearbox Software',9,'The original shooter-looter returns, packing bazillions of guns and a mayhem-fueled adventure! Blast through new worlds and enemies as one of four new Vault Hunters.'),(1010,'Hades','2018-12-06','Supergiant games',10,'Defy the god of the dead as you hack and slash out of the Underworld in this rogue-like dungeon crawler from the creators of Bastion, Transistor, and Pyre.');
/*!40000 ALTER TABLE `Game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genre`
--

DROP TABLE IF EXISTS `Genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genre` (
  `GenreID` int NOT NULL,
  `GenreName` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`GenreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre`
--

LOCK TABLES `Genre` WRITE;
/*!40000 ALTER TABLE `Genre` DISABLE KEYS */;
INSERT INTO `Genre` VALUES (1,'Simulations','https://en.wikipedia.org/wiki/Simulation_video_game'),(2,'RPG','https://en.wikipedia.org/wiki/Role-playing_game'),(3,'Openworld','https://en.wikipedia.org/wiki/Open_world'),(4,'Visual Novel','https://en.wikipedia.org/wiki/Visual_novel'),(5,'Action','https://en.wikipedia.org/wiki/Action_game'),(6,'Adventure','https://en.wikipedia.org/wiki/Adventure_game'),(7,'Strategy','https://en.wikipedia.org/wiki/Strategy_game'),(8,'Platformer','https://en.wikipedia.org/wiki/Platformer'),(9,'Shooter','https://en.wikipedia.org/wiki/Shooter_game'),(10,'Rogue Like','https://en.wikipedia.org/wiki/Roguelike');
/*!40000 ALTER TABLE `Genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PriceHistory`
--

DROP TABLE IF EXISTS `PriceHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PriceHistory` (
  `PriceHistoryID` int NOT NULL,
  `DistributorName` varchar(255) DEFAULT NULL,
  `GameID` int DEFAULT NULL,
  `Amount$` decimal(10,2) NOT NULL,
  `DateUpdated` date NOT NULL,
  `Link` text NOT NULL,
  PRIMARY KEY (`PriceHistoryID`),
  KEY `GameID` (`GameID`),
  KEY `DistributorName` (`DistributorName`),
  CONSTRAINT `pricehistory_ibfk_1` FOREIGN KEY (`GameID`) REFERENCES `Game` (`GameID`),
  CONSTRAINT `pricehistory_ibfk_2` FOREIGN KEY (`DistributorName`) REFERENCES `Distributor` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PriceHistory`
--

LOCK TABLES `PriceHistory` WRITE;
/*!40000 ALTER TABLE `PriceHistory` DISABLE KEYS */;
INSERT INTO `PriceHistory` VALUES (1,'Steam',1000,59.99,'2023-05-01','https://store.steampowered.com/app/1091500/Cyberpunk_2077/'),(2,'Steam',1000,49.99,'2023-05-15','https://store.steampowered.com/app/1091500/Cyberpunk_2077/'),(3,'Steam',1001,15.99,'2023-05-05','https://store.steampowered.com/app/8870/BioShock_Infinite/'),(4,'Epic Games',1001,12.99,'2023-05-20','https://store.epicgames.com/en-US/p/bioshock-infinite-complete-edition'),(5,'GOG',1001,14.99,'2023-05-28','https://www.gog.com/en/game/bioshock_infinite'),(6,'Steam',1002,44.99,'2023-05-10','https://store.steampowered.com/app/374320/DARK_SOULS_III/'),(7,'Epic Games',1005,54.99,'2023-05-22','https://store.epicgames.com/en-US/p/battlefield-2042'),(8,'GOG',1006,12.99,'2023-05-03','https://www.gog.com/en/game/hollow_knight'),(9,'Steam',1007,29.99,'2023-05-04','https://store.steampowered.com/app/239140/Dying_Light/'),(10,'Steam',1007,19.99,'2023-05-18','https://store.steampowered.com/app/239140/Dying_Light/'),(11,'Epic Games',1008,39.99,'2023-05-07','https://store.epicgames.com/en-US/p/skyrim'),(12,'GOG',1008,29.99,'2023-05-16','https://www.gog.com/en/game/the_elder_scrolls_v_skyrim_special_edition'),(13,'Steam',1009,49.99,'2023-05-08','https://store.steampowered.com/app/397540/Borderlands_3/'),(14,'Epic Games',1009,39.99,'2023-05-26','https://store.epicgames.com/en-US/p/borderlands-3'),(15,'Steam',1010,19.99,'2023-05-02','https://store.steampowered.com/app/1145360/Hades/'),(16,'Epic Games',1010,17.99,'2023-05-24','https://store.epicgames.com/en-US/p/hades'),(17,'GOG',1010,24.99,'2023-05-12','https://www.gog.com/en/game/hades'),(18,'Steam',1003,54.99,'2023-05-14','https://store.steampowered.com/app/1245620/ELDEN_RING/'),(19,'Epic Games',1003,49.99,'2023-05-27','https://store.epicgames.com/en-US/p/elden-ring'),(20,'GOG',1004,49.99,'2023-05-29','https://www.gog.com/en/game/baldurs_gate_iii'),(21,'Steam',1006,11.99,'2023-05-19','https://store.steampowered.com/app/367520/Hollow_Knight/'),(22,'Epic Games',1004,44.99,'2023-05-09','https://store.epicgames.com/en-US/p/baldurs-gate-3'),(23,'GOG',1009,45.99,'2023-05-11','https://www.gog.com/en/game/borderlands-3'),(24,'Steam',1008,35.99,'2023-05-21','https://store.steampowered.com/app/489830/The_Elder_Scrolls_V_Skyrim_Special_Edition/'),(25,'Epic Games',1002,42.99,'2023-05-31','https://store.epicgames.com/en-US/p/dark-souls-3');
/*!40000 ALTER TABLE `PriceHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PurchaseHistory`
--

DROP TABLE IF EXISTS `PurchaseHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PurchaseHistory` (
  `PurchaseID` int NOT NULL,
  `UserID` int DEFAULT NULL,
  `GameID` int DEFAULT NULL,
  `DistributorName` varchar(255) DEFAULT NULL,
  `DatePurchased` date NOT NULL,
  `PurchasePrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`PurchaseID`),
  KEY `UserID` (`UserID`),
  KEY `GameID` (`GameID`),
  KEY `DistributorName` (`DistributorName`),
  CONSTRAINT `purchasehistory_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`),
  CONSTRAINT `purchasehistory_ibfk_2` FOREIGN KEY (`GameID`) REFERENCES `Game` (`GameID`),
  CONSTRAINT `purchasehistory_ibfk_3` FOREIGN KEY (`DistributorName`) REFERENCES `Distributor` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PurchaseHistory`
--

LOCK TABLES `PurchaseHistory` WRITE;
/*!40000 ALTER TABLE `PurchaseHistory` DISABLE KEYS */;
INSERT INTO `PurchaseHistory` VALUES (1,1000,1000,'Steam','2023-10-01',59.99),(2,1000,1005,'Epic Games','2023-10-01',54.95),(3,1000,1003,'GOG','2023-10-02',59.99),(4,1001,1010,'Steam','2023-10-02',24.99),(5,1001,1004,'Epic Games','2023-10-03',59.99),(6,1001,1002,'GOG','2023-10-03',59.99),(7,1002,1001,'Steam','2023-10-04',7.49),(8,1002,1007,'Epic Games','2023-10-05',24.99),(9,1002,1009,'GOG','2023-10-06',59.99),(10,1003,1000,'Steam','2023-10-06',59.99),(11,1003,1006,'Epic Games','2023-10-07',14.99),(12,1003,1008,'GOG','2023-10-08',39.99),(13,1004,1002,'Steam','2023-10-09',59.99),(14,1004,1003,'Epic Games','2023-10-10',59.99),(15,1004,1005,'GOG','2023-10-11',59.99),(16,1005,1004,'Steam','2023-10-11',59.99),(17,1005,1006,'Epic Games','2023-10-12',14.99),(18,1005,1007,'GOG','2023-10-13',49.99),(19,1006,1008,'Steam','2023-10-14',9.99),(20,1006,1009,'Epic Games','2023-10-15',59.99),(21,1006,1010,'GOG','2023-10-16',24.99),(22,1004,1000,'Steam','2023-10-17',59.99),(23,1004,1001,'Epic Games','2023-10-18',54.95),(24,1004,1002,'GOG','2023-10-19',59.99),(25,1005,1003,'Steam','2023-10-20',59.99);
/*!40000 ALTER TABLE `PurchaseHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RequestList`
--

DROP TABLE IF EXISTS `RequestList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RequestList` (
  `RequestID` int NOT NULL,
  `UserID` int DEFAULT NULL,
  `GameName` varchar(255) DEFAULT NULL,
  `WebsiteURL` varchar(255) NOT NULL,
  `DateAdded` date NOT NULL,
  PRIMARY KEY (`RequestID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `requestlist_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RequestList`
--

LOCK TABLES `RequestList` WRITE;
/*!40000 ALTER TABLE `RequestList` DISABLE KEYS */;
INSERT INTO `RequestList` VALUES (1,1001,'Hogwards Legacy','https://www.greenmangaming.com/games/hogwarts-legacy-pc/','2023-10-01'),(2,1001,'Starfield','https://store.steampowered.com/app/1716740/Starfield/','2023-10-01'),(3,1005,'SackboyTm: A Big Adventure','https://store.steampowered.com/app/1599660/Sackboy_A_Big_Adventure/','2023-10-01'),(4,1003,'EA SPORTS FC TM 24','https://store.steampowered.com/app/2195250/EA_SPORTS_FC_24/','2023-10-01'),(5,1002,'NBA 2K23','https://store.steampowered.com/app/1919590/NBA_2K23/','2023-10-01');
/*!40000 ALTER TABLE `RequestList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserReview`
--

DROP TABLE IF EXISTS `UserReview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserReview` (
  `ReviewID` int NOT NULL,
  `UserID` int DEFAULT NULL,
  `GameID` int DEFAULT NULL,
  `Rating` int NOT NULL,
  `ReviewDate` date NOT NULL,
  `ReviewText` text NOT NULL,
  PRIMARY KEY (`ReviewID`),
  KEY `UserID` (`UserID`),
  KEY `GameID` (`GameID`),
  CONSTRAINT `userreview_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`),
  CONSTRAINT `userreview_ibfk_2` FOREIGN KEY (`GameID`) REFERENCES `Game` (`GameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserReview`
--

LOCK TABLES `UserReview` WRITE;
/*!40000 ALTER TABLE `UserReview` DISABLE KEYS */;
INSERT INTO `UserReview` VALUES (1,1000,1000,5,'2023-09-06','Absolutely loved this game! A must-buy for RPG lovers.'),(2,1001,1001,4,'2023-09-08','The storyline is captivating but some bugs here and there.'),(3,1002,1002,5,'2023-09-09','One of the best Souls games out there!'),(4,1003,1003,3,'2023-09-10','The graphics are amazing but felt the storyline was lacking depth.'),(5,1004,1004,4,'2023-09-11','A classic revisited. Loved every moment.'),(6,1005,1005,2,'2023-09-12','Too many glitches. Had higher expectations.'),(7,1006,1006,5,'2023-09-13','A must-have for any strategy game lover.'),(8,1000,1007,3,'2023-09-14','Good for casual gameplay. Not as immersive as I\'d hoped.'),(9,1002,1008,4,'2023-09-15','An epic tale that kept me on the edge of my seat.'),(10,1003,1009,5,'2023-09-16','Amazing multiplayer modes. Totally worth the price.');
/*!40000 ALTER TABLE `UserReview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `UserID` int NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1000,'random1@example.com','random1','R@nd0m#1'),(1001,'user1234@mail.com','user1234','P@ssw0rd1234'),(1002,'testemail55@gmail.com','testemail55','SecurePass55'),(1003,'random@email.net','random','R3@llyR@nd0m'),(1004,'projectuser77@outlook.com','projectuser77','Pr0j3ctUs3r77'),(1005,'gamer99@yahoo.com','gamer99','G@m3rP@ss99'),(1006,'demoemail22@hotmail.com','demoemail22','D3m0P@ss22');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserWishlist`
--

DROP TABLE IF EXISTS `UserWishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserWishlist` (
  `WishlistID` int NOT NULL,
  `UserID` int DEFAULT NULL,
  `GameID` int DEFAULT NULL,
  `DateAdded` date NOT NULL,
  PRIMARY KEY (`WishlistID`),
  KEY `UserID` (`UserID`),
  KEY `GameID` (`GameID`),
  CONSTRAINT `userwishlist_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`),
  CONSTRAINT `userwishlist_ibfk_2` FOREIGN KEY (`GameID`) REFERENCES `Game` (`GameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserWishlist`
--

LOCK TABLES `UserWishlist` WRITE;
/*!40000 ALTER TABLE `UserWishlist` DISABLE KEYS */;
INSERT INTO `UserWishlist` VALUES (1,1000,1000,'2023-10-01'),(2,1000,1005,'2023-10-01'),(3,1000,1003,'2023-10-01'),(4,1001,1010,'2023-10-01'),(5,1001,1004,'2023-10-01'),(6,1001,1002,'2023-10-01'),(7,1002,1001,'2023-10-02'),(8,1002,1007,'2023-10-03'),(9,1002,1009,'2023-10-04');
/*!40000 ALTER TABLE `UserWishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-14 14:03:19
