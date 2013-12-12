-- MySQL dump 10.13  Distrib 5.1.71, for Win64 (unknown)
--
-- Host: localhost    Database: scoreshared
-- ------------------------------------------------------
-- Server version	5.1.71-community

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
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` longblob NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `mime` varchar(45) DEFAULT NULL,
  `owner_id` int(10) unsigned DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_file_user` (`owner_id`),
  CONSTRAINT `fk_file_user` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (4,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0h\0\0\0h\0\0\0µ¡\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0tIMEÝ\n2ŒŒ\0\00IDATxÚí›_SWÆ	$$‚bÅ¿j[­­igœvoì7ØO´—ùD¹ï7™ÞuìŒøÔŠ\n(\"B’ôbŸÓRE+aØÕ÷7³3IÈ&›}Îó¾ïyÏÃ0Ã0Ã0Ã0Ã0Ã0Ã0Ã0Ã0Ã0Ã0Ã0ãó ŒÂ(8´óƒ¬Éžl2iq@µRó_Ë\0c@È#Þ€ë;@h\0­j¥ÖÝëó’J.Åƒk8	|\rœŽè5$Ì&°,\0/€-sÐ;GÏóÀ¤Ä™(ï	ôÖèo‰´Ô>/ÑNÊ¥Ð5³å\np\n—0£\nsèñPÎ\0«À#à>04ÍAÃwSFNù	¸\n\\JrÅ°\rt¼WÐß\'ô·%‰ó‡µ“\'åR\"Î(p¸|\\Pq°ÜÏ•w2\nwg€9¹Í=ï\0oôžgÎŠ„!W¾¹¤=lH˜;ÀCàEµR«KÐ2°¦P6ªsËÊ[ß*G­;,íŸqàE¹à¡Ä¹­b ã½K9§¡’»!\'•$r¸¼6\r¯8˜Ö1&w,(é/W+5_ª•Zh‡Qð\\¿1§‚bJ¹é¸„¶NÂ‹™¼nî¨ñx2(Î€P;À½·©ß›•`cihû¤µÕ³lî%Ž\'RWs¢4þÞ´\\°Ë#M=Î…ÿá€Q¹°ç	ÜJC«\'›\"Ç¼UåÖÖ\rŸ\0&Â(Èú_´0\n2aôÞœ\n‰--sÐðh¯tl+M\'$Ö^Î™Vy](/ul§á‡çR&ÐKÝì\"pVeòêó™‚æ@3:§	¬èœ–ï¼¤Î‡Òä —žãê&ÌI„÷QT÷Áµ…\ZÄMÓå´„¸4:Èu¦ÔU˜\r£ ©›ßñB[IžÕ¼gTâ®èhy•žå ý rzM¹î@F9è:ð‹&¢§\0øUïqóŸm¹pU¢\'ž‘$]L\\¾1ÃÝ›Oÿó·»7ŸrùÆLF9h\\…¼$XI‚Ì?(÷”$è:°üY­Ô6Þõ{}¿…¸c\r¸¥ùÌÀWÄMÐY=n{­¡’×yX#^jøK.L\r™¤8ç]¹@ËnAn„xÙ`Z‰ÿšïxÑÀ…ìž—²Ê_óÄý»gÄÍÖ…¼zµRkÌõ˜ƒvß¤ñ\ZÐà¼B×„Q”X=¯CÐõžûù5C¼D~¸£Ý’@+h¹\"Œ‚U5XÍA\Z©z­,wÌJ 9åž<PW¡P—(9‰‘¡¿›§ëµuœh9_–»ÖˆWVç‰—&V‰û{½$9)—0× 6«\nì¢rIIye[ájYó™Ž\\U”Hn7ëÙuBà$pN%ú1{Žxmé`1Œ‚­$¹éPzÇÈ<\"q®ßÉ5\rõÎVÔ9Xöæ2#sSVŸÿJ%ùIÍNIüM]Ã#õý‘ƒ’T$ŒÊ1¿)¬Õèÿ7W(ÁoI´¶çŒ‘â ë=œV¸F«ÛS÷³Ü´¡p÷;°%%Ä©Lž•H\'èïk[\0wª•ÚÚ¾ïu®ñZ&Þ§pBßý\0xFÁëÁêîK¨HÏÛ²@¼cç6ñŽaïeÛ”3Ñ`¸.±®È·Tí™@šPžÓQ¤¿ç`Xô÷Uï§ºòÏÓ¹ëatôWUDœ—0÷’ PRzq9å)¯”^\0\rŠs\0…Ê¦Ú@-…Úãô›«–ƒ¼R”“Üœ&O¼¬ÝÐæ½ª¿Oª\ZÃ(È)¤Nª€ÈÐo¸fM Ýø%qY½¶<ñþµ•úÎ)à²òŽ›Àö&º&nÌ†bþ¸&¦t}¹0\nŽ«Hèh”êô §ÃíÝ>%\\×»¥ðú†Ý!¿xÜæö£*µËô7žÑæ¨Î(„¹®·[²¨«bLÌ¾í¤ÔTÉë6\'fè¯šžôòÒ0q¡¬­£®öÑ}úM ÑP?l[Éº­ð3±Ïö!¹N¸çæ?K&ÐîyIh†Q°¤pÓ$^X›”“²ïiÝì·ÅåôF=–ª•Zc?ó­ÏµŠs¹è¡Fð˜®ï ä\rå¹&	ûï»DäÔ.ýŸ‡~=I™ \Z†a†a†a†a†a†a†a†a†a†a†a†a†‘NþÝ´±ñü\0\0\0\0IEND®B`‚','foto-jogador.png',15956,'2012-06-05 00:00:00','text',NULL,'\0'),(7,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\04\0\0\04\0\0\0Åxë\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0\"iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmp:CreatorTool=\"Adobe Photoshop CS5 Macintosh\" xmpMM:InstanceID=\"xmp.iid:E94F0620C4E811E2B287FCA54FD79914\" xmpMM:DocumentID=\"xmp.did:E94F0621C4E811E2B287FCA54FD79914\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:979B4EA5C4E811E2B287FCA54FD79914\" stRef:documentID=\"xmp.did:979B4EA6C4E811E2B287FCA54FD79914\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>šh½\0\0¹IDATxÚì™Ï+aÇw¤E¢”8i³Ië )7m6QR¸ºˆÜ•ƒü.®®h­\\$¡¤6?rä ö°‰\"»j|ßúNMÛLfj¶ÞwzžúôÌ¾ïÌ»ó™wÞçm[Ë¶íDœ¢!³!!!!!!\nQ2½9æ×Õ² —Ÿ_Á)xö:9¿}¥‡OäÀTM[;`OÛòˆÊüªnøzRt”8[F¬!gf\n¼éwP\'à}Ùz<Ðz	u2Ÿyô9mÍ Å¡2s«G_s|™\"ôÈ<äÑ7ÌüÀ5f„P‘y$]íê5›äñ­IUî	|‚°€æÙöã’6B¨Êr½R`£¦ÿ|› ÔfAæŸóæÈg¯¤£P?Xu­™\"éæ÷¼\ng/ÉÍW‰€¾¦Úõ€uŽ§û¾«tûÅ9Hƒe°¶¢˜©¨ª\\Ž2Ç`7€Œ÷<_];£SÙN¹žzØxaNë$äl,aŠÈ\"+:­¡Kn˜™\0Î/®u*p,U¹ÚB^ûÁŸù(nÄ’¿$EH„DH„DH„DH„DH„DH„â\0ÁuL|~ôÇ\0\0\0\0IEND®B`‚','foto-jogador.png',6464,'2012-06-05 00:00:00','text',NULL,'\0');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitation`
--

DROP TABLE IF EXISTS `invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `hashExpirationDate` datetime DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `message` varchar(120) DEFAULT NULL,
  `response` int(10) DEFAULT NULL,
  `type` int(10) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitation`
--

LOCK TABLES `invitation` WRITE;
/*!40000 ALTER TABLE `invitation` DISABLE KEYS */;
INSERT INTO `invitation` VALUES (1,NULL,NULL,NULL,NULL,NULL,0,NULL,'\0'),(2,'2013-12-11 15:15:28','52d3bcf0cfa32d25ed83760c1165899c','2013-12-13 15:15:28',NULL,'Ciao Rodrigo Bittencourt! Posso condividere i miei score con te?',NULL,1,'\0'),(3,NULL,NULL,NULL,NULL,NULL,0,NULL,'\0'),(4,'2013-12-11 16:07:18','5559860383852f3855a9834379149af6','2013-12-13 16:07:18','rodrigo.bittencourt@mail.com','Ciao Rodrigo Bittencourt! Posso condividere i miei score con te?',NULL,1,'\0'),(5,NULL,NULL,NULL,NULL,NULL,0,NULL,'\0'),(6,'2013-12-11 16:15:17','5c3eac597dafe3ac848ceb489c24c332','2013-12-13 16:15:17','rodrigo.bittencourt@mail.com','Ciao Rodrigo Bittencourt! Posso condividere i miei score con te?',0,1,'\0'),(7,NULL,NULL,NULL,NULL,NULL,0,NULL,'\0'),(8,NULL,NULL,NULL,NULL,NULL,0,NULL,'\0'),(9,NULL,NULL,NULL,NULL,NULL,0,NULL,'\0');
/*!40000 ALTER TABLE `invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `association_id` int(10) unsigned DEFAULT NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `invitation_id` int(10) unsigned DEFAULT NULL,
  `shouldNotReinvite` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_association_owner` (`association_id`,`owner_id`),
  KEY `fk_player_association` (`association_id`),
  KEY `fk_player_owner` (`owner_id`),
  KEY `fk_player_invitation_idx` (`invitation_id`),
  CONSTRAINT `fk_player_association` FOREIGN KEY (`association_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_player_invitation` FOREIGN KEY (`invitation_id`) REFERENCES `invitation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_player_owner` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (71,'Bernardo Roubach',22,22,5,NULL,'\0'),(72,'Rodrigo Bittencourt',24,22,6,NULL,'\0'),(74,'Bernardo Roubach',22,24,8,NULL,'\0'),(75,'Rodrigo Bittencourt',24,24,9,NULL,'\0');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerinstance`
--

DROP TABLE IF EXISTS `playerinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerinstance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(10) unsigned NOT NULL,
  `approvalResponse` int(10) DEFAULT NULL,
  `revisionMessage` varchar(2000) DEFAULT NULL,
  `revisionDate` datetime DEFAULT NULL,
  `revisionTime` datetime DEFAULT NULL,
  `revisionSet1Left` int(10) DEFAULT NULL,
  `revisionSet1Right` int(10) DEFAULT NULL,
  `revisionSet2Left` int(10) DEFAULT NULL,
  `revisionSet2Right` int(10) DEFAULT NULL,
  `revisionSet3Left` int(10) DEFAULT NULL,
  `revisionSet3Right` int(10) DEFAULT NULL,
  `revisionSet4Left` int(10) DEFAULT NULL,
  `revisionSet4Right` int(10) DEFAULT NULL,
  `revisionSet5Left` int(10) DEFAULT NULL,
  `revisionSet5Right` int(10) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_playerpermission_player` (`player_id`),
  CONSTRAINT `fk_playerpermission_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerinstance`
--

LOCK TABLES `playerinstance` WRITE;
/*!40000 ALTER TABLE `playerinstance` DISABLE KEYS */;
INSERT INTO `playerinstance` VALUES (13,72,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(14,71,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0');
/*!40000 ALTER TABLE `playerinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerinstancecomment`
--

DROP TABLE IF EXISTS `playerinstancecomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerinstancecomment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) unsigned NOT NULL,
  `playerInstance_id` int(10) unsigned DEFAULT NULL,
  `comment` varchar(10000) NOT NULL,
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_playerinstancecomment_owner` (`owner_id`),
  KEY `fk_playerinstancecomment_playerinstance_idx` (`playerInstance_id`),
  CONSTRAINT `fk_playerinstancecomment_owner` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_playerinstancecomment_playerinstance` FOREIGN KEY (`playerInstance_id`) REFERENCES `playerinstance` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerinstancecomment`
--

LOCK TABLES `playerinstancecomment` WRITE;
/*!40000 ALTER TABLE `playerinstancecomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerinstancecomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `academy` varchar(255) DEFAULT NULL,
  `leftHanded` bit(1) DEFAULT NULL,
  `coach_id` int(10) unsigned DEFAULT NULL,
  `showContactInfoToFriends` bit(1) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `avatarHash` varchar(255) DEFAULT NULL,
  `avatar_id` int(10) unsigned DEFAULT NULL,
  `smallAvatar_id` int(10) unsigned DEFAULT NULL,
  `style` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `sport` int(10) NOT NULL,
  `signupProcessCompleted` bit(1) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profile_file_2` (`smallAvatar_id`),
  KEY `fk_profile_file_1` (`avatar_id`),
  CONSTRAINT `fk_profile_file_1` FOREIGN KEY (`avatar_id`) REFERENCES `file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_file_2` FOREIGN KEY (`smallAvatar_id`) REFERENCES `file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (21,'Belo Horizonte','Brasil','Lob TÃªnis','\0',NULL,'','31 96862253',NULL,NULL,NULL,'','',0,'','\0');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `set1Left` int(10) DEFAULT NULL,
  `set1Right` int(10) DEFAULT NULL,
  `set2Left` int(10) DEFAULT NULL,
  `set2Right` int(10) DEFAULT NULL,
  `set3Left` int(10) DEFAULT NULL,
  `set3Right` int(10) DEFAULT NULL,
  `set4Left` int(10) DEFAULT NULL,
  `set4Right` int(10) DEFAULT NULL,
  `set5Left` int(10) DEFAULT NULL,
  `set5Right` int(10) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `winnerDefined` bit(1) NOT NULL,
  `owner_id` int(10) unsigned DEFAULT NULL,
  `coach_id` int(10) unsigned DEFAULT NULL,
  `sport` int(10) NOT NULL,
  `confirmed` bit(1) DEFAULT b'0',
  `deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `fk_score_owner` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (7,'0013-12-11 00:00:00',6,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',22,NULL,0,NULL,'\0');
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_playerinstance_left`
--

DROP TABLE IF EXISTS `score_playerinstance_left`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score_playerinstance_left` (
  `score_id` int(10) unsigned NOT NULL,
  `playerinstance_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`score_id`,`playerinstance_id`),
  KEY `fk_score_playerleft_score` (`score_id`),
  KEY `fk_score_playerleft_playerpermission` (`playerinstance_id`),
  CONSTRAINT `fk_score_playerleft_playerpermission` FOREIGN KEY (`playerinstance_id`) REFERENCES `playerinstance` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_score_playerleft_score` FOREIGN KEY (`score_id`) REFERENCES `score` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_playerinstance_left`
--

LOCK TABLES `score_playerinstance_left` WRITE;
/*!40000 ALTER TABLE `score_playerinstance_left` DISABLE KEYS */;
INSERT INTO `score_playerinstance_left` VALUES (7,13);
/*!40000 ALTER TABLE `score_playerinstance_left` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_playerinstance_right`
--

DROP TABLE IF EXISTS `score_playerinstance_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score_playerinstance_right` (
  `score_id` int(10) unsigned NOT NULL,
  `playerinstance_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`score_id`,`playerinstance_id`),
  KEY `fk_score_playerright_score` (`score_id`),
  KEY `fk_score_playerright_playerpermission` (`playerinstance_id`),
  CONSTRAINT `fk_score_playerright_playerpermission` FOREIGN KEY (`playerinstance_id`) REFERENCES `playerinstance` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_score_playerright_score` FOREIGN KEY (`score_id`) REFERENCES `score` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_playerinstance_right`
--

LOCK TABLES `score_playerinstance_right` WRITE;
/*!40000 ALTER TABLE `score_playerinstance_right` DISABLE KEYS */;
INSERT INTO `score_playerinstance_right` VALUES (7,14);
/*!40000 ALTER TABLE `score_playerinstance_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `avatarUrl` varchar(45) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL COMMENT 'because of social network sign up, this field cannot be marked as not null',
  `password` varchar(32) DEFAULT NULL COMMENT 'because of social network sign up, this field cannot be marked as not null',
  `gender` char(1) DEFAULT NULL COMMENT 'because of social network sign up, this field cannot be marked as not null',
  `profile_id` int(10) unsigned DEFAULT NULL,
  `lastAccess` datetime DEFAULT NULL,
  `beforeLastAccess` datetime DEFAULT NULL,
  `dateAccountWasClosed` datetime DEFAULT NULL,
  `reasonAccountWasClosed` varchar(5000) DEFAULT NULL,
  `forgotPasswordInstructionsHash` varchar(32) DEFAULT NULL,
  `forgotPasswordInstructionsDate` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_profile` (`profile_id`),
  CONSTRAINT `FK_user_profile` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (22,'Bernardo','Roubach','broubach@yahoo.com.br',NULL,'1981-04-28 16:14:19','5670f434940508df14a1825a4c144ad2','M',21,'2013-12-11 17:13:56','2013-12-11 16:14:19',NULL,NULL,NULL,NULL,'\0'),(23,'Rodrigo','Bittencourt','rodrigo.bittencourt@mail.com',NULL,'2013-01-01 16:16:32','8174ffa9a255861094a166930673fa11','M',NULL,'2013-12-11 16:22:37',NULL,NULL,NULL,NULL,NULL,'\0'),(24,'Rodrigo','Bittencourt','rodrigo.bittencourt@mail.com',NULL,'2013-01-01 16:22:27','8174ffa9a255861094a166930673fa11','M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userconnection`
--

DROP TABLE IF EXISTS `userconnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userconnection` (
  `userId` varchar(255) NOT NULL,
  `providerId` varchar(255) NOT NULL,
  `providerUserId` varchar(255) NOT NULL DEFAULT '',
  `rank` int(10) NOT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `profileUrl` varchar(512) DEFAULT NULL,
  `imageUrl` varchar(512) DEFAULT NULL,
  `accessToken` varchar(255) NOT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `refreshToken` varchar(255) DEFAULT NULL,
  `expireTime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`userId`,`providerId`,`providerUserId`),
  UNIQUE KEY `UserConnectionRank` (`userId`,`providerId`,`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userconnection`
--

LOCK TABLES `userconnection` WRITE;
/*!40000 ALTER TABLE `userconnection` DISABLE KEYS */;
/*!40000 ALTER TABLE `userconnection` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-11 17:16:59
