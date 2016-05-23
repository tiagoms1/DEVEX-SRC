-- MySQL dump 10.13  Distrib 5.6.27, for Win64 (x86_64)
--
-- Host: localhost    Database: ticketsgalaxy_theatre
-- ------------------------------------------------------
-- Server version	5.6.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `fi_cd_evento_even`
--

DROP TABLE IF EXISTS `fi_cd_evento_even`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fi_cd_evento_even` (
  `ID_EVEN_CD_EVENTO` int(11) NOT NULL,
  `EVEN_CD_TIPO` varchar(50) DEFAULT NULL,
  `EVEN_DH_EVENTO` varchar(50) DEFAULT NULL,
  `EVEN_DS_DESCRICAO` varchar(255) DEFAULT NULL,
  `EVEN_DS_LOCAL` varchar(50) DEFAULT NULL,
  `EVEN_DS_TITULO` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_EVEN_CD_EVENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fi_cd_evento_even`
--

LOCK TABLES `fi_cd_evento_even` WRITE;
/*!40000 ALTER TABLE `fi_cd_evento_even` DISABLE KEYS */;
INSERT INTO `fi_cd_evento_even` VALUES (1,'1','01/12/2016','Jogo novo. Descricao 123 123 123.','Alianz Park','15 de Piri Piri x Jau'),(2,'1','01/02/2016','Classico do brasileirao! Voce nao pode perder!','Beira Rio','Santos x Gremio'),(3,'1','20/03/2016','Campeonato Paulista. Pela primeira vez na historia o Palmeiras enfrenta o 15 de Jau. Partida imperdivel.','Alianz Park','15 de Jau x Palmeiras'),(4,'1','18/09/2016','Campeonato Brasileiro. Segunda rodada do campeonato com replay de jogos classicos.','Morumbi','Cruzeiro x Juventus'),(5,'2','14/11/2016','Show novo. Descricao 123 123','Ibirapuera','Metallica'),(6,'2','10/01/2016','Uma das melhores bandas de Hard Rock de todos os tempos em apresentacao unica em Sao Paulo!','Carioca Club','Uriah Heep'),(7,'2','11/01/2016','Eles ja vieram diversas vezes para o Brasil, mas esse show sera cheio de surpresas!','Alianz Park','Iron Maiden'),(8,'2','18/01/2016','Compre aqui com exclusividade e ganhe uma camiseta oficial do fa clube e ainda concorra a premios!','Bar do Samba','Arlindo Cruz'),(9,'2','31/12/2016','Voce nao pode perder, um show inedito do Rei! Show da virada em Copacabana!!! Imperdivel!','Copacabana','Roberto Carlos'),(10,'2','15/07/2016','Em apresentacao intimista, inaugurando sua carreira solo.','Sesc Pompeia','Chimbinha'),(11,'2','10/08/2016','Muita festa e animacao. Simplesmente imperdivel.','Maracana','Ivete Sangalo'),(12,'3','27/03/2016','Teatro novo. Descricao 123 123 123.','Sesc Pinheiros','O Coice'),(13,'3','27/03/2016','Baseado na musica de mesmo nome, de gente que entra e gente que sai.','Sesc Pompeia','A Casa de Irene'),(14,'3','20/04/2016','Drama grego que conta a historia da mulher que matou seus filhos e depois se matou.','Teatro Gazeta','Memorias Esquecidas'),(15,'4','11/02/2016','Cinema novo. Descricao 123 123 123','Shopping Tatuape','A Mosca'),(16,'4','01/12/2016','Um poderoso chefe de uma tradicional familia italiana do seculo XIX.','Shopping Bourbon','Os Mafiosos'),(17,'4','27/07/2016','Sequencia inedita do classico do cinema. Com cenas de tirar o folego.','Shopping Tatuape','Laranja Mecanica 2'),(18,'4','22/08/2016','O filme mais esperado do ano. Com cenas extras e entrevistas exclusivas com o diretor.','Shopping Tatuape','Star Wars 3D'),(19,'5','11/09/2016','Luta nova. Descricao 123 123 123','Ibirapuera','UFC 555'),(20,'5','11/09/2016','Luta historica! Duas lendas do UFC se enfrentando!','Ibirapuera','UFC 225');
/*!40000 ALTER TABLE `fi_cd_evento_even` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fi_cd_ticket_tick`
--

DROP TABLE IF EXISTS `fi_cd_ticket_tick`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fi_cd_ticket_tick` (
  `ID_TICK_CD_TICKET` int(11) NOT NULL,
  `TICK_DS_DESCRICAO` varchar(50) DEFAULT NULL,
  `TICK_NR_DISPONIVEL` int(11) DEFAULT NULL,
  `TICK_NR_VALOR` double DEFAULT NULL,
  `ID_EVEN_CD_EVENTO` int(11) NOT NULL,
  PRIMARY KEY (`ID_TICK_CD_TICKET`),
  KEY `FK_29kvakvy78ndpbo8pmdf8sjxa` (`ID_EVEN_CD_EVENTO`),
  CONSTRAINT `FK_29kvakvy78ndpbo8pmdf8sjxa` FOREIGN KEY (`ID_EVEN_CD_EVENTO`) REFERENCES `fi_cd_evento_even` (`ID_EVEN_CD_EVENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fi_cd_ticket_tick`
--

LOCK TABLES `fi_cd_ticket_tick` WRITE;
/*!40000 ALTER TABLE `fi_cd_ticket_tick` DISABLE KEYS */;
INSERT INTO `fi_cd_ticket_tick` VALUES (1,'Setor 1',3,100,1),(2,'Setor 2',3,70,1),(3,'Setor 3',3,40,1),(4,'Setor 1',3,100,2),(5,'Setor 2',3,70,2),(6,'Setor 3',3,40,2),(7,'Setor 1',3,100,3),(8,'Setor 2',3,70,3),(9,'Setor 3',3,40,3),(10,'Setor 1',3,100,4),(11,'Setor 2',3,70,4),(12,'Setor 3',3,40,4),(13,'Premium',3,900,5),(14,'Cadeira Azul',3,300,5),(15,'Camarote',3,250,5),(16,'Pista',3,150,5),(17,'Premium',3,900,6),(18,'Cadeira Azul',3,300,6),(19,'Camarote',3,250,6),(20,'Pista',3,150,6),(21,'Premium',3,900,7),(22,'Cadeira Azul',3,300,7),(23,'Camarote',3,250,7),(24,'Pista',3,150,7),(25,'Premium',3,900,8),(26,'Cadeira Azul',3,300,8),(27,'Camarote',3,250,8),(28,'Pista',3,150,8),(29,'Premium',3,900,9),(30,'Cadeira Azul',3,300,9),(31,'Camarote',3,250,9),(32,'Pista',3,150,9),(33,'Premium',3,900,10),(34,'Cadeira Azul',3,300,10),(35,'Camarote',3,250,10),(36,'Pista',3,150,10),(37,'Premium',3,900,11),(38,'Cadeira Azul',3,300,11),(39,'Camarote',3,250,11),(40,'Pista',3,150,11),(41,'Inteira',3,200,12),(42,'Meia',3,100,12),(43,'Inteira',3,200,13),(44,'Meia',3,100,13),(45,'Inteira',3,200,14),(46,'Meia',3,100,14),(47,'Inteira',3,40,15),(48,'Meia',3,20,15),(49,'Inteira',3,40,16),(50,'Meia',3,20,16),(51,'Inteira',3,40,17),(52,'Meia',3,20,17),(53,'Inteira',3,40,18),(54,'Meia',3,20,18),(55,'VIP',3,4000,19),(56,'Premium',3,1000,19),(57,'Camarote 1',3,500,19),(58,'Camarote 2',3,400,19),(59,'Cadeira',3,200,19),(60,'VIP',3,4000,20),(61,'Premium',3,1000,20),(62,'Camarote 1',3,500,20),(63,'Camarote 2',3,400,20),(64,'Cadeira',3,200,20);
/*!40000 ALTER TABLE `fi_cd_ticket_tick` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fi_cd_usuario_usua`
--

DROP TABLE IF EXISTS `fi_cd_usuario_usua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fi_cd_usuario_usua` (
  `ID_USUA_CD_USUARIO` int(11) NOT NULL,
  `USUA_DS_LOGIN` varchar(10) DEFAULT NULL,
  `USUA_DS_NOME` varchar(50) DEFAULT NULL,
  `USUA_DS_PWD` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_USUA_CD_USUARIO`),
  UNIQUE KEY `UK_kw2i8r28r14m6y61i3d4e9uo4` (`USUA_DS_LOGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fi_cd_usuario_usua`
--

LOCK TABLES `fi_cd_usuario_usua` WRITE;
/*!40000 ALTER TABLE `fi_cd_usuario_usua` DISABLE KEYS */;
/*!40000 ALTER TABLE `fi_cd_usuario_usua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fi_ng_numeradora_nume`
--

DROP TABLE IF EXISTS `fi_ng_numeradora_nume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fi_ng_numeradora_nume` (
  `NUME_DS_ENTITY` varchar(50) NOT NULL,
  `NUME_NR_APPBUFFER` int(11) NOT NULL,
  `NUME_NR_NEXTVAL` int(11) NOT NULL,
  PRIMARY KEY (`NUME_DS_ENTITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fi_ng_numeradora_nume`
--

LOCK TABLES `fi_ng_numeradora_nume` WRITE;
/*!40000 ALTER TABLE `fi_ng_numeradora_nume` DISABLE KEYS */;
/*!40000 ALTER TABLE `fi_ng_numeradora_nume` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-23 18:20:01
