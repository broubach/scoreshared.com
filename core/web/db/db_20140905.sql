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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (4,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0h\0\0\0h\0\0\0µ¡\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0fiTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmpMM:OriginalDocumentID=\"xmp.did:01801174072068118D4AF3673F9D521C\" xmpMM:DocumentID=\"xmp.did:5BF09B48A08011E3BD2B86528F414CE7\" xmpMM:InstanceID=\"xmp.iid:5BF09B47A08011E3BD2B86528F414CE7\" xmp:CreatorTool=\"Adobe Photoshop CS5 Macintosh\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:02801174072068118D4AF3673F9D521C\" stRef:documentID=\"xmp.did:01801174072068118D4AF3673F9D521C\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>­ÍÙÍ\0\0ÉIDATxÚì]\\S×\Z¿dDD”*n\\ Rqãz*Ž>ë(úD­Ö=ðán]¯U¤*u´ÖÖ½­[A©Š£nD* {#!	$!¼ï“ƒ†K°BIÎïw~¹çÜÜäÞó?ß<ßw®Qqq1e(º[†!0\0d(€\0Š CQVXUù²‘‘Q¹¾‚üt½@^K•®«¬öÌúTF\"‘ØÉ‡ÁƒÚCÓ”Åb¶-ypÊH$…Á¡¨° 0òEdÔÕ#]^A[\n“é“³)Œªbi›‚D\"±“Éte³YãF‹Ê^\'¼ÌÉÉ¹ò,,âÄ—Iˆ¯ºÀ2P¡\0d½±1ßE•ëù|ž\rŸßØÆÊªñ’Ø˜0Ÿã\'Ïþ\0­N ô’‚ò…BK.‡ãÅf³¿†&S]¿+“É\n^½ŽÝç±ÞËë¼/>€LU jš‚t Dg šÃPì{……)vr\\\\|Z\\ü›46‹]lkÛ®qËÍ›6mÚä£×fçäDíÜµ¦ç†ÍÁÈ	UI/’J¥î@5Û>F5yÐÛÛ7ÈsãÿÄÄ¤èÊ*ÀÆ[…j2ÔyP÷sGôîÕ£°9~ò)÷Ôésóç-Xr‰žGn\0èã”³ŠÅbýXÑù\"(À–ç»-¹,0	ºÞ@M†š‹…?A¾Ê†jÕÜÂ¢~óÛ7O5rÄXP2˜J~SâsñÒŠÉSfæ[x¦\"@Ê•ÉçXEç““S2ÝÜ—ùø]½jôßPc¡â\rä+“#0xxÃTÃ¡Z,˜?{ÀŠoß …•’ÿ{xzÍÜ²m‡In\0¨,åÊ¹B´\\	z=jŒë¨}EBGªÿ—Vr Qc­š\\Û‹Þ\'½ì:uèKÿNîÛ·.ã§¸ø?xˆ2IX™¤\0¡¶fblü~ß\\Ùùk×o†Œ›0õ<Ìræ9ÔD\"Ô«*/Ðµ…²È*äÉý¶6íÓ¿÷&¼—Óà‰9¹¹Ãïh ðÅñy¼]sòô¹£ÆºžpžAgvÚ¬U‡L&9T!R_Ç¾3_FEß §eËæv»wþâ‡–„ê´Z´PAAa?Ûc•ûëæÐi3æûÂ!Zÿ¡(†`€«k\\ÂõøHq>fnzzF$ý<h“zöèÖe‘cú‹ÅTª±…„†½\Z;nò9\"o T2°ê™ð[\0Nâî½ç€Z/*Ã¶x\\ã5«–Ï€ÃFDÔO€„B‘=(NôþÔÔ´¬/FŽC¶ö’€“*S;õH6m}âÿàÑ:ú¹>½{nÖ¬imS‘VâpØs”Ù9`4zm-‚°5I\rÞFÁðµ¨é1ÍÇÿvéÂÑ¨ž«ÓÍôI²g$½Ï÷’ß°sÂáð%ÑÖjŠÈ³¼€G=èçœœzö&lŽ¯w\0uSš’¿hÉŠëÄWÕ?¦HE&N»óP±¿Mkë6\Z}Öëh‹Íi ©´3½ÏÛÛ÷qZZz<ñäª¢JW§„Ä¤ƒŠl6›5vôÈ.ÄÁÐ+€ Ø*6@“’­óôò\'”“†]\ZU÷a2Ìs[|V&“å)öwsthfÚÒæ´	…bãiphPz¥Ñš¯…´àgùyA6×¬Y”AuQûÖ+€Š‹‹MÛ÷ý¢Ö–A•,È´qO(‹Ä\"ñ#Å>333ÇXï(\0*#_îÝ€™T%”5§¼HÃÛ\\.‡K¨‡¥W\0Ñy}xÄû\nµ©úË‹å™e=,&G¿´8©Dš¬ØÎÉÉAw‹X[ìí½Êã•±»äry1G¿\0ŠDQŠí¶6uóQZ.\\.·¾b[ È“û*Ö+€“\"Û_ŒÚŠ*Y¬ÓªwƒËã–±ÏòóóK©Z¿\0r>&ØÇ{/rÿ~}:jS}‡3J±‹(ÈöŠô\n |`Ð˜^—6»:Øóù<K¢Òj¥J¬Ùlv7Å¾ŒŒýUé‚Â‚è÷Â½ÇË\rD*âÕ±ÔŠ÷Tÿ¯é}¿ŠEÛ¬@[Ê‹Vù½¤P­Ø=ê‹!ðT¤ï1hÔ®ô¾\'OCRˆv)Õ;€ùùOÛíÛµm?aüWÈbÌ4í=‹z‚ÍÓžÆò¤þ¦¢Ò©—\0ú+z†Ñ¢…ó‘Í|†òZ“÷Âf³Ê­EEÇ$êé%‹›5×=C$‡(öu¶·ë:wöôphNÂ¤j^öêBïêAŒ¾A‘¶ÜOÚ\Z‘gggûÒ;¸Íž	M4¥rƒìÙTNÅ„rèð8y2QzÎÊã\'Ï’ÉdBÅþ6­­m=Ö®F{¤~MSÈ™‘@=½Ê±ß‡‘á/@b½ËZ©		IGèý³g}3¿›£\Z¯&5¥0€’b²g–W¸j5&€¤z\nß™sþë)ŠÊ8Oë™™Õÿ}ÇÖ5„Õqjâùüß”åmýyÇõ \'Á´‚†tž6—?´Y\nÿ àQæ}ÿ€ô5¢Ïí::íþýçiph¡nã3)˜Læz?é¯ÿñ§{¨Ä\nÒêò‡NÄfc†Âè¯&^ˆŽùû$ýÜ„ÿ¸,˜9cjâaP«¹Ó–ÍfÿJïÏÎÉL™6Ç_‘š§íV]ÚÈB8cÖ‚•˜–¨Ø‰a¸žk¶9r¸ƒ:äfR€Ü¹JÖG¹ÿ*66C‘½eT%‘«Ö„Q5Ož†¤î?p´\\¬4È£†¿mß²×®S‡vï0S¤ÔÔ4c>wäŽ5]¥^²|•·ßÕèÙÀeÔÞ$º0.:µ²ºï×þtï~@9«ÞÒ²¡õ¹ÓÇö·¶ne­ŠÒ€à4lØÀäŽ#ýÜF¯m~€Ã0ÂÚDº’ž¯µ.`5är¹q¾ ¿œð|m\n\n‚h¹àÆ¤¤ä°ñ®ßLz\ZŠÑ§•JEÉ}û¶ži:—œÞôsƒ\"wï9x£E‹fÑÝ»u}mkÛ>ÇåÊî3ûó.½´\"eÿUë2ìÐ)	2`³²¬†Ê–ŒŒÌè%ËVM>{þBÄ;ññD\"qccW­}®êÿeeeûýuëÎ†©Óæ>¡OŠZ<¤i½zfÛ`ÏT“‘™qæŒ·››û²«TI¨V¹0aÌ{…ÿ;÷ýYµ}Rr¹ìeTÌž±ã&­‹{“UšS+\0*QkY(œÛª“?cú|pÈ³ßú¶‘*‰å.õ8sÀÎYÍápVSjNÉÌÌ\n[¹fÝÔcœzIl¤âO\Z ôs¹œ?áÚº5%HAÆÄ?ó<pðè¥½»Îçó<èšš:È¥ô_¶ïœê¹a3Æ’UI\'\0\",æ\\W¡W\ZØEêŸ—ýBnÞºóÍÔI¶½{vï\Z[CMkK`$\'þuóNÄõ·¢¿>´ÉPçAÝš7oÚ¼B£M(ÊÙ²í×é Þ¤Jöi(þ¤\0Be\0„óíŠÀA«´§Ûž^¨’BJ—–M¨n.cGý«{÷®]ëššÖåáä¸{Ï?r÷ÞƒA!¡a˜,†Q¥é„*L<Ö®vž5sêtózõ\ZTÒâe+];PU´\nFÇp8ì@ø¾ÒÃa—ÿL9*3ªÊXq;\\C¯1®¤¾Ûjão—-\03ºŸ½½=\0^íUVÌ½ ìÝwøqÀÃ@LuÉ¢JÒ]ÒÈ=ä#m-³nŽ6ÇïÝŒéùJ\'ZvNâh—‰.?\r\'¬X×â€ÆT‘ZësñR ë¤éà0†úæ˜¯èV!k@8@mŠÔ°¾¹yÓ…îóþ5|Ø¾­ZµhvMªPJpè³×GŽžxzíúMôPg@R	(ŽÞ)M…FÃj“W/xôuê­t¿º¨è˜Gö}¦R%¹M…:\rT*ÝÉf³ç)»þø‰3þ3f/ÀÔç¤â\0}tS=€U*Råg£¾ÑaÄ0çÎmÚX7g³Ø\\+«F–ð,F\"±¸0%%5[ Š>\nŒ={þbLBB\"RI®ËV\0åŸþ¿t¿ŸFÎŸX>lè`7eßûóÒÕ=ã&Lù‘°j™N„\Z°¡»Ê®ÅM)þ=jü	8\'µÊ©õdFóÉ¬6!ÔU€Ç£>„KÉL r	ë*€RÕmd0Ã¡á£7·u¶·+·Lj½Ä}ñw39~…L€b]Y[0°¶Žôï„…?íÔè!²®ó§Vwß2³Ù\nÀ°ˆÍƒýr2‹¥DžVäªQ$Ëá[·j9€~(5¦­­ÃxT\n©ˆcÐ8@íó†ÚZŸ~Î;ccãÑSŒ®’¤\ZÞ÷ F‚Ô±ƒM‹kW|.7h`Ñž~äÜŽ9óm¡JûŠªZ¼ÙÀÚZ€½³J‰{¤xåêu¾\0N‘9)Ÿ28dBÊž¿x™°ïÀ‘¹¸÷)ýüØ±_N¯=a»Õ^`T@L&c-P—	½ÿÆ_·CaF=!ÚZ¥ååc5‚$Y·~Óc0¶ÑÏviæµÁc:U|Ym7SµYÜÛ¬Dk.—M¿Ü”âó.½IOÏ$¬-]ÃûÔ4«ÃÁ0O~u·~}óNŠçD\"±°—Ó`WP¿ý‰‚R¬5Ç`­R6SvîÚÀ‰%†hvm‡PÑ»-dnÞ¾û-ýœ±1ßdõªe¨éYV—ŠªEA™i±¸Sb<Ýƒ†¡M\'ÇŸá©÷yËû·å¯$%¿yýÜ×Ò²á šr”ÕÖ¦‹«P(\n\"T¤y\nq²2_ÛÞý‡îA<¥¥M)4ILwîù{ÒCÆê››[,^è†ñÞæÕ¡¢jì­œÁ†;ónûå÷ N¦.DÆÔp‘OùfN`ZZºýÄÐ!ƒe§q€P9 §b9xøâîH¢´Ó¬áRxóÖÝr6 ]G;+«ÆÍ‰×ÃH£\0)KÌÌÌÊýiËv”;èÎÒêyOE3f/Í5¨Œ|âq¹nóf\r$î(†Fb±˜ãé}~Wo<“H$©„zD”~•Â¤¤”CôÎýzÂ.@ò5PFêkzº z\r¶ïØ…%µºHÏ\0*öðÜtF*•–ÑØlÚ·kGÔmcÄb²Ò5“ˆç‘±P‰üRzX.ú^ÉÅ-Å>°CpiDU×J\0üq ÷]¾r\r£2ÑsŠk/RJ?KQJjÚ9zgŸÞ=‘Ûà*1[#\01Œ.tövìS¸ÆƒòGPËížŸÞ…ñ(ãslß®-¾Î\r×®8\ZˆÉ,Òô:6.*.!gê‘j­´€›+½{ÉáûbiÙ°aq\\\rÄ,Nþ<ž¸3pÛ”\"J¿‹\\*‘>Wì03«kJ©¸k£J\0Ñ—bb^•¾K¤Ïì­TDÅ+vðy<¡¦F\0RR¤Äî‘R†B±Ø,e*5K•ñV	 ˜!ÙŠí!ƒv$¿ed€„‰‰³b;O ÀÉ«gQ	 ‰DúJ±íÐÅÞî»å‹úP%/¢Ðë÷ƒr’¦³Ùl{Å¾„„$LåWiK3•S Ðû–-u_:iâøn”¼sG[%\'ã\rnÈT.9ùiph<1Þ%\Z(*:æ<½×âÞºqïÊï– —¡Ž¾”Ÿ›<ˆÇã^£+P¸£þ®=B‰U €œ‡	ÉÉÍ}Dï¯kjÚ`ÕŠ¥§®ûù,¥J6CbÖv`@kåäe\'®Ê¹¦,ÅæÒ•kOSSÓÒ‰¨€pbzÐW±\0ÿåöëÛç‡”ÄèçN ™ÔV¹$‘HÆËåòH‡ó½2Z$¬^ãé)Ñ”¥ŠªNL‚qxèÃÝmÛ´þúc×€ófÐáû÷¼ÝÜ—á:‘ìS¶•0Á0rŠ™õOIbž^¾6mÅXtL±y­(ƒ4YÊèÑÃ±ñÉc¼­¬\Zw¯äÃ½‰D&C.ŠBà!åð:\r“ÅäqØÛ{“Û“Éd6¯Ìu$‹ã4Ur†~Ê·Šª¶¦BÙÝ»wmshÿÎ}­­[õ1X@eÀAE*ŒÔt:{ÓXl6qa4½ì{öú;MVö®l})¸Œç†Ÿ®lÙ¶£š^PRlÊ%\nh ÒüË©S&œ3kÚ<»NñíUú*·nßX¾â7bcãÑˆÇHÛ¢¹)ÍâÐxvCé»²¡6Á÷eP{öpì2†Óªe‹&˜\\U[\0‘ÉŠŠâß¼I\nE·ïÜúmçÞçÄÎÁåþ8ò™O©!»A­	\\Ä8E–‡ö\0ìá‹*ðõbÆ¤¿6Q•ŒØ5\"Ni.¹H)]Iàªè«ÄÆâQ^Ž¤’7W‡Kõ!I¬€Uéøsmd(jˆa*Ý.U¢ CÑ|1P C1\0d\0ÈP\0Š @†¢öò\0þ†bk:ç\0\0\0\0IEND®B`‚','foto-jogador.png',15956,'2012-06-05 00:00:00','text',NULL,'\0'),(7,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\04\0\0\04\0\0\0Åxë\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0\"iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmp:CreatorTool=\"Adobe Photoshop CS5 Macintosh\" xmpMM:InstanceID=\"xmp.iid:E94F0620C4E811E2B287FCA54FD79914\" xmpMM:DocumentID=\"xmp.did:E94F0621C4E811E2B287FCA54FD79914\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:979B4EA5C4E811E2B287FCA54FD79914\" stRef:documentID=\"xmp.did:979B4EA6C4E811E2B287FCA54FD79914\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>šh½\0\0¹IDATxÚì™Ï+aÇw¤E¢”8i³Ië )7m6QR¸ºˆÜ•ƒü.®®h­\\$¡¤6?rä ö°‰\"»j|ßúNMÛLfj¶ÞwzžúôÌ¾ïÌ»ó™wÞçm[Ë¶íDœ¢!³!!!!!!\nQ2½9æ×Õ² —Ÿ_Á)xö:9¿}¥‡OäÀTM[;`OÛòˆÊüªnøzRt”8[F¬!gf\n¼éwP\'à}Ùz<Ðz	u2Ÿyô9mÍ Å¡2s«G_s|™\"ôÈ<äÑ7ÌüÀ5f„P‘y$]íê5›äñ­IUî	|‚°€æÙöã’6B¨Êr½R`£¦ÿ|› ÔfAæŸóæÈg¯¤£P?Xu­™\"éæ÷¼\ng/ÉÍW‰€¾¦Úõ€uŽ§û¾«tûÅ9Hƒe°¶¢˜©¨ª\\Ž2Ç`7€Œ÷<_];£SÙN¹žzØxaNë$äl,aŠÈ\"+:­¡Kn˜™\0Î/®u*p,U¹ÚB^ûÁŸù(nÄ’¿$EH„DH„DH„DH„DH„DH„â\0ÁuL|~ôÇ\0\0\0\0IEND®B`‚','foto-jogador.png',6464,'2012-06-05 00:00:00','text',NULL,'\0'),(16,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0h\0\0\0h\0\0\0’~\"ö\0\0síIDATxÚLºePÜéÖöË÷ó¾{ž={&‚ww§iwww÷\Zwwâ™øL&ÉÄCŒ1$BÜÝ\\ûÜdŸ§êPWÝuÓ©?¿¾ÖZ×‚8Y³Ø3Mª@‹¤µdÊdš³X@;ÛlgkÌ©ËBðÔ8¾e°qVŽÖÄÒ\ZØZG§å\Z4|³NœmTæ™u…6s‘ÕRh4èM…:s±ÞViÉ«É,©²WZJšò:+×w×mìkÞ±¥ûÀÎÍ\'Ž½2ôîòµOç‡¾œ»öãü™ë3Ç®L¹<}äÊÜÑ¡…£×–Ž__>uÃqæ¦ãìðò¹áåó7ÏßX¼>wñúìå³C7g¯ŒÌ^½02=0<qæÖôù{³çÆgÎÞž¼;9ô`êÊÝ¯ço¼½4üfxüãÝG_<ùòèÉ§‡Þ?~ôîÕË/Ÿ>LNOÌ/Í;––§\'g¿|üÎå%ÐÒ¢cqÑ±°àX\0ç²crÎñþ›ãå\'Ç³Ž§N3]£\'‰eH®ÐàufšÁJ7ÚCo¥+\r$±\nÃà¥ãÈ±<	Roem<£•g0óôžAÇ7hf$Ë È1jòL†|£1WgÈÕò5ÆBµÜœ[m+ª0”›\nòê:+º64mÙ¶~ÿý‡wo;uôðÈ¥K¯/]ýxáê—ó×~œ»1=pmúøÐôÑ+3G‚;vméÄåÓ7g†+Ô~‚»psaðÆüÅ³—o®€ú	nptúìèÔ¹;3çïÏŸ9wgÜ•ûCãß®ÜúxíöÇÑûŸï=ùúôå÷¯¿=ñùåËÏïßýøúyzòÇÜìÔüÔÄÌÄ·Éo?¿xúæÓ‡¯ÓS³³3ós³‹s³KssË³sË3Ëß¦–Þ|^zöaéñû¥Gï—œdJ¬X†æ	a\\A†PŠ”ªpJIc ‚S¦Æ‹¾Aa&£p‘lxÍ’%ÌÎ•eeË¬‰Ù(6éDf­Äª•Ù4\n›ZiS*­r¥M¦ÊVèòÔæCv¹)¯Xg/ÔÚkìUÛ»vÞuúÀ®ý;Ï9tóìÙ\'.¿½týÛàõg¯Mœ¾6u°»:{ìêÜ±«Ç¯/¼éqœuœu\\]Y\Z^¼8¼péæÜ•›³W‡g†Ff®ŒÍ\\º=;xw~ðÞüàÃ…ÁûsƒãÓƒw\'.Ýý~ýÁÛÏ¦ÆŸO?ùþøå_f¾OÎ}û>ûýÛìÔÄ<°Û÷¯SŸÞ}ñìÍý»FnÜºtáê[÷_½x÷áÝ×¯_&|ŸœXø1±ðõÇüÛÏsOÞÎÞ57þjþî«y\'/ƒÍƒ09év\Z“›Î#Ä2Ogñ ,.¼B ÄÃÑá,.Lk`Y³Äyùª»Òf‘ZŒP§f­Ô¢‘[Tr“\\f”H\rb©I¬È”isTæBmf±Þž§¶åªl•™eíem{6ì?{øÊ?ûÏíÙqòÏ}=uæéÅk_¯?sõûék§®Ïœ¸>{üÚÜñë\'n,vŒ:Î9Î9Ç–G—.Ž\0pó—†ç®Ï\rOL_›à.Ž¯€»\0¨ÝŸ½xoúÒø$\07üxòá›…§ï¿šzñnêëÄüäôÂ×oÓŸ>ýøüñûÇw_ž?y5~ëÁÕË7Nžÿçàñ}»œ:~öÚ•Ñ[£÷ÜþôÉÛ—/>={þéáÓ÷Ÿ~6qçùô­ç³c/æœHÔD25‘BK\"QÐØH*GŒ/bðÑt88	¤6ˆ`sàzÇjegÉ¬f	(RƒF`ÒŠ-ZY¦NeÓ¨Ìr…Q*7Jf©:KaÈU[óµ™@9J‹]i)·µ”4îéß7xüê_;Oôuîéëù{ãÆãûÜ<{ñÍ¹¡O§‡>ŸºúýÔé“7f»7æOÜ\\<5²<0¶|öÖòù[ËÆ–/Œ.Ž,\\ž½xsæÒÍ©Ë7\'/L]º0:yftb`lâô­çîL\\º75ô`úúÃé±§3÷_Î=};ÿúÓü»Ïsï?Í¼|ýõöí\'CWF/\r^?æò‰#ÿügÏû·nÜÑ»¾¿½¥«¿wËÎí{÷ï=xøàñãÇÎž9}éÔ©KGŽ_<{éÎÈƒÏw^ÌÞ~9ëå‚\n…ÁEã‰ñX|LZz@|¢g\Z$MMóOLò†@ƒÑèh*\n…ˆâ²ÇlX\"£V ‘³µ\nžI-¶iÙm–VkV(RÀNe–é²Uæ\\-Gcµ«,Y\nc¶ÂXjÎk,ªÙ½a÷àñ+»6ÿÝPÝ[WÝ_W·uó¶gŸœ¹üîôÐÇS×¾žº1yêæô‰3\'nÎ^85º40¶töÖÒ¹[KçÇ–Î.\\™ž¾xsèÒðÄå‘ÉËc“çG~œþvjøëÉ‘/çncaøÉìíóã/ç¼œ{þnþÓ÷¥_æÀd¸výÁÑ#çwí8°cë¾­wnèÞ´¾­§£¹«µ¡½¾º±²¬º¦²¾¡¦¹µ©³«£wCßÖm[woÞ²§oãîý‡/\\½ýîÎs\0náö«%\'(<ŽŒ@ccPè¨ä¿˜Øu))~Ái©©É~X8GÄ&±‰|J+gT£š¯“s”\"¦FÊ5©¤Àn9&ƒ]¯·(Õ&™Ê$ÓXúl5G›™¥²ØäF›\\Ÿ¥Ð›í\r;Öo9ý÷éþÎm…¹uù¹ùm]=‡Žœ¼7pùÍÙëŸn|=yýÛñë?NÜ˜:qsæäÈü©Ñ…Ñ…3cgFçÏŽÌžž:?<yaxââÿR»rkêÒ©‹ãÓîNž»óãÊÃ©±—ó÷ß->ù´ôâóÒ«Ï‹ï¿.}X~þòËÀ™ëÛ¶ýÝÑ¶±¾¦½µ±«³µ koêèjíîéèëléjilk¨iª©¨««nl¬kílëéïÛºaÃŽîÞ{ÿ>{yôÍØÓé±çóc/œ’RüSÓƒ`ð(,<!Þ;*Ò-1Á\'=5’\Z”‘ŒEDS	Étb*ƒ”.` |’FÌÐË9\Z1[Á§kD\\³B–¥ÕäšŒvƒÁ¢P»™ä\Z‹Ò¥µfë2­\n£Q¢5KÔ6¹ºÈ”Y_Pº¥½ïÈžÃ=™¦\"«¹Ôj­jnßsðØ­Ë¯G¾žþvüêçcW¿¿>qâæôÉ‘ÙS£s§GçFçÎ¬höÌÈÔÙ‘‰s#F&.® º3}uTåÜðÓ…ëOæ†M¾œ{øqùÅ7ÇÛIÇÇ)ÇçiÇç‰Å_fGÆžlÚ´¯¸¨ÞžU’m-,/®n¬inªin©kYßÖ½±gÓ†®\r=í=MµÍÅ•%UUeµÍõm=]ý=Ý[ºº·íþkàâÈ«‘\'“£ÏfGŸÏ;……»DFºÇÅ{\'$øFG­‹ŠpOŠóÍH\rF@Â±ˆ*.™Cr)0Á#!¸D¸œM6ËùF)_#`ëD|³\\jS©@ZUjX¦H´b…˜Nm²j,™V#”kùƒPRh´4—nnï>¸ó¯õMÝùÙeyöÊ¼ÜúŽ®½\rŸz9tçÇà­Ç®~<2ôéÄï\'‡§NŽÌœìfOÍŒÍœ›>;6unlòÂŠÅ¦¯Þ›½ùp~øñÂèÓ…ñ7‹?/=ø¸x÷ÝÂ£O‹¯&–ßM:Þj3ŽïóŽW¾_½y×ž£EEõ\Zu¦Õ”W[VWÙØÞÔÙZßÖ\\ÛÒÑÔÙÝÖÝÕÒÙÞØVSV]`/(Î/©(®j®kíëêßÐ»µ§oÇ¾¿Ï\\{5útrôÅ,p´“¯Ï¯þ~¿…¯\rss_—ëMÆÂ¢©Ød*fb%LœŒIàtxª”†·É„©P\'àè…|³Tb‘+,\n•A\"Wò„2Ž@É—h$JƒÒ`TÁEÎÉY<››o0¶”•mnïúkûžî–î²‚ªÒÂºÒ’æõ={ÿ>ríìÐó&/ß8võý‘¡\'n~;52yrtêäèô©±™Óc3cÓgnM½=uþ˜˜³C÷ço>Y¼õÂq÷µãþ;ÇóoŽ÷³Ž7ÓŽ?o¦ŸæŸg×¦—¿Ï.Ü{übÏþceå­±ÅuYeEÕ-õí=í½íÍ £Õµ¶7´·Ö6””d›3²óË\nË›ëš7¬ïßªµÿ?Ÿ½rëÕ­ç ÌŽ8´(€qÔâ£¼’cü 	AH,f \r†MÉÏ™CÂQ1É\Z6UÏcj8%ƒ¦b1u<¾^(D+’\0p\nžH%’kejƒÊ\0¤+$¾ÆSi¹ZmKiiKÛžÛº›»ªJj*J*ÊZ;ºvîÜwöØù{WÇ¿_Ÿ8}Øíó©‘ï§Ç&Oßš>}{fàöì™;³gïÌž»;{a|îÒýù«n>]¼õjùþ{Ç#å¿:^M8ÞÍ8ÞM;Þ\0£^sŽ/³Ž/3Ž—&FÇŸýuh ¤¼E&·²Yr.[fÒe•V\07u·õ´7¶·Ô6·Õ·t4´µ×·¶Õ7W•çZ²‹s\n+K*Zê[6tõmìÛ²¡ÇÎ^3þzæî›…»o\"ÂÝ€×\0¸°`çØO@-%Æ?-.•\ZIE&)9Ä<¤\"K×\\”]iÓç©$f[I%JIx1/¥•¦ŠÃUój¾HÁ*…T©Wj\rjƒ^¥Wˆd\"6‡C\"qñøl•ª¥¤¤·¡i{÷†®¦öÚòºêŠ¦ªÊ¶–¶m¶ýsàÄÈåÛŸ‡îMœûvfôÛÀØ[“·§ÏÜ9{wöìøÜ9Ñ,\\z¸8ôxéÆóå±×Ž{O¾®XìíôŠ\05€ìÃ´ããÌŠÝ¾Í,?~û÷?ƒÕµ=ž‰¢SÈ<!OaÖg–ä—îÖÝºÔfK]S{}KgCkWcPmIe-§4¯¨¦¬\npÜÐÙ³±wSÿ†íœ¹ÿîá»¹ïïXv\n\rqu\Zä¿*4pmB´wFRpFbPFB,!!¥còu’ÊL]saV•UW ”Ùt1%À X´ˆ\0ØQät†‚ÍVry*P#‘ê•*ƒF§×è4JL$°Ø‘‹ÇÙd²º¼¼¶ŠªžÆÖ¦Êº²‚òÒÂšÒ’ÆÚºÞÖ®];þ¼0põÅÅ[_.NwgòÜíIP•gïÌœŸ=oþüý…/>\\ºüxùê“å›/ÿ÷ø‹ãùwÇëÉÇ½—ïŽ·ßï8>L8^ž{üòÛ‰37j7¨49dª‡c±YR¹DgÒZó2ó«Kk@…‚òl«kÔzš;z[:û\0½òšâ¬¼r\0®´¢¥¶¡§µ˜ÌÖCGÎŒ=xûøÝìÃ÷óß/8®XåïóŸ`ÿÕÉq¾¨ôpdj<)$=Ú/=ÂWH„ê$U6]KAVµEW¨èé.ÂBx8ƒâñb2YB£É9lµH WÈLZI¯Ói5J¥R\"òYÌÿ‚3‹Å™™µù…MeU•ù¥Yö²Bðüe­•u ÿ=|füüðû«÷&¯>\0ûÓ4èeîÎ\\¸77ø`aðáÒÅGË—;†ž8®?s¿pÜzãuúÙñ,Þ?/¾:ž}r¼øäxõÉñæ³ãÝÇÃçWG^ôo9$‘g¢±l4šA&ñÄBµNe6h,6cVI^i]y]sUC{]swSû†Öõ›:Àøìm«®/Ï)¨Ì/®-.k®ªíjlém_ßß³ùð?w¾}ú~°{ônÖ),Ôye&Dº§%²(„bÓ\rRšg¢’mRVS¾¥)ÏÚœk-ÕÊm<¦ŽF’ã1r<VA$ÈI	‘ \"ùd¢F‘qYJ±@£jTr…B*–ù<6‡Aå‰\"Á$•ÍY9µù%¥Ù…y–Ü‚ìÒâ‚º²ò¶ÊÚ¾î‡þ:>2põÕÐ½Ékç.ÏÞ¼7{ñþ<0Ú%@í‘cÜOÇ]¶¼Âî•cü­c¥Í}t<e.o¼˜~ø|êÑ‹Éó—ïoÜz8¯°‘ÁRb±l2YÀ¤‹¹l©T¤2j-ùYÕ%Õ­5-mµÍ\0\\PmSg]sW}smQi%³Ôž[]XÜTY\rÀjÝÒ¿íä‰óŸ}|÷uáõ—…WŸœ¢£Üãc½@j£“­nC…­³>¿«® Ø\"7‰¨5ÙºÍ\råëKs›²M2†ŒÓQ	&&ÕÌ¢›ÙLƒ&§„D<fq:EÂeÉÄ|™T(ñx|‹EeÐˆ\0œˆB6\n„\Z]‰ÉZž•WdÉÉ1fp¥E\råU5}}v¼zââ³¡ñ‰ëæ¯Ü›£ÌK/?\\¾òÈñ¿÷%€ï\Z(Ø§ŽÑç0Xï¼rÜ{\r¨9ÆŸNŒ¹ûaôîû]ûÎ˜3+™l5ËÁã8;¹J:…ÇaM:ëÊÄ¬nênêêjlï¨oi©ªk(­¬/ª(ÉÊÉÔê¬¶Êü‚ÆŠ*\0nãú¾?¶üqîÌ¥×o¾~›©Ðñé‡ô¸Õ±ÑëPð™×\\›ý×ÎÎÃ{zlë¨/0\Zä2“¬½8»Ñn¬6ªr„\r	k¤“³l»—-äYøl›.£‘¸›ˆáQ	6U\"dI$\\¡ˆÍ0ù|†€Ë³èrÃ$å)µ•¶œf/íÅ¹ÆÜ’ÜÊêŠ¶ººÞÆ¦­ÝnØ~ú¯·/ÝþvóñÂõ‡óC+¿ä˜¹plì—,\r=Zºü`áâ½9p=\\¼öhéÆã¥á\'‹#On?[¸ÿráî“©[÷>Ÿ¼·kÿ™ªº>±ÌF¡J	x™Äçüœ§+à˜B“ÖRš_ÚXÙÐÕÐÞQ×ÒZÓØ\\QÀ5UT·TÕ\0¯YÕšB[fmqIkMmOskg÷æÞÿyèÊ•áñ{ÏŸ¾øôêíw\'?Ÿ_¢#\\‰Ø¸LoßŽ¶[WÝºrôÊ‰½•ÙZ6.GÁ®0+JuÒb¥(“K×±V6­P&*Rˆäâ©À*â¨9T>Ë\" Ød—Aòi\"1S bÄL‰”«ñUž–Ë³%9ru}NÑ†úö†¢ês~EAmS]w[ËÖÎÎ=í]û›AÂÛåÂÈ\'\0bäéÒõGço¯¬îçïÌ^ºH-]}´¨»=58>{ùþüÐƒ…k+š»vzôÑôøÓ™ñ\'w}ýóàÅ‚âV™2›ÆTÈ\"\nED§ŠA|c3Ä*hbPªE¹Åueµm5--Õ`R5•×4–Uµ×Ô¯óò-*uQfVseUWCã†¶ö¾öÎž¶Ž=ý»¶ï=~ôÌððøý/œR“|‘°P.’kíÝÞ2|ùðØå#×Nïïo,ÎUqêsô}ÕÍ¹ær­,[ÀÔ’°f&9GÄµ‹¸™B¶™ÏÔsir‘KD1ñp&É¢b8,—Kbsˆl.I$bÈ%\\•€ÀeJE\ZSkQÕ¶¶¾ÖòÆb[qE~m}eGkã¦®®=Ý½wo<º÷Ðð¥ÑÏ7Î^»7seÝé‹w§ïÎÞZéz—îÍ^y0wõáüµG‹WîÏýÜfn<œ{<êôÖýÏ7F_mÙ~Do*fƒò ‹ˆD•\"bÐVÀ1iB*‰Ã¦tJÃ{\\Ku3\0×\\UßT±Ø­½¶ ÓŠ%¹&s}iYG]}oKkOKkWSs{cKkCÛ†žMö>~ô´™!äÂ•\\^–h{í…»®žùsèäÞ?ºªòô;ÚªNíêßÖXQoÕåI¸\Z2FOÅ›YT#“¢¡•4¼ŒŠ’PLŒŽƒÒ	0:	A§¢h4™Š¤ÒP\\I*`*¸,-‡—£ÐTYrº+wwoíªn+Ë.+Ï­®,jl¬é]ß±{Óæ£ì½xdàþÕ[ß®ß<?üåÂè·kgo<YýîüØÔé_OßøråÞÌèóe ‘çKà~näûÐ½é±gwžÎÞ{:ucìÍÙÁ;Ý»dŠ,\nM‚Çs‰mœ„õÓn$ƒNd«$\Z»5·²¨´¹–š&PªM?Kµ¡¬¢¡¬Ün0JÙ›F[UPL×ÝÔ¼¾©¹£¾¡®¬¢Ðž_š_ÒTÛÔÑÒáTh—ægKrlÂ²Õ¦îÊ£n8sxÛÙCÛv€®ÄöWëÐ‘½»Új«Lª,!KAD©H¨¦âe$ã<‚…ÒÐéT„N€2È\0’JEIP #`“•<–I(ÎWë«­¹]åõÛÛû;*[*ì\0\\y~}cuowçîíÛO8|}`ðÉõ[_oÜ¼4úíÒ­7Íƒš½ñháêýÙ‹·ÁŠú$•‘gK£@ÏÁësWïM\r?ž½ý|ñÑëùWæFï¼>yz¸¥m«Xj!SÄ+àð\\*YJ•AÑÈ\\<ŠBÁÑbµÝ’S^XÑXÕÐ\\ÓØZªµ¶¡¬²®¤¼¦¨$K§—°Ø Íp-UÕ=Í-Ý?Á5”W–äæ—æÖ–U6TÕ:mê©ìi/n¬²5TXú;Ë÷nm=¼«ûÈ®î-måíåÙ‡¶v\rŸ>ôG{m¡ZläPD8˜”€RQ\05Œ‡à¢¡,„ŽL##R)è4Æ¢\"Yt†$3pø42Æ¦aÕv¶BY¤3UYrA©öÕu´”6TÚ+*r«+òë›jz{»öîÞ5püäØà•ç×o}Ÿ¼qoêÆýÙáG£O–n?_ºýbiôé\"\Z7Í_8.#Oo¿X½8þrñîóÅWŸ–~Ì.Ý{øúØ‰kÍ›D’p`,\0ÇQH\Z°RˆlœHDS\"pHàõuMÕ\r-\0\\U]cyUmIyUAq¦N/ãp3µºêÂ¢¶šÚ¾Ö6P­]À˜µ Ô—ƒu§¦¥¦Öéï=Ý{¶µöµ—u4äoè(ßÞ[·«¿iW_cgu^M®a{GÝé½[»*òÍ|º‚Šã£¡€—Œ„•’°b\"ZHDHhÉÂÁ™8‡Šâ20<ŽÍÄPÈ0\"Bà¨5\\¡ÆPnÊjÌ+ëªlj,¬©È.«È©®ÌÏÝ·±gÿ¾½gO¾uùê‹‘;_o=˜\Z{8{ëñüg€ËÒƒ·Ëß9î½qÜy¹|ëùâØ³yP›cÏï¿Yz¶ò7§åç—Þ}]ü6¹8zûéþ¿ÎT×ôˆ%f\ZM\nò%‰À#ù€•Ì\'áYH(\"ËEêk^i~9Xû\Z~š®Ä‘òêp…%vƒY-‚­)*nÿÖWWîM•UM• ~›«ªœNÜvxß†?úû;*@	mì¨ìo¯ìi(©ÌÑÛÕ¢†ÛÆ†ÊbƒRDDò±p\nÊÇ Dx´”ŒWÐI*6MËgªx)‹,bE,¢ˆCñHIGÑ@„¦ ytœšË´I$¹\nu‰Î\\›]ØVZW—_Q–Y\\‘SY]ÐÐÑÐ¿uãp£C×žß¹ÿíÞ“™»Ofï=Ÿôféé‡••\0èÑ{ÇÃ·ŽÇï—XÈî¾\\zò~ùõ7ÇÇIÇ·¹åß^½›9ñÎÆM·HÄf&CN!‹È?ÙýÄÇ#`™ð<	Àirme\0\\}e=(Ø†ŠÚú²êºÒŠšâ²|k–I®Ê·Ø@¥ÚYß\0&€ÕX¾ÒªÈiÏæö}M½-åmµùÍU9\reYµE6Ð!Í2®„†ÓXÙJ±„ŒÃ%Çá“ã	)‰¤ôjF\Z‘	JÃ(á$€£\0ø8T›$`8t§2˜$$Ÿ†S²é& G¡*3X›òKzjš›ŠªÊ2‹Êíe•ù5íu=[û÷íÝ}üÐ¡‹çÇoßûôðÙÔý§3_Ì=}·øâãÒËÏË/>;ž~X¤žƒ½ê3X–¾YzõeùÓ”ãËôò·™¥Ï>^¾¿cçqÐÍÍæR_Ày\nÀv:‹Ã0a<A–	ÕvëOpõ€]MYMuIeUQYUQ)p\0gQióÌ¶Š¼`:0[Á	2JynPYNn©ÝäT	¢FŽ±(|©\"K/±¨FOÅg°°0Lr,&)›ãëà—”\Z’\ZŽLL  `B*Y\'_/ÖK„*!WÊ¡ñhIÂ@°ðd,‰Š…òÈX¬ç²óTêÚ¬œžªº]]}]U\råÙEeÙÅe9eMUmýë·oÙ¸oÛÖ¿½<rëõÃ§?=ŸzüræÉ›¹gï^|XzñÑñìýÒÓwà²ü°åùaùãÄòÄ‚ãÓÄâ«³§Ïvvï.(nV¨ì|ÉTÒ¨R\0T+XðX6ÏÁ¢P… ‹ª,K^Yaeèò¥Õ`‹(É+³8\'´ÿ³Í¬ÒféMùÖÌ[HÂyfK¶Þ\0†h|`hXT*³Ré¤á3€Ô†ŠO—²É\":A@%pˆ<$9=:,>È?ÜË#d{ «k°ûºO¯P/ï0/ï¸à`Hl,Ð¨ ’ƒˆ«àq$,:—B ``Xh2<%–C„¥²qH1¯aÒí2Y¥Å¶¾¢jWWÏúêúÊœ¢Šœâò\\à›zÚû»;6w´mÚ³çØõ›=ýúüõÔ‹·3O^M?~5ýìíüówO^Ï>z9ýèç+_O?};óþÛü¹ÅÇ/?Ý|ºqë!kVÕÊª@—Q¨\ZMF£J@©‚á€Ã²±ÇÆ éP¤ˆ*›9¯´°²_aE½0ÇjÏ4Ú²Í™9ÖL›ÎhP¨;›Ö`Óêmj­Y©2Èä©Ü(Sè¥2µP¬äèH(\rçàQš‰EÒ1Hxƒ8ŠLNL	ñôñð\nZçàîáçêîãìêç¶.ÈÓ;.$‘”LF\"8$¢N1é|*‰ŠAb )ñQi1áè”x*ÂÇ¡4²ËÎ–Jk²²z«kZJÊ«sk\nJkKVÂTgKws}geyÓ¦{‡†î>}þùÃçÙ÷_æž¾úñàù·Ç/\'€î=ýzûÁ‡‘ñ77o¿sçáû§¯¿¿ý<}þò­þ­\nKšùB#…&Ãà¸„•gà¤d’ãbÐL4ŠÅ€“ƒ±hºX¨±™ó‹*+Ëê\nsŠ3MÙ&I+Óè•Z£Z§—«5b…NªÐË”z©B\'‘kERµ@¢ËÍJQ®R	%ržÈ	ˆÅ¦$áÓR1©)˜´4\nÁÀbI:--1<2ØÓ\'ØÓ7ÄÓ/ÀÝÛÇÕÃk­›Çj÷UÎn¿¯ñuõˆJ‹‰Åed0p8&¤ÓÙG&\'@ã¢1É‰äŒ4\n.&`¤$¼’J¶Ëe5ÙYÕv{•=·¶°¤±¼ºµ¶©³¹³¡¦ü$Ýë·\\8ãá£7ï?M¼ÿ<õäå—ñÇî<x;r÷å•›/\\¹sîòís—n»<váÊ­«ÃnÞ~²cÏ?%õJM6™*Áøh,‡@0èr\0ŽH`1’ŽDÐP(:\nI…ÃH ÓIDZ«9¿ ¯¼¬¨:\'³\0¬®\Z™V&)„r¥X®ÉTB ©\Zð® SñÅJžH+–[”:£\\£àK%¡SB@`bPpjXxzdTjDTzt,&BF °<)-!<:Ô7(È+ ÀÃÏ×ÍÛÓÙÃÛÅÓ×ÍÇsí:—ßœ×­rì\"üS£bq(—D•±¹rWÂd²q8ð˜4œ€3PÂ€¦É)D›D˜§Q—Z­Õùù`Tµ×7v·u6×·”—T¯ïê?~üÜÍá»¿zúâÃ£çnßuéê£§.íùëØöÝÿ:|úÈÉÁ?øcïÁ{lÝ¹¿²®UcÈJô4†°#QDTª”ÉPP)–‹B2pðÀœ‡‘ñX\0g1ååf—æ•gZrõj“R¢–ð$žXÂÉ\0&ô\'8™F,ÓŠe\Z(O©N¢0Éu:‰ZÊ™|§0wÏðuÞQ^~Ñ>Q¾q¡qI˜4,1-%:164:Ì/4Ð+Ð×Ý×Û€óòqóõ÷ðrñrýÍÅõ?Îî¿9ûºx„û¤GÇÓP8)“£K™’ÃS©B\"ôFÏH¡B’¨D!©eÓm2q¡ÉP–USTØ\\]½¾µ­¥¡©²¬ª­µs÷îý\'Nº6:rëÁØÇW®ß>xd`ãÖ=Íí½uM¶ìÜµï`÷†-uMm•µÅåÕF‹] R‚÷‹ÎÐè*M\n„8‚\0…dÀaTŒxÁ`$ à8–JÕd°gÛ\nó²‹­&»î\'81O\"âŠ„l”+Rð%\0œF,×Jä fÁ¹BP¢\\ù£X-áˆLSÀ\Z·À5nAÎë‚]<BÜ¼\"¼ü“Ãb q)	¡Ñ~Áá¾!¡>!ëü¼Özúºú¬ó÷sóõuñö^ëé¹ÊÝãw×u¿¹xþîâ³Ú|#,.‘‰Æ©y|‹\\a‹u|¾ŠÍ’Ñ)B†‡I)X-›b•pó´ò<½2ß É5hí]Y^NsmM}uuyiiEyEmmCoßÆ¿øŽØóç¡ÎžM5My…åöü’šúÖ¶ŽžâÒ*£%Ëlµ[lvµÆ()YL0@9DÂÊrJÄqA—F#hÐtFBdP,ƒ\0Ï àÐtW®S[mæÜ03Íö•RUèä\"…”/±…R®£Z)@§ÓJ?Ý§ÔËuZ©V!TÈø2\'Ÿÿ¬ñùÏZ¿ßýW¹®uu÷ŽK	ò	Zçê\0Ø­ó÷qögàèäîêáéáâæã·ÆÍãß«üW»ÄãRR¥tºY*µÈe™Ô âƒô+¥Ä$´QÀÌ×ÉÊmººüÌ²LcžQeSËôRQŽÙPSV\\YZT˜ŸcÏÎ²Zm%¥å}6mÛ¾«¯sS[gaI¥%3×`Î2˜2í¹Eù¥\Z‰Ã‰D\n¹\\#+…|)ƒÊÅ¡¨8$¤aT”O¹\0\rMÅ  DŒ\0‡`¡i ’Ìe‰Õ\nƒYŸ™eÉ±³Ì:«^ePKÕ2\\ÄÉx+¥\næƒ^¦2ÈU\0èz+à:\\¯–h”b•“×¯«|~[Lêê±R³Þþñ¡É¡‘	ÁáqAa‰!‘ÉaÑ	Áq¡IÁiÀŒ‘qÈ˜DZRFbHT6ŽIˆñôŽpsóñ…FEÒ01¬ä25BŽŠÏT€TLÅ\nˆH€ž§“ÖåÛzêËŠíÅ6}®ImÓ)òlÆ²ÂœÜ,‹¼ïZµÕj),,¬KucSyEu~A±-3Çbµçæçå—šŒYr™VÀ“±[\"äÉ9!È\"c¨8Åa!Øe`A”DC0˜,†GA0‰°´xHZB*Ãc\n4r­V©Ó©ôúŸÒÊ5j©J.”I¸b\0”*pÜÿ‚SßÇi%*£Ò WèUbð•\n\'ï_÷[µ&ÔÍ#ÊË7Ö/0!081(49ÌŠhhl<<.—øS	˜ø$|B\nŠ”)rUgAI[N~…Ö £Ñ	ñqiþ‰~>)AþÈ„(\n<KÆHØ—\"åTŸ„Ô	éyYkyÞ½­`-Ì5eés­šü,cqžÍbT,©D`2ê³²2srìYYÙ&“Y§3èu&«%»¬¤ª¢¼V%×“	L*‰Í ð¸±%c‘yd4‚$SD\nG† ÈPŽ£\"ðT$ž‚Ä“à8l:2#´ì¤”˜dD\ZœKç¨¥J…H&JU…F¦Ÿ‚øte8ðÄržøg©ªþËN#Q*AË“(8BŠZÂ—:…8»†»­‹õñM\nJ\r\rƒDDB#£11˜ÄD|j\n15œ–NM‡ÐÓ3ØP8‰Ê[³sö·¶íÛá;:{\n\n\n$\"KKMDF…¦…ú¥G28$„˜MP\n@B&)8$«’_’©ín,ÿk{_[m]©½Èn°åùÙ†ª²¼‚\\«^\'—É‡Ïc`È‰U*à£ÙdËÎÌ-;Rn‰ˆ\'Ç\"HdƒE(ÅúLCžEiu\"–\'3äV±Ò\"VEr5W(¦²x$\Z‡@¥cHD‡%Cé0:‘\"âðe±J\"WK …ü—š€Å±ù¶\0°ûJd lÁ¸2ybŽP)R‚Ê™Ï8Åyy%øø¦C#ÂÑÑè¸8\\B<19‘\nIeÂ2ØpóI‚F«=•Òš™y¼§÷Þ±cSwo¾ñèÄñÛ¶ìª«j0ëŒ5%6ÑÏ-ÒsUFL ™$d 5b\ZNÂÈ1J+óM;jìÛºµ·¹¹º (Ç`ÔŠò²õuÕEeyv»I.ˆ$2€‰ÐÆô:½ÕœiÏÌËµ¯4r6HÇ0t.]lÓçÔ•5×•4ÔÖVd—”˜ìÕYùÍ%ùÅ59ùz³A(Q°x:[HerI4–H€£pPƒc‚äÂ\0j*\0ÄÀz’ÿRãÒØ|:GÈàþ—Œ+ð\n“LçPÙ\"6»BË¤°œ þÁˆˆ0LL..†˜OII¤§\'³`i\\$”„\nP)©\"`LtrŸÕj5í¯¯¹òÇÖ—çN½:wêáÑCÃ{wžÝÔ³·±ª5Û˜É¥P’#ÒC<à1~¸´.1]ÎÁJÙXoÕðÊru]%»7wt·TT—€ýF¥QpÍzižÝhÏ2XÌj•JÌç32™L RÉ8Ï\nùb™D)+6EfQx2º8§¼§µC[ÿ¦Ž­\rå¶¼SV‘ÁRf;¿Ä’•¥Òiøb!…À¢¿~¥[IÁ\"Î Qx–Í°¸<&‡Cg±(@‡N¤r(,!\'åˆT9’/ÁÏàqé\\dQ	42Žâ„‰ÁF…b#É	1Ô¤8zJ+=‰K ÒEh¨•!FATx¤‘‚ËáÑË‚6‹vKaö±ö†Ñ}ÛïÚûàð¾û‡÷Þ{u÷æº\Z:sZ\nœ˜ˆŠñAÅû1Pq\"*Øó!\\*Ô `ÙUUö¾öªÆª¼â\\ƒE/‘‹J)[«hÕb­F¢ÑJ5Z™L.ârY\r|ˆ$4„£ˆx2Ì¤tSÄ‘ê•æºò¦›öìßþç¡Ýû[»«ì¹Z£Q(±«u•ÙùåYyæLƒDÁ%R8«JWšWWZQ‘_¤KéD2(:‰F#P(x2	K$¢ñ$ˆI¤é|9Wª«u\rJ¨”ò\0n>@\'¡I8$‹À9¢Bˆ1a”¸jB=)†‘ËN‹çf$òaIBxŠž,‚%+1F*G­V\nÚŒÊ\rÙÆÝeyGšªÎ¬o¾¼©ëÚöÞ;û¯ìè=³±mOCq­Ql` 8°(RJ› cÀ¤,„Œ‹5*™9ViQŽº¢ÐTh×dYd@!eŠ…4>ÌåXl\"›CáñlJ#ÒhÀql>Ças˜t&™HÁ¡	<7ƒÌ’ðå9–¼ÆÊæ†ò†úÒº³Ý ’+A{¢2´<!ðšM¥3€	À€\"38\0\\-»Øžg7ÛÄ\\>G àIÔÿ5\n.OåJXÀq\nµP©©|¹„#áÒ¸,À£ hdÊ‰\ZJ£Ç‡3#˜I‘Ì”(vZ47=†‰dÄ	 qBHœ•b$Â\n¸äz•°M/]oVöZT}õÖÃuÅ§;j.ô5_ÞÒqugÏÙÍ­»ëó­5•*&$ªXp\0«“QLj–UÏ7k¹Û æèÕ\\’­”ƒ¾B ‘`L\Z™ŒÂ¤IH`2,A¦€\'P«U:­V!SPHTI…f¤@ñH‹ÂVˆ”VM\'ÕÊ8™ICáéH,‰á)\n6_Ææ‹h,>…ÀIÙ|«Z—c²fÍ:…ŠMcàÑ\"–@Æ‘V¨ax‡Àà‘XÀŽ†£pÉlC\0L§äƒR•Ë¸ ‹Ø6°\ZŠ¥ÁÁ38Ñb‚h1ÁŒ¸fB(31Œ•ÎNä¦Eñ!ÑÂŒX!$F‰Q£“-$X	ŸÒ¬v[”[rô[ìúÍ™š]æCÕy\'šK:ªû›®ï\\åÎ½5[+­E2’‚˜  $+kTÑj†^ÃÒ©\Z%]NK.£‰„$.Ï`bØ<_HŠ\"1“Ã¥’ÈX:ƒ¬PH¬V°UÚ3m6‹\r‡Â!)éi‰©hŠ‚§ðè<9_.d8$&›HcãÉ`†Š¨‹«æ‹¥,›H¡c	TžM¦)„\\¥‘)eB1‹Æ$â8@£A…£P0*‰†¢004‰§b(LƒKáð¨\\à>.•Ã&³èD:KÆ#qÈ$,\ræDò£Gû3b™ñAÌ„`VR;%Œ›ÁOfD‹ QbH””I•)í:Ñælí¾ÒÌ½E–?rõ{Í‡ªìÇêN4Ÿï®¹±³sd_ÏÐ®Ž#ëËZ3…Y<¸Žžª %ëÅX‹–¡WÓT\n*RAQ*iJC$\"1Y(\'’5:=WŸ“g°fj@Ng0Il6M«SæåÛkª+ËËJ%\"ŽHOIMŽO„§Óá¨X2‹À c)džE \ni,P˜+@¢\0’°x\0†Ä@áD4–Cg9<›ÇcrYtð/\n†¤ed¤A3Ò¡P°›¯OG !(ƒ‡ã‰(\"M¢¢É4\\\05\ZJÆ1pPª\'r˜%Â›íÇˆ\r`ÄvìäPnj8?=R˜%†FË`1\\Š†¨S;âÍÙš½ÅÖý%¶ýÅ–?K¬Êl‡«sŽ7]è©ÞÕuû¯¾áý `ë·”Ê5T--…ƒ\nÑRä´\\‚—ËIrðE&#‹¥$.CcÀX4_HÒ„Eæ²\n{EU^I™=\'Ïš6³òÂúúêŽŽ–¦Æ:£^Ç Pq(<‚Ê€aa(\"KEé82“@3¹ÚŸ¿/ËÖ™rŒÖ<s¦Q¡ÐÁFCB È‹£ÉT\"…Œ\'ãÐ8™šœ–—˜”œœ˜’š˜–ž‚$gd$g@“¡°44$:µ\"\nÇÑO‡A’ÓðAî„òÿ²¾c%†pRÂøéÂŒH),Fˆ3Òs¨j)­Ó(Þ”¥ÚY`Ú_j;T™ýwyæ¾\"ÓòL\0n°¯ntO÷Ý¿7Þ>Ðegû¶‚6»DCMÆ%z’`¡4b“ÊˆR9I¦ ‹Äx.Å`ÁÉ4…à\nðZ½\0€«k(êê®ïßØ¾ekÏ–­½ý»ûû»7oîëîj/Èµ+$bFÄ`°p$`ÜDD`˜²ÁÖJäv£´ÿ{^eA1˜ž…Y9Z™‚E¡ÁÓ3Ò“S`‚£àPDJRj\\L|TDtDXdtdLlt\\BLbr\\\nPJ|j\n8cS’c’RcSÒcSÓãÓ 	é°T¨ežš’›è„	pÃ¯#EøP£ýé±Œø`fb+9”ª5#J‹‘!âõ„´,:²LHnÒðz­Šù¦}eY«sÿ,Ëü#O¿»Èt°&çT{ù¥ÍM×wuÞØÓ}ygû±ÞÊå#ŠKò&@ƒÉ¸X6+C,ÃÄX®\0Å`CÉ´4\n-BÏ ÐÁÊâb¥r†-KU][°qsÇÑcž¿pòÂàéÁÁÁ\'ŽÞØ×]^\\¨S*˜dÐ¡¡)q	Ðätz…aÉ:SÊá«ÅR“J©7®üÝ@£“	E BI8<Áb0(@MMNMLHŠKHˆOLLHNINMK…€j…Cÿ\0”‘MO„¤Æ§¥Å¥¥Ç¥¥Ç§\'¯e¤@câ¢bþnè u„_JL -.˜žº¢Ä0fjÅ‡ÅŠ	*\\ª‰Ëãà+¥Ìv“l[eO¹ý@MþžÒÌÍYš-9ÚÝ¥ÖµyGÛÊN÷ÖžßÚra{ëé-\r»›ó²¥8rF	NàØ‘ËâÁH´,1ŽÆ“’é,8œ\nCÆB QéQT:Êd‘­ïi¼|eàåËŸ>½þþíÃ·/ï_=|éÂ™?¶n*ÉœKK\rLˆŒÊHHB¦¦ã pt:žœ‚‡#D‡Fç3Ù ß²¨tƒ)äñ?ÿÇ@Hââ“RSÓ`P00X,\'’dÐõ@â˜·*\rZ¨ÙŒDä¿J‚\0j©‰)ñ1q1‘ÑNÈ@Otˆ1:ˆšFKŒ %EP#(‰á´”HFz4;#–O¢SÔø\rÇ%W+¸í Ždé6ç™6Ú\r½VõÀ®À´£Ô¶«ÒþgcÑÑžÚS››OniÚ×QR¤cq	ñt|Ç`¦q…\Z+@IB`¢Ó !Pd$\nED¥¤‡¦eDÀ‘ñ`½,+ÏÞ»oÓøøõïßßÎÏ_^žYZ˜šúñùù“û—ÎŸéíl3kU422$–œLÇáDL¦V\"U\n„—3„X,…þ8°T‰Å`Q(4\Zœœ›––†Åâh4“Éæ°y|ž@$ÿWB®Ïâ³i™A#Ð¨8*G\"cI Á`QË€:¡Bý1A¤øZJ,-5–š\ZKNŽ&&ø\ZEI‹¦§Ç23âyðd	*]‡›¨;‹T,`TH9µJA³NÚiVõdêúr}¹ÆîýÆÛÞæ²Ã½\rG66ííª¨Ê’ªx(.-LŒ§Ò’éìt\n#€ƒ¡\"Sýâ’|bâ½b|â“ü‘˜xÐé\nKÌ;w÷\r]=ýæíÃ™™O‹‹Žåé¥…É…ÙÓ_^?|ôà_µ%ÀtI±QLÁ¢QWö¶¶õ´¶u·¶ågeñ<\n™‘’’‘–Š€AQH\Z‰B!0(ÀJLLŒûù‘šš\nÖ:¡P$‘Èär¥F­3êM&ƒÙb²ZŒ‹ÞlÔõ*N¡ÕÊ´\Z™F#S+¥\n©H\"öåpA6rB†‡ \"C±1‘¸ø(L|:>ˆ\rGÆ…£â#Ð	ØÄHbR5%Ž\r»Dª•¡ÆÂMdl6‹\\,b×(Åu\Zi­FR­W¨„Õzi‹]¿¾$³·2§£Ôš«A\'&a1Qxb‘šˆ#Å£ñ±)Àðh×ˆ÷èX82ŠÍEY3¥M-%ûþÜtýÆÀ‹w~üx³°ðmyyryyjiabiîÇòŠï¾Ü½þ×Þ?ò³­T<Æ¨RÔ••lèhÿó?þÚµëÀžÝ]-Í¹6«L( ãq`\nd¤ƒþ•œ–’’š²ò‘””\r|C¦égå—¢b…\\©Ukz£Ù`¶\Z-@ƒÙ¬3™4&£Ú`PëZ½É`2ê\r@N°ÈHhDDzhhJHpbp@|<8ƒBCƒC’BRBÓÃ‚`!èè0|L9.šIQâ&\Z1›CÏbÓLt¢F0‚“AÔ1z6É\"d˜„4!AF%  áô@82…‹†¡ÂÓ Á‘±îÞþÿåš’(WR[ÚŠý³ýöK¯_ýúbzúýÂÂ×åå	‡cjyirqîûÂì7\0nq~\n´¼Gîlíï±é5õå%[zºvoÙô÷î]‡öïýçÀŸûwý±}Ó††ê\n³^Ã¤SÒRãb£âãbâ@è\0gxDX`P€¯¿/PHXpTLTBRBZz:\n…\"‘HL&SÀH%RµB¥Q©u\Z­V¥ÑÈÕ*©B&’èÔšœl{QAaIQqiq‰SrHxbPh¬_@¤·o¨—W°—gˆ·Wˆw(/8½B¼=Â½=#½=c|½ü}’|ÓüQáÔ¤VZ\n’ÆIOe¦%3Ó“Y©tH>1“…O‰Ã§Å!’\"Òãƒ’â|ãã<“’}R þ‰©¾ñIÞ\0™ðoq	Þ(t´É,ØÐ_?0°ÿÑÃoßÜ{ÿîá—ÏÏ§\'ß/Ì}]ZšX7ÿ°[^œr,Ï,/NÿòþÔÑƒMUå•e\r¥-5•\rµí\rumuÍ\rëÛš*Šôj9LHIŠ‹‰ˆ‹NHˆMLˆ‹‰\n	ôðù¯|ýÁé\ZhPh\Z\"‰L:ƒËfø|—Ïgó86ƒJ„“9×žS˜_\0ð9…yù…zú­óöwóôuu÷vuóvrÿyºy¹ºz¹:ûººø»¹¯sóXá±.Ê}]œ—W²Ÿ_¢·O¬»{¼‡gª¿?$$\Z’íµ.ÔÝ9ts¨§K¨K˜¿Kx°Kx¸sXøšÐðÕá‘ÎÑn1ñž	É>d$•š¦Õ0ËËÌ=ÝÕîë?~t×Ù¿†oœyõìö¯¯\0;¨Ö¥ÉåÅIÇÒôòÒÔâì÷ïŸÞ\\ØÖ×•k1P0H64\ZC@Â¨x4›Vw,ž‘‘\núYTb|4ð]JJB\\\\TxDp@ €OxdhtldhxH`p@@¿ @ ``@HHpxxX|\\lZ\nˆ$hæ.\n‚#`(ˆÐ|.O.•©JàG\'_OOo/çuÎîëœ]Ý]ÝÖº¸®uvY³ÖeÍ\Z ÷5k=×:û8»ú»ºº¸;»†8»†:»ü¶Êãÿù—Ï/ÿuv‰òðˆöòswõþý?®¿ü_—_þë¯ÿòvþO ÷šˆ·Øèh·È(—¸x¤?8\"œ@L`2¡bN«fØ¬ââB}}MngkÙ†žºý»ûÞ¹øòéÏžÿøúvfòóŠé&g¾M~y÷èîÈé£g›tÑà}Z‘˜ŸW€‡[¨¿wLXPLxpTèÊ–’ý¹ßÆÄ„‡„øx‡ø\'§ÄCáé‰Éñ‘Ñ¡áÁAþ¾~Þžžë<=Ýüý|C‚ƒ£\"#b“@Ò­yll*ˆH$§HT\nÅÉsí:Ïµž.ž@®î.ë\\Ý×¸®Yí¼zÕš5«×¬]\r>qv_ãâáìêåâêëâàìèì´ÖÕï?«ÖýŸ_¼~ù5pµsˆ‹[¨›[ óÚu¿þÛù_ÿ×åþåþû¯þ.‘!>i)aXLG ÄS©),T(Ä(•d–i6ò,F¾ÙÈ·™DÙY~¶ª$__S–ÕV_¼¥·ùÐ¾mþ¹;|ùÍÓ{“Ÿß,Ï~_š›\0öû×÷OÜ©)/Šõóôv]í¿Î9ÈÛÜÃ½Cý½‚¼=Â|bÂƒ’ã£V2+\0\ZâìŠÆÀiÒÏe,5)%¸/$,Ð×ÏËÓËÝm³‡§»·W` _xxpddXtT$€Î˜˜hàÇÄ„xÀÒÉ}µûº5ë<\087/7/wWOçukV»®Zµö·ßWÿ¾jÍêÕk×8»®qìÖ­uñZëêëìæ·ÆÕoÕZŸÿ¬öúŸß¼ÿý»ïo«ýV­ñ[½Æû÷ßÝÿýo—_~qûõWÏÕ«<Ý¢ÃüPˆx)`dR‚JIÑkf#7Ó&´gIò²åÙV±ÅÀ7j8:Ë d›4<«N˜e–Ø\r-Õ…[»[ŽìßqõÜ‰\'wn~yótòë»¹éï‹S?>mêë;D\\x ëï¿xºÄ„úÇ†Ä†úGú„øxDúÄG§\'Å À*\0IŽ‹	\rõ‹$‘±!‹Î ã‰h\n\nv‚¸„¨Ðð ¿\0o/WO77€\0ï `¿ Ð pºð\n\n\nüÿÀyºxy¹y{º{¯sórYë¾z•Ëï¿¯ùÏo«~ÿ}õªÕk×®eëì²z­Ëª5ëV­ñZíìõÛjÿæóÛê`g·À5.>¿þîùË¿Ýÿõ‹û/ÿãñë¯^¿ÿî½fµó\Z/—ÕÞ®HXœXˆW+©&ÛbäØL<«	›eäX%v«$Û\"Î4Š¬ZP¦Nh7Ê\nlêâl}©ÝXUÙZ]²±£éï[.œ<|wxèÝ‹Ç“ß?ÎL8q¸ª8—ADû¸­ŽÄd¤àa©xh\n25>=.’K‰EÃ’‰X(™–’	ZX@l\\8gs¨™F\')X,èŽÈô”´„˜øˆÿ·«÷ú‘3ËÓ3óV\ZÛU,z—&¼÷>\"Ã{ï½÷Þ{—á2#3\"½§\'‹d±\\WU»êi7=’\0Fj´VØ½Ø‹½Zìß°\'Ù3ºXàÁA\0 ˆïÏœà—A4t=º€Â–AiÃÈ‚\"Ðápî–ÝzøøÎ£•û+«¸•G–ïÝypëæ] ìÓŸ}vó(Ö; ÙÝ¹s÷æ­»7>{pã³Ç µ}rãáß|‚º÷€…Â2(ÂÃÇ0ð£¿øË{ñËŸ|½}vï.ôþÝåÛ7 oÉ„´HPŸIÚÊEO9ï.ç\\ù”=³ä“ŽJÆSËùê…@-ë¯¤|Õ”¿–	´ò‘^9Ù)&ª©`)¨¥#ÝRfgÐzr´ûó¯Þý—ÿ‡ÿëÿøÿïÿóÿ×ú?|ù¶˜ŠÐP“bVJl\Z™C#3É*ÈR‰ØZß¨«å|‹B%£ñ8…‚‘Hy&“ÊbÕXm:³Uk0k€>™RÈ°Ö™d\"ƒÆ@H0s¯ÝAá+@ß5 qíÚ#H„-­Üy¸z÷ÑÚýÇk–W€š}\0:ÚàëæM\0pvÿÞ½ zïÝ}\0\nø³n|úèÓOAIÂoÝæáð>µ&l0¸år)…‚¼uëþ¿ý7ÿæ¯×n|»sñàòáâ±AÉÍÄlù”£˜uå’¶LÔœŽ˜R!S>f«¤<µŒ·–ñÕÒþZÊßÊEú•ä ’êâí|¬w\n‰^)Ó«ä\0Ãfép{ôúòäg_¿ÿ‡ßÿøÿð»úwXLz…H#æ©6X:×\"¥|­ýñyn®A)0kÅškqd*	EÀB)d”DÂ1šf«Új×Zíz€É¢Ñ›”\nµH(á²yëÔu<‘ŒÆàá ƒÂQk@~>Š‰½¶tÝ°î>„Þt½‹Ü»ÿøî èîÍÏîÞúø{pïÎcÐöÞ[}p÷ñÝ[o~úèÆ\'>ù[Ø­›ø‡Œ|^/•Ø­U·J…¤ÅÄ€¬-ÿÕ_,ÿõ_¬þä¯à·>Á<¼M†>â‘Qn£¤”vÁHÙÓQSÜ¯KøõÉ€1±U“îjÒó_-èäc“F~TË¶²ÑV&Ò/¥FµÜ¨^TóµL¬˜µŠéQ»z´3yóôì÷‹ÿóûç7OÎÓŸC§²(*îºQÄ1Š9zÛ ášVµÈné•àÂE^\'£ˆ8(Œ’JØ&“ÂbUÙZ‡Óàt™ì.£Õ¡7˜AåJ%r>_Èdr(T:ž@FƒâE !×â«H4u=a€;èìÎ=ØÝ{Ð»÷ wï®Ü¹ýøöÍ‡·nÜ¿ùÉýÛ7ÜýìñýÛ«î­=ºyxwíÞ­ÕÛ7V>ûdå“¿AÝ¹I]yä’Šv+¥Ï;ß]žµê›ôàâÆ_C~òo·þ–ðø6Ÿ\0×èa»ªœr—’ÎBÂž˜Sc&hÊ†,Å¨£šðTãžrÌUŽºËw#èæc\\¬žÀ‹A)½YÉmVó½JvPËïl¶Oç[OOöß>¿üõ÷ßüãÿêò´UÊD]£˜gs­ Å€i”píj‘Ç¨:t.“B)fñ˜:Å¢cU\nžÍ¦r8´.·Þå68ÝF‡Ë`sêÍ6Á¬Ô\Z¤JHªà%l}I\"R0h‰† P›à*¶²„¼sqçüÎmèí›«·>{2uó“‡·~òèÎ\'ïÝX}pòøöpÀƒ[ð{7`·?}ö·ø·Y°•ZvÒ®ÿêùåÿõÏùì¢ä0ËpHÊƒÏP7þw÷\'tÈ}5“àÕ.m1jÏG¬À\ZP–ö³Asˆ‹ØËQW)ì(„ìù€­à·—BÎJÌ[‰z‹aàÑ[OÛ™h7Ÿ”³£FiÖožÍ·^ž½º<‰ûúó—?|ùþÉñþ¸]+Fý^Ü­»”BàN/dZd<^qèÓ!GÔjQ$¬s8‹ So8\Z·KçñÜ Î`wé­­Å¡±Ø5f»ÚlS-JQ&W	bH™†Áà`›ÁWÀÜXƒ<^ÂÝ¿‹½}ïòîMØÛŸ®ÝùdõÎOVï~²vÿäèîŸÁÝD=º…~xóð3ÒÊô!¹\"ÁÁ2þ8ü0Ÿüéû/ÿÝ»\'õBÁ¬¶²Hr<TMAéYx«€æ”±ìr–MÁ¶«¹-ß¥x\r\"€ï\Z±_/\r\Zåa³2jQÇ,Ú¨E±¨Ã×§&jÕÅ¦¤ËšòØ³~w)ld“ÃFy6hoõ[“^c³UíVK|º”ŒäCž´Ç’tâV\røÝjQÐ¤HyLå¸·SŠW³ÁŒP°ö’¹,<¨j£Al³*œNÝ¡±^›R\Z­Š?c¶«,NÙ¡µ&™\\-HØ,…F\'€¹Ãƒí\nv‰òøùÑ]ÂÃÛ¸û7Ñ÷?CÞ»¸÷)âþ§ðŸÂ>?ü	êÑ§ØG7ËŸ‘WnrQT”††ÖQQ>³b×\\µ‹ÿøÅ‹?}óù/Nv/\Z¹š]‘sZAB/ô+ØVE¾Žàâ—˜„‰Qr‰:U·AÑòÉ\Z.IÍ&6ÖmRŽS±áQ‰œrEÄ1‹86)ß.:b‡RâPÊ\\\ZeÀbŒ{¹H œŠæãÁTÈë2é4¡M§\nØÍ™€³æoÔSÚ³ncÜ¦ÉzMõ¤oXMÎ7«“v¾ð¸-J™pËÄõH¥à\0wVr£Y¦7I´F±Î$Ñ›¥&»ÒêÖÚ<:»Wovjt¹B+É8¼\r:ƒE¡­É‘„]ã\",|\rå¢VÙÈ&â1ù˜zDG>¤!îSáwÉ°;ëð»LÄ}.ê‘\0»,Æ¯ÊP-i¡ãBfN/§C?lýáéñçóWƒjÓ©+¹5§ªáÕ…U,%\"®0‘÷XØ‡lÂÊÐGGKÖÑb\ZJ@B¡RBÃ)Yd¡åÒ•,Š’EÕpéº\r¶QÄ3Š7ôB¾^´a’‰í\ZeÐnN½ÅD´šIF<N«FåÐk<&]Ìi.¥ ½´å¼Æ¤C“ñËG;\Z53ÝJ,¶:M¹ºÁÁËÄë\Z×`šÌ€Ñ\"5\\#3Zå&›ÂâTÛ<z‡Ïèô›ì^£Å¥7ØÔ\Z£ì+|!›Í¡ÓÁ¾L\'/Y84›ªg’´t‚j«\\Ç(éh%£ÁÅˆ€¸ÊÇ?V¤Ä5®gbTd˜ýXK„»X¤™”óûóÓFþ»Ýáo/÷¾šu:]ZÃE-ÛWLÃRQVxè{TÈgdèM2ìõ€[aãVYØU*ü!~åqí>öˆ…n°2ŽOÄ€B\nQJ§ª8L5-gÑ¥š˜±.ã°,JyØ–˜Ä VÉGÃ>‹ÙeÐÙ5ª€I›t\Zs^s)`ÍûŒ)—6íÑçæJÜÕ*„ªoÌ§³\nEÌ\'(e–§×oèƒId´ˆM6™Ù®°8TV`Í\r²¬™=!›;hslŸÅæ1é-j™BªËg±¹Œ%3“jbRL,Š‘E6°zNÏÂêXh-¡¡ÃTë%(ƒh(-¦§!´d˜\ZÑáá&\"Ú±NôsÖ³JQÏiÚ\n»v¾Í€9­â$•ÌiÜ²(¸“:–šú˜‡¹M~BEÜZÇÜcâsH&n•†zL†?\"BIÐ\Z\nÆ&`™8\r… \"áëhÐ(bM¸NáSH,ŽG![UÊ”ßWŽÇ›Ù,h\\A«Í­×[•\n§ZîÕÉ<Z‘[ÍwkøíFÔ¡,Åì­B`PµJ°9º,B™\0Ïg#Rª^Ç5™›ØdÌ\"‹]fw«m.€Æ~73Àî³¸oÄã	¹Á›Ûj²õfÖ\0nùê%ã:ÙÄ XXT‡jã’m\\¢•ƒ³pÐ6ÒÂ†[Xp+naÀLt˜‘\nÑ“Ö®ÿ‘„Ôcá*øš\r·‘pîu²ŸMó±):Þ¾Žv0Pq9m;i>¬x2F––öˆ¹Iþí:æ6‹ôˆCYåQátÜ*þ„X&#!D„\0ƒ\ZKF¢0kk¨•eÔê2¥ã°‘M\"2pX\"FC¡ìju)+Ec¥p,í	D¬.Øüe2“D\0Ö75,¦#ålŒV@ö[%µ¬{³›vÓýF¤˜²zíB1Å^_•Iˆ=Çf9Ý2³M¤7	¬N¹Ë§szµv·Öq7«ÍÂlr\\Áx(yÃ>€/¸&ì,™è3ƒbeÑìšƒKqp‰vÎÆFÛØ°³`VÔ²5Q âšÑa!@œ‹Ò£‘Z$\\AZÉ¸ QÔI6UÍ&ëx•‹¼}¿ä(;ùNBB¹GCü-w‹E~À¥­òéa„|„‡?ÂB#–¬ÝÏ#ŠÂ«kˆ•Äò2jm…\0‡‘Q2A„Ãpk«$Â(‘$Üî˜Ã±ÚÃ{Èd›ma‹Õ®¨¸Ô\r\n‚Ž~À#¯)yx‡–÷«‹Ik=ï®Ü¥Œ5Ö¸¬|“Ža6²-žÍ.´»$V‡ØbÛ]\n§Wcq(t&0@3Y=f«ÇâzB‰(Àûãá`\"ú¯D–,ª•Iµ³iÍÉ¥8¹$kg£ì,¸	8˜Pb¥­™É¢E¯( õ„“J1á°’åÇÒÕe‘”	Ž\nñ×›Õ«Vò´8©zK;(‰(\Zö2ý	“I¾Ç]_0‘L2„Œ^ÆBÂ—ï=º}ã³¿ùË»7>]¹ÿ\0¶¼‚X[C¬­Â–—aËÀécä5PËÐËI˜’Çõèt•Ê&W¸Ô:¿Î’ry«Ñ˜G«Ñpë¨G˜Ç?YÇÜ—s0Õ¦eùlÂ˜O™Êkµà¨äí¹´);›cÃj\0wNÜéQÚÝ*I,Ur4F‰É¡³ºA©Ú½8¤¡T<Ît\"ü¯,™é”kw,àŽêà¢µ³P6ÂÆ„Ù?b£C­4g$@u˜5b˜²’ZRøètmÅLÂõÊ§­Â—³Î“Nê¨â;(;çEó8£iF$Ý$EË¸«Ú}õ!“¼Ì$¯2IPî:FÈ¦ðd&…ÀíŸÏ“…\n±H		Â\r¹àúYq9Ÿ£Üà¨Á„•‹ƒVSÆç‰Ú­~£!b±%îZ4>*•R.«AÀà¡¸•O©È;Tˆ’5*¨3?Pg£úlLŸës)C.mÌ¤É¤!žÐG¢Zo@éðÈœ^¥Ó«‰ãÕhSš:0t,n³;ä‰¤âÑL*’¤#ÙÌÿâcî˜+›bc“ìgc¡mL¤•	ÜÁm¸uf¡ÂLd˜\0Óã`Z\\‹Aj1(9Âx_‡xØ´–ÓørPù°Ó>©‡gënÞ2/Yöê¶yÃ¶Y2–\n»žÌg<¤ïPŸ1HËÚ¤æG¼æDÈ•Œø²‰H)›*çÒÏT-—©æR¥t¬˜Œ€+j)®ecí\"¸ÿç†•B#Ë}ÅP°‰‹Åƒ^·™‡Œr‡@ß¦Ào10÷Et˜^BöY¹¨!7F|ò€[òŠU¥äè¶Cív¨V÷Gâz›Kâð*Ü7hð‡-NXAtF‡NoÓ9ýÎh:Ï¥ãùL,Ÿ‹åó±|!ú‘%=•h t’™I²°ˆV°î³®ÅY™(+pÇ@Xé3\r~mÓáaz<Â€Çè°h5\Z©@À¤U\rédQ3\Zñ(bŸ&ì5—¤ìàãªEÅ¼ß²ôœ³¶£W6ùltç1þˆIy¨œ&a!ášöË³Qs6jÏFÝÙ¨·µÙ÷šÓAkwÜ_LóIo>éÌÇ½Içh68ÝÝ<ÙNº;ÝÚ¸VU\n£raÞnœŽú“J¶\Zqú\r\"%+ ¬QDƒêÅ$Ÿyˆ+&Í©°&â“ú‚ G”MêUw·îõb¥Š7™±ÆRÖHÂ\Zˆš½A“Ëg´¹\r6·T«\'ì‰¦cñ\\\nˆK©R%U®&Ë5À’†„Ó’qz*Þ°N01ðf&ÎÂÄwV&ÆÂD›(ó:ÒHAˆp`Mƒ…êñ(‰ ÇãÔh”ƒÖã±FÎLÃÛ˜xïà \rë|HÃÏ_ÔLû-Ë^×¶Óqê– “)ÝXUá*1&è–6KþƒYóý‹ã÷/N^?9|zº8ÛŸîŒ¬ƒÙæÅáìùÙâååþë«ý7Oöß>=øðâäË—\'Ÿ_,^m=ÛŸ>™OÎ·7OFÝÓqïlÒÛïW·ézÜ™„*$¯I@âD$Ÿ‰Ÿk«ik5kËÅõ@œÓÂ¸…É˜º^ó‡©Ñ8;œä›x¾Å¬V§\nV§Çè	ÚüQw(ˆ¥£ñl\"‘K§KÅ|­Qh´óN®ÞYRÐ*\"FCÁêhXý:ÎÈÀwVÖµ>3cZG¨H	¡ÁÁU¨Ñ`Q\"A‡Ç«1hg¡‘mŠE¶³	`é«rÂ-ý^ÎN›ä•³šnÞ1ïôìã¶-Ú0i°^3ö\Z³ýÖû—{¿úîÕ÷ž‚kî³Óùñîx1íÍ†Í½­îåÑP´~õúìë7gß¼=ÿþýåwï.¾x¶ÿúlûÝåâÃ“ƒwg‹7G³W[Ïãói{¿_\ZW¢Í„3áPØå»‚îÕó\"vqÚ¯,Æœ£šµ&ƒŠ [àwn„|’BÎÚn…;ÝX·—luõV¼P	%³ÞhÒŠ:Q—?ê\n%|Ñt8ž\'ó™L©”«5òõ6°v-NŽG*H%	¥¦ µëXgbâ-¬ëè™X­%!Ux„\r“\"¡bØš$â48¼\n‹5IvÝ³Á\nH8a;ªfù¤-ý–q7jÀÖ#œAAºÝÒíô­³ø{+¢>n½hÜÅžŸwøúô×?<ÿÃï¾ÿòÉË‹ÝãÝÁv¿6lÜV¿r²Ø|q¾óÅ‹Ão>?ýöíéOß}ÿþü»·\'ïžì¼<ù|ï‡·g?¼9ûþÕé7Ï?\\ÌŸÍû‡ýÒ¼•ÙªÅú9_5b)…Œ¥°1ÐÄ\\Ò”_YËX[EW-oË\'õŸÄï&¢Ú\\ÆšLš	s¹âï\r2“íÚâ ßÝ,f‹‘HÒãZ»h*˜ÌÅ3¥l¦\\Ì”«™J=]i¤+Í%).#Àå$„’‚TÓ0×Û0ð&&ÁÈÀè8-­\" å¸	Á ‚µU1®@c˜ktd¢M÷‹¹q­(o“7ÀÞäyä›x5jÆ–CŒnN8mªg=3×*ir	É¸ç}rRÿðfûÇ.õÝ“_|ûôí³ÅÑngÒ-¶Šñj&TN:•øî¨v±¿ùújçÃËý¯^|óæðÛ7‡_½Ü{y2¼\\´ßœM¾~±÷Í‹ƒŸ¾8üúéÞ‡Ëù‹½ÁÉ°r¼Y:\Z÷{¹y;µÝˆMª¡vÖ™isAM%ajäì²«Yr\0w‰°*ÖÄÂšP@ð«Òi[­\ZŽ‹{ýñV½ÙÍ—ë©L)š)Æ²%`-™.¦3¥|¶Zi=[mdªÍ%	&%ÀdD¸œŒPQQšuào`õt‚Ž†S“0\nR‚‚aÐ\r„·º¶b8BŒ@¨83‹æ—ñ²E;b™×³Š³äßHØÈ9/­\Zcõ\n¢IS5í§]WJÉ¶7ƒ/.Úï^Ž¿}¿xÿrçÅÅd»Þ¯\'*_*dùÌ>½þˆÅ¸zqÐu1}ûdöÅ³÷Ogo.Æ§;µù {²U¹Z´Ÿï÷_Ž^ŽÞŸÏ{—ÓúåVãj»ùt§õ|Þ~2kœŽKónrXñ73¶bDWŒé[Ðm}ý†¿n5qCÐ+ù•¡€&Ô†ÃúlÖUkÄzƒÂt»µ³èïM¦;Ýv¿RªeÙxª.Ô*¥f³Øl›%1 R\"¸SRÑj\ZN»NÐÒð\Z*^IÄÈ°(1\n!€Ã6 0>äš\rL\0‡‹%k`’]bfD\'¨´;5ß¢åíf”Õ(¿™Úèäý²dX—êê^MÛ(¨ªYåÞVìýËÑû—“÷/§WÇ`b–ºÕH.f‹zõ>›Êe’9âSSN¹‡ÍäÁVõê°÷êløùÅœO:{›¹q=2ë$ƒìÑ¨td]›ê<µŸl7Ÿí´_.z¯öú¯÷ûÀÝÅVõt\\<\Zæ¶›‘fÚVMš»%÷¨œt£›í0¸KÄ‚êhH	iý>¥Ç-DŒ™¬»V÷7ËÛ»ƒ“éîÞæhÚj÷«Õf¡Ü(U[µJ»Qi·ÊíÖ’\0¿\"À­„8ˆˆ\0“\n2FEÁ©(x¯ `¥X´!ÿF\0GmÀ€5¤wý6-ƒ cáµl´KA)¤Ý¬¶“Uô‹rP¡Û]Í°!ï”Åõ¼¨œU²²FQ{ºŸûÙ×û_¿}þlt0+·ËÁlÔp(]F‰U#4)ù9Ç©%} ûf½ìéNãÙaïåÉàéAûtV™uý’X\rMêÑY+¹èæúEP¤“:÷|·óz\0Î‹Iõx³°ßÍœŒ\nÏÍËê¼›˜ÔCãFhØênÕ×,{*yg&iŽ†u qÁ€&‘°ŠþtÖK82ù@¹žh÷Ãic¶Ï¶ç£Ö QmW*­*`‰}à¡—yè•\rìš“€¦FÂ*H8	/\'à¤8à/Å¤8¢G’âV†¿þ©’ŠS®cä×@-…è´w£U÷KêqC3ëëv6uÃ–¢US¼t„SH‰ëEÝÙAáß~ñjruÜ\Zµ£é!`—;ô‹šoVòr®NÂ²ªøA«¢µêñƒqùb·yµhOK;½$°VOÙ›g;çîÃRdRm×“{,hpçãê“­ÆÉfiÞLí6“ Ój}uÐ}yÐ9ýÔv\'6j„º_«ìéÕƒÝF¨œw¥æDÌ‹\Z³g¹Œ%l.Ú4FâŽB%f(Û³ËÅÁÉöp«ÓÖ»›€ÆýƒzÈF>d#q@p—Ð2\"NA$È	Dž(\'DªŠLÓPéz:ÃÈbéè4%• #£Å$˜”UsàcP±,†ÞiÇ´ÙPõëÒn]ÜkH;uI1ÍO„Y™˜°œUím\'>¼ž\\Ô¦½X!av6-ßªáÛµB§^j×Š-ª\r»Fè3ÉÒ~c¯ÞíçÇåƒQT(ðU’UÆ¯+„å¨µ\ZwÖb\0G\'í‚ãbhZr^Ú³U‰žKWÛõ«Yý|«|¸™÷’ °“f´W\r´Ë^ ®ß·ªjÉ[Ì¹>>\\à­VCé´32„cÖxÊ•Éû‹•p½îË[;í½£ÑáÉôðdXb#ï˜ðûLØ¸[á£¡BJ‚ÇÉ€5I¬‘€µu\r¡§³,\\žS(4qYÊu¢„ŒÖdt¨Q„Ix6vúÞ“ÝÈVßÜ­Éj~%ÏnÖ„í†$ŸæÅ‚ÌL\\TÉivF‘íA¼4ù¬\"˜¢¯dlàË¡“|\'°©N(âÐÔRžÍjlÒL«‘rÌsÊ|&KËõ\ZA‹$bWÄÚ¨M2Ë’uÁg(zõ·œå€H¼Új<Ÿw.·jÇ£Â¢—šµã[­Ø¨é”ýÍ¢§[â\"½F¤S7«¡z%Ø¨…\Zõp.ë\nGŒ±¸5™q¥2îTÖÉû\n¥`o;<Þ¼¸Úº¼š–Ø¨,ä&¸»ÇF¬ðPP)Âa%x‚O”à;Š¸£¬kÖ6ÛºÁ3pèŠu¼Œ†’®ÃT\\„IŠ8Ù½ŠqÒ³¶+ŠrŽWÈ2YF¥È«–é;\Zd•sªAÛ5Ÿ&/Žj¢Óaäj$!#bád\\²œKUpiJÞºzƒ®±Ìrž[/‰¹t¹ ¥¶f|z·Ž§’”<¼ŒUrñê\r’AÌ°ÈyCÍ#›Åt·’ëV°2fP\'H;T›¹ÀÓYëÍáðÕÁàrV_tSãj¨_\n´ržJÚQNÛ[%_¯lV›ÝäÖ¸8dº˜­>Ÿ&6Æ“vÐïòEÿG|õFx8LO§Ù­if{šù³¸û@ã:tXðÂG#60!/Ä\0\"QB ËHT%•¦e0Œ\\––E•¯cåt¤‚Wó	Êk¦â¢ZAVÌð³)V6MÏeéÅ<»˜ç¥âœD”×iX÷wR;¹ƒB*¢•ò1|:‚M†q)ÈuŸ‚åÑ|2VL\'(8T	¤8µ\"¯Q\Z0É\\Ú\r ‹GZãWÙÀ\Z—öÊ&‹h.*¦¢T,¼Š‰UÒQV-j’ôÒÞ«­æÛãñû³é‹ýÞþ 7®…»=í,Ä,¹˜¹^ðvª¡FÉW+ú&›¹Ã½öl«²9Èóž€_	›’I{.ï-WB¥J Pò–ËîzÍÝª»Ú\rg§áXb\"îè°»ëÐ{tÈä¶ÊA@¹‰þ†Â\n08D¢œJV3(\n:^BEˆ©ñúŠˆþPÈ¸§-;ÍØXp=—á–‹Å§XdWÊüjET*Jª%õÁ<ñîÕðì°:$À]•G‡r¨0.)XÇ‰Ydá:‘KÄòHX!hLŠfƒa”p¬\n¾C-téDv_Å\'	iH!\r% ¡T@Ê$ªx4‹$^ÇIé89§d`;‹h= Ö\"¶ýnþÙ¼ûîtúùéäé^÷d«6ïç†µh5ãÊÇ-µ¼§UÖ@_Ë{7;ÉÝ­Êö¤4úÝT£­UÃ•JPTƒµZ Q÷¶ë@™½Û°ö\Z–%ü.ãÚÚ\Zä.míÞúê:ä1ºÊ‚BÙ08Š\0°aH.ÉC£7°1+£â$¤€´Ê\'=â‘ï±IŸÑ	Í¥¢”>p90ù¿Õ’×j¢ju£Þ·ZŠN[?º_?oÿÝ/N¯N›íš×eá³(«\\\Z\\Ä$È¸4•€%çÐ…T@¼N‘³×µ¶QÂ5Ëø6å†C#´«7t\"º‚KVò¨@–œM¾T|º^ÄÖ\n˜j>CÅ¡(5›¨ã‘m¦O#(øL“Jìt\\{s<þâröîböêd|¾ÛÞä[E1i«æ<b –÷ºõè¸Ÿ¹Û\Zw¦ÕÅ¬1•zÝt«Aïk7CÝ¦¯×tô›–AÓ´Ù4.±@âà÷®ÝAî­¯Ý__{@_{L_[a@Ö˜(°cBa,œƒ„óÐpfÂ~…‰ºMGß`à>a“?åÑoÈ„÷Ìh,ºÞëig;öþ¦¶Õ‘÷úšÑØ¼Ø]^–¾ýjû·?^ï—RQ­ÃÄ“nà´2†C/q^³æú›°T2€C£pëÕ“6hÑ-ÚUu\ZbN}Ðªö™~‹:`Ñx\n‡Vê6(}&­Ï¤¸µ2‡BàV:IØ(‹Y”Å€¥Ÿ-z…«ÝîË£ñ«“É³ÃáùNg±YêW#µœ§^ð7KÁv%Ü­E;i×\"­jd²Y8œwv¶jÃA¾ÛN‚ô5ªÁFÕ×i¸‡mû¸c™€‹P[ÿqª^O†ûè}Pªëk××­¯.wôµUúÚ\Z}Â€@Pá Öø`×#®±Ñ÷È¿&Ãþ’†ù+.íS¹ð¾IñyðÅ¢`wî>=lÍ¬ý¡n<µì.|OŸ•¾úzüËŸüÝ¯ÎgÓ¤ÓÊµ\ZØ5Óc“§B¶LØ•»SAwÒçJùÝé€\'ôæCþ|Ð›ñ»²°‚xJQo1æ-Æ½åd œæÂž¤Ï‘ò_[&èË†|)¯#î0¦Ü¦¼Ïšóš3nc)doeüÓFúxÒ¸œ÷Ÿìo^í\rÎv:{£ê¸•ê”CÀZ³ê7Ãvº]‰Tr¾BÊ•K86Ûé“½ÞÞN„n³›i7â`æ6*žnÝ9éÚg}ËNÏ°ÓÓ]/À<Ì#.\nÌS0³`ËLØ\n(U&0ƒþ6zÝõPf•‡[æãò‰÷ùä;2Î#£î±â!F&ÉÉ¤9å²hsdœlÛ:}M³£M­ó=ÿáqâì¼pvV:>,dR\Z™­’µ\nšU¿áµ©¼VµÛ¬ö[õ—5æ¶G]¶˜ËžpÙã.[ÄaÄÝ–”Ï–:²aW>ê-D}©€+ê¶EÁ›ÝŽÀãŒ»í	·5åµf}Ö´Çœp\ZòA .4mæŽ·:óÍóyÿt§{¼ÝÞŸ4æÃÊ´›o—£•¬¸ÖŠiw\"dŠQ¿¾]î¶[õé°Ò\0U<êÅ¦ýÀÎ¦k±i]l\Z÷6õKBÂª\0¿º]ácVxèU.j\rLU ‰ƒ€qp.à¡`|4lÊÃ=`co‹hÔ«n#!ÙhWÕÓ‘u22·šŠjMR\r®%/VÅåºl8µ-öƒ[;þÍ‘§Ñ´d2*ƒžD£ÞÝàÂTR²VÁÐ«x:9O-æXT¿Å´™Àé7fƒß¤óÔnƒÊgQíº¨Û”\0úÎtÐóØCKÀnñ[f@Äi½Î ÏžòYã.cÄ®ËømÍLxÚ*žÌúç‹áñ¬{¸Õ>˜¶Ày²Óg¯š($ÜåŒ·’õ&‚F¯]ð9µB`o»±;©n;Ã¸²?kîÏj{Û…ý­øÁÄw0¶ŽM‡cÃ’˜¸&&¬‰ðàÂ\0`ÁÛ@Ãø(ø\n±Fn`\0!ÄÃEDˆˆ´ºAxÀÁÝTp—z|\"À®dƒ¶nkb\r\rõº´PäKù²°X•ÔšªÁØ6Ýñ§®î¦½Þ2Êº`Xh6¯õëzÍºJF•n,<‡Š0IJ[%`Ëy9—¡â³\0J>C¹ÁPY:	Ç(ç[T\"›FbÓÊ,j©Q)ÑÉÄ\Z±P%(|µ¯ó´¢ëï‡ÕŠX\0·Až¸‡ÜÉÎæÕÁô¸ÛéÍº€³ÅæÉnÚ+µ+ñz>XLºãSÀ©ŠùÙ˜½WO\0qÓA¡S‹*Þ•÷·+ÇóÊÑ,µ?öî\r­{CÃÞP·$#ARâõ‡KBŒCŠ±€cÑbZL@KˆH)!¥@¥´Ué>C/†$üìÚGk“¡ikjÞÜÔUjâLŽO1ãiv±\"mtôÝ¡u0qv†¶fß\\ï˜ªMS¹f*•Íá°Ìjf+$DÎ:Œ‚[ÆÀîáhX(\r%À—‰ˆ*\ZJÇÂ8“\0gÁº‡âÑ°AÈ$	Y!‹*dÑxëd™H\'à¨X4 !!$ä*	¹LA¯ÒqP•õ˜{ÕÌé|ôìd÷òpëlot²;8ÞœïÏ÷Gû[­~¥UŠåbÎ¸ßrióqW§Ÿôò{[ÍVª”vƒBžôr{[åóƒúé<»7òìöM»}ín_½$%B>•|\'Áq%¹þ5/´”ˆ‘‘Q2\nBJ…Hi+’õ‡ú]›\Z™‰pÊYaµ(lÖ¥½®²×W·:ÊZCV(‹\nI½£ënZ»#{wììŒlí¡µ½ikì½¡g0\näóF¯Gh5sõj¦\\Dá³°\ZšEF±H×p(Á:AÄ$IØd	‡,f“Ä,’„C‘p©b€&áÑ%|æ“Æ¦’é$<‡¦âPT’ND±(/äP,\Zq:ìê×r‡3`jzºïní\0\'óáÙp79·zeà®œög£ÎZ.Ø¯§zõd¯–¨d¼É©˜ruªÑI/½·•_Œc[]Û¤¥›´”“–|IŒ_ã×$×ÉÁ$øâ®C‡”€ë*%#bd¬œ‚’Óà2Úštý±’ýX»±ì5a	n!ÅIF©™½ZÙhwä›C=˜íž®ÕÕ÷ÇöÍ-wïÚš£;¶÷¦öþÔ¹¹íÙZD÷³Í¶;\ZUFÂªhHës)¬¡FÊ²	BQÆ£°ü¹6Í*I%ÐËyZ	G#å¨%l…)Û`(D…˜/â±¸\Z“J¢°t2ŽE#l°©R!S%ãÔ\"¿ÓXL…ÍâbÒ=ÜÙÜßîïo÷fýÃÁÑÎàl1~q¶x}up2ß¹ë×3Íb´[Mn63@_&bù~‡ô>ÐÁcÜ‰Û¾AÝØ«*ûUI¿*ZaWÄ¸U	\"ÁÃ¤x¸”!%×âR<JNB+()§Ae×q{ æ-›e˜›Ò©È:5i¥À­U6z=ùh¤›LÍ£‰¥;0´z†vßÒÞ¼Ž[wìjmZê}}½ohôM›[ÞÙ^¼»é+–-õº§ß\rºÉA;Õ(Erqw>á©fÃÍB¬]Jt+©^-Õ©$ùh%*g‚ÅT õ$B®TÄ›Š\"~—×iuZ6£Îi5x¦Ïžˆx2‰@>nT2£nmgÜÙÛÞÜŸmÎ§ÝÅVïpwóDo><]ŒŸÏžÎAÓÖ´Wî€¸vùºrƒMØ­‹ûù¸£Q\01ŒNºñQË×-ë[Ey»(n—„KBôcfE‚[“~\'Ã#¤8„{=)%\'£”T”‚—¯C@ÜÄ´{ n5<eïM»Ó¨¯Õ;»¦Ý…m{Ç6ž‚õÍWmê*Mcgèlyj=}®&ÍV%YPÂ}ÓpÛ?˜ø{Cÿî<wuÑÿüÕî7_žx{òêéâÍ³ƒ/ßœýîê›wO¾}wøêÍùÛg‡//÷^\\,žžížîOfÃÃÝÉá|º3Ý\rÚ›Ýf¯]öš“a{gk°?ŸîmíoŸìœÍO¯ÿû¨éb{sgÒÝvãÓƒééÞätoügNCP¼»ãæ¤[â*Ìk°ë„a—¶˜p7ò¡^5>j\'·©QÛß*êëYY=\'ªçKÌ²ª*%Àe„Œ€”e­Éˆh9ý¯âÖþ,NÃ_±©å„ðd7pvXÌl;3óîÜ2ÛµŒ¦&¸éÌ5Þr5»–JÓÔºúO©©‰çÉ¢0]7æÉ<4ÝLwb‹ýüÉIãýÛùo~|ýûß¼ÿÝï~÷«÷¿üòýï~ñþ·¿x÷ÛŸ¿ýñ»×ßùäë·ÀæÅ—ŸŸ¿yzøì|ïùåÁó«£‹“ÅÑþìpoû`±u4Ì/N÷.Ï®/®ÎöŸ^^ž.Ž÷·÷w†»ÓÞ.HˆÛ>><Ø\\×,èw{ÃÓýáÁ¬»;ªÚ¹v%–Ø}VE&lí”£ÀÚµ¸Vrg˜t‚@\\-+«åÄµœhi»*À&%!e¤ëÚ¾þŒœ„‘SÐ\n\ZZ±WÐ!²õe1õ¾Š»j’!+)ÅÓ“ÜË«üÙqxoÏµ½cNô¾z06GŽN“ƒ±§Ö²v7ÝÝ¡;[VœxN­ÊºcÇü89?JÍÒ³ÝÔdšxùbô‡ß}þOÿñûÿþ_~üÓ?þü?üý×üí‡øÍ‡?þÝøñÝo~þúgß<ùöÃùw_^ýôÃÕ¯Oß<;üüÅÉç/Ïž?9º<Û¿:?xrqøüÉÉëç/ž?¹Ø¿8]œïeÏ.ŸœïÎ@Ð³Á4¸Åèp1œoww&­ÅVç`§¬]\0gù¸6í\ZÅ`2d®[ýÂ¨•é”¢Ãfr>.L{‘VÉPÍÊk9i-/YâbVùXˆ\0“\0)! $×EŠ¹þdœvýŒ¦‚ŽÓ¡\n&TÁ‚jø(½„÷ÊFíàb;~°ÙÛ÷ÏæŽÑ–¹7ÔõG¦­]ïÎ\"4žú›þÞÀ×h;¢	±ÝC‹¦…¥¦n0õîd¶ñÑ4ÞÐézž<éþñïßüóŸ~øŸÿã7ÿíO?ÿ÷ÿÅïÿîõïýêw¿zù›_¾øõÏžýü§—?|sñý×—?ýòâÃ›ã7ÏÞ<?|ýìðéùâìhçâ_¼~~òâéáÓK¸Ý³ãÙÅÉî³‹½\'g‹‹ãÙÉþdÌ±Åðp±9ßjÏÀýaÚÜ›µŽæpÁ:YtçÃÝÖþ¬>ì¤*9o«	¯ÍB¤WMº`ÚúŠ)U>!.g$•œt‰‰^cc |B@Bnxp‡	H9§¦Ut‚ŠŽ»~²•Ss1I\'Z×\nY•ÀcUäÓ–É8´»ÞÙ÷m/\\ã™\r4¸zKÛh\'ÓðînzÐKf—›£ÖaÃqq³çm‡GY°‘”«¦rÅT©š/.êÿðÇWÿíŸ¿ûŸÿû¯þëŸ¾ýÃïŸÿøËó_þìì—?œþâû“_|úË.~ùýÅßœ}óÅÉû×û¯Ÿí¾¸Ú}z6;;Ì@Å%cx~4}z¹ûìj¸:ß9?Þ¾žœî®ŽgçS0>N†áÑ|°·ÝÚÖæ[€ê|«²Ø*ìÖŽ÷šgí‹#Ð\nKýf¬Y	Ûk5ç¯çC`>´JÁbÚõ£^.!*e%KëÈU\ZÂ! ø$$\0çá`|L€GÈ¨8\r“¬f\0wx-gÀµ³Œi”òõ‰Z$’xN›¼\\±u7½‰­?1÷Ç¦VOW(ËÊUíÎ,~|T\rc…¼ÅjaŠ%pPØì¸·v\'çÕÙn²?ðõûÞÁÀûüyû|öŸþÓ»úÏ_üýß?ýéOç_~˜~ýåì›¯v¾ùrç§_/~þÝ1Ð÷Ý×Ç_¿?xÿ\ZÝ—W³§gÛgû£ƒYïÜv@âÕÙÖÓ‹Ùó«Ý\'ç³óãéÅñÖ““\0wq¸ur=L7OÀ]ÖÊÛ€òî´°3ÉíÍJG‹ÚùQûÉ9Hec6Î÷[ñjÞWÎzË4w.nK„ÔAÏF4¸QÌÈjEÕ±BC­±ðp.É%À¹x€AÄ1È*QÉ\0â0\n&R\' Xå<«RfQ\Z”B9—ÎRÈ¸^¿,ž–§Š’|UR®ËË5E®(­5ôû{™«óölš.f#ƒÏƒ¸\\¼jÝ¾3Ï¼xµùìEïé³öåUýü¼òáÃø÷¿¿üÝï/~õ«Ã_Ž.¯Ê¥—/Zo_÷Þ¾|ñvüíWóï¿=øöËý¯ßï}ñfñöÅüÍSàk-XeGà&py4yr:}z¾õü8Ýº8\Z_O¯N¶ŸœÌþEÜÞðxFÁGq;M`moVÝÛ©Ì·\n;ÓÜb–?˜—ÎŽšO/Ç¾íQ¾ÛˆVó~°$Åƒæ GôHÃ>Q&.k”õÝ¦y‰_¡\"×˜8 Á!À9×â ÿ\"Žò/â˜@J/ Z6•Ê¦±*J™)à3ÍV¾7È¿îýY^®$*”¥Ù‚¤Þ4äŸ_õv·s•’Ód`pX«v;§\\±Î¹ÏßNß½ßúðåöÛw£×¯{ß~;ûÝïÎüñð›o§/^6öÉ\'WåWÏ›¯^´»¯?Ì~úõÞ7_.¾z¿øðfñþåâíóùë\'»OO·²‹ƒÉåáH|r:yv¾õâ‰;šüÿÅ->ŠÛë|·¿¨Ì·¸ì|;·¿[8;j<»<9ë_wA7;ÉZ1Ž9Ã^½Û&ñ9E¿8ŸRµëæÍ®ýÿ\\»iNéÕƒ\0\0\0\0IEND®B`‚','50.50/p50x50/62269_443148261251_7820212_n.jpg',29734,'2014-06-25 16:10:25','image/png',18,'\0'),(17,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\04\0\0\04\0\0\0J\ZŒ¼\0\0iIDATxÚ%—wtSgÖîõ÷½sï7À`lã\"É]¶$7Ùê½÷Þ{·ŠUm«[¶%ËrÃÆS	0“„4II&”T L&_úGÖ=YWk¯w¿ÎúçÝÚÏ³A¾€T©Á»|BO@â\rÉÌ.6_Š29¸NÔî”:í\n¿Ó0äsÅ<Þ!GÊõÇsÁìÂèÒêìÑ“GÏ¿÷¯ŸÏ½ûÜÅµ/Ü{ñÝõ—?Ø8s©tîòÆ›¾ýÁï^Z{÷ÊÚÙ+¿ŸýìÁ¹Oï]øü÷óýôþÇ?|þåÿ\\ÿòÇ[·~ºsûÁÆÃÒúÚÃß~½WÚ(=~Tzø¨ôÇãÒ·¿”nþT©´$©£ÔÍvŽÎDèl¤ÖÈF¡ ÉëÖyìzÙàÖé}zË Íw„ýC«Å}¯œ|û¹Î¾ùõ…KwÏ¼÷ôk/¿¿þê¥ÒÙJo}T:åñ;—×ß»¼öî‡÷/\\}xþú£ó_¬ÿìÎ\'_?¸þŸûßýü`m}ãµ{¿­Ý¼ñÍ…·ÿuîÌ;7¿üöçŸîÞùõáw?¯]ý÷ýÿ½b°~w/\ZL¦Áú0F&·\\¿Wë²+]Võ€Ãì³XÜ:“ßèŒØüa aperù•œ›™<¸¼òÒ¹w8ýÞ/¯_~ðêÅµÓWŸýxãÍ7Þºòðü¥ûï\\úýÂ•ßß¸|çôåÛo}z÷âŸÞZûÏOøyíÊ‡_žzþõ£‡OìÙ½wº0›-,ìZ9xàÙ¿{áÈ±—?ûúÁ\'ÿyÂà\ZiŒ8¼ÝWî…2©¥W²œF©E#v\ZÔ!—#`wômVOÐæó\Z»g~¬øÌêÑo*‘Z|íí¯ß¼üëËïß~õâ½Ó®Ÿùpý×Ï^¾÷æå»ï\\ùýÝï½höÅ½¿YÿúöÆ÷¿müÏïç/|<>:—ŠsÓsÅ]+{f\'çFSããS+Kû—W}øåÝ¿^A¡OÁÛ«`-åèn(ƒ„”qñ*>EBÇÙUb—VáÖiü‹Sk0+u.£ÝerZZ¿Ñ²+Z>0_>ýÖµ®=xþï^»|÷ô‡^ûèÁ™îŸýøÞ;Ÿ=¸ôå£OþýøÖí›·ûûÆ÷KwÖK—>º–L-&O6•Ÿ+ÎO|…¹\\f<\ZˆŒ¥s«Kû÷<þÑÍß>úfÔÜ´­¹¡¬³½¦	aá‘N áµMj‡LhpÍb±]¥¶(5ÞivØVµPlW(çGÇ÷îZÞžË/{îÂÅë÷_»ôó™î¾þÉƒ7>[;wuýk/ÝzüÅ¥ß)}w¿ôý½ÒÏk¥Ûk¥+ŸÞJgç„B­ÙàPæ‹»¦sÅ¹‰éÉ‘Üp :‘Í­.®8tü‹oï_ýá1¨©±R»	×ÓHèiÂÂ¡nµ0ö$f›¡$“4L¦^(4+•N“Éew˜ô…€o’ˆsƒCÅÌx<’J%‹sK\'Î]úî½/îŸûäÞ›Ÿ­½uíÑùïµqå?¥k?—þý[é›_Kÿ¹]úþ×Òµ[·§wât\"¡ÆaéÅŠ£…¹üÔòôüÂÄt*<4‘]œ™?tðØÍïï_ÿak-ïíøŠLÄa–Ðóa÷tÔTËì|¶]À5ñ8J6S%ä™´*£A«PJ¥|ŽY\"Iô{ÓÁ¡¨o(™(NL:uö‹K_®Ÿÿìþù/Ö/ÜØ¸p£ôÞ—ÜÜøè›ÒÕÿ.Ýø¾tõæ½ÏnÜ^=ð‚RåârTR±Î¬·ÄFæò3³ã“S#¹\\\"=èñå©¥é]ÇŸýÇ/¿=úþ×Ç è&1ýÒÉ=ç_y6jWŽxÍ#.“GÄ\r($QÚ«’iù,)‡¦–ó5Z‰J#Ñ+¥N…2áòc±D!¿4³ëèÊ¡3—¿\\:ììÇ¿Ÿÿüáû_–Þ¾ºÜì¿n<ºxãOoýñÙ;‡ž9m±G9\\H •5F5™Ÿ*ŽäŠ™Ñ|2r¹§FÇVfwí]Z=ûÆ…¯nýbRá=óÌK?<ÿÂäpÿÁbf*ìñJx^	ß+Ú$\\%‡*bÅªHL—É8F•Ô£ÖåC±=……d(ÏÎ/.ž|úïï\\¹¾öö‡wÞ¿þÇÛŸ®½qå·÷¯¯_ºùøü§÷?¸¾öÙÍÿºòM23Çãë\0ÙÄB­€+×È\r‰Hbjt²˜ÍÒÙ‘Á!—Á8™YššžÉMd“£‡>šóÇ#Æ£¦ÎüsÿÂhäÜ‰ƒsñ ]È´p6UA\')\'æ“y<\"—CÐÉø!³µI.ŽÏfÂ#c‰™½«ÏŸ~ãó+ŸSã·+7_¹ùðÝÏ\\¼±~åÖ£+7ÿøäÖÃoyxáý/B‘q6GÅe+…|\r›.’‹T@Ï²ÅÑ|>™‰\rm\Zm!Yž.:—ŒMŽŽƒ^<±gq*±w>{hw.°šÍG,\Z5ø+Pô\0Ÿ­0ºJÊ”ˆ¨|\0NÂ\r™,Y_d*1ž¦ó©Ù#‡^zóíkŸÝ¸÷É—\\ûvã«ŸJ_üwéóo!òèæOßÝÙøñöúK¯¼çõ¥ø|-‡­Ú˜FæKÊáP<—É²ù|j$Šz-6\0n¡09•Hg&3ÐîBr,îO„Ñ~“‚MV±iÔ.#w\"…d‚E!qêTF…H!dò˜x§²ý:ÝDdxq¬˜\nÆÇ‡öøç?ß¼~óîõ¯Üúáá7¿”¾ú~ãÿŸ?äî£×Î^IÌkµ_Çf)ØL…Èñ”C!àûr™X&5‹#~»+Ž¦#Ñ!ŸÐë»Ý 5¡qäº‚Ã¤öu·Cê\Z+«\Z*wÖWTµC 4F¼R\"³hä¾.2ªCF\';eÒ¬`i|\"‰å’c3+3S{®Ýøñ‡_Ö¯ýÛ­ïÖ¾¸õÛ§7~ùüæí~];÷Î\'Ñá‚@dâñt|ž–A—Ñib2‘+ä«¢ÁD:ž\rz‚»Ûkw9\rÙæ6šíZ½Çd5)Õ ¾Örg\'¾£“G¦Ð±¸öú¦†àºòÕÛ*+6o‡Tììƒ#Å–F$R)LLŸˆ„WRI&>7îveÃÑâèø\\q.“Î_º|õ»Ÿî\\»ùÓ{—®½ðÊÛ§ÏþëÔé·_>óNflF®´1Ù*¾@Ïåh¨™Ä\'¹b¡.8Åíf§^©7ªôµÞªÑÛ€S­óš\Z‰\nÔ¸½²µ²¦µ\ZLìêë!apE]my-xGÝÎ-•Ono«Ä!ºb™K«5ŠD*&]FÁxŒ£vØãJG#³““™Tfßþ§Ï¿{ñ­WÅRcË{¥³ùÈpÒhv\nE\Z.WÍå¨©dÏ%8D<[$P{Ýá ?j7»tJ½V¦6«ôvÉ¡7Y5F—Ñ©•iA5Ol©ßº£¹¢\ZÕÜÞnD@[Zkê–®úV²—„èi«ªm«ªæá·U85\n£˜k³^ÛD,q[üK&1äéw••½ùÂ”o 2ˆúý¥R¯Q›R\r‡&`94<‹„¡Sp††E‘x,±Ãâò8¼.‹Ë¬5éäZ‹Úà4XËÜ·IcA6—!jÁ¨ÆfL+ŒÔÙEïA±zzùh¬W¦80:~ptÜ/—©kdã{4b–^Ê¶(xãC¾ó…TÄòÙâƒZ­Üj19þü9ûÝ¾l&/äÉ™IãÐÉŒjžBË•hy[ ¢qX\n®Í¡2jYk´êMFõŸÊZ›öOÙôrÃèPË4 T]ÖJï@rz»Å¬œDÐÓ(ýBÞtò«×Osöõ7V—\n>‡ìkÞ)¢÷š•·QR‰YMyÝvm:r»ÍN§\Z›Åáq0)\\)_•ågÇç²¡øˆ?<\ZŠ†lNƒX®HÔB©„Ë—Å•F+W)D2_¬+ÍJ½^¦–ò%*±JÀ‚mMÜÎv\n)Åv«Ih\r	mg‘ãZéî×«s—Žìýèø¡7÷ÏOxb\\×ªâÍjv2jÏg‚Á t­Nª7(®D\"a39EãhäúÉÑéÕ¹UÀ…*mÈê;<z±ÜªÒï±9,.ŸÅãÐÙl*“ÏàjÅj»ÖjÐ	T•@ñM¢ÎqL††«pH5á``²:Én¯yÏz<<37úîÁ]§—óY‡TËè°ÉÉn‹Ðm“:Ìb«Y¢\ZKäò)b	›Î ÛíÖ€€F¡¡{Ðl\ZÇ¬1k%j	ƒ+¥³õb™F(‘°¸&¥ ÓÈ•,\ZƒIeÐÉt:‘Ê¦0¥‰V¢ÑI42¾ŒEfâû >¬V„„Š»\Zd½-*l»×îec&Ì²ÃCýÇbž“IÿËù¡w÷M^ùûî£ÁÑ ì³›¸¦?‹§ÕqD²Á$I¤áh¿F+\ZÏÍM‹…Blo/OâÓ8|\Z[#’¹ŸÕ©Ié›ÆÄB®B¢ö¡Ð˜^,®Oè#1d:Î\"2™$&ŸÉ%b zý^{¨£^ÒÓ¬ÄÂD¤ŸG˜°H÷‡íÿÈÇ½ÏeCöN~|bù½ù¤Oï­òP:K¥¥Åxž§P³‡û—÷L½pêøñGþqâèP$$H\rGrøNƒ9âñ§‡}—É\"`qD<±·§ÞŽ@´#»;zÐÝ z‘½(\nèÅtaÈ8R\'¼D‚Vp\rÂ®AW‹Ý¦$tZ™˜A{Þgy&Üqí8E^Ý=öÆâì°…O	x=2‘Æê$Qál\Z…nFcÛ“éà÷ßU*=xôÇïï3èuw´Á0l™ŠÅ1I$ƒÅg±R™R¡ ‘H‘Ãá	b‰H*â‹9t.Ðg€~$4‘€Áw\";@”–>\nÉëëdöÀY¨v\Z)Ã£Ìt‚—ÏR&lº]~ûŒÏº’81?6?â7ÈÉ\\nWØKa àU0x‘‚ˆ;/^<»¶ös©tÿñúÝÒÃ\'æÐÉ«yÿââ‰#G‚•€Ç¢{ñ8,îîîF\"\0¢N§·Yí>?4\nù‚~·Ïçðyœý6‹Õ¨7€ðíðNV[\r×¶CÁíZ$¤Õ\0Æ7ÕKÐ(‡afRu4’’‚“S±\Z†Ø×Ò‡†âHÍ\0¸~“DF|ãìÉÇoolÜ)•~àÖüOéñƒÒÆÚÂTaßî]\'<ýÂ‰¿¿øÏ…±ƒooíêêh‡Ãjêª«ª+¡\rŽ®N*•*•H\0\Z«ÉbÔ\Zt*u:™\ZAË«k·UV••WlÛ^Q¶mGÙÖeeòòÆíå­Ûw€ÿ¶©qóÖŽšš¦ò²û?•›ÿRóTCÃ“ú\'Údj»FM\r;V—\'ž;¹ï‡o®–ß-mÜê»¿¼yú‡Jìiom>¸µ±ëBÀÐ}]€jõ\ru-­\rÈN8\0WS»sçÎJ¸	‡cÐ½˜>to\nH\Zj¥\nT¹¥bgyuåŽêmeOmÞºeKYùÖíUÛÊë¶W@ËÊ«ÿº©ö‰§ê·mßùä“ÛþëÿÖ–—¡{ZÅ\"¼ZEµY~uh@ï²Ëœf©ß¥°Þ3÷ñûo­ÿöSéÑý‡ë¿ÕÒšòÍªíÍà*hUyk}-¦·£§ÞÔ!Ñ©€HÆ!:ÚjÁ;mvVW66AZ[›››\Z --M Š-5;jª*j¶n)ßôäf€¯lkÙ¶§¶T>µ¥â¯›\Z¶í€¸ÿû/ý+¸¬¬zÛ$l5	>uÀ£ô:åa¯.âÓš­î Óz.Í~úÁ…?Üyåùãl`¥…Eè£âº9t<	ßokÀ`:ÅŽHÌaqi<\nÖÞ†T×« Ð\Zh}pÖ×C@µÛ*êvTí,ß±}Ë–­[6ï(ßVµc[Å–§*6=Q¿u«†Å\r¤6XÅ_þWÝSk®,£a~€%sùn“8âÒD\\ºA·i|Ø?ØoIÝ#ÑÛ2>³ù“ÞMDülšGèÑ*FÌ&Q	=Ý‡‰™2O¦Ä,2\rÛ‚·¶×Ckk!U€„@ eÛ\0IvX›ÿVQödME¸rxûæÚ\'ÿ\n¯Ü>hÔ¾þôþÑ~rÇVè¦¿ ›jôBjÐ©ôÙ¤£xÀ*;4‹2hVÇ<– E›ðÚ3aov0°2S8¼wñ—žŸ›5Jx2\Z^@ì•2ð&€†OÅ¢Ú(Än•’«Ö•jTÁÖ! Q¸ž>D3\n­¯©­«µWlkÞ¾Zö$xÛuå›À;65V>ÕZùºa\'½ê1_]ž=½<–óX¤šÒ#& Y˜€Ò-eôIi½2\ZFÇ¥ù‹¤ãÒ€Ã(æ÷5ñ wh ßnÐØõ*¿IíÓJ,bV¿Vœ9Cn—Ž!â>I&g‰$t¾˜&”2¤*®XÁ¦sˆh\\\'ÙÚ\nk±;`4x#±\rBhcaÕ¨¦˜æJ*¼ŽØZg³†]¹_[,ÎúÌA)-  ÑÕ]õe¨–J<‚iw7ìÄµ50PHrŒêä±,L/›€5Ê$C¾~£\\¦äsJñ€AÚ¯æ{õâ˜ß4àP	˜h\nÉãâ„\"²PBÉ%[®ªÀ€ùŽ€îéí‰z’¾1º]Ô×,@Aù=`~˜óÛ!¼¨	sRpÍNEEÔ„‘EmßÞQÿ$ª­²·½Q_Ù­†Cëz`­°º?Ç$0×±8¢jU*Ã§]¥U°ÙrIHîS»ÝA:j{ÕV7×,á$r²HJQh8r ôé$r­Ô`3¨*¹F!UJAân¤Ý¥Ä äèfY/TÞ‘v×‰àuœ¦\Z¬‰Û\0å5ÕÌI—fÊ+ÏÚÙ¤»ùÉ¾Ž*t¤­¾Zµ}Çæ\'jjjk ;«ZÁµ­uµMÕUê?÷^ qª4\"º«q±¢`Ýf^À-uÛxZ5I.ÇË”d¹Š.U28BŠT-Rè•—Ýà°š\\v“Ëu#¥}\n4\\Þ×,CÕËQi\'Xs›Áü–&jm5¿µ±àÐÌL\r(&DÃN†’‡èë(ïj«$öÁ$\\ªˆËÐ*d:¥Ì i¤˜gVŠ#N«K£‚J6°Jy½­;{šËÙ˜EMs[xvÓãJ»S¨ÐÐ•:ŽLÍ+ùRÔîqY½n«×kñzA\\LØÝ.AÁ¤½-RT“¤»A„€ò`B››Xõ\"$ÌÁÄ:9¨yßtTRŒ+|6*SÍ¦´…<Ú•]¹…éñéÜ°îž\Z_š_ž;°8¹gzt./ÆçG£A§QD&wB˜˜f›š6àYtT“–ªI{ ,r¥–¯ÐŠ4&•Ýãpø¼žð`xHÂld3¿»UÒ£ZìV(½¡ŽÓÒÌimu TØn-	)DUk¨Œ—Vˆ‹cA®YƒÉÆMÇÏœ~þÐ¾ÅÂDfx4Ü·»pâéÝÿxf÷©c+O/åOìŸ;±:ûÌîÂîÑèhÐÒ¯áØäT‡†pˆ‚n±UO±™Y¡ &1Æ®È°ËêÔè,J{¿µ?àóF=‘ˆÚ¡ÃëÙ]ÍÂž6A7ŒÝÞHi€àëjÉÐzjc£ aacQ@K´ˆZ‡\\Øñ/3(Œ…DO¯¦^81xoad¸ßgÓô[S£‘Ã{&Žœ>qpj!98Ÿ9º<qt1¿\'?¼8\Z^\rÎ$=I¿&hzeÃ¥Ç!0X ƒú‘Ñ`j$K\"ýNŸËú¢1	VK‚ÕQ¾ŽV`¬ÐaM¤†´†’8m2bG@ÏÌøù	%¡%B´¨1šPŸ8’ß¿”Œ‡Ì&[Î£H9„H¿v¡0øôbvß\\btÐ’¶Ï¤ý‹cÑ=ù¡ÅÄþÉ8À·8(Äl© fdÈ4ÒºíB³‘c2ñ}~}dÈ•Í\rŽŒgÆáX88<Â6W¢*qÍ5”¶FFƒg´#Y$ÙNC6Ñ»Àv%6f‡Y#1zÄOè·áFš£GÇ6­„\"ãà¥l¢Ž±(Ø…¤gyr(7lXÅ!»tØ­Iz\rùˆ}&ÖŸÛ¦†]{&¢K¹àdÂ‘‰ãaýpØàuËûÝ\n¯O£3\nœm<å›šÉS¹BÔ×PŽ‚–÷B«ðÍP\nFÈàœÎ	ËEuPP.®!ìbåRÒˆ\ZÀ|x·\r?’ÐNç<\Z	†iãP*V@A+9Ä°S÷tB‚Ò)a 4|’‚…3	ÈV!¹_Éš‰{L%vøÆ¢–Ø€ØwQs<jIÆ¡ Ád8ûUŸ.6ÍÌÆæf‡@½\råÝí=àJt=0›ñM­Ä–6*Áéébt·R»ÁLFÒîsaýÞ¾ß€?.í\n\rÔ¸n(ÙHìnÃ´5QzàrŸ’KÒ‹KWŠÖ\'u6Óº[˜=-\Z&&¶Ù•Ý[ŒçcÎ¨Gt+†‚\0n2NÄm\\é÷ëBaS(¤Ž*ƒ2ª~{x[gmyOÝNŒªƒöAê±M\rdx¾­º¶µñƒ\\îv¡“)öÐ0udD¼ºúû‘q›EìkâAƒAbaûø$œ’MUq©	SÂÄJ™@K)ƒ(ìÔ+¥ôê¹¤!‡f9?|d1·:“\Zv†=ê¡€!2§cÎÑ´·˜&â®hØÔg†eÙaÓTÑÝ(ÀõÔÕ¢êêz!`tc-VÝ×²ß¹UÈ›ôˆx‚+ÈÓYÁÜ¼íðáäÜŒÏéó0­È¢–Ø5\n§VÙ¯SÛÕ@ZQz-ê€ÃàÔ+Z•S¯v¨¥ýZ‰[-\nÛ5ÅTpe*½XHLfÉ°m(`Y<vyÈ«›+ÆFÓþTÌ™ÒÒòbš\"µÕZjpMuØ¶¡×šÐV‹iÝÆ&ÔºŒè‘¤ ™äÃ¤@„Kñs],)·XÈ4J—ÑÉ$uS1]rCÄ Ë˜T! ãµb–Q.P‹¸2.[Âf*ù,€¡äRú\ròbfpqjd.Ÿ/$™pØkðØä%ËçTMG²ñþé|t®àÉ*f³|µ½ŽÚ¡À\ZH-õä–FJ[Ñ@í¨%\"·é$ðÁ -“æÆâLïRâiI\"+JI²€X,ìÅ÷5#[jºaPdS]¼	ÛÑÕNìEÐ]èND\'¬Ñíh£j3ŸŽ®ÌåŠ™…âÈî©‘\\*èw¨=VEzÐvùŠñ”ga*Oˆò	&ˆÜZMiS`\0Y¥µ‘o¦wÔS»vrñÕnS¿¿/À¦G¸éQ<-NŽ©âYy<+ÉkÇò–þ~ß«´ê…b6A+e[TB»^¢—sµ2Ž”G“‹8\\&•‚ÇÐIX—¦Qðý–üÈðL>53‘Ú5™Ù3—_ŸÈ¥B‰°sÐo¶jøVo(`KXâAV\"H›ª¨00­­žÚZOF²‘Ñ¦tîQë2ƒì©¼¤PMLÊ²cÒ¡„0šg¤®\0Ñ?ÈÉò“®Ã‡ò¯¿zäÔÉ}¯¿tôõSÏ¾~êÈÉg–^Ú·8µwivn:?™ÏÎž»0µ²8³º4»{¶0™KM23cóÅ‘yàŠÉlÌçµ)uRÆð€%3èœÈ8#ýŒˆ—ÂµÔá\rtx#­½	ÑÑÌè†ü©±~4¦^ÙížœR&G¸ùIuaÚ\ZK©‚Q¡Ñ‰&…Sóîü¤c²è¹ôÁs7®ž=öØÛgŽž{õðó\'–NÜûìÁùgîÞ»2»wyîé‹ûWç–&W—¦Wvg‹Ù™ÉÌt!UÚUL.ÍŽÌMÄF“ FŒ§üñ€u2ë	ºéÔÓX‹ƒ7ba|+”ÕÝÎên£÷ÔóI	Ã¡à}^i~Ê0^TFcœxR‘Ï9Í&ªDÖ•5æ\nvÿ\0?›5^¹râêÕS/¾8wê¹Ùþ9sú¥•çŽÏ90¹o)?WHÍä“KócûöL®ìÎïY˜X](,þ©Yfn2QÌ…\'ÇÅÜÀîÙáÝ³±Ô°ÍïRE¼†·\\«@<TZnk@Ã 8˜ÕÕÎêic šD”^›GX,´ÞŠuù	¾\0ulÌ°01L,1=óìøÑcãÏ>;röìÒÑcéÂ¤ùàþÁ§ÄŸ;9uòØÔ±CSGö÷ì\Z_žÛ³0¶ [™Ï|‹3£óSé¹b|z\"<=˜ÌywM‡ö.§æ§c‹Ý(QI‰35“ÿ?œ»[ÄR`Á2\0\0\0\0IEND®B`‚','50.50/p50x50/62269_443148261251_7820212_n.jpg',7842,'2014-06-25 16:10:25','image/png',18,'\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitation`
--

LOCK TABLES `invitation` WRITE;
/*!40000 ALTER TABLE `invitation` DISABLE KEYS */;
INSERT INTO `invitation` VALUES (25,NULL,NULL,NULL,NULL,NULL,0,NULL,'\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (122,'Bernardo Roubach',18,18,25,NULL,'\0'),(123,'Andre Agassi',NULL,18,NULL,NULL,'\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerinstance`
--

LOCK TABLES `playerinstance` WRITE;
/*!40000 ALTER TABLE `playerinstance` DISABLE KEYS */;
INSERT INTO `playerinstance` VALUES (1,122,1,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(2,123,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(3,123,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(4,122,NULL,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(5,122,3,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(6,123,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(7,123,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(8,122,NULL,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(9,122,5,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(10,123,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (13,'Belo Horizonte','Brasile','Lob TÃªnis','\0',NULL,'','31 96862253','9eae4f99bf706557bd69de4c8e18f140',16,17,'','',0,'','',NULL,NULL,NULL,NULL,'\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (1,'2014-07-16 00:00:00',7,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',18,NULL,0,NULL,'\0'),(2,'2014-09-01 00:00:00',6,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',18,NULL,0,NULL,'\0'),(3,'2014-09-01 00:00:00',6,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',18,NULL,0,NULL,'\0'),(4,'2014-09-02 00:00:00',6,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',18,NULL,0,NULL,'\0'),(5,'2014-09-03 00:00:00',7,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',18,NULL,0,NULL,'\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scoreshared`
--

LOCK TABLES `scoreshared` WRITE;
/*!40000 ALTER TABLE `scoreshared` DISABLE KEYS */;
INSERT INTO `scoreshared` VALUES (1,18,1,'lala',10,10,'0000-00-00 00:00:00',NULL,NULL,NULL,'\0'),(2,18,4,'9ce3b42ea5c722ee5481de887b55f5c5',2,2,'2014-09-02 00:00:00','Bernardo',0,NULL,'\0'),(3,18,5,'653c3b11eaabebe998627e4fb7cbce95',3,2,'2014-09-03 00:00:00','Bernardo',0,'My spice!','\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (18,'Bernardo','Roubach','broubach@yahoo.com.br','1981-04-28 00:00:00','f1668d75e368033b3eab3d0782b0cc95','M',13,'2014-09-03 18:00:28','2014-09-03 17:09:58',NULL,NULL,NULL,NULL,'\0');
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
INSERT INTO `userconnection` VALUES ('broubach@yahoo.com.br','facebook','784446251',1,'bernardo.roubach','http://facebook.com/profile.php?id=784446251','http://graph.facebook.com/784446251/picture','CAACXBztiDb4BAJMGWwAKtEvMkKi1bOgtsY1wzNOM49wyLX1ZBkcMkB2T5RC7jrC8io6tTnoAa98RDPbDuADrZCKufHXfWESDG8ZCl2HBl90kPx0p44p6WgandQDRFxINGjVTVb2qOyJuCoNKr0BBZAE60BMoQKvMo3QbgZCWYvr2cF1iZBnHp5npJLFezSQo8x4kepZCKR8XkxkmzbyD0ZCC',NULL,NULL,1410479558385);
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

-- Dump completed on 2014-09-05 14:30:51
