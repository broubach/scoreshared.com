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
INSERT INTO `file` VALUES (4,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0h\0\0\0h\0\0\0µ¡\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0fiTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:01801174072068118D4AF3673F9D521C\" xmpMM:DocumentID=\"xmp.did:5BF09B48A08011E3BD2B86528F414CE7\" xmpMM:InstanceID=\"xmp.iid:5BF09B47A08011E3BD2B86528F414CE7\" xmp:CreatorTool=\"Adobe Photoshop CS5 Macintosh\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:02801174072068118D4AF3673F9D521C\" stRef:documentID=\"xmp.did:01801174072068118D4AF3673F9D521C\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>­ÍÙÍ\0\0ÉIDATxÚì]\\S×\Z¿dDD”*n\\ Rqãz*Ž>ë(úD­Ö=ðán]¯U¤*u´ÖÖ½­[A©Š£nD* {#!	$!¼ï“ƒ†K°BIÎïw~¹çÜÜäÞó?ß<ßw®Qqq1e(º[†!0\0d(€\0Š CQVXUù²‘‘Q¹¾‚üt½@^K•®«¬öÌúTF\"‘ØÉ‡ÁƒÚCÓ”Åb¶-ypÊH$…Á¡¨° 0òEdÔÕ#]^A[\n“é“³)Œªbi›‚D\"±“Éte³YãF‹Ê^\'¼ÌÉÉ¹ò,,âÄ—Iˆ¯ºÀ2P¡\0d½±1ßE•ëù|ž\rŸßØÆÊªñ’Ø˜0Ÿã\'Ïþ\0­N ô’‚ò…BK.‡ãÅf³¿†&S]¿+“É\n^½ŽÝç±ÞËë¼/>€LU jš‚t Dg šÃPì{……)vr\\\\|Z\\ü›46‹]lkÛ®qËÍ›6mÚä£×fçäDíÜµ¦ç†ÍÁÈ	UI/’J¥î@5Û>F5yÐÛÛ7ÈsãÿÄÄ¤èÊ*ÀÆ[…j2ÔyP÷sGôîÕ£°9~ò)÷Ôésóç-Xr‰žGn\0èã”³ŠÅbýXÑù\"(À–ç»-¹,0	ºÞ@M†š‹…?A¾Ê†jÕÜÂ¢~óÛ7O5rÄXP2˜J~SâsñÒŠÉSfæ[x¦\"@Ê•ÉçXEç““S2ÝÜ—ùø]½jôßPc¡â\rä+“#0xxÃTÃ¡Z,˜?{ÀŠoß …•’ÿ{xzÍÜ²m‡In\0¨,åÊ¹B´\\	z=jŒë¨}EBGªÿ—Vr Qc­š\\Û‹Þ\'½ì:uèKÿNîÛ·.ã§¸ø?xˆ2IX™¤\0¡¶fblü~ß\\Ùùk×o†Œ›0õ<Ìræ9ÔD\"Ô«*/Ðµ…²È*äÉý¶6íÓ¿÷&¼—Óà‰9¹¹Ãïh ðÅñy¼]sòô¹£ÆºžpžAgvÚ¬U‡L&9T!R_Ç¾3_FEß §eËæv»wþâ‡–„ê´Z´PAAa?Ûc•ûëæÐi3æûÂ!Zÿ¡(†`€«k\\ÂõøHq>fnzzF$ý<h“zöèÖe‘cú‹ÅTª±…„†½\Z;nò9\"o T2°ê™ð[\0Nâî½ç€Z/*Ã¶x\\ã5«–Ï€ÃFDÔO€„B‘=(NôþÔÔ´¬/FŽC¶ö’€“*S;õH6m}âÿàÑ:ú¹>½{nÖ¬imS‘VâpØs”Ù9`4zm-‚°5I\rÞFÁðµ¨é1ÍÇÿvéÂÑ¨ž«ÓÍôI²g$½Ï÷’ß°sÂáð%ÑÖjŠÈ³¼€G=èçœœzö&lŽ¯w\0uSš’¿hÉŠëÄWÕ?¦HE&N»óP±¿Mkë6\Z}Öëh‹Íi ©´3½ÏÛÛ÷qZZz<ñäª¢JW§„Ä¤ƒŠl6›5vôÈ.ÄÁÐ+€ Ø*6@“’­óôò\'”“†]\ZU÷a2Ìs[|V&“å)öwsthfÚÒæ´	…bãiphPz¥Ñš¯…´àgùyA6×¬Y”AuQûÖ+€Š‹‹MÛ÷ý¢Ö–A•,È´qO(‹Ä\"ñ#Å>333ÇXï(\0*#_îÝ€™T%”5§¼HÃÛ\\.‡K¨‡¥W\0Ñy}xÄû\nµ©úË‹å™e=,&G¿´8©Dš¬ØÎÉÉAw‹X[ìí½Êã•±»äry1G¿\0ŠDQŠí¶6uóQZ.\\.·¾b[ È“û*Ö+€“\"Û_ŒÚŠ*Y¬ÓªwƒËã–±ÏòóóK©Z¿\0r>&ØÇ{/rÿ~}:jS}‡3J±‹(ÈöŠô\n |`Ð˜^—6»:Øóù<K¢Òj¥J¬Ùlv7Å¾ŒŒýUé‚Â‚è÷Â½ÇË\rD*âÕ±ÔŠ÷Tÿ¯é}¿ŠEÛ¬@[Ê‹Vù½¤P­Ø=ê‹!ðT¤ï1hÔ®ô¾\'OCRˆv)Õ;€ùùOÛíÛµm?aüWÈbÌ4í=‹z‚ÍÓžÆò¤þ¦¢Ò©—\0ú+z†Ñ¢…ó‘Í|†òZ“÷Âf³Ê­EEÇ$êé%‹›5×=C$‡(öu¶·ë:wöôphNÂ¤j^öêBïêAŒ¾A‘¶ÜOÚ\Z‘gggûÒ;¸Íž	M4¥rƒìÙTNÅ„rèð8y2QzÎÊã\'Ï’ÉdBÅþ6­­m=Ö®F{¤~MSÈ™‘@=½Ê±ß‡‘á/@b½ËZ©		IGèý³g}3¿›£\Z¯&5¥0€’b²g–W¸j5&€¤z\nß™sþë)ŠÊ8Oë™™Õÿ}ÇÖ5„Õqjâùüß”åmýyÇõ \'Á´‚†tž6—?´Y\nÿ àQæ}ÿ€ô5¢Ïí::íþýçiph¡nã3)˜Læz?é¯ÿñ§{¨Ä\nÒêò‡NÄfc†Âè¯&^ˆŽùû$ýÜ„ÿ¸,˜9cjâaP«¹Ó–ÍfÿJïÏÎÉL™6Ç_‘š§íV]ÚÈB8cÖ‚•˜–¨Ø‰a¸žk¶9r¸ƒ:äfR€Ü¹JÖG¹ÿ*66C‘½eT%‘«Ö„Q5Ož†¤î?p´\\¬4È£†¿mß²×®S‡vï0S¤ÔÔ4c>wäŽ5]¥^²|•·ßÕèÙÀeÔÞ$º0.:µ²ºï×þtï~@9«ÞÒ²¡õ¹ÓÇö·¶ne­ŠÒ€à4lØÀäŽ#ýÜF¯m~€Ã0ÂÚDº’ž¯µ.`5är¹q¾ ¿œð|m\n\n‚h¹àÆ¤¤ä°ñ®ßLz\ZŠÑ§•JEÉ}û¶ži:—œÞôsƒ\"wï9x£E‹fÑÝ»u}mkÛ>ÇåÊî3ûó.½´\"eÿUë2ìÐ)	2`³²¬†Ê–ŒŒÌè%ËVM>{þBÄ;ññD\"qccW­}®êÿeeeûýuëÎ†©Óæ>¡OŠZ<¤i½zfÛ`ÏT“‘™qæŒ·››û²«TI¨V¹0aÌ{…ÿ;÷ýYµ}Rr¹ìeTÌž±ã&­‹{“UšS+\0*QkY(œÛª“?cú|pÈ³ßú¶‘*‰å.õ8sÀÎYÍápVSjNÉÌÌ\n[¹fÝÔcœzIl¤âO\Z ôs¹œ?áÚº5%HAÆÄ?ó<pðè¥½»Îçó<èšš:È¥ô_¶ïœê¹a3Æ’UI\'\0\",æ\\W¡W\ZØEêŸ—ýBnÞºóÍÔI¶½{vï\Z[CMkK`$\'þuóNÄõ·¢¿>´ÉPçAÝš7oÚ¼B£M(ÊÙ²í×é Þ¤Jöi(þ¤\0Be\0„óíŠÀA«´§Ûž^¨’BJ—–M¨n.cGý«{÷®]ëššÖåáä¸{Ï?r÷ÞƒA!¡a˜,†Q¥é„*L<Ö®vž5sêtózõ\ZTÒâe+];PU´\nFÇp8ì@ø¾ÒÃa—ÿL9*3ªÊXq;\\C¯1®¤¾Ûjão—-\03ºŸ½½=\0^íUVÌ½ ìÝwøqÀÃ@LuÉ¢JÒ]ÒÈ=ä#m-³nŽ6ÇïÝŒéùJ\'ZvNâh—‰.?\r\'¬X×â€ÆT‘ZësñR ë¤éà0†úæ˜¯èV!k@8@mŠÔ°¾¹yÓ…îóþ5|Ø¾­ZµhvMªPJpè³×GŽžxzíúMôPg@R	(ŽÞ)M…FÃj“W/xôuê­t¿º¨è˜Gö}¦R%¹M…:\rT*ÝÉf³ç)»þø‰3þ3f/ÀÔç¤â\0}tS=€U*Råg£¾ÑaÄ0çÎmÚX7g³Ø\\+«F–ð,F\"±¸0%%5[ Š>\nŒ={þbLBB\"RI®ËV\0åŸþ¿t¿ŸFÎŸX>lè`7eßûóÒÕ=ã&Lù‘°j™N„\Z°¡»Ê®ÅM)þ=jü	8\'µÊ©õdFóÉ¬6!ÔU€Ç£>„KÉL r	ë*€RÕmd0Ã¡á£7·u¶·+·Lj½Ä}ñw39~…L€b]Y[0°¶Žôï„…?íÔè!²®ó§Vwß2³Ù\nÀ°ˆÍƒýr2‹¥DžVäªQ$Ëá[·j9€~(5¦­­ÃxT\n©ˆcÐ8@íó†ÚZŸ~Î;ccãÑSŒ®’¤\ZÞ÷ F‚Ô±ƒM‹kW|.7h`Ñž~äÜŽ9óm¡JûŠªZ¼ÙÀÚZ€½³J‰{¤xåêu¾\0N‘9)Ÿ28dBÊž¿x™°ïÀ‘¹¸÷)ýüØ±_N¯=a»Õ^`T@L&c-P—	½ÿÆ_·CaF=!ÚZ¥ååc5‚$Y·~Óc0¶ÑÏviæµÁc:U|Ym7SµYÜÛ¬Dk.—M¿Ü”âó.½IOÏ$¬-]ÃûÔ4«ÃÁ0O~u·~}óNŠçD\"±°—Ó`WP¿ý‰‚R¬5Ç`­R6SvîÚÀ‰%†hvm‡PÑ»-dnÞ¾û-ýœ±1ßdõªe¨éYV—ŠªEA™i±¸Sb<Ýƒ†¡M\'ÇŸá©÷yËû·å¯$%¿yýÜ×Ò²á šr”ÕÖ¦‹«P(\n\"T¤y\nq²2_ÛÞý‡îA<¥¥M)4ILwîù{ÒCÆê››[,^è†ñÞæÕ¡¢jì­œÁ†;ónûå÷ N¦.DÆÔp‘OùfN`ZZºýÄÐ!ƒe§q€P9 §b9xøâîH¢´Ó¬áRxóÖÝr6 ]G;+«ÆÍ‰×ÃH£\0)KÌÌÌÊýiËv”;èÎÒêyOE3f/Í5¨Œ|âq¹nóf\r$î(†Fb±˜ãé}~Wo<“H$©„zD”~•Â¤¤”CôÎýzÂ.@ò5PFêkzº z\r¶ïØ…%µºHÏ\0*öðÜtF*•–ÑØlÚ·kGÔmcÄb²Ò5“ˆç‘±P‰üRzX.ú^ÉÅ-Å>°CpiDU×J\0üq ÷]¾r\r£2ÑsŠk/RJ?KQJjÚ9zgŸÞ=‘Ûà*1[#\01Œ.tövìS¸ÆƒòGPËížŸÞ…ñ(ãslß®-¾Î\r×®8\ZˆÉ,Òô:6.*.!gê‘j­´€›+½{ÉáûbiÙ°aq\\\rÄ,Nþ<ž¸3pÛ”\"J¿‹\\*‘>Wì03«kJ©¸k£J\0Ñ—bb^•¾K¤Ïì­TDÅ+vðy<¡¦F\0RR¤Äî‘R†B±Ø,e*5K•ñV	 ˜!ÙŠí!ƒv$¿ed€„‰‰³b;O ÀÉ«gQ	 ‰DúJ±íÐÅÞî»å‹úP%/¢Ðë÷ƒr’¦³Ùl{Å¾„„$LåWiK3•S Ðû–-u_:iâøn”¼sG[%\'ã\rnÈT.9ùiph<1Þ%\Z(*:æ<½×âÞºqïÊï– —¡Ž¾”Ÿ›<ˆÇã^£+P¸£þ®=B‰U €œ‡	ÉÉÍ}Dï¯kjÚ`ÕŠ¥§®ûù,¥J6CbÖv`@kåäe\'®Ê¹¦,ÅæÒ•kOSSÓÒ‰¨€pbzÐW±\0ÿåöëÛç‡”ÄèçN ™ÔV¹$‘HÆËåòH‡ó½2Z$¬^ãé)Ñ”¥ŠªNL‚qxèÃÝmÛ´þúc×€ófÐáû÷¼ÝÜ—á:‘ìS¶•0Á0rŠ™õOIbž^¾6mÅXtL±y­(ƒ4YÊèÑÃ±ñÉc¼­¬\Zw¯äÃ½‰D&C.ŠBà!åð:\r“ÅäqØÛ{“Û“Éd6¯Ìu$‹ã4Ur†~Ê·Šª¶¦BÙÝ»wmshÿÎ}­­[õ1X@eÀAE*ŒÔt:{ÓXl6qa4½ì{öú;MVö®l})¸Œç†Ÿ®lÙ¶£š^PRlÊ%\nh ÒüË©S&œ3kÚ<»NñíUú*·nßX¾â7bcãÑˆÇHÛ¢¹)ÍâÐxvCé»²¡6Á÷eP{öpì2†Óªe‹&˜\\U[\0‘ÉŠŠâß¼I\nE·ïÜúmçÞçÄÎÁåþ8ò™O©!»A­	\\Ä8E–‡ö\0ìá‹*ðõbÆ¤¿6Q•ŒØ5\"Ni.¹H)]Iàªè«ÄÆâQ^Ž¤’7W‡Kõ!I¬€Uéøsmd(jˆa*Ý.U¢ CÑ|1P C1\0d\0ÈP\0Š @†¢öò\0þ†bk:ç\0\0\0\0IEND®B`‚','foto-jogador.png',15956,'2012-06-05 00:00:00','text',NULL,'\0'),(7,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\04\0\0\04\0\0\0Åxë\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0\"iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmp:CreatorTool=\"Adobe Photoshop CS5 Macintosh\" xmpMM:InstanceID=\"xmp.iid:E94F0620C4E811E2B287FCA54FD79914\" xmpMM:DocumentID=\"xmp.did:E94F0621C4E811E2B287FCA54FD79914\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:979B4EA5C4E811E2B287FCA54FD79914\" stRef:documentID=\"xmp.did:979B4EA6C4E811E2B287FCA54FD79914\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>šh½\0\0¹IDATxÚì™Ï+aÇw¤E¢”8i³Ië )7m6QR¸ºˆÜ•ƒü.®®h­\\$¡¤6?rä ö°‰\"»j|ßúNMÛLfj¶ÞwzžúôÌ¾ïÌ»ó™wÞçm[Ë¶íDœ¢!³!!!!!!\nQ2½9æ×Õ² —Ÿ_Á)xö:9¿}¥‡OäÀTM[;`OÛòˆÊüªnøzRt”8[F¬!gf\n¼éwP\'à}Ùz<Ðz	u2Ÿyô9mÍ Å¡2s«G_s|™\"ôÈ<äÑ7ÌüÀ5f„P‘y$]íê5›äñ­IUî	|‚°€æÙöã’6B¨Êr½R`£¦ÿ|› ÔfAæŸóæÈg¯¤£P?Xu­™\"éæ÷¼\ng/ÉÍW‰€¾¦Úõ€uŽ§û¾«tûÅ9Hƒe°¶¢˜©¨ª\\Ž2Ç`7€Œ÷<_];£SÙN¹žzØxaNë$äl,aŠÈ\"+:­¡Kn˜™\0Î/®u*p,U¹ÚB^ûÁŸù(nÄ’¿$EH„DH„DH„DH„DH„DH„â\0ÁuL|~ôÇ\0\0\0\0IEND®B`‚','foto-jogador.png',6464,'2012-06-05 00:00:00','text',NULL,'\0');
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
