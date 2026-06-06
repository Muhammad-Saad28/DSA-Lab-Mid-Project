-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: learningpathdb
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20251216131433_AddQuestionTable','8.0.22'),('20251216131451_AddSkillTable','8.0.22'),('20251216131507_AddUserTable','8.0.22'),('20251216131523_AddUserSkillAssessmentTable','8.0.22'),('20251216162602_UpdateQuestionTable','8.0.22'),('20251216165221_UpdateUserSkillAssessmentTable','8.0.22'),('20251220021135_AddConceptDependencyGraph','8.0.22'),('20251220063208_AddLearningPathEngine','8.0.22'),('20251220104748_AddCourseVideos','8.0.22'),('20251224181252_AddDashboardTables','8.0.22'),('20251226125255_AddPasswordResetFields','8.0.22'),('20251227190736_AddUserCourseResume','8.0.22'),('20251228073226_AddStudyPlanEvents','8.0.22'),('20260101181323_RemoveConceptTables','8.0.22'),('20260101183845_DropUserCourseEnrollments','8.0.22');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseprofiles`
--

DROP TABLE IF EXISTS `courseprofiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courseprofiles` (
  `CourseId` int NOT NULL,
  `InstructorId` int DEFAULT NULL,
  `ThumbnailUrl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EstimatedMinutes` int DEFAULT NULL,
  `Rating` decimal(3,2) NOT NULL DEFAULT '0.00',
  `EnrolledCount` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CourseId`),
  KEY `IX_CourseProfiles_InstructorId` (`InstructorId`),
  CONSTRAINT `FK_CourseProfiles_Courses_CourseId` FOREIGN KEY (`CourseId`) REFERENCES `courses` (`CourseId`) ON DELETE CASCADE,
  CONSTRAINT `FK_CourseProfiles_Instructors_InstructorId` FOREIGN KEY (`InstructorId`) REFERENCES `instructors` (`InstructorId`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseprofiles`
--

LOCK TABLES `courseprofiles` WRITE;
/*!40000 ALTER TABLE `courseprofiles` DISABLE KEYS */;
INSERT INTO `courseprofiles` VALUES (1,2,'https://img.youtube.com/vi/HD13eq_Pmp8/maxresdefault.jpg','HTML & CSS',65,4.80,12500),(2,3,'https://img.youtube.com/vi/1Rs2ND1ryYc/maxresdefault.jpg','HTML & CSS',75,4.70,9800),(3,4,'https://img.youtube.com/vi/zQnBQ4tB3ZA/maxresdefault.jpg','HTML & CSS',85,4.90,7200),(4,5,'https://img.youtube.com/vi/PkZNo7MFNFg/maxresdefault.jpg','JavaScript',120,4.80,18500),(5,6,'https://img.youtube.com/vi/Mus_vwhTCq0/maxresdefault.jpg','JavaScript',95,4.60,13200),(6,1,'https://img.youtube.com/vi/2qP4ZKwA-ro/maxresdefault.jpg','JavaScript',110,4.90,8900),(7,2,'https://img.youtube.com/vi/b9eMGE7QtTk/maxresdefault.jpg','React.js',135,4.70,21400),(8,3,'https://img.youtube.com/vi/LlvBzyy-558/maxresdefault.jpg','React.js',105,4.80,16700),(9,4,'https://img.youtube.com/vi/6ThXsUwLWvc/maxresdefault.jpg','React.js',125,4.90,10500),(10,5,'https://img.youtube.com/vi/Oe421EPjeBE/maxresdefault.jpg','Node.js',90,4.70,18200),(11,6,'https://img.youtube.com/vi/SccSCuHhOw0/maxresdefault.jpg','Node.js',115,4.80,14300),(12,1,'https://img.youtube.com/vi/5VX6gY5lGqk/maxresdefault.jpg','Node.js',130,4.90,9600),(13,2,'https://img.youtube.com/vi/kqtD5dpn9C8/maxresdefault.jpg','Python',145,4.80,25600),(14,3,'https://img.youtube.com/vi/8ext9G7xspg/maxresdefault.jpg','Python',100,4.70,18900),(15,4,'https://img.youtube.com/vi/HGOBQPFzWKo/maxresdefault.jpg','Python',120,4.90,12700),(16,5,'https://img.youtube.com/vi/HXV3zeQKqGY/maxresdefault.jpg','SQL/Database',110,4.80,19800),(17,6,'https://img.youtube.com/vi/7S_tz1z_5bA/maxresdefault.jpg','SQL/Database',95,4.70,15400),(18,1,'https://img.youtube.com/vi/0buKQHokLK8/maxresdefault.jpg','SQL/Database',125,4.90,10300),(19,2,'https://img.youtube.com/vi/apGV9Kg7ics/maxresdefault.jpg','Git & Version Control',85,4.60,16700),(20,3,'https://img.youtube.com/vi/Uszj_k0DGsg/maxresdefault.jpg','Git & Version Control',105,4.80,12300),(21,4,'https://img.youtube.com/vi/P6jD966jzlk/maxresdefault.jpg','Git & Version Control',95,4.90,8100),(22,5,'https://img.youtube.com/vi/3c-iBn73dDE/maxresdefault.jpg','Docker',100,4.70,19200),(23,6,'https://img.youtube.com/vi/Wf2eSG3owoA/maxresdefault.jpg','Docker',130,4.80,14800),(24,1,'https://img.youtube.com/vi/6Y9S1FDrNv0/maxresdefault.jpg','Docker',115,4.90,9900),(25,2,'https://img.youtube.com/vi/SLwpqD8n3d0/maxresdefault.jpg','REST APIs',95,4.70,17600),(26,3,'https://img.youtube.com/vi/-MTSQjw5DrM/maxresdefault.jpg','REST APIs',110,4.80,13800),(27,4,'https://img.youtube.com/vi/V4s7C3nHL6U/maxresdefault.jpg','REST APIs',125,4.90,9200),(28,5,'https://img.youtube.com/vi/m8Icp_Cid5o/maxresdefault.jpg','System Design',140,4.80,21300),(29,6,'https://img.youtube.com/vi/5ygolLBRhso/maxresdefault.jpg','System Design',120,4.70,16900),(30,1,'https://img.youtube.com/vi/Y6Z1dIhSoR0/maxresdefault.jpg','System Design',150,4.90,11400);
/*!40000 ALTER TABLE `courseprofiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `CourseId` int NOT NULL AUTO_INCREMENT,
  `SkillId` int NOT NULL,
  `CourseTitle` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CourseLevel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `YoutubeVideoUrl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TotalVideos` int NOT NULL,
  `SequenceOrder` int NOT NULL,
  PRIMARY KEY (`CourseId`),
  KEY `IX_Courses_SkillId_CourseLevel_SequenceOrder` (`SkillId`,`CourseLevel`,`SequenceOrder`),
  CONSTRAINT `FK_Courses_Skills_SkillId` FOREIGN KEY (`SkillId`) REFERENCES `skills` (`SkillId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,1,'HTML & CSS Crash Course 2024 - Build a Website in 1 Hour','Beginner','https://www.youtube.com/watch?v=HD13eq_Pmp8',1,1),(2,1,'Modern CSS - Grid, Flexbox, Animations & Responsive Design','Intermediate','https://www.youtube.com/watch?v=1Rs2ND1ryYc',1,1),(3,1,'Advanced CSS - Architecture, Performance & Optimization','Advanced','https://www.youtube.com/watch?v=zQnBQ4tB3ZA',1,1),(4,2,'JavaScript Fundamentals - Complete Beginner Course 2024','Beginner','https://www.youtube.com/watch?v=PkZNo7MFNFg',1,1),(5,2,'Modern JavaScript ES6+ - Async, Promises, Patterns','Intermediate','https://www.youtube.com/watch?v=Mus_vwhTCq0',1,1),(6,2,'Advanced JavaScript - Engine, Performance & Memory Management','Advanced','https://www.youtube.com/watch?v=2qP4ZKwA-ro',1,1),(7,3,'React JS Full Course for Beginners 2024','Beginner','https://www.youtube.com/watch?v=b9eMGE7QtTk',1,1),(8,3,'Intermediate React - Hooks, Context API & Performance','Intermediate','https://www.youtube.com/watch?v=LlvBzyy-558',1,1),(9,3,'Advanced React Patterns - State Management & Architecture','Advanced','https://www.youtube.com/watch?v=6ThXsUwLWvc',1,1),(10,4,'Node.js & Express.js Crash Course 2024','Beginner','https://www.youtube.com/watch?v=Oe421EPjeBE',1,1),(11,4,'Intermediate Node.js - Authentication, Security & Testing','Intermediate','https://www.youtube.com/watch?v=SccSCuHhOw0',1,1),(12,4,'Advanced Node.js - Microservices, Performance & Scaling','Advanced','https://www.youtube.com/watch?v=5VX6gY5lGqk',1,1),(13,5,'Python Programming Full Course - Zero to Hero 2024','Beginner','https://www.youtube.com/watch?v=kqtD5dpn9C8',1,1),(14,5,'Intermediate Python - Data Structures & Algorithms','Intermediate','https://www.youtube.com/watch?v=8ext9G7xspg',1,1),(15,5,'Advanced Python - Async, Metaprogramming & Optimization','Advanced','https://www.youtube.com/watch?v=HGOBQPFzWKo',1,1),(16,6,'SQL & Databases Full Course - Beginner to Advanced 2024','Beginner','https://www.youtube.com/watch?v=HXV3zeQKqGY',1,1),(17,6,'Intermediate SQL - Performance, Indexing & Optimization','Intermediate','https://www.youtube.com/watch?v=7S_tz1z_5bA',1,1),(18,6,'Advanced Database - NoSQL, Sharding & Distributed Systems','Advanced','https://www.youtube.com/watch?v=0buKQHokLK8',1,1),(19,7,'Git & GitHub Complete Tutorial - Beginner to Pro 2024','Beginner','https://www.youtube.com/watch?v=apGV9Kg7ics',1,1),(20,7,'Advanced Git - Workflows, Hooks & Enterprise Practices','Intermediate','https://www.youtube.com/watch?v=Uszj_k0DGsg',1,1),(21,7,'Git Internals & CI/CD Pipeline Automation','Advanced','https://www.youtube.com/watch?v=P6jD966jzlk',1,1),(22,8,'Docker Full Course - Containers, Images & Compose 2024','Beginner','https://www.youtube.com/watch?v=3c-iBn73dDE',1,1),(23,8,'Docker & Kubernetes - Container Orchestration Mastery','Intermediate','https://www.youtube.com/watch?v=Wf2eSG3owoA',1,1),(24,8,'Advanced Docker - Production Deployments & Security','Advanced','https://www.youtube.com/watch?v=6Y9S1FDrNv0',1,1),(25,9,'REST API Design & Development Complete Guide 2024','Beginner','https://www.youtube.com/watch?v=SLwpqD8n3d0',1,1),(26,9,'Advanced REST APIs - Security, Performance & Testing','Intermediate','https://www.youtube.com/watch?v=-MTSQjw5DrM',1,1),(27,9,'REST API Architecture - Microservices & Advanced Patterns','Advanced','https://www.youtube.com/watch?v=V4s7C3nHL6U',1,1),(28,10,'System Design Fundamentals - Complete Course 2024','Beginner','https://www.youtube.com/watch?v=m8Icp_Cid5o',1,1),(29,10,'Scalable System Design - Architecture Patterns','Intermediate','https://www.youtube.com/watch?v=5ygolLBRhso',1,1),(30,10,'Advanced System Design - Distributed Systems & Scaling','Advanced','https://www.youtube.com/watch?v=Y6Z1dIhSoR0',1,1);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursevideos`
--

DROP TABLE IF EXISTS `coursevideos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coursevideos` (
  `CourseVideoId` int NOT NULL AUTO_INCREMENT,
  `CourseId` int NOT NULL,
  `VideoIndex` int NOT NULL,
  `VideoTitle` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `YoutubeVideoUrl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`CourseVideoId`),
  UNIQUE KEY `IX_CourseVideos_CourseId_VideoIndex` (`CourseId`,`VideoIndex`),
  CONSTRAINT `FK_CourseVideos_Courses_CourseId` FOREIGN KEY (`CourseId`) REFERENCES `courses` (`CourseId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursevideos`
--

LOCK TABLES `coursevideos` WRITE;
/*!40000 ALTER TABLE `coursevideos` DISABLE KEYS */;
INSERT INTO `coursevideos` VALUES (1,1,1,'HTML & CSS Crash Course 2024 - Build a Website in 1 Hour','https://www.youtube.com/watch?v=HD13eq_Pmp8'),(2,2,1,'Modern CSS - Grid, Flexbox, Animations & Responsive Design','https://www.youtube.com/watch?v=1Rs2ND1ryYc'),(3,3,1,'Advanced CSS - Architecture, Performance & Optimization','https://www.youtube.com/watch?v=zQnBQ4tB3ZA'),(4,4,1,'JavaScript Fundamentals - Complete Beginner Course 2024','https://www.youtube.com/watch?v=PkZNo7MFNFg'),(5,5,1,'Modern JavaScript ES6+ - Async, Promises, Patterns','https://www.youtube.com/watch?v=Mus_vwhTCq0'),(6,6,1,'Advanced JavaScript - Engine, Performance & Memory Management','https://www.youtube.com/watch?v=2qP4ZKwA-ro'),(7,7,1,'React JS Full Course for Beginners 2024','https://www.youtube.com/watch?v=b9eMGE7QtTk'),(8,8,1,'Intermediate React - Hooks, Context API & Performance','https://www.youtube.com/watch?v=LlvBzyy-558'),(9,9,1,'Advanced React Patterns - State Management & Architecture','https://www.youtube.com/watch?v=6ThXsUwLWvc'),(10,10,1,'Node.js & Express.js Crash Course 2024','https://www.youtube.com/watch?v=Oe421EPjeBE'),(11,11,1,'Intermediate Node.js - Authentication, Security & Testing','https://www.youtube.com/watch?v=SccSCuHhOw0'),(12,12,1,'Advanced Node.js - Microservices, Performance & Scaling','https://www.youtube.com/watch?v=5VX6gY5lGqk'),(13,13,1,'Python Programming Full Course - Zero to Hero 2024','https://www.youtube.com/watch?v=kqtD5dpn9C8'),(14,14,1,'Intermediate Python - Data Structures & Algorithms','https://www.youtube.com/watch?v=8ext9G7xspg'),(15,15,1,'Advanced Python - Async, Metaprogramming & Optimization','https://www.youtube.com/watch?v=HGOBQPFzWKo'),(16,16,1,'SQL & Databases Full Course - Beginner to Advanced 2024','https://www.youtube.com/watch?v=HXV3zeQKqGY'),(17,17,1,'Intermediate SQL - Performance, Indexing & Optimization','https://www.youtube.com/watch?v=7S_tz1z_5bA'),(18,18,1,'Advanced Database - NoSQL, Sharding & Distributed Systems','https://www.youtube.com/watch?v=0buKQHokLK8'),(19,19,1,'Git & GitHub Complete Tutorial - Beginner to Pro 2024','https://www.youtube.com/watch?v=apGV9Kg7ics'),(20,20,1,'Advanced Git - Workflows, Hooks & Enterprise Practices','https://www.youtube.com/watch?v=Uszj_k0DGsg'),(21,21,1,'Git Internals & CI/CD Pipeline Automation','https://www.youtube.com/watch?v=P6jD966jzlk'),(22,22,1,'Docker Full Course - Containers, Images & Compose 2024','https://www.youtube.com/watch?v=3c-iBn73dDE'),(23,23,1,'Docker & Kubernetes - Container Orchestration Mastery','https://www.youtube.com/watch?v=Wf2eSG3owoA'),(24,24,1,'Advanced Docker - Production Deployments & Security','https://www.youtube.com/watch?v=6Y9S1FDrNv0'),(25,25,1,'REST API Design & Development Complete Guide 2024','https://www.youtube.com/watch?v=SLwpqD8n3d0'),(26,26,1,'Advanced REST APIs - Security, Performance & Testing','https://www.youtube.com/watch?v=-MTSQjw5DrM'),(27,27,1,'REST API Architecture - Microservices & Advanced Patterns','https://www.youtube.com/watch?v=V4s7C3nHL6U'),(28,28,1,'System Design Fundamentals - Complete Course 2024','https://www.youtube.com/watch?v=m8Icp_Cid5o'),(29,29,1,'Scalable System Design - Architecture Patterns','https://www.youtube.com/watch?v=5ygolLBRhso'),(30,30,1,'Advanced System Design - Distributed Systems & Scaling','https://www.youtube.com/watch?v=Y6Z1dIhSoR0');
/*!40000 ALTER TABLE `coursevideos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructors`
--

DROP TABLE IF EXISTS `instructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructors` (
  `InstructorId` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`InstructorId`),
  KEY `IX_Instructors_FullName` (`FullName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructors`
--

LOCK TABLES `instructors` WRITE;
/*!40000 ALTER TABLE `instructors` DISABLE KEYS */;
INSERT INTO `instructors` VALUES (1,'Dr. Sarah Johnson',NULL),(2,'Mike Chen',NULL),(3,'Prof. Emily Watson',NULL),(4,'Alex Turner',NULL),(5,'Rachel Kim',NULL),(6,'David Park',NULL);
/*!40000 ALTER TABLE `instructors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learningpathcourses`
--

DROP TABLE IF EXISTS `learningpathcourses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `learningpathcourses` (
  `PathCourseId` int NOT NULL AUTO_INCREMENT,
  `PathId` int NOT NULL,
  `CourseId` int NOT NULL,
  `IsCompleted` tinyint(1) NOT NULL DEFAULT '0',
  `CompletionPercentage` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PathCourseId`),
  UNIQUE KEY `IX_LearningPathCourses_PathId_CourseId` (`PathId`,`CourseId`),
  KEY `IX_LearningPathCourses_CourseId` (`CourseId`),
  CONSTRAINT `FK_LearningPathCourses_Courses_CourseId` FOREIGN KEY (`CourseId`) REFERENCES `courses` (`CourseId`) ON DELETE CASCADE,
  CONSTRAINT `FK_LearningPathCourses_LearningPaths_PathId` FOREIGN KEY (`PathId`) REFERENCES `learningpaths` (`PathId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learningpathcourses`
--

LOCK TABLES `learningpathcourses` WRITE;
/*!40000 ALTER TABLE `learningpathcourses` DISABLE KEYS */;
INSERT INTO `learningpathcourses` VALUES (1,1,16,1,100),(2,1,17,1,100),(3,1,18,1,100),(4,2,22,1,100),(5,2,23,1,100),(6,2,24,1,100),(7,3,4,1,100),(8,3,5,0,0),(9,3,6,1,100),(10,4,1,1,100),(11,4,2,1,100),(12,4,3,1,100),(13,5,28,0,0),(14,5,29,0,0),(15,5,30,1,100),(16,6,25,1,100),(17,6,26,1,100),(18,6,27,1,100),(19,7,7,1,100),(20,7,8,1,100),(21,7,9,1,100),(22,8,25,1,100),(23,8,26,1,100),(24,8,27,1,100),(25,9,10,0,0),(26,9,11,0,0),(27,9,12,0,0),(28,10,16,1,100),(29,10,17,1,100),(30,10,18,1,100),(31,11,19,1,100),(32,11,20,1,100),(33,11,21,1,100),(34,12,7,1,100),(35,12,8,1,100),(36,12,9,1,100),(37,13,22,1,100),(38,13,23,1,100),(39,13,24,1,100),(40,14,13,1,100),(41,14,14,1,100),(42,14,15,1,100),(43,15,16,0,0),(44,15,17,0,0),(45,15,18,0,0),(46,16,22,1,100),(47,16,23,0,0),(48,16,24,0,0),(49,17,13,1,100),(50,17,14,1,100),(51,17,15,1,100),(52,18,25,0,0),(53,18,26,0,0),(54,18,27,0,0),(55,19,22,0,0),(56,19,23,0,0),(57,19,24,0,0),(58,20,19,0,0),(59,20,20,0,0),(60,20,21,0,0),(61,21,13,0,0),(62,21,14,0,0),(63,21,15,0,0),(64,22,28,1,100),(65,22,29,1,100),(66,22,30,1,100),(67,23,16,1,100),(68,23,17,1,100),(69,23,18,1,100);
/*!40000 ALTER TABLE `learningpathcourses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learningpaths`
--

DROP TABLE IF EXISTS `learningpaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `learningpaths` (
  `PathId` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `SkillId` int NOT NULL,
  `CreatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `Status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`PathId`),
  KEY `IX_LearningPaths_SkillId` (`SkillId`),
  KEY `IX_LearningPaths_UserId_SkillId_Status` (`UserId`,`SkillId`,`Status`),
  CONSTRAINT `FK_LearningPaths_Skills_SkillId` FOREIGN KEY (`SkillId`) REFERENCES `skills` (`SkillId`) ON DELETE CASCADE,
  CONSTRAINT `FK_LearningPaths_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learningpaths`
--

LOCK TABLES `learningpaths` WRITE;
/*!40000 ALTER TABLE `learningpaths` DISABLE KEYS */;
INSERT INTO `learningpaths` VALUES (1,1,6,'2025-12-20 16:30:47.686727','Completed'),(2,1,8,'2025-12-24 22:58:30.632745','Completed'),(3,1,2,'2025-12-25 12:08:44.433956','Active'),(4,1,1,'2025-12-25 21:46:15.177311','Completed'),(5,1,10,'2025-12-26 12:37:27.815350','Active'),(6,1,9,'2025-12-26 13:03:15.609024','Completed'),(7,1,3,'2025-12-26 21:41:10.257422','Completed'),(8,1,9,'2025-12-30 21:54:16.401972','Active'),(9,1,4,'2025-12-30 21:54:24.826443','Active'),(10,1,6,'2026-01-01 22:58:13.059908','Active'),(11,1,7,'2026-01-01 22:58:23.311654','Completed'),(12,1,3,'2026-01-02 15:36:37.043897','Active'),(13,1,8,'2026-01-02 15:36:42.677965','Active'),(14,1,5,'2026-01-02 15:37:00.936038','Completed'),(15,10,6,'2026-01-04 23:44:48.660864','Active'),(16,10,8,'2026-01-04 23:48:28.385098','Active'),(17,1,5,'2026-01-05 01:39:16.805639','Active'),(18,11,9,'2026-01-05 12:22:58.951406','Active'),(19,11,8,'2026-01-05 12:24:16.713619','Active'),(20,11,7,'2026-01-05 12:34:01.739130','Active'),(21,11,5,'2026-01-05 12:34:30.261633','Active'),(22,11,10,'2026-01-05 12:35:07.212712','Completed'),(23,11,6,'2026-01-05 12:38:36.637625','Completed');
/*!40000 ALTER TABLE `learningpaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `QuestionId` int NOT NULL AUTO_INCREMENT,
  `SkillId` int NOT NULL,
  `QuestionText` varchar(255) NOT NULL,
  `ChoiceA` varchar(255) NOT NULL,
  `ChoiceB` varchar(255) NOT NULL,
  `ChoiceC` varchar(255) NOT NULL,
  `CorrectAnswer` enum('A','B','C') NOT NULL,
  `DifficultyLevel` enum('Beginner','Intermediate','Advanced') NOT NULL,
  `TreeIndex` int NOT NULL,
  PRIMARY KEY (`QuestionId`),
  KEY `SkillId` (`SkillId`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`SkillId`) REFERENCES `skills` (`SkillId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'What is the primary purpose of semantic HTML?','Improves accessibility and SEO','Makes code run faster','Reduces CSS needed','A','Intermediate',0),(2,1,'Which HTML tag creates a paragraph element?','<para>','<p>','<paragraph>','B','Beginner',1),(3,1,'What does CSS Grid layout system provide?','Two-dimensional layout capabilities','Only horizontal layouts','Only vertical layouts','A','Advanced',2),(4,1,'What does HTML stand for?','Hyper Text Markup Language','High Tech Markup Language','Hyper Transfer Markup Language','A','Beginner',3),(5,1,'How do you link an external CSS file in HTML?','<link rel=\"stylesheet\" href=\"style.css\">','<style src=\"style.css\">','<css link=\"style.css\">','A','Intermediate',4),(6,1,'What is CSS Flexbox primarily used for?','One-dimensional layouts','Two-dimensional layouts','Three-dimensional designs','A','Intermediate',5),(7,1,'What is CSS specificity in selector matching?','Priority system for conflicting styles','Speed of style application','Browser compatibility level','A','Advanced',6),(8,1,'Which of these is NOT a valid HTML heading tag?','<h7>','<h1>','<h6>','A','Beginner',7),(9,1,'What does RGB in CSS colors stand for?','Red Green Blue','Real Good Background','Right Gradient Blend','A','Beginner',8),(10,1,'How do you center text horizontally in CSS?','text-align: center','align: center','horizontal-align: center','A','Intermediate',9),(11,1,'What is a CSS selector?','Pattern to select elements for styling','Color selection tool','Animation timing function','A','Intermediate',10),(12,1,'What does BEM methodology stand for in CSS?','Block Element Modifier','Better Element Management','Basic Element Model','A','Intermediate',11),(13,1,'What is a CSS preprocessor like SASS?','CSS with programming features','CSS file compressor','CSS code validator','A','Advanced',12),(14,1,'What is mobile-first responsive design?','Design for mobile then enhance for desktop','Design only for mobile devices','Ignore desktop users completely','A','Advanced',13),(15,1,'What is CSS-in-JS approach?','Writing CSS within JavaScript files','Converting JavaScript to CSS','JavaScript controlling CSS','A','Advanced',14),(16,1,'What is the purpose of <div> tag?','Division/container for grouping elements','Document section marker','Data input container','A','Beginner',15),(17,1,'What is inline CSS?','CSS written in style attribute','CSS in separate file','CSS in <style> tag','A','Beginner',16),(18,1,'What is external CSS?','CSS in separate .css file','CSS in style attribute','CSS in <style> tag','A','Beginner',17),(19,1,'What is internal CSS?','CSS in <style> tag in HTML','CSS in separate file','CSS in attributes','A','Beginner',18),(20,1,'What is CSS reset?','Removes default browser styles','Resets browser cache','Clears CSS history','A','Intermediate',19),(21,1,'What is viewport meta tag for?','Controls page dimensions on mobile','Sets page title','Adds favicon','A','Intermediate',20),(22,1,'What is responsive web design?','Adapts layout to screen size','Only works on mobile','Only works on desktop','A','Intermediate',21),(23,1,'What is CSS media query?','Conditional styles for devices','HTML for multimedia','JavaScript query tool','A','Intermediate',22),(24,1,'What are CSS custom properties?','Variables defined with -- prefix','Constant values','Function parameters','A','Intermediate',23),(25,1,'What is CSS animation?','Animated transitions between states','Moving image files','Video playback control','A','Intermediate',24),(26,1,'What is CSS transform property?','Modifies element appearance','Changes content','Alters HTML structure','A','Intermediate',25),(27,1,'What is CSS pseudo-class?','Special state selector like :hover','Class name modifier','Style override method','A','Advanced',26),(28,1,'What is CSS pseudo-element?','Styles specific parts like ::before','Fake HTML element','Hidden element style','A','Advanced',27),(29,1,'What is CSS cascade principle?','Priority order of styles','Waterfall visual effect','Element stacking order','A','Advanced',28),(30,1,'What is critical CSS?','Above-the-fold essential styles','Important style tags','Error condition styles','A','Advanced',29),(31,1,'What is CSS architecture?','Organized structure for maintainability','CSS framework choice','CSS compiler setup','A','Advanced',30),(32,2,'What is variable hoisting in JavaScript?','Declarations moved to top of scope','Variables lifting values','Value elevation process','A','Intermediate',0),(33,2,'How to declare a variable in JavaScript?','var, let, const','variable, constant','declare, set','A','Beginner',1),(34,2,'What is the JavaScript event loop?','Async execution model with queues','Event handler system','Loop iteration mechanism','A','Advanced',2),(35,2,'What type of language is JavaScript?','Scripting language','Markup language','Style language','A','Beginner',3),(36,2,'What is a JavaScript function?','Reusable code block with parameters','Special variable type','Data structure type','A','Intermediate',4),(37,2,'What is a JavaScript array?','Ordered collection of elements','Key-value pair collection','Single value container','A','Intermediate',5),(38,2,'What is prototype-based inheritance?','Objects inherit from other objects','Function type system','Object copying method','A','Advanced',6),(39,2,'What does console.log() do?','Prints output to console','Logs only errors','Creates log files','A','Beginner',7),(40,2,'What is a string in JavaScript?','Text data type','Number data type','Boolean data type','A','Beginner',8),(41,2,'What is an if statement for?','Conditional code execution','Loop iteration control','Function definition','A','Intermediate',9),(42,2,'What is a for loop?','Repeats code for iterations','Condition checking only','Function calling mechanism','A','Intermediate',10),(43,2,'What is a JavaScript object?','Key-value pair collection','Ordered list of items','Single value storage','A','Intermediate',11),(44,2,'What is a closure?','Function with preserved scope','Loop termination','Object wrapper','A','Advanced',12),(45,2,'What is a Promise?','Async operation result handler','Synchronous function','Error type object','A','Advanced',13),(46,2,'What is async/await?','Syntactic sugar for Promises','Synchronous execution','Loop type variant','A','Advanced',14),(47,2,'What is DOM?','Document Object Model','Data Object Model','Display Object Model','A','Beginner',15),(48,2,'What is BOM?','Browser Object Model','Binary Object Model','Basic Object Model','A','Beginner',16),(49,2,'What is NaN?','Not a Number value','Null Number type','No Number available','A','Beginner',17),(50,2,'What is undefined?','Variable declared but not assigned','Empty string value','False boolean value','A','Beginner',18),(51,2,'What is null?','Intentional absence of value','Not defined variable','Zero numerical value','A','Intermediate',19),(52,2,'What is truthy/falsy?','Value in boolean context','True/false literals','Boolean data types','A','Intermediate',20),(53,2,'What is scope in JavaScript?','Variable accessibility area','Function range limit','Code block boundary','A','Intermediate',21),(54,2,'What is \"this\" keyword?','Current execution context','Current function reference','Global object always','A','Intermediate',22),(55,2,'What are arrow functions?','Shorter function syntax','Function pointers','Async functions','A','Intermediate',23),(56,2,'What is destructuring?','Extract values from objects/arrays','Destroy object contents','Remove properties','A','Intermediate',24),(57,2,'What is spread operator?','Expand iterables into elements','Copy operator only','Merge objects only','A','Intermediate',25),(58,2,'What is call stack?','Function execution tracking','Phone call records','Memory allocation stack','A','Advanced',26),(59,2,'What is memory heap?','Dynamic memory allocation area','Static memory section','CPU cache memory','A','Advanced',27),(60,2,'What is garbage collection?','Automatic memory management','Data cleanup process','Cache clearing operation','A','Advanced',28),(61,2,'What is event delegation?','Parent handles child events','Event distribution system','Event assignment method','A','Advanced',29),(62,2,'What is function currying?','Transform multi-arg to single-arg','Curved function graph','Partial function application','A','Advanced',30),(63,3,'What is React component lifecycle?','Mount, update, unmount phases','Component birth to death','Render cycles only','A','Intermediate',0),(64,3,'What is JSX syntax?','JavaScript XML extension','Java Standard XML','JavaScript Extension','A','Beginner',1),(65,3,'What is React Fiber architecture?','New reconciliation engine','React framework type','State management system','A','Advanced',2),(66,3,'What is React primarily for?','Building user interfaces','Database management','Server configuration','A','Beginner',3),(67,3,'What are React props?','Properties passed to components','Component state','Internal variables','A','Intermediate',4),(68,3,'What is React state?','Component internal data','External properties','Global variables','A','Intermediate',5),(69,3,'What are React Hooks?','Functions for state/effects','Component connectors','Lifecycle handlers','A','Advanced',6),(70,3,'What is create-react-app?','React project boilerplate','Component creator','App deployment tool','A','Beginner',7),(71,3,'What is React component?','Reusable UI piece','JavaScript function','HTML element','A','Beginner',8),(72,3,'What is componentDidMount?','Called after component mounts','Called before mounting','Mounting prevention','A','Intermediate',9),(73,3,'What is virtual DOM?','Lightweight DOM copy','Actual DOM mirror','DOM replacement','A','Intermediate',10),(74,3,'What is React Router?','Navigation library','Routing algorithm','Path finder','A','Intermediate',11),(75,3,'What is Redux?','State management library','Component library','Build tool','A','Advanced',12),(76,3,'What is React Context?','Global state sharing','Component context','Style context','A','Advanced',13),(77,3,'What are Higher-Order Components?','Components returning components','High-level components','Parent components','A','Advanced',14),(78,3,'What is React Fragment?','Wrapper without extra DOM node','DOM fragment','HTML section','A','Beginner',15),(79,3,'What is React.PureComponent?','Performance optimized component','Pure function component','Clean component','A','Beginner',16),(80,3,'What is React.StrictMode?','Highlights potential problems','Strict rendering mode','Error strict mode','A','Beginner',17),(81,3,'What is propTypes?','Type checking for props','Property types','Prop validation','A','Beginner',18),(82,3,'What is useState hook?','State in functional components','State management','Variable state','A','Intermediate',19),(83,3,'What is useEffect hook?','Side effects in functions','Effect management','Event effects','A','Intermediate',20),(84,3,'What is useMemo hook?','Memoizes expensive calculations','Memory hook','Memo management','A','Intermediate',21),(85,3,'What is useCallback hook?','Memoizes callback functions','Callback management','Function callback','A','Intermediate',22),(86,3,'What is useRef hook?','Persists values across renders','Reference hook','DOM reference','A','Intermediate',23),(87,3,'What is useReducer hook?','State reducer pattern','Reducer function','State reduction','A','Intermediate',24),(88,3,'What is React.memo?','Performance optimization HOC','Memoization component','Memory component','A','Intermediate',25),(89,3,'What is React Portal?','Render children outside DOM hierarchy','Portal to other apps','Navigation portal','A','Advanced',26),(90,3,'What is React Suspense?','Handle async operations','Loading suspense','Async suspense','A','Advanced',27),(91,3,'What is React Lazy?','Code splitting component','Lazy loading','Slow component','A','Advanced',28),(92,3,'What is React Concurrent Mode?','Interruptible rendering','Concurrent operations','Parallel rendering','A','Advanced',29),(93,3,'What is React Server Components?','Components rendered on server','Server-side components','Backend components','A','Advanced',30),(94,4,'What is the Node.js event-driven architecture?','Non-blocking I/O with events','Blocking event system','Synchronous events','A','Intermediate',0),(95,4,'What JavaScript engine does Node.js use?','V8','SpiderMonkey','Chakra','A','Beginner',1),(96,4,'What is clustering in Node.js?','Multiple process instances','Code clustering','Data clustering','A','Advanced',2),(97,4,'What is Node.js primarily for?','Server-side JavaScript','Client-side scripts','Desktop applications','A','Beginner',3),(98,4,'What is package.json file?','Project metadata and dependencies','Packaging configuration','JSON data package','A','Intermediate',4),(99,4,'What is npm?','Node Package Manager','Node Project Manager','Node Program Manager','A','Intermediate',5),(100,4,'What is the Node.js event loop?','Handles async operations','Event handler loop','Timer loop system','A','Advanced',6),(101,4,'What is require() function?','Imports modules','Requires permission','Requests data','A','Beginner',7),(102,4,'What is module.exports?','Exports from module','Module export system','Export module','A','Beginner',8),(103,4,'What is fs module?','File system operations','Fast system','File storage','A','Beginner',9),(104,4,'What is Express.js?','Web application framework','Database framework','Testing framework','A','Intermediate',10),(105,4,'What is middleware in Express?','Functions with req,res access','Database middleware','Template middleware','A','Intermediate',11),(106,4,'What is Stream in Node.js?','Data flow abstraction','Water stream','Data stream','A','Advanced',12),(107,4,'What is Buffer in Node.js?','Binary data handling','Memory buffer','Cache buffer','A','Advanced',13),(108,4,'What is child_process module?','Spawn subprocesses','Child process handler','Process children','A','Advanced',14),(109,4,'What is __dirname?','Current directory path','Directory name','File directory','A','Beginner',15),(110,4,'What is __filename?','Current file path','File name only','Filename string','A','Beginner',16),(111,4,'What is process object?','Global process info','Process handler','System process','A','Beginner',17),(112,4,'What is console object?','Debugging/output console','System console','Terminal console','A','Beginner',18),(113,4,'What is async/await in Node?','Promise-based async code','Async functions','Wait for async','A','Intermediate',19),(114,4,'What is callback hell?','Nested callbacks pyramid','Callback errors','Callback problems','A','Intermediate',20),(115,4,'What is promise chaining?','Sequential async operations','Promise chains','Async chains','A','Intermediate',21),(116,4,'What is error-first callback?','Error as first parameter','Error callback','Callback errors','A','Intermediate',22),(117,4,'What is RESTful API?','HTTP-based web service','REST API design','Web service API','A','Intermediate',23),(118,4,'What is JWT authentication?','JSON Web Token auth','Java Web Token','JavaScript Web Token','A','Intermediate',24),(119,4,'What is CORS?','Cross-Origin Resource Sharing','Cross-Origin Requests','Cross-Site Sharing','A','Intermediate',25),(120,4,'What is Socket.IO?','Real-time bidirectional communication','Socket library','IO socket','A','Advanced',26),(121,4,'What is PM2 process manager?','Production process manager','Process Monitor','Performance Manager','A','Advanced',27),(122,4,'What is Nginx reverse proxy?','Load balancer for Node','Web server','Proxy server','A','Advanced',28),(123,4,'What is Docker with Node.js?','Containerization platform','Virtual machine','Cloud platform','A','Advanced',29),(124,4,'What is microservices with Node?','Decoupled service architecture','Small services','Service division','A','Advanced',30),(125,5,'What is Python dynamic typing?','Type determined at runtime','Type changes dynamically','Dynamic type system','A','Intermediate',0),(126,5,'How do you print in Python?','print() function','console.log()','echo','A','Beginner',1),(127,5,'What are Python decorators?','Functions modifying functions','Function decorators','Code decorators','A','Advanced',2),(128,5,'What is Python primarily for?','General-purpose programming','Web only language','Data only language','A','Beginner',3),(129,5,'What are Python lists?','Ordered mutable sequences','Key-value pairs','Immutable sequences','A','Intermediate',4),(130,5,'What are Python dictionaries?','Key-value pair collections','Ordered sequences','Immutable mappings','A','Intermediate',5),(131,5,'What are Python generators?','Lazy iterators with yield','Code generators','Data generators','A','Advanced',6),(132,5,'What is Python indentation?','Block structure syntax','Code formatting','Visual spacing','A','Beginner',7),(133,5,'What is # symbol in Python?','Comment indicator','Number sign','Special symbol','A','Beginner',8),(134,5,'What are Python functions?','def keyword blocks','Function definitions','Code blocks','A','Beginner',9),(135,5,'What is len() function?','Returns length/size','Lengthens strings','Length check','A','Intermediate',10),(136,5,'What is range() function?','Generates number sequences','Range of values','Number range','A','Intermediate',11),(137,5,'What are Python modules?','Reusable code files','Code modules','Program parts','A','Intermediate',12),(138,5,'What is Python virtual environment?','Isolated Python environment','Virtual Python','Environment isolation','A','Advanced',13),(139,5,'What are Python metaclasses?','Classes of classes','Meta programming','Class templates','A','Advanced',14),(140,5,'What is pip?','Python package installer','Package manager','Install tool','A','Beginner',15),(141,5,'What are Python tuples?','Immutable sequences','Mutable sequences','Key-value pairs','A','Beginner',16),(142,5,'What are Python sets?','Unordered unique elements','Ordered collections','Key collections','A','Beginner',17),(143,5,'What is Python slicing?','Extracting sequence parts','Cutting strings','Slice operations','A','Beginner',18),(144,5,'What is list comprehension?','Concise list creation','List understanding','Comprehend lists','A','Intermediate',19),(145,5,'What are lambda functions?','Anonymous small functions','Lambda calculus','Small functions','A','Intermediate',20),(146,5,'What are *args and **kwargs?','Variable arguments','Argument handling','Multiple args','A','Intermediate',21),(147,5,'What is __init__ method?','Class constructor','Initialization','Class init','A','Intermediate',22),(148,5,'What is self parameter?','Instance reference','This reference','Object self','A','Intermediate',23),(149,5,'What is Python inheritance?','Class reuse mechanism','Inherit properties','Code inheritance','A','Intermediate',24),(150,5,'What is method overriding?','Subclass redefines method','Method overwrite','Override parent','A','Intermediate',25),(151,5,'What is Django framework?','High-level Python web framework','Python framework','Web framework','A','Advanced',26),(152,5,'What is Flask framework?','Micro web framework','Lightweight framework','Simple framework','A','Advanced',27),(153,5,'What are Python async/await?','Asynchronous programming','Async functions','Await operations','A','Advanced',28),(154,5,'What is Python GIL?','Global Interpreter Lock','Global lock','Interpreter lock','A','Advanced',29),(155,5,'What are Python dataclasses?','Auto-generated class methods','Data classes','Class for data','A','Advanced',30),(156,6,'What is ACID in database transactions?','Atomicity, Consistency, Isolation, Durability','Access, Control, Integrity, Data','Accuracy, Consistency, Isolation, Durability','A','Intermediate',0),(157,6,'What does SQL stand for?','Structured Query Language','Simple Query Language','Standard Query Logic','A','Beginner',1),(158,6,'What is database normalization?','Reducing data redundancy','Making data normal','Standardizing data','A','Advanced',2),(159,6,'What is a primary key?','Unique record identifier','First column in table','Main column','A','Beginner',3),(160,6,'What is a foreign key?','Reference to another table','External key','Foreign column','A','Intermediate',4),(161,6,'What is a database index?','Performance optimization structure','Table index','Data index','A','Intermediate',5),(162,6,'What is database sharding?','Horizontal partitioning of data','Vertical partitioning','Data splitting','A','Advanced',6),(163,6,'What is SELECT statement?','Retrieves data from database','Selects database','Chooses data','A','Beginner',7),(164,6,'What is WHERE clause?','Filters query results','Condition clause','Filter condition','A','Beginner',8),(165,6,'What is INSERT statement?','Adds new records','Inserts data','Adds rows','A','Beginner',9),(166,6,'What is UPDATE statement?','Modifies existing records','Updates data','Changes records','A','Intermediate',10),(167,6,'What is DELETE statement?','Removes records','Deletes data','Erases rows','A','Intermediate',11),(168,6,'What is JOIN operation?','Combines rows from tables','Joins tables','Merges data','A','Intermediate',12),(169,6,'What is transaction?','Unit of database operations','Operation set','Database transaction','A','Advanced',13),(170,6,'What is database view?','Virtual table from query','Data view','View of data','A','Advanced',14),(171,6,'What is GROUP BY clause?','Groups rows by columns','Grouping data','Aggregate groups','A','Beginner',15),(172,6,'What is ORDER BY clause?','Sorts query results','Orders data','Sorting clause','A','Beginner',16),(173,6,'What is LIMIT clause?','Restricts result rows','Limits output','Row limit','A','Beginner',17),(174,6,'What is DISTINCT keyword?','Removes duplicate rows','Distinct values','Unique rows','A','Beginner',18),(175,6,'What are aggregate functions?','COUNT, SUM, AVG, etc.','Math functions','Data aggregates','A','Intermediate',19),(176,6,'What is INNER JOIN?','Returns matching rows','Inner connection','Match join','A','Intermediate',20),(177,6,'What is LEFT JOIN?','All left + matching right rows','Left connection','Left outer join','A','Intermediate',21),(178,6,'What is subquery?','Query within another query','Nested query','Inner query','A','Intermediate',22),(179,6,'What is stored procedure?','Prepared SQL code','Stored SQL','Procedure code','A','Intermediate',23),(180,6,'What is database trigger?','Automatic action on event','Event trigger','Auto action','A','Intermediate',24),(181,6,'What is NoSQL database?','Non-relational database','Not SQL database','Document database','A','Intermediate',25),(182,6,'What is MongoDB?','Document-oriented NoSQL','NoSQL database','Document database','A','Advanced',26),(183,6,'What is Redis?','In-memory key-value store','Cache database','Memory store','A','Advanced',27),(184,6,'What is database replication?','Copying data across servers','Data copying','Server replication','A','Advanced',28),(185,6,'What is database backup?','Copy for data recovery','Data backup','Backup copy','A','Advanced',29),(186,6,'What is database migration?','Moving data between systems','Data migration','System transfer','A','Advanced',30),(187,7,'What is Git branching strategy?','Workflow for managing branches','Branch creation','Strategy for branches','A','Intermediate',0),(188,7,'What is Git?','Distributed version control','Programming language','File storage','A','Beginner',1),(189,7,'What is Git rebase vs merge?','Rebase rewrites history, merge preserves','Merge rewrites, rebase preserves','Same operation','A','Advanced',2),(190,7,'What is version control?','Track and manage code changes','Version management','Change control','A','Beginner',3),(191,7,'What is git add command?','Stages changes for commit','Adds files','Stages files','A','Intermediate',4),(192,7,'What is git commit?','Records changes to repository','Saves changes','Commits code','A','Intermediate',5),(193,7,'What is git cherry-pick?','Apply specific commit','Pick commit','Select commit','A','Advanced',6),(194,7,'What is git init?','Initialize new repository','Start git','Init repo','A','Beginner',7),(195,7,'What is git clone?','Copy existing repository','Clone repo','Duplicate repo','A','Beginner',8),(196,7,'What is git status?','Show working tree status','Status check','Check state','A','Beginner',9),(197,7,'What is git pull?','Fetch and merge changes','Pull updates','Get changes','A','Intermediate',10),(198,7,'What is git push?','Upload local commits','Push changes','Send commits','A','Intermediate',11),(199,7,'What is git branch?','List/create branches','Branch command','Manage branches','A','Intermediate',12),(200,7,'What is git stash?','Temporarily save changes','Store changes','Hide changes','A','Advanced',13),(201,7,'What is git bisect?','Binary search for bugs','Bug finder','Search tool','A','Advanced',14),(202,7,'What is .gitignore file?','Specifies untracked files','Ignore file','Exclusion file','A','Beginner',15),(203,7,'What is git config?','Set configuration options','Configure git','Settings command','A','Beginner',16),(204,7,'What is git log?','Show commit history','History log','Commit log','A','Beginner',17),(205,7,'What is git diff?','Show changes between commits','Difference tool','Compare changes','A','Beginner',18),(206,7,'What is git checkout?','Switch branches/restore files','Checkout command','Switch command','A','Intermediate',19),(207,7,'What is git merge?','Combine branch histories','Merge branches','Combine branches','A','Intermediate',20),(208,7,'What is git remote?','Manage remote repositories','Remote command','Manage remotes','A','Intermediate',21),(209,7,'What is git fetch?','Download objects/refs','Fetch updates','Get objects','A','Intermediate',22),(210,7,'What is git reset?','Reset current HEAD','Reset command','Undo changes','A','Intermediate',23),(211,7,'What is git revert?','Create new commit undoing changes','Revert command','Undo commit','A','Intermediate',24),(212,7,'What is GitHub?','Git repository hosting','Code hosting','Git platform','A','Intermediate',25),(213,7,'What is Git Flow?','Branching model for Git','Git workflow','Flow model','A','Advanced',26),(214,7,'What is Git submodule?','Repository within repository','Sub repository','Nested repo','A','Advanced',27),(215,7,'What is Git hook?','Script triggered by events','Event script','Hook script','A','Advanced',28),(216,7,'What is Git LFS?','Large File Storage extension','Large files','File storage','A','Advanced',29),(217,7,'What is Git squash?','Combine multiple commits','Squash commits','Merge commits','A','Advanced',30),(218,8,'What is container orchestration?','Managing multiple containers','Container management','Orchestration system','A','Intermediate',0),(219,8,'What is Docker?','Containerization platform','Virtual machine','Cloud service','A','Beginner',1),(220,8,'What is Kubernetes?','Container orchestration platform','Container manager','Orchestration tool','A','Advanced',2),(221,8,'What is containerization?','Package app with dependencies','Container creation','App packaging','A','Beginner',3),(222,8,'What is Docker image?','Read-only template for containers','Container template','App image','A','Intermediate',4),(223,8,'What is Docker container?','Running instance of image','Running image','Container instance','A','Intermediate',5),(224,8,'What is Docker Compose?','Multi-container application tool','Compose tool','Multi-container','A','Advanced',6),(225,8,'What is Dockerfile?','Script to build Docker image','Image definition','Build script','A','Beginner',7),(226,8,'What is docker run?','Run command for containers','Run container','Start container','A','Beginner',8),(227,8,'What is docker build?','Build image from Dockerfile','Build command','Create image','A','Beginner',9),(228,8,'What is docker ps?','List running containers','Container list','Process status','A','Intermediate',10),(229,8,'What is docker exec?','Run command in running container','Execute command','Run in container','A','Intermediate',11),(230,8,'What is docker volume?','Persistent data storage','Data volume','Storage volume','A','Intermediate',12),(231,8,'What is docker network?','Connect containers network','Network setup','Container network','A','Advanced',13),(232,8,'What is docker swarm?','Native clustering for Docker','Swarm mode','Clustering','A','Advanced',14),(233,8,'What is docker pull?','Download image from registry','Pull image','Get image','A','Beginner',15),(234,8,'What is docker push?','Upload image to registry','Push image','Share image','A','Beginner',16),(235,8,'What is docker stop?','Stop running container','Stop command','Halt container','A','Beginner',17),(236,8,'What is docker rm?','Remove container','Delete container','Remove command','A','Beginner',18),(237,8,'What is docker rmi?','Remove image','Delete image','Image remove','A','Intermediate',19),(238,8,'What is docker logs?','View container logs','See logs','Log output','A','Intermediate',20),(239,8,'What is docker inspect?','Detailed container/image info','Inspect command','Get details','A','Intermediate',21),(240,8,'What is docker commit?','Create image from container','Commit container','Save changes','A','Intermediate',22),(241,8,'What is docker tag?','Tag image with name','Image tag','Name image','A','Intermediate',23),(242,8,'What is docker save?','Save image to tar archive','Export image','Save image','A','Intermediate',24),(243,8,'What is docker load?','Load image from tar archive','Import image','Load archive','A','Intermediate',25),(244,8,'What is docker registry?','Storage for Docker images','Image registry','Docker hub','A','Advanced',26),(245,8,'What is Docker Hub?','Cloud registry for Docker','Docker registry','Image hub','A','Advanced',27),(246,8,'What is docker healthcheck?','Container health monitoring','Health check','Status check','A','Advanced',28),(247,8,'What is docker secret?','Manage sensitive data','Secrets management','Secure data','A','Advanced',29),(248,8,'What is docker config?','Manage configuration files','Config management','Configuration','A','Advanced',30),(249,9,'What is RESTful API design?','Architectural style for APIs','API design style','REST design','A','Intermediate',0),(250,9,'What does REST stand for?','Representational State Transfer','Remote Service Transfer','Resource State Transfer','A','Beginner',1),(251,9,'What is HATEOAS constraint?','Hypermedia as engine of app state','Hypertext engine','State engine','A','Advanced',2),(252,9,'What is API endpoint?','URL for API interaction','API URL','Service point','A','Beginner',3),(253,9,'What is HTTP method?','GET, POST, PUT, DELETE, etc.','Request method','HTTP verb','A','Intermediate',4),(254,9,'What is JSON format?','JavaScript Object Notation','Java Standard Object','JavaScript Object','A','Intermediate',5),(255,9,'What is API authentication?','Verifying client identity','Client verification','Identity check','A','Advanced',6),(256,9,'What is GET request?','Retrieve data from server','Read data','Get data','A','Beginner',7),(257,9,'What is POST request?','Submit data to server','Create data','Send data','A','Beginner',8),(258,9,'What is PUT request?','Update existing resource','Update data','Replace data','A','Beginner',9),(259,9,'What is DELETE request?','Remove resource from server','Delete data','Remove data','A','Intermediate',10),(260,9,'What is PATCH request?','Partial resource update','Partial update','Update part','A','Intermediate',11),(261,9,'What is HTTP status code?','Response status indicator','Status number','Response code','A','Intermediate',12),(262,9,'What is API versioning?','Managing API changes','Version control','API versions','A','Advanced',13),(263,9,'What is rate limiting?','Limit API requests per client','Request limiting','Usage limit','A','Advanced',14),(264,9,'What is 200 status code?','Success OK','Success code','OK status','A','Beginner',15),(265,9,'What is 404 status code?','Not Found','Missing resource','Not found','A','Beginner',16),(266,9,'What is 500 status code?','Internal Server Error','Server error','Error 500','A','Beginner',17),(267,9,'What is 201 status code?','Created successfully','Created code','Success created','A','Beginner',18),(268,9,'What is request header?','Additional request info','Header info','Request metadata','A','Intermediate',19),(269,9,'What is response header?','Additional response info','Response metadata','Output header','A','Intermediate',20),(270,9,'What is query parameter?','URL parameters for filtering','URL filters','Query filters','A','Intermediate',21),(271,9,'What is path parameter?','URL segment for resource ID','URL parameter','Path variable','A','Intermediate',22),(272,9,'What is request body?','Data sent with request','Request data','Body data','A','Intermediate',23),(273,9,'What is response body?','Data returned in response','Response data','Output data','A','Intermediate',24),(274,9,'What is CORS in APIs?','Cross-Origin Resource Sharing','Cross-domain access','Origin sharing','A','Intermediate',25),(275,9,'What is OAuth authentication?','Authorization framework','Auth framework','OAuth protocol','A','Advanced',26),(276,9,'What is JWT token?','JSON Web Token for auth','Auth token','JWT auth','A','Advanced',27),(277,9,'What is API documentation?','API usage instructions','API docs','Usage guide','A','Advanced',28),(278,9,'What is Swagger/OpenAPI?','API specification standard','API spec','Documentation tool','A','Advanced',29),(279,9,'What is GraphQL?','Query language for APIs','API query language','Graph query','A','Advanced',30),(280,10,'What is scalable system architecture?','Design that handles growth','Growth-ready design','Scalable design','A','Intermediate',0),(281,10,'What is load balancing?','Distribute traffic across servers','Traffic distribution','Load distribution','A','Beginner',1),(282,10,'What is CAP theorem?','Consistency, Availability, Partition tolerance','Computer Availability Performance','Consistency Accessibility Partition','A','Advanced',2),(283,10,'What is system design?','Planning system components','System planning','Design planning','A','Beginner',3),(284,10,'What is caching strategy?','Storing data for faster access','Cache approach','Speed optimization','A','Intermediate',4),(285,10,'What is database indexing?','Optimizing query performance','Performance index','Query optimization','A','Intermediate',5),(286,10,'What is microservices architecture?','Decoupled independent services','Small services','Service division','A','Advanced',6),(287,10,'What is monolithic architecture?','Single unified application','One-piece app','Unified system','A','Beginner',7),(288,10,'What is horizontal scaling?','Add more servers','Scale out','Add machines','A','Beginner',8),(289,10,'What is vertical scaling?','Add resources to server','Scale up','Upgrade server','A','Beginner',9),(290,10,'What is database sharding?','Partition data across servers','Data partitioning','Split database','A','Intermediate',10),(291,10,'What is replication?','Copy data across servers','Data copying','Duplicate data','A','Intermediate',11),(292,10,'What is message queue?','Async communication between services','Message broker','Async messaging','A','Advanced',12),(293,10,'What is API gateway?','Single entry point for APIs','API entry','Gateway for APIs','A','Advanced',13),(294,10,'What is circuit breaker pattern?','Prevent cascade failures','Failure prevention','Circuit pattern','A','Advanced',14),(295,10,'What is CDN?','Content Delivery Network','Content network','Delivery network','A','Beginner',15),(296,10,'What is DNS?','Domain Name System','Name system','Domain system','A','Beginner',16),(297,10,'What is SSL/TLS?','Secure communication protocol','Security protocol','Encryption protocol','A','Beginner',17),(298,10,'What is firewall?','Network security system','Security wall','Network protection','A','Beginner',18),(299,10,'What is latency?','Time delay in system','Delay time','Response delay','A','Intermediate',19),(300,10,'What is throughput?','Requests processed per time','Processing rate','Request rate','A','Intermediate',20),(301,10,'What is availability?','System uptime percentage','Uptime measure','Service uptime','A','Intermediate',21),(302,10,'What is reliability?','System consistency over time','Consistent performance','Dependability','A','Intermediate',22),(303,10,'What is fault tolerance?','Continue operation during failures','Failure handling','Error tolerance','A','Intermediate',23),(304,10,'What is disaster recovery?','Restore system after disaster','Recovery plan','Disaster plan','A','Intermediate',24),(305,10,'What is data consistency?','Data accuracy across system','Accurate data','Correct data','A','Intermediate',25),(306,10,'What is eventual consistency?','Data syncs eventually','Sync over time','Delayed consistency','A','Advanced',26),(307,10,'What is strong consistency?','Immediate data sync','Instant consistency','Strong sync','A','Advanced',27),(308,10,'What is database normalization?','Reduce data redundancy','Data organization','Reduce duplicates','A','Advanced',28),(309,10,'What is denormalization?','Improve read performance','Read optimization','Performance trade-off','A','Advanced',29),(310,10,'What is system monitoring?','Track system performance','Performance tracking','System tracking','A','Advanced',30);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `SkillId` int NOT NULL AUTO_INCREMENT,
  `SkillName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`SkillId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'HTML & CSS',NULL,1),(2,'JavaScript',NULL,1),(3,'React.js',NULL,1),(4,'Node.js',NULL,1),(5,'Python',NULL,1),(6,'SQL/Database',NULL,1),(7,'Git & Version Control',NULL,1),(8,'Docker',NULL,1),(9,'REST APIs',NULL,1),(10,'System Design',NULL,1);
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studyplanevents`
--

DROP TABLE IF EXISTS `studyplanevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studyplanevents` (
  `StudyPlanEventId` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `Title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Category` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Study',
  `Notes` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `StartAtUtc` datetime(6) NOT NULL,
  `EndAtUtc` datetime(6) NOT NULL,
  `SkillId` int DEFAULT NULL,
  `CourseId` int DEFAULT NULL,
  `IsCompleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `UpdatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`StudyPlanEventId`),
  KEY `IX_StudyPlanEvents_CourseId` (`CourseId`),
  KEY `IX_StudyPlanEvents_SkillId` (`SkillId`),
  KEY `IX_StudyPlanEvents_UserId_StartAtUtc` (`UserId`,`StartAtUtc`),
  CONSTRAINT `FK_StudyPlanEvents_Courses_CourseId` FOREIGN KEY (`CourseId`) REFERENCES `courses` (`CourseId`) ON DELETE SET NULL,
  CONSTRAINT `FK_StudyPlanEvents_Skills_SkillId` FOREIGN KEY (`SkillId`) REFERENCES `skills` (`SkillId`) ON DELETE SET NULL,
  CONSTRAINT `FK_StudyPlanEvents_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studyplanevents`
--

LOCK TABLES `studyplanevents` WRITE;
/*!40000 ALTER TABLE `studyplanevents` DISABLE KEYS */;
INSERT INTO `studyplanevents` VALUES (1,1,'Dsa Implementation','Study',NULL,'2025-12-30 04:00:00.000000','2025-12-30 05:00:00.000000',NULL,NULL,0,'2025-12-28 07:56:46.500528','2025-12-28 12:56:47.005580'),(2,1,'React Sample Proj','Study',NULL,'2026-01-01 04:00:00.000000','2026-01-01 05:00:00.000000',NULL,NULL,0,'2025-12-30 14:29:52.838872','2025-12-30 19:29:52.941936'),(3,1,'LA','Study','LA krwa do','2026-01-16 04:00:00.000000','2026-01-16 05:00:00.000000',NULL,NULL,0,'2026-01-05 07:45:52.063055','2026-01-05 12:45:52.166434');
/*!40000 ALTER TABLE `studyplanevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useractivities`
--

DROP TABLE IF EXISTS `useractivities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `useractivities` (
  `ActivityId` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `Action` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Label` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CourseId` int DEFAULT NULL,
  `SkillId` int DEFAULT NULL,
  `PathId` int DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`ActivityId`),
  KEY `IX_UserActivities_CourseId` (`CourseId`),
  KEY `IX_UserActivities_PathId` (`PathId`),
  KEY `IX_UserActivities_SkillId` (`SkillId`),
  KEY `IX_UserActivities_UserId_CreatedAt` (`UserId`,`CreatedAt`),
  CONSTRAINT `FK_UserActivities_Courses_CourseId` FOREIGN KEY (`CourseId`) REFERENCES `courses` (`CourseId`) ON DELETE SET NULL,
  CONSTRAINT `FK_UserActivities_LearningPaths_PathId` FOREIGN KEY (`PathId`) REFERENCES `learningpaths` (`PathId`) ON DELETE SET NULL,
  CONSTRAINT `FK_UserActivities_Skills_SkillId` FOREIGN KEY (`SkillId`) REFERENCES `skills` (`SkillId`) ON DELETE SET NULL,
  CONSTRAINT `FK_UserActivities_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useractivities`
--

LOCK TABLES `useractivities` WRITE;
/*!40000 ALTER TABLE `useractivities` DISABLE KEYS */;
INSERT INTO `useractivities` VALUES (1,1,'Started learning path','JavaScript',NULL,2,3,'2025-12-25 07:08:44.796053'),(2,1,'Started learning path','HTML & CSS',NULL,1,4,'2025-12-25 16:46:15.621725'),(3,1,'Completed course','CSS Architecture & Performance Optimization',3,1,4,'2025-12-25 16:47:05.765737'),(4,1,'Completed assessment','Git & Version Control',NULL,7,NULL,'2025-12-25 16:49:02.284956'),(5,1,'Completed assessment','HTML & CSS',NULL,1,NULL,'2025-12-25 16:49:13.952682'),(6,1,'Started learning path','System Design',NULL,10,5,'2025-12-26 07:37:27.852819'),(7,1,'Completed assessment','System Design',NULL,10,NULL,'2025-12-26 07:44:28.177769'),(8,1,'Completed assessment','System Design',NULL,10,NULL,'2025-12-26 07:53:49.242214'),(9,1,'Started learning path','REST APIs',NULL,9,6,'2025-12-26 08:03:15.668862'),(10,1,'Completed course','Advanced API Design Patterns & Microservices',27,9,6,'2025-12-26 09:09:48.597452'),(11,1,'Completed course','REST API Design - Beginner to Advanced',25,9,6,'2025-12-26 09:19:26.793953'),(12,1,'Completed skill','REST APIs',NULL,9,6,'2025-12-26 09:19:41.537573'),(13,1,'Completed course','Intermediate REST API - Security & Performance',26,9,6,'2025-12-26 09:19:41.538094'),(14,1,'Started learning path','React.js',NULL,3,7,'2025-12-26 16:41:10.561963'),(15,8,'Completed assessment','SQL/Database',NULL,6,NULL,'2025-12-27 18:24:31.309005'),(16,1,'Completed course','Advanced System Design - Distributed Systems',30,10,5,'2025-12-27 19:33:24.761856'),(17,1,'Completed course','Advanced Docker - Production Deployments',24,8,2,'2025-12-27 19:56:39.103066'),(18,1,'Completed course','Advanced Docker - Production Deployments',24,8,2,'2025-12-27 19:57:04.369868'),(19,1,'Completed course','Advanced Docker - Production Deployments',24,8,2,'2025-12-27 19:57:07.283875'),(20,1,'Completed course','Docker Tutorial for Beginners - Full Course',22,8,2,'2025-12-27 19:57:25.403853'),(21,1,'Completed skill','Docker',NULL,8,2,'2025-12-27 19:57:59.032142'),(22,1,'Completed course','Docker & Kubernetes - Container Orchestration',23,8,2,'2025-12-27 19:57:59.036855'),(23,1,'Completed course','Advanced React Patterns & Architecture',9,3,7,'2025-12-30 14:28:01.539545'),(24,1,'Completed course','React JS - Complete Beginner Course',7,3,7,'2025-12-30 14:28:33.270155'),(25,1,'Completed skill','React.js',NULL,3,7,'2025-12-30 14:28:53.810918'),(26,1,'Completed course','Intermediate React - Advanced Patterns & Performance',8,3,7,'2025-12-30 14:28:53.819169'),(27,1,'Completed assessment','JavaScript',NULL,2,NULL,'2025-12-30 14:30:46.467238'),(28,1,'Started learning path','REST APIs',NULL,9,8,'2025-12-30 16:54:16.679412'),(29,1,'Started learning path','Node.js',NULL,4,9,'2025-12-30 16:54:24.874276'),(30,1,'Started learning path','SQL/Database',NULL,6,10,'2026-01-01 17:58:13.273187'),(31,1,'Started learning path','Git & Version Control',NULL,7,11,'2026-01-01 17:58:23.340740'),(32,1,'Started learning path','React.js',NULL,3,12,'2026-01-02 10:36:37.476225'),(33,1,'Started learning path','Docker',NULL,8,13,'2026-01-02 10:36:42.761152'),(34,1,'Started learning path','Python',NULL,5,14,'2026-01-02 10:37:00.979703'),(35,1,'Completed course','Advanced Python - Async, Metaprogramming & Optimization',15,5,14,'2026-01-02 10:43:36.659869'),(36,1,'Completed course','Python Programming Full Course - Zero to Hero 2024',13,5,14,'2026-01-02 10:43:50.416829'),(37,1,'Completed skill','Python',NULL,5,14,'2026-01-02 10:44:03.338546'),(38,1,'Completed course','Intermediate Python - Data Structures & Algorithms',14,5,14,'2026-01-02 10:44:03.339510'),(39,1,'Completed skill','HTML & CSS',NULL,1,4,'2026-01-04 18:38:33.658561'),(40,1,'Completed course','Modern CSS - Grid, Flexbox, Animations & Responsive Design',2,1,4,'2026-01-04 18:38:33.776381'),(41,1,'Completed assessment','Python',NULL,5,NULL,'2026-01-04 18:39:03.333028'),(42,10,'Completed assessment','SQL/Database',NULL,6,NULL,'2026-01-04 18:43:06.801718'),(43,10,'Started learning path','SQL/Database',NULL,6,15,'2026-01-04 18:44:48.744387'),(44,10,'Completed course','SQL & Databases Full Course - Beginner to Advanced 2024',16,6,15,'2026-01-04 18:45:13.484239'),(45,10,'Started learning path','Docker',NULL,8,16,'2026-01-04 18:48:28.415195'),(46,10,'Completed course','Docker Full Course - Containers, Images & Compose 2024',22,8,16,'2026-01-04 19:36:23.511415'),(47,1,'Started learning path','Python',NULL,5,17,'2026-01-04 20:39:16.947448'),(48,1,'Completed course','Git & GitHub Complete Tutorial - Beginner to Pro 2024',19,7,11,'2026-01-04 20:58:18.385072'),(49,1,'Completed course','Advanced Git - Workflows, Hooks & Enterprise Practices',20,7,11,'2026-01-04 20:58:42.988810'),(50,1,'Completed skill','Git & Version Control',NULL,7,11,'2026-01-04 20:58:55.248050'),(51,1,'Completed course','Git Internals & CI/CD Pipeline Automation',21,7,11,'2026-01-04 20:58:55.249124'),(52,1,'Completed course','JavaScript Fundamentals - Complete Beginner Course 2024',4,2,3,'2026-01-04 20:59:08.892409'),(53,11,'Completed assessment','HTML & CSS',NULL,1,NULL,'2026-01-05 06:21:35.527524'),(54,11,'Started learning path','REST APIs',NULL,9,18,'2026-01-05 07:22:59.312685'),(55,11,'Started learning path','Docker',NULL,8,19,'2026-01-05 07:24:16.767384'),(56,11,'Started learning path','Git & Version Control',NULL,7,20,'2026-01-05 07:34:01.891592'),(57,11,'Started learning path','Python',NULL,5,21,'2026-01-05 07:34:30.327118'),(58,11,'Started learning path','System Design',NULL,10,22,'2026-01-05 07:35:07.261501'),(59,11,'Completed course','System Design Fundamentals - Complete Course 2024',28,10,22,'2026-01-05 07:38:05.613503'),(60,11,'Completed course','Scalable System Design - Architecture Patterns',29,10,22,'2026-01-05 07:38:20.566793'),(61,11,'Completed skill','System Design',NULL,10,22,'2026-01-05 07:38:30.362618'),(62,11,'Completed course','Advanced System Design - Distributed Systems & Scaling',30,10,22,'2026-01-05 07:38:30.363977'),(63,11,'Started learning path','SQL/Database',NULL,6,23,'2026-01-05 07:38:36.697048'),(64,11,'Completed course','SQL & Databases Full Course - Beginner to Advanced 2024',16,6,23,'2026-01-05 07:38:47.479460'),(65,11,'Completed course','Intermediate SQL - Performance, Indexing & Optimization',17,6,23,'2026-01-05 07:38:54.738211'),(66,11,'Completed skill','SQL/Database',NULL,6,23,'2026-01-05 07:39:02.175085'),(67,11,'Completed course','Advanced Database - NoSQL, Sharding & Distributed Systems',18,6,23,'2026-01-05 07:39:02.176337'),(68,1,'Completed assessment','React.js',NULL,3,NULL,'2026-01-05 07:42:22.525277'),(69,1,'Completed course','Advanced JavaScript - Engine, Performance & Memory Management',6,2,3,'2026-01-05 07:44:12.798201');
/*!40000 ALTER TABLE `useractivities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercourseresumes`
--

DROP TABLE IF EXISTS `usercourseresumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usercourseresumes` (
  `ResumeId` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `CourseId` int NOT NULL,
  `LastVideoIndex` int NOT NULL,
  `LastPositionSeconds` int NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`ResumeId`),
  UNIQUE KEY `IX_UserCourseResumes_UserId_CourseId` (`UserId`,`CourseId`),
  KEY `IX_UserCourseResumes_CourseId` (`CourseId`),
  CONSTRAINT `FK_UserCourseResumes_Courses_CourseId` FOREIGN KEY (`CourseId`) REFERENCES `courses` (`CourseId`) ON DELETE CASCADE,
  CONSTRAINT `FK_UserCourseResumes_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercourseresumes`
--

LOCK TABLES `usercourseresumes` WRITE;
/*!40000 ALTER TABLE `usercourseresumes` DISABLE KEYS */;
INSERT INTO `usercourseresumes` VALUES (1,1,30,1,0,'2025-12-27 19:33:27.290584'),(2,1,28,1,0,'2026-01-04 20:49:16.755132'),(3,1,24,2,0,'2025-12-27 19:57:09.020454'),(4,1,22,1,0,'2025-12-27 19:57:28.013118'),(5,1,23,2,0,'2025-12-27 19:57:59.250037'),(6,1,1,1,0,'2025-12-29 14:06:05.072782'),(7,1,6,1,0,'2026-01-05 07:44:36.808458'),(8,1,9,2,0,'2025-12-30 14:28:04.796515'),(9,1,7,2,0,'2025-12-30 14:28:35.396725'),(10,1,8,1,0,'2025-12-30 14:28:53.968299'),(11,1,12,2,0,'2025-12-30 16:58:30.131058'),(12,1,21,1,0,'2026-01-04 20:58:55.426908'),(13,1,15,1,4,'2026-01-02 10:43:38.941260'),(14,1,13,1,5,'2026-01-02 10:43:53.959243'),(15,1,14,1,0,'2026-01-02 10:44:03.554674'),(16,1,2,1,7,'2026-01-04 18:38:34.065335'),(17,10,16,1,0,'2026-01-04 18:48:25.583065'),(18,10,22,1,0,'2026-01-04 19:36:25.545847'),(19,10,23,1,0,'2026-01-04 19:36:39.553520'),(20,1,19,1,0,'2026-01-04 20:58:21.141589'),(21,1,20,1,0,'2026-01-04 20:58:45.237926'),(22,11,27,1,0,'2026-01-05 07:23:59.747560'),(23,11,24,1,0,'2026-01-05 07:33:55.755420'),(24,11,15,1,0,'2026-01-05 07:34:45.613484'),(25,11,28,1,0,'2026-01-05 07:38:08.977671'),(26,11,29,1,0,'2026-01-05 07:38:22.854738'),(27,11,30,1,0,'2026-01-05 07:38:30.565666'),(28,11,16,1,0,'2026-01-05 07:38:49.429055'),(29,11,17,1,0,'2026-01-05 07:38:56.427918'),(30,11,18,1,0,'2026-01-05 07:39:02.337542');
/*!40000 ALTER TABLE `usercourseresumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usernotifications`
--

DROP TABLE IF EXISTS `usernotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usernotifications` (
  `NotificationId` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `IsRead` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`NotificationId`),
  KEY `IX_UserNotifications_UserId_IsRead_CreatedAt` (`UserId`,`IsRead`,`CreatedAt`),
  CONSTRAINT `FK_UserNotifications_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usernotifications`
--

LOCK TABLES `usernotifications` WRITE;
/*!40000 ALTER TABLE `usernotifications` DISABLE KEYS */;
INSERT INTO `usernotifications` VALUES (1,1,'LearningPath','New learning path started: JavaScript',0,'2025-12-25 07:08:44.892077'),(2,1,'LearningPath','New learning path started: HTML & CSS',0,'2025-12-25 16:46:15.701593'),(3,1,'Progress','Course completed: CSS Architecture & Performance Optimization',0,'2025-12-25 16:47:05.770287'),(4,1,'Assessment','Assessment completed: Git & Version Control (Intermediate)',0,'2025-12-25 16:49:02.286060'),(5,1,'Assessment','Assessment completed: HTML & CSS (Intermediate)',0,'2025-12-25 16:49:13.953299'),(6,1,'LearningPath','New learning path started: System Design',0,'2025-12-26 07:37:27.854368'),(7,1,'Assessment','Assessment completed: System Design (Intermediate)',0,'2025-12-26 07:44:28.185988'),(8,1,'Assessment','Assessment completed: System Design (Intermediate)',0,'2025-12-26 07:53:49.247603'),(9,1,'LearningPath','New learning path started: REST APIs',0,'2025-12-26 08:03:15.669252'),(10,1,'Progress','Course completed: Advanced API Design Patterns & Microservices',0,'2025-12-26 09:09:48.610119'),(11,1,'Progress','Course completed: REST API Design - Beginner to Advanced',0,'2025-12-26 09:19:26.794920'),(12,1,'Progress','Skill completed: REST APIs',0,'2025-12-26 09:19:41.538030'),(13,1,'Progress','Course completed: Intermediate REST API - Security & Performance',0,'2025-12-26 09:19:41.538142'),(14,1,'LearningPath','New learning path started: React.js',0,'2025-12-26 16:41:10.631129'),(15,8,'Assessment','Assessment completed: SQL/Database (Advanced)',0,'2025-12-27 18:24:31.396782'),(16,1,'Progress','Course completed: Advanced System Design - Distributed Systems',0,'2025-12-27 19:33:24.952144'),(17,1,'Progress','Course completed: Advanced Docker - Production Deployments',0,'2025-12-27 19:56:39.266585'),(18,1,'Progress','Course completed: Advanced Docker - Production Deployments',0,'2025-12-27 19:57:04.371530'),(19,1,'Progress','Course completed: Advanced Docker - Production Deployments',0,'2025-12-27 19:57:07.284468'),(20,1,'Progress','Course completed: Docker Tutorial for Beginners - Full Course',0,'2025-12-27 19:57:25.404555'),(21,1,'Progress','Skill completed: Docker',0,'2025-12-27 19:57:59.036726'),(22,1,'Progress','Course completed: Docker & Kubernetes - Container Orchestration',0,'2025-12-27 19:57:59.036970'),(23,1,'Progress','Course completed: Advanced React Patterns & Architecture',0,'2025-12-30 14:28:01.609787'),(24,1,'Progress','Course completed: React JS - Complete Beginner Course',0,'2025-12-30 14:28:33.271389'),(25,1,'Progress','Skill completed: React.js',0,'2025-12-30 14:28:53.818907'),(26,1,'Progress','Course completed: Intermediate React - Advanced Patterns & Performance',0,'2025-12-30 14:28:53.819605'),(27,1,'Assessment','Assessment completed: JavaScript (Advanced)',0,'2025-12-30 14:30:46.467726'),(28,1,'LearningPath','New learning path started: REST APIs',0,'2025-12-30 16:54:16.689434'),(29,1,'LearningPath','New learning path started: Node.js',0,'2025-12-30 16:54:24.874666'),(30,1,'LearningPath','New learning path started: SQL/Database',0,'2026-01-01 17:58:13.310989'),(31,1,'LearningPath','New learning path started: Git & Version Control',0,'2026-01-01 17:58:23.341425'),(32,1,'LearningPath','New learning path started: React.js',0,'2026-01-02 10:36:37.644616'),(33,1,'LearningPath','New learning path started: Docker',0,'2026-01-02 10:36:42.761687'),(34,1,'LearningPath','New learning path started: Python',0,'2026-01-02 10:37:00.980068'),(35,1,'Progress','Course completed: Advanced Python - Async, Metaprogramming & Optimization',0,'2026-01-02 10:43:36.670246'),(36,1,'Progress','Course completed: Python Programming Full Course - Zero to Hero 2024',0,'2026-01-02 10:43:50.417339'),(37,1,'Progress','Skill completed: Python',0,'2026-01-02 10:44:03.339370'),(38,1,'Progress','Course completed: Intermediate Python - Data Structures & Algorithms',0,'2026-01-02 10:44:03.339636'),(39,1,'Progress','Skill completed: HTML & CSS',0,'2026-01-04 18:38:33.740239'),(40,1,'Progress','Course completed: Modern CSS - Grid, Flexbox, Animations & Responsive Design',0,'2026-01-04 18:38:33.815704'),(41,1,'Assessment','Assessment completed: Python (Intermediate)',0,'2026-01-04 18:39:03.334258'),(42,10,'Assessment','Assessment completed: SQL/Database (Intermediate)',0,'2026-01-04 18:43:06.802962'),(43,10,'LearningPath','New learning path started: SQL/Database',0,'2026-01-04 18:44:48.745829'),(44,10,'Progress','Course completed: SQL & Databases Full Course - Beginner to Advanced 2024',0,'2026-01-04 18:45:13.484571'),(45,10,'LearningPath','New learning path started: Docker',0,'2026-01-04 18:48:28.415553'),(46,10,'Progress','Course completed: Docker Full Course - Containers, Images & Compose 2024',0,'2026-01-04 19:36:23.521188'),(47,1,'LearningPath','New learning path started: Python',0,'2026-01-04 20:39:16.996744'),(48,1,'Progress','Course completed: Git & GitHub Complete Tutorial - Beginner to Pro 2024',0,'2026-01-04 20:58:18.394588'),(49,1,'Progress','Course completed: Advanced Git - Workflows, Hooks & Enterprise Practices',0,'2026-01-04 20:58:42.989267'),(50,1,'Progress','Skill completed: Git & Version Control',0,'2026-01-04 20:58:55.248946'),(51,1,'Progress','Course completed: Git Internals & CI/CD Pipeline Automation',0,'2026-01-04 20:58:55.249276'),(52,1,'Progress','Course completed: JavaScript Fundamentals - Complete Beginner Course 2024',0,'2026-01-04 20:59:08.893367'),(53,11,'Assessment','Assessment completed: HTML & CSS (Intermediate)',0,'2026-01-05 06:21:35.647654'),(54,11,'LearningPath','New learning path started: REST APIs',0,'2026-01-05 07:22:59.319206'),(55,11,'LearningPath','New learning path started: Docker',0,'2026-01-05 07:24:16.768064'),(56,11,'LearningPath','New learning path started: Git & Version Control',0,'2026-01-05 07:34:02.003855'),(57,11,'LearningPath','New learning path started: Python',0,'2026-01-05 07:34:30.328045'),(58,11,'LearningPath','New learning path started: System Design',0,'2026-01-05 07:35:07.262096'),(59,11,'Progress','Course completed: System Design Fundamentals - Complete Course 2024',0,'2026-01-05 07:38:05.622534'),(60,11,'Progress','Course completed: Scalable System Design - Architecture Patterns',0,'2026-01-05 07:38:20.567510'),(61,11,'Progress','Skill completed: System Design',0,'2026-01-05 07:38:30.363827'),(62,11,'Progress','Course completed: Advanced System Design - Distributed Systems & Scaling',0,'2026-01-05 07:38:30.364830'),(63,11,'LearningPath','New learning path started: SQL/Database',0,'2026-01-05 07:38:36.697814'),(64,11,'Progress','Course completed: SQL & Databases Full Course - Beginner to Advanced 2024',0,'2026-01-05 07:38:47.479851'),(65,11,'Progress','Course completed: Intermediate SQL - Performance, Indexing & Optimization',0,'2026-01-05 07:38:54.739318'),(66,11,'Progress','Skill completed: SQL/Database',0,'2026-01-05 07:39:02.175816'),(67,11,'Progress','Course completed: Advanced Database - NoSQL, Sharding & Distributed Systems',0,'2026-01-05 07:39:02.177382'),(68,1,'Assessment','Assessment completed: React.js (Beginner)',0,'2026-01-05 07:42:22.529855'),(69,1,'Progress','Course completed: Advanced JavaScript - Engine, Performance & Memory Management',0,'2026-01-05 07:44:12.798664');
/*!40000 ALTER TABLE `usernotifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PasswordResetTokenExpiresAt` datetime(6) DEFAULT NULL,
  `PasswordResetTokenHash` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'umar','umar@gmail.com','pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=',NULL,NULL),(2,'rana','umarsafdar006@gmail.com','pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=',NULL,NULL),(3,'rana','rana@gmail.com','pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=',NULL,NULL),(4,'sunil','sunil@gmail.com','pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=',NULL,NULL),(5,'hassan','hassan@gmail.com','pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=',NULL,NULL),(6,'abdullah','abdullah@gmail.com','pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=',NULL,NULL),(7,'amir','amir@gmail.com','pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=',NULL,NULL),(8,'Abdullah Saif','abd@gmail.com','EsVQN1mRY7+xDcoFocMbqxqt9TQ0wPRiCH1bjWJLAEE=',NULL,NULL),(9,'rana','rana@gmail.com','dIGao/I8NJ8qqzxABxh/NVr1xe/NwSQiECITkW6krNA=',NULL,NULL),(10,'Rana Umar','umarsafdar@gmail.com','CQmOY9AOH3yW9WWbQheoH9GP9Ymbv1EYz/rJMaeJShE=',NULL,NULL),(11,'Muhammad Saad','saad230806@gmail.com','428lplciqovfgY8dSy5aLDBo8biuv8muMsPmJ9HjGvE=',NULL,NULL),(12,'Muhammad Saad','saad230806@gmail.com','428lplciqovfgY8dSy5aLDBo8biuv8muMsPmJ9HjGvE=',NULL,NULL),(13,'Muhammad Saad','saad230806@gmail.com','428lplciqovfgY8dSy5aLDBo8biuv8muMsPmJ9HjGvE=',NULL,NULL),(14,'Muhammad Saad','saad230806@gmail.com','428lplciqovfgY8dSy5aLDBo8biuv8muMsPmJ9HjGvE=',NULL,NULL),(15,'Muhammad Saad','saad230806@gmail.com','428lplciqovfgY8dSy5aLDBo8biuv8muMsPmJ9HjGvE=',NULL,NULL),(16,'Muhammad Saad','saad230806@gmail.com','428lplciqovfgY8dSy5aLDBo8biuv8muMsPmJ9HjGvE=',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userskillassessments`
--

DROP TABLE IF EXISTS `userskillassessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userskillassessments` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `SkillId` int NOT NULL,
  `CorrectAnswers` int DEFAULT NULL,
  `SkillLevel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TotalAnswered` int DEFAULT NULL,
  `CompletedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  KEY `IX_UserSkillAssessments_SkillId` (`SkillId`),
  KEY `IX_UserSkillAssessments_UserId` (`UserId`),
  CONSTRAINT `FK_UserSkillAssessments_Skills_SkillId` FOREIGN KEY (`SkillId`) REFERENCES `skills` (`SkillId`) ON DELETE CASCADE,
  CONSTRAINT `FK_UserSkillAssessments_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userskillassessments`
--

LOCK TABLES `userskillassessments` WRITE;
/*!40000 ALTER TABLE `userskillassessments` DISABLE KEYS */;
INSERT INTO `userskillassessments` VALUES (8,1,1,3,'Intermediate',6,'2025-12-17 18:50:17.595179'),(9,1,1,5,'Advanced',5,'2025-12-17 19:40:53.578075'),(10,1,8,2,'Beginner',5,'2025-12-17 21:05:11.252270'),(11,1,1,5,'Advanced',5,'2025-12-17 21:06:03.297131'),(12,1,2,1,'Beginner',5,'2025-12-17 21:06:30.786009'),(13,1,4,3,'Intermediate',5,'2025-12-17 21:06:43.947816'),(14,1,7,4,'Intermediate',5,'2025-12-17 21:08:32.914815'),(15,1,2,4,'Intermediate',5,'2025-12-17 23:44:16.759096'),(16,1,4,4,'Intermediate',5,'2025-12-17 23:44:31.346294'),(17,1,1,3,'Intermediate',5,'2025-12-25 21:49:13.944097'),(18,1,5,3,'Intermediate',5,'2025-12-17 23:49:13.739565'),(19,1,6,3,'Intermediate',5,'2025-12-17 23:49:52.338452'),(20,5,9,5,'Advanced',5,'2025-12-17 23:58:54.111047'),(21,7,1,4,'Intermediate',5,'2025-12-18 09:14:23.466945'),(22,7,6,4,'Intermediate',5,'2025-12-18 09:15:26.277801'),(23,7,5,5,'Advanced',5,'2025-12-18 09:16:43.552436'),(24,1,3,1,'Beginner',5,'2026-01-05 12:42:22.506818'),(25,1,6,5,'Advanced',5,'2025-12-18 10:49:01.551663'),(26,1,7,3,'Intermediate',5,'2025-12-25 21:49:02.268788'),(27,1,2,5,'Advanced',5,'2025-12-30 19:30:46.447765'),(28,1,5,3,'Intermediate',5,'2026-01-04 23:39:03.314992'),(29,1,10,4,'Intermediate',5,'2025-12-26 12:53:49.237867'),(30,8,6,5,'Advanced',5,'2025-12-27 23:24:31.249629'),(31,10,6,4,'Intermediate',5,'2026-01-04 23:43:06.792572'),(32,11,1,3,'Intermediate',5,'2026-01-05 11:21:35.421911');
/*!40000 ALTER TABLE `userskillassessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userskillshistory`
--

DROP TABLE IF EXISTS `userskillshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userskillshistory` (
  `HistoryId` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `SkillId` int NOT NULL,
  `CompletedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`HistoryId`),
  KEY `IX_UserSkillsHistory_SkillId` (`SkillId`),
  KEY `IX_UserSkillsHistory_UserId_SkillId_CompletedAt` (`UserId`,`SkillId`,`CompletedAt`),
  CONSTRAINT `FK_UserSkillsHistory_Skills_SkillId` FOREIGN KEY (`SkillId`) REFERENCES `skills` (`SkillId`) ON DELETE CASCADE,
  CONSTRAINT `FK_UserSkillsHistory_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userskillshistory`
--

LOCK TABLES `userskillshistory` WRITE;
/*!40000 ALTER TABLE `userskillshistory` DISABLE KEYS */;
INSERT INTO `userskillshistory` VALUES (6,1,1,'2026-01-04 18:38:33.596865'),(4,1,3,'2025-12-30 14:28:53.721964'),(5,1,5,'2026-01-02 10:44:03.249145'),(1,1,6,'2025-12-20 11:37:09.676485'),(7,1,7,'2026-01-04 20:58:55.180299'),(3,1,8,'2025-12-27 19:57:58.975745'),(2,1,9,'2025-12-26 09:19:41.426190'),(9,11,6,'2026-01-05 07:39:02.165378'),(8,11,10,'2026-01-05 07:38:30.269970');
/*!40000 ALTER TABLE `userskillshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uservideoprogress`
--

DROP TABLE IF EXISTS `uservideoprogress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uservideoprogress` (
  `ProgressId` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `CourseId` int NOT NULL,
  `VideoIndex` int NOT NULL,
  `IsWatched` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ProgressId`),
  UNIQUE KEY `IX_UserVideoProgress_UserId_CourseId_VideoIndex` (`UserId`,`CourseId`,`VideoIndex`),
  KEY `IX_UserVideoProgress_CourseId` (`CourseId`),
  CONSTRAINT `FK_UserVideoProgress_Courses_CourseId` FOREIGN KEY (`CourseId`) REFERENCES `courses` (`CourseId`) ON DELETE CASCADE,
  CONSTRAINT `FK_UserVideoProgress_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uservideoprogress`
--

LOCK TABLES `uservideoprogress` WRITE;
/*!40000 ALTER TABLE `uservideoprogress` DISABLE KEYS */;
INSERT INTO `uservideoprogress` VALUES (1,1,18,1,1),(2,1,18,2,1),(3,1,18,3,1),(4,1,18,4,1),(5,1,18,5,1),(6,1,16,1,1),(7,1,16,2,1),(8,1,16,3,1),(9,1,16,4,1),(10,1,16,5,1),(11,1,17,1,1),(12,1,17,2,1),(13,1,17,3,1),(14,1,17,4,1),(15,1,17,5,1),(16,1,3,1,1),(17,1,3,2,1),(18,1,3,3,1),(19,1,3,4,1),(20,1,3,5,1),(21,1,27,1,1),(22,1,27,2,1),(23,1,27,3,1),(24,1,27,4,1),(25,1,27,5,1),(26,1,25,1,1),(27,1,25,2,1),(28,1,25,3,1),(29,1,25,4,1),(30,1,25,5,1),(31,1,26,1,1),(32,1,26,2,1),(33,1,26,3,1),(34,1,26,4,1),(35,1,26,5,1),(36,1,30,1,1),(37,1,30,2,1),(38,1,30,3,1),(39,1,30,4,1),(40,1,30,5,1),(41,1,24,1,1),(42,1,24,2,1),(43,1,24,3,1),(44,1,24,4,1),(45,1,24,5,1),(46,1,22,1,1),(47,1,22,2,1),(48,1,22,3,1),(49,1,22,4,1),(50,1,22,5,1),(51,1,23,1,1),(52,1,23,2,1),(53,1,23,3,1),(54,1,23,4,1),(55,1,23,5,1),(56,1,1,1,1),(57,1,9,1,1),(58,1,9,2,1),(59,1,9,3,1),(60,1,9,4,1),(61,1,9,5,1),(62,1,7,1,1),(63,1,7,2,1),(64,1,7,3,1),(65,1,7,4,1),(66,1,7,5,1),(67,1,8,1,1),(68,1,8,2,1),(69,1,8,3,1),(70,1,8,4,1),(71,1,8,5,1),(72,1,15,1,1),(73,1,13,1,1),(74,1,14,1,1),(75,1,2,1,1),(76,10,16,1,0),(77,10,22,1,1),(78,1,19,1,1),(79,1,20,1,1),(80,1,21,1,1),(81,1,4,1,1),(82,11,28,1,1),(83,11,29,1,1),(84,11,30,1,1),(85,11,16,1,1),(86,11,17,1,1),(87,11,18,1,1),(88,1,6,1,1);
/*!40000 ALTER TABLE `uservideoprogress` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-05 13:26:43
