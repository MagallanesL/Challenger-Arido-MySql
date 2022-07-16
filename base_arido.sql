-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: bdarido
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `access_level`
--

DROP TABLE IF EXISTS `access_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_level` (
  `idaccess` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idaccess`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_level`
--

LOCK TABLES `access_level` WRITE;
/*!40000 ALTER TABLE `access_level` DISABLE KEYS */;
INSERT INTO `access_level` VALUES (1,'Read','solo lectura de BD'),(2,'Write','agregar, eliminar o cambiar datos'),(3,'Admin','pueden ejecutar cualquier comando'),(4,'Owner','realizar todas las actividades ');
/*!40000 ALTER TABLE `access_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos` (
  `idgroups` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`idgroups`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'Olimpo','lugar de dioses'),(2,'tierra','habitad de humanos'),(3,'inframundo','tierra de Hades'),(4,'Tartaro','Prision de Titanes');
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_segurity`
--

DROP TABLE IF EXISTS `users_segurity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_segurity` (
  `idalias` varchar(45) NOT NULL,
  `idgroups` int NOT NULL,
  `idAccess` int NOT NULL,
  PRIMARY KEY (`idalias`,`idgroups`,`idAccess`),
  KEY `groups_us_idx` (`idgroups`),
  KEY `access_us_idx` (`idAccess`),
  CONSTRAINT `access_us` FOREIGN KEY (`idAccess`) REFERENCES `access_level` (`idaccess`),
  CONSTRAINT `groups_us` FOREIGN KEY (`idgroups`) REFERENCES `grupos` (`idgroups`),
  CONSTRAINT `user_us` FOREIGN KEY (`idalias`) REFERENCES `usuarios` (`idalias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_segurity`
--

LOCK TABLES `users_segurity` WRITE;
/*!40000 ALTER TABLE `users_segurity` DISABLE KEYS */;
INSERT INTO `users_segurity` VALUES ('apolo',1,2),('hera',1,3),('hermes',1,2),('hestia',1,1),('zeus',1,4),('Afrodita',2,2),('demeter',2,3),('hestia',2,3),('poseidon',2,3),('zeus',2,4),('gea',3,2),('hades',3,4);
/*!40000 ALTER TABLE `users_segurity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idalias` varchar(45) NOT NULL,
  `password` varchar(2000) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idalias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('Afrodita','Af123','Afrodita@olimpo.com','Laura'),('Apolo','Ap123','Apolo@olimpo.com','Martin'),('Ares','AR123','Ares@olimpo.com','Sergio'),('as','asdaf','mial@mail.com','asd'),('barba','asddas','maila@test.com','walter'),('Demeter','De123','Demeter@olimpo.com','Juan'),('Gea','Gea123','Gea@tartaro.com','Lisandro'),('Hades','Ha123','hades@inframundo.com','Lola'),('Hera','He123','Hera@olimpo.com','Noelia'),('Hermes','Her123','Hermes@olimpo.com','Lesli'),('Hestia','Hes123','Hestia@olimpo.com','Soledad'),('Poseidon','Po123','Poseidon@olimpo.com','Marisol'),('qw','3165wqe','mail@lala.com','qwe'),('Zeus','Ze123','Zeuz@olimpo.com','Luis');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-15 22:37:42
