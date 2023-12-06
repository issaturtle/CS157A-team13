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
-- Table structure for table `currentprice`
--

DROP TABLE IF EXISTS `currentprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currentprice` (
  `PriceID` int NOT NULL AUTO_INCREMENT,
  `GameID` int NOT NULL,
  `DistributorName` varchar(255) DEFAULT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `DateUpdated` date NOT NULL,
  `Link` varchar(255) NOT NULL,
  PRIMARY KEY (`PriceID`),
  KEY `GameID` (`GameID`),
  KEY `DistributorName` (`DistributorName`),
  CONSTRAINT `currentprice_ibfk_1` FOREIGN KEY (`GameID`) REFERENCES `game` (`GameID`),
  CONSTRAINT `currentprice_ibfk_2` FOREIGN KEY (`DistributorName`) REFERENCES `distributor` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currentprice`
--

LOCK TABLES `currentprice` WRITE;
/*!40000 ALTER TABLE `currentprice` DISABLE KEYS */;
INSERT INTO `currentprice` VALUES (1,1000,'Steam',59.99,'2023-12-03','https://store.steampowered.com/app/1091500/Cyberpunk_2077/'),(2,1001,'Steam',29.99,'2023-12-03','https://store.steampowered.com/app/8870/BioShock_Infinite/'),(3,1002,'Steam',59.99,'2023-10-01','https://store.steampowered.com/app/374320/DARK_SOULS_III/'),(4,1003,'Steam',59.99,'2023-10-01','https://store.steampowered.com/app/1245620/ELDEN_RING/'),(5,1004,'Steam',59.99,'2023-10-01','https://store.steampowered.com/app/1086940/Baldurs_Gate_3/'),(6,1005,'Steam',59.99,'2023-10-01','https://store.steampowered.com/app/1517290/Battlefield_2042/'),(7,1006,'Steam',14.99,'2023-10-01','https://store.steampowered.com/app/367520/Hollow_Knight/'),(8,1007,'Steam',8.99,'2023-10-01','https://store.steampowered.com/app/239140/Dying_Light/'),(9,1008,'Steam',39.99,'2023-10-01','https://store.steampowered.com/app/489830/The_Elder_Scrolls_V_Skyrim_Special_Edition/'),(10,1009,'Steam',59.99,'2023-10-01','https://store.steampowered.com/app/397540/Borderlands_3/'),(11,1010,'Steam',24.99,'2023-10-01','https://store.steampowered.com/app/1145360/Hades/'),(12,1000,'Epic Games',59.99,'2023-10-14','https://epicgamesdb.info/p/5e0277378de542ce9bf891d2f919d6c8/cyberpunk-2077'),(13,1001,'Epic Games',54.97,'2023-10-14','https://epicgamesdb.info/p/1891e44daa4a4b95959f458644c600f2/bioshock-infinite-complete-edition'),(14,1005,'Epic Games',59.99,'2023-10-14','https://epicgamesdb.info/p/a85bd01b67184c4c83f03f05404e07a8/battlefield-2042'),(15,1007,'Epic Games',24.99,'2023-10-14','https://epicgamesdb.info/p/9b7c69a2abdd45f390b1781ddc5de30a/dying-light--definitive-edition-upgrade'),(16,1008,'Epic Games',39.99,'2023-10-14','https://epicgamesdb.info/p/2d837b8ee87b434a99a80fca0e4eb960/skyrim'),(17,1009,'Epic Games',59.99,'2023-10-14','https://epicgamesdb.info/p/dd845909e1504c048c14499eab60ec62/borderlands-3'),(18,1010,'Epic Games',24.99,'2023-10-14','https://epicgamesdb.info/p/2ae6edb2223c4f8c97e9839b5b6497bb/hades'),(19,1000,'GOG',59.99,'2023-12-05','https://www.gog.com/en/game/cyberpunk_2077'),(20,1001,'GOG',10.99,'2023-10-01','https://www.gog.com/en/game/bioshock_infinite'),(21,1004,'GOG',59.99,'2023-10-01','https://www.gog.com/en/game/baldurs_gate_iii'),(22,1006,'GOG',14.99,'2023-10-01','https://www.gog.com/en/game/hollow_knight'),(23,1007,'GOG',49.99,'2023-10-01','https://www.gog.com/en/game/dying_light_definitive_edition'),(24,1008,'GOG',9.99,'2023-10-01','https://www.gog.com/en/game/the_elder_scrolls_v_skyrim_special_edition'),(25,1022,'Steam',22.00,'2023-11-27','https://store.steampowered.com/app/1966720/Lethal_Company/'),(27,1100,'Steam',0.00,'2017-11-15','https://store.steampowered.com/app/552990/World_of_Warships/'),(29,1102,'Steam',3.00,'2023-12-02','https://www.google.com/'),(30,1114,'Steam',29.24,'2023-12-03','https://store.steampowered.com/app/686810/Hell_Let_Loose/'),(31,1115,'Steam',11.99,'2023-12-03','https://store.steampowered.com/app/671860/BattleBit_Remastered/');
/*!40000 ALTER TABLE `currentprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributor`
--

DROP TABLE IF EXISTS `distributor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distributor` (
  `Name` varchar(255) NOT NULL,
  `WebsiteURL` varchar(255) NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributor`
--

LOCK TABLES `distributor` WRITE;
/*!40000 ALTER TABLE `distributor` DISABLE KEYS */;
INSERT INTO `distributor` VALUES ('Epic Games','https://epicgamesdb.info/'),('GOG','https://www.gogdb.org/'),('Steam','https://steamdb.info/');
/*!40000 ALTER TABLE `distributor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `GameID` int NOT NULL AUTO_INCREMENT,
  `GameName` varchar(255) NOT NULL,
  `ReleaseDate` date NOT NULL,
  `Developer` varchar(255) NOT NULL,
  `GenreID` int NOT NULL,
  `Description` text NOT NULL,
  `Link` varchar(255) DEFAULT NULL,
  `OriginalPrice` float DEFAULT NULL,
  PRIMARY KEY (`GameID`)
) ENGINE=InnoDB AUTO_INCREMENT=1119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1000,'Cyberpunk 2077','2020-12-10','Cd Projekt Red',2,'Cyberpunk 2077 is an open-world, action-adventure RPG set in the dark future of Night City — a dangerous megalopolis obsessed with power, glamor, and ceaseless body modification.','https://cdn.akamai.steamstatic.com/steam/apps/1091500/header_alt_assets_1.jpg?t=1697461008',59.99),(1001,'Bioshock Infinite','2013-03-26','Irrational Games',5,'Indebted to the wrong people, with his life on the line, veteran of the U.S. Cavalry and now hired gun, Booker DeWitt has only one opportunity to wipe his slate clean. He must rescue Elizabeth, a mysterious girl imprisoned since childhood and locked up in the flying city of Columbia.','https://cdn.akamai.steamstatic.com/steam/apps/8870/header.jpg?t=1602794480',59.99),(1002,'Dark Souls 3','2023-10-01','From Software',6,'Dark Souls continues to push the boundaries with the latest, ambitious chapter in the critically-acclaimed and genre-defining series. Prepare yourself and Embrace The Darkness!','https://cdn.akamai.steamstatic.com/steam/apps/374320/header.jpg?t=1682651227',59.99),(1003,'Elden Ring','2023-10-02','From Software',2,'Elden Ring is a 2022 action role-playing game developed by FromSoftware. It was directed by Hidetaka Miyazaki with worldbuilding provided by fantasy writer George R. R. Martin.','https://cdn.akamai.steamstatic.com/steam/apps/1245620/header.jpg?t=16836184433',59.99),(1004,'Baldur\'s Gate 3','2023-10-03','Larian Studios',2,'Baldur\'s Gate 3 is a role-playing video game developed and published by Larian Studios. It is the third main game in the Baldur\'s Gate series, based on the tabletop role-playing system of Dungeons & Dragons','https://cdn.akamai.steamstatic.com/steam/apps/1086940/header.jpg?t=16969488011',59.99),(1005,'Battlefield 2042','2021-11-19','Dice',9,'Battlefield™ 2042 is a first-person shooter that marks the return to the iconic all-out warfare of the franchise.','https://cdn.akamai.steamstatic.com/steam/apps/1517290/header.jpg?t=16971331922',59.99),(1006,'Hollow Knight','2017-02-24','Team Cherry',5,'Forge your own path in Hollow Knight! An epic action adventure through a vast ruined kingdom of insects and heroes. Explore twisting caverns, battle tainted creatures and befriend bizarre bugs, all in a classic, hand-drawn 2D style.','https://cdn.akamai.steamstatic.com/steam/apps/367520/header.jpg?t=1695270428',14.99),(1007,'Dying Light: Definitive Edition','2021-05-27','Techland',3,'First-person action survival game set in a post-apocalyptic open world overrun by flesh-hungry zombies. Roam a city devastated by a mysterious virus epidemic. Scavenge for supplies, craft weapons, and face hordes of the infected.','https://cdn.akamai.steamstatic.com/steam/apps/239140/header.jpg?t=1696608765',59.99),(1008,'The Elder Scrolls V: Skyrim Special Edition','2016-10-28','Bethesda Game Studios',3,'Winner of more than 200 Game of the Year Awards, Skyrim Special Edition brings the epic fantasy to life in stunning detail. The Special Edition includes the critically acclaimed game and add-ons with all-new features like remastered art and effects, volumetric god rays, dynamic depth of field, screen-space reflections, and more.','https://cdn.akamai.steamstatic.com/steam/apps/489830/header.jpg?t=1650909796',59.99),(1009,'Borderlands 3','2019-09-13','Gearbox Software',9,'The original shooter-looter returns, packing bazillions of guns and a mayhem-fueled adventure! Blast through new worlds and enemies as one of four new Vault Hunters.','https://cdn.akamai.steamstatic.com/steam/apps/397540/header.jpg?t=1693524259',59.99),(1010,'Hades','2018-12-06','Supergiant games',10,'Defy the god of the dead as you hack and slash out of the Underworld in this rogue-like dungeon crawler from the creators of Bastion, Transistor, and Pyre.','https://cdn.akamai.steamstatic.com/steam/apps/1145360/header.jpg?t=16802938011',29.99),(1022,'hung','2023-11-27','hung',1,'Baldur\'s Gate 3 is a role-playing video game developed and published by Larian Studios. It is the third main game in the Baldur\'s Gate series, based on the tabletop role-playing system of Dungeons & Dragons','https://cdn.cloudflare.steamstatic.com/steam/apps/1966720/header.jpg?t=1700231592',22),(1100,'World of Warships','2017-11-15','Wargaming Group Limited',2,'Immerse yourself in thrilling naval battles and assemble an armada of over 600 ships from the first half of the 20th century — from stealthy destroyers to gigantic battleships. Change the look of your ship, choose upgrades to suit your play style, and go into battle with other players!','https://cdn.cloudflare.steamstatic.com/steam/apps/552990/header.jpg?t=1700138465',0),(1102,'hunggo','2023-12-02','hung2',2,'this test','https://www.google.com/logos/doodles/2023/seasonal-holidays-2023-6753651837110165.2-6752733080612634-cst.gif',3),(1114,'Hell Let Loose','2021-07-27','Team17',5,'Join the ever expanding experience of Hell Let Loose - a hardcore World War Two first person shooter with epic battles of 100 players with infantry, tanks, artillery, a dynamically shifting front line and a unique resource based RTS-inspired meta-game.','https://cdn.akamai.steamstatic.com/steam/apps/686810/header.jpg?t=1700748119',44.99),(1115,'BattleBit Remastered','2023-06-15','SgtOkiDoki, Vilaskis, TheLiquidHorse',5,'BattleBit Remastered is a low-poly, massive multiplayer FPS, supporting 254 players per server. Battle on a near-fully destructible map with various vehicles!','https://cdn.akamai.steamstatic.com/steam/apps/671860/header_alt_assets_1.jpg?t=1701366222',14.99);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `GenreID` int NOT NULL AUTO_INCREMENT,
  `GenreName` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`GenreID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Simulations','https://en.wikipedia.org/wiki/Simulation_video_game'),(2,'RPG','https://en.wikipedia.org/wiki/Role-playing_game'),(3,'Openworld','https://en.wikipedia.org/wiki/Open_world'),(4,'Visual Novel','https://en.wikipedia.org/wiki/Visual_novel'),(5,'Action','https://en.wikipedia.org/wiki/Action_game'),(6,'Adventure','https://en.wikipedia.org/wiki/Adventure_game'),(7,'Strategy','https://en.wikipedia.org/wiki/Strategy_game'),(8,'Platformer','https://en.wikipedia.org/wiki/Platformer'),(9,'Shooter','https://en.wikipedia.org/wiki/Shooter_game'),(10,'Rogue Like','https://en.wikipedia.org/wiki/Roguelike');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricehistory`
--

DROP TABLE IF EXISTS `pricehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pricehistory` (
  `PriceHistoryID` int NOT NULL AUTO_INCREMENT,
  `DistributorName` varchar(255) DEFAULT NULL,
  `GameID` int NOT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `DateUpdated` date NOT NULL,
  `Link` text NOT NULL,
  PRIMARY KEY (`PriceHistoryID`),
  KEY `GameID` (`GameID`),
  KEY `DistributorName` (`DistributorName`),
  CONSTRAINT `pricehistory_ibfk_1` FOREIGN KEY (`GameID`) REFERENCES `game` (`GameID`),
  CONSTRAINT `pricehistory_ibfk_2` FOREIGN KEY (`DistributorName`) REFERENCES `distributor` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricehistory`
--

LOCK TABLES `pricehistory` WRITE;
/*!40000 ALTER TABLE `pricehistory` DISABLE KEYS */;
INSERT INTO `pricehistory` VALUES (1,'Steam',1000,59.99,'2023-05-01','https://store.steampowered.com/app/1091500/Cyberpunk_2077/'),(2,'Steam',1000,49.99,'2023-05-15','https://store.steampowered.com/app/1091500/Cyberpunk_2077/'),(3,'Steam',1001,15.99,'2023-05-05','https://store.steampowered.com/app/8870/BioShock_Infinite/'),(4,'Epic Games',1001,12.99,'2023-05-20','https://store.epicgames.com/en-US/p/bioshock-infinite-complete-edition'),(5,'GOG',1001,14.99,'2023-05-28','https://www.gog.com/en/game/bioshock_infinite'),(6,'Steam',1002,44.99,'2023-05-10','https://store.steampowered.com/app/374320/DARK_SOULS_III/'),(7,'Epic Games',1005,54.99,'2023-05-22','https://store.epicgames.com/en-US/p/battlefield-2042'),(8,'GOG',1006,12.99,'2023-05-03','https://www.gog.com/en/game/hollow_knight'),(9,'Steam',1007,29.99,'2023-05-04','https://store.steampowered.com/app/239140/Dying_Light/'),(10,'Steam',1007,19.99,'2023-05-18','https://store.steampowered.com/app/239140/Dying_Light/'),(11,'Epic Games',1008,39.99,'2023-05-07','https://store.epicgames.com/en-US/p/skyrim'),(12,'GOG',1008,29.99,'2023-05-16','https://www.gog.com/en/game/the_elder_scrolls_v_skyrim_special_edition'),(13,'Steam',1009,49.99,'2023-05-08','https://store.steampowered.com/app/397540/Borderlands_3/'),(14,'Epic Games',1009,39.99,'2023-05-26','https://store.epicgames.com/en-US/p/borderlands-3'),(15,'Steam',1010,19.99,'2023-05-02','https://store.steampowered.com/app/1145360/Hades/'),(16,'Epic Games',1010,17.99,'2023-05-24','https://store.epicgames.com/en-US/p/hades'),(17,'GOG',1010,24.99,'2023-05-12','https://www.gog.com/en/game/hades'),(18,'Steam',1003,54.99,'2023-05-14','https://store.steampowered.com/app/1245620/ELDEN_RING/'),(19,'Epic Games',1003,49.99,'2023-05-27','https://store.epicgames.com/en-US/p/elden-ring'),(20,'GOG',1004,49.99,'2023-05-29','https://www.gog.com/en/game/baldurs_gate_iii'),(21,'Steam',1006,11.99,'2023-05-19','https://store.steampowered.com/app/367520/Hollow_Knight/'),(22,'Epic Games',1004,44.99,'2023-05-09','https://store.epicgames.com/en-US/p/baldurs-gate-3'),(23,'GOG',1009,45.99,'2023-05-11','https://www.gog.com/en/game/borderlands-3'),(24,'Steam',1008,35.99,'2023-05-21','https://store.steampowered.com/app/489830/The_Elder_Scrolls_V_Skyrim_Special_Edition/'),(25,'Epic Games',1002,42.99,'2023-05-31','https://store.epicgames.com/en-US/p/dark-souls-3'),(26,'Epic Games',1000,59.99,'2023-10-14','https://epicgamesdb.info/p/5e0277378de542ce9bf891d2f919d6c8/cyberpunk-2077'),(27,'Epic Games',1000,59.99,'2023-10-14','https://epicgamesdb.info/p/5e0277378de542ce9bf891d2f919d6c8/cyberpunk-2077'),(28,'Epic Games',1010,24.99,'2023-10-14','https://epicgamesdb.info/p/2ae6edb2223c4f8c97e9839b5b6497bb/hades'),(29,'Epic Games',1008,39.99,'2023-10-14','https://epicgamesdb.info/p/2d837b8ee87b434a99a80fca0e4eb960/skyrim'),(30,'Epic Games',1000,59.99,'2023-10-14','https://epicgamesdb.info/p/5e0277378de542ce9bf891d2f919d6c8/cyberpunk-2077'),(31,'Epic Games',1001,54.97,'2023-10-14','https://epicgamesdb.info/p/1891e44daa4a4b95959f458644c600f2/bioshock-infinite-complete-edition'),(32,'Epic Games',1010,24.99,'2023-10-14','https://epicgamesdb.info/p/2ae6edb2223c4f8c97e9839b5b6497bb/hades'),(33,'Epic Games',1008,39.99,'2023-10-14','https://epicgamesdb.info/p/2d837b8ee87b434a99a80fca0e4eb960/skyrim'),(34,'Epic Games',1009,59.99,'2023-10-14','https://epicgamesdb.info/p/dd845909e1504c048c14499eab60ec62/borderlands-3'),(35,'Epic Games',1007,24.99,'2023-10-14','https://epicgamesdb.info/p/9b7c69a2abdd45f390b1781ddc5de30a/dying-light--definitive-edition-upgrade'),(36,'Epic Games',1005,59.99,'2023-10-14','https://epicgamesdb.info/p/a85bd01b67184c4c83f03f05404e07a8/battlefield-2042'),(37,'Epic Games',1000,59.99,'2023-10-14','https://epicgamesdb.info/p/5e0277378de542ce9bf891d2f919d6c8/cyberpunk-2077'),(38,'Epic Games',1001,54.97,'2023-10-14','https://epicgamesdb.info/p/1891e44daa4a4b95959f458644c600f2/bioshock-infinite-complete-edition'),(39,'Epic Games',1010,24.99,'2023-10-14','https://epicgamesdb.info/p/2ae6edb2223c4f8c97e9839b5b6497bb/hades'),(40,'Epic Games',1008,39.99,'2023-10-14','https://epicgamesdb.info/p/2d837b8ee87b434a99a80fca0e4eb960/skyrim'),(41,'Epic Games',1009,59.99,'2023-10-14','https://epicgamesdb.info/p/dd845909e1504c048c14499eab60ec62/borderlands-3'),(42,'Epic Games',1007,24.99,'2023-10-14','https://epicgamesdb.info/p/9b7c69a2abdd45f390b1781ddc5de30a/dying-light--definitive-edition-upgrade'),(43,'Epic Games',1005,59.99,'2023-10-14','https://epicgamesdb.info/p/a85bd01b67184c4c83f03f05404e07a8/battlefield-2042'),(44,'Steam',1100,0.00,'2017-11-15','https://store.steampowered.com/app/552990/World_of_Warships/'),(46,'Steam',1102,3.00,'2023-12-02','https://www.google.com/'),(47,'Steam',1114,44.99,'2023-12-03','https://store.steampowered.com/app/686810/Hell_Let_Loose/'),(48,'Steam',1115,14.99,'2023-12-03','https://store.steampowered.com/app/671860/BattleBit_Remastered/'),(49,'Steam',1000,59.99,'2023-12-03','https://store.steampowered.com/app/1091500/Cyberpunk_2077/'),(50,'Steam',1001,29.99,'2023-12-03','https://store.steampowered.com/app/8870/BioShock_Infinite/'),(51,'Steam',1114,29.24,'2023-12-03','https://store.steampowered.com/app/686810/Hell_Let_Loose/'),(52,'Steam',1115,11.99,'2023-12-03','https://store.steampowered.com/app/671860/BattleBit_Remastered/'),(53,'Steam',1000,25.99,'2023-11-27','https://store.steampowered.com/agecheck/app/1091500/'),(54,'Steam',1000,25.99,'2023-07-10','https://store.steampowered.com/agecheck/app/1091500/'),(58,'GOG',1000,29.99,'2023-12-05','https://www.gog.com/en/game/cyberpunk_2077'),(59,'GOG',1000,59.99,'2023-12-05','https://www.gog.com/en/game/cyberpunk_2077'),(60,'Steam',1000,37.20,'2023-08-31','https://store.steampowered.com/agecheck/app/1091500/'),(61,'Steam',1000,56.13,'2023-11-05','https://store.steampowered.com/agecheck/app/1091500/'),(62,'Steam',1000,59.71,'2023-08-28','https://store.steampowered.com/agecheck/app/1091500/'),(63,'Steam',1000,37.21,'2023-07-06','https://store.steampowered.com/agecheck/app/1091500/'),(64,'Steam',1000,54.14,'2023-06-09','https://store.steampowered.com/agecheck/app/1091500/'),(65,'Steam',1000,50.25,'2023-07-20','https://store.steampowered.com/agecheck/app/1091500/'),(66,'Steam',1000,37.85,'2023-10-31','https://store.steampowered.com/agecheck/app/1091500/'),(67,'Steam',1000,51.08,'2023-09-15','https://store.steampowered.com/agecheck/app/1091500/'),(68,'Steam',1000,50.12,'2023-09-16','https://store.steampowered.com/agecheck/app/1091500/'),(69,'Steam',1000,57.96,'2023-07-21','https://store.steampowered.com/agecheck/app/1091500/'),(70,'Steam',1000,47.51,'2023-07-06','https://store.steampowered.com/agecheck/app/1091500/'),(71,'Steam',1000,48.99,'2023-09-03','https://store.steampowered.com/agecheck/app/1091500/'),(72,'Steam',1000,44.38,'2023-06-19','https://store.steampowered.com/agecheck/app/1091500/'),(73,'Steam',1000,40.16,'2023-07-03','https://store.steampowered.com/agecheck/app/1091500/'),(74,'Steam',1000,45.06,'2023-09-04','https://store.steampowered.com/agecheck/app/1091500/'),(75,'Steam',1000,36.69,'2023-12-01','https://store.steampowered.com/agecheck/app/1091500/'),(76,'Steam',1000,38.60,'2023-06-24','https://store.steampowered.com/agecheck/app/1091500/'),(77,'Steam',1000,50.43,'2023-08-23','https://store.steampowered.com/agecheck/app/1091500/'),(78,'Steam',1000,30.22,'2023-07-06','https://store.steampowered.com/agecheck/app/1091500/'),(79,'Steam',1000,53.94,'2023-08-20','https://store.steampowered.com/agecheck/app/1091500/'),(80,'Steam',1000,43.15,'2023-09-11','https://store.steampowered.com/agecheck/app/1091500/'),(81,'Steam',1000,46.72,'2023-08-31','https://store.steampowered.com/agecheck/app/1091500/'),(82,'Steam',1000,42.52,'2023-06-01','https://store.steampowered.com/agecheck/app/1091500/'),(83,'Steam',1000,43.48,'2023-06-18','https://store.steampowered.com/agecheck/app/1091500/'),(84,'Steam',1000,33.21,'2023-11-23','https://store.steampowered.com/agecheck/app/1091500/'),(85,'Steam',1000,40.01,'2023-11-07','https://store.steampowered.com/agecheck/app/1091500/'),(86,'Steam',1000,58.30,'2023-11-25','https://store.steampowered.com/agecheck/app/1091500/'),(87,'Steam',1000,31.88,'2023-07-30','https://store.steampowered.com/agecheck/app/1091500/'),(88,'Steam',1000,49.31,'2023-09-12','https://store.steampowered.com/agecheck/app/1091500/'),(89,'Steam',1000,58.49,'2023-08-21','https://store.steampowered.com/agecheck/app/1091500/'),(90,'Steam',1000,56.11,'2023-06-02','https://store.steampowered.com/agecheck/app/1091500/'),(91,'Steam',1000,48.07,'2023-10-29','https://store.steampowered.com/agecheck/app/1091500/'),(92,'Steam',1000,39.42,'2023-06-15','https://store.steampowered.com/agecheck/app/1091500/'),(93,'Steam',1000,45.56,'2023-05-25','https://store.steampowered.com/agecheck/app/1091500/'),(94,'Steam',1000,59.92,'2023-11-12','https://store.steampowered.com/agecheck/app/1091500/'),(95,'Steam',1000,41.67,'2023-11-22','https://store.steampowered.com/agecheck/app/1091500/'),(96,'Steam',1000,51.14,'2023-07-15','https://store.steampowered.com/agecheck/app/1091500/'),(97,'Steam',1000,34.15,'2023-11-30','https://store.steampowered.com/agecheck/app/1091500/'),(98,'Steam',1000,59.44,'2023-12-02','https://store.steampowered.com/agecheck/app/1091500/'),(99,'Steam',1000,46.05,'2023-05-28','https://store.steampowered.com/agecheck/app/1091500/'),(100,'Steam',1000,33.67,'2023-11-17','https://store.steampowered.com/agecheck/app/1091500/'),(101,'Steam',1000,39.99,'2023-08-22','https://store.steampowered.com/agecheck/app/1091500/'),(102,'Steam',1000,38.49,'2023-09-25','https://store.steampowered.com/agecheck/app/1091500/'),(103,'Steam',1000,36.15,'2023-07-09','https://store.steampowered.com/agecheck/app/1091500/'),(104,'Steam',1000,32.24,'2023-08-07','https://store.steampowered.com/agecheck/app/1091500/'),(105,'Steam',1000,43.09,'2023-08-01','https://store.steampowered.com/agecheck/app/1091500/'),(106,'Steam',1000,46.07,'2023-05-30','https://store.steampowered.com/agecheck/app/1091500/'),(107,'Steam',1000,42.86,'2023-09-06','https://store.steampowered.com/agecheck/app/1091500/'),(108,'Steam',1000,41.66,'2023-09-08','https://store.steampowered.com/agecheck/app/1091500/'),(109,'Steam',1000,51.13,'2023-10-25','https://store.steampowered.com/agecheck/app/1091500/'),(110,'Steam',1000,54.66,'2023-11-25','https://store.steampowered.com/agecheck/app/1091500/'),(111,'Steam',1000,51.54,'2023-10-23','https://store.steampowered.com/agecheck/app/1091500/'),(112,'Steam',1000,42.15,'2023-06-18','https://store.steampowered.com/agecheck/app/1091500/'),(113,'Steam',1000,39.88,'2023-10-17','https://store.steampowered.com/agecheck/app/1091500/'),(114,'Steam',1000,48.97,'2023-06-07','https://store.steampowered.com/agecheck/app/1091500/'),(115,'Steam',1000,58.51,'2023-08-03','https://store.steampowered.com/agecheck/app/1091500/'),(116,'Steam',1000,50.18,'2023-11-24','https://store.steampowered.com/agecheck/app/1091500/'),(117,'Steam',1000,32.91,'2023-10-31','https://store.steampowered.com/agecheck/app/1091500/'),(118,'Steam',1000,36.94,'2023-07-09','https://store.steampowered.com/agecheck/app/1091500/'),(119,'Steam',1000,42.06,'2023-07-19','https://store.steampowered.com/agecheck/app/1091500/'),(120,'Steam',1000,38.50,'2023-08-06','https://store.steampowered.com/agecheck/app/1091500/'),(121,'Steam',1000,49.31,'2023-08-01','https://store.steampowered.com/agecheck/app/1091500/'),(122,'Steam',1000,57.26,'2023-08-17','https://store.steampowered.com/agecheck/app/1091500/'),(123,'Steam',1000,45.85,'2023-10-20','https://store.steampowered.com/agecheck/app/1091500/'),(124,'Steam',1000,53.76,'2023-06-30','https://store.steampowered.com/agecheck/app/1091500/'),(125,'Steam',1000,52.81,'2023-06-30','https://store.steampowered.com/agecheck/app/1091500/'),(126,'Steam',1000,43.35,'2023-11-14','https://store.steampowered.com/agecheck/app/1091500/'),(127,'Steam',1000,35.74,'2023-08-01','https://store.steampowered.com/agecheck/app/1091500/'),(128,'Steam',1000,39.26,'2023-09-04','https://store.steampowered.com/agecheck/app/1091500/'),(129,'Steam',1000,45.29,'2023-11-20','https://store.steampowered.com/agecheck/app/1091500/'),(130,'Steam',1000,57.72,'2023-06-21','https://store.steampowered.com/agecheck/app/1091500/'),(131,'Steam',1000,58.65,'2023-06-19','https://store.steampowered.com/agecheck/app/1091500/'),(132,'Steam',1000,45.49,'2023-09-11','https://store.steampowered.com/agecheck/app/1091500/'),(133,'Steam',1000,44.02,'2023-07-19','https://store.steampowered.com/agecheck/app/1091500/'),(134,'Steam',1000,45.65,'2023-05-28','https://store.steampowered.com/agecheck/app/1091500/'),(135,'Steam',1000,52.41,'2023-11-15','https://store.steampowered.com/agecheck/app/1091500/'),(136,'Steam',1000,33.39,'2023-11-10','https://store.steampowered.com/agecheck/app/1091500/'),(137,'Steam',1000,33.83,'2023-11-22','https://store.steampowered.com/agecheck/app/1091500/'),(138,'Steam',1000,46.27,'2023-05-28','https://store.steampowered.com/agecheck/app/1091500/'),(139,'Steam',1000,40.49,'2023-05-28','https://store.steampowered.com/agecheck/app/1091500/'),(140,'Steam',1000,51.84,'2023-05-29','https://store.steampowered.com/agecheck/app/1091500/'),(141,'Steam',1000,41.50,'2023-08-03','https://store.steampowered.com/agecheck/app/1091500/'),(142,'Steam',1000,42.92,'2023-07-20','https://store.steampowered.com/agecheck/app/1091500/'),(143,'Steam',1000,54.97,'2023-10-02','https://store.steampowered.com/agecheck/app/1091500/'),(144,'Steam',1000,42.99,'2023-10-06','https://store.steampowered.com/agecheck/app/1091500/'),(145,'Steam',1000,55.94,'2023-09-05','https://store.steampowered.com/agecheck/app/1091500/'),(146,'Steam',1000,37.91,'2023-09-22','https://store.steampowered.com/agecheck/app/1091500/'),(147,'Steam',1000,46.64,'2023-11-02','https://store.steampowered.com/agecheck/app/1091500/'),(148,'Steam',1000,58.13,'2023-11-15','https://store.steampowered.com/agecheck/app/1091500/'),(149,'Steam',1000,35.84,'2023-06-14','https://store.steampowered.com/agecheck/app/1091500/'),(150,'Steam',1000,33.21,'2023-07-04','https://store.steampowered.com/agecheck/app/1091500/'),(151,'Steam',1000,54.48,'2023-10-26','https://store.steampowered.com/agecheck/app/1091500/'),(152,'Steam',1000,35.52,'2023-08-18','https://store.steampowered.com/agecheck/app/1091500/'),(153,'Steam',1000,56.99,'2023-10-25','https://store.steampowered.com/agecheck/app/1091500/'),(154,'Steam',1000,45.81,'2023-10-08','https://store.steampowered.com/agecheck/app/1091500/'),(155,'Steam',1000,52.63,'2023-09-26','https://store.steampowered.com/agecheck/app/1091500/'),(156,'Steam',1000,43.13,'2023-07-08','https://store.steampowered.com/agecheck/app/1091500/'),(157,'Steam',1000,48.66,'2023-06-12','https://store.steampowered.com/agecheck/app/1091500/'),(158,'Steam',1000,46.46,'2023-10-09','https://store.steampowered.com/agecheck/app/1091500/'),(159,'Steam',1000,32.25,'2023-08-02','https://store.steampowered.com/agecheck/app/1091500/'),(160,'GOG',1000,59.99,'2023-12-05','https://www.gog.com/en/game/cyberpunk_2077');
/*!40000 ALTER TABLE `pricehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchasehistory`
--

DROP TABLE IF EXISTS `purchasehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchasehistory` (
  `PurchaseID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `GameID` int NOT NULL,
  `DistributorName` varchar(255) DEFAULT NULL,
  `DatePurchased` date NOT NULL,
  `PurchasePrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`PurchaseID`),
  KEY `GameID` (`GameID`),
  KEY `DistributorName` (`DistributorName`),
  KEY `purchasehistory_ibfk_1_idx` (`UserID`),
  CONSTRAINT `purchasehistory_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `purchasehistory_ibfk_2` FOREIGN KEY (`GameID`) REFERENCES `game` (`GameID`),
  CONSTRAINT `purchasehistory_ibfk_3` FOREIGN KEY (`DistributorName`) REFERENCES `distributor` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasehistory`
--

LOCK TABLES `purchasehistory` WRITE;
/*!40000 ALTER TABLE `purchasehistory` DISABLE KEYS */;
INSERT INTO `purchasehistory` VALUES (1,1000,1000,'Steam','2023-10-01',59.99),(2,1000,1005,'Epic Games','2023-10-01',54.95),(3,1000,1003,'GOG','2023-10-02',59.99),(4,1001,1010,'Steam','2023-10-02',24.99),(5,1001,1004,'Epic Games','2023-10-03',59.99),(6,1001,1002,'GOG','2023-10-03',59.99),(7,1002,1001,'Steam','2023-10-04',7.49),(8,1002,1007,'Epic Games','2023-10-05',24.99),(9,1002,1009,'GOG','2023-10-06',59.99),(10,1003,1000,'Steam','2023-10-06',59.99),(11,1003,1006,'Epic Games','2023-10-07',14.99),(12,1003,1008,'GOG','2023-10-08',39.99),(13,1004,1002,'Steam','2023-10-09',59.99),(14,1004,1003,'Epic Games','2023-10-10',59.99),(15,1004,1005,'GOG','2023-10-11',59.99),(16,1005,1004,'Steam','2023-10-11',59.99),(17,1005,1006,'Epic Games','2023-10-12',14.99),(18,1005,1007,'GOG','2023-10-13',49.99),(19,1006,1008,'Steam','2023-10-14',9.99),(20,1006,1009,'Epic Games','2023-10-15',59.99),(21,1006,1010,'GOG','2023-10-16',24.99),(22,1004,1000,'Steam','2023-10-17',59.99),(23,1004,1001,'Epic Games','2023-10-18',54.95),(24,1004,1002,'GOG','2023-10-19',59.99),(25,1005,1003,'Steam','2023-10-20',59.99),(26,1009,1000,'Steam','2023-12-05',59.99);
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
  `UserID` int DEFAULT NULL,
  `GameName` varchar(255) DEFAULT NULL,
  `WebsiteURL` varchar(255) NOT NULL,
  `DateAdded` date NOT NULL,
  PRIMARY KEY (`RequestID`),
  KEY `requestlist_fk1_idx` (`UserID`),
  CONSTRAINT `requestlist_fk1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestlist`
--

LOCK TABLES `requestlist` WRITE;
/*!40000 ALTER TABLE `requestlist` DISABLE KEYS */;
INSERT INTO `requestlist` VALUES (1,1001,'Hogwards Legacy','https://www.greenmangaming.com/games/hogwarts-legacy-pc/','2023-10-01'),(7,1009,'game','http://localhost:8080/CS157APRoject_war_exploded/main.jsp','2023-12-03'),(9,1010,'game','http://localhost:8080/CS157APRoject_war_exploded/main.jsp','2023-12-03'),(10,1010,'Hung','hung.com','2023-12-04'),(11,1000,'HungNguyen','steam.com/HungNguyen','2023-12-05'),(12,1000,'MarcoRodriguesz','asoidjasiod.com','2023-12-05');
/*!40000 ALTER TABLE `requestlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userreview`
--

DROP TABLE IF EXISTS `userreview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userreview` (
  `ReviewID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `GameID` int NOT NULL,
  `Rating` int NOT NULL,
  `ReviewDate` date NOT NULL,
  `ReviewText` text NOT NULL,
  PRIMARY KEY (`ReviewID`),
  KEY `userreview_ibfk_1_idx` (`UserID`),
  KEY `userreview_ibfk_2_idx` (`GameID`),
  CONSTRAINT `userreview_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `userreview_ibfk_2` FOREIGN KEY (`GameID`) REFERENCES `game` (`GameID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userreview`
--

LOCK TABLES `userreview` WRITE;
/*!40000 ALTER TABLE `userreview` DISABLE KEYS */;
INSERT INTO `userreview` VALUES (1,1000,1000,5,'2023-09-06','Absolutely loved this game! A must-buy for RPG lovers.'),(2,1001,1001,4,'2023-09-08','The storyline is captivating but some bugs here and there.'),(3,1002,1002,5,'2023-09-09','One of the best Souls games out there!'),(4,1003,1003,3,'2023-09-10','The graphics are amazing but felt the storyline was lacking depth.'),(5,1004,1004,4,'2023-09-11','A classic revisited. Loved every moment.'),(6,1005,1005,2,'2023-09-12','Too many glitches. Had higher expectations.'),(7,1006,1006,5,'2023-09-13','A must-have for any strategy game lover.'),(8,1000,1007,3,'2023-09-14','Good for casual gameplay. Not as immersive as I\'d hoped.'),(9,1002,1008,4,'2023-09-15','An epic tale that kept me on the edge of my seat.'),(10,1003,1009,5,'2023-09-16','Amazing multiplayer modes. Totally worth the price.');
/*!40000 ALTER TABLE `userreview` ENABLE KEYS */;
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
  `Admin` tinyint DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1000,'random1@example.com','random','123',0),(1001,'user1234@mail.com','user1234','P@ssw0rd1234',0),(1002,'testemail55@gmail.com','testemail55','SecurePass55',0),(1003,'random@email.net','random','R3@llyR@nd0m',0),(1004,'projectuser77@outlook.com','projectuser77','Pr0j3ctUs3r77',0),(1005,'gamer99@yahoo.com','gamer99','G@m3rP@ss99',0),(1006,'demoemail22@hotmail.com','demoemail22','D3m0P@ss22',0),(1007,'hung1234@gmail.com','hung1234','1234',0),(1008,'hung123@gmail.com','hung123@gmail.com','1234',0),(1009,'admin','admin','1',1),(1010,'a','abc','123',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userwishlist`
--

DROP TABLE IF EXISTS `userwishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userwishlist` (
  `WishlistID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `GameID` int NOT NULL,
  `DateAdded` date NOT NULL,
  PRIMARY KEY (`WishlistID`),
  KEY `userwishlist_ibfk_1_idx` (`UserID`),
  KEY `userwishlist_ibfk_2_idx` (`GameID`),
  CONSTRAINT `userwishlist_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `userwishlist_ibfk_2` FOREIGN KEY (`GameID`) REFERENCES `game` (`GameID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userwishlist`
--

LOCK TABLES `userwishlist` WRITE;
/*!40000 ALTER TABLE `userwishlist` DISABLE KEYS */;
INSERT INTO `userwishlist` VALUES (3,1000,1003,'2023-10-01'),(4,1001,1010,'2023-10-01'),(5,1001,1004,'2023-10-01'),(6,1001,1002,'2023-10-01'),(7,1002,1001,'2023-10-02'),(8,1002,1007,'2023-10-03'),(9,1002,1009,'2023-10-04'),(11,1000,1002,'2023-12-05');
/*!40000 ALTER TABLE `userwishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-05 15:56:15
