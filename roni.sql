-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: roni
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.20.04.3

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
-- Table structure for table `absen`
--

DROP TABLE IF EXISTS `absen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absen` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `jadwal_id` bigint unsigned NOT NULL,
  `mhs_id` bigint unsigned NOT NULL,
  `tgl_absen` date NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `absen_jadwal_id_foreign` (`jadwal_id`),
  KEY `absen_mhs_id_foreign` (`mhs_id`),
  CONSTRAINT `absen_jadwal_id_foreign` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `absen_mhs_id_foreign` FOREIGN KEY (`mhs_id`) REFERENCES `mhs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absen`
--

LOCK TABLES `absen` WRITE;
/*!40000 ALTER TABLE `absen` DISABLE KEYS */;
INSERT INTO `absen` VALUES (1,183,155,'2024-05-30','Sakit','2024-05-30 01:24:34','2024-05-30 01:24:34'),(2,183,155,'2024-05-31','Izin','2024-05-30 01:26:19','2024-05-30 01:26:19'),(3,183,155,'2024-06-19','Sakit','2024-06-18 23:40:16','2024-06-18 23:40:16'),(4,183,198,'2024-06-19','Hadir','2024-06-18 23:40:20','2024-06-18 23:40:28');
/*!40000 ALTER TABLE `absen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dosen`
--

DROP TABLE IF EXISTS `dosen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dosen` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `NIDN` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nm_dosen` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenkel` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dosen_user_id_foreign` (`user_id`),
  CONSTRAINT `dosen_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dosen`
--

LOCK TABLES `dosen` WRITE;
/*!40000 ALTER TABLE `dosen` DISABLE KEYS */;
INSERT INTO `dosen` VALUES (1,3,NULL,'Axelon Samuel Renyaan, S.SI., MT','Laki-laki','2024-05-21 12:42:12','2024-05-21 12:42:12'),(2,21,NULL,'Fegie Y Wattimena, ST., M,Kom','Perempuan','2024-05-21 12:42:20','2024-05-21 12:42:20'),(4,16,NULL,'Ermy D Sumanik, S.Pd., M.Li','Perempuan','2024-05-21 12:42:18','2024-05-21 12:42:18'),(5,20,NULL,'Faizal Dungio, M.Cs','Laki-laki','2024-05-21 12:42:19','2024-05-21 12:42:19'),(6,40,NULL,'Reni Koibur, M.Cs','Perempuan','2024-05-21 12:42:27','2024-05-21 12:42:27'),(7,2,NULL,'Andrijanni, S.Kom., M.Cs','Perempuan','2024-05-21 12:42:12','2024-05-21 12:42:12'),(8,25,NULL,'H. Edy Manurung, S.Si., M.Cs','Laki-laki','2024-05-21 12:42:21','2024-05-21 12:42:21'),(9,33,NULL,'Jeni B. Karay, S.Ikom., M.Kom','Perempuan','2024-05-21 12:42:25','2024-05-21 12:42:25'),(10,42,NULL,'Rizki T Rakhim, M.Cs','Laki-laki','2024-05-21 12:42:28','2024-05-21 12:42:28'),(11,13,NULL,'Efraim Mangaluk, M.Hum','Laki-laki','2024-05-21 12:42:17','2024-05-21 12:42:17'),(12,30,NULL,'Iriani Ira Bukorpioper, S.Si.,M.Si','Perempuan','2024-05-21 12:42:23','2024-05-21 12:42:23'),(13,27,NULL,'Inggrid Nortalia Kailola, M.Si','Perempuan','2024-05-21 12:42:22','2024-05-21 12:42:22'),(14,19,NULL,'Evie Warikar, M.Sc','Perempuan','2024-05-21 12:42:19','2024-05-21 12:42:19'),(15,23,NULL,'Galuh P W Utami, S.Si.,M.Si','Perempuan','2024-05-21 12:42:21','2024-05-21 12:42:21'),(16,44,NULL,'Selmi Yohana Stefani, S.Pd.,M.Pd','Perempuan','2024-05-21 12:42:29','2024-05-21 12:42:29'),(17,11,NULL,'Dr. ret. nat. Henderina Kailuhu','Perempuan','2024-05-21 12:42:16','2024-05-21 12:42:16'),(18,34,NULL,'Jhon Mampioper, M.Si','Laki-laki','2024-05-21 12:42:25','2024-05-21 12:42:25'),(19,49,NULL,'Tomi Nelambo, M.Si','Laki-laki','2024-05-21 12:42:31','2024-05-21 12:42:31'),(20,4,NULL,'Beatrix I.S. Wanma, S.Si., M.Si','Perempuan','2024-05-21 12:42:13','2024-05-21 12:42:13'),(21,48,'9912368559','Theopilus Korneles Tipawael , S.T., M.Pd','Laki-laki','2024-05-21 12:42:31','2024-05-21 12:42:31'),(22,22,NULL,'Fence George Aiwoy, S.T., M.T','Laki-laki','2024-05-21 12:42:20','2024-05-21 12:42:20'),(23,7,'1416118801','Doodle Dandy Waromi, S.T., M.T','Laki-laki','2024-05-21 12:42:14','2024-05-21 12:42:14'),(24,28,NULL,'Ir. Eko Indrianto, M.Eng., IPU','Laki-laki','2024-05-21 12:42:22','2024-05-21 12:42:22'),(25,32,'8861501019','Iwan Yaner Ayomi, S.T., M.Eng','Laki-laki','2024-05-21 12:42:24','2024-05-21 12:42:24'),(26,9,'0014065604','Dr. Maran Gultom','Laki-laki','2024-05-21 12:42:15','2024-05-21 12:42:15'),(27,24,NULL,'Golden Ringgo S. C. Ayomi, S.Pd., M.Pd','Laki-laki','2024-05-21 12:42:21','2024-05-21 12:42:21'),(28,29,NULL,'Ir. Ivan Ryan Waromi, S.T., MBA','Laki-laki','2024-05-21 12:42:23','2024-05-21 12:42:23'),(29,39,NULL,'Rahmat Indrajati, M.T','Laki-laki','2024-05-21 12:42:27','2024-05-21 12:42:27'),(30,51,NULL,'Yohan M. Indey, S.SI.M.Kom','Laki-laki','2024-05-21 12:42:32','2024-05-21 12:42:32'),(31,10,NULL,'Dr. Martha Wospakrik, M.Th','Perempuan','2024-05-21 12:42:16','2024-05-21 12:42:16'),(32,5,NULL,'Desty Pongsikabe, ST., M.Si','Laki-laki','2024-05-21 12:42:13','2024-05-21 12:42:13'),(33,26,NULL,'Halomoan E manurung, S.Si., M,Cs','Laki-laki','2024-05-21 12:42:22','2024-05-21 12:42:22'),(34,45,NULL,'Sireme Oyaitow, S.Si. M.Kom','Laki-laki','2024-05-21 12:42:30','2024-05-21 12:42:30'),(36,52,'1414088701','Yosep Boari, S.Si., M.Si','Laki-laki','2024-05-21 12:42:32','2024-05-21 12:42:32'),(37,53,NULL,'Yulindra Numberi, S.Si., M.Si','Perempuan','2024-05-21 12:42:33','2024-05-21 12:42:33'),(38,46,NULL,'Sonny Aribowo, S.T., M.T','Laki-laki','2024-05-21 12:42:30','2024-05-21 12:42:30'),(39,14,NULL,'Efraim Mangaluk, S.S., M.Hum','Laki-laki','2024-05-21 12:42:17','2024-05-21 12:42:17'),(40,38,NULL,'Pearl Salawati Y. Waromi, S.Si., M.Si','Perempuan','2024-05-21 12:42:27','2024-05-21 12:42:27'),(41,12,'0023026306','Dr. Virman','Laki-laki','2024-05-21 12:42:16','2024-05-21 12:42:16'),(42,43,'1211077401','Robianus Hara, S.T., M.Eng','Laki-laki','2024-05-21 12:42:29','2024-05-21 12:42:29'),(43,47,NULL,'Supianto, M.Cs','Laki-laki','2024-05-21 12:42:30','2024-05-21 12:42:30'),(44,36,NULL,'Paul Peter A. Antoh, S.T., M.Si','Laki-laki','2024-05-21 12:42:26','2024-05-21 12:42:26'),(45,6,NULL,'Dimitrij Q. Ananda sari, S.Pd., M.Pd','Perempuan','2024-05-21 12:42:14','2024-05-21 12:42:14'),(46,8,'00025066810','Dr. Lisye Zebua, M.Si','Perempuan','2024-05-21 12:42:15','2024-05-21 12:42:15'),(47,37,NULL,'Paulus Mandibodibo,S.Hut., MForSc&Mgt.IPM','Laki-laki','2024-05-21 12:42:26','2024-05-21 12:42:26'),(48,50,'1430098701','Yafet Wetipo, M.Si','Laki-laki','2024-05-21 12:42:32','2024-05-21 12:42:32'),(49,17,'1412059001','Ermy Dikta Sumanik, S.Pd., M.Li','Perempuan','2024-05-21 12:42:18','2024-05-21 12:42:18'),(50,41,'1402037301','Reni Koibur, S.Si., M.Cs','Perempuan','2024-05-21 12:42:28','2024-05-21 12:42:28'),(51,35,NULL,'Mayko Koibur,MT','Laki-laki','2024-05-21 12:42:25','2024-05-21 12:42:25'),(53,15,'1401118702','Efraim Manguluk, S.S., M.Hum','Laki-laki','2024-05-21 12:42:17','2024-05-21 12:42:17'),(54,18,'1412059001','Ermy Dikta Sumanik, S.Pd.,M.Li','Perempuan','2024-05-21 12:42:19','2024-05-21 12:42:19'),(55,31,NULL,'Isak Semuel Kmur, S.Tr., M.Si','Laki-laki','2024-05-21 12:42:24','2024-05-21 12:42:24');
/*!40000 ALTER TABLE `dosen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fakultas`
--

DROP TABLE IF EXISTS `fakultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fakultas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nm_fakultas` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `singkat` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fakultas`
--

LOCK TABLES `fakultas` WRITE;
/*!40000 ALTER TABLE `fakultas` DISABLE KEYS */;
INSERT INTO `fakultas` VALUES (1,'Fakultas Ekonomi dan Bisnis','FEB','2024-05-21 12:40:45','2024-05-21 12:40:45'),(2,'Fakultas Sains & Teknologi','FST','2024-05-21 12:40:45','2024-05-21 12:40:45'),(3,'Fakultas Pertanian, Kehutanan & Kelautan','FPKK','2024-05-21 12:40:45','2024-05-21 12:40:45'),(4,'Pasca Sarjana (S2)','PS','2024-05-21 12:40:45','2024-05-21 12:40:45'),(999,'UMUM','UM','2024-05-21 12:40:45','2024-05-21 12:40:45');
/*!40000 ALTER TABLE `fakultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jadwal`
--

DROP TABLE IF EXISTS `jadwal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jadwal` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodi_id` bigint unsigned NOT NULL,
  `matkul_id` bigint unsigned NOT NULL,
  `dosen_id` bigint unsigned NOT NULL,
  `ruangan_id` bigint unsigned NOT NULL,
  `hari` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mulai` time NOT NULL,
  `seles` time NOT NULL,
  `semester` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun` year NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jadwal_prodi_id_foreign` (`prodi_id`),
  KEY `jadwal_matkul_id_foreign` (`matkul_id`),
  KEY `jadwal_dosen_id_foreign` (`dosen_id`),
  KEY `jadwal_ruangan_id_foreign` (`ruangan_id`),
  CONSTRAINT `jadwal_dosen_id_foreign` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jadwal_matkul_id_foreign` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jadwal_prodi_id_foreign` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jadwal_ruangan_id_foreign` FOREIGN KEY (`ruangan_id`) REFERENCES `ruangan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jadwal`
--

LOCK TABLES `jadwal` WRITE;
/*!40000 ALTER TABLE `jadwal` DISABLE KEYS */;
INSERT INTO `jadwal` VALUES (1,2,147,15,4,'Senin','07:00:00','09:30:00','Ganjil',2023,'2024-05-21 14:21:58','2024-05-21 14:21:58'),(2,1,1,1,6,'Senin','07:30:00','10:30:00','Genap',2023,'2024-05-21 14:21:58','2024-05-21 14:21:58'),(3,1,92,7,1,'Senin','07:30:00','10:30:00','Ganjil',2020,'2024-05-21 14:21:58','2024-05-21 14:21:58'),(4,2,96,11,11,'Senin','07:30:00','10:30:00','Ganjil',2020,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(5,2,28,11,11,'Senin','07:30:00','10:30:00','Genap',2023,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(6,2,29,12,3,'Senin','07:30:00','10:30:00','Genap',2023,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(7,1,25,11,11,'Senin','07:30:00','10:30:00','Genap',2023,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(8,3,59,11,11,'Senin','07:30:00','10:30:00','Genap',2023,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(9,3,60,21,15,'Senin','07:30:00','10:30:00','Genap',2023,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(10,1,83,11,11,'Senin','07:30:00','10:30:00','Ganjil',2020,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(11,2,28,11,11,'Senin','07:30:00','09:30:00','Genap',2020,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(12,2,142,6,8,'Senin','07:30:00','10:30:00','Ganjil',2023,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(13,3,60,21,15,'Senin','07:30:00','10:30:00','Genap',2023,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(14,3,59,11,11,'Senin','07:30:00','10:30:00','Genap',2023,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(15,1,25,11,11,'Senin','07:30:00','10:30:00','Genap',2023,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(16,2,29,12,3,'Senin','07:30:00','10:30:00','Genap',2023,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(17,2,28,11,11,'Senin','07:30:00','10:30:00','Genap',2023,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(18,2,29,37,3,'Senin','07:30:00','10:30:00','Genap',2020,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(19,1,92,5,1,'Senin','07:30:00','10:30:00','Ganjil',2022,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(20,3,153,23,6,'Senin','07:30:00','09:30:00','Ganjil',2022,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(21,2,28,11,11,'Senin','07:30:00','10:30:00','Genap',2023,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(22,3,59,39,11,'Senin','07:30:00','10:30:00','Genap',2021,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(23,1,92,5,1,'Senin','07:30:00','10:30:00','Ganjil',2021,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(24,3,60,21,15,'Senin','07:30:00','10:30:00','Genap',2022,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(25,1,83,11,11,'Senin','07:30:00','10:30:00','Ganjil',2021,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(26,2,29,37,3,'Senin','07:30:00','10:30:00','Genap',2020,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(27,3,113,6,8,'Senin','07:30:00','10:30:00','Ganjil',2022,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(28,2,142,6,8,'Senin','07:30:00','10:30:00','Ganjil',2023,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(29,2,28,11,11,'Senin','07:30:00','09:30:00','Genap',2020,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(30,3,59,39,11,'Senin','07:30:00','10:30:00','Genap',2022,'2024-05-21 14:21:59','2024-05-21 14:21:59'),(31,1,25,11,11,'Senin','07:30:00','10:30:00','Genap',2020,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(32,3,59,39,11,'Senin','07:30:00','10:30:00','Genap',2022,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(33,2,28,11,11,'Senin','07:30:00','09:30:00','Genap',2020,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(34,1,1,5,6,'Senin','07:30:00','10:30:00','Genap',2020,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(35,3,113,6,8,'Senin','07:30:00','10:30:00','Ganjil',2022,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(36,3,59,39,11,'Senin','07:30:00','10:30:00','Genap',2021,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(37,1,83,11,11,'Senin','07:30:00','10:30:00','Ganjil',2021,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(38,1,92,5,1,'Senin','07:30:00','10:30:00','Ganjil',2021,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(39,3,110,39,11,'Senin','07:30:00','10:30:00','Ganjil',2021,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(40,1,1,1,6,'Senin','07:30:00','10:30:00','Genap',2023,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(41,2,142,6,8,'Senin','07:30:00','10:30:00','Ganjil',2023,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(42,3,153,23,6,'Senin','07:30:00','09:30:00','Ganjil',2022,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(43,1,92,5,1,'Senin','07:30:00','10:30:00','Ganjil',2021,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(44,2,29,37,3,'Senin','07:30:00','10:30:00','Genap',2020,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(45,2,28,11,11,'Senin','07:30:00','09:30:00','Genap',2020,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(46,3,111,31,11,'Senin','07:30:00','09:30:00','Ganjil',2023,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(47,3,60,21,15,'Senin','07:30:00','10:30:00','Genap',2022,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(48,3,59,39,11,'Senin','07:30:00','10:30:00','Genap',2022,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(49,2,97,14,3,'Senin','07:30:00','10:30:00','Ganjil',2021,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(50,1,1,1,6,'Senin','07:30:00','10:30:00','Genap',2023,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(51,2,128,13,14,'Senin','07:30:00','10:30:00','Ganjil',2023,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(52,1,1,1,6,'Senin','07:30:00','10:30:00','Genap',2022,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(53,2,142,6,8,'Senin','07:30:00','10:30:00','Ganjil',2022,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(54,2,97,14,3,'Senin','07:30:00','10:30:00','Ganjil',2021,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(55,3,60,21,15,'Senin','07:30:00','10:30:00','Genap',2020,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(56,2,96,39,11,'Senin','07:30:00','10:30:00','Ganjil',2021,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(57,2,99,13,8,'Senin','07:30:00','10:30:00','Ganjil',2021,'2024-05-21 14:22:00','2024-05-21 14:22:00'),(58,2,156,12,7,'Senin','07:30:00','10:30:00','Ganjil',2023,'2024-05-21 14:22:01','2024-05-21 14:22:01'),(59,1,1,1,6,'Senin','07:30:00','10:30:00','Genap',2023,'2024-05-21 14:22:01','2024-05-21 14:22:01'),(60,1,14,1,14,'Senin','08:00:00','11:00:00','Ganjil',2023,'2024-05-21 14:22:01','2024-05-21 14:22:01'),(61,2,51,49,16,'Senin','08:00:00','11:00:00','Ganjil',2023,'2024-05-21 14:22:01','2024-05-21 14:22:01'),(62,2,29,12,3,'Senin','08:00:00','10:00:00','Genap',2024,'2024-05-21 14:22:01','2024-05-21 14:22:01'),(63,1,14,1,14,'Senin','08:00:00','11:00:00','Ganjil',2023,'2024-05-21 14:22:01','2024-05-21 14:22:01'),(64,1,87,2,5,'Senin','08:00:00','11:00:00','Ganjil',2023,'2024-05-21 14:22:01','2024-05-21 14:22:01'),(65,3,60,21,15,'Senin','08:00:00','10:00:00','Genap',2024,'2024-05-21 14:22:01','2024-05-21 14:22:01'),(66,1,14,1,1,'Senin','08:00:00','11:00:00','Ganjil',2023,'2024-05-21 14:22:01','2024-05-21 14:22:01'),(67,2,51,4,16,'Senin','08:00:00','11:00:00','Ganjil',2023,'2024-05-21 14:22:01','2024-05-21 14:22:01'),(68,1,5,7,4,'Senin','10:00:00','12:00:00','Genap',2024,'2024-05-21 14:22:01','2024-05-21 14:22:01'),(69,3,77,23,12,'Senin','10:45:00','13:45:00','Genap',2020,'2024-05-21 14:22:01','2024-05-21 14:22:01'),(70,2,120,4,1,'Senin','10:45:00','12:45:00','Ganjil',2021,'2024-05-21 14:22:01','2024-05-21 14:22:01'),(71,1,84,4,1,'Senin','10:45:00','12:45:00','Ganjil',2020,'2024-05-21 14:22:01','2024-05-21 14:22:01'),(72,1,85,20,5,'Senin','10:45:00','13:45:00','Ganjil',2020,'2024-05-21 14:22:01','2024-05-21 14:22:01'),(73,1,2,2,1,'Senin','10:45:00','14:45:00','Genap',2022,'2024-05-21 14:22:01','2024-05-21 14:22:01'),(74,3,117,4,1,'Senin','10:45:00','12:45:00','Ganjil',2020,'2024-05-21 14:22:01','2024-05-21 14:22:01'),(75,1,2,2,1,'Senin','10:45:00','13:45:00','Genap',2020,'2024-05-21 14:22:01','2024-05-21 14:22:01'),(76,1,2,2,1,'Senin','10:45:00','14:45:00','Genap',2023,'2024-05-21 14:22:02','2024-05-21 14:22:02'),(77,3,77,23,12,'Senin','10:45:00','13:45:00','Genap',2021,'2024-05-21 14:22:02','2024-05-21 14:22:02'),(78,1,2,2,1,'Senin','10:45:00','14:45:00','Genap',2021,'2024-05-21 14:22:02','2024-05-21 14:22:02'),(79,3,117,4,1,'Senin','10:45:00','12:45:00','Ganjil',2021,'2024-05-21 14:22:02','2024-05-21 14:22:02'),(80,1,84,4,1,'Senin','10:45:00','12:45:00','Ganjil',2022,'2024-05-21 14:22:02','2024-05-21 14:22:02'),(81,3,77,23,12,'Senin','10:45:00','13:45:00','Genap',2021,'2024-05-21 14:22:02','2024-05-21 14:22:02'),(82,2,30,21,5,'Senin','10:45:00','13:45:00','Genap',2022,'2024-05-21 14:22:02','2024-05-21 14:22:02'),(83,1,2,2,1,'Senin','10:45:00','14:45:00','Genap',2021,'2024-05-21 14:22:02','2024-05-21 14:22:02'),(84,2,120,4,1,'Senin','10:45:00','12:45:00','Ganjil',2021,'2024-05-21 14:22:02','2024-05-21 14:22:02'),(85,2,120,4,1,'Senin','10:45:00','12:45:00','Ganjil',2023,'2024-05-21 14:22:02','2024-05-21 14:22:02'),(86,2,31,15,7,'Senin','11:00:00','13:00:00','Genap',2023,'2024-05-21 14:22:02','2024-05-21 14:22:02'),(87,3,61,4,14,'Senin','11:00:00','14:00:00','Genap',2023,'2024-05-21 14:22:02','2024-05-21 14:22:02'),(88,2,31,15,7,'Senin','11:00:00','13:00:00','Genap',2022,'2024-05-21 14:22:02','2024-05-21 14:22:02'),(89,3,61,4,14,'Senin','11:00:00','14:00:00','Genap',2022,'2024-05-21 14:22:02','2024-05-21 14:22:02'),(90,1,13,2,9,'Senin','11:30:00','14:45:00','Ganjil',2022,'2024-05-21 14:22:02','2024-05-21 14:22:02'),(91,2,30,21,12,'Senin','12:00:00','15:00:00','Genap',2021,'2024-05-21 14:22:02','2024-05-21 14:22:02'),(92,2,122,18,8,'Senin','12:00:00','14:00:00','Ganjil',2021,'2024-05-21 14:22:02','2024-05-21 14:22:02'),(93,2,122,47,8,'Senin','12:00:00','16:00:00','Ganjil',2022,'2024-05-21 14:22:02','2024-05-21 14:22:02'),(94,3,68,6,4,'Senin','12:00:00','14:00:00','Genap',2021,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(95,3,164,23,6,'Senin','12:00:00','14:00:00','Ganjil',2021,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(96,3,164,23,6,'Senin','12:00:00','14:00:00','Ganjil',2020,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(97,2,122,18,8,'Senin','12:00:00','14:00:00','Ganjil',2020,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(98,2,31,15,7,'Senin','12:00:00','15:00:00','Genap',2021,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(99,2,120,4,1,'Senin','12:15:00','14:15:00','Ganjil',2022,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(100,3,117,4,1,'Senin','12:15:00','14:15:00','Ganjil',2022,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(101,3,164,23,6,'Senin','12:45:00','14:45:00','Ganjil',2022,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(102,1,86,5,7,'Senin','12:45:00','15:45:00','Ganjil',2022,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(103,1,86,5,7,'Senin','12:45:00','15:45:00','Ganjil',2021,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(104,3,118,21,12,'Senin','13:00:00','16:00:00','Ganjil',2023,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(105,1,85,9,5,'Senin','13:00:00','16:00:00','Ganjil',2022,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(106,2,147,15,7,'Senin','13:00:00','15:00:00','Genap',2020,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(107,3,118,21,6,'Senin','13:00:00','16:00:00','Ganjil',2021,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(108,2,58,20,3,'Senin','13:00:00','15:00:00','Genap',2020,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(109,1,85,9,5,'Senin','13:00:00','16:00:00','Ganjil',2023,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(110,2,128,13,3,'Senin','13:00:00','16:00:00','Ganjil',2020,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(111,3,118,21,6,'Senin','13:00:00','16:00:00','Ganjil',2020,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(112,1,85,9,5,'Senin','13:00:00','16:00:00','Ganjil',2023,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(113,1,84,49,16,'Senin','13:00:00','15:00:00','Ganjil',2023,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(114,1,92,30,8,'Senin','13:00:00','15:00:00','Ganjil',2023,'2024-05-21 14:22:03','2024-05-21 14:22:03'),(115,2,128,13,3,'Senin','13:00:00','16:00:00','Ganjil',2022,'2024-05-21 14:22:04','2024-05-21 14:22:04'),(116,1,85,9,5,'Senin','13:00:00','16:00:00','Ganjil',2023,'2024-05-21 14:22:04','2024-05-21 14:22:04'),(117,2,128,13,3,'Senin','13:00:00','16:00:00','Ganjil',2020,'2024-05-21 14:22:04','2024-05-21 14:22:04'),(118,2,58,20,3,'Senin','13:00:00','15:00:00','Genap',2020,'2024-05-21 14:22:04','2024-05-21 14:22:04'),(119,3,118,21,6,'Senin','13:00:00','16:00:00','Ganjil',2021,'2024-05-21 14:22:04','2024-05-21 14:22:04'),(120,3,164,23,6,'Senin','13:00:00','15:00:00','Ganjil',2023,'2024-05-21 14:22:04','2024-05-21 14:22:04'),(121,2,163,13,4,'Senin','13:00:00','15:00:00','Genap',2024,'2024-05-21 14:22:04','2024-05-21 14:22:04'),(122,1,84,4,1,'Senin','13:00:00','15:00:00','Ganjil',2023,'2024-05-21 14:22:04','2024-05-21 14:22:04'),(123,3,117,4,16,'Senin','13:00:00','15:00:00','Ganjil',2023,'2024-05-21 14:22:04','2024-05-21 14:22:04'),(124,2,33,12,7,'Senin','13:00:00','16:00:00','Genap',2024,'2024-05-21 14:22:04','2024-05-21 14:22:04'),(125,2,58,20,3,'Senin','13:00:00','15:00:00','Genap',2020,'2024-05-21 14:22:05','2024-05-21 14:22:05'),(126,2,122,47,14,'Senin','13:00:00','15:00:00','Ganjil',2023,'2024-05-21 14:22:05','2024-05-21 14:22:05'),(127,1,85,9,5,'Senin','13:00:00','16:00:00','Ganjil',2021,'2024-05-21 14:22:05','2024-05-21 14:22:05'),(128,1,92,30,8,'Senin','13:00:00','15:00:00','Ganjil',2023,'2024-05-21 14:22:05','2024-05-21 14:22:05'),(129,2,32,13,5,'Senin','13:15:00','16:15:00','Genap',2023,'2024-05-21 14:22:05','2024-05-21 14:22:05'),(130,2,32,13,5,'Senin','13:15:00','16:15:00','Genap',2022,'2024-05-21 14:22:05','2024-05-21 14:22:05'),(131,1,3,10,9,'Senin','13:45:00','16:45:00','Genap',2020,'2024-05-21 14:22:05','2024-05-21 14:22:05'),(132,1,26,8,17,'Senin','13:45:00','16:45:00','Genap',2024,'2024-05-21 14:22:05','2024-05-21 14:22:05'),(133,1,8,33,3,'Senin','13:45:00','16:45:00','Genap',2021,'2024-05-21 14:22:05','2024-05-21 14:22:05'),(134,1,8,8,3,'Senin','13:45:00','16:45:00','Genap',2020,'2024-05-21 14:22:05','2024-05-21 14:22:05'),(135,1,4,5,10,'Senin','13:45:00','16:45:00','Genap',2023,'2024-05-21 14:22:06','2024-05-21 14:22:06'),(136,1,26,6,3,'Senin','13:45:00','16:45:00','Genap',2023,'2024-05-21 14:22:06','2024-05-21 14:22:06'),(137,1,3,1,9,'Senin','13:45:00','16:45:00','Genap',2023,'2024-05-21 14:22:06','2024-05-21 14:22:06'),(138,1,4,5,10,'Senin','13:45:00','16:45:00','Genap',2022,'2024-05-21 14:22:06','2024-05-21 14:22:06'),(139,1,3,1,9,'Senin','13:45:00','16:45:00','Genap',2022,'2024-05-21 14:22:06','2024-05-21 14:22:06'),(140,1,174,6,9,'Senin','13:45:00','16:45:00','Genap',2024,'2024-05-21 14:22:06','2024-05-21 14:22:06'),(142,3,129,23,12,'Senin','14:00:00','17:00:00','Ganjil',2022,'2024-05-21 14:22:06','2024-05-21 14:22:06'),(143,1,2,2,16,'Senin','14:00:00','16:00:00','Genap',2024,'2024-05-21 14:22:06','2024-05-21 14:22:06'),(144,3,62,44,6,'Senin','14:00:00','16:00:00','Genap',2024,'2024-05-21 14:22:06','2024-05-21 14:22:06'),(145,3,143,23,12,'Senin','14:00:00','17:00:00','Ganjil',2022,'2024-05-21 14:22:07','2024-05-21 14:22:07'),(146,1,5,7,5,'Senin','14:00:00','16:00:00','Genap',2023,'2024-05-21 14:22:07','2024-05-21 14:22:07'),(147,2,33,12,7,'Senin','14:00:00','17:00:00','Genap',2022,'2024-05-21 14:22:07','2024-05-21 14:22:07'),(148,2,38,12,4,'Senin','14:00:00','16:00:00','Genap',2021,'2024-05-21 14:22:07','2024-05-21 14:22:07'),(149,2,34,13,3,'Senin','14:00:00','16:00:00','Genap',2023,'2024-05-21 14:22:07','2024-05-21 14:22:07'),(150,2,34,13,3,'Senin','14:00:00','16:00:00','Genap',2022,'2024-05-21 14:22:07','2024-05-21 14:22:07'),(151,3,157,26,5,'Senin','14:00:00','16:00:00','Ganjil',2020,'2024-05-21 14:22:07','2024-05-21 14:22:07'),(152,3,129,42,12,'Senin','14:00:00','17:00:00','Ganjil',2021,'2024-05-21 14:22:07','2024-05-21 14:22:07'),(153,2,37,15,5,'Senin','14:00:00','16:00:00','Genap',2020,'2024-05-21 14:22:07','2024-05-21 14:22:07'),(154,3,62,23,6,'Senin','14:00:00','16:00:00','Genap',2020,'2024-05-21 14:22:07','2024-05-21 14:22:07'),(155,3,62,22,6,'Senin','14:00:00','16:00:00','Genap',2022,'2024-05-21 14:22:08','2024-05-21 14:22:08'),(156,3,143,23,12,'Senin','14:00:00','17:00:00','Ganjil',2023,'2024-05-21 14:22:08','2024-05-21 14:22:08'),(157,3,157,26,5,'Senin','14:00:00','16:00:00','Ganjil',2021,'2024-05-21 14:22:08','2024-05-21 14:22:08'),(158,3,129,42,12,'Senin','14:00:00','17:00:00','Ganjil',2020,'2024-05-21 14:22:08','2024-05-21 14:22:08'),(159,3,62,23,6,'Senin','14:00:00','16:00:00','Genap',2021,'2024-05-21 14:22:08','2024-05-21 14:22:08'),(160,3,66,25,8,'Senin','14:00:00','17:00:00','Genap',2020,'2024-05-21 14:22:08','2024-05-21 14:22:08'),(161,3,66,25,8,'Senin','14:00:00','17:00:00','Genap',2021,'2024-05-21 14:22:08','2024-05-21 14:22:08'),(162,3,62,22,6,'Senin','14:00:00','16:00:00','Genap',2023,'2024-05-21 14:22:08','2024-05-21 14:22:08'),(163,1,5,7,5,'Senin','14:00:00','16:00:00','Genap',2022,'2024-05-21 14:22:08','2024-05-21 14:22:08'),(164,1,5,7,5,'Senin','14:00:00','16:00:00','Genap',2020,'2024-05-21 14:22:08','2024-05-21 14:22:08'),(165,2,33,12,7,'Senin','14:00:00','17:00:00','Genap',2023,'2024-05-21 14:22:08','2024-05-21 14:22:08'),(166,1,94,6,1,'Senin','14:45:00','17:45:00','Genap',2021,'2024-05-21 14:22:08','2024-05-21 14:22:08'),(167,1,3,10,9,'Senin','14:45:00','17:45:00','Genap',2021,'2024-05-21 14:22:09','2024-05-21 14:22:09'),(168,2,30,21,5,'Senin','15:00:00','16:00:00','Genap',2020,'2024-05-21 14:22:09','2024-05-21 14:22:09'),(169,1,3,10,9,'Senin','15:00:00','18:00:00','Ganjil',2022,'2024-05-21 14:22:09','2024-05-21 14:22:09'),(170,1,3,10,9,'Senin','15:00:00','18:00:00','Ganjil',2021,'2024-05-21 14:22:09','2024-05-21 14:22:09'),(171,1,108,2,9,'Senin','15:00:00','15:30:00','Ganjil',2022,'2024-05-21 14:22:09','2024-05-21 14:22:09'),(172,3,59,39,11,'Senin','15:00:00','17:00:00','Genap',2024,'2024-05-21 14:22:09','2024-05-21 14:22:09'),(173,1,25,11,11,'Senin','15:00:00','17:00:00','Genap',2024,'2024-05-21 14:22:09','2024-05-21 14:22:09'),(174,2,170,19,6,'Senin','15:00:00','17:00:00','Ganjil',2023,'2024-05-21 14:22:09','2024-05-21 14:22:09'),(175,2,28,53,11,'Senin','15:00:00','17:00:00','Genap',2024,'2024-05-21 14:22:09','2024-05-21 14:22:09'),(176,2,37,15,5,'Senin','15:00:00','17:00:00','Genap',2024,'2024-05-21 14:22:10','2024-05-21 14:22:10'),(177,1,26,6,7,'Senin','15:30:00','18:30:00','Ganjil',2022,'2024-05-21 14:22:10','2024-05-21 14:22:10'),(178,1,26,6,7,'Senin','15:30:00','18:30:00','Ganjil',2021,'2024-05-21 14:22:10','2024-05-21 14:22:10'),(179,1,26,8,8,'Senin','16:00:00','19:00:00','Ganjil',2023,'2024-05-21 14:22:10','2024-05-21 14:22:10'),(180,1,91,9,4,'Senin','16:00:00','18:00:00','Ganjil',2023,'2024-05-21 14:22:10','2024-05-21 14:22:10'),(181,1,26,33,8,'Senin','16:00:00','19:00:00','Ganjil',2023,'2024-05-21 14:22:10','2024-05-21 14:22:10'),(182,1,91,9,4,'Senin','16:00:00','18:00:00','Ganjil',2023,'2024-05-21 14:22:10','2024-05-21 14:22:10'),(183,1,15,1,6,'Senin','16:00:00','19:00:00','Genap',2024,'2024-05-21 14:22:10','2024-05-21 14:22:10'),(184,3,129,23,12,'Senin','17:00:00','20:00:00','Ganjil',2023,'2024-05-21 14:22:10','2024-05-21 14:22:10'),(185,1,15,1,4,'Senin','19:00:00','22:00:00','Ganjil',2023,'2024-05-21 14:22:11','2024-05-21 14:22:11'),(186,1,15,1,4,'Senin','19:00:00','22:00:00','Ganjil',2023,'2024-05-21 14:22:11','2024-05-21 14:22:11'),(187,3,64,23,4,'Selasa','07:00:00','09:30:00','Genap',2024,'2024-05-21 14:22:11','2024-05-21 14:22:11'),(188,2,132,13,8,'Selasa','07:30:00','09:30:00','Ganjil',2023,'2024-05-21 14:22:11','2024-05-21 14:22:11'),(189,2,169,31,11,'Selasa','07:30:00','09:30:00','Ganjil',2023,'2024-05-21 14:22:11','2024-05-21 14:22:11'),(190,2,35,14,6,'Selasa','07:30:00','09:30:00','Genap',2024,'2024-05-21 14:22:11','2024-05-21 14:22:11'),(191,3,63,21,15,'Selasa','07:30:00','09:30:00','Genap',2024,'2024-05-21 14:22:11','2024-05-21 14:22:11'),(192,1,88,31,11,'Selasa','07:30:00','09:30:00','Ganjil',2023,'2024-05-21 14:22:11','2024-05-21 14:22:11'),(193,1,6,1,16,'Selasa','07:30:00','10:30:00','Genap',2024,'2024-05-21 14:22:11','2024-05-21 14:22:11'),(194,2,55,12,7,'Selasa','07:30:00','09:30:00','Ganjil',2023,'2024-05-21 14:22:12','2024-05-21 14:22:12'),(195,3,64,23,4,'Selasa','07:30:00','09:30:00','Genap',2022,'2024-05-21 14:22:12','2024-05-21 14:22:12'),(196,2,55,12,7,'Selasa','07:30:00','09:30:00','Ganjil',2020,'2024-05-21 14:22:12','2024-05-21 14:22:12'),(197,3,63,21,15,'Selasa','07:30:00','09:30:00','Genap',2020,'2024-05-21 14:22:12','2024-05-21 14:22:12'),(198,3,63,21,15,'Selasa','07:30:00','09:30:00','Genap',2022,'2024-05-21 14:22:12','2024-05-21 14:22:12'),(199,3,138,23,6,'Selasa','07:30:00','10:30:00','Ganjil',2021,'2024-05-21 14:22:12','2024-05-21 14:22:12'),(200,2,41,17,7,'Selasa','07:30:00','10:30:00','Genap',2021,'2024-05-21 14:22:12','2024-05-21 14:22:12'),(201,1,15,1,16,'Senin','08:00:00','09:45:00','Genap',2024,'2024-06-11 19:20:48','2024-06-11 19:20:48'),(202,1,5,7,16,'Senin','08:00:00','15:00:00','Genap',2024,'2024-06-11 19:48:40','2024-06-11 19:48:40');
/*!40000 ALTER TABLE `jadwal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jawaban`
--

DROP TABLE IF EXISTS `jawaban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jawaban` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pertanyaan_id` bigint unsigned NOT NULL,
  `mhs_id` bigint unsigned NOT NULL,
  `jawaban` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jawaban_pertanyaan_id_foreign` (`pertanyaan_id`),
  KEY `jawaban_mhs_id_foreign` (`mhs_id`),
  CONSTRAINT `jawaban_mhs_id_foreign` FOREIGN KEY (`mhs_id`) REFERENCES `mhs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jawaban_pertanyaan_id_foreign` FOREIGN KEY (`pertanyaan_id`) REFERENCES `pertanyaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jawaban`
--

LOCK TABLES `jawaban` WRITE;
/*!40000 ALTER TABLE `jawaban` DISABLE KEYS */;
INSERT INTO `jawaban` VALUES (1,1,177,'hhdsjdsjs','2024-06-19 00:16:29','2024-06-19 00:16:29'),(2,1,177,'hhdsjdsjs','2024-06-19 00:16:31','2024-06-19 00:16:31'),(3,1,177,'hfdjfdjjk','2024-06-19 00:17:05','2024-06-19 00:17:05'),(4,1,177,'hfdjfdjjk','2024-06-19 00:17:11','2024-06-19 00:17:11'),(5,2,177,'sdcccm','2024-06-19 00:17:57','2024-06-19 00:17:57');
/*!40000 ALTER TABLE `jawaban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jawabans`
--

DROP TABLE IF EXISTS `jawabans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jawabans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jawabans`
--

LOCK TABLES `jawabans` WRITE;
/*!40000 ALTER TABLE `jawabans` DISABLE KEYS */;
/*!40000 ALTER TABLE `jawabans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kontrak`
--

DROP TABLE IF EXISTS `kontrak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kontrak` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodi_id` bigint unsigned NOT NULL,
  `semester` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun` year NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kontrak_prodi_id_foreign` (`prodi_id`),
  CONSTRAINT `kontrak_prodi_id_foreign` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kontrak`
--

LOCK TABLES `kontrak` WRITE;
/*!40000 ALTER TABLE `kontrak` DISABLE KEYS */;
INSERT INTO `kontrak` VALUES (1,1,'Genap',2024,'2024-05-21 14:36:50','2024-05-21 14:36:50'),(2,1,'Genap',2024,'2024-05-30 01:19:08','2024-05-30 01:19:08'),(3,1,'Genap',2024,'2024-06-11 19:14:28','2024-06-11 19:14:28'),(4,1,'Genap',2024,'2024-06-13 21:00:58','2024-06-13 21:00:58');
/*!40000 ALTER TABLE `kontrak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kontrak_det`
--

DROP TABLE IF EXISTS `kontrak_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kontrak_det` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kontrak_id` bigint unsigned NOT NULL,
  `jadwal_id` bigint unsigned NOT NULL,
  `mhs_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kontrak_det_kontrak_id_foreign` (`kontrak_id`),
  KEY `kontrak_det_jadwal_id_foreign` (`jadwal_id`),
  KEY `kontrak_det_mhs_id_foreign` (`mhs_id`),
  CONSTRAINT `kontrak_det_jadwal_id_foreign` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kontrak_det_kontrak_id_foreign` FOREIGN KEY (`kontrak_id`) REFERENCES `kontrak` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kontrak_det_mhs_id_foreign` FOREIGN KEY (`mhs_id`) REFERENCES `mhs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kontrak_det`
--

LOCK TABLES `kontrak_det` WRITE;
/*!40000 ALTER TABLE `kontrak_det` DISABLE KEYS */;
INSERT INTO `kontrak_det` VALUES (1,1,68,107,'2024-05-21 14:36:50','2024-05-21 14:36:50'),(2,1,132,107,'2024-05-21 14:36:50','2024-05-21 14:36:50'),(4,1,143,107,'2024-05-21 14:36:50','2024-05-21 14:36:50'),(5,2,183,155,'2024-05-30 01:19:08','2024-05-30 01:19:08'),(6,3,183,198,'2024-06-11 19:14:28','2024-06-11 19:14:28'),(7,3,193,198,'2024-06-11 19:14:28','2024-06-11 19:14:28'),(8,4,68,177,'2024-06-13 21:00:58','2024-06-13 21:00:58'),(9,4,201,177,'2024-06-13 21:00:58','2024-06-13 21:00:58'),(10,4,193,177,'2024-06-13 21:00:58','2024-06-13 21:00:58');
/*!40000 ALTER TABLE `kontrak_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_mhs`
--

DROP TABLE IF EXISTS `login_mhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_mhs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mhs_id` bigint unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_mhs_email_unique` (`email`),
  KEY `login_mhs_mhs_id_foreign` (`mhs_id`),
  CONSTRAINT `login_mhs_mhs_id_foreign` FOREIGN KEY (`mhs_id`) REFERENCES `mhs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_mhs`
--

LOCK TABLES `login_mhs` WRITE;
/*!40000 ALTER TABLE `login_mhs` DISABLE KEYS */;
INSERT INTO `login_mhs` VALUES (1,1,'abillyo_s@mail.com','$2y$12$LfpFJwY9WAgZex6ybEPKke2oNAV4gUUkUTfSHkwnHco5TXtu8Mxs.','o9iiqd3a','2024-05-21 12:42:53','2024-05-21 12:42:53'),(2,2,'rikardus_badjim@mail.com','$2y$12$3Fhe43XxgHujy2MQik3jUusrJNopg.oDjME5IYEFgLdGjBpz0uhJm','fzminwl_','2024-05-21 12:42:53','2024-05-21 12:42:53'),(3,3,'osea_yumai@mail.com','$2y$12$cUZhIrNxw0ViqxKJxABQ9eJGjVoNHgnrU/h7LluIGBJZmPKZzyMOq','vnsqzqqt','2024-05-21 12:42:54','2024-05-21 12:42:54'),(4,4,'zadrak_baltazar_wabia@mail.com','$2y$12$BJw1QYwbgIdOphQbYIQYduMPcxbjPwZ0f.F8meviyYWp/uIZ5RdhS','96bk9c3p','2024-05-21 12:42:54','2024-05-21 12:42:54'),(5,5,'daniel_e@mail.com','$2y$12$6hfHf4biZBCwuFnnlpJhGuAFHqQUa2jGbgp/dWgA3PpaOTBzEQs06','cd1hggq_','2024-05-21 12:42:54','2024-05-21 12:42:54'),(6,6,'rexiy_kbarek@mail.com','$2y$12$7nqEoeREOI8VSngWunTzfuXO1Xg091riJuRqhyE3Od3R4K4p/0eSu','v4dksnu7','2024-05-21 12:42:55','2024-05-21 12:42:55'),(7,7,'pilipus_rapami@mail.com','$2y$12$uYXZKhWmZzeb7eF1eYTCxefttjKtVyE8rGwN4Z4dOPuixRCcVYPjm','-oq3zb7i','2024-05-21 12:42:55','2024-05-21 12:42:55'),(8,8,'ankian_bunai@mail.com','$2y$12$OtITN783Rcwgt0aIPuy1AehmeivBxuBUobtQ6oBpAuQs8ncpf41sa','-fk_28w8','2024-05-21 12:42:55','2024-05-21 12:42:55'),(9,9,'lince_irene_rawar@mail.com','$2y$12$fjjExS78xfiyJxQ6yL2ApOBJ0mHpGyJbQIVSicVDfeOxxMlSF2/8K','15a8hi2p','2024-05-21 12:42:56','2024-05-21 12:42:56'),(10,10,'gerson_g@mail.com','$2y$12$x0rSC/oBU/ugPLINzOf9fOnvOZjzgR.onrrUPpJDaAo42JAr2mfxa','5tyj_eb7','2024-05-21 12:42:56','2024-05-21 12:42:56'),(11,11,'marcus_nikolas_yarru@mail.com','$2y$12$POZAheiroClg0Br/2uFwSehSzhgaCkZg5EPFsj34NO3ZjoQfpNgtq','8yj-1lrb','2024-05-21 12:42:57','2024-05-21 12:42:57'),(12,12,'tobi_c@mail.com','$2y$12$H/Wqa.PtaXnsxAt7cIbn/OB68l3Zig0yteFSUW5KS4u3m/AqLU80e','buz78xtz','2024-05-21 12:42:57','2024-05-21 12:42:57'),(13,13,'takius_wanena@mail.com','$2y$12$NPQQpdmtU/NpCPQqJe1pUOGOnvANft33jsOggdRgzgBZ/AI8zZQF6','0t00rthb','2024-05-21 12:42:57','2024-05-21 12:42:57'),(14,14,'elvira_marlina_maredret@mail.com','$2y$12$weNnQAIrX/oOS1r639V/UOewlP9.M/rQ9jWp9cukG1R6Fa9D2bN.a','8pga06b5','2024-05-21 12:42:58','2024-05-21 12:42:58'),(15,15,'bartomius_m@mail.com','$2y$12$UnSkC/pJ3s/zErr1MOx0N.mVhn4wCNEQcXIZVGr8bXVp5Q7hXUMMG','m-bkp-jz','2024-05-21 12:42:58','2024-05-21 12:42:58'),(16,16,'marsel_moga@mail.com','$2y$12$owx408ys0R2c72XGbRgRH.Ln4.uN6Os8yFsCH02hul2EsRo8IBRpy','r8jvlncx','2024-05-21 12:42:58','2024-05-21 12:42:58'),(17,17,'natalis_h@mail.com','$2y$12$5gQx1DrwdieKrLRaibhfZ.Pz39wC7FAvFHaCyYYEVfb7XXZ3Z8ORK','15ls4pp7','2024-05-21 12:42:59','2024-05-21 12:42:59'),(18,18,'lince_k_ramandei@mail.com','$2y$12$GILiSTla3RZ5gH4DDG6AhOgT9JHni0s4eXoo8Ghd17FwbBg49a6Su','5k3q7ex_','2024-05-21 12:42:59','2024-05-21 12:42:59'),(19,19,'ribka_a@mail.com','$2y$12$uq7AL68tphU4vZ3nUqtihemSF9kmUjlGcv38cwoOZl2fuwVco6ZbK','v1m9jhsr','2024-05-21 12:43:00','2024-05-21 12:43:00'),(20,20,'lukas_batyakaru@mail.com','$2y$12$e3CL7SLJ/CzHoVC.EXM6Bu/kppELHWD0QUu.kBO8rSeu.WuvEsQwq','88ar-qap','2024-05-21 12:43:00','2024-05-21 12:43:00'),(21,21,'marthen_felex_abi@mail.com','$2y$12$k4gFgOG4l.oeAUhrbl8GJukilfx09.s4jX92sqPJrjUMyqy2jGvbi','_4di44wo','2024-05-21 12:43:01','2024-05-21 12:43:01'),(22,22,'omdes_tuama_sihombing@mail.com','$2y$12$xCJGo7PHa3IzVqSh8K9xoeUYhoi9YAXFZT4d0fX/HFMRM9HrIuxAO','k_kys35d','2024-05-21 12:43:01','2024-05-21 12:43:01'),(23,23,'zeth_wamafma@mail.com','$2y$12$DPC4hxajNBranF2J15857eZcN35dYx4ktPE9JEZqn1wJidc4p8Xli','l5t_vtzr','2024-05-21 12:43:01','2024-05-21 12:43:01'),(24,24,'piter_gununi@mail.com','$2y$12$I3f6PkdfW3qyAD.SvXBE1uZXwb33YQilEvmTcKy2Nb7Jd4/nCSQQ2','eetby3uq','2024-05-21 12:43:02','2024-05-21 12:43:02'),(25,25,'stenly_y@mail.com','$2y$12$3HnHTSugaScaXrHm4ig0Pu/5Lv/18nusCKuvvnwRiHHxVvHeF6QaC','h3sawl1z','2024-05-21 12:43:02','2024-05-21 12:43:02'),(26,26,'yahya_simbiak@mail.com','$2y$12$e.tFwI0jDRanIslHxSOqR.7ztEBvRqy32.HkF8dkr4ufA9LmbO9US','uq57iyaq','2024-05-21 12:43:03','2024-05-21 12:43:03'),(27,27,'febi_slamat_marunduri@mail.com','$2y$12$1LcYqZfbtQiXAGtb6vtir.mob5r9/88T90tXsr2ZyhTsm5haZVkza','krr9twz4','2024-05-21 12:43:03','2024-05-21 12:43:03'),(28,28,'hana_beay@mail.com','$2y$12$0d3MxtSh136L6xarSqRPR.dZz63xmsqytY6c/0ma3NOQqVHBrcHq2','47ms12w9','2024-05-21 12:43:04','2024-05-21 12:43:04'),(29,29,'calvin_a@mail.com','$2y$12$U5lIDfqT906MmbPJ/cX/KujyASngMfq4LGx.B/eJeX3cMK0G9sSn.','qk_ylgwa','2024-05-21 12:43:04','2024-05-21 12:43:04'),(30,30,'ariwibowo@mail.com','$2y$12$6f/cJS0LLc0enp7eU4hg.OW5FjpyABNLdRw3JPcQEgoYX62RoSn5O','esju6q_6','2024-05-21 12:43:05','2024-05-21 12:43:05'),(31,31,'nixon_amunauw@mail.com','$2y$12$Dv9M12QsWh01M0DLqXD9Q.mBbW8XJt5cenLKP4OXaGDUfCT.oX496','irysaulb','2024-05-21 12:43:05','2024-05-21 12:43:05'),(32,32,'alvarido_boy_peres_rumbiak@mail.com','$2y$12$lOFcbkq18LzOabIYfOBFsulIWLze/BC5txlbnbtQcq1yFi9IX46bq','p0t4y56c','2024-05-21 12:43:05','2024-05-21 12:43:05'),(33,33,'sonny_a@mail.com','$2y$12$q6P/McHLQ1R5CVDpbt0.3uJ2Q1ZpN2Cq4z0rP12dJWAk2Yz8HxU6.','eawgwaai','2024-05-21 12:43:06','2024-05-21 12:43:06'),(34,34,'yufuway_agustinus_m@mail.com','$2y$12$Sup4XtxaBUFhiuC.WpEzmuiMbQfUOIBI4gBE6vds35Cd5YA0s6u0K','shbijxup','2024-05-21 12:43:07','2024-05-21 12:43:07'),(35,35,'marsella_m@mail.com','$2y$12$52/SN5uc2DcpL63JAB95venoVplqKLyFiGRhWqKAgaoyogdxss7K6','kwjk13dd','2024-05-21 12:43:07','2024-05-21 12:43:07'),(36,36,'yosabet_mirin@mail.com','$2y$12$7ODfZaQvut6TIXnri5R5e./vmnApEffAII8srqqY/EWN/H7xfMwhi','fbcxf6bs','2024-05-21 12:43:07','2024-05-21 12:43:07'),(37,37,'umi_fanda_f@mail.com','$2y$12$kM3qJH.OW2iuxJ3nN9/lHeOszcVPBbgJtCaNxGM8O1rQ12LETac/u','ywyf3teq','2024-05-21 12:43:08','2024-05-21 12:43:08'),(38,38,'lukas_nerotuminelena@mail.com','$2y$12$rDQh2OvqSvTbJvQvsx9ga.6n4GIZmTo5w4rigt84Bc1/20uYkgfya','gtgj9fm8','2024-05-21 12:43:08','2024-05-21 12:43:08'),(39,39,'irlando_sokoy@mail.com','$2y$12$kVlNBFIjwarnmcNCJX0FU.EPI7PlHuO/iPYR8jC1q/8q05K7EBOOm','cl_1pb4r','2024-05-21 12:43:09','2024-05-21 12:43:09'),(40,40,'elisa_n@mail.com','$2y$12$72DP6GPfKaxIhHzzSkP7/uT0lSrMwRT5SGAh31T.RizA.9YUSko7q','cba2puip','2024-05-21 12:43:09','2024-05-21 12:43:09'),(41,41,'luis_sander_wona@mail.com','$2y$12$SMz7jPAk4LeKOoyPRwkmUOIE4fW/nAeU.gkDNjbOHmF/Qh3ZqcTGG','o883ez6s','2024-05-21 12:43:09','2024-05-21 12:43:09'),(42,42,'muhamad_andika_rahmat@mail.com','$2y$12$fR5gFDKUXMhrKzoh0NTmj.96BZWgud2VOuRVJHDlb0WUOOedXxkDS','dnod_eoz','2024-05-21 12:43:10','2024-05-21 12:43:10'),(43,43,'konstantina_fantri_wandamani@mail.com','$2y$12$7oMKzBCtygY6YkD2zHC6z.E4/T13T0Mn1nM6aU0QVIJaEOLcZBQri','f1rzekzj','2024-05-21 12:43:10','2024-05-21 12:43:10'),(44,44,'krisolit_y_semboari@mail.com','$2y$12$t7s3/u/iDpoUBaEJqD7k7emfVRlsN9RKyyL2UR9/M1VOpeDZIILzy','l_1zzgbr','2024-05-21 12:43:10','2024-05-21 12:43:10'),(45,45,'boas_menand_y_riburi@mail.com','$2y$12$ccjBRuWwBNs1UtHtXBCrFuzGp8K3GKCCY9j8OjQvzA/jXBOlRCVIu','aqomj6ok','2024-05-21 12:43:11','2024-05-21 12:43:11'),(46,46,'robert_wafom@mail.com','$2y$12$aLLF4186q8TFJk/oc3UxgO3JkH5cqOQ9zNlr99QuqcTXPp4eaAQY6','936ust60','2024-05-21 12:43:11','2024-05-21 12:43:11'),(47,47,'tinweng_hiktaop@mail.com','$2y$12$Ef12zL9HGXNVoMHkSLCx4.x05WFHJt2YQwmYKdw1.rlp7PZiw1ZuC','3ium8a_w','2024-05-21 12:43:12','2024-05-21 12:43:12'),(48,48,'metodius_uropmabin@mail.com','$2y$12$d5Bjg3MevefaK7F9hVRtmuJzcwRChKWE04TCq75c2oGtkJfnODbdK','gkhquq3n','2024-05-21 12:43:12','2024-05-21 12:43:12'),(49,49,'wihelmus_i@mail.com','$2y$12$zrlelNVni1ZRHkKK0WdPC.3hHwU0faHCdtcCeqiW.HyMeEmqxmxWK','zgai1sk9','2024-05-21 12:43:12','2024-05-21 12:43:12'),(50,50,'hertoq_a_marandof@mail.com','$2y$12$2FBBCFB0TEZwRsN.rmojmubHggfnFbfr1vld6RLKfMJz9uGG.VvEe','09mm70_5','2024-05-21 12:43:13','2024-05-21 12:43:13'),(51,51,'novita_karlenci_indey@mail.com','$2y$12$GGp6EJyvhJnYY8FeaOHe5e1HHIS.JBGu.HWiL5W8HDfUweZ92vzUe','v0-uvg-_','2024-05-21 12:43:13','2024-05-21 12:43:13'),(52,52,'nelson_baura@mail.com','$2y$12$0.QaNLenf0Y1qs8WaHAn7.UB3aSqP5FcU/i7typreheZR4dq/lNHu','bhlq6r_o','2024-05-21 12:43:14','2024-05-21 12:43:14'),(53,53,'agustina_serewi@mail.com','$2y$12$kzPYgnB6kETKpqvIIDXlM.85DyHphmWJSGN21se9.hqnr0/czpJaO','xqcar2i1','2024-05-21 12:43:14','2024-05-21 12:43:14'),(54,54,'eva_sarawan@mail.com','$2y$12$Evl7ggk3R5ZhqwhSmO0VjOUHqUvi4tSmVdA3fQyZboHPcl5XKNzmi','2ya0zsfd','2024-05-21 12:43:14','2024-05-21 12:43:14'),(55,55,'barbara_y_renyaan@mail.com','$2y$12$NHA4rk3winceqV7f4RxgcOg866wBHI3.jBcD6Kvb8Vx3G6r8BCLZ6','-olcjyt6','2024-05-21 12:43:15','2024-05-21 12:43:15'),(56,56,'yakob_arwam@mail.com','$2y$12$4zyRb1UZR.3UU9MC.C1ySecql.7re3ixnUoNeuy3b3H0fK1aMb1a2','jvpztid0','2024-05-21 12:43:15','2024-05-21 12:43:15'),(57,57,'selpianus_siep@mail.com','$2y$12$Raa2kfhikP1TCANI6VbJ0O0iQ9qHoEnJvU5zmwexr3gU69Xs6710i','ixkvuma5','2024-05-21 12:43:16','2024-05-21 12:43:16'),(58,58,'yuliana_k_maniamboi@mail.com','$2y$12$BKPfUzbgLdKzH01sVkZA/.R/HW5gEsY82zqTeyq7eN.ohMRYIpC26','ndzr0r-2','2024-05-21 12:43:16','2024-05-21 12:43:16'),(59,59,'raymons_j@mail.com','$2y$12$Qapzam19PJiK.lecUAMiAO7p1k1W968Cog/lT0NwFkmYDlDHXRrl2','wy3mcgi2','2024-05-21 12:43:16','2024-05-21 12:43:16'),(60,60,'jofanton_dangeubun@mail.com','$2y$12$puoXn1rkGj37yTW0j681DuyOzc1Yp7.sqHfpZ/MGtyp41V26fb4Pq','hiya7aga','2024-05-21 12:43:17','2024-05-21 12:43:17'),(61,61,'yohanes_prasetyo@mail.com','$2y$12$i/pVnJ.8G9Sdbjrhr/3n4.t8efCo6ndyeIenGcaSoygp7U.PvFTWS','umkekgok','2024-05-21 12:43:17','2024-05-21 12:43:17'),(62,62,'fernando_rumatopen@mail.com','$2y$12$nJaZUc8XVHOcP0JODR.eieUoTOM8piFfirOQwTKpW//WFVjGlCMvG','xqv1a2v4','2024-05-21 12:43:17','2024-05-21 12:43:17'),(63,63,'johan_minggus_loly@mail.com','$2y$12$vn07D.0JGldlo2pq7gaZV.DZfpHv6Ddj2uPV9l58bPnaBnagvQsO.','vgxinsek','2024-05-21 12:43:18','2024-05-21 12:43:18'),(64,64,'yan_pieter_yaroseray@mail.com','$2y$12$LPRtV7BQTEb7pyMeYqBPE.ksJatjH4iUA7IWBZQQzcHjiU7jz7xQu','220lbuoh','2024-05-21 12:43:18','2024-05-21 12:43:18'),(65,65,'klaus_h@mail.com','$2y$12$ZlcTzNK6AgdkfVCI7JTFJO67OmhxmpcyjZ/D7cRCYNTgrRd4Yg/ri','mjyipuy0','2024-05-21 12:43:19','2024-05-21 12:43:19'),(66,66,'yustince_sapranim@mail.com','$2y$12$RYdk5caQl2U22RJWv/eLCu2HSW4Y0nu.Xw/f4KVF3HszPvKHQp.Nu','lty6hzd8','2024-05-21 12:43:19','2024-05-21 12:43:19'),(67,67,'hizkia_boseren@mail.com','$2y$12$OgdodQqZGlilzGh0Oc.D2ufW55gz0vEe4TurKUy0F3k9xfqsGdNIm','p3dspp6p','2024-05-21 12:43:20','2024-05-21 12:43:20'),(68,68,'yotam_waita@mail.com','$2y$12$I/FtLJc21p9X0/Ir85dhZ.LlybioXH1cfQBvVgRSSK.qlwZhA5nBy','24251so0','2024-05-21 12:43:20','2024-05-21 12:43:20'),(69,69,'jhoni_tabuni@mail.com','$2y$12$ml5WTASU95ThjwGvvD/AYekenwxlX9ygqieQmOvsAsF3weXqXyWR2','w-md9f4d','2024-05-21 12:43:20','2024-05-21 12:43:20'),(70,70,'apilius_homer@mail.com','$2y$12$c4w0l4jtOwNUYicfp3//7OpxvlqGOAQ.Weq.aESMZEM2L/5Yxqrmu','l3ocuyfn','2024-05-21 12:43:21','2024-05-21 12:43:21'),(71,71,'yosepus_yeheskel_rogi_sawaki@mail.com','$2y$12$9sfeIL80Q7eKt9Qs78wRrODi2GW7haEfh9fopZ5Z5AvkByVHOrkhe','o9nyzlwt','2024-05-21 12:43:21','2024-05-21 12:43:21'),(72,72,'marson_sedubun@mail.com','$2y$12$JJ5XiFlWDIAlLRtTy2B7G.WFvpItXjM2MLgraFZ7CxfbLIcORLMky','93ic2ao0','2024-05-21 12:43:22','2024-05-21 12:43:22'),(73,73,'frasino_edoway@mail.com','$2y$12$kzNOeC1QGzuwq.oiU9CtTOz35wSuJVfW5c.uiWJNis3Rlc0uwE83q','h6q8g8so','2024-05-21 12:43:22','2024-05-21 12:43:22'),(74,74,'maklon_silot_sesa@mail.com','$2y$12$0oMGznQaf9Zl3wBluiJM9us4QOoNGG6JioCUsJ.BxhITDxLjQcOs2','tzibi28n','2024-05-21 12:43:22','2024-05-21 12:43:22'),(75,75,'yoris_klaru@mail.com','$2y$12$XCpV/frhbFomrG5NC2OrdONHyQkj4wtKSanbi/JRWsSqnrRGPjD8m','6l08ceiw','2024-05-21 12:43:23','2024-05-21 12:43:23'),(76,76,'samuel_saworo@mail.com','$2y$12$Re5iun8TlHP16W.mH3NtI.5z5Fo7tnIwlGISS7lJ8nH9hITEjgfgm','766r75bv','2024-05-21 12:43:23','2024-05-21 12:43:23'),(77,77,'marten_solosa@mail.com','$2y$12$eT0bN71ufhF0/RW9q.f8/eyUJYJV.k5wza9rOVLKRwjROQsZSdcMe','av2ld5wr','2024-05-21 12:43:23','2024-05-21 12:43:23'),(78,78,'rodemptus_anugrah_m_balukh@mail.com','$2y$12$zAVi.cQVmuxZ8BBKC/1T3.cRfKPVNjMvMGgQFglsRTYYOb1oXRACK','3xd8nqca','2024-05-21 12:43:24','2024-05-21 12:43:24'),(79,79,'amison_giyai@mail.com','$2y$12$RCPnh0Q97JFf5XdxaytpTuiY94WGD0/AS5CTvvmRPeZ6nyX9.G1nq','_qup9l0m','2024-05-21 12:43:24','2024-05-21 12:43:24'),(80,80,'hendrik_p_yarangga@mail.com','$2y$12$9HdDnFi5qG5cXgUl5IOeR.nQGAVh0XauHNke0D.UQVd5PN5LO5iv2','v7jv_fyb','2024-05-21 12:43:25','2024-05-21 12:43:25'),(81,81,'hennice_g@mail.com','$2y$12$4xYJl2RGGKNriH1T55F6N.XSrXqKIVVBoAfZZtO.jqkQJmJqSmaiS','g5cu8kqa','2024-05-21 12:43:25','2024-05-21 12:43:25'),(82,82,'rexi_waery@mail.com','$2y$12$Ik.3h63tF0DwCl95DwPcmePgNPCjOJY49LrwCWqKZVOoMMCOCe/vO','syzb9pk7','2024-05-21 12:43:26','2024-05-21 12:43:26'),(83,83,'thimotia_yuturum@mail.com','$2y$12$JJW3w6.//3i4KoOdbo/V4uGaC3U2gUxVVFe33roN7NdO4AZkE/pYy','g6naz5f9','2024-05-21 12:43:26','2024-05-21 12:43:26'),(84,84,'derek_minsiob_mauri@mail.com','$2y$12$YmPPxTI1LJUB5B7Q/PACcedF68Pt6ZCbwRymTuuNMKvi.uQL1aAd.','3ytl-1gi','2024-05-21 12:43:26','2024-05-21 12:43:26'),(85,85,'christy_abel_e@mail.com','$2y$12$sLAMKYp.EdMEq33xQPtB7.jcLJe9d/.El9bTlJCJNenwwFqxMumS.','ggpbs2cv','2024-05-21 12:43:27','2024-05-21 12:43:27'),(86,86,'nimiron_yikwa@mail.com','$2y$12$dZ2YYSvww8CHHC0x1Mfdpeie1gx4KPX4xzrAXSXd65IQt3JLH3Juy','2s66be5s','2024-05-21 12:43:27','2024-05-21 12:43:27'),(87,87,'mirna_h_worengga@mail.com','$2y$12$FNX5H/UVTRkk4NRCsD.fKOMS7VJ4a7uIlY5t/e/Z2oWuv9PYEBOBO','2qzznzwv','2024-05-21 12:43:28','2024-05-21 12:43:28'),(88,88,'william_sebu@mail.com','$2y$12$gNMOIEkLEN0UuL1hqFzHg.dK7EFawN/7LdOz2Wn2tFDCkGbcGJyVy','dcm9iun7','2024-05-21 12:43:28','2024-05-21 12:43:28'),(89,89,'daniel_stnly_monim@mail.com','$2y$12$rzU7TF/Wsyjj3oOQwqy7..xtHdtdQ9.zvUn751RFaL1XBI9r.Tzgq','ooa47589','2024-05-21 12:43:29','2024-05-21 12:43:29'),(90,90,'paul_uropmabin@mail.com','$2y$12$FQCIupoF0gnVuUkMtzWkzOcouvk0BX1PpCnQonEr4lxxXdu63GkjK','zzgrmnk8','2024-05-21 12:43:29','2024-05-21 12:43:29'),(91,91,'manuwel_wenda@mail.com','$2y$12$s/lBgyjEtIlwJk86D/U0X.eDfwf/KsJNvcdJ7D.8dqKG96g94TOJ6','yn6z6pwb','2024-05-21 12:43:29','2024-05-21 12:43:29'),(92,92,'bill_clinton_doddy_aiwoy@mail.com','$2y$12$aSQCvLNC0W8GfbHKBknIHeJWA8E0RFTqEYKOcg5VllODGHx8ilR46','__5n-ipi','2024-05-21 12:43:30','2024-05-21 12:43:30'),(93,93,'darius_amenda@mail.com','$2y$12$sA9.fZmXciI.JtYuNffnM.3ZqLNeA4yEkc0aK/EaIHIdeEIR/rKta','dsjgynt3','2024-05-21 12:43:30','2024-05-21 12:43:30'),(94,94,'maryana_monim@mail.com','$2y$12$bdrn49xs74mii8j8PCAlbeCkAtnLiUpaaEiO/MizKAHNWp5Y1ynSq','zpso5bu3','2024-05-21 12:43:30','2024-05-21 12:43:30'),(95,95,'messy_y_melyana_sipatu@mail.com','$2y$12$RlSrL5o6hfDMarqIPMVG1e38sCFxQ4POz2GV8dLzBowPi.PWK/.Pu','fnq0icuy','2024-05-21 12:43:31','2024-05-21 12:43:31'),(96,96,'yosua_f_raunsai@mail.com','$2y$12$WtT48fihDp6HiNd1fW7Dye//hiyXnL38q/mdE8zgKkueRBJsXImOm','09qloo5g','2024-05-21 12:43:31','2024-05-21 12:43:31'),(97,97,'jendri_murafer@mail.com','$2y$12$3y.6k5PoREWKJwuwu31J9OwXCYxHRpuEYtcrwZLivuLN7gu6kWlmS','bee9gahm','2024-05-21 12:43:32','2024-05-21 12:43:32'),(98,98,'heru_sampari_rumbino@mail.com','$2y$12$7TO8lVTH6VnF1Ou5a3PLWe8RavwlSFzeOUF2d6CXzKBq0fKQkdSQG','v_lz9qa9','2024-05-21 12:43:32','2024-05-21 12:43:32'),(99,99,'robert_ufetaya@mail.com','$2y$12$Z8Kwjl269gh6Es68V.V47uwPquhixkc0/NRlIOkmvLm6FrfWk0eBK','y2hle9e6','2024-05-21 12:43:33','2024-05-21 12:43:33'),(100,100,'corolus_felix_sumor_a@mail.com','$2y$12$u2a9Q9wdeticeNck8G5Jz.iP.xlYaIJ0SHi./ogqXIVS/tBOp3rLC','rdo9k562','2024-05-21 12:43:33','2024-05-21 12:43:33'),(101,101,'pilipus_calvin_beay@mail.com','$2y$12$cyKbsfx5Hy6ZrmyWP/HnPOkWXxpmHcKrZOnswrb2PpjUCr9uQ5fR.','n-jcrt00','2024-05-21 12:43:33','2024-05-21 12:43:33'),(102,102,'yeltin_pebrina@mail.com','$2y$12$2B79bwNT98W6u2TudQT09.YHWerZnZOsEHi1Pcm/ytmDb9h0kr6F.','bes_lhia','2024-05-21 12:43:34','2024-05-21 12:43:34'),(103,103,'syaifulm_arzad@mail.com','$2y$12$GVUYG2ipsc3WRdTwGXJ6ZOzq0GiWrSJ7mcyrMrORSO2uhxJORBU1O','bz8fzk6k','2024-05-21 12:43:34','2024-05-21 12:43:34'),(104,104,'palma_wati_limbong@mail.com','$2y$12$ionqM4kp9vELjDc7Z77V8uzd3N78hbbBiIOJfjDengf93ezE6a/fy','rd-zux1u','2024-05-21 12:43:35','2024-05-21 12:43:35'),(105,105,'dwi_f_dacosta@mail.com','$2y$12$FwrvI34ClUDNJ0SvqaqexeYbpIffUTX/xWLVJfeAaME/DH7NjzQ9a','i9k6z8v0','2024-05-21 12:43:35','2024-05-21 12:43:35'),(106,106,'bryan_matulessy@mail.com','$2y$12$OjtsztHPnI307EeeLsl4P.6nfV6XclH5ctMcP6BUn07ddBnYqJLS2','r9lblr0r','2024-05-21 12:43:35','2024-05-21 12:43:35'),(107,107,'abdul_jalil@mail.com','$2y$12$93ZGs.QYTikzlegiFoNNo.cBupk/lwgV7i/IoSY0qHnJJOa8EI5vC','9c3j3ld_','2024-05-21 12:43:36','2024-05-21 12:43:36'),(108,108,'bastian_cawen@mail.com','$2y$12$SWyJ35zLVwdKY4LhPwPBruDTAmKteMlXY0YZ9pds.MYubzmN4t/5y','m2k0xhjw','2024-05-21 12:43:36','2024-05-21 12:43:36'),(109,109,'abraham_yawan@mail.com','$2y$12$nu9vp2HBY84hne59WhrGAuWows8QVCmaxAqPkFGrvl.ucwd0ViaG.','wz8fhciv','2024-05-21 12:43:37','2024-05-21 12:43:37'),(110,110,'lista_m@mail.com','$2y$12$G3O/AO.jEdhytuGyD6Jz3.D7mYBS/Qe6EruXXfJkWzVwzdK3DAlbG','2x5k3wc5','2024-05-21 12:43:37','2024-05-21 12:43:37'),(111,111,'jessika_titihalawa@mail.com','$2y$12$w29oALtVacqHSOYlwkypQOGuZCZeE7yyoBjRMHofWwnjDX6z8fdTq','yajh14jg','2024-05-21 12:43:38','2024-05-21 12:43:38'),(112,112,'eduard_ziggy_m@mail.com','$2y$12$vFVE5xh5.wGmjMv6dfdnp.Bdl3iph9YZ1BD0ANdayzQOPBwfhKrcG','e_do7c_l','2024-05-21 12:43:38','2024-05-21 12:43:38'),(113,113,'matias_mambraku@mail.com','$2y$12$YK6ajajpg7u9re5GbliBy.ECYdWW4lFkeQ6w.NLvLvGdSS/UbD/Fq','gf5hu_4y','2024-05-21 12:43:39','2024-05-21 12:43:39'),(114,114,'ferdinan_loy@mail.com','$2y$12$i2G0.MENIhza.D13wXu3EO8xGOFKmKV6yqw.0QmcM0BSTgePQg6bu','-905mxc1','2024-05-21 12:43:39','2024-05-21 12:43:39'),(115,115,'markopolo_kambu@mail.com','$2y$12$Me7PzpRf7P.oybO8jmFEv.aBx/Wo9yx0qmjf6/Osec5/2pzEWg4xO','z4744v4g','2024-05-21 12:43:40','2024-05-21 12:43:40'),(116,116,'hagar_sawor@mail.com','$2y$12$sZOEGn0FiyNRkd1On8A3uOgF3/8HCCvp7W7iIEnGop6iNdqhYAvGu','iwpybycq','2024-05-21 12:43:40','2024-05-21 12:43:40'),(117,117,'septinus_wetipo@mail.com','$2y$12$fg2eiEKqip6V3fhXl.6obuUp4sNEVfiTS8KZ0653j5I7n4Z/Fcg3C','w8z72ree','2024-05-21 12:43:40','2024-05-21 12:43:40'),(118,118,'septinus_manobi@mail.com','$2y$12$TV9fnNod7jMJ71sQToksCebRKfuR8IcEJQu6JZQ581D4/c0LZIF4O','a94qv25r','2024-05-21 12:43:41','2024-05-21 12:43:41'),(119,119,'yonatan_airei@mail.com','$2y$12$5KYoBMemR4VgKuhQqKakue0PuTgZZ7uuQaiWzxg9vqM8ev5ZLZgQm','y91l25ne','2024-05-21 12:43:41','2024-05-21 12:43:41'),(120,120,'roinaldo_wayei@mail.com','$2y$12$J9Lp5u9ic5aXYDwyEejtnO.chRYUHFQzyDZeNQHAxP5YYGuDcbiQu','s_mge2q2','2024-05-21 12:43:42','2024-05-21 12:43:42'),(121,121,'roni_kmur@mail.com','$2y$12$A85vaH2pNOeLq0eubbXtqOYWYgq31C.a06RMjsKj8jfO8A5yUeBN2','weioag2t','2024-05-21 12:43:42','2024-05-21 12:43:42'),(122,122,'selviana_jitmau@mail.com','$2y$12$0i2i0iFE0z8Parnbrra68OdVGFPZzJiWvovVGrd6qxY96Znek5nP2','dmy_yelg','2024-05-21 12:43:43','2024-05-21 12:43:43'),(123,123,'yohana_rina_bisai@mail.com','$2y$12$SbDxx9VQI0LCqghXxAsIdeoe.YcMfQMjHKcmsu02ZNeFDtjTZEaBq','g8z9ga0t','2024-05-21 12:43:43','2024-05-21 12:43:43'),(124,124,'ema_ppuanan_tekerop@mail.com','$2y$12$R/Q/5iMOBjA93z79w8Wiv.5aEIldLh3zPRAeGPH5Ndfgj.Vo8cPNa','z5seeni1','2024-05-21 12:43:44','2024-05-21 12:43:44'),(125,125,'neneng_alfatihan_satriani@mail.com','$2y$12$BQhrR6u/e8nL7zyL4UsGXusif96xOO2cmclta5DEY3WjsTNwWSoHO','h5vo3679','2024-05-21 12:43:44','2024-05-21 12:43:44'),(126,126,'daud_yesua_naa@mail.com','$2y$12$6Q66RWYPpy0zcMNb88uAoOOv6G.0LmDexjDNrI0Am.MfsCIQSnRSW','lpdp0nat','2024-05-21 12:43:45','2024-05-21 12:43:45'),(127,127,'marthina_henny_rumere@mail.com','$2y$12$3dVSWkhv7Og8SdlHbT1Nou5wKJq2j2c30nVqMuds0cIhjlSdHczRO','tc6_gvgh','2024-05-21 12:43:45','2024-05-21 12:43:45'),(128,128,'musa_nahabia@mail.com','$2y$12$qDNUXQeoIjn3VEuRLgs88.gH2L8cE6JGsMNL96dj1G5b9dSr0vtlq','stpprdbt','2024-05-21 12:43:45','2024-05-21 12:43:45'),(129,129,'farida_kosandalina_patai@mail.com','$2y$12$h6vLIZ6XS/mGs2MD0owaWe1W6IRkaZvNxi.n37EOtErdVWfZxAQHO','31bmnexc','2024-05-21 12:43:46','2024-05-21 12:43:46'),(130,130,'reynaldy_risat_lewarissa@mail.com','$2y$12$cxa7Ub5flTgap1G5V0bbAOs2uefU3FB/yAS/hf9VsX4G/qYO9VN5O','eqrne2se','2024-05-21 12:43:46','2024-05-21 12:43:46'),(131,131,'maurits_o_w_mayor@mail.com','$2y$12$/gyG08tMn0maPjjSBLY7RuQtIZiNn3/lmzDw6MxFmdQGEdg25JlBe','j9696c7d','2024-05-21 12:43:46','2024-05-21 12:43:46'),(132,132,'natalia_f_soway@mail.com','$2y$12$BxOV1icw8fuXYoLuPTGotu2YfSK3g.iZjnq4DO4OzLJnkXyR6xp4m','f3-_az91','2024-05-21 12:43:47','2024-05-21 12:43:47'),(133,133,'roberth_betuel_kafiar@mail.com','$2y$12$nuM2wAxFxfM.YJNzJeim5.kmDdn3KasT/k4isrl4BOheR4QWBwSEC','twmw_sdb','2024-05-21 12:43:47','2024-05-21 12:43:47'),(134,134,'dennis_rein_akwan@mail.com','$2y$12$2jRUnxHXow762J3Wv.2Y1e6yg3FbCtFKYFN4vB0fAngrMRA5NFD7e','o24x4vuy','2024-05-21 12:43:48','2024-05-21 12:43:48'),(135,135,'martinus_yeimo@mail.com','$2y$12$Hgtrk4bVWZubQGV1qHZdrOfgE2h8RLRjIPdkscpub3ajctjIgV.li','erwgye9d','2024-05-21 12:43:48','2024-05-21 12:43:48'),(136,136,'charles_fonataba@mail.com','$2y$12$UvKaKjX.Qj0YuKPW3sDBeuPjvBMCG9M0Kou4npg3pxRAI2nzgeEEa','mnlry74b','2024-05-21 12:43:48','2024-05-21 12:43:48'),(137,137,'simon_d_wally@mail.com','$2y$12$KcphR1g0W6uigJdfTNVaxOCADMUXGMPENIadV/XVT0NlWpS8NPYdm','74r66gq3','2024-05-21 12:43:49','2024-05-21 12:43:49'),(138,138,'ayungga_tabuni@mail.com','$2y$12$YPvt8iCaWDmjaFpBFzaw0u9EOrXPtSuII5Sp7jeE..Zec0Kd57oAe','xgadpp9h','2024-05-21 12:43:49','2024-05-21 12:43:49'),(139,139,'sampika_yulianus_atanay@mail.com','$2y$12$ZketmktIEVsYIm56.ctX/.k5GnxHFcYcXrK85tcqsfpxrGErZ.WdO','wn-sjw7l','2024-05-21 12:43:49','2024-05-21 12:43:49'),(140,140,'utdilu_mosip@mail.com','$2y$12$hnSQzXYB9dHegWGESnmWMeLFR8KTtPbHkRWGC0oQQsrNxKGpW5Eg6','bm7f6454','2024-05-21 12:43:50','2024-05-21 12:43:50'),(141,141,'thomas_d_maryar@mail.com','$2y$12$MeyA6rOXMtgG6XcG910iK.cDNtQWDY7LRPxiFlJpRbl1lO6q4EL/y','cheqtjkf','2024-05-21 12:43:50','2024-05-21 12:43:50'),(142,142,'lodowik_aweta@mail.com','$2y$12$ZAGxk.PWK1N.AA7vgN1KDO6e0CSNZdSAlO1jrjzYvC/OWmh7HldUW','v3wwu5qa','2024-05-21 12:43:50','2024-05-21 12:43:50'),(143,143,'marson_wetapo@mail.com','$2y$12$R5aASdBtgaQK6eMgh7B1weDiAKagNO1gC22ENFREOh3pzU5ETHoxW','llfry_lr','2024-05-21 12:43:51','2024-05-21 12:43:51'),(144,144,'soleman_fainsenem@mail.com','$2y$12$jgnpJZAkgJ5tlZhNJ9ZnP.PNt5xV38y4E3J.D63gbNI7W3HQUOfJK','zc9r8zcb','2024-05-21 12:43:51','2024-05-21 12:43:51'),(145,145,'natanil_way@mail.com','$2y$12$9b3PtNynSRSKseiY0Zr/iu1KGHrhgEYp0xIs9p5ICrKmAeQ2t6yYO','ti00594h','2024-05-21 12:43:52','2024-05-21 12:43:52'),(146,146,'yermias_tebay@mail.com','$2y$12$X84SA5O10WndXZIbx6Uhhes2yUm98q028r1YqZVrnBuIpCGa7eUWe','yzl26a10','2024-05-21 12:43:52','2024-05-21 12:43:52'),(147,147,'ledy_isabella_teurupun@mail.com','$2y$12$MP4wAJKpwJP5PULYNHpSb.JzvqfBHtFPqnfsAcz48AUEuv5Eby/E6','od1-c2ri','2024-05-21 12:43:52','2024-05-21 12:43:52'),(148,148,'samuel_risky_rijoly@mail.com','$2y$12$R.ve.QCIEXPHKi0W05i5Me9jnjStCcxNhEr5xiMw4If.tk8Ea17xG','vbgyx3bp','2024-05-21 12:43:53','2024-05-21 12:43:53'),(149,149,'trofinus_a@mail.com','$2y$12$/rOMkbtg5WyQ1ArbuRG1weCRIINcGlz191dAo7A9NMTks0nCYpcti','c1gj5531','2024-05-21 12:43:53','2024-05-21 12:43:53'),(150,150,'ferdu_kenelak@mail.com','$2y$12$ZNrHuOZsghFb.PDbiuNCfOrZpEskcjv/XAgHQ2xzSUYuXSqthg/Yu','kr_9ear8','2024-05-21 12:43:53','2024-05-21 12:43:53'),(151,151,'jemi_inggibal@mail.com','$2y$12$MPjGKkiRa6zb.n.pC/sjKORElBX9gLp6nxZzMcdoTykomb6.9mMLG','vwjz7vpb','2024-05-21 12:43:54','2024-05-21 12:43:54'),(152,152,'axel_pratama_rantetasak_jk@mail.com','$2y$12$T4qXkkcMf9wG50232uz8k.n020Bb6pW7WpFPjCE15CCD2zZAdu3WC','o4qajznb','2024-05-21 12:43:54','2024-05-21 12:43:54'),(153,153,'marsel_ricardo_waromi@mail.com','$2y$12$fH9i8//WU7DzKWoSx1QLcuoU2sXCPr4BNXkSlDysP77L2mLSC./t6','trjmrmcj','2024-05-21 12:43:55','2024-05-21 12:43:55'),(154,154,'menu_yikwa@mail.com','$2y$12$PtBWYEcOo6GWHBHrp/Onh.ONUkYwDA9HY0ckZJyvUTScLIkFnS4Ci','vq7pgn33','2024-05-21 12:43:55','2024-05-21 12:43:55'),(155,155,'alexander_k_takayetouw@mail.com','$2y$12$a2TyVlUfoGAww6.G//K0I.8G3s7m2YzKLDd.k6HUd73TY4x7bx.cO','y45phbci','2024-05-21 12:43:55','2024-05-21 12:43:55'),(156,156,'william_l_takayeitoew@mail.com','$2y$12$YajYUK7E7WriSNnhvXuTUODbJgtGpjv.g62hwDSj.PERt/Pau47xW','zmlf0yjl','2024-05-21 12:43:56','2024-05-21 12:43:56'),(157,157,'edison_bemey@mail.com','$2y$12$6/08Tulgr6TnZZtVBX3GBewq0R4VfLljpHIZrZxDaoh44qUc6cJmC','iwwqff8_','2024-05-21 12:43:56','2024-05-21 12:43:56'),(158,158,'yulius_wospakrik@mail.com','$2y$12$FONYQB4hYyPGtzNEHNYxMu6KFZbfU5CzFA.N/5NI17uARIDycdgMW','6uuaypgm','2024-05-21 12:43:56','2024-05-21 12:43:56'),(159,159,'antonius_tora@mail.com','$2y$12$nKQHXPdibXR7gHD.vz61/e.XBK/UIBhpRauPln6ZFjb7o4UdSodHq','vrm5nmyb','2024-05-21 12:43:57','2024-05-21 12:43:57'),(160,160,'yosma_uneputty@mail.com','$2y$12$JcwwHgD7z2EjDFtaMwyog.bJGW4GsFpABAsjuQwJyMkGPMeywfMNm','ttuuav_q','2024-05-21 12:43:57','2024-05-21 12:43:57'),(161,161,'lukas_g@mail.com','$2y$12$qU0cilYFcFDcIOcj9qAhm.63FvhlO8e6cvv4/q6DPowvQ2mrBnhRW','6a69s5qe','2024-05-21 12:43:58','2024-05-21 12:43:58'),(162,162,'leo_a_taboari@mail.com','$2y$12$PdHlfvA2afPcgVe.Q8sVH.Fw3nVIzWdWNknOrM7Hbrn16pnAxPKd2','ma5r5jsi','2024-05-21 12:43:58','2024-05-21 12:43:58'),(163,163,'allex_yandeday@mail.com','$2y$12$U1o/NK565TN74oK5BlRLG.SHWzsO4VLmCS9USm/ZCnHm5nW0M23Vy','vafpmck3','2024-05-21 12:43:58','2024-05-21 12:43:58'),(164,164,'songgar_madjar@mail.com','$2y$12$ycl/kxlGi/npObtr6U2c/ujk231koUKZJxmU7A/09Gw7FV43NO9Qe','0q2uspwe','2024-05-21 12:43:59','2024-05-21 12:43:59'),(165,165,'natalia_yeta_ansanai@mail.com','$2y$12$icPRSKz31FbtZcAN67NHNuyPOSFKCK590PE9y3x1b4NK4ZSkPL7Iu','bsclok1c','2024-05-21 12:43:59','2024-05-21 12:43:59'),(166,166,'melani_yapanani@mail.com','$2y$12$6mAuZxKWGthDsG.GwiRPOeAt1LZWjBUW6DBKnL9GX1ZfHrW3FzOM6','6zfr-hwl','2024-05-21 12:44:00','2024-05-21 12:44:00'),(167,167,'fiktor_herimbo_liok_kogoya@mail.com','$2y$12$U7yslTsuLi3osaf4QE59DemTrGjLOnJ/pfkihFf1iv0CeeB639Lr6','i9wlwl8f','2024-05-21 12:44:00','2024-05-21 12:44:00'),(168,168,'swingli_yeremia_apseray@mail.com','$2y$12$yGgfAmkIZ9LIArsvF.84YuEb0xQ41yVIHzv6fZsNl.9tBoFN8gNju','kwxsjthm','2024-05-21 12:44:00','2024-05-21 12:44:00'),(169,169,'maryones_waridjo@mail.com','$2y$12$oQxdKEtSVr9qoOD0sV81g.DXyR1NBT1agIHNYbWTqUi7lrthIs1GC','j3b8b7ir','2024-05-21 12:44:01','2024-05-21 12:44:01'),(170,170,'daniel_mayor@mail.com','$2y$12$yCE.EpV2wYUeEy4d/JAj/eVfReP0cjOgi9nx5dy2vkLWGLIv.8rne','-ad-9-mj','2024-05-21 12:44:01','2024-05-21 12:44:01'),(171,171,'viktor_nataniel_monim@mail.com','$2y$12$D8y/3QNeMbiiynWFxSPnXO7K3W8rI81iFwHlLY2x6kHFrLJyXX5eS','ml80w0o8','2024-05-21 12:44:02','2024-05-21 12:44:02'),(172,172,'thobias_jevens_nahakleky@mail.com','$2y$12$rxT6RubvY0HHx2YQmy6EM.JVB2lv4FbCphWhweNGIyOXMS7CEjFKC','32_4gakt','2024-05-21 12:44:02','2024-05-21 12:44:02'),(173,173,'memiri_rauru_rei_tane_hiowati@mail.com','$2y$12$JdqvuvmoTRbi71bZFv5nB.zonqBeC.BrlS9wDdisLiKONoLfSgbAS','-jz86__x','2024-05-21 12:44:02','2024-05-21 12:44:02'),(174,174,'andreas_leori_yakarmilena@mail.com','$2y$12$SbQXIJMLahXnbMQZ0u3GWuWV.Gl2tbNmxe.6Nt3cQJv3jT9ETT5hu','9rlvkmq9','2024-05-21 12:44:03','2024-05-21 12:44:03'),(175,175,'brianth_fester@mail.com','$2y$12$yfxr7rlHZgBYB.6KT9sPce.eBvsoxK6BYGXkgiiJCTFuBouSxRASO','5umdo69c','2024-05-21 12:44:03','2024-05-21 12:44:03'),(176,176,'oktovianus_alan_bwefar@mail.com','$2y$12$ALPFYA1vJmxpvknTC82EgeNfZtcsyTqCIbJSBSFF.XlI2lL0ZMNTe','876_5zr3','2024-05-21 12:44:04','2024-05-21 12:44:04'),(177,177,'alexander_nyata@mail.com','$2y$12$rSaxx8V.Vg.guppZlinaPOhuFIq5fBTEMusw3fQcDo9/m6QSwKZEK','_cpwdpwl','2024-05-21 12:44:04','2024-05-21 12:44:04'),(178,178,'joice_yanike_kabagaimu@mail.com','$2y$12$UQTUV5YO89UYtafX80IekeUj/dSYj9DyCSnah95XncbW9z010Pyse','g2q6d-lv','2024-05-21 12:44:04','2024-05-21 12:44:04'),(179,179,'folendam_yarangga@mail.com','$2y$12$MHnIo0kALXe7ey/a17vVGugQCoQ955o.yIK9sVsX1Qb0IN1TTJEAW','0q9vdai5','2024-05-21 12:44:05','2024-05-21 12:44:05'),(180,180,'meki_ayer@mail.com','$2y$12$MXcIa6lGJm5nJFU8nJNZMORoHMKECy4nut9gNKluXpyF2DGZaXIOy','k2xcqg85','2024-05-21 12:44:05','2024-05-21 12:44:05'),(181,181,'selfina_marina_u_kbarek@mail.com','$2y$12$/WykWIlInU6t/AVPsaHvpuYriLkGmxWKwmDltiSk4PN771jnLowpK','do9rguje','2024-05-21 12:44:05','2024-05-21 12:44:05'),(182,182,'cosstan_w_y_marerabuyan@mail.com','$2y$12$TReKn2t3Jxp2YYmfEK9l.OS2k55jhNFE7vUU6Yqz1gOG1vQbQn4a6','agmxqmbg','2024-05-21 12:44:06','2024-05-21 12:44:06'),(183,183,'yoga_erwanto@mail.com','$2y$12$XRkp5kg7EdgMoMVcwtGF0eYBuysaZ2GQ4yVMV.i4uNtU540kqeDi6','k0x1gn6x','2024-05-21 12:44:06','2024-05-21 12:44:06'),(184,184,'olif_suri_sauyas@mail.com','$2y$12$Hfg6ok10Mxl9jRok7OK8e.AnAdSr3ujCcXfT.G1KQ1ILMnfjHdMvG','s34c2ey7','2024-05-21 12:44:07','2024-05-21 12:44:07'),(185,185,'petrus_temkon@mail.com','$2y$12$nOZJs0gKHKnFfUTpSd9g6ODQr8YeWx8D3dXx75Yu6FppXGWTEvXrm','wsnhjkdl','2024-05-21 12:44:07','2024-05-21 12:44:07'),(186,186,'miseri_cordius_domini_kbarek@mail.com','$2y$12$6n71EVzVdojAkbOnF7.Ho..1Ds0h75syygE01hfh0X6BrW0S8kRPm','39fc3_iq','2024-05-21 12:44:08','2024-05-21 12:44:08'),(187,187,'gilbert_lebuan@mail.com','$2y$12$VhoL84j/FB0mO0oABlVOj.5LfbtwKNjOnVPlICk3RE2yObOovAmtC','4gc0dlq0','2024-05-21 12:44:08','2024-05-21 12:44:08'),(188,188,'maikel_kris_c_hamong@mail.com','$2y$12$jEPBx/zMUYNVlFxQ3ZchZeVCkUHJaPIZuu8l9IgVfB1FZMEgCLD1u','2lx5v0k3','2024-05-21 12:44:09','2024-05-21 12:44:09'),(189,189,'josua_ebenhaeser_sabgi_may@mail.com','$2y$12$KwkwzMob2FGa19vKyiYhQO3.VtlSrofGQdqNNWSNuWoek5R06NB66','x2qlr0h2','2024-05-21 12:44:09','2024-05-21 12:44:09'),(190,190,'clara_esterlina_anakotta@mail.com','$2y$12$oMzTrDAbN0hEcMqRQNSu4ObU.jSQBegN5zKawKq4N0E7NciSizLJy','xq6zcdcs','2024-05-21 12:44:10','2024-05-21 12:44:10'),(191,191,'jhon_paisei@mail.com','$2y$12$q0MrF/9fgo3eWBKoTvpjsODIDUUmy7KgnT1fqJuSaQ0M2Txbh1aZG','r46rn_e3','2024-05-21 12:44:10','2024-05-21 12:44:10'),(192,192,'kilmanus_legan_belang@mail.com','$2y$12$6DsCnF4LZ90VewTrus2xAOiW8FMWWEJBHy4YHzZuK665yXX.mlQrS','p-algnhl','2024-05-21 12:44:10','2024-05-21 12:44:10'),(193,193,'yunif_wirio@mail.com','$2y$12$oHOa1mn4x0EAU3hbIUbT0eKOF7bvM9VeIQi7NOiiu/Q/Ko5GSWOxC','s18f5l9u','2024-05-21 12:44:11','2024-05-21 12:44:11'),(194,194,'norius_mimin@mail.com','$2y$12$skrUQPcoY85w8U3IHAsRdurKl0kOipg1COibmwiZFhx4TvBZaNpH2','1iokgfxx','2024-05-21 12:44:11','2024-05-21 12:44:11'),(195,195,'yan_bawi@mail.com','$2y$12$.qrlUSdmGiG6m32Ewog2Rexg2PHcaMsu2MmVZ8NwhSXkpsYShy8Dy','88hcqy_2','2024-05-21 12:44:11','2024-05-21 12:44:11'),(196,196,'barnadus_yando@mail.com','$2y$12$9y4UQbcqa2VTBwf4nI8ACOFjwAVQWFVac/843du05Fh3KsrC9DVae','nd_ziwex','2024-05-21 12:44:12','2024-05-21 12:44:12'),(197,197,'fredy_ramandei@mail.com','$2y$12$ZgHCsI7eSO.4kvw7ccTo3.Gq8uJc8u818ueVsypPOyTHAcK5gPEte','-u5btaex','2024-05-21 12:44:12','2024-05-21 12:44:12'),(198,198,'paulinus_irsan@mail.com','$2y$12$bDGNN09DeAXJUmqw1HydNuBgViFkHUuCVrA44SnKJlob.36xtKx7G','1krcgf77','2024-05-21 12:44:12','2024-05-21 12:44:12'),(199,199,'egla_rumawak@mail.com','$2y$12$lhfU0XT8JWJS4i/7QgJ2BuZ4IEKH4KthnMDBz4/5YbfL5zYJ56dqu','5g65aw4-','2024-05-21 12:44:13','2024-05-21 12:44:13'),(200,200,'beatrix_menanti@mail.com','$2y$12$GoMKrL4lZHeBgIa6lcoEMu0iN.oyk1v6vmMy.eoXcxEjNwZo8uvKu','0ytvopkf','2024-05-21 12:44:13','2024-05-21 12:44:13');
/*!40000 ALTER TABLE `login_mhs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materi`
--

DROP TABLE IF EXISTS `materi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `jadwal_id` bigint unsigned NOT NULL,
  `judul_materi` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_materi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `materi_jadwal_id_foreign` (`jadwal_id`),
  CONSTRAINT `materi_jadwal_id_foreign` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materi`
--

LOCK TABLES `materi` WRITE;
/*!40000 ALTER TABLE `materi` DISABLE KEYS */;
INSERT INTO `materi` VALUES (1,193,'buku imk','storage/file_materi/1717056354.pdf',NULL,'2024-05-30 01:05:54','2024-05-30 01:05:54'),(2,183,'Silabus','storage/file_materi/1718782236.docx',NULL,'2024-06-19 00:30:36','2024-06-19 00:30:36'),(3,183,'Pertemuan Kedua','storage/file_materi/1718782284.docx',NULL,'2024-06-19 00:31:24','2024-06-19 00:31:24');
/*!40000 ALTER TABLE `materi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matkul`
--

DROP TABLE IF EXISTS `matkul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matkul` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodi_id` bigint unsigned NOT NULL,
  `kd_matkul` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nm_matkul` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sks` smallint NOT NULL,
  `semester` smallint NOT NULL,
  `singkat` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matkul_kd_matkul_unique` (`kd_matkul`),
  KEY `matkul_prodi_id_foreign` (`prodi_id`),
  CONSTRAINT `matkul_prodi_id_foreign` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matkul`
--

LOCK TABLES `matkul` WRITE;
/*!40000 ALTER TABLE `matkul` DISABLE KEYS */;
INSERT INTO `matkul` VALUES (1,1,'SI601','Tata Kelola SI/TI',3,6,'TatKel SI/TI','aktif','2024-05-21 12:40:54','2024-05-21 12:40:54'),(2,1,'SI402','Analisis dan Desain Perangkat Lunak',4,4,'ADPL','aktif','2024-05-21 12:40:54','2024-05-21 12:40:54'),(3,1,'SI829','Sistem Informasi Geografis',3,8,'SIG','aktif','2024-05-21 12:40:54','2024-05-21 12:40:54'),(4,1,'SI827','Pemrograman Multimedia',3,8,'Multimedia','aktif','2024-05-21 12:40:54','2024-05-21 12:40:54'),(5,1,'SI210','Arsitektur SI/TI Perusahaan',3,0,'Arsitektur','aktif','2024-05-21 12:40:54','2024-06-11 19:47:42'),(6,1,'SI607','Manajemen & Administrasi basis data',3,6,'MABD','aktif','2024-05-21 12:40:54','2024-05-21 12:40:54'),(7,1,'SI418','Pemrograman Visual II',3,4,'Visual II','aktif','2024-05-21 12:40:54','2024-05-21 12:40:54'),(8,1,'SI815','Kecerdasan Bisnis',3,8,'K.Bisnis','aktif','2024-05-21 12:40:54','2024-05-21 12:40:54'),(9,1,'SI733','ERP Finance',3,7,'ERP','aktif','2024-05-21 12:40:54','2024-05-21 12:40:54'),(10,1,'SI406','Keamanan Aset Informasi',3,4,'Keamanan','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(11,1,'SI623','Proyek Aplikasi SI',3,6,'Proyek Apk','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(12,1,'SI202','Statistik & Probabilitas',4,2,'Statistik','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(13,1,'SI726','Pemrograman Perangkat Bergerak',3,7,'PPB','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(14,1,'SI606','Riset Operasi',3,6,'RO','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(15,1,'SI404','Interaksi Manusia dan Komputer',3,4,'IMK','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(16,1,'SI209','Sistem Operasi',3,2,'SO','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(17,1,'SI621','Manajemen Rantai Suplay',3,6,'MRS','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(18,1,'SI204','Algoritma dan Struktur Data',4,2,'Algoritma','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(19,1,'SI405','Desain Basis Data',4,4,'DBD','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(20,1,'SI206','Bahasa Inggris II',2,2,'BE II','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(21,1,'OG103SI','Bahasa Indonesia',2,6,'BI','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(22,1,'SI622','Manajemen Resiko TI',3,6,'MRTI','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(23,1,'SI407','Pemrograman Berbasis Web',3,4,'WEB','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(24,1,'SI313','Analisa & Desain Proses Bisnis',3,3,'ADPB','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(25,1,'OG201SI','Kewarganegaraan',2,2,'KN','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(26,1,'SI826','Sistem Pendukung Keputusan',3,8,'SPK','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(27,1,'SI708','Metode Penelitian',2,7,'MetoPen','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(28,2,'OG206BI','Kewarganegaraan',2,2,'KN','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(29,2,'BI605','Biologi Molekuler',3,6,'B.Molekuler','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(30,2,'BI207','Fisika Dasar',3,2,'Fisika','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(31,2,'BI002','Iktiologi',2,8,'Iktiologi','aktif','2024-05-21 12:40:55','2024-05-21 12:40:55'),(32,2,'BI401','Sistematika Tumbuhan Tingkat Tinggi',3,4,'STTT','aktif','2024-05-21 12:40:56','2024-05-21 12:40:56'),(33,2,'BI205','Biologi Sel',3,2,'BioSel','aktif','2024-05-21 12:40:56','2024-05-21 12:40:56'),(34,2,'BI024','Biologi Mangrove',2,6,'BioMang','aktif','2024-05-21 12:40:56','2024-05-21 12:40:56'),(35,2,'Bi601','Sanitasi Lingkungan',2,6,'SL','aktif','2024-05-21 12:40:56','2024-05-21 12:40:56'),(36,2,'BI203','Kimia Organik',3,2,'KimOrg','aktif','2024-05-21 12:40:56','2024-05-21 12:40:56'),(37,2,'BI022','Limnologi',2,6,'Limnologi','aktif','2024-05-21 12:40:56','2024-05-21 12:40:56'),(38,2,'BI021','Biologi Laut',2,6,'BioLaut','aktif','2024-05-21 12:40:56','2024-05-21 12:40:56'),(39,2,'BI406','Biometri',2,4,'Biometri','aktif','2024-05-21 12:40:56','2024-05-21 12:40:56'),(41,2,'BI201','Pengetahuan Lingkungan',3,2,'Pengetahuan L','aktif','2024-05-21 12:40:56','2024-05-21 12:40:56'),(42,2,'BI402','Sistematika Vertebrata',3,4,'SisVerte','aktif','2024-05-21 12:40:56','2024-05-21 12:40:56'),(43,2,'BI008','Pencemaran Lingkungan',2,6,'Pencemaran L','aktif','2024-05-21 12:40:56','2024-05-21 12:40:56'),(44,2,'BI204','Mikrobiologi Dasar',3,2,'MikDas','aktif','2024-05-21 12:40:56','2024-05-21 12:40:56'),(45,2,'BI606','Penulisa Karya Ilmiah',2,6,'Karya Ilmiah','aktif','2024-05-21 12:40:56','2024-05-21 12:40:56'),(46,2,'BI404','Perkembangan Hewan',3,4,'Pkmbngn Hwn','aktif','2024-05-21 12:40:56','2024-05-21 12:40:56'),(47,2,'BI208','Biostatistik',3,2,'Biostatistik','aktif','2024-05-21 12:40:56','2024-05-21 12:40:56'),(48,2,'BI603','Metode Penelitian',3,6,'MetPen','aktif','2024-05-21 12:40:56','2024-05-21 12:40:56'),(49,2,'BI604','Manajemen Lingkungan',3,6,'Man.Ling','aktif','2024-05-21 12:40:56','2024-05-21 12:40:56'),(50,2,'BI405','Perkembangan Tumbuhan',3,4,'PerTum','aktif','2024-05-21 12:40:56','2024-05-21 12:40:56'),(51,2,'BI607','Inggris Biologi',3,6,'Eng Biologi','aktif','2024-05-21 12:40:56','2024-05-21 12:40:56'),(52,2,'BI407','Evolusi',2,4,'Evolusi','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(53,2,'BI403','Biosefty',2,4,'Biosefty','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(54,2,'BI015','Kultur Jaringan',2,8,'KulJar','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(55,2,'BI003','Bakteriologi',2,8,'Bakteriologi','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(56,2,'BI016','Fitohormon',2,6,'Fitohormon','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(57,2,'BI703','Rekayasa Genetika',3,8,'RekGen','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(58,2,'Abcd','Keanekaragaman Hayati',3,6,'Kean.Hayati','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(59,3,'OG2103TG','Kewarganegaraan',2,2,'KN','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(60,3,'OG6207TG','Metode Penelitian',2,6,'MetoPen','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(61,3,'OG2106TG','Bahasa Inggris I',3,2,'B Ing I','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(62,3,'TG6330','Geologi Eksplorasi',2,6,'GeoEkplo','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(63,3,'TG2452','Kimia Fisika + Praktikum',2,2,'KFP','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(64,3,'TG6332','Geologi Panas Bumi',2,6,'Geothermal','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(65,3,'TG4334','Ilmu Ukur Tanah + Praktikum',3,4,'IUT+P','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(66,3,'TG4455','Geohidrologi + Praktikum',3,4,'Geohidro','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(67,3,'TG6214','Geokimia Eksplorasi+Praktikum',3,6,'Geokimia Ekp','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(68,3,'OG2220','Matematika Dasar II',2,2,'MTK Dasar II','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(69,3,'TG4461','Geokomputasi + Praktikum',3,4,'Geokom','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(70,3,'TG2327','Fisika Dasar II + Praktikum',2,2,'Fisika II','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(71,3,'TG4208','Geotektonik',3,4,'GeoTek','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(72,3,'TG6333','Geologi Kelautan',2,6,'GeoKel','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(73,3,'TG2451','Geologi Sejarah',3,2,'GeoSeja','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(74,3,'TG6331','Geologi Migas',3,6,'GeoMigas','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(75,3,'TG4209','Geologi Penginderaan Jauh',3,4,'GeoPeng','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(76,3,'TG2453','Kristalografi & mineralogi + Praktikum',3,2,'Kristalog','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(77,3,'TG4450','Mineral Optik + Praktikum',3,4,'Min Opt','aktif','2024-05-21 12:40:57','2024-05-21 12:40:57'),(78,3,'TG2329','Geologi Fisik',2,2,'Geo Fisik','aktif','2024-05-21 12:40:58','2024-05-21 12:40:58'),(79,3,'TG4217','Petrografi',3,4,'Petro','aktif','2024-05-21 12:40:58','2024-05-21 12:40:58'),(80,3,'TG6221','Pemetaan Geologi',3,6,'Pemetaan Geo','aktif','2024-05-21 12:40:58','2024-05-21 12:40:58'),(83,1,'OG102SI','Pancasila',2,1,'PCL','aktif','2024-05-21 12:40:58','2024-05-21 12:40:58'),(84,1,'FS501','Ilmu Budaya Dasar',2,5,'IBD','aktif','2024-05-21 12:40:58','2024-05-21 12:40:58'),(85,1,'SI112','Organisasi & manajemen',3,1,'AM','aktif','2024-05-21 12:40:58','2024-05-21 12:40:58'),(86,1,'SI705','Technopreneuship',3,7,'TPS','aktif','2024-05-21 12:40:58','2024-05-21 12:40:58'),(87,1,'SI301','Dasar Pengembangan Perangkat Lunak',3,3,'DPPL','aktif','2024-05-21 12:40:58','2024-05-21 12:40:58'),(88,1,'OG101','Agama Kristen',2,1,'AK','aktif','2024-05-21 12:40:58','2024-05-21 12:40:58'),(89,1,'SI521','Manajemen Layanan TI',3,5,'ML TI','aktif','2024-05-21 12:40:58','2024-05-21 12:40:58'),(90,1,'SI303','kepemimpinan & Ketrampilan  Interpersonal',3,3,'KKP','aktif','2024-05-21 12:40:58','2024-05-21 12:40:58'),(91,1,'SI706','Etika Profesi',2,7,'EP','aktif','2024-05-21 12:40:58','2024-05-21 12:40:58'),(92,1,'SI725','Perencanaan Strategi SI/TI',3,7,'PS SI/TI','aktif','2024-05-21 12:40:58','2024-05-21 12:40:58'),(93,1,'SI101','Matematika Diskrit',3,1,'MD','aktif','2024-05-21 12:40:58','2024-05-21 12:40:58'),(94,1,'SI808','Penggalian Data  & Analitika Bisnis',3,6,'PDAB','aktif','2024-05-21 12:40:58','2024-05-21 12:40:58'),(95,1,'SI305','Pemrograman Berorientasi Obyek',3,3,'PBO','aktif','2024-05-21 12:40:58','2024-05-21 12:40:58'),(96,2,'OG102','Pancasila',2,1,'GSG','aktif','2024-05-21 12:40:58','2024-05-21 12:40:58'),(97,2,'BI001','Entomologi',2,7,'Entomologi','aktif','2024-05-21 12:40:58','2024-05-21 12:40:58'),(98,1,'SI514','E-Commerce',3,4,'EC','aktif','2024-05-21 12:40:58','2024-05-21 12:40:58'),(99,2,'BI307','Struktur Tumbuhan',3,3,'ST','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(100,1,'SI117','Sistem Dan Teknologi',3,3,'ST','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(101,1,'SI103','Dasar Pemrograman',3,1,'DP','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(102,1,'SI311','Desain & Manajemen Jaringan Komputer',3,3,'DMJK','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(103,1,'SI531','Perencanaan Sumber Daya Perusahaan',3,5,'PSDP','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(104,1,'SI304','Pengantar Basis Data',3,3,'PBD','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(105,1,'OG104','Bahasa Inggris I',3,1,'BI 1','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(106,1,'SI723','pengukuran kinerja TI',2,7,'PK TI','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(107,1,'SI520','Manajemen Proyek TI',3,5,'MP TI','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(108,1,'SI318','Pemrograman Visual I',3,3,'PV I','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(109,1,'SI503','Konstruksi  Dan Pengujian perangkat Lunak',3,5,'KPPL','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(110,3,'OG1102TG','Pancasila',2,1,'P.Sila','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(111,3,'OG1101TG','Agama Kristen',2,1,'Ag Kristen','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(112,3,'OG1105TG','Bahasa Indonesia',2,1,'Bhs Indo','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(113,3,'OG1445','Matematika Dasar I',3,1,'MTK I','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(114,3,'FS1446','Kimia Dasar + Praktikum',3,1,'Kimia Dsr','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(115,3,'FS1447','Fisika Dasar I + Praktikum',3,1,'Fsk Dsr I','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(116,3,'TG1448','Geologi Dasar',3,1,'Geo Dsr','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(117,3,'OG1104TG','Ilmu Budaya Dasar',2,1,'IBD','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(118,3,'TG3460','Geostatistik',3,3,'Geos','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(119,3,'TG3326','Matematika Geologi',2,3,'Mtk Geo','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(120,2,'FS104','Ilmu Budaya Dasar',2,1,'IBD','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(121,3,'TG3328','Kimia Analitik + Praktikum',3,3,'Kma Analitik','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(122,2,'BI017','Ekologi Hutan Tropis',2,1,'EHT','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(123,3,'TG3454','Petrologi + Praktikum',3,3,'Petrolg','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(124,3,'TG3457','Sedimentologi',3,3,'Sedimen','aktif','2024-05-21 12:40:59','2024-05-21 12:40:59'),(125,3,'TG3210','Geologi Struktur',3,3,'Geo Struktr','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(126,3,'TG3449','Geomorfologi',2,3,'Geomor','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(127,3,'TG3344','Bahasa Inggris II',2,3,'Bhs Ing 2','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(128,2,'BI301','Sistemantika Tumbuhan Tingkat Rendah',3,3,'STTT','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(129,3,'TG5213','Geologi Teknik + Praktikum',3,5,'Geo Teknik','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(130,3,'TG5458','Paleontologi & Mikropaleontologi + Praktikum',3,5,'Paleon & Mikro','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(131,3,'TG5212','Geofisika Eksplorasi + Praktikum',3,5,'Geofisik Eks','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(132,2,'BI503','Ekologi Tumbuhan',2,5,'Ektum','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(133,2,'BI304','Genetika',3,3,'Gen','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(134,3,'TG5456','Vulkanologi',2,5,'Vulkano','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(135,2,'BI504','Ekologi Hewan',1,1,'EH','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(136,3,'TG5211','Prinsip Statigrafi',3,5,'Prinsip Statig','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(137,2,'OG103','Bahasa Indonesia',2,1,'BI','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(138,3,'TG5459','Metode Pemetaan Geologi + Praktikum',3,5,'Mtd Pemet Geo','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(139,3,'TG5215','Geologi Ekonomi',3,5,'Geo Eko','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(140,2,'BI505','Fisiologi Tumbuhan',3,5,'Fistum','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(141,3,'TG5216','Geologi Batubara + Praktikum',3,5,'Geo Batubr','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(142,2,'BI108','Matematika',3,1,'MTK','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(143,3,'TG6218','Geoteknik + Praktikum',3,6,'Geotek','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(144,2,'BI305','Biokimia',3,3,'BioKim','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(145,2,'BI501','Kewirausahaan',3,5,'Kewirausahan','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(146,2,'BI106','Biologi Umum',3,1,'BU','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(147,2,'BI023','Planktonologi',2,7,'Plank','aktif','2024-05-21 12:41:00','2024-05-21 12:41:00'),(148,2,'BI107','Kimia Dasar',3,1,'KD','aktif','2024-05-21 12:41:01','2024-05-21 12:41:01'),(149,3,'TG7222','Geologi Lingkungan',3,7,'Geo Ling','aktif','2024-05-21 12:41:01','2024-05-21 12:41:01'),(150,2,'BI027','Entografi Papua',2,7,'EP','aktif','2024-05-21 12:41:01','2024-05-21 12:41:01'),(151,3,'TG7335','Geologi Ekonomi Lanjutan',2,7,'Geo Eko Lanjtn','aktif','2024-05-21 12:41:01','2024-05-21 12:41:01'),(152,3,'TG7336','Eksplorasi Endapan Mineral',2,7,'Eks Edp Min','aktif','2024-05-21 12:41:01','2024-05-21 12:41:01'),(153,3,'TG7337','Pengolahan Citra Geologi',2,7,'Peng Citra Geo','aktif','2024-05-21 12:41:01','2024-05-21 12:41:01'),(154,2,'BI306','Struktur Hewan',3,3,'SH','aktif','2024-05-21 12:41:01','2024-05-21 12:41:01'),(155,3,'TG7219','Manajement SDM & Wirausaha',2,7,'Man. SDM','aktif','2024-05-21 12:41:01','2024-05-21 12:41:01'),(156,2,'BI502','Fisiologi Mikrobia',3,5,'FM','aktif','2024-05-21 12:41:01','2024-05-21 12:41:01'),(157,3,'TG7338','Geokimia Migas',2,7,'Geo Migas','aktif','2024-05-21 12:41:01','2024-05-21 12:41:01'),(158,2,'BI309','Sistematika Invertebrata',3,3,'SI','aktif','2024-05-21 12:41:01','2024-05-21 12:41:01'),(159,3,'TG7339','Teknologi Batubara',2,7,'Tekno Batubara','aktif','2024-05-21 12:41:01','2024-05-21 12:41:01'),(160,2,'BI507','Fisiologi Hewan',3,3,'FH','aktif','2024-05-21 12:41:01','2024-05-21 12:41:01'),(161,3,'TG7340','Geokimia Panas Bumi',2,7,'GPB','aktif','2024-05-21 12:41:01','2024-05-21 12:41:01'),(162,3,'TG7341','Hidrogeologi',2,7,'Hidrogeo','aktif','2024-05-21 12:41:01','2024-05-21 12:41:01'),(163,2,'BI030','Biokimia Bahan Alam',2,7,'BBA','aktif','2024-05-21 12:41:01','2024-05-21 12:41:01'),(164,3,'TG7342','Mitigasi Bencana Geologi',2,7,'Mit Bencana Ge','aktif','2024-05-21 12:41:01','2024-05-21 12:41:01'),(165,2,'OG105','Bahasa Inggris 1',3,1,'BI','aktif','2024-05-21 12:41:01','2024-05-21 12:41:01'),(166,2,'BI308','Aplikasi Komputer',3,1,'Aplikom','aktif','2024-05-21 12:41:01','2024-05-21 12:41:01'),(168,3,'TG7343','Geologi Lingkungan & Geologi Pengembangan Wilayah',2,7,'G.Ling&Peng Wi','aktif','2024-05-21 12:41:02','2024-05-21 12:41:02'),(169,2,'OG101BI','Agama Kristen',2,1,'AK','aktif','2024-05-21 12:41:02','2024-05-21 12:41:02'),(170,2,'BI026','Pengendali Hayati',2,7,'PH','aktif','2024-05-21 12:41:02','2024-05-21 12:41:02'),(171,2,'BI013','Rancangan Percobaan',2,7,'Raper','aktif','2024-05-21 12:41:02','2024-05-21 12:41:02'),(172,2,'BI010','Manajemen Sampah Perkotaan',2,4,'MSP','aktif','2024-05-21 12:41:02','2024-05-21 12:41:02'),(173,2,'BI011','Etnobotani',2,6,'Etno','aktif','2024-05-21 12:41:02','2024-05-21 12:41:02'),(174,1,'SI-8 TI','Sistem Pakar',3,8,'Sispak','aktif','2024-05-21 12:41:02','2024-05-21 12:41:02'),(175,1,'OG802SI','Tugas Akhir',6,8,'TA','aktif','2024-05-21 12:41:02','2024-05-21 12:41:02'),(176,1,'OG701SI','Kerja Praktek',2,7,'KP','aktif','2024-05-21 12:41:02','2024-05-21 12:41:02'),(177,1,'SI709','Seminar Proposal',2,7,'Sempro','aktif','2024-05-21 12:41:02','2024-05-21 12:41:02'),(178,2,'OG701BI','Praktek Kerja Lapangan',2,7,'PKL','aktif','2024-05-21 12:41:02','2024-05-21 12:41:02');
/*!40000 ALTER TABLE `matkul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mhs`
--

DROP TABLE IF EXISTS `mhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mhs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodi_id` bigint unsigned NOT NULL,
  `NPM` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nm_mhs` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenkel` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thn_angkatan` year NOT NULL,
  `status` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mhs_prodi_id_foreign` (`prodi_id`),
  CONSTRAINT `mhs_prodi_id_foreign` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mhs`
--

LOCK TABLES `mhs` WRITE;
/*!40000 ALTER TABLE `mhs` DISABLE KEYS */;
INSERT INTO `mhs` VALUES (1,1,'0004','Abillyo S. Mampioper','Laki-laki',2014,'aktif','2024-05-21 12:42:52','2024-05-21 12:42:52'),(2,1,'0008','Rikardus Badjim','Laki-laki',2014,'aktif','2024-05-21 12:42:53','2024-05-21 12:42:53'),(3,1,'0016','Osea Yumai','Laki-laki',2014,'aktif','2024-05-21 12:42:53','2024-05-21 12:42:53'),(4,1,'0018','Zadrak Baltazar Wabia','Laki-laki',2014,'aktif','2024-05-21 12:42:54','2024-05-21 12:42:54'),(5,1,'0024','Daniel E. Mayor','Laki-laki',2014,'aktif','2024-05-21 12:42:54','2024-05-21 12:42:54'),(6,1,'0027','Rexiy Kbarek','Laki-laki',2014,'aktif','2024-05-21 12:42:54','2024-05-21 12:42:54'),(7,1,'0033','Pilipus Rapami','Laki-laki',2014,'aktif','2024-05-21 12:42:55','2024-05-21 12:42:55'),(8,1,'0035','Ankian Bunai','Laki-laki',2014,'aktif','2024-05-21 12:42:55','2024-05-21 12:42:55'),(9,1,'0037','Lince Irene Rawar','Perempuan',2014,'aktif','2024-05-21 12:42:55','2024-05-21 12:42:55'),(10,1,'0038','Gerson G.A  Yangmen','Laki-laki',2014,'aktif','2024-05-21 12:42:56','2024-05-21 12:42:56'),(11,1,'0040','Marcus Nikolas Yarru','Laki-laki',2014,'aktif','2024-05-21 12:42:56','2024-05-21 12:42:56'),(12,1,'0048','Tobi C.A Yerisetouw','Laki-laki',2014,'aktif','2024-05-21 12:42:57','2024-05-21 12:42:57'),(13,1,'0058','Takius Wanena','Laki-laki',2014,'aktif','2024-05-21 12:42:57','2024-05-21 12:42:57'),(14,1,'0063','Elvira Marlina Maredret','Perempuan',2014,'aktif','2024-05-21 12:42:57','2024-05-21 12:42:57'),(15,1,'0068','Bartomius M. Marian','Laki-laki',2014,'aktif','2024-05-21 12:42:58','2024-05-21 12:42:58'),(16,1,'0069','Marsel Moga','Laki-laki',2014,'aktif','2024-05-21 12:42:58','2024-05-21 12:42:58'),(17,1,'0075','Natalis H.J ERRO','Laki-laki',2014,'aktif','2024-05-21 12:42:58','2024-05-21 12:42:58'),(18,1,'0077','Lince K Ramandei','Perempuan',2014,'aktif','2024-05-21 12:42:59','2024-05-21 12:42:59'),(19,1,'0078','Ribka A. Ramandei','Perempuan',2014,'aktif','2024-05-21 12:42:59','2024-05-21 12:42:59'),(20,1,'0001','Lukas Batyakaru','Laki-laki',2015,'aktif','2024-05-21 12:43:00','2024-05-21 12:43:00'),(21,1,'0005','Marthen Felex abi','Laki-laki',2015,'aktif','2024-05-21 12:43:00','2024-05-21 12:43:00'),(22,1,'0010','Omdes Tuama Sihombing','Laki-laki',2015,'aktif','2024-05-21 12:43:01','2024-05-21 12:43:01'),(23,1,'0012','Zeth Wamafma','Laki-laki',2015,'aktif','2024-05-21 12:43:01','2024-05-21 12:43:01'),(24,1,'0021','Piter Gununi','Laki-laki',2015,'aktif','2024-05-21 12:43:02','2024-05-21 12:43:02'),(25,1,'0031','Stenly Y.M Paisei','Laki-laki',2015,'aktif','2024-05-21 12:43:02','2024-05-21 12:43:02'),(26,1,'0033','Yahya Simbiak','Laki-laki',2015,'aktif','2024-05-21 12:43:02','2024-05-21 12:43:02'),(27,1,'0035','Febi Slamat Marunduri','Perempuan',2015,'aktif','2024-05-21 12:43:03','2024-05-21 12:43:03'),(28,1,'0036','Hana Beay','Perempuan',2015,'aktif','2024-05-21 12:43:03','2024-05-21 12:43:03'),(29,1,'0045','Calvin A.G Tanggkulung','Laki-laki',2015,'aktif','2024-05-21 12:43:04','2024-05-21 12:43:04'),(30,1,'0048','Ariwibowo','Laki-laki',2015,'aktif','2024-05-21 12:43:04','2024-05-21 12:43:04'),(31,1,'0056','Nixon Amunauw','Laki-laki',2015,'aktif','2024-05-21 12:43:05','2024-05-21 12:43:05'),(32,1,'0059','Alvarido Boy Peres  Rumbiak','Laki-laki',2015,'aktif','2024-05-21 12:43:05','2024-05-21 12:43:05'),(33,1,'0062','Sonny A. Bukorpioper','Laki-laki',2015,'aktif','2024-05-21 12:43:05','2024-05-21 12:43:05'),(34,1,'0063','Yufuway Agustinus M. Indey','Laki-laki',2015,'aktif','2024-05-21 12:43:06','2024-05-21 12:43:06'),(35,1,'0064','Marsella M. Rumbiak','Perempuan',2015,'aktif','2024-05-21 12:43:07','2024-05-21 12:43:07'),(36,1,'0065','Yosabet Mirin','Perempuan',2015,'aktif','2024-05-21 12:43:07','2024-05-21 12:43:07'),(37,1,'0081','Umi Fanda F. Mbaubedari','Perempuan',2015,'aktif','2024-05-21 12:43:07','2024-05-21 12:43:07'),(38,1,'0083','Lukas Nerotuminelena','Laki-laki',2015,'aktif','2024-05-21 12:43:08','2024-05-21 12:43:08'),(39,1,'0003','Irlando Sokoy','Laki-laki',2016,'aktif','2024-05-21 12:43:08','2024-05-21 12:43:08'),(40,1,'0004','Elisa N.O Rumkorem','Laki-laki',2016,'aktif','2024-05-21 12:43:09','2024-05-21 12:43:09'),(41,1,'0005','Luis Sander Wona','Laki-laki',2016,'aktif','2024-05-21 12:43:09','2024-05-21 12:43:09'),(42,1,'0007','Muhamad Andika Rahmat','Laki-laki',2016,'aktif','2024-05-21 12:43:09','2024-05-21 12:43:09'),(43,1,'0011','Konstantina Fantri Wandamani','Perempuan',2016,'aktif','2024-05-21 12:43:10','2024-05-21 12:43:10'),(44,1,'0012','Krisolit Y Semboari','Perempuan',2016,'aktif','2024-05-21 12:43:10','2024-05-21 12:43:10'),(45,1,'0013','Boas Menand Y Riburi','Laki-laki',2016,'aktif','2024-05-21 12:43:10','2024-05-21 12:43:10'),(46,1,'0014','Robert Wafom','Laki-laki',2016,'aktif','2024-05-21 12:43:11','2024-05-21 12:43:11'),(47,1,'0017','Tinweng Hiktaop','Laki-laki',2016,'aktif','2024-05-21 12:43:11','2024-05-21 12:43:11'),(48,1,'0019','Metodius Uropmabin','Laki-laki',2016,'aktif','2024-05-21 12:43:12','2024-05-21 12:43:12'),(49,1,'0021','Wihelmus I. Manahara','Laki-laki',2016,'aktif','2024-05-21 12:43:12','2024-05-21 12:43:12'),(50,1,'0022','Hertoq A Marandof','Laki-laki',2016,'aktif','2024-05-21 12:43:13','2024-05-21 12:43:13'),(51,1,'0024','Novita Karlenci Indey','Perempuan',2016,'aktif','2024-05-21 12:43:13','2024-05-21 12:43:13'),(52,1,'0027','Nelson Baura','Laki-laki',2016,'aktif','2024-05-21 12:43:13','2024-05-21 12:43:13'),(53,1,'0030','Agustina Serewi','Perempuan',2016,'aktif','2024-05-21 12:43:14','2024-05-21 12:43:14'),(54,1,'0031','Eva Sarawan','Perempuan',2016,'aktif','2024-05-21 12:43:14','2024-05-21 12:43:14'),(55,1,'0032','Barbara Y Renyaan','Perempuan',2016,'aktif','2024-05-21 12:43:14','2024-05-21 12:43:14'),(56,1,'0035','Yakob Arwam','Laki-laki',2016,'aktif','2024-05-21 12:43:15','2024-05-21 12:43:15'),(57,1,'0038','Selpianus Siep','Laki-laki',2016,'aktif','2024-05-21 12:43:15','2024-05-21 12:43:15'),(58,1,'0040','Yuliana K Maniamboi','Perempuan',2016,'aktif','2024-05-21 12:43:16','2024-05-21 12:43:16'),(59,1,'0042','Raymons  J. Masbattubun','Laki-laki',2016,'aktif','2024-05-21 12:43:16','2024-05-21 12:43:16'),(60,1,'0043','Jofanton Dangeubun','Laki-laki',2016,'aktif','2024-05-21 12:43:16','2024-05-21 12:43:16'),(61,1,'0046','Yohanes Prasetyo','Laki-laki',2016,'aktif','2024-05-21 12:43:17','2024-05-21 12:43:17'),(62,1,'0052','Fernando Rumatopen','Laki-laki',2016,'aktif','2024-05-21 12:43:17','2024-05-21 12:43:17'),(63,1,'0055','Johan Minggus Loly','Laki-laki',2016,'aktif','2024-05-21 12:43:18','2024-05-21 12:43:18'),(64,1,'0056','Yan Pieter Yaroseray','Laki-laki',2016,'aktif','2024-05-21 12:43:18','2024-05-21 12:43:18'),(65,1,'0057','Klaus H.R Modouw','Laki-laki',2016,'aktif','2024-05-21 12:43:18','2024-05-21 12:43:18'),(66,1,'0060','Yustince Sapranim','Perempuan',2016,'aktif','2024-05-21 12:43:19','2024-05-21 12:43:19'),(67,1,'0064','Hizkia Boseren','Laki-laki',2016,'aktif','2024-05-21 12:43:19','2024-05-21 12:43:19'),(68,1,'1005','Yotam Waita','Laki-laki',2016,'aktif','2024-05-21 12:43:20','2024-05-21 12:43:20'),(69,1,'1007','Jhoni Tabuni','Laki-laki',2016,'aktif','2024-05-21 12:43:20','2024-05-21 12:43:20'),(70,1,'0004','Apilius Homer','Laki-laki',2017,'aktif','2024-05-21 12:43:20','2024-05-21 12:43:20'),(71,1,'0005','Yosepus Yeheskel Rogi Sawaki','Laki-laki',2017,'aktif','2024-05-21 12:43:21','2024-05-21 12:43:21'),(72,1,'0006','Marson Sedubun','Laki-laki',2017,'aktif','2024-05-21 12:43:21','2024-05-21 12:43:21'),(73,1,'0007','Frasino Edoway','Laki-laki',2017,'aktif','2024-05-21 12:43:22','2024-05-21 12:43:22'),(74,1,'0009','Maklon Silot Sesa','Laki-laki',2017,'aktif','2024-05-21 12:43:22','2024-05-21 12:43:22'),(75,1,'0012','Yoris Klaru','Laki-laki',2017,'aktif','2024-05-21 12:43:22','2024-05-21 12:43:22'),(76,1,'0013','Samuel Saworo','Laki-laki',2017,'aktif','2024-05-21 12:43:23','2024-05-21 12:43:23'),(77,1,'0017','Marten Solosa','Laki-laki',2017,'aktif','2024-05-21 12:43:23','2024-05-21 12:43:23'),(78,1,'0018','Rodemptus Anugrah M Balukh','Laki-laki',2017,'aktif','2024-05-21 12:43:23','2024-05-21 12:43:23'),(79,1,'0019','Amison Giyai','Laki-laki',2017,'aktif','2024-05-21 12:43:24','2024-05-21 12:43:24'),(80,1,'0021','Hendrik P Yarangga','Laki-laki',2017,'aktif','2024-05-21 12:43:24','2024-05-21 12:43:24'),(81,1,'0024','Hennice G.M Borotian','Perempuan',2017,'aktif','2024-05-21 12:43:25','2024-05-21 12:43:25'),(82,1,'0027','Rexi Waery','Laki-laki',2017,'aktif','2024-05-21 12:43:25','2024-05-21 12:43:25'),(83,1,'0029','Thimotia Yuturum','Perempuan',2017,'aktif','2024-05-21 12:43:26','2024-05-21 12:43:26'),(84,1,'0030','Derek Minsiob Mauri','Laki-laki',2017,'aktif','2024-05-21 12:43:26','2024-05-21 12:43:26'),(85,1,'0035','Christy Abel  E. Aronggear','Laki-laki',2017,'aktif','2024-05-21 12:43:27','2024-05-21 12:43:27'),(86,1,'0036','Nimiron Yikwa','Laki-laki',2017,'aktif','2024-05-21 12:43:27','2024-05-21 12:43:27'),(87,1,'0038','Mirna H Worengga','Perempuan',2017,'aktif','2024-05-21 12:43:27','2024-05-21 12:43:27'),(88,1,'0041','William Sebu','Laki-laki',2017,'aktif','2024-05-21 12:43:28','2024-05-21 12:43:28'),(89,1,'0042','Daniel Stnly Monim','Laki-laki',2017,'aktif','2024-05-21 12:43:28','2024-05-21 12:43:28'),(90,1,'0043','Paul Uropmabin','Laki-laki',2017,'aktif','2024-05-21 12:43:29','2024-05-21 12:43:29'),(91,1,'0049','Manuwel Wenda','Laki-laki',2017,'aktif','2024-05-21 12:43:29','2024-05-21 12:43:29'),(92,1,'0050','Bill Clinton Doddy Aiwoy','Laki-laki',2017,'aktif','2024-05-21 12:43:29','2024-05-21 12:43:29'),(93,1,'0051','Darius Amenda','Laki-laki',2017,'aktif','2024-05-21 12:43:30','2024-05-21 12:43:30'),(94,1,'0052','Maryana Monim','Perempuan',2017,'aktif','2024-05-21 12:43:30','2024-05-21 12:43:30'),(95,1,'0053','Messy Y Melyana Sipatu','Perempuan',2017,'aktif','2024-05-21 12:43:30','2024-05-21 12:43:30'),(96,1,'0055','Yosua F Raunsai','Laki-laki',2017,'aktif','2024-05-21 12:43:31','2024-05-21 12:43:31'),(97,1,'0058','Jendri Murafer','Laki-laki',2017,'aktif','2024-05-21 12:43:31','2024-05-21 12:43:31'),(98,1,'0060','Heru Sampari Rumbino','Laki-laki',2017,'aktif','2024-05-21 12:43:32','2024-05-21 12:43:32'),(99,1,'0062','Robert Ufetaya','Laki-laki',2017,'aktif','2024-05-21 12:43:32','2024-05-21 12:43:32'),(100,1,'0006','Corolus Felix Sumor A. Kafiar','Laki-laki',2018,'aktif','2024-05-21 12:43:33','2024-05-21 12:43:33'),(101,1,'0008','Pilipus Calvin Beay','Laki-laki',2018,'aktif','2024-05-21 12:43:33','2024-05-21 12:43:33'),(102,1,'0009','Yeltin Pebrina','Perempuan',2018,'aktif','2024-05-21 12:43:33','2024-05-21 12:43:33'),(103,1,'0010','Syaifulm Arzad','Laki-laki',2018,'aktif','2024-05-21 12:43:34','2024-05-21 12:43:34'),(104,1,'0011','Palma Wati Limbong','Perempuan',2018,'aktif','2024-05-21 12:43:34','2024-05-21 12:43:34'),(105,1,'0013','Dwi F Dacosta','Perempuan',2018,'aktif','2024-05-21 12:43:35','2024-05-21 12:43:35'),(106,1,'0015','Bryan Matulessy','Laki-laki',2018,'aktif','2024-05-21 12:43:35','2024-05-21 12:43:35'),(107,1,'0016','Abdul Jalil','Laki-laki',2018,'aktif','2024-05-21 12:43:35','2024-05-21 12:43:35'),(108,1,'0017','Bastian Cawen','Laki-laki',2018,'aktif','2024-05-21 12:43:36','2024-05-21 12:43:36'),(109,1,'0019','Abraham Yawan','Laki-laki',2018,'aktif','2024-05-21 12:43:36','2024-05-21 12:43:36'),(110,1,'0020','Lista M. Mandibondibo','Perempuan',2018,'aktif','2024-05-21 12:43:37','2024-05-21 12:43:37'),(111,1,'0022','Jessika Titihalawa','Perempuan',2018,'aktif','2024-05-21 12:43:37','2024-05-21 12:43:37'),(112,1,'0025','Eduard Ziggy M. Affar','Laki-laki',2018,'aktif','2024-05-21 12:43:38','2024-05-21 12:43:38'),(113,1,'0027','Matias Mambraku','Laki-laki',2018,'aktif','2024-05-21 12:43:38','2024-05-21 12:43:38'),(114,1,'0028','Ferdinan Loy','Laki-laki',2018,'aktif','2024-05-21 12:43:39','2024-05-21 12:43:39'),(115,1,'0031','Markopolo Kambu','Laki-laki',2018,'aktif','2024-05-21 12:43:39','2024-05-21 12:43:39'),(116,1,'0032','Hagar Sawor','Perempuan',2018,'aktif','2024-05-21 12:43:40','2024-05-21 12:43:40'),(117,1,'0033','Septinus Wetipo','Laki-laki',2018,'aktif','2024-05-21 12:43:40','2024-05-21 12:43:40'),(118,1,'0035','Septinus Manobi','Laki-laki',2018,'aktif','2024-05-21 12:43:40','2024-05-21 12:43:40'),(119,1,'0001','Yonatan Airei','Laki-laki',2019,'aktif','2024-05-21 12:43:41','2024-05-21 12:43:41'),(120,1,'0002','Roinaldo Wayei','Laki-laki',2019,'aktif','2024-05-21 12:43:41','2024-05-21 12:43:41'),(121,1,'0003','Roni Kmur','Laki-laki',2019,'aktif','2024-05-21 12:43:42','2024-05-21 12:43:42'),(122,1,'0004','Selviana Jitmau','Perempuan',2019,'aktif','2024-05-21 12:43:42','2024-05-21 12:43:42'),(123,1,'0005','Yohana Rina Bisai','Perempuan',2019,'aktif','2024-05-21 12:43:43','2024-05-21 12:43:43'),(124,1,'0006','Ema Ppuanan Tekerop','Perempuan',2019,'aktif','2024-05-21 12:43:43','2024-05-21 12:43:43'),(125,1,'0007','Neneng  Alfatihan Satriani','Perempuan',2019,'aktif','2024-05-21 12:43:44','2024-05-21 12:43:44'),(126,1,'0008','Daud Yesua Naa','Laki-laki',2019,'aktif','2024-05-21 12:43:44','2024-05-21 12:43:44'),(127,1,'0009','Marthina  Henny Rumere','Perempuan',2019,'aktif','2024-05-21 12:43:45','2024-05-21 12:43:45'),(128,1,'0010','Musa Nahabia','Laki-laki',2019,'aktif','2024-05-21 12:43:45','2024-05-21 12:43:45'),(129,1,'0011','Farida  Kosandalina Patai','Perempuan',2019,'aktif','2024-05-21 12:43:45','2024-05-21 12:43:45'),(130,1,'0012','Reynaldy Risat Lewarissa','Laki-laki',2019,'aktif','2024-05-21 12:43:46','2024-05-21 12:43:46'),(131,1,'0013','Maurits O W Mayor','Laki-laki',2019,'aktif','2024-05-21 12:43:46','2024-05-21 12:43:46'),(132,1,'0014','Natalia F Soway','Perempuan',2019,'aktif','2024-05-21 12:43:46','2024-05-21 12:43:46'),(133,1,'0015','Roberth Betuel Kafiar','Laki-laki',2019,'aktif','2024-05-21 12:43:47','2024-05-21 12:43:47'),(134,1,'0016','Dennis Rein Akwan','Laki-laki',2019,'aktif','2024-05-21 12:43:47','2024-05-21 12:43:47'),(135,1,'0020','Martinus  Yeimo','Laki-laki',2019,'aktif','2024-05-21 12:43:48','2024-05-21 12:43:48'),(136,1,'0021','Charles Fonataba','Laki-laki',2019,'aktif','2024-05-21 12:43:48','2024-05-21 12:43:48'),(137,1,'0023','Simon D Wally','Laki-laki',2019,'aktif','2024-05-21 12:43:48','2024-05-21 12:43:48'),(138,1,'0025','Ayungga Tabuni','Laki-laki',2019,'aktif','2024-05-21 12:43:49','2024-05-21 12:43:49'),(139,1,'0036','Sampika Yulianus Atanay','Laki-laki',2019,'aktif','2024-05-21 12:43:49','2024-05-21 12:43:49'),(140,1,'1001','Utdilu Mosip','Laki-laki',2019,'aktif','2024-05-21 12:43:49','2024-05-21 12:43:49'),(141,1,'1002','Thomas D Maryar','Laki-laki',2019,'aktif','2024-05-21 12:43:50','2024-05-21 12:43:50'),(142,1,'1003','Lodowik Aweta','Laki-laki',2019,'aktif','2024-05-21 12:43:50','2024-05-21 12:43:50'),(143,1,'1004','Marson Wetapo','Laki-laki',2019,'aktif','2024-05-21 12:43:51','2024-05-21 12:43:51'),(144,1,'1005','Soleman Fainsenem','Laki-laki',2019,'aktif','2024-05-21 12:43:51','2024-05-21 12:43:51'),(145,1,'1007','Natanil Way','Laki-laki',2019,'aktif','2024-05-21 12:43:51','2024-05-21 12:43:51'),(146,1,'0001','Yermias Tebay','Laki-laki',2020,'aktif','2024-05-21 12:43:52','2024-05-21 12:43:52'),(147,1,'0002','Ledy  Isabella Teurupun','Perempuan',2020,'aktif','2024-05-21 12:43:52','2024-05-21 12:43:52'),(148,1,'0003','Samuel Risky Rijoly','Laki-laki',2020,'aktif','2024-05-21 12:43:52','2024-05-21 12:43:52'),(149,1,'0004','Trofinus A. Amsamsium','Laki-laki',2020,'aktif','2024-05-21 12:43:53','2024-05-21 12:43:53'),(150,1,'0005','Ferdu Kenelak','Laki-laki',2020,'aktif','2024-05-21 12:43:53','2024-05-21 12:43:53'),(151,1,'0006','Jemi Inggibal','Laki-laki',2020,'aktif','2024-05-21 12:43:54','2024-05-21 12:43:54'),(152,1,'0007','Axel Pratama Rantetasak JK','Laki-laki',2020,'aktif','2024-05-21 12:43:54','2024-05-21 12:43:54'),(153,1,'0008','Marsel Ricardo Waromi','Laki-laki',2020,'aktif','2024-05-21 12:43:54','2024-05-21 12:43:54'),(154,1,'0009','Menu Yikwa','Laki-laki',2020,'aktif','2024-05-21 12:43:55','2024-05-21 12:43:55'),(155,1,'0010','Alexander K Takayetouw','Laki-laki',2020,'Aktif','2024-05-21 12:43:55','2024-06-11 19:09:16'),(156,1,'0011','William L Takayeitoew','Laki-laki',2020,'aktif','2024-05-21 12:43:55','2024-05-21 12:43:55'),(157,1,'0012','Edison Bemey','Laki-laki',2020,'aktif','2024-05-21 12:43:56','2024-05-21 12:43:56'),(158,1,'0013','Yulius Wospakrik','Laki-laki',2020,'aktif','2024-05-21 12:43:56','2024-05-21 12:43:56'),(159,1,'0014','Antonius Tora','Laki-laki',2020,'aktif','2024-05-21 12:43:57','2024-05-21 12:43:57'),(160,1,'0015','Yosma Uneputty','Perempuan',2020,'aktif','2024-05-21 12:43:57','2024-05-21 12:43:57'),(161,1,'0016','Lukas G.P Twenty','Laki-laki',2020,'aktif','2024-05-21 12:43:57','2024-05-21 12:43:57'),(162,1,'0017','Leo A Taboari','Laki-laki',2020,'aktif','2024-05-21 12:43:58','2024-05-21 12:43:58'),(163,1,'0019','Allex Yandeday','Laki-laki',2020,'aktif','2024-05-21 12:43:58','2024-05-21 12:43:58'),(164,1,'0020','Songgar Madjar','Laki-laki',2020,'aktif','2024-05-21 12:43:58','2024-05-21 12:43:58'),(165,1,'0021','Natalia Yeta Ansanai','Perempuan',2020,'aktif','2024-05-21 12:43:59','2024-05-21 12:43:59'),(166,1,'0022','Melani Yapanani','Perempuan',2020,'aktif','2024-05-21 12:43:59','2024-05-21 12:43:59'),(167,1,'0023','Fiktor Herimbo Liok Kogoya','Laki-laki',2020,'aktif','2024-05-21 12:44:00','2024-05-21 12:44:00'),(168,1,'1001','Swingli Yeremia Apseray','Laki-laki',2020,'aktif','2024-05-21 12:44:00','2024-05-21 12:44:00'),(169,1,'1002','Maryones Waridjo','Perempuan',2020,'aktif','2024-05-21 12:44:00','2024-05-21 12:44:00'),(170,1,'1006','Daniel Mayor','Laki-laki',2020,'aktif','2024-05-21 12:44:01','2024-05-21 12:44:01'),(171,1,'0001','Viktor Nataniel Monim','Laki-laki',2021,'aktif','2024-05-21 12:44:01','2024-05-21 12:44:01'),(172,1,'0002','Thobias Jevens Nahakleky','Laki-laki',2021,'aktif','2024-05-21 12:44:02','2024-05-21 12:44:02'),(173,1,'0003','Memiri Rauru Rei Tane Hiowati','Laki-laki',2021,'aktif','2024-05-21 12:44:02','2024-05-21 12:44:02'),(174,1,'0004','Andreas Leori Yakarmilena','Laki-laki',2021,'aktif','2024-05-21 12:44:02','2024-05-21 12:44:02'),(175,1,'0005','Brianth Fester','Laki-laki',2021,'aktif','2024-05-21 12:44:03','2024-05-21 12:44:03'),(176,1,'0006','Oktovianus Alan Bwefar','Laki-laki',2021,'aktif','2024-05-21 12:44:03','2024-05-21 12:44:03'),(177,1,'0007','Alexander Nyata','Laki-laki',2021,'aktif','2024-05-21 12:44:04','2024-05-21 12:44:04'),(178,1,'0008','Joice Yanike Kabagaimu','Perempuan',2021,'aktif','2024-05-21 12:44:04','2024-05-21 12:44:04'),(179,1,'0009','Folendam Yarangga','Laki-laki',2021,'aktif','2024-05-21 12:44:04','2024-05-21 12:44:04'),(180,1,'0010','Meki Ayer','Laki-laki',2021,'aktif','2024-05-21 12:44:05','2024-05-21 12:44:05'),(181,1,'0011','Selfina Marina U Kbarek','Perempuan',2021,'aktif','2024-05-21 12:44:05','2024-05-21 12:44:05'),(182,1,'0012','Cosstan W Y Marerabuyan','Perempuan',2021,'aktif','2024-05-21 12:44:05','2024-05-21 12:44:05'),(183,1,'0013','Yoga Erwanto','Laki-laki',2021,'aktif','2024-05-21 12:44:06','2024-05-21 12:44:06'),(184,1,'0014','Olif Suri Sauyas','Perempuan',2021,'aktif','2024-05-21 12:44:06','2024-05-21 12:44:06'),(185,1,'0015','Petrus Temkon','Laki-laki',2021,'aktif','2024-05-21 12:44:07','2024-05-21 12:44:07'),(186,1,'0016','Miseri Cordius Domini Kbarek','Perempuan',2021,'aktif','2024-05-21 12:44:07','2024-05-21 12:44:07'),(187,1,'0018','Gilbert Lebuan','Laki-laki',2021,'aktif','2024-05-21 12:44:08','2024-05-21 12:44:08'),(188,1,'0019','Maikel Kris C Hamong','Laki-laki',2021,'aktif','2024-05-21 12:44:08','2024-05-21 12:44:08'),(189,1,'0020','Josua Ebenhaeser Sabgi May','Laki-laki',2021,'aktif','2024-05-21 12:44:09','2024-05-21 12:44:09'),(190,1,'0021','Clara Esterlina Anakotta','Perempuan',2021,'aktif','2024-05-21 12:44:09','2024-05-21 12:44:09'),(191,1,'0022','Jhon Paisei','Laki-laki',2021,'aktif','2024-05-21 12:44:10','2024-05-21 12:44:10'),(192,1,'0023','Kilmanus Legan Belang','Laki-laki',2021,'aktif','2024-05-21 12:44:10','2024-05-21 12:44:10'),(193,1,'0024','Yunif Wirio','Perempuan',2021,'aktif','2024-05-21 12:44:10','2024-05-21 12:44:10'),(194,1,'0025','Norius Mimin','Laki-laki',2021,'aktif','2024-05-21 12:44:11','2024-05-21 12:44:11'),(195,1,'0026','Yan Bawi','Laki-laki',2021,'aktif','2024-05-21 12:44:11','2024-05-21 12:44:11'),(196,1,'0027','Barnadus Yando','Laki-laki',2021,'aktif','2024-05-21 12:44:11','2024-05-21 12:44:11'),(197,1,'0029','Fredy Ramandei','Laki-laki',2021,'aktif','2024-05-21 12:44:12','2024-05-21 12:44:12'),(198,1,'0030','Paulinus Irsan','Laki-laki',2021,'Aktif','2024-05-21 12:44:12','2024-06-11 19:12:40'),(199,1,'0031','Egla Rumawak','Laki-laki',2021,'aktif','2024-05-21 12:44:13','2024-05-21 12:44:13'),(200,1,'0033','Beatrix Menanti','Perempuan',2021,'aktif','2024-05-21 12:44:13','2024-05-21 12:44:13');
/*!40000 ALTER TABLE `mhs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2019_12_14_000001_create_personal_access_tokens_table',1),(10,'2024_03_25_191624_create_fakultas_table',1),(11,'2024_03_25_191635_create_prodi_table',1),(12,'2024_03_25_191650_create_matkul_table',1),(13,'2024_03_25_191702_create_ruangan_table',1),(14,'2024_03_25_191713_create_dosen_table',1),(15,'2024_03_25_191804_create_jadwal_table',1),(16,'2024_03_25_191811_create_mhs_table',1),(17,'2024_03_25_191817_create_kontrak_table',1),(18,'2024_03_26_192735_create_kontrak_det_table',1),(19,'2024_03_26_203940_create_login_mhs_table',1),(20,'2024_04_03_095632_create_tugas_table',1),(21,'2024_04_03_095639_create_materi_table',1),(22,'2024_04_03_095726_create_absen_table',1),(23,'2024_04_03_095743_create_ujian_table',1),(24,'2024_04_03_095758_create_pertanyaan_table',1),(25,'2024_04_03_095851_create_pilihan_table',1),(26,'2024_04_03_095917_create_jawaban_table',1),(27,'2024_05_08_184618_create_jawabans_table',1),(30,'2024_06_28_193111_create_pengumuman_table',2),(31,'2024_06_29_074705_create_tugas_mhs_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('0443daba9a80fe77ecfb63a2a52ffd16de8d3eb5e147ba951e28077e8296902cca30dc0114dc82e2',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-06-28 13:37:25','2024-06-28 13:37:25','2025-06-28 20:37:25'),('07c7cbcf6aa73fb097cd3b8f552a14e22d545f2aa21856f603b1181fa6b66a8e8925ce4615c3426f',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-05-30 01:17:07','2024-05-30 01:19:44','2025-05-30 08:17:07'),('07efce3bf945e55f90a37f7a3f94cde460120bcb5139fcbdd55ec5a48f41091909f4eddf584f151c',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-12 00:04:52','2024-06-12 00:40:37','2025-06-12 07:04:52'),('090dfb9cb423bfa2a539323a2e0489556c01550d40a6cea00feec9a0a0d01805485142b7f664d591',198,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-22 05:13:32','2024-06-22 06:38:22','2025-06-22 12:13:32'),('0cf1852b1be95d9a0090f9bf70cf8d798566e4aa26793df8e7755ee01f9f6b84a432988d3706a5e8',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-18 21:44:59','2024-06-18 21:46:00','2025-06-19 04:44:59'),('0e38e0aecda32962e4e998e0264f18b03fb4c1fca3503c1bd7bb77186b412311f4fb8bb31a4e7b26',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-06-22 06:38:58','2024-06-22 06:38:58','2025-06-22 13:38:58'),('0f8357c39231470b953ecc7d0d5ed2bd32aab4e97fe980faa8b86d349ee5fbb2c212c9eb8245c6bd',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-05-28 22:51:29','2024-05-28 22:51:29','2025-05-29 05:51:29'),('1319c7c756f8eae01d657f3f78b326d3260768402f709d5a78849ddd9ad3ddaff15ec1ef0467418e',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-18 21:57:07','2024-06-18 21:58:53','2025-06-19 04:57:07'),('16c93fcbaa7f481037247d4b45a3998290e1739dabb90dc8110bb751383f534d9d2e562d03b93597',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-18 23:52:27','2024-06-18 23:58:17','2025-06-19 06:52:27'),('1a98e08576bce48e5268b1786c1e34e24b1d300cb82c3bf6c3451e14fdc53890a7fb9ab4255433df',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-11 19:21:41','2024-06-11 19:22:07','2025-06-12 02:21:41'),('1c045d13c8b9d8d7b190007e43d81e3b7ffd0b3bff86bfe4f4bfded27028cd0f644f8991d502dc6c',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-19 00:13:17','2024-06-19 00:13:57','2025-06-19 07:13:17'),('2060419479d1dbfc8469223719819be41a4191f0f460dffeef589303e164e70ead55fe9370be11e9',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-05-30 01:22:46','2024-05-30 01:24:48','2025-05-30 08:22:46'),('216aaee345898f62717e42c30c65c4c07ad7cbb62fc6e0609f466e2b11455d0bdeffa43c3344e292',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-05-30 01:07:02','2024-05-30 01:11:05','2025-05-30 08:07:02'),('24a352fc4948ab914e776fd73f37a0219edf3bae72cc3d3c87149fc62a966e925a8a16ff74181180',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-13 09:46:52','2024-06-13 16:10:30','2025-06-13 16:46:52'),('277b23170a3395f2de4ebce23e8e4207c785051244c170bb305f8abf8063370b95ce6c2c71bbb19b',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-05-21 13:15:16','2024-05-21 13:15:16','2025-05-21 20:15:16'),('2936b0d92e0927229a701ba7268c3c915d013bfccb1cd2e3ff3099bf2dcdec5fbe4bebfc639a8b1d',2,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-11 19:33:53','2024-06-11 19:37:19','2025-06-12 02:33:53'),('2b8e92a616851fc1d452d5753fdb57975bb68e43c6cd3711f576e06176842c450510dc5253c85102',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-07-05 23:57:03','2024-07-05 23:57:12','2025-07-06 06:57:03'),('2d64be9b1483e1aab968b1eadd405596034e7b85aff4daa7d5b445cef48af2dbe9bcf6cb95dd19b8',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-06-08 21:40:34','2024-06-08 21:40:34','2025-06-09 04:40:34'),('2da6db27e9d15d80fb30e36fca542dd3ad37d9403e4c74637d22f47ee7fc947b776fc09af6850ba8',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-05-21 20:05:38','2024-05-21 20:06:02','2025-05-22 03:05:38'),('2ededc40c51eabb5c8fa84bb4a30507449c5ab255af0615cce1f2cbc512a6f4878a63218da5ea678',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-07-08 22:27:34','2024-07-08 22:27:34','2025-07-09 05:27:34'),('32c5a05b898abbfe28d36eeeb99e92fdaaee6166a82e569b1c8659ee34ae14a37b0dc79a11216a38',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-05-30 01:03:20','2024-05-30 01:06:22','2025-05-30 08:03:20'),('3300a8b360248513ca81619cc63657f3c36eee854e96004fac6d056a312b288e85ceaffdc79bc77d',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-06-18 02:19:40','2024-06-18 02:19:40','2025-06-18 09:19:40'),('3b1b523486fce7d0f34827fa88a88edf3814c7e93132e1ecaac5e0196a9fc325f06086a0ac8c1ab2',2,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-11 20:02:27','2024-06-11 20:03:01','2025-06-12 03:02:27'),('3dbc07e8f00bdb6ef21e116f33995cec1142b474cd139773976cb37ace37972051cec754d8120f45',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-19 00:09:46','2024-06-19 00:10:31','2025-06-19 07:09:46'),('43f00e964768657732ab409782f68b03028e578a4907ce2352e5fb7c518ee382d947d300efb3dc2b',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-28 14:35:50','2024-06-28 14:36:39','2025-06-28 21:35:50'),('4de2ec03603f17ad10dd297d71971264895dc4e39c44a456f8beb68c52c001c7be9b71511ebe6960',2,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-11 19:41:11','2024-06-11 19:41:29','2025-06-12 02:41:11'),('4f4f55c2812e781cfbfb0a1abeaf83d6042ecb5c71bb994b519d13b4a876571b8ddd9fabecde93de',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-05-29 21:02:49','2024-05-29 21:02:49','2025-05-30 04:02:49'),('5058c7552495e7e9ff8053210bbbe7d42252270c53302e94d96526b517c51bcd1d1d36915487e17f',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-07-08 00:53:36','2024-07-08 00:54:45','2025-07-08 07:53:36'),('55a270cadedefb6f12f56f1947a550ad9ab1c6fd941183cbbec3a68125f312fdc99c66a1b084d3d6',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-13 20:43:23','2024-06-13 21:03:18','2025-06-14 03:43:23'),('564a1587de856cc371ae2b72fac4997686a57a9d283c2f0ebb326e3ce3beabecbbb737d05465bf57',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-11 19:30:48','2024-06-11 19:32:40','2025-06-12 02:30:48'),('58b2801b44bd5cb114137bc470384d42f1b5cfb9e5857c84ae11484b1d993b4986a7a9b45eab7bfe',21,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-06-12 00:40:49','2024-06-12 00:40:49','2025-06-12 07:40:49'),('5bcfbb3145e1f1ad5c45f07102a101b396ada691255a2938fe1ac056cb699c625f87a6ff518e5745',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-07-08 01:09:55','2024-07-08 01:19:35','2025-07-08 08:09:55'),('62a51800abc7af59c1353e72aa2afd8c2b9619c7a9ad3a188a4dc55966ba91252d57c72c61855d6b',40,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-11 23:56:05','2024-06-12 00:04:35','2025-06-12 06:56:05'),('6325208832510b92f9c3bbbdf68065af78221e9ca83b71c01dde1585843ee1adcae0ddb639c46a7f',40,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-12 00:05:19','2024-06-12 00:06:05','2025-06-12 07:05:19'),('6c7bc46e584397b9a42cca22d40789a4ad24d8a39d1a691c4b54b4c551ea613dd358a5bb002622ad',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-18 21:46:43','2024-06-18 21:47:49','2025-06-19 04:46:43'),('6de9db0f35f9dbc7760ba9cf27f07bf9f30eafdcb84b83a09799cb9727cd3d7fe960d874e2779c02',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-07-04 14:15:04','2024-07-04 14:15:04','2025-07-04 21:15:04'),('6e14527b98856206c9caa75a0cdb7493704a02d6a6a20554b71a197d33e2b2da4bc249198ce0bee4',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-06-11 23:53:36','2024-06-11 23:53:36','2025-06-12 06:53:36'),('6fe1c0f8e62847e840febaee560b844e8e706fa24738ce5843766fa75afa15e75cdd2e96fe0d5561',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-11 19:17:19','2024-06-11 19:18:11','2025-06-12 02:17:19'),('7038ea4cc6f53a71b80480df77ef5e605245d48a95f97f4609f787f171355302fffaee9c32bdd690',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-05-30 01:28:09','2024-05-30 01:28:09','2025-05-30 08:28:09'),('70a07fe466277637053a610ecbb3239316a3d5d91903940d225719330ed4f4fbc383bf83ebdf00d2',2,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-11 23:10:27','2024-06-11 23:10:53','2025-06-12 06:10:27'),('762dca30f36e595514a7844be7b163f13a85043dc3af6f5193279ba8e1761f87df760de5bf2540d2',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-19 00:01:35','2024-06-19 00:02:53','2025-06-19 07:01:35'),('7717ba798bbef18442e9ee7ac72f2a9ea8f24a2d2b8764e9558a5f73b27a3b3ac6311f4e0de65766',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-13 16:16:06','2024-06-13 20:42:02','2025-06-13 23:16:06'),('7960c5d18ab5655307f97ce2c5a591c89dbf54ce49ca6a47bb2310a8b207c102484ec46191fd33ee',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-05-22 00:56:13','2024-05-22 00:56:13','2025-05-22 07:56:13'),('7f851f2a7988ca520bcd2be8446d2d4779a6a676ac8d4b51fb2c9f7a27ef79045ffb151c19cfb849',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-05-30 00:45:09','2024-05-30 00:45:10','2025-05-30 07:45:09'),('8117a697a3ea5702242bee69ac5edcd814ed14dcbf9e6f05866aee51ade40208bf24be3a6633a1bd',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-05-30 01:12:30','2024-05-30 01:14:47','2025-05-30 08:12:30'),('83a5ce82f394cfae5b664f3db16f75e6cb6e5007206d4e73281e33a47110a873952eb6735fa72c52',2,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-11 19:59:27','2024-06-11 19:59:57','2025-06-12 02:59:27'),('83ec4e3406b924abb6c08171200c557fa30c52643400eac1add9589ccf6783c685fa7eabcb00571a',2,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-11 19:45:13','2024-06-11 19:45:20','2025-06-12 02:45:13'),('876c713b190e964280b6c707ae6fb67c209bab706bf795076e2c7d5f92cc1726c940755553a95e6e',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-06-08 08:15:32','2024-06-08 08:15:32','2025-06-08 15:15:32'),('8bf21b24aee08a40102cb3aa36d275ef2fdd3ca0f9f9acd61edbc5c1eeb745a7f3dfe3baabbf2cb7',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-11 19:22:23','2024-06-11 19:23:00','2025-06-12 02:22:23'),('8c7cf15696374d91f709036ff7176f7822af4cf4ccb12b8b3ba1b1e234ddee34222e478095bc5487',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-18 21:54:54','2024-06-18 21:56:30','2025-06-19 04:54:54'),('8c85838737620bbeb68ee2f6a9a41234e162ab27f39e3c108f98935d73939aaa544334f0ccd64ff7',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-18 21:52:33','2024-06-18 21:52:53','2025-06-19 04:52:33'),('8cb85282dba0c3d343e91e247103d711005791f97072cbe8466b842e095ebe6cf787f2a2fc6d6a0e',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-07-08 22:26:20','2024-07-08 22:26:20','2025-07-09 05:26:20'),('8df3cc39022ef858673bf8ab469884001504cfe81a0d13dd761036fe0c0580e1a228ba636bedaa6f',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-11 19:08:40','2024-06-11 19:14:45','2025-06-12 02:08:40'),('8e3093d95c838db2c77ae5af32def6b743b8cae290ac7ffa1b9ae81e9e46101bcdf9c5653560e441',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-19 00:11:13','2024-06-19 00:12:22','2025-06-19 07:11:13'),('9020f78d61b1b26a09ca7e08568bf18d50c1274f342b511b4877709171e777d60f239ff2a8c17091',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-05-30 01:15:02','2024-05-30 01:16:47','2025-05-30 08:15:02'),('9358885c7bdb1412dd88005e8008d78769b4c6e9ca225e02573d5bc8eb61df49756fe866e9fe67c3',2,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-11 19:54:11','2024-06-11 19:55:45','2025-06-12 02:54:11'),('98f54f7d815277c9d9ade23dc5fc030da83cf5f30d427cbf0e53917d2f093f838bd6d1ecf8276a67',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-18 23:35:43','2024-06-18 23:37:20','2025-06-19 06:35:43'),('a009d700f89f8204cc8956dda0d35132aa0e624ec9eace006581ff47bac0aceebaec5f2a534a9991',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-18 23:48:26','2024-06-18 23:49:37','2025-06-19 06:48:26'),('a259bc7e8821dd944ee8045f9acb7e547d6554985061e28d9a41ad07ad981bf43f124d2f701f227e',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-11 19:58:03','2024-06-11 19:58:12','2025-06-12 02:58:03'),('a2c657b56647f0f8e6d9796cc9b47597b847d8d37cbf09877635181ac073231dc012cbf838e7a0b1',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-07-05 23:58:33','2024-07-05 23:58:33','2025-07-06 06:58:33'),('b31ddbbf787627edc80fa75ee1da50a3d913c87fc991b7607109d660af4b723dbf96940932506a2d',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-05-21 20:06:39','2024-05-21 20:06:39','2025-05-22 03:06:39'),('b45bf486d8aec89f12224051878bff1708a742b03bf61e69d54a78ea74a8c5f94a7cd789bd9aa781',155,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-11 19:08:22','2024-06-11 19:08:28','2025-06-12 02:08:22'),('b56d225a7f1ff0059b5805971554bca11961702cc2e4a626eefe474892cb7336112de1c9a0ad6754',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-05-30 00:42:04','2024-05-30 00:43:09','2025-05-30 07:42:04'),('b9acdd2616ae1b614ffab2c20e30275c37d4e7d1c7eefe4d554a7b317db6918e3ca12b63662b90f0',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-11 19:28:40','2024-06-11 19:28:47','2025-06-12 02:28:40'),('c0758d90dcf1410a6df358e42e939bb0576d52e54caa5fdad274a5e26a656eb8ff955e9c5b7b7ccc',2,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-06-11 20:00:41','2024-06-11 20:00:41','2025-06-12 03:00:41'),('c13b4af5b3448569a66e68d5d1f57298ac642cdd282056d373623da7d76673e96932f269866fb0a4',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-19 00:28:19','2024-06-19 00:31:30','2025-06-19 07:28:19'),('c32e5901a6627e61f804d3f77be43f1c08ff090be8189827f4e5442922520c8c87406acc30eb05bf',177,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-07-08 00:51:41','2024-07-08 00:53:04','2025-07-08 07:51:41'),('c4283bceede66ed42e18376b87c8aeaa98222d21e9296319d32d84654fd79e906fe3a40b685d2ef5',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-05-30 00:57:34','2024-05-30 00:59:37','2025-05-30 07:57:34'),('c49fa53670b5b2d56f097e8f317a07802adfc1ef8ca9e8ede307f838e968c01b761a0999e9467c34',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-18 21:48:29','2024-06-18 21:52:10','2025-06-19 04:48:29'),('c72cae875c42f11d4d1668a873148c74ef1214baeac47cf3a5a26315e7576c777b51319275b6202c',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-07-08 00:55:46','2024-07-08 01:09:32','2025-07-08 07:55:46'),('cedfc1cdd8816f6ec79771db6ce131488f5077cf2335d767c894c4c62ae3d716864274137787493e',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-18 23:39:20','2024-06-18 23:42:46','2025-06-19 06:39:20'),('d02f6a0da535f452e5b49b220d9846b94f6daeb13157d47e850485063d5afec2a3c914e992ca5cc6',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-18 23:31:32','2024-06-18 23:35:15','2025-06-19 06:31:32'),('d08cc02bdd951861832a72f15949e28b83327f8a10e9f6e84e124fe5879c1703fe2466d1fb338214',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-13 21:10:21','2024-06-13 21:11:12','2025-06-14 04:10:21'),('d0be51cc428346c3102239acd59e598eecd76db29646b9fba176f5cf3ab2fd0f204f00c3e3e79715',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-11 19:45:57','2024-06-11 19:53:54','2025-06-12 02:45:57'),('d49dcb1a36b7197a22a0b60784c3971e64ccbf1ad8cfa464d4f79d19f7aa1eeffe090c2203ac80a0',121,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-28 14:36:51','2024-06-28 14:37:01','2025-06-28 21:36:51'),('d796c5f12d10ea302444c8b56844a4a149870dd239fb3de4ef53f1241c46561dd4fffb266e932871',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-07-08 00:50:23','2024-07-08 00:51:33','2025-07-08 07:50:23'),('db135d9c1e73e6f5af97e4c805ae3f7d6352eb8cfe57602e28d25b1931ac9250a463f94fa9104b22',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-19 00:03:03','2024-06-19 00:03:58','2025-06-19 07:03:03'),('db86edb7455171012a24a7771c2b5464cb30a80825d6e1dc5de6fa5ac1b7109ae81d4224728e9459',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-06-11 23:11:44','2024-06-11 23:11:44','2025-06-12 06:11:44'),('e0a35e0c6767771fef6cb9fff5f5015268f4a8620d49e1e416914d0b5ed7ff8e775f8c707d522eef',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-06-13 09:04:23','2024-06-13 09:04:23','2025-06-13 16:04:23'),('e1ae8761789a0be19c6345010dfe0ed1c7532c3e195efe54a0bb9f82bad6a9384155199d0b4aeadc',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-13 21:04:32','2024-06-13 21:09:52','2025-06-14 04:04:32'),('e43cac67d401ffcfa0b654346adc932db1d88f6093d07c9fe96278c928a6b886bfaf62090a88b968',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-05-30 01:02:05','2024-05-30 01:02:34','2025-05-30 08:02:05'),('eac6c0e995c8004b399303a1c3396520f79cfded86b5cf6814f5a0df4fc4d34e78d45c8b387bd15a',2,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-11 19:45:37','2024-06-11 19:45:44','2025-06-12 02:45:37'),('edb24aa450576f9f2fbc6c0e7c019eb5a168e02d6b01c5374ece67a59417ace333a90e8a0a051d90',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-10 14:33:40','2024-06-10 14:34:34','2025-06-10 21:33:40'),('f0ab4b76eed3ff816fb23f1f7cd0de2db08d76abadc3bcb518557f52769dd1ed82c57d4ec346e48a',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-05-30 01:11:19','2024-05-30 01:12:05','2025-05-30 08:11:19'),('f3477ebca9c8b17c8929e69fc266e86a1fad34caffb264ff0169bdf419692c07a95178945083f2ed',3,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-18 21:43:39','2024-06-18 21:44:26','2025-06-19 04:43:39'),('fa393d51d3eab02d3db958041fc8c02457c921c40d45da688ca86321808cab2b6305eb6f6abe6485',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-05-21 13:14:49','2024-05-21 13:15:02','2025-05-21 20:14:49'),('fadb5f5f543447d33bae8cdb9e0d91bbf803da15e499082b434b893c56e39445b0d78c9376db7879',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',0,'2024-06-11 20:03:18','2024-06-11 20:03:18','2025-06-12 03:03:18'),('fef304df1bf8234d57fc81368e4ce039526f94a2dd756cbff4082835b72479427b0179996bddcc2e',1,'9c193dd0-0755-49de-9db5-24d19d5170e1','authToken','[]',1,'2024-06-11 19:18:27','2024-06-11 19:20:52','2025-06-12 02:18:27');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES ('9c19348d-45ae-4a8c-a027-beaecdf347f9',NULL,'Roni Kmur Personal Access Client','5qwTKvz8xjhPVQwqEe2swv5QZeVvMQzEzIcRJkJn',NULL,'http://localhost',1,0,0,'2024-05-21 12:44:57','2024-05-21 12:44:57'),('9c193cc4-6673-4b60-aca2-e40b7b4118a6',NULL,'Roni Kmur Personal Access Client','imCPlzkT2J9XH252TSt91nzGRREVDM7JZsfSwaxI',NULL,'http://localhost',1,0,0,'2024-05-21 13:07:56','2024-05-21 13:07:56'),('9c193cc4-90b7-440f-b8eb-388cc3bb68bf',NULL,'Roni Kmur Password Grant Client','sXVTyDaYfPhsdqzbXQwnDUKpEruQ5m37AwDTXdyt','users','http://localhost',0,1,0,'2024-05-21 13:07:56','2024-05-21 13:07:56'),('9c193dd0-0755-49de-9db5-24d19d5170e1',NULL,'Roni Kmur Personal Access Client','w5iDAGW8Vs6OivaGkU9ZXuYJCn1GRwODeiAsjzxJ',NULL,'http://localhost',1,0,0,'2024-05-21 13:10:51','2024-05-21 13:10:51'),('9c193edf-5ce9-4aee-94a3-61c1e32f580c',NULL,'Roni Kmur Personal Access Client','upKZ6wk2Yf0CM374wy4tHigAVCoX1AKWgw9P2OeC',NULL,'http://localhost',1,0,0,'2024-05-21 13:13:49','2024-05-21 13:13:49'),('9c193edf-9561-4336-8b1b-ecca13382474',NULL,'Roni Kmur Password Grant Client','A5QfYA7mUTJ3SA6250HBJfKh12hcWuLGFk9nGz7V','users','http://localhost',0,1,0,'2024-05-21 13:13:49','2024-05-21 13:13:49');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,'9c19348d-45ae-4a8c-a027-beaecdf347f9','2024-05-21 12:44:57','2024-05-21 12:44:57'),(2,'9c193cc4-6673-4b60-aca2-e40b7b4118a6','2024-05-21 13:07:56','2024-05-21 13:07:56'),(3,'9c193dd0-0755-49de-9db5-24d19d5170e1','2024-05-21 13:10:51','2024-05-21 13:10:51'),(4,'9c193edf-5ce9-4aee-94a3-61c1e32f580c','2024-05-21 13:13:49','2024-05-21 13:13:49');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengumuman`
--

DROP TABLE IF EXISTS `pengumuman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengumuman` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengumuman`
--

LOCK TABLES `pengumuman` WRITE;
/*!40000 ALTER TABLE `pengumuman` DISABLE KEYS */;
/*!40000 ALTER TABLE `pengumuman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pertanyaan`
--

DROP TABLE IF EXISTS `pertanyaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pertanyaan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ujian_id` bigint unsigned NOT NULL,
  `pertanyaan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pertanyaan_ujian_id_foreign` (`ujian_id`),
  CONSTRAINT `pertanyaan_ujian_id_foreign` FOREIGN KEY (`ujian_id`) REFERENCES `ujian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pertanyaan`
--

LOCK TABLES `pertanyaan` WRITE;
/*!40000 ALTER TABLE `pertanyaan` DISABLE KEYS */;
INSERT INTO `pertanyaan` VALUES (1,3,'uhahfjsf','Esay','2024-06-18 23:55:27','2024-06-18 23:55:27'),(2,5,'nndskfskf','Objektif','2024-06-18 23:58:02','2024-06-18 23:58:02');
/*!40000 ALTER TABLE `pertanyaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilihan`
--

DROP TABLE IF EXISTS `pilihan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilihan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pertanyaan_id` bigint unsigned NOT NULL,
  `daftar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pilihan_pertanyaan_id_foreign` (`pertanyaan_id`),
  CONSTRAINT `pilihan_pertanyaan_id_foreign` FOREIGN KEY (`pertanyaan_id`) REFERENCES `pertanyaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilihan`
--

LOCK TABLES `pilihan` WRITE;
/*!40000 ALTER TABLE `pilihan` DISABLE KEYS */;
INSERT INTO `pilihan` VALUES (1,2,'hfdjfdjjk','2024-06-18 23:58:02','2024-06-18 23:58:02'),(2,2,'sdcccm','2024-06-18 23:58:02','2024-06-18 23:58:02');
/*!40000 ALTER TABLE `pilihan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodi`
--

DROP TABLE IF EXISTS `prodi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fakultas_id` bigint unsigned NOT NULL,
  `kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nm_prodi` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `singkat` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prodi_fakultas_id_foreign` (`fakultas_id`),
  CONSTRAINT `prodi_fakultas_id_foreign` FOREIGN KEY (`fakultas_id`) REFERENCES `fakultas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodi`
--

LOCK TABLES `prodi` WRITE;
/*!40000 ALTER TABLE `prodi` DISABLE KEYS */;
INSERT INTO `prodi` VALUES (1,2,'5720','Sistem Informasi','SI','2024-05-21 12:40:45','2024-05-21 12:40:45'),(2,2,'4134','Biologi','BI','2024-05-21 12:40:45','2024-05-21 12:40:45'),(3,2,'2345','Teknik Geologi','TG','2024-05-21 12:40:45','2024-05-21 12:40:45'),(4,1,'6121','Manajemen','MA','2024-05-21 12:40:46','2024-05-21 12:40:46'),(5,1,'6021','Ekonomi Pembangunan','EP','2024-05-21 12:40:46','2024-05-21 12:40:46'),(6,1,'6221','Akuntansi','AK','2024-05-21 12:40:46','2024-05-21 12:40:46'),(7,3,'5420','Agribisnis','AG','2024-05-21 12:40:46','2024-05-21 12:40:46'),(8,3,'5421','Agroteknologi','AT','2024-05-21 12:40:46','2024-05-21 12:40:46'),(9,3,'5425','Kehutanan','KH','2024-05-21 12:40:46','2024-05-21 12:40:46'),(10,3,'5427','Manajemen Sumberdaya Perairan','MSDP','2024-05-21 12:40:46','2024-05-21 12:40:46'),(11,4,'6111','Magister Manajemen','MM','2024-05-21 12:40:46','2024-05-21 12:40:46');
/*!40000 ALTER TABLE `prodi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruangan`
--

DROP TABLE IF EXISTS `ruangan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ruangan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fakultas_id` bigint unsigned NOT NULL,
  `nm_ruangan` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `singkat` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kapasitas` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ruangan_fakultas_id_foreign` (`fakultas_id`),
  CONSTRAINT `ruangan_fakultas_id_foreign` FOREIGN KEY (`fakultas_id`) REFERENCES `fakultas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruangan`
--

LOCK TABLES `ruangan` WRITE;
/*!40000 ALTER TABLE `ruangan` DISABLE KEYS */;
INSERT INTO `ruangan` VALUES (1,2,'Ruang Kuliah 1','RK-1',0,'2024-05-21 12:40:49','2024-05-21 12:40:49'),(2,2,'Ruang Kuliah 2','RK-2',0,'2024-05-21 12:40:49','2024-05-21 12:40:49'),(3,2,'Ruang Kuliah 3','RK-3',0,'2024-05-21 12:40:49','2024-05-21 12:40:49'),(4,2,'Ruang Kuliah 4','RK-4',0,'2024-05-21 12:40:49','2024-05-21 12:40:49'),(5,2,'Ruang Kuliah 5','RK-5',0,'2024-05-21 12:40:49','2024-05-21 12:40:49'),(6,2,'Ruang Kuliah 6','RK-6',0,'2024-05-21 12:40:49','2024-05-21 12:40:49'),(7,2,'Ruang Kuliah 7','RK-7',0,'2024-05-21 12:40:49','2024-05-21 12:40:49'),(8,2,'Ruang Kuliah 8','RK-8',0,'2024-05-21 12:40:49','2024-05-21 12:40:49'),(9,2,'Laboratorium Komputer A','Lab-Kom-A',0,'2024-05-21 12:40:49','2024-05-21 12:40:49'),(10,2,'Laboratorium Komputer B','Lab-Kom-B',0,'2024-05-21 12:40:49','2024-05-21 12:40:49'),(11,3,'Gedung Serba Guna','GSG',0,'2024-05-21 12:40:50','2024-06-11 19:49:01'),(12,2,'Laboratorium Teknik Geologi','LAB-TG',0,'2024-05-21 12:40:50','2024-05-21 12:40:50'),(13,2,'Laboratorium Biologi','LAB-BI',0,'2024-05-21 12:40:50','2024-05-21 12:40:50'),(14,2,'Ruang Baca','RB',0,'2024-05-21 12:40:50','2024-05-21 12:40:50'),(15,2,'Laboratorium Kimia','LAB-Kimia',0,'2024-05-21 12:40:50','2024-05-21 12:40:50'),(16,2,'Aula Fakultas Sains & Teknologi','AULA-FST',0,'2024-05-21 12:40:50','2024-05-21 12:40:50'),(17,2,'Ruang Rapat','RR',0,'2024-05-21 12:40:50','2024-05-21 12:40:50');
/*!40000 ALTER TABLE `ruangan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tugas`
--

DROP TABLE IF EXISTS `tugas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tugas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `jadwal_id` bigint unsigned NOT NULL,
  `nm_tugas` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `deadline` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tugas_jadwal_id_foreign` (`jadwal_id`),
  CONSTRAINT `tugas_jadwal_id_foreign` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tugas`
--

LOCK TABLES `tugas` WRITE;
/*!40000 ALTER TABLE `tugas` DISABLE KEYS */;
INSERT INTO `tugas` VALUES (1,183,'1. Apa Yang Dimaksud  IMK',NULL,'2024-06-20','2024-06-18 23:42:35','2024-06-18 23:42:35'),(3,201,'UFUEFDSLF','LKJLR','2024-07-09','2024-07-08 00:50:56','2024-07-08 00:50:56'),(4,193,'IOEJR','IRIOERO','2024-07-10','2024-07-08 00:51:28','2024-07-08 00:51:28');
/*!40000 ALTER TABLE `tugas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tugas_mhs`
--

DROP TABLE IF EXISTS `tugas_mhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tugas_mhs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tugas_id` bigint unsigned NOT NULL,
  `mhs_id` bigint unsigned NOT NULL,
  `file_tugas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nilai` int DEFAULT NULL,
  `catatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tugas_mhs_tugas_id_foreign` (`tugas_id`),
  KEY `tugas_mhs_mhs_id_foreign` (`mhs_id`),
  CONSTRAINT `tugas_mhs_mhs_id_foreign` FOREIGN KEY (`mhs_id`) REFERENCES `mhs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tugas_mhs_tugas_id_foreign` FOREIGN KEY (`tugas_id`) REFERENCES `tugas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tugas_mhs`
--

LOCK TABLES `tugas_mhs` WRITE;
/*!40000 ALTER TABLE `tugas_mhs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tugas_mhs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujian`
--

DROP TABLE IF EXISTS `ujian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ujian` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `jadwal_id` bigint unsigned NOT NULL,
  `jenis_ujian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_ujian` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ujian_jadwal_id_foreign` (`jadwal_id`),
  CONSTRAINT `ujian_jadwal_id_foreign` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujian`
--

LOCK TABLES `ujian` WRITE;
/*!40000 ALTER TABLE `ujian` DISABLE KEYS */;
INSERT INTO `ujian` VALUES (1,183,'UTS','2024-06-19','2024-06-18 23:49:30','2024-06-18 23:49:30'),(3,201,'UTS','2024-06-21','2024-06-18 23:54:38','2024-06-18 23:54:38'),(4,201,'UTS','2024-06-21','2024-06-18 23:55:03','2024-06-18 23:55:03'),(5,201,'UAS','2024-06-19','2024-06-18 23:55:47','2024-06-18 23:55:47'),(6,201,'UAS','2024-06-21','2024-06-18 23:56:42','2024-06-18 23:56:42');
/*!40000 ALTER TABLE `ujian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@fstuogp.com',NULL,'$2y$12$WHE6Q0lgrbxRF6U5SrC9gOdAskIkf5qlRraDVm29vnks0Kg10TN6O','','Admin',NULL,'2024-05-21 12:40:45','2024-05-21 12:40:45'),(2,'Andrijanni, S.Kom., M.Cs','5nxvx574@mail.com',NULL,'$2y$12$WcKpU0NtaqJyb92nc7/VPur7bIzO9JJQQjmV6WlFmFyskWMGhl5UW','5nxvx574','dosen',NULL,'2024-05-21 12:42:12','2024-05-21 12:42:12'),(3,'Axelon Samuel Renyaan, S.SI., MT','hz9p5n3n@mail.com',NULL,'$2y$12$EmLu.AcFnjFGoy7Z6w7uS.2fi5AMEQknzMpMs5aKW6hMrqYejNfbK','hz9p5n3n','dosen',NULL,'2024-05-21 12:42:12','2024-05-21 12:42:12'),(4,'Beatrix I.S. Wanma, S.Si., M.Si','sxmqyxxf@mail.com',NULL,'$2y$12$QbS0GxE5vy8p0OG6SoQANehoyvhsxyUx9R0Re00QOhdBaz1Uy0.zy','sxmqyxxf','dosen',NULL,'2024-05-21 12:42:13','2024-05-21 12:42:13'),(5,'Desty Pongsikabe, ST., M.Si','cgcs8r57@mail.com',NULL,'$2y$12$ECAgJ9e2EJQizCYEn3.8becI2T3BR9o17.7CreGN0V5lBs/tMSAXu','cgcs8r57','dosen',NULL,'2024-05-21 12:42:13','2024-05-21 12:42:13'),(6,'Dimitrij Q. Ananda sari, S.Pd., M.Pd','xh2thfih@mail.com',NULL,'$2y$12$G4wi3S4pmxEDGh6RgGRm6e6N5FSCCjtGxUlY5q14Jb0hh2O9LFtMm','xh2thfih','dosen',NULL,'2024-05-21 12:42:14','2024-05-21 12:42:14'),(7,'Doodle Dandy Waromi, S.T., M.T','6wb5lrkr@mail.com',NULL,'$2y$12$n8hWUpKp6WwTc9EQuXSxhOxDHTSyGfbjvhi7nOoTY4.FA8kfsIhAu','6wb5lrkr','dosen',NULL,'2024-05-21 12:42:14','2024-05-21 12:42:14'),(8,'Dr. Lisye Zebua, M.Si','hbyhuk4k@mail.com',NULL,'$2y$12$6WCnAW5TiWAD6/LHiyRrYOfXhzHQAsj/U3/Nz2WPVLk9yGBC6m40.','hbyhuk4k','dosen',NULL,'2024-05-21 12:42:15','2024-05-21 12:42:15'),(9,'Dr. Maran Gultom','r72ghqfq@mail.com',NULL,'$2y$12$MtOB4q9q2WYp5Ud.guxDG.q46MMAaaVgA29vH3hqQ2Hy5j3Gze3t.','r72ghqfq','dosen',NULL,'2024-05-21 12:42:15','2024-05-21 12:42:15'),(10,'Dr. Martha Wospakrik, M.Th','awl3fbvk@mail.com',NULL,'$2y$12$bELSfuclUe7KR53n/xvdiOPRs7jcDO25ciZW6wHJSZSuJ4KEA1OaG','awl3fbvk','dosen',NULL,'2024-05-21 12:42:15','2024-05-21 12:42:15'),(11,'Dr. ret. nat. Henderina Kailuhu','2ej9zlp3@mail.com',NULL,'$2y$12$U.h0G/KT1AEPtBQOMUhOPu.wZk2prrIHJ6qK8tKN9xsiOndaeAleW','2ej9zlp3','dosen',NULL,'2024-05-21 12:42:16','2024-05-21 12:42:16'),(12,'Dr. Virman','a65gacvb@mail.com',NULL,'$2y$12$2JgS3osVwCaLZbZiui6tCO2kfCDfXz5bVjGZmimDiCdQRsucfZldC','a65gacvb','dosen',NULL,'2024-05-21 12:42:16','2024-05-21 12:42:16'),(13,'Efraim Mangaluk, M.Hum','sj9q4hh8@mail.com',NULL,'$2y$12$ZBfGQvktxO5cv4viBc27leIUjUfziNrkYTrK5LNRJGUNZ8Ekk.RN2','sj9q4hh8','dosen',NULL,'2024-05-21 12:42:17','2024-05-21 12:42:17'),(14,'Efraim Mangaluk, S.S., M.Hum','flpo8h5c@mail.com',NULL,'$2y$12$166jT.zl5q.NfnZ5rnd6QOuwpzQEi3MG/ko0YFmo6sMG5nJnKLjmC','flpo8h5c','dosen',NULL,'2024-05-21 12:42:17','2024-05-21 12:42:17'),(15,'Efraim Manguluk, S.S., M.Hum','5q3tyu4x@mail.com',NULL,'$2y$12$lQ4JXEN3XMZfnBc7GUb2deEwSD8UCWUTX9Dr37E4mbfNbReAUJjWO','5q3tyu4x','dosen',NULL,'2024-05-21 12:42:17','2024-05-21 12:42:17'),(16,'Ermy D Sumanik, S.Pd., M.Li','kcw3y0ef@mail.com',NULL,'$2y$12$oRBGayo3mfJ0gui6hJRM8eGGgjSp4nKQ85XM0w1LCUNdhd0vvD4oG','kcw3y0ef','dosen',NULL,'2024-05-21 12:42:18','2024-05-21 12:42:18'),(17,'Ermy Dikta Sumanik, S.Pd., M.Li','qm5nej7r@mail.com',NULL,'$2y$12$s.kHPwMYfGzEdVykrvGWpeE1OJbS0QL9DZ/xWfbVsFVX11LzH6zK.','qm5nej7r','dosen',NULL,'2024-05-21 12:42:18','2024-05-21 12:42:18'),(18,'Ermy Dikta Sumanik, S.Pd.,M.Li','5n6imz8j@mail.com',NULL,'$2y$12$AboEYtmmsN279gL3Ib0UlO9ssFSZxaXzq9.TMlaO20gc94lmda.Oa','5n6imz8j','dosen',NULL,'2024-05-21 12:42:19','2024-05-21 12:42:19'),(19,'Evie Warikar, M.Sc','4es35qxq@mail.com',NULL,'$2y$12$PraNwIpSYRcAz/Q1EnKaFuplYf78oZ4LcZnyCDt84jvvJHEicHFc2','4es35qxq','dosen',NULL,'2024-05-21 12:42:19','2024-05-21 12:42:19'),(20,'Faizal Dungio, M.Cs','v4i3r1fj@mail.com',NULL,'$2y$12$H0bPHvLyVlDqjhbGEql/1ufTZcNN0fnhQiKmOKSLInROyfDTnFnvK','v4i3r1fj','dosen',NULL,'2024-05-21 12:42:19','2024-05-21 12:42:19'),(21,'Fegie Y Wattimena, ST., M,Kom','vod40e0b@mail.com',NULL,'$2y$12$3PEINEK5uxpBkYylQ3/xhu.2VQ5sYK1lPKBNkmGVzWNJR3oREGWxa','vod40e0b','dosen',NULL,'2024-05-21 12:42:20','2024-05-21 12:42:20'),(22,'Fence George Aiwoy, S.T., M.T','dn9fwyum@mail.com',NULL,'$2y$12$LA3Mu1.1WgonjUs5CK6i3eyQguGhrvaLz3jaF0RZYG5YgyhUKQTsm','dn9fwyum','dosen',NULL,'2024-05-21 12:42:20','2024-05-21 12:42:20'),(23,'Galuh P W Utami, S.Si.,M.Si','dzwjegdz@mail.com',NULL,'$2y$12$jl.Hc3N1ninKh4X2J6lb5Oi9ByauSpuU07Pq7gTTb9S5cbbwcwxbK','dzwjegdz','dosen',NULL,'2024-05-21 12:42:21','2024-05-21 12:42:21'),(24,'Golden Ringgo S. C. Ayomi, S.Pd., M.Pd','utyktaqy@mail.com',NULL,'$2y$12$mDC.tv2r9ojy.SAkZxMjcOSMlyFvBS1oZ85aJf9RDgG7lUSSKvQNm','utyktaqy','dosen',NULL,'2024-05-21 12:42:21','2024-05-21 12:42:21'),(25,'H. Edy Manurung, S.Si., M.Cs','ykav279n@mail.com',NULL,'$2y$12$KzuaSXWLdbH14rnEG3q6Q.Q1Ww/g.VJYcbLhWVlBu9LsuEx28vdLC','ykav279n','dosen',NULL,'2024-05-21 12:42:21','2024-05-21 12:42:21'),(26,'Halomoan E manurung, S.Si., M,Cs','6j0rx0pi@mail.com',NULL,'$2y$12$p7iWyacedeDL3p8s2ZesU.BMEetD9mEYbK5IjOF5XHzZ75IBq28Ne','6j0rx0pi','dosen',NULL,'2024-05-21 12:42:22','2024-05-21 12:42:22'),(27,'Inggrid Nortalia Kailola, M.Si','x15yfn2e@mail.com',NULL,'$2y$12$QuKivzvRFDpOY3r1U/OlLeBSaW.gRpQMqg84NboEd4fsBtolg8oKq','x15yfn2e','dosen',NULL,'2024-05-21 12:42:22','2024-05-21 12:42:22'),(28,'Ir. Eko Indrianto, M.Eng., IPU','0hp656lr@mail.com',NULL,'$2y$12$zgq3F9q2a4edUuRndB8EfuFwj6IcsT9wQpiVqIgBpz3TRlMJWfuEe','0hp656lr','dosen',NULL,'2024-05-21 12:42:22','2024-05-21 12:42:22'),(29,'Ir. Ivan Ryan Waromi, S.T., MBA','d4d4begz@mail.com',NULL,'$2y$12$I8gEXCJf3vDrGFD35JC1JuBVuOMLLWvJ9JLVri7a7EJThcIeDWJaW','d4d4begz','dosen',NULL,'2024-05-21 12:42:23','2024-05-21 12:42:23'),(30,'Iriani Ira Bukorpioper, S.Si.,M.Si','yblqsfcm@mail.com',NULL,'$2y$12$uJJ9UUQNTRXQtfbgu0ltu.3bIVDEV84BAcReIwn1cDT1/X4DYYj6m','yblqsfcm','dosen',NULL,'2024-05-21 12:42:23','2024-05-21 12:42:23'),(31,'Isak Semuel Kmur, S.Tr., M.Si','3lx1qm9l@mail.com',NULL,'$2y$12$2lgYjMYgJVzZheRL3.skXuswEwUEkvhxtRQLRWZXHaoDo8V0/Vz/K','3lx1qm9l','dosen',NULL,'2024-05-21 12:42:24','2024-05-21 12:42:24'),(32,'Iwan Yaner Ayomi, S.T., M.Eng','9c4lfsfp@mail.com',NULL,'$2y$12$spflDoYUksVPSUwdZHSphOFQnpgHbkuiSVcct19rGCGSRF.1hc3WO','9c4lfsfp','dosen',NULL,'2024-05-21 12:42:24','2024-05-21 12:42:24'),(33,'Jeni B. Karay, S.Ikom., M.Kom','f92xbj8x@mail.com',NULL,'$2y$12$5p9eLPSSmQ3tVCrAicogbu4VTAl8Fod3ndxK7E3vWgZZtkIUfEqMG','f92xbj8x','dosen',NULL,'2024-05-21 12:42:25','2024-05-21 12:42:25'),(34,'Jhon Mampioper, M.Si','3bkzcbak@mail.com',NULL,'$2y$12$2fOA9e5R9hiCEEf5KS9BZuxk2tlDvkGPapLlE7CpZbEl0S4ZL3IMm','3bkzcbak','dosen',NULL,'2024-05-21 12:42:25','2024-05-21 12:42:25'),(35,'Mayko Koibur,MT','il08x7ez@mail.com',NULL,'$2y$12$q7Ay3XwQbkJ6I5yYGItLROVAFMDyR.VbHxnMQYauzhGH8wGK8xH2W','il08x7ez','dosen',NULL,'2024-05-21 12:42:25','2024-05-21 12:42:25'),(36,'Paul Peter A. Antoh, S.T., M.Si','hc1gb99s@mail.com',NULL,'$2y$12$jOS7KnEzI6sYkxDJSQwLo.Ywv4Sy7ikbyTML6OC9vso3HSU3v7zQK','hc1gb99s','dosen',NULL,'2024-05-21 12:42:26','2024-05-21 12:42:26'),(37,'Paulus Mandibodibo,S.Hut., MForSc&Mgt.IPM','au1pbhyv@mail.com',NULL,'$2y$12$nuZtL4K8MjrT7xvBnxWPq.d8gJT5I7nxz6FbwCnQqlnu7RXbdILMy','au1pbhyv','dosen',NULL,'2024-05-21 12:42:26','2024-05-21 12:42:26'),(38,'Pearl Salawati Y. Waromi, S.Si., M.Si','wxj818ez@mail.com',NULL,'$2y$12$M4zReCPjjDbZPFiHxoQJCeEKAogTZgw0x6llf4LdLB2weTyb0GAOO','wxj818ez','dosen',NULL,'2024-05-21 12:42:27','2024-05-21 12:42:27'),(39,'Rahmat Indrajati, M.T','5dk1fv5w@mail.com',NULL,'$2y$12$kEu8v.xlh0Qm6tBUsBSqDePv1iOMLkVE3QccYdh/oLtZr6AUxGXJ6','5dk1fv5w','dosen',NULL,'2024-05-21 12:42:27','2024-05-21 12:42:27'),(40,'Reni Koibur, M.Cs','tsdn85q6@mail.com',NULL,'$2y$12$bqvLXOtgs9lIKtuwgs55EOW8x/p7pq4GpddFr8NqNCBRGBB1eepHO','tsdn85q6','dosen',NULL,'2024-05-21 12:42:27','2024-05-21 12:42:27'),(41,'Reni Koibur, S.Si., M.Cs','ft0h3was@mail.com',NULL,'$2y$12$nIKe9eCmE5zpajrE4Zn.XObQCnVQ0KEmTx35xrAXa6wl75M38VEQe','ft0h3was','dosen',NULL,'2024-05-21 12:42:28','2024-05-21 12:42:28'),(42,'Rizki T Rakhim, M.Cs','vneudwfu@mail.com',NULL,'$2y$12$gQl/6GO1VcETE1GxBusmtOokOVvZwyJYc9B2suyeRIEhQINxrk09q','vneudwfu','dosen',NULL,'2024-05-21 12:42:28','2024-05-21 12:42:28'),(43,'Robianus Hara, S.T., M.Eng','52uy9qa4@mail.com',NULL,'$2y$12$uTGUiL0rmKYluJQxu.UixOlEklfW0kDvYM25f/YI6Wb6WjZt7l5u.','52uy9qa4','dosen',NULL,'2024-05-21 12:42:29','2024-05-21 12:42:29'),(44,'Selmi Yohana Stefani, S.Pd.,M.Pd','f9s24zty@mail.com',NULL,'$2y$12$ABRJo5/jzyAg..sMlAdVG.EyCYhYE0RiuRYDMNMUdQBfmxFQQu./O','f9s24zty','dosen',NULL,'2024-05-21 12:42:29','2024-05-21 12:42:29'),(45,'Sireme Oyaitow, S.Si. M.Kom','8o37kxnj@mail.com',NULL,'$2y$12$sO4d5SLrHAfnV2ZfXrXwWOx0QMRL/DzE5NppLm10U5xI.iw3gK7ya','8o37kxnj','dosen',NULL,'2024-05-21 12:42:30','2024-05-21 12:42:30'),(46,'Sonny Aribowo, S.T., M.T','usxt87kn@mail.com',NULL,'$2y$12$NMwJFq9PapsYlgGTo7BDI.a05kVS9t7Vh8F8rrWTr8trjuoI2nYBe','usxt87kn','dosen',NULL,'2024-05-21 12:42:30','2024-05-21 12:42:30'),(47,'Supianto, M.Cs','iezkcdnr@mail.com',NULL,'$2y$12$Dt5i6p9etVqtYL/2LO6Btu9w8cmjrFDYmPqFpXluVyoWkaGNeYZPu','iezkcdnr','dosen',NULL,'2024-05-21 12:42:30','2024-05-21 12:42:30'),(48,'Theopilus Korneles Tipawael , S.T., M.Pd','9doxnmhd@mail.com',NULL,'$2y$12$TirElI7fIVj5K5jwCeR4Tey.HaTx6OOYrIuOh0K4GWazbpwaz.Ebi','9doxnmhd','dosen',NULL,'2024-05-21 12:42:31','2024-05-21 12:42:31'),(49,'Tomi Nelambo, M.Si','r38sdo5x@mail.com',NULL,'$2y$12$pHCPcPTZQvjxshAyfvvCwO/UFBKDkOWqkAyTHJckDwcaz6Dyuozly','r38sdo5x','dosen',NULL,'2024-05-21 12:42:31','2024-05-21 12:42:31'),(50,'Yafet Wetipo, M.Si','zit6owo5@mail.com',NULL,'$2y$12$9g2DwrBLN.SyXb0dEn0l9uc4R1gr3P3SJiFD6OkFGD5F8/4nCwR4K','zit6owo5','dosen',NULL,'2024-05-21 12:42:32','2024-05-21 12:42:32'),(51,'Yohan M. Indey, S.SI.M.Kom','g21gtjls@mail.com',NULL,'$2y$12$fKmgluaQfP4LFZr6usraZebrzbpWd9lwduCfLeQbHVkdZhs9cZLAe','g21gtjls','dosen',NULL,'2024-05-21 12:42:32','2024-05-21 12:42:32'),(52,'Yosep Boari, S.Si., M.Si','8agth7kn@mail.com',NULL,'$2y$12$SydU8Uxv0GP3WZPAR9cQhOjKu0ggL6LlXSbMyouwb9YdgF0DKLA.2','8agth7kn','dosen',NULL,'2024-05-21 12:42:32','2024-05-21 12:42:32'),(53,'Yulindra Numberi, S.Si., M.Si','0ivbcx0x@mail.com',NULL,'$2y$12$YuApqqRPaL6E7YB2bIM.9.dsRHg4nMe99LnkivfEwWqhOGa6LHvt.','0ivbcx0x','dosen',NULL,'2024-05-21 12:42:33','2024-05-21 12:42:33');
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

-- Dump completed on 2024-07-10 11:02:04
