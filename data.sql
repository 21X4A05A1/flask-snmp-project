-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: snmdb
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `file_data`
--

DROP TABLE IF EXISTS `file_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_data` (
  `fid` int unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(20) NOT NULL,
  `filedata` longblob,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `added_by` int DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `added_by` (`added_by`),
  CONSTRAINT `file_data_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_data`
--

LOCK TABLES `file_data` WRITE;
/*!40000 ALTER TABLE `file_data` DISABLE KEYS */;
INSERT INTO `file_data` VALUES (1,'asynchronous.js',_binary '/*const Register=(one)=>{\r\n    setTimeout(()=>{\r\n        console.log(\"Register\");\r\n        one();\r\n    },2000);\r\n}\r\n\r\nconst Login=(two)=>{\r\n    setTimeout(()=>{\r\n        console.log(\"Login\");\r\n        two();\r\n    },1000);\r\n}\r\n\r\nconst Dashboard=()=>{\r\n    setTimeout(()=>{\r\n        console.log(\"Dashboard\");\r\n    },1000);\r\n}\r\n\r\nRegister(function(){\r\n    Login(function(){\r\n        Dashboard()\r\n    })\r\n})*/\r\n\r\n\r\nconst Register=()=>{\r\n    return new Promise((resolve,reject)=>{\r\n        setTimeout(()=>{\r\n        console.log(\"Register\");\r\n        resolve(\"msg from registration\");\r\n        //reject(\"msg rejected\")    //then it will stop here only \r\n    },2000);\r\n     })\r\n}\r\n\r\nconst Login=()=>{\r\n    return new Promise((resolve,reject)=>{\r\n        setTimeout(()=>{\r\n        console.log(\"Login\");\r\n        resolve(\"msg from login\");\r\n    },1000);\r\n    })\r\n}\r\n\r\nconst Dashboard=()=>{\r\n    return  new Promise((resolve,reject)=>{\r\n        setTimeout(()=>{\r\n        console.log(\"Dashboard\");\r\n        resolve(\"Dashboard opened\");\r\n    },4000);\r\n    })\r\n}\r\n\r\nRegister().then(()=>{\r\n    Login().then(()=>{\r\n        Dashboard()\r\n    })\r\n})\r\n\r\n\r\n//await is used to stop execution\r\ntry{\r\n    const process =async()=>{\r\n        const RegisterResult = await Register()\r\n        console.log(RegisterResult);\r\n        const LoginResult = await Login()\r\n        console.log(LoginResult);\r\n        const DashboardResult = await Dashboard()\r\n        console.log(DashboardResult);\r\n    }\r\n    process()\r\n}\r\ncatch (error) {\r\n    console.log(error);\r\n}\r\n','2025-10-17 18:47:53',1);
/*!40000 ALTER TABLE `file_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notesdata`
--

DROP TABLE IF EXISTS `notesdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notesdata` (
  `notesid` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` longtext,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `added_by` int NOT NULL,
  PRIMARY KEY (`notesid`),
  KEY `added_by` (`added_by`),
  CONSTRAINT `notesdata_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notesdata`
--

LOCK TABLES `notesdata` WRITE;
/*!40000 ALTER TABLE `notesdata` DISABLE KEYS */;
INSERT INTO `notesdata` VALUES (3,'python ',' language','2025-10-15 18:34:49',1),(4,'python','programming language','2025-10-16 18:24:25',1),(5,'frontend','web application','2025-10-24 18:41:18',1);
/*!40000 ALTER TABLE `notesdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `usermail` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `useremail` (`usermail`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'sravya','sravyakondapalli10@gmail.com','1234');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-24 19:04:07
