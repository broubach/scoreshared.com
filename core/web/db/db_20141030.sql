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
) ENGINE=InnoDB AUTO_INCREMENT=2258 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (4,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0h\0\0\0h\0\0\0��\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0fiTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:01801174072068118D4AF3673F9D521C\" xmpMM:DocumentID=\"xmp.did:5BF09B48A08011E3BD2B86528F414CE7\" xmpMM:InstanceID=\"xmp.iid:5BF09B47A08011E3BD2B86528F414CE7\" xmp:CreatorTool=\"Adobe Photoshop CS5 Macintosh\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:02801174072068118D4AF3673F9D521C\" stRef:documentID=\"xmp.did:01801174072068118D4AF3673F9D521C\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>����\0\0�IDATx��]\\S�\Z�dDD�*n\\�Rq�z*�>�(�D��=��n]�U�*u��ֽ�[A���nD�* {#!	$!��K�BI��w~�������?�<�w�Qqq1e(�[�!0\0d(�\0� CQVXU����Q����t�@^K�������TF\"��ɇ���CӔ�b�-yp�H$������0�Ed��#]^A[\n�铳)��bi��D\"���te�Y�F��^\'���ɹ�,,���I����2P�\0d��1�E���|�\r����ʪ�ؘ0��\'��\0�N�����BK.���f���&S]�+��\n^������뼏/>�LU�j��t Dg���P�{��)vr\\\\|Z\\��46�]lkۮq�͛6m���f��D�ܵ�����	UI/�J��@5�>F5y����7�s���Ĥ�ʁ*���[�j2�yP�sG��գ�9~�)���s��-Xr��Gn\0�㔳��b�X��\"(���-�,0	��@M����?A�ʆj��¢~��7O5r�XP2�J~S�s�Ҋ�Sf��[x�\"@ʕ���XE瓓S2�ܗ��]��j��Pc��\r�+�#0xx�TáZ,�?{��oߠ�����{xz�ܲm�In\0�,�ʹB�\\	z=j����}EB�G����Vr Qc��\\ۋ�\'��:u�K�N�۷.㧸�?x�2IX��\0��fbl�~�\\��k�o���0�<�r�9�D\"ԫ*/е���*�����6�ӿ�&�����9����h ����y�]�s����ƺ�p�AgvڬU�L&9T!R_Ǿ3_FEߠ�e��v�w������Z�PAAa?��c������i3���!Z��(�`��k\\���Hq>fnzzF$�<h�z���e�c���T������\Z;n�9\"o�T2���[\0N���Z/*öx\\�5��π�FD�O��B�=(N���Դ�/F�C�����*S;�H6m}����:��>�{n֬imS�V�p�s��9`4zm-��5I\r�F�����1���v��Ѩ�����I�g$������s���%��j�ȳ��G�=�眜z�&l��w\0uS���hɊ���W�?�HE&N�����P��Mk�6�\Z}��h��i ��3�����qZZz<�䪢JW��Ĥ��l6�5v��.���+���*6@������\'���]\ZU�a2�s[|V&��)�wsthf���	��b�iphPz���������g�yA6׬Y�AuQ��+����M����֖A�,ȴqO(��\"�#�>333�X�(\0*#_�����T%��5��H��\\.�K���W\0�y}x��\n���ˋ�e=,&G��8�D������Aw�X[���㕱��ry1G�\0�DQ���6u��QZ.\\.��b[ ���*�+��\"�_�ڊ*Y�Ӫw��㖱����K�Z�\0r>&��{/r�~}:jS�}�3J������(����\n |`И^�6�:���<K��j�J��lv7ž���U�������\rD*�ձԊ�T���}��E۬@[ʋV���P��=�!��T��1hԮ��\'OCR�v)�;���O��۵m?a�W�b�4�=�z��Ӟ�����ҩ�\0�+z�Ѣ���|��Z���f�ʭEE�$��%��5�=C$�(�u���:w��phN¤j^��B��A��A���O�\Z�ggg��;�͞	M4�r���TNńr��8y2Qz���\'���dB��6��m=֮F{�~MSș�@=�ʱ߇���/@b��Z���		IG���g}3���\Z�&5�0��b�g��W�j�5&��z\nߙs��)��8O뙙��}��5��qj⏍��ߔ�m�y���\'����t�6�?�Y\n� �Q�}���5���::����iph�n�3)�L�z?���{��\n���N�fc���&^����$�܄��,�9cj�aP��Ӗ�f�J����L�6�_����V]��B8cւ����؉a��k�9r��:�fR�ܹJ�G��*66C���eT%����Q5O����?p�\\�4ȣ��m߲׮S�v�0S���4c>�w�5]�^�|�������e��$�0.:������t�~@9��Ҳ��������ne��Ҁ�4l���#��F�m~��0��D�����.`5��r�q� ����|m\n\n�h��Ƥ����Lz\Z�ѧ�JE�}���i�:����s��\"w�9x�E�f�ݻu}mk�>�����3��.��\"e�U�2��)	2`����ʖ����%�VM>{�B�;���D\"qc�cW��}���eee��u�Ά���>�O�Z<�i�zf�`�T���q挷�����TI�V�0a�{��;��Y�}Rr��eT̞��&���{�U�S+\0*QkY(�۪�?c�|pȳ����*��.�8s��Y��pVSjN���\n[�f��c�zIl��O\Z �s��?�ں5%HA��?�<p�襽����<蚚:ȥ�_���a3ƒUI\'\0\",�\\W�W\Z�Eꟗ�Bn޺���I��{v�\Z[CMkK`$\'�u�N�����>��P�Aݚ7oڼB�M(�ٲ���ޤJ�i(��\0Be\0����A�����^���BJ��M�n.cG��{��]뚚����{�?r�ރA!�a�,�Q��*L<֮v�5s�t�z�\ZT��e+]�;PU��\nF�p8�@����a��L9*3��Xq;\\C�1����j�o�-\03�����=\0^�UV�����w�q��@LuɢJ�]��=�#m-�n�6��݌��J\'ZvN�h��.�?\r\'�X���T�Z�s�R����0���是�V!k@8@m�԰��yӅ���5|ؐ��Z�hvM��PJp��G��xz��M�Pg@R	(��)M�F�j�W/x�u�t����G�}�R%�M�:\r�T*��f��)����3�3f/����\0}tS=��U*R�g���a�0��m�X7g��\\+�F��,F\"��0%%5[ �>\n�={�bLBB\"RI��V\0���t��FΟX>l�`7e�����=�&L���j�N�\Z���ʮ�M)�=j�	8\'�ʩ�dF�ɬ6!�U��ǣ>�K�L r	�*�R�md0á�7�u��+�Lj��}�w39~�L�b]Y[0����?���!����Vw�2��\n���̓�r2��D�V�Q$�Ꮟ[�j9�~(5����xT\n��c�8@���Z�~�;cc��S����\Z���F�Ա�M�kW|.7h`ў~�܎9�m�J����Z����Z���J�{�x��u�\0N�9)�28dBʞ�x��������)��ر_N��=a��^`T@L&c-P�	���_�CaF=!�Z���c5�$Y�~�c0��ρvi��c:U|Ym7S�Y�۬Dk.�M�ܔ��.�IO�$�-]���4���0O~u�~}�N��D\"����`WP����R�5�`�R6Sv����%�hvm�Pѻ-dn޾�-���1�d��e��YV���EA�i��Sb<ݝ���M\'ǟ���y����$%�y���Ҳ� �r��֦��P(\n\"T�y\nq�2_�����A<��M)4ILw��{�C�ꛛ[,^����ա�j쭜��;�n��� N�.D��p�O�fN`ZZ����!�e��q�P9��b9x���H��Ӭ�Rx���r6��]G;+��͉��H�\0)K�����i�v�;����yOE3f/�5��|�q�n�f\r$�(�Fb����}~Wo<�H$��zD�~�¤��C����z�.@�5PF�kz� z\r��؅%��H�\0*���tF*����lڷkG�mc��b��5��瑱P��RzX.�^��-�>�CpiDU׏J\0��q��]�r\r�2�s�k/RJ?KQJj�9zg��=���*1[#\01�.t�v�S�ƃ�GP�힏�ޅ�(�sl߮-��\r׮8\Z��,��:6.*.!g�j����+�{���biٰaq\\\r�,N�<��3p۔\"J��\\*�>W�03�kJ��k�J\0їbb^��K���TD�+v�y<��F\0RR���R�B��,e*5K��V	 �!ي�!�v$�ed������b;O �ɫgQ	 �D�J��������P%/�����r����l{ž��$L�WiK3�S ���-u_:i��n��sG[%\'�\rn�T.9�iph<1�%\Z(*:�<���޺q����������<���^�+P����=B�U�����	���}D�kj�`Պ�����,�J6Cb�v`@k��e\'�ʹ�,��ҕkOSS�҉���pbz�W�\0�����燔���N ��V�$�H����H��2Z$�^��)є���NL�qx���m۴��c׀�f������ܗ�:��S��0��0r���OIb�^�6m�XtL�y�(�4Y���ñ��c���\Zw��ý�D�&C.�B�!��:\r���q��{�ۓ�d6��u$��4Ur�~ʷ����B�ݻwmsh��}��[�1X@e�AE*��t:{�Xl6qa4��{��;MV��l})���熟�lٶ��^PRl�%\nh���˩S&�3k�<�N��U�*�nߍX��7bc�ш�H���)���xvC黲�6��eP{�p�2�Ӫe�&�\\U[\0�Ɋ��߼I\nE��܏�m��������8�O�!�A�	\\�8E���\0��*��bƤ�6Q���5\"Ni.�H)]I�����Q^���7W�K�!I���U��smd(j�a*�.U� C�|1P� C1\0d\0�P\0� @����\0��bk��:�\0\0\0\0IEND�B`�','foto-jogador.png',15956,'2012-06-05 00:00:00','text',NULL,'\0'),(7,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\04\0\0\04\0\0\0�x�\0\0\0tEXtSoftware\0Adobe ImageReadyq�e<\0\0\"iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmp:CreatorTool=\"Adobe Photoshop CS5 Macintosh\" xmpMM:InstanceID=\"xmp.iid:E94F0620C4E811E2B287FCA54FD79914\" xmpMM:DocumentID=\"xmp.did:E94F0621C4E811E2B287FCA54FD79914\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:979B4EA5C4E811E2B287FCA54FD79914\" stRef:documentID=\"xmp.did:979B4EA6C4E811E2B287FCA54FD79914\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>�h�\0\0�IDATx���+a�w�E��8i�I� )7m6QR���ܕ��.��h�\\$��6?r����\"�j|��NM�Lfj��wz���̾�̻�w��m[˶�D��!�!!!!!!\n�Q2�9�������_�)x�:9�}���O��TM[;`O�����n�z�Rt�8[F�!gf\n��wP\'��}�z<�z	u2�y�9m͠��2s�G_s|�\"��<��7���5f�P�y$]��5���IU�	|�������6B��r�R`���|� �fA����g���P?Xu��\"�����\ng/��W�������u�����t��9H�e�������\\�2�`7���<_];�S�N��z�xaN�$�l�,a��\"�+:��Kn��\0�/�u*p,U��B^����(nĒ�$EH�DH�DH�DH�DH�DH��\0�uL|~��\0\0\0\0IEND�B`�','foto-jogador.png',6464,'2012-06-05 00:00:00','text',NULL,'\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=7946 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitation`
--

LOCK TABLES `invitation` WRITE;
/*!40000 ALTER TABLE `invitation` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9045 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
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
  `scoreLeft_id` int(10) unsigned DEFAULT NULL,
  `scoreRight_id` int(10) unsigned DEFAULT NULL,
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
  KEY `fk_playerinstance_player` (`player_id`),
  KEY `fk_playerinstance_score_left_idx` (`scoreLeft_id`),
  KEY `fk_playerinstance_player_right_idx` (`scoreRight_id`),
  CONSTRAINT `fk_playerinstance_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_playerinstance_player_right` FOREIGN KEY (`scoreRight_id`) REFERENCES `score` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_playerinstance_score_left` FOREIGN KEY (`scoreLeft_id`) REFERENCES `score` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4623 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerinstance`
--

LOCK TABLES `playerinstance` WRITE;
/*!40000 ALTER TABLE `playerinstance` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=951 DEFAULT CHARSET=latin1;
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
  `coachName` varchar(45) DEFAULT NULL,
  `dateStartedPlaying` datetime DEFAULT NULL,
  `backhandType` int(10) DEFAULT NULL,
  `racquet` varchar(45) DEFAULT NULL,
  `twitterAccount` varchar(100) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profile_file_2` (`smallAvatar_id`),
  KEY `fk_profile_file_1` (`avatar_id`),
  CONSTRAINT `fk_profile_file_1` FOREIGN KEY (`avatar_id`) REFERENCES `file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_file_2` FOREIGN KEY (`smallAvatar_id`) REFERENCES `file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1654 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
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
  `type` int(10) NOT NULL,
  `owner_id` int(10) unsigned DEFAULT NULL,
  `coach_id` int(10) unsigned DEFAULT NULL,
  `sport` int(10) NOT NULL,
  `confirmed` bit(1) DEFAULT b'0',
  `deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `fk_score_owner` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2207 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scoreshared`
--

DROP TABLE IF EXISTS `scoreshared`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scoreshared` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loggedUser_id` int(10) unsigned DEFAULT NULL,
  `score_id` int(10) unsigned DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `win` int(10) DEFAULT NULL,
  `loss` int(10) DEFAULT NULL,
  `date` datetime NOT NULL,
  `playerFirstName` varchar(45) DEFAULT NULL,
  `sport` int(10) DEFAULT NULL,
  `socialMessage` varchar(45) DEFAULT NULL,
  `deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `scoreshared_user_idx` (`loggedUser_id`),
  KEY `scoreshared_score_idx` (`score_id`),
  CONSTRAINT `scoreshared_score` FOREIGN KEY (`score_id`) REFERENCES `score` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `scoreshared_user` FOREIGN KEY (`loggedUser_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scoreshared`
--

LOCK TABLES `scoreshared` WRITE;
/*!40000 ALTER TABLE `scoreshared` DISABLE KEYS */;
/*!40000 ALTER TABLE `scoreshared` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1819 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2014-10-30 16:17:09
