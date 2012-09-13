<<<<<<< HEAD
-- MySQL dump 10.11
--
-- Host: localhost    Database: scoreshared
-- ------------------------------------------------------
-- Server version	5.0.77-community-nt

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `comment` (
  `id` int(10) unsigned NOT NULL,
  `owner_id` int(10) unsigned default NULL,
  `pvt` bit(1) NOT NULL,
  `description` varchar(45) default NULL,
  `score_id` int(10) unsigned default NULL,
  `owner` tinyblob,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `file` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `data` mediumblob,
  `name` varchar(45) default NULL,
  `size` varchar(45) default NULL,
  `date` datetime default NULL,
  `mime` varchar(45) default NULL,
  `owner_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_file_user` (`owner_id`),
  KEY `FK2FF57CE08880B` (`owner_id`),
  CONSTRAINT `FK2FF57CE08880B` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_file_user` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (4,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0{\0\0\0¢\0\0\0aö²˜\0\0\0	pHYs\0\0\0\0\0šœ\0\0\nOiCCPPhotoshop ICC profile\0\0xÚSgTSé=÷ÞôBKˆ€”KoR RB‹€‘&*!	Jˆ!¡ÙQÁEEÈ ˆŽŽ€ŒQ,Š\nØä!¢Žƒ£ˆŠÊûá{£kÖ¼÷æÍþµ×>ç¬ó³ÏÀ–H3Q5€©BàƒÇÄÆáä.@\n$p\0³d!sý#\0ø~<<+\"À¾\0xÓ\0ÀM›À0‡ÿêB™\\€„Àt‘8K€\0@zŽB¦\0@F€˜&S\0 \0`Ëcbã\0P-\0`\'æÓ\0€ø™{\0[”! ‘\0 eˆD\0h;\0¬ÏVŠE\0X0\0fKÄ9\0Ø-\00IWfH\0°·\0ÀÎ²\0\00Qˆ…)\0{\0`È##x\0„™\0FòW<ñ+®ç*\0\0x™²<¹$9E[-qWW.(ÎI+6aaš@.Ây™24àóÌ\0\0 ‘àƒóýxÎ®ÎÎ6Ž¶_-ê¿ÿ\"bbãþåÏ«p@\0\0át~Ñþ,/³\Z€;€mþ¢%îh^ u÷‹f²@µ\0 éÚWópø~<<E¡¹ÙÙåääØJÄB[aÊW}þgÂ_ÀWýlù~<ü÷õà¾â$2]GøàÂÌôL¥Ï’	„bÜæGü·ÿüÓ\"ÄIb¹X*ãQqŽDšŒó2¥\"‰B’)Å%Òÿdâß,û>ß5\0°j>{‘-¨]cöK\'XtÀâ÷\0\0ò»oÁÔ(€hƒáÏwÿï?ýG %\0€fI’q\0\0^D$.TÊ³?Ç\0\0D *°AôÁ,ÀÁÜÁü`6„B$ÄÂBB\nd€r`)¬‚B(†Í°*`/Ô@4ÀQh†“p.ÂU¸=púažÁ(¼	AÈa!ÚˆbŠX#Ž™…ø!ÁH‹$ ÉˆQ\"K‘5H1RŠT UHò=r9‡\\Fº‘;È\02‚ü†¼G1”²Q=ÔµC¹¨7\Z„F¢Ðdt1š ›Ðr´\Z=Œ6¡çÐ«hÚ>CÇ0Àè3Äl0.ÆÃB±8,	“cË±\"¬«Æ\Z°V¬»‰õcÏ±wEÀ	6wB aAHXLXNØH¨ $4Ú	7	„QÂ\'\"“¨K´&ºùÄb21‡XH,#Ö/{ˆCÄ7$‰C2\'¹I±¤TÒÒFÒnR#é,©›4H\Z#“ÉÚdk²9”, +È…ääÃä3ää!ò[\nb@q¤øSâ(RÊjJåå4åe˜2AU£šRÝ¨¡T5ZB­¡¶R¯Q‡¨4uš9ÍƒIK¥­¢•Ó\Zhh÷i¯ètºÝ•N—ÐWÒËéGè—èôw\r†ƒÇˆg(›gw¯˜L¦Ó‹ÇT071ë˜ç™™oUX*¶*|‘Ê\n•J•&•*/T©ª¦ªÞªUóUËT©^S}®FU3Sã©	Ô–«UªPëSSg©;¨‡ªg¨oT?¤~Yý‰YÃLÃOC¤Q ±_ã¼Æ c³x,!k\r«†u5Ä&±ÍÙ|v*»˜ý»‹=ª©¡9C3J3W³Ró”f?ã˜qøœtN	ç(§—ó~ŠÞï)â)¦4L¹1e\\kª–—–X«H«Q«Gë½6®í§¦½E»YûAÇJ\'\\\'GgÎçSÙSÝ§\n§M=:õ®.ªk¥¡»Dw¿n§î˜ž¾^€žLo§Þy½çú}/ýTýmú§õGX³$ÛÎ<Å5qo</ÇÛñQC]Ã@C¥a•a—á„‘¹Ñ<£ÕFFŒiÆ\\ã$ãmÆmÆ£&&!&KMêMîšRM¹¦)¦;L;LÇÍÌÍ¢ÍÖ™5›=1×2ç›ç›×›ß·`ZxZ,¶¨¶¸eI²äZ¦Yî¶¼n…Z9Y¥XUZ]³F­­%Ö»­»§§¹N“N«žÖgÃ°ñ¶É¶©·°åØÛ®¶m¶}agbg·Å®Ãî“½“}º}ý=\r‡Ù«Z~s´r:V:ÞšÎœî?}Åô–é/gXÏÏØ3ã¶Ë)ÄiS›ÓGgg¹sƒóˆ‹‰K‚Ë.—>.›ÆÝÈ½äJtõq]ázÒõ›³›Âí¨Û¯î6îiî‡ÜŸÌ4Ÿ)žY3sÐÃÈCàQåÑ?Ÿ•0kß¬~OCOgµç#/c/‘W­×°·¥wª÷aï>ö>rŸã>ã<7Þ2ÞY_Ì7À·È·ËOÃož_…ßC#ÿdÿzÿÑ\0§€%g‰A[ûøz|!¿Ž?:Ûeö²ÙíAŒ ¹AA‚­‚åÁ­!hÈì­!÷ç˜Î‘Îi…P~èÖÐaæa‹Ã~\'…‡…W†?ŽpˆX\ZÑ1—5wÑÜCsßDúD–DÞ›g1O9¯-J5*>ª.j<Ú7º4º?Æ.fYÌÕXXIlK9.*®6nl¾ßüíó‡ââã{˜/È]py¡ÎÂô…§©.,:–@LˆN8”ðA*¨Œ%òw%Ž\nyÂÂg\"/Ñ6ÑˆØC\\*NòH*Mz’ì‘¼5y$Å3¥,å¹„\'©¼L\rLÝ›:žšv m2=:½1ƒ’‘qBª!M“¶gêgæfvË¬e…²þÅn‹·/•Ék³¬Y-\n¶B¦èTZ(×*²geWf¿Í‰Ê9–«ž+ÍíÌ³ÊÛ7œïŸÿíÂá’¶¥†KW-Xæ½¬j9²<qyÛ\nã+†V¬<¸Š¶*mÕO«íW—®~½&zMk^ÁÊ‚ÁµkëU\nå…}ëÜ×í]OX/Yßµaú†>‰Š®Û—Ø(Üxå‡oÊ¿™Ü”´©«Ä¹dÏfÒféæÞ-ž[–ª—æ—n\rÙÚ´\rßV´íõöEÛ/—Í(Û»ƒ¶C¹£¿<¸¼e§ÉÎÍ;?T¤TôTúT6îÒÝµa×ønÑî{¼ö4ìÕÛ[¼÷ý>É¾ÛUUMÕfÕeûIû³÷?®‰ªéø–ûm]­NmqíÇÒý#¶×¹ÔÕÒ=TRÖ+ëGÇ¾þïw-\r6\rUœÆâ#pDyäé÷	ß÷\r:ÚvŒ{¬áÓvg/jBšòšF›Sšû[b[ºOÌ>ÑÖêÞzüGÛœ4<YyJóTÉiÚé‚Ó“gòÏŒ•}~.ùÜ`Û¢¶{çcÎßjoïºtáÒEÿ‹ç;¼;Î\\ò¸tò²ÛåW¸Wš¯:_mêtê<þ“ÓOÇ»œ»š®¹\\k¹îz½µ{f÷éž7ÎÝô½yñÿÖÕž9=Ý½ózo÷Å÷õßÝ~r\'ýÎË»Ùw\'î­¼O¼_ô@íAÙCÝ‡Õ?[þÜØïÜjÀw óÑÜG÷…ƒÏþ‘õC™Ë†\r†ëž8>99â?rýéü§CÏdÏ&žþ¢þË®/~øÕë×ÎÑ˜Ñ¡—ò—“¿m|¥ýêÀë¯ÛÆÂÆ¾Éx31^ôVûíÁwÜwï£ßOä| (ÿhù±õSÐ§û“““ÿ˜óüc3-Û\0\0\0gAMA\0\0±Ž|ûQ“\0\0\0 cHRM\0\0z%\0\0€ƒ\0\0ùÿ\0\0€é\0\0u0\0\0ê`\0\0:˜\0\0o’_ÅF\0\03oIDATxÚì½y´$Y}ßùùÝˆÈÌ·¿Zºªºªz+ºéaiÆì›„ÀF3¶–Ì™‘lðHã3£™ã±=sÐ™ñÑXGÌÛZÀXÈ¶$„¥ÖÁ’@4\r	±¨›nÖ†ÞªºöíÕÛ2#îýÍ7\"òFdd¾|õ^VU7u¢òefddd|ïoûþ~÷wEUÙÌöž|‘IoF<w€s«øÝAæ«àTÉò×3UœËó×\n\n,¥=N¬­=_á?Gp`±‘ál×ÑUwø¹©¨óg±$8UP(:Š;¥ôß+ž_êíÜÞ¸á11?\0›ªÎÌDÉ]›wu{®!‰hÅ±nÖˆüýX¢u‡>	<òl¼ÏV°ç€[€^¼XÑùé8‰;šk\n…T•ÄDÄ(\no·ªoÖ€À×/\0<\nœ¹öåµÝ\0¼KàÍ\n?$@¹‹×»ŠWëˆú×µTÃ­ü\nŸÌßþ*ðiàÀýWÀ¾´Û‹~QàG€ý W¼+Ò7°µM6>·\0/Ï÷÷÷\0¿\nü%>“n’y†ƒü2à·/x·z{·Ú`Ø¼Iánà?o¸öä·À¯ü™ÀÏ*øbnoÏÕúï\07_{2Û;¿ø¥\\Ò@/Yø3¼ø<ðSWÀÞ¾måß\0WôV¨÷¢ó˜Wƒ88°×ôâþ€hú‹Æ×ÆDr	ÿ`>\0®€½…íùÀŸ;xŸ*QHfh\r¥âyáekÓq\r(ŽU7ù¿|\nØwìÛ~ÕO:åª>>.öâ¹âcç\nã }÷JÝ ÄªNºn›!xðçù\0½ö&¶Ÿuè\'¬ÓkJPµŠK©ÂuPmSÆÖÅëÒ å:	{ÿBàÎË\rpsyÍ‡¬Ó›KjÁ…ka—sàÖºêÖj¼A«ëÏ7aÃÉ=ôO\"¼h`Ë÷àÆ¾5SýÌºØ:pÎ\'?œó\0»hWPŸ.Wéø„…×R“|iaF£`×FØkÙœÖ¿ø}`ær\0{ÓZê&;òDx¹sú;m—6ÚUŸå*°)V°×£þ®Èæ€—Þ,Æ£2ƒc`þÚÜKÿ‡€}FÝµ“‹ház>ìì;`E*“2õX>W­8j¥TçRìòT§cÐ3wsWWõãªþÍ˜$à+À¿F=	#_$\"~Ý)ÏW—{×¡4ç‚˜å YO¼PíÅ¹Ä¿8˜sÎ¾j˜TkÍ‹¿€ûüÿ\0_¾ûRã“‘ìHø\'™òcaHäC¨~!uê®„_\ZØq)C/œP0aABáè©6:fã+›¼»€_þÎ3ìIhq—£ü¯UUªA•H^\0ti»	¶ü³¥únPÓMU&:$÷¥AÚ–UûÛ€þË3ìl›%Û3Fø—ëd‡Jîi‡ çÙJ[—h2úÅ	…TÒª4»\nÅÚ×ò~icÈ%[¼üS|ÖlõN²Þí”\Z`¶ò\'¥ƒ¥ý½o£û@kèWœ²¾‡j¼IZÔwƒ·¾\rDÛËréþØeöv\n¶×XåŸ5ªÕ°I)A¯Ûh¤tÁ¦yýšK\0K©î;f:Ú‡ÛŠ½®o¿øŒ\0;Û>Qþ‘øŒQ£Õcä¢ÂÓ•À{ ¬Óšã&U–­øLŽzŸ…“F¦ÍûÚ éÛtA§¾_ãv«ñm\"Uná=Cù\r4íóâqt.¡}©®]÷¾/4†¾ÀpkÔÖþÛËl·}¿úí¥T<dqú¢J[µZØf\r@V¹ æ±kèÙ÷‹µQƒT¥z‚E¯®ÂW²^ž`÷¶ìéHx\Zpâ\r6³b¤z!Í®x©Ð¡Ú\0t£Ã¥õØZ²m´Õáö<àÅøªÕËlUÙŽï}“Un@ ’ÒgÃ\\%l\Z”æêŽ~ê³¢	Šd‡ÖsàZš‹aê{Rþ¦Ë\Zl»uÉyG­f»Áfë@XTHr!ñ.¤?ê‰!@\0§Õðly2!uþÚËÛfoýgïÕ—†=\r·µN® UuÆÐ¡—\\dÉB\'/ZƒPÌiu°\\‚íf`7pò2eÐ¶ünôPëPéÑÀlÖœÕ’!UZ¯\\MšëáSèµ,“Ÿ¸7Ûí».S5¾5›-~4\'^ŸëHŸ@ä}€×Öz˜ÆÐy°ŠEkU©ƒ@_„ûÓåë mqœkX¦£²¡¿ÛHmj3ËF…&•§Ï…ŸBœ0y§¬I•?;éR#H.Õ\rj\\›È•êûNµj“B¨ªÇ^·æTk10š’ŸXÑ´äx-Õ¤¹\Z<Òæãòïßiž`;„ÉTÔqÞÆ‚`¤?ÓRŠÙ•ÞmGòl–T\n6»?YßLq§ýkÞÛ\'<wÉßhùš«\rˆ2GN_{´Œ”Çj0å7ÌÆ9¨$c¬JiZ\\P(Y|.SØ!)Nä¹gm¼[Ð“—Ø×™å-HµÐÂE‡\\‹žBË1ýÑ/ø®`ŒŒŒŸ‘	1éwf0†Ê±Å ‰Œøã¢¨8o~.ñŸcúÄKFQØèÁó]›nÈ¬w\0-ô»@äÇXÀ:Áâ«k2\'å È¬?ÎWØŸcXŒ•Uë®vÄ‹ÑEðÈ7\röÎ…‹¶Aé)Ç¾¿ž nüÌ°2º¡ÏBÕïrI—€¥“ œ\\\nû])^lø;ÚzI”\rw†Ÿ§RûX‰80¥$‡àØ‘“g¢¿õçH×/?5~öèSv³rêéoíLæ{ñs^Ñ:ßÍp(ÑeÑ•d²›â¥ºÝjsmv\n¹ïÓ<þ¥O¢iÖæá¯¶qÙÖ¾à_|qûÁ~âmk¡—ê\\/žMvÞq˜ùƒ¯`uf/K6BÕ>+A/b}‹a—é2ô[œ»÷O8ùð·ˆŒ!î®·ì£_IÆjp±%{ïî][úÂ(ŠæŸ8|L¹û÷XüÆ_0{Ó‹Øwðed»žÃm“å-0¶X\0tÉA–\\µ+³ôxÑì*7¬?ÆÞõŽ=Bgj\Z›e¾ò\'n_žÞ¸ÈIÖ9TáÜñ§9qè	ÞÀ1ÞðÖŸàÑto¯LsÔvH]Bf\"?@.VÄ»]R¬ jY¤Ëó¦VxÉüyn›é2M1û?Ì¿þOŸàì¹óD™µëYf»—%ØssÓ[úÂ$ŽO¦™MOŸ9—ÌLOñ†×¼”ŸyçYœv´§yÅÂG{m\\móäúgµÍš&¤aDˆ\r¨\\j¹ïsô6£R…Ø9¥Ë®h›f×¹ufk:)³‰¥›*k©ò†Wÿ-®ß¿‡_þ×ÿ‡ž8ÌÍ×ï?õ_ß~ó©4Ë.?°ÿñßûñ-}áT§µúÑù»í=ß|(ùÉ7¿Žw¾éµôRÇ™ó+8ÉØ‘dìn;ž7·N×-s¼sx=æTÚâxÖbÉÆ¬º„UcAÄ ˆ¼mDÑBû”Áµ6P2B>ûï+…§_¨e‹U‡µÔ± ‹q=I—«â.×O[LõháˆEIÒÍ„©NÂÂô³Óm~äå/âÆý{øëû¿Ím7\\{î¶›¯ëfÙägÉf;>ùùßÛªP¼ÔZwWfÝÂâÂÝ^† X§¬t{¬v»¬¬õJ|Ld¼##°l#–z°š	+.æLq:X³+6bÝE¬jìM1y,-ˆñN>—ÌÇèâcnÍce„Sªàlæ‰çAqL™Œi“1[v$ŽIÆœÉXh);[%s¹™Êg¶Z	;g=È\"à¬Ã©‹¿¶,KÿcfÝ{¶êžÝðÃ?½ý’Ù-À“FÌÉv+YX][1þÆG†…Ùiæg§I3Çz/ce­K×fX=«ÄbÙÓñÄJ¥8ÍèYÒø––‚Š¡ëàlj…U«™gÂÆ±û|Ki%egK=±ƒ#%H\"ˆð3N2§ôœ,±1$±¡ÄÌMw˜jÅÄ‘ñƒ§˜¤†’:‡¦U=r±<’KÑí¤SwZ-7Ï—æä†âœ1´’˜v»ÅâüÖ9ºiF/µ¬§ifÉ¬c%µâœÒ\"ÂžŽÍ9iApãÝM	©Ý*)_–7åÉõÔ)]F”V3“$´’ˆN+¦ÓJ0\"¨:ÔY\\îæÌÕ†/|ÿ²M„lÃv8R‰z+y²ADQuH^¬E†Ù¸ÓÒ¯W¯*3ëH3ë@féY×OYjXh!•ú²‘î´äGž‘+8w#ž–MbCâ8¢$žš5ÆS±¹]°Îå\0k-±£y~=wï<KûØ³l”(_õ)AR¢hLèTÑ<ö6Æ‰Ð’òDI‘V*ü²4¯°È¬Å9ED¼S•Y6ªŽ1”×‰AŒ” z:6,…ÑØ`ç*§ÖÊLEW\0¢k\\Äö˜›³·\'«‚USJ7âåO+™hßE@Š*Sç³\'ªê=ñ’€‘,ßqZIÜÏt‰lÈhPú¢á#ZÎ6¡ÐZ}ô×“?)´JUžjSuE]À^Ë={%à‹ÀŠÂœäi@‘~ÊCÕÛßâ†€C‹G)Œ½ô³Å€(€*+€”1”N\røÊßZâ×Øc%˜o$Eµjµº>áì//æM¿T`ÕûUõµ¥K^’¤…ÝÎA)%Hòu\rM€üY™þàG²^Ó\0åBk0ÛP ”ðPúCÉ÷?/Ðªw_Ì›~)»%}JÊ~WíŒ ý9Õ‰xA1pXmØ·T«Õª m´7_æAÃY½îuu‚Á@Ç‡ÊgÐï÷ý €ýÔ-Su(½×àæÛË©$5°Ê¿]þ·+Éxž£€\\®a€Ô¯Õ“0¢.¿W­y+¥š/\0‡/o°G°¹ý; _ñj9X#¨*of*n_úÕU@èõj­:±<G`K+‡¶5˜PØ?Ç D‹Pœj‹Á\n‹ò¢¾£±ýA‘ìuTï”¼GYÕ»\rgiT&×öÿ€×@­÷Í–5`ÁM1û>”f*¦aÀK¯«íš]—PËH¨ÖK[ýèŸoPƒ³Éýòàc¨>¢jÕ›«Ýœ—Ö2–Å«HçJ•*¹^J­«¾¯¹ZÕ\\h®Z›÷þ1¨ëÿ]œ/¸–p×àýòú¨]Sðùç~eù\"c}ÉÁ>úÁ°\rU(ÝUuîj¯ÒUs°*’¨A£êPÇ6²˜ŠR;„Z£´¾LI	g–1v ÚM$ªOáW?¸èÛ„^ÛNÙ\\ÔýŽƒmª˜`ÖŸóT‰út•ª Æy¿Üyö¬äJrŠTD¼=ïV*ÛÐfhÚï£¦‡¯Á‚2õÁPjJ-BÞïrÉ§ €Ð_ç\"ÎÉÞ¢ƒ¶íûI”¢ê¤æ…ç÷/°¿MÞox¼zŽ½8P“°1B¯¢Ü4?^Jìûß\rÞxøX×*ZÚñ€\\*5z¹¬þó;ªú“¯/T¶hŸ—.IkçŠ™^zÉùk%§x¦-çÅ‘þ„¿2ÑQç®‰.ˆ9§þT®ê|U¾J¨Gß×Ã?ç%ZCà\\¤›Û¶N&óºüSUý¬¨LRÕ*àI´@jíÅû9Ê¾ÂV‚³ö$LDUì}/÷š£YÃÙÏª!}àAþàRJÔ¦Õx\"Zîqmßâöà—qq¹Úvj´ùÜ,Í»”ºàfW¼ßœ—vUïTˆpwy²ƒ\ZÍÙ÷º‹„Mð}®°É9èlù½.ü<îIàÞJšÐˆ‹«ìI°OD²ÿ¿c×’©a_ÒåÇæO’bP|ÕÆ¾¤ë»ªÐUs!•ÐTô•`ß&NQ1ÔbÎ—Wä¾Õ•\Z•š3É3Œ7.å¼±vLªñ6hi\nšÔ¶‡};-®dñ,Ê/ <¹­¨¹`µÄ‡˜§²„aPZÆñµ•yîY™§ýÁI€ýT¯GÒß\\›óvM„)q¼aî$áª¸Ç;çé©©”JyŒŸÚEÜ{/ Üæµ«	t´Ë¡¦Ÿè¢?OƒDg¨Þ«lys>[‚(L‚yà4!ÀÅ\0ÐÒ®çq|@£©s úÏA>±YU;e,ßO;|wm†iãøÊò<w;¥µJP1!›ÝªMµ-|šT…;ÏîÃ	,F–/·ÖÙõxÃì	R5tŒeÚX2z#¥^N€{¯S÷Ç¢ì•\"œK­¡–\ZÓÏ…kq\\nŸ+Ó:eÃ{Ò_5(\\SDƒò¤ ëRÎuý0«NQqøW£Tœ-ñ•¨\n,YŸƒÿÓ³ûøîú,‡»-\"¼„·«E‘›3ÛæK>\ZE UÃ÷º3ÄLó­õyºj¸­½Ì§Î1o2nj­ÐSS‚>xÉòeTß£â~ÇN1>ÎVSg‹sAÙpþàò©½¾âÁŸÓ–£óÙõ&:Õ^]*vãêB­‡4)õäÞ»Š:p¯h‹#1Ž‡»³œÊZÄ(Ÿ:Ëy¥¬ ÌGYm%„Ë,ô2(|žuª~Êíw»³|}}«â.7$«\\÷xÕô)B[?H‚í.Tß£ØªšÝ¢ÆŠà¼¸÷«Or{\\Úe#þÆéÇÞ›\0[¥Æµ«V<õÒfç”­ä¥F>Úr ú;ÀûüÐµ¢?¾«ƒòÙå«8™µx´7Ã‰¬Q¥e,’K2lo¯Ø‰ÇÙÅíEiIÆ²‹¹om‘¶qÜ³¶ƒqÊëgN`PnLVPQÖû ÿðÔ}Tq7¡¨ ¦(Cê/\'S6P²pýLhIÄ™È\"íÛúê” Î¦\ZV•,\Z„ßÂ¯RÂÔ1íÎbî>gl‹eÑSCKs&Ë§÷êdxÊ‹Mª^{l,¬iÄá,æ£go`ÊX^Ü9K\"–WM\'ïÒY•/:ä­Ào©Ú×‚€5%±RzàùÐòdKP©(®ˆ¶‡jCÆŒVá(Ò\'NüHIüªA5E1X„OŸßGª†{WYs‘—ZH”i±“n›yé´P6cãð—Öwôxiç$×%ËÌJÊ‚I¿×ÅüXªæWý9ÅÆž(÷š”N›µ,ÒON›nühPŒR[*´««Ð£(O²÷·ü™ˆ²lžL§ùìêÕX…#i§B[,SÆfWÀèRïà‰Wwçlâo“s\\“¬²?^Y¹1^zó9àªz»æà:õ]VÄhY…Š“²šÓ;m5)gpþ—Ôì´”¡W™Á.4Õ7\"£o;Õ¾öûß=›ÒÇc½9¾×›\'ÁOõéˆ+W@¸”sQ/°+%Šhay4ç{évÆ]¢7ÆKw¢ò™’¥ÿmŠî?é×‘¢–3§ÎqÅL“¾ÄWšâVœ57P\"ÚOz±µú¼`Ym®up»~jfw:Ab„ˆ¾zv—®{â3ì*‹äh‰cMc³œ%·³3Ï5pýßô®ž¹ufýäñÐ5¢™gÛ(X2KÁ†««uÃeXÌ]+K\Zˆc}<oL‚‰bTc»¬Z¹c……÷-v{vZì\'c‘§&ÐŸüYv¸x\rðj#zs„^/Èõd6cÇâNdêv8ó&]íÇ¼…—,£ÀÝ`˜¹þäDˆâ6&i!büŠi—ž®Û{õ­Ý¹èß|îñ³*èÃŠ<\nÜƒ_@ý^üt§+`7l7·ã¯¿¸ßu¿ÂÖ„õ•ó<v4ã¶Û¯\'êì :÷ÉúÉ ŒÈæ“êl_õ6Å„Z[:]A¢Eˆ‰ˆZmLÜÊ5¾ÅÙÍR\\2M¶û9LÏ\\…v{<yü„LŒÛƒNõÍÀÿ®¾Há.à³À×ñ¸¥?È`_¼x5~íŒ›$°©Ò€¡•$<qô8½ƒû™nwHwÜŒ®í Y}šÄ®ƒ‰pp~^µ6¯óêû¢Æ+ÇˆDHùGcPõŸsÎ‚ÍP›agöÎ_ñ4Fà‰“K¬­u™Ÿ]Ë£\"ü¢éïÉ÷“À×ð³@þøÖ\nØ·¯\0þ.¾+ï®¡.zÁˆ®Æ«$í+K†#çV8¸w!›¾\nÛ^À.¦µ~’(R¤Õöó5huH•?/W9}¸˜…™O·u².Ö´Iç®\'›Þ›ŸÓ‘Ä1OŸ[FMŒ)[m6@í~4ß)—ôßÆO…zôÙö|.Á?\n¼ÅÏóº@ÇM•8na¢„§Nžæ¶ý;É\\ž¢4	½ùç`Û‹tÖŽe+ˆ‰!Š½w^QùÐq.¹r†ÓåEþÖ¢.Ã¶éÍ_‡Kæ0ù:b„õÌrìü:QÒÚÌOXÈMÕëðªþ?bÂ­¨\'\r¶É¥øgUy»·0Ý^`\\nQÒâé³+>Û”Ï.QÛÙÉj2Ckí8­õ˜´¹]°l¡©¨0eeYr†S¡7s€lzD	¦¨ë!Ž#Ž[áäò\ZS3;/ô§\\üÀ»s›þëøåO<SÀŽ·\0¿:]§)¬ÚàªLMMsöüiž>·Êþs¤™-³æF\Z%tg¯!Kæh¯!Î–}o.	\Z¦&·Š†*u)6™¡7{-¶³£ o‚¹àBEœYé²Ôsì\\ˆ·\ZoMå&íßá\'èÿ.ð€G¶Sò¶skïTô/€;~èÔW+Þ–\\•V»ÅJf9¶´JEccÊòb#>gÛ¬-ÜÌúôÕ¾\\(ëy¯ÚÚ|Oq6Em†f=¬MI§÷ÐÝq+njG‘Wñ\rŒ18Už>s‰[³­·òFàŸã×ìüÂí—	Ø?|&·=¯ÞÖs7¬³åçj$iqèÌyRë0b*iÏt¢˜ÞÌVÒKæqYŠËzX›a³Ì7¸I»¤&¡·x½…Ñ¸…ä´œÔv#Bf•ÇO-Ñé´}šu2‘Ê/åqûÿ”;y—ìç€Ÿ¨öšq™±Ê,\Z‰U©ýùìà®NOÍðô™eÖRKdLEò\nÐ%ocmP4™£»ãzó×‘aÐtµ=\\–’uvî¼\r;³/oÆã”	wéïÝÔrb¹K’´úŽ]p¥ÃÖàÖšã¢Õ4LÓ¶ø5ü²Po»`ðß£ü%^]×…q\0ØÍR¥µ´rãÔ¦v»Å±åuÎ®®™¢ý $öU»\"&\"›»†t÷óH§vÓ“ÙÂud»o…ÖtÞÞn°5G¿Õ=Ä‘á±ãgè:ˆ“VuöfÍÜl….®m/Î=÷ÿ˜™8ØÁD×ÿø°k¬$ÃG¸4¬áUþÕTL@áG9L\'m9zÚKp])/í9¾ô¹=½È©Ù[¸OnÆ.Þ@;IÊ¨là<äÏ#?\0’8âÉ“çPã}m\\C›©wl×¡c)üðÉ×Ÿ´7þJàÙŠwö>uN\r–C°8IxòÔRÉ™ô‹ò¤ô²MÞt ‰#lfù«‡ñ‰ŽqbÍñÂ=ÇùÛ/º–÷î —Ù’`•Àû.ïv$¬§–#çW}|=dÙÇ‘*|\\‘V†Õ®¼#§aÿí¤Á~p‘TG)ÏQôC€•pê‡j‡¼9­v›“çÏsz¥ËŽ™6™u%3¦*8çK1J;ŽxüÄ>öåïñ—AÚÓ´§g¹û»OqïÃOòÓ¯¼7¿èF\"‰Èr²Å	f	­8æû§—8½²NgzçP[Û¨Å¶7*ù»[•xAe­ñƒRÄ¬2 ‰u»Vù–eÁÄ¾â|±hž6ÅWùT­V‡sKg9tf‰½óWã4«$ÆZQÄzšò\'÷?Âïé{]é27·@ÜòÀüÜ\"Ë«Ë|èßæìÚ:o|þìß1Gæ\\Þ“­_ÂG†ãçWYêYv.DeWˆª“9d\rn\Z’kä&_gÀ\'PžìŽMÊAÛ\\=Ê©\Z5Êu7°–—V:]Ô¿ËD]\'<uòåÍi¥ïHµ“ˆGŸác_y€?º÷aŽ­ÃÂân¢¤wLôS‹ÚÓ³LÏïàá“+|øó_ç/x’Ìzm ¹WE«Ê¡Sç!JüB†4s¥»ÇàÆè3¯p‡NL²á*«CûY–ñˆH·ôçhô\rTµBQº+A¬*áèÎ	ÊRá¼ý¡ËË•\rÂÔÌ‡NŸçüZ©–ïB‹pfuÏç	î{â$-vîÞË	»ägS¸j¸äTétZ\\µwKKK|ê›óÐÑS¼åŽƒ<çªÅr¹¦^fyêÄY:)Ÿß®HžÖz¬Ô¥Zšìº8qè 6¨½ÝÊ	˜‰…^À\\£6I«6{\\ÚxlØí`Hlõ°x~jjšÃg–9½²ÎTË/¹ñµ\'Žð›Ÿ¹—/>r˜dv‘=ûµÚ¸Ì·Ñ°VY]·¬u-ÎæÓÇ¬‚‰˜[ÜÁÎ½ûxäÔ*¿ùÙûøÌ·c=Í˜iÇ,w{^Z¥ÕJªþÛê?F7ˆ¯7²Ý0Im^¡-Á…\n2Ô«®ƒÔä¨9_Ï_	YT¤¯!´¨!ÔršÚŸ|çŒÃD†.OŸ9Ïl\'áOï{ˆûŸ<Fgz–=Wð±0êû}çëwÍ´oyÁÖ{Ÿð4½ÌáœâÔ\n&í6{®¾šå¥%þäþGøÎá¼ó¥·rv¹KªÂ¬Iò™ŸTÚ_,9ÄV7Dgþ~ðG\rþxÿÉÞI‚=52ŒêkÝ‘®z¿…eÍYÔ¹4|G¥ø_Ã9ø†™©)îþæ£|êë³ÔsìØ½©éi?P¬ÃITN”_Yw¼÷Õ×òS¯¸š^æhåÎûO0•/6;·H{jšÇOžäßÞu/SmÚ­6&Ž|¾»B_ä_\\”›ºb©3ˆüû¦pD‹•%~M­·I_?hGt`Í°þZk‹™#X´É“\rôÓ>•êÂu¶ó92I«Å©Õ.½¸Ãž«÷Ó™™FU±êò4åê\0Ö*GÖ[Æ¦+ìŸœÍç[»`r^>8â8aÏÞ½˜©9Ž,­arÖŒšÖÚo°Õu\'®q•W3ööšv\\6íB$;®«h©©`	R‡2$æ.™1Ô\nö© 5‚i¹e{ê<¼+–cˆ[-víÝO”$¾í´uÁ)úÜŸU%‰\rŸ¼ÿ8WO[z>ý3ˆh_-‡×˜ÏÍV„©Ù’Î4bÖÚFiÖ\rÈ’zIs“ý®.=Ò+ß‘ûPç\'¶›\Z«y›4—®´Ífõ^6¥m\0¼b/Š	÷&Âä]‹ƒYõ9pRò×N…V$Üw8åÁ;â€µÌ÷w*µ~û@:çu¬‰â\\­ê`(8\"´ldT*¯›`ÔÊm††zí\"Un`Áq•B­æucUðª1fP¦ö®A‡Í€Kþ5\"•yx¾ñ]iËµúrêªýNbk~Ú±)šìxéwTC\'WvoÒ¡ÜnÀ+h?^´Ða!—¤zkã`7ª‹“RãSõJšä·O \rÄÝŸ«tNäÁû\rç)½ôJIxØòl *•¥y\'¤´¦×=g¢®µYX©ÅÔÚ˜Tdˆä*£³}µM\'¶«S¤Ãlw‘@ßíl…@	ž„^·#ðÒCpÊuE‚ëhì;¨á¼IŽsçmsš‡^ƒ’Y,5Ì&H²4K}¥/kñ\\´93æAÃåƒoZKÞcûÁÖQ¡DÍšt7;|ÅŽaÙ.­Æ[ƒŽG›íAÏœ²ÚõÝ\"fÚqÙåm’0Ÿ\n®I³Ö¤¹.áÒ@Æ4‘5C¶˜Ø-\Z ÕX;°ß5P¼ý-~ymibÊ‚_Ü_»ß¹?ŒÉ+*¾‹ÃºÌ*×îhñ·_~+Ý”}éKkYÞ&‹Z£xm”êŠ•fÕÞr£ê¯{hh²÷ƒæ}\"`ß0Räk\'¹Ú\ZŽÕ9ö0,kL‡†Ë‚„K{è½P”Á¾ÒÍøï^ñÞûú«YëYÖV×øÈ_)%´F[ê°dŽTÁivÜt(c&\rˆmjÕ«Æì[¾å8[\Z¤°î—Î‘‡†Å“¥FÎH¡Ë¥ÜäÒj‚dDò6Ðþïøb¥%µ Vˆ$ãô¹s>³e,jÅ¿—«s	\"F\rYÆéè¤AéÙí5µúÁš¦R@Ç¤L/ ôR•Ú\r”Þ¹CªÍ^C•ž#ïÂv“R=˜Ä^X8O¡ZñÔÕÖñp®\\“‡N+âc}“uq(tï)\"CvUí¬kÒ—:ŠãQŽ‹»i\rhm WBÇæû&%ÙCyëaê¼®ÒàÏ›Â²Ê@Òj±Cã÷ÕèØæ|»¡£<t¢Çÿù§GK+ &˜<ßÒ‡©Ñ.3LµW–œzSø7d›Œ\Z÷\0h¥I\r‚£xµ³`xè´j]5œt7H3VªŒ¥Ù›mr€ŠðÎ9¿|¢qB}õ\'›¿§CÒ•®)=$}Éµ!‡=¸¢…65RËvlHÏn‡doFâ©,Ð&>h\nj^ØIPýŒ’j‚æCâŒ\r•Þ1AG«Ù¾†D¦Žqþr¶.(ÐÖ@%o áÏ«åíÂ›¥¼ÏèKrÈ«ƒßQ‘„ºã(}é.šÎÒj¤ÿºj5K5\0³Ž&Vš$¹pó8Óæ&;:ÜŒè$Á¼ÕªÐQ6½ÑæÖC©ð­02P X÷Þë#@›\nö‚½g&?Èå­2+eCCˆ‘á¤Š6:ßÃ€ šu´Æ¦Æ#—½emXð0	ï^³ã]“ò*+¨½šçÞÑÁ×êÑ’Ã/¾~ûþ~æ5×‘:ø»å©SÝþ„úgFÍöšixRð cL!òÛÄèÒñßPÂµš¨˜¦Ê”T JEekƒC£\rdNYíe¼ûÕø©×î§›*OŸ:Ç¯ýù¡\n=˜¥jæ«†<,#VSdc`¾úÚ‹£Æk€ŸÐxè¸•ÞzAƒÊ ™R=WUÅ‡o7©û²‚Äù.xK+«œ>{–Ì)Ë«ëy•Ju™M\r;ŽÐa oôÈó\rÆØC@tQÔ85	×šÓÖ,™µ_Ôdtƒu7ê¸TŽ”\ZÙp³û‘äu\\B\'1|ôG8rb‰Ì)ÿåËD‘©,ÛX?i“ÇCË|‡¾8ÒÁ\Z–2QmªäÆƒ*†*S!å}i¬T.À4¹iòÂeDì¥ÁZÅ?càÉ3)¿õÅ3^4Œ”ôk0JÓÊ½c¦ÇEä€žxèµàá¨S«C¥¼.ò2<TzïCÃ©ÞjŠ32ÕÑásÙÚØÌ]uÕ¼7ß?ÿƒtDÂš‹tì‹Ù&R¥±Œxß”@‰}MÉ	&ò‡uLr¥’þj\Z\rè`þY7ÎDmä e¬ÌÖ¥•ìa€Wc`X­¾Qo é¡×ªa·Bm(ï‘á¤‡U%³®±Šs>ÏÝ_bjJrÉdmÎV\rÌÁƒGØyÝ”`o7>ìÂÇ‘üQ\'nÊ}‹Týð¦kXC–9vÍOóÂƒû‰\"`ÏU•VUÜ³¡U/Â6Ž¡ÖÙ`môü¢qãÃÀ¯wXhœ\"TcS‡þ8\rÃ«ú\r”JÅê€äZÇÂÂ;vÌ6Ut•Ö9FÍ¤®÷D‘¡^{ÞÃ<Xí@j6X6è¡ÀV{®ÊdÀÌQŒ”ðFßà¼mäŸç˜„&£ùòªog:Â‰k:¹6;BJ ¯TÈÖa\\µ=ð]å;½É©ñ†Òßqìø€çÞHGÚ›n‚mëÚi«7CŠ‡ù:ºyµýÐdI­:BãJù0Õl(íß#f»¶Šþx“öš±Qàm”ÍÒáMH×òÒ¡÷+cØïœ¶QÒ> ÍÊ&~êE\08P+º°ÒÄMŒ\0ºÇô?/2ö\\îx+w@ƒê“ÐMôQ—W‘v‘\r5Ç°“Éæ1½°;Ñ ¦]°ˆk}VJ(#ïCíoiº\"d“{t\"dc)o”æê¾â¼Œøíp³áÔ05Üÿ•%a/è>\rÍæm‚xÙR¥ŠTlÇ…I9ãü !ö}#Éß6`UÇ\ZHÃ¼fCn¨½FÜ§	Úìaza£w$“4äµjl[B*í\'/PŒÎ0mZƒŒsŸ6Ë]Ô^{tâ`opÆ]Æ¯††]ãÏ‘Ú²)E~è˜÷‰1#›Q G\"k“±ÙÃšäl ®ÆQíM7PÆðR\'véßuŸÊ{¥ÇŽ…ÎYnÚý0ÓŽæ¤mVQL¾.iÌ±õë8qv‘ÇŽÜÀ¹Þ²4Â©1\'N\'ŽÞO·ûI”™2ßã¬N†.9z/@Ò7\"N6S&D¦Œ;Fôd\r¯3Ž7îy[ö>ÊK®ý\n×N=„#.éàjg\nÁ`9ûüÝ|íè«xàðs9¾zãÉÑ¥Z£4öè­Q¡*›HÇQ¶Û×-~¸LÙáo÷Í\'¼êº/ñš›?ÌîÎQRíà$&’|öúˆ_ÀbGr’{ÎÇxÕþ9¾¿ô–É«¾¡Ê=“±Ùüm$d0TcóÒ~¡ƒàb…iõÎ	È ”·“.wÜðï¸é˜_Är†uFÄ â<È¢È@PÿNuí4x‰ÛwÅ×v»æó>€_Cl[Àð€Æ‘ôÁP- \Zìúv¨ä‹µ¦nä¡ÕîS;Iyë>Á¯»‹©ø5ôì¢_gD2ëÁ.[xÖkŸ¤äülS¡çÚ8ç¦M”ýc1r‡:~–†…d.¸Ú0µ¹›_M÷iÃ\ZÙOän×¥5`¶VœòöÜÉsàãD&#uN{ ~å\"‘bwqå£©=\"Š—æK=bxµ@COÓ{nÔ¯«<Æ|H‹©Àëå°n|m‘q¼ùùŸâõûïÄ‡s-ºë;PaèaŒ/×`ý£©?`¥×Kpv\Z)bäÅÀÇ½zK`U¶ªývÝ4òjµEdÐépÈÍwv\rîMß?\0ðà³p»ýÚïð¦¿‹1>Ù£²ƒÞú,Î“æÞk¡Æs)6›Krñ˜ïXO!G’öÀÚ…²¾^‚ò¯BKh¶2ÂÇ9hè£Ï7øª69?›÷±µBÃy‡Õð³¯ÎM¯ð®[>D$=”È¢7%ŽÈÉ¼ú†üQ+ ÷÷¾ãÖ?þ8qr\nô ªS¹~Š`±³jm,ÐË> :öýÕ2¨ué¯iúÎ0É¶Ö5c½úüÐ\rÊ¾é§ÈhçÂe¨ÞAÒ:AE4\0î]¨îÈØ\\…ÛÒvûãÀH—VûÛ¨¾\0aª|]¼Žÿ€*EÓÛ‹‹nBÚÇsÐÆíÍ+ûÛ7Ú:gxÍ5wamD9ÑA\"ºëÿiú8&z‘¸rf©H¯–áXñ<Œ]=[z/k«· :ë%¿ÆT§?«N·oU=½\0Jû8àc‹/Ì’oF§lÎAl%/yÎ=Ì›ãdäKIIŠs×ƒ ŠBäªQRÞSªW^ì”j<È’›‰¬=ˆˆëÇ­þ ·ª2½Ýkqn>¾­…+ºèÙf´Í:s›Í„¿!’”Ûw~•Ì%•ú@goÅ˜E’ä>ü\Z;Cîã8…£\ZÅ‘´ŽbÓWYýˆ— Ü:ñRâ±‰mˆ×ë‹ÈÅˆc\0»ÑÉgÎruü0šO´ôU¦BÚ»™nW™š»4)ºöy‚ÔwZ68q¦ì»­jÊÆ÷…|«kÇcíƒdöE$íN¿_‹¿¬yU}±á\"l,)Ú,ùª—†b	¿¿2W{Ä|þ5ß Šlð¶ÃÚy„Ðj=˜ãå@¨Òˆ9ð\Z¡Î”þ=ãw\rýì5’Öƒˆ KoBH+\rzTy•¹¨7k+’U÷¤‹Ân2 5øžÑõ»¢Ã.ˆ2Ð²ì…˜øË^åª …TÅßÎxi¦xô¯»ÚñÐ&Š¿2ƒs7£ôª•ãK\"![HXŒ:áPÀå\"éõ†-a5, &ïž˜ía}m‘¹Î=€õ6»²zô°+¶Bm‡ «É%!N¾ÃÚÚ\Zp}Ùd¿¨Nuú’€=ì~ËÅ\Z]qsjjÚ¬½•vç,ÆòªÙÐ_³Ì¯iä;ðiÃ¬ðRZC-àAGÎÑj=…º›±vÕÔô³»,À…‰pùo#K—\nÉrê{©:‡ð<LtugpÎ`\\¾Æ7y;M?GLË¹aaûÆÂK÷©/áÎ¥DñwÁ½u³¨;å[x:P‡˜gÂ¼Ü2_›¹¦Ô%X×_:JdÙ~ÒôqDNãœ)W5*íri£#¿ÓÍ©Ý…v\\‹•-è·évçQmù1}>#y†m›\\&tÞq·³n™hE\'‚X]ÝE»ý°‚sóý¬N±È;ýÙž\"ZiÂ®P±Û^ÂA­æËDbuuŽV»åK¯ÁqÈð,ß&I Œ³}ïøóé¥â;*:E-€Å˜U\\¦¨õ»³^0UƒË%Ú’^Hse\\¾¤¤s…¯‘¦ùr“¹&qªXÇßÄ\\Ù&º?·“½L\'K1U»G«µ„µ…æœ«”ÍÑüòUR™]vLÎ%Ö·àt~ ±ÄqkÅ‡âN±–®S¾j®À1aÍ\"†‡V_ŠËzd8ç@—Y>?‹ª—@—åÒi—9l–?ZÅf`3Lùh—)6S¬uågqŽn×àt	a-?²Œoe–®€=á­›vøúá—±âæÈ2ëscí<ÎÆ~%¢R+¶|Ô`í„ðõò5*ŸÍìÐ£¨[Á9¡—Af¹K§¯€}¶ÓëxàÌKÀvé¥ú7¤ÙM¤½Ý¨Ëªm]_rs©µY¸;¬u¹T÷?çµ€°¾ör\"ó\0Î%Í\"Ò”³Öñëà\nØ…X‰øÂ±Ÿæto7iæpîë¤é<iz.K=P…tfä@*<ÿ»jH{Öÿœ³›ÎÑí>#÷“e=º=!Íø—ÎñØ°/¦t¯ìá‹\'ÞE–*½ì(Î}Ž•µw‘eêœ_ò9­\0ÒÿípYm¯¿ou+¬¬¾ëÎ¡|‰noŠ^ÊWTù\rW8oW`¸X›pÿÉå[ko\"ë¦ H¯·›¥å·“¦ë’[Hoá”¹ÒI³\"\\[cmí6Î+qô{¤é9Ö»æiçxÁê»Û²Xú•m¼-ÍZ|îÐ»‰ö¯psûóˆù0+«ÿÕCLM}#SDÆ`L>¿ËöÛ…“AÊU‰œ¢Ú%MwsæÜû1æKÀ_±ÖmŸ\0þ~d¸/üþû÷sÀõ\n|ÃÍ4¾x\n%Ð Ëë‹üÅ‘0]µú²ë¦>· tXYýG¤Ù>:íOE=\"ÓÁH¾Ò°©²€ùBÀ8ÍP×e½wKçž(úQôaÖºÑÓ¨üƒ(âîÝr©\n~P¶¿óáOä öí:Æ-;î\'Ñ%öº¯ïœ×\'þoe?gä•¸ì½DñStÚ\'ŽÄÁˆq‘þ:NÑŒÔî£Û}3Ýîk0Ñçˆ£“9þ\Z¢ÿ1Š¸/2»v^aÐ.™×Óªæç{éô§#óåÿCxâ…Îþ8éò/ÇOÇ_%ŠBdcz N;Xw\rÖ¾„^÷VLt1¿ŠòÝ³Ý´õ+\"æ7áì°ï¼ö¥ßþØÚ©O+\'~FäCo¹ö•j_=ßë½‘·ÇŠ˜ ódÙ4Ö.aâ\'AþV¿óUœý,´Ûyd£/ºöå±­BòëÎ%¿Ç^dùÝ; órÑ½7Ûlqâºœ\"Ç9wî«\"ñ×T[ßâÓ3=‡lÿÿ\0wºqÁ,¨­\0\0\0\0IEND®B`‚','foto-jogador.png','15956','2012-06-05 00:00:00','text',NULL),(7,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0%\0\0\01\0\0*ÞP\0\0\0	pHYs\0\0\0\0\0šœ\0\0\nOiCCPPhotoshop ICC profile\0\0xÚSgTSé=÷ÞôBKˆ€”KoR RB‹€‘&*!	Jˆ!¡ÙQÁEEÈ ˆŽŽ€ŒQ,Š\nØä!¢Žƒ£ˆŠÊûá{£kÖ¼÷æÍþµ×>ç¬ó³ÏÀ–H3Q5€©BàƒÇÄÆáä.@\n$p\0³d!sý#\0ø~<<+\"À¾\0xÓ\0ÀM›À0‡ÿêB™\\€„Àt‘8K€\0@zŽB¦\0@F€˜&S\0 \0`Ëcbã\0P-\0`\'æÓ\0€ø™{\0[”! ‘\0 eˆD\0h;\0¬ÏVŠE\0X0\0fKÄ9\0Ø-\00IWfH\0°·\0ÀÎ²\0\00Qˆ…)\0{\0`È##x\0„™\0FòW<ñ+®ç*\0\0x™²<¹$9E[-qWW.(ÎI+6aaš@.Ây™24àóÌ\0\0 ‘àƒóýxÎ®ÎÎ6Ž¶_-ê¿ÿ\"bbãþåÏ«p@\0\0át~Ñþ,/³\Z€;€mþ¢%îh^ u÷‹f²@µ\0 éÚWópø~<<E¡¹ÙÙåääØJÄB[aÊW}þgÂ_ÀWýlù~<ü÷õà¾â$2]GøàÂÌôL¥Ï’	„bÜæGü·ÿüÓ\"ÄIb¹X*ãQqŽDšŒó2¥\"‰B’)Å%Òÿdâß,û>ß5\0°j>{‘-¨]cöK\'XtÀâ÷\0\0ò»oÁÔ(€hƒáÏwÿï?ýG %\0€fI’q\0\0^D$.TÊ³?Ç\0\0D *°AôÁ,ÀÁÜÁü`6„B$ÄÂBB\nd€r`)¬‚B(†Í°*`/Ô@4ÀQh†“p.ÂU¸=púažÁ(¼	AÈa!ÚˆbŠX#Ž™…ø!ÁH‹$ ÉˆQ\"K‘5H1RŠT UHò=r9‡\\Fº‘;È\02‚ü†¼G1”²Q=ÔµC¹¨7\Z„F¢Ðdt1š ›Ðr´\Z=Œ6¡çÐ«hÚ>CÇ0Àè3Äl0.ÆÃB±8,	“cË±\"¬«Æ\Z°V¬»‰õcÏ±wEÀ	6wB aAHXLXNØH¨ $4Ú	7	„QÂ\'\"“¨K´&ºùÄb21‡XH,#Ö/{ˆCÄ7$‰C2\'¹I±¤TÒÒFÒnR#é,©›4H\Z#“ÉÚdk²9”, +È…ääÃä3ää!ò[\nb@q¤øSâ(RÊjJåå4åe˜2AU£šRÝ¨¡T5ZB­¡¶R¯Q‡¨4uš9ÍƒIK¥­¢•Ó\Zhh÷i¯ètºÝ•N—ÐWÒËéGè—èôw\r†ƒÇˆg(›gw¯˜L¦Ó‹ÇT071ë˜ç™™oUX*¶*|‘Ê\n•J•&•*/T©ª¦ªÞªUóUËT©^S}®FU3Sã©	Ô–«UªPëSSg©;¨‡ªg¨oT?¤~Yý‰YÃLÃOC¤Q ±_ã¼Æ c³x,!k\r«†u5Ä&±ÍÙ|v*»˜ý»‹=ª©¡9C3J3W³Ró”f?ã˜qøœtN	ç(§—ó~ŠÞï)â)¦4L¹1e\\kª–—–X«H«Q«Gë½6®í§¦½E»YûAÇJ\'\\\'GgÎçSÙSÝ§\n§M=:õ®.ªk¥¡»Dw¿n§î˜ž¾^€žLo§Þy½çú}/ýTýmú§õGX³$ÛÎ<Å5qo</ÇÛñQC]Ã@C¥a•a—á„‘¹Ñ<£ÕFFŒiÆ\\ã$ãmÆmÆ£&&!&KMêMîšRM¹¦)¦;L;LÇÍÌÍ¢ÍÖ™5›=1×2ç›ç›×›ß·`ZxZ,¶¨¶¸eI²äZ¦Yî¶¼n…Z9Y¥XUZ]³F­­%Ö»­»§§¹N“N«žÖgÃ°ñ¶É¶©·°åØÛ®¶m¶}agbg·Å®Ãî“½“}º}ý=\r‡Ù«Z~s´r:V:ÞšÎœî?}Åô–é/gXÏÏØ3ã¶Ë)ÄiS›ÓGgg¹sƒóˆ‹‰K‚Ë.—>.›ÆÝÈ½äJtõq]ázÒõ›³›Âí¨Û¯î6îiî‡ÜŸÌ4Ÿ)žY3sÐÃÈCàQåÑ?Ÿ•0kß¬~OCOgµç#/c/‘W­×°·¥wª÷aï>ö>rŸã>ã<7Þ2ÞY_Ì7À·È·ËOÃož_…ßC#ÿdÿzÿÑ\0§€%g‰A[ûøz|!¿Ž?:Ûeö²ÙíAŒ ¹AA‚­‚åÁ­!hÈì­!÷ç˜Î‘Îi…P~èÖÐaæa‹Ã~\'…‡…W†?ŽpˆX\ZÑ1—5wÑÜCsßDúD–DÞ›g1O9¯-J5*>ª.j<Ú7º4º?Æ.fYÌÕXXIlK9.*®6nl¾ßüíó‡ââã{˜/È]py¡ÎÂô…§©.,:–@LˆN8”ðA*¨Œ%òw%Ž\nyÂÂg\"/Ñ6ÑˆØC\\*NòH*Mz’ì‘¼5y$Å3¥,å¹„\'©¼L\rLÝ›:žšv m2=:½1ƒ’‘qBª!M“¶gêgæfvË¬e…²þÅn‹·/•Ék³¬Y-\n¶B¦èTZ(×*²geWf¿Í‰Ê9–«ž+ÍíÌ³ÊÛ7œïŸÿíÂá’¶¥†KW-Xæ½¬j9²<qyÛ\nã+†V¬<¸Š¶*mÕO«íW—®~½&zMk^ÁÊ‚ÁµkëU\nå…}ëÜ×í]OX/Yßµaú†>‰Š®Û—Ø(Üxå‡oÊ¿™Ü”´©«Ä¹dÏfÒféæÞ-ž[–ª—æ—n\rÙÚ´\rßV´íõöEÛ/—Í(Û»ƒ¶C¹£¿<¸¼e§ÉÎÍ;?T¤TôTúT6îÒÝµa×ønÑî{¼ö4ìÕÛ[¼÷ý>É¾ÛUUMÕfÕeûIû³÷?®‰ªéø–ûm]­NmqíÇÒý#¶×¹ÔÕÒ=TRÖ+ëGÇ¾þïw-\r6\rUœÆâ#pDyäé÷	ß÷\r:ÚvŒ{¬áÓvg/jBšòšF›Sšû[b[ºOÌ>ÑÖêÞzüGÛœ4<YyJóTÉiÚé‚Ó“gòÏŒ•}~.ùÜ`Û¢¶{çcÎßjoïºtáÒEÿ‹ç;¼;Î\\ò¸tò²ÛåW¸Wš¯:_mêtê<þ“ÓOÇ»œ»š®¹\\k¹îz½µ{f÷éž7ÎÝô½yñÿÖÕž9=Ý½ózo÷Å÷õßÝ~r\'ýÎË»Ùw\'î­¼O¼_ô@íAÙCÝ‡Õ?[þÜØïÜjÀw óÑÜG÷…ƒÏþ‘õC™Ë†\r†ëž8>99â?rýéü§CÏdÏ&žþ¢þË®/~øÕë×ÎÑ˜Ñ¡—ò—“¿m|¥ýêÀë¯ÛÆÂÆ¾Éx31^ôVûíÁwÜwï£ßOä| (ÿhù±õSÐ§û“““ÿ˜óüc3-Û\0\0\0gAMA\0\0±Ž|ûQ“\0\0\0 cHRM\0\0z%\0\0€ƒ\0\0ùÿ\0\0€é\0\0u0\0\0ê`\0\0:˜\0\0o’_ÅF\0\0[IDATxÚ$Í1A€á&[éˆB)ÑjôP*ÅIô{…ÇP®()‚‰¨ØØÝØ™÷¾|FUÍî¹ïR·°\0ÇÔ\rEØ\n`T•ózA­ÙÒP})?ocâgG³z—ÙµÁôÖG\0¹ÄÉ…*€]Y€Â¯Ò“¹Àr2$Q#ÿƒí¦ú\0\0ÿÿÁ»ÁP\0€áÿ4m‡¶b“Ø\\b5x1ˆÍSlƒÁhñ\"±-À\"1¶.ƒ‰“êé¹ø>1\\HÁþšO¥vK\0ÿò)±à~ÆŒ®¿ë¥„q… JÏûÀŸeÍj-	™t\nöù«Œð”±ïW^2ØÜÊPZ‡¯ŒÅ(h´ê¬ús\nuŠ=B+´±b{tQ–jù\0\0ÿÿT¿JBqGÏo&ap%A(¬!š\\ë	D_Ågh÷FgÇÄè\r‚Z\"ñ^S»þ~¿Oƒ\ZtæÃŽí/HÒçÂ3Xy¾]\00vD\0÷³ãé¬1½ª’9Ž¹>9àh“PöÖýá$÷\'öÎêdJQ»Yx›d7]Ìð?Ë×ÇüÃÝ¼,Â^ô’²ž’LâãkÄåùÅm*Ix$,H½pÁ±L\r3(c’•ÃKHÐ¶èBà?€Ví™Óø…qýþK%ì4FQøûgh-D1’P¢A¡Mˆ11qí†àðº`í‚\'ð\\úlXà†K…(+ØIBB°îl‹3ítþÿþÇÅÔ¦ÝßûÝsÏ9“¯S¹\\õ†Ì§m/åÿ×’)Ä³Â¤ZRk\neÀ¯[~ö=‰ã&7ñ×/p°63´¯/´[[|ê<aa~þ°äýÊ-ßNO˜i!éœ\Z‹Ë¤µ:Ñe~•…›>vZ¼~˜¹]ëˆzóËÁ¼;è¶ÀB%<u±].êswm ö\'YS\\Ô„d‘¥Ò\"yRãÝÑ/ž{BÕW$@‚ÉøÓR˜ð&L\"H«•ë\n†ŽW/×)BÄ¢5Mt	I>V±d£:‡{ÛŒ.çÆw1ElÜ>ožÂ2ÆqEšnæX/ß¿åìësç.öÿ±Q6«QAþúö½™L%‘$AÐ€\nÑ?(¾€KWî³P@ßÄ•O ¸Pˆ‚ÑˆA7YHÀYH\"J\"Í8™ŸÜŸ®ãâÎ£ICCS§OUSN*Ã}i—-jìN×»a«ž\Z{™ÑÎU$m\09âôd/µa0ýìŠva´rqP”s%Ÿ=b7€Õ#Á¬¹@†_ÚŽ§˜ŠñØ1]ñL$ŽÔD+r£ž\nöwW~iÄ;i\06(óë«§ýØ©¸Rý>RÃ\'	‘‹J>½<Yz@Öm¿—´x$³ûÌW[÷ù´®‡¯Åq…(Ž!Š@B!P!=Øð„ÅÄ‰Ï	ji7ö¼1ÍËýY’ˆÑ‘8ºë#Ÿ.Ì$•…PQœ€s|°9ÞÖ;E´˜›VóÂ°ÿ(Ô’‰®™8…Êêv—cn³´–po*goòú[3Í›x\'!Ie`ÁÏƒ‘›HƒhçF!ñxùŽðD<Z®aÎ“–»ëoéÜ@Ö}ý[€`Fæ r®wÅöï6±÷Ìž´€z\n&&ÿ@P¹!à\rä~åòÔs¥z¹i^áÖÜ&ÇöØ¬_m\\šy6¤³Òï¸¾Q8ç©\\çgÖ¹¿°ÉÔ‰\'$¾ Ñ¼Së´^|Š%=4$Èá³¾sÆÎ2E6Š‹<ÖÍ¦=üËhù„ÖQEqø»sgÞ¼¾$mHÁÚ´ÐÄ\"´X«UEÝXEÑb7ºî¢èBÁ­q#¸v!¸QÄB³0.,i­P¢‚Æ4)–HIxù÷’yïÍÜ{Ïq1ïM^l\n8›áò»÷œ{îï;{ÓÿFjm\'¬vƒ]í„÷[Î]r_ÌE~–ýõ‰¹ï§ÓFy5Ž±‰qÐßm\nøõ„r/·3ÇD.Š^ÿô²½œ–î\Zt	ï(:Ñ\rJæ•\\ß3¸¬ý¬jvCõ#2|¡@!‹ÒõB!àÙí¥¾3UÈëëUÜNÒ‚ƒ	Ç–F’ZÃV.d^Ø,”•Ââ7–Ï†¸~sÐÛÉl¹…XX¼ÃÄs¯qµ5Ê–6¨Ù„ºP%ç•á\rÞÏøò»™l°ßJÎíúX»‘\ZMÒ:‘+ÓGU%xGÞÞÁ»bO¢>¦ªðþ’w¾(pÎá¥dç.Ï	ÞeF…Áˆ¦7Çxü@ÆdÚFÔ|åóÎç¨Ù—A¼Ã¹õîDj„UŸr#Á©)…fwq½=\nÆ2{^Y>#[K…M\'1TqYàäôÎøÚoQ¹gô f„\\£?´Í}¼vfÒ>IDÀ\0I­Fòði>[{ô¯¥|èÓÔHe¿æ“^]Î%Û£´?O=­“y†ÎÐ8u%À{€ìîˆäo¢| ”Ï!(¨\nsw7¹µÚâ©¯·ùåÎ:óÍíÊ%zw3‰ò“j¯NU\"…€Á…2ïÙw¨§)ipsÍÓZnEQ0=Wõè©êDªUBP‚‚È½à‰è¸ÀÓ\'Fh»€\Z‹ÓÒ¦ƒ(AQ=$ª¥PPµÚ[àC	¯à‚Rá›k+-!à‚à‚”ãŒ€@,Õ‰zžÜ+¼à¼PˆâE¹>ßÄI)êƒ„2TQˆ«\Z‰BdJ‘HËÜûsÞz}Š®ó}?\"h		)ëâ”JHT1DÄ”ãØ.Y rfÑÓÕ2^:5ÃwŸçÇgz©«*•+\rå(ÎÀ¤f®ý±‡®ñá‹sØä\núD½ÞÚŽ®ö¯ß\0¨”\'Q£Ì¾NÞu)—§>Â›cÔãÚ¨¾ðìþH\ZÀ‘ùªCÞ9‚m4i›ƒˆ\Z:;Ç«\'r_šè ï€ºípåïó´š	[ë­µ6›‹®/t±Oî‰ïÿ¹ln-Öß]X8·üçü¹o·³ßkÿ±f~!v]Uÿ­½÷¹sïÜ$Ó©tb2™ØPE‹M[Ä–VEú\"*Ò‹ÒDA,¢/Ö7ÿ<XÑ`iQ|*öÁÄ¡µ\"¢U\n!Š¶“6)&i2Ifî{ÎÙ{-ö93÷ÎÜ	ðÀæœ{î¾û|g­½¾õ­ue<£nM”ã‡˜-fÆz47¨õÑa²¯£}x”LF\nU´¼÷¢Úé„=£ÆÓÀunâpÜÜqo2ÎÖJJÆóI¹ßÌD-ëÅÆLjGvº\\ÞíC&|V&½¥ä·£˜>YkÎÁU2J…2±™“µeµ¬¾Æœ0×Ðæ¯Go\nÔÅõ© ‚^áÍb2s6übS+ ª‘°¬@¶¯õYà§ÀWv\rj%Nó%1½§\ràöa™-3Ö:[-$Ó”¡ÇEä)3;·+PïúÍ7\'¾a—>È¡<Âj˜Ã‹ÐÂlf=ô¼0„žD„õh£²A„Õ:Ë®YŸ8´ú:~öû·\\»º²è‹ÎŽ &¢ïí?=?mÎÇC(^JšõI•aKÉA„‘:jÝ4……3ºÎèco!ÌÎx¼÷\0^.¦ï2xgW–\Z­—Óæ¼ŒT/¸P|Â‡@èÌ0×Ì;‡x8‡Ùp–‘ý©ª˜&T–)ÖYpÅú7\0´\rT—¸Á”ÑÜFí†ñi­õ3}Ð«âRÄ|@’C\\£cÚ,Ò¤7³TjGÅø°ïŒ«\\/†ÛÔgß‹tœ1K’÷Ï¬ñžÎ Íûê!ªòñZŠ_Š/¼¸€8‡ˆ N&2ˆi¥ª\"¢õù@ü”áN^ŽÞª»œ.ûœ\Zö¹\Z}F;ZÊ5\"O„Þ(§«>\"‚‰\'8ùÕm¡üý|¨´å»ºÒ‹87†©Ir\"x1^÷Gžzq¥{b¥ö’*NòÞÔ&ZgDQÙuùÄ2ðyà¸Ãîô¢ÖaµêðG×ã‘»$VéÎS¤5Ä,ÕÔÒe´g	·çVN<óäjžœ‘DCÁ¼<<7-¹ÉÌk‡Á~‡a†1ø–Áí>Sòz\'œ]K¼ue•þ¾yÜâ]œí~€ÿ*øk¼ƒpè^öÜ²À…ëÞX))¼ßT<†Ü‡ñ3àZã¹¯îH	ýâ_ø‘Á»\\å{ÉZÍ	xçòY25îs5s3ž3k‰¾y…íñ·s5Kûç8ÐÍìÿßÊçn@C¶-këB5Ôø7p(·¹ÏŒ4¡Ñ¢x¤YHqI\'pÕ×†BÁ`Xòó—¯°´GÞÆÛejÚ6‘	tÌmÃÌÞmp;ðæP¶\'kBÁš(r\"XñÉ\"Tl£Å!€sÂ¨ŒVSV‘2*UÊù¯å.m”ž5•A¶Ts†®ÁÞ©{*5Ù6:99ÁÖšõx²NÏ÷ŒZ¡²\\xk2Žß¿Ÿ@Ó4l\n*j£ç5\'ëæ÷mË ±`ô¦FŸ“fGJÞŠ!²©i¥ÙWíõòòy\'rûbŸ:¥¬¯lráÖ•‚l\\7®`ª	P­¿]Ó:’1î¯Z\Z_¨?Û¥?Û´ÆRÃê[jŒö5TuêÐÖ\0ÁÅ:Z\\KÚb©æÕÔµ¡¹i\r“-]”ñNé4‰²åžªQ¦‚Žœãñû^äÐüs8	€±V-v,~îÁ~ü…X»‹[Ý·—¶fÛüWi[Ms£O[¡e÷8‚|ïá/²|ë1(V01œ¯1 ×9ÏZ9øLÉò…²ºô\r·CI4Nv9´ush;ÌPÓíclŽ©1ªgxèàè­0,âüITg©c‡˜:¨Ä¿F9úšFO„ÝŠyÛõÍ)RÄÕœºtŒ—ØÛÿ©Eç³¡5*UyžÁõE4É+[AýØù?ÁÕrixÄ}ûÕ–~ú}wÌ=pw¯÷BXñTå××\'å¥/¡xæ\0‹Æ»ë³Ä\0\0\0\0IEND®B`‚','foto-jogador.png','6464','2012-06-05 00:00:00','text',NULL),(8,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0{\0\0\0¢\0\0\0î”%Ï\0\0€\0IDATxÚ,¼[íúîÍ7Øÿµ…´™É”ôJBo\"Š]ìŠ\"*½Kï½—BB$!„nï]A”Þ;>>kïý~‹÷\ZÖ>Ž9rÄÎûœßuž÷LtúùýÅâÏñß»óÿß–ÿÞ™]üùÖÞÙ -ÏÈ¼;ôì©Ë¡.Þ<wÆK¦›-Dy$Ê¥’bc¨“íìÌ>Ê@Ylg‚R(Áã`|„Ëãrq6Šº lg&—Á„G6—Á 9ˆ\'Å(*àà¥ßrù.Æø\"ŒrHÊ ¤Á…\\‚`r¸L^!™(ÉFp&ÁDù®˜à»’b1‚‹0\\J„ð-\\Á)y\"9E(!J¹˜”$¥¸@	ïä’\nR$%())Pðø2‚ã<)ôŠ}d2/±HAñ(F±èŸ“ds(ÂC1Š‹HJJ‰dðHðín¯\\~R¥¸{åä“‘ŽÍ…Oÿ¬Oÿ³1óŸÍÿÙœùg}æÏÚôïÕ©½åï»Kßw—¿Ã—ö—§¶ç¿­Ï~]ûõeyæ³ÓÈ#óúÊýí_ïÍN~\ZëÖÕhÊóËsî_¾rîFpÐ¥AÇ=Ý½®J¾€‡\"‡Kp¸<„‹196ëƒ}”É9Êàu¡X$…’8%Y \"bazÔg°x,Eÿ‘’Ql6Éf«xBOÌg£\".%DH>¡”Ý		FðÙ8¼(\'	ÁS\nDRŒ¢\\0œÉ$\\0ŒàŽ!”$“â !DxB.#y\nJÄgs…)#xB”S\"—”p¹RRH°0„ÁâsIÆ“óÅ2’/á\nd8®‹ÝÅb%ŸâƒÄlÎ`cL6—É&ØÎ&à÷å£ðWñ`ùy(%Á	•@rL!=ç«Jí6TÎM¿:X›ú{cæÿlýüÏæ¯?3¯ÿ8Xýñ{eê`eêŸé¿×§w§6¾mÍoü\ZwjïÖ­,NnoLo¯Ž?îîÒÕÔ—e%Ý¿~ïò™û×®Ü<{ñÆù3¾®nR•›ÈUF\n)/ƒOQ‚¹ gÐ”ÍqfbLgÑrL.Îƒc\\Á\0o\"ás!†%(då	;_¤HÕà Œ¡¥ ›Ëc¡6*éQB‚bð&Åó’(½ånJJ Æù<—dpð6GÎãKaÁ¸””Ë•pq)Ë\0Ïq>Jˆ¹¸[„ó$\\ŠÇ!øx…ä£8êÂÂ0/!ƒ‚’ˆamp\nWóxR—,ÎÂ06Êdc,	?Bˆ0…$‚ÃI,ÂI°| JzÎ`ðb¸{úó“…ñ? /8ýçŸ¿×ü½6ý_ÅÿYÿ±·2µ½ômsabsnÜÉ`ÒüÙ[\\Yøôúiÿ°­mÈ¦OŒ¼vùüåÓ~çŽœ\ròòòRxy)½¼U~®bµ˜ „\n¿ÎbƒeÀæˆ³ë“DHœ‰ñ8pÊ|„‡3¹@\nÌÎßœ/Ç¸ ·ç¹|øõÜ2%ó+½Dª@u Š¸	$î\"±”nE%\"Û|8pŠËQÌ\'ðð=„¾Ä“©xb1J	0P\0ß%Ä1ÆHAk8QžŒË¸”\"å†|D!Ä(8-àS¥\"¹AU|±§Hì)»òxð{‘v”kƒ2ÀF\n#D~~ž^ø\'pRÁç¨änŸ{êh72;ùfåçûƒÍé6g@ñ?ë?~¯Mï¯NÐÌÅ¿ï‚­¾mÎM85èê7W\'g¿¿y>ÖmÔä¦Ü»wãâ…\0ÿ`o÷^n~j\0w//™›‡ÜÝÓÕ[&V‰y\">J\n0’BP0;—‰š	JZ›Ï³Aw´F%éJ	„HÉ%<x’@±Ô‹/ò¦ÄÇDJ‰ÂOâî%TúH•^b¹\'H)VxòÄî$ß¾…Ë—£„ŠËS‚ùB/žØƒz	„~¹HîËúDÞ\"‘\'OªÀùbÉgÃ€¦b\Z2p2qEÀ\"%ørœtå‹d8ÈÎG—\"G!É§\\Bòå<#é!xJd°–<X?„âs0˜‹³@iX0BÂå	qcÁ·#RJ ˆ\\åwoœy:Ü9óõÙÆÂ8xùŸÍÿÐŠÏü^Ÿ>Xý~°NÛ|u°¾ŸwÒéëÞ=ï_˜y]YœvíB€Ç	OµÚßMí¯R»ËÕ>rw@Š‡Ä]-õò«e\"¹”/•À	‹‘$Ì	\0ëp°¸ý;“\")Dq	#‹ïÎûKÅ27?±ô¼ÚãŒ\\qÆÝç¼Úë‚»Ï1‘â¸T(W«\'nRy D$–ûÐK\"é})~ H +ä\'dŠÓ2Åq±ô„ÞìzB¢8)•ù‰þB‰\'¼_(Vƒ¦00\ZÙ .ŒVS)e`y˜”X†Q@!Î“ 5ÇÙ…GÛSbµÐUE\nÝxB7¾ÈC\"‡±L¡À\".ÉÆaö`6‡ÉÁ\0<ø*|#…pa{Š$ÇUò„¨ë“Ÿ­þü¼·J+vXö×¾ï­}ÿ³>\r;Kß·\'7ÆÚL¯žõêòn‡œ8âx °CåëªöUƒÁÝýTnž27•ÔU!”)EJ™«J$—ñE`\rüÃ0ÜÙœk0H~>ÊƒŸ­¢D2Õq™ú‚‡×µ€à›~ÇÂŽ¿åë\'ðÔc\'î8sÕçøOßÇoù\\ñ>~ÑÍë’·ïeµ÷7*õm/ÿëj¯Kjï›~þ7<½/zx^óô‘É¯(”7<Ô7Ý<®º{ŸQÈKd\"‰;	°â©I¾Š\0•Q8åÅ$Ác#Ù(SIòaf(	PHŒ\0[H‚aÀh!\\ž«ÈÕM®rã`¨xˆEîB…\nq8Yè,Æd0º .4m(XHz\\“pºˆ‚Ï÷’\nƒ½UÖíüÔëýµé??aŠR@î•©ýåÉC³ÿØ^šÜZ<ôx»±¶®,#þþõÓþþnþ*ÓA\'|ý½åJ•‡›ÄÕU$S\ne\n‘Â]æá&uw+Õ\"¹«Pªäó$8u¡ˆÃIE#†›Ÿ\\é\'uR¨C¼œ>w!$!ärüù‹É!ç“CB’B®¤\\¹™rãNÒ•«±g.$_¾’r)$éJHÜÙ3ñgÎ\'œ‰:q\"éô©”sçcO‡ùøEDúú‡ûú„ûúÝóòºëî}ÛÝ+ÊÛû¯w¨—×•ú´Træ*Oà†r—s	Æ££!BÀÉ\'+°IÌŠKyb°?ŒJ)%”|	AIG+ä\"ÆWòE®B±’\'€Ùë%‚“FJ¡8hM29ƒ\0Ó]Ø4a€œ\\> #âLÑcJiÜƒëß>?Ú;-oü\0|¬Mƒå! [~¯Áäü“s8^“–pïRðñ\0•«Ò-ÀÓ7Ð\'Ð[éÃD-»I$´â‰+_æ&÷PÉ=|ÔÇÜÁYg¨„Kˆq€K3DE=…â`WÏóîÞ×}ƒ\"ƒO\'_¹šz·4\"²è^xñý;¥Qõ±±\r±qµñQ\r	Q51‘¹7¯–Þ/	»SQu?¬1æAUø­ª{·kîß®¾VpãjþõœË—²/^È¿zµðê¥‚KgÓÏœI>~âž‡gœwÄ1ŸpOïëj×kJ÷s2I_pL$õæ	]q\n¸‚žŸúè8æâÂe >ÅG(ø™å¹Œ„3L€C0©À}…X¿µŠ¤Ô|¡˜$qPÙ…	¡…yô(ì#GQ”D|Œ’Ãô&øb§_=îÑ×¥Ý˜? 	þc›S øÞÊ·ÝÕoûëS;àq˜œóNn]8èà¦ö’¹zIrùécÞ\nµ›D\nFV‰¤JT!VºIÔnb…›Xî.€G•+%q%Er(OŽS>bÙ)•çŸ€ÈÓâCndßº[q_Ó’–Ò™™ØœkJMlKOìÎJ°å>´f\'ugÅweÄë¢#z2’;R¢\rqá¦„{-±·Zãïu$FècáQÍÑ÷ë#ÂÊîÜ¨¾}½&,´îîÕ†ðk5¡W+n^L9q<ýdpFð±”ãÇ¢}½£|¼®¹º^‘«ÎJå\'ÅbÀ]éHŠr%()Dè¨žbbäaÞáB	)RðEr ?„‚¢ž\0b;d*ð=ržÀ•äÂR!.L“Í:Êdas |¸ ‘ab	HJN‡zBˆ“jyFBØì÷—û«3tDù¯ÁW@èo»+ßÀã 8ô \rH‡gü}o„œ÷V¹ÑŠ+Õ^J¥¯««·ÂÝS®T$Pá\\…7©J-r…3N%€² s)9FªI˜ÚW*R¨.yúF»våjID”&)¡-=µ#ý¡-/Ë–›ÜŸûp0?e¨0m¤(k°4ýIYö“ÒÌ±âÌ¡¼‡]‰ŽÜ{z´=#º/3Îö0ª/#Î–Ó™øÀœÑÕ“–Ôy¯6<´\"ôJíÝ[Úû¡º×ên],\n9Y|98ýäñ¬³Ápdœ|àãu×ËóšB}ÙUu^&\rà¼y<%“@gÁp‹Ëuf¡GY$ƒ	q›‡’2¾f©R,?*ÀFŠ=;g\0%\'w>DX	¸‚¸ëÌAœY“Ívæ0ÿb²¡…@…FaþâBÅ\r²¦Z,ºì;`kÚXúsr÷PîÝå©=P|ùÛ>p|yò*_®ž>áí¦VŠDþ*7¥Úœ.UºKäÞ\n•Z(s¹ÂðôVxùÈÔnàzžØ\' „KC<=ÂƒbÏ‡¤]¹Y\Zq_—’Ü“—Ó——ÓŸŸ1Z˜>Røp´ õIIúóÒô·Õ¹oëŠÞ5¾«/|WWð®&ÿUEÎÓâôÁÌ¸á¬¸±Ü”‘Ü”Ñ¼äá¼ä¡‚ÄáÜD[Z´5=Æž•Ò—Ó™Õ™]{ûZmhHõÍ‹µ¡—jC/ÖÜ¸TwórñÅSÅWÎçœ;z\"0ñXÀw·{Þnç¥ÊSbù9™ê„XâFRbB2™¸ƒëÂ ,’	¥\n\ZR–„€	µ1g6J&„B(¥dÈ‹Àz„HŒÉeÿÅ‚^30ÄÃ€Þ¥”bCò@[†T#ÄÑ`/¥¦:gáÇ‡e{\Zä•wàXšÜ]ŽoA×Ÿûât6Ð÷¸Zíë¦öqsós÷ñC½T¨¥Rh-wuI<¤®~\nO_x\\¤J=…®A\n«^Ç¢ÏœÏ¸z½ènxC|²)%Åš—;T’÷´¢àiYöëÊ¼·•¹oË3?Ôä¾«ÉþXŸ7®-ýÒXú¹ñð±¡øCMÎ»ªœ7UY/K2ž<|V’ó¼8ûIqæ“Â´±âäG‰cûÒclYqÖŒ{zLojtojDÏÃ˜Îø{í‰a=Iá	w[cnÕÞ¹Tz±âêé¼Ó9\'üÂ=Ô÷<=o(Ý®ª=CT®Ç¥®ž¤DÆÆH\0‹‰arij#G@5T_—¯ sGÙ(dmáR\\h˜¤’Ï‡ÞOrBŒ9#Ì38Î,ò\"u6,\0‹‰^Jò(„\"ÄO)NO]œý´½ü\rDßY9L„K[t‡h¸5?±T¹püØio•ÊÇÕM-VAHRQ4:<Ä\n•@Ò],÷(””R”§HúÁ™sáaÚÄ„–´dk^æpIÞpQöP¹6ÿCMþ‡ª¼÷Õ¹k\n>Õ|i(×Mhó\'šÊ&›*á˜ÐkKÞW¤¿.Iz_ñ¾*ïmUÎëÒìÅéOòSŸ—d>+ÍzVœþ(?a,/q$/\\?Z4V˜2œ›Ô—=”kËˆ±¦EXRÂ:Â»âïvÄÞjº}¡âê™âs\'sO¤ŸL9z2àÁ±À›>>!n^þB©\Z#dÊc²g&4a’ÅÍþ÷@ÎÄ¡ƒîÐHˆ’Ð6™àtTLIå”@Fp	”OaŽ³3ã/gæQgÔ™ýhŽº “Á_€`|õ	®	œšx±µøm}a|{qjl¾ŠÛYü¶µøÆ&ŒV§„{aîàkè~r/¥‡§TZ»K•®|1ýOBî¦èø	YÊK,\r<‘{ûNC|Lkj¢-+m¸$ûIyæ³òÌ×•¹ks?Õä}©ÍûZW0ÞP4ÑP2ÙTñ½©ü{cñ÷¦Â)}ùTsÙæòo…“M¥ÚÒ¯°ÚÂ/uù«r?Tæ½+Ïz]œþ¼ õyaÚ³Â¤gÅáxQ’ö²<óEQpéEIÆó’Œ§Eé#y‰Ù±C¹ñpØÒÀøaÑ×uw/W„œ,:²ðÒé´“égO=Žô»îã¬Pzðù*HV.b±xæBoõp™LÄ™Éþ’“ä2R„#P.à…ËBe0Ã(\nf/É”³™euAŽ2áäÀ9(¼aÁÛ ŽàÐøWI®òá¡ÎÕ¹/[K“›ó“ôãâ8½2ÿmsáÛÚ=žá§R{*”^®®>*75ÌIºtA¹¢U–’/±RN	=ø’§Ï”„†S¢Íi±Ž¼ÔÇÅ9¯*ÞÐŽÎÿª-¡¥l,ü¦)ùaløÙ¦ùÕ^?ÛÑðÓP÷«¹rFWýS_;c¨€ãGKÕ´¡jÚT=e¬ün\0Ñ‹?Wg|ªÎúX•ó±*ë]YÖ‡Šì7eiïkÁûYª²ßÂQ‘´yV”ú¬8õ9¬JIæã’ÔÑ¼Ø‘üäœ˜Á¬8Kê}sJxG\\˜þÞÕÚ°‹Å—ƒŠBN§>îÃÃíœÊ-@,öá‹•\\R† ¨øLähF$‹E²:h38R\\$@Ðà¸l”ÀŒÅP<WPE\nÄÀaú9Êú‹Ár>Êv¡‡\'—E/Ê`q,1— 8,!†zIÄ‘×~N½›Ó›…0*¾®Ï¯Ï~]ŸˆO¬ÍŽ;Ý	9äéå£”û¸¹{Êä®\"±‚\'aä)Áw	]	ÊC(»|²üÞcl„95Úž?V”þº<ïc]é‡êœoMåSº²úŠŸ­µ½Æ‹a¡»i¡»~®«q¶­vÖT3kªûe¨þe¬øi¨œm­þÕZ÷ÓT=ÓRöÃP6¥+™Ðä7ä}®ÎùX™þ©2ýsUÖ§êìpTfÂ2Àb¼¯Ê|[žñŒ_˜ü¼(åyÑÃçÅ)Æ\n“Gòb‡³£‡2£û3ô&‡w%†5G\\ÓÞ¿^zí|ñµóÙND¸ááyRªðŠ½%2¨HbúÁ£‹Åçp	Š2h¦PJL‰„(IoÏB†<ŠPBÊç+I’Þ¿äAÁ&8GYì£Læ¨ ,„uáp9ÁÆ\0,pHq4ÈS¦©Îš\Z¾:7¾:;±úk|å×—å_Ÿ—~~]šùº8óÙ).üV°·W€›ÊW¥p‹E8.€‹àÉrµØUR$:}¦âþMcìÍö¸;¶ôØ‘¢ø·UjJ>ÕŒ×çÿh©þi¨žëÐ.YôköÖ[órn±»i±K»Ð¡™o«™oÅ«æM5ómµó­5\rsíÕ¿ZÊgM•?šË¦uå“Ú¼ÉÆ‚‰†Â‰ºÜñºœ/ÕÙ`ü¯5Y_êr>×d~¬Î|_‘ö¶,ã]eöë²‡/J;Ÿ$<)LÉÎŠËÎ‰udG[SÂM1·Úîë¢n—††ä]>\Z|<ÌËý¬B(¦ËQ€ÜÛ\'–ã|!¤‚RB\'8(°‚DPÁç#<Ý’8P§ ÉˆérDIá+P9²\0JPb9G8\\›`¢†âŽÁùl”‡°]ùTÂƒ-US¯~|^üñeqúóüôÇ¹©sß?Í~ÿèzãÒ‰ Ó~¾ÞJ¥’O³LÉ£wSÝ2?•ÜO,»x¬\"üfkbd_zì@nüÓ’Œ7Õ¹_4¥ßõ5ÓÍ3ÆêùŽ¦Åîæ›qÍÞ²ÖgÚ°ÖlÆe‹aÙ¬]în\\ìÒ,´Ö/´Õî‹µK]š%X‰¶Ú…¶†ù¶z0þ¯–Ê#è^2ÕTô][ð]SðMS0QO«ÿ­!o¢!o¼>çcu0çSUŒ\\`/Š“ŸæÅ=Ê”=–3š3š?ÙÚó0²=)¼îÞ¥Â«çÒÏžˆò¿îæqB&õæC™¨I‘š\'Q)¹@(ã‰\0\r3ú:—\'¢w,„›Æ\'\0ýÐ`ù<%Î—‘Ð0EÈ!ÐQgÆa«B¹H)8}ÁFÐ—·°ëçÛ\r5–ý·/~M~ú9ùáçÄ»éñ·3~Œ¿ŽÇf&F…]¾è&†p*€Lâ!Ÿ=v‚ÞÏ’ËÏ»ªÊÂnv=Œvd\'>-ÎxS™ó¾¶à³¦dº¥v¶];ßÑ\0.^ê1¬ô6¯YAhýºÝ¸ÞÛ´fïi^íi^ëiZ67®vkWzšWàyOÃ²Y·Ò£[îÔ.´kæÛAôº9àLK˜}¦¹tª±ðGcáwMþw\r¨_ø­DÏŸhÈÿZ®ÏýR“wHüÌwåß”$½*zø¤ áQNäXnô£<ZqÈ6öŒ([zTWÒ=CT§+9×/ÄÞöö>¯t;&–yA“$x*þa‘& P\r€à\"„G2˜@g!Fï·H	‘ˆË#Øˆç+y|5%(;”@\0#Ú=B!Õ ‡¤€?0‡!· €u)‰Ÿt——ä¦Û:‡,Ÿ^?ÿþåÝ·O¯Æ?¾šüôvâãk\'ƒ¶²$7#öÞ-?W5VhhƒŽ»{¨D¢\0…:ûúKFÌHÞÃç¥Yokò?Ö@Î›2VÏv4.š›Vz\r‹\r+Ýšu«i³ß°nÓ­[›Öðøj¯~Ý¢[3kÖÌZP|ÝlXïÑÃJ¬ö‚âú¥®æÅÎúùÖê¹Îº…¶êÙ–Š9Sõ/Cù/]Émá4è®+;´<d°|þ7H5êë²¿Ö\0Ùs>Tf¼/~Ušü¢(þqvˆ>š1š\0µ?=¢\'5ÒpGZrãBÚù3‘ÁÇnzûŸu÷š{ð\nÎc¾»X)Å´¾¤@Š‰ùlgrþ»+ÂÁûtN¢\\!—\'Æ%Á•<1W¤ …`sŒ}\nCè‹sÎFp¡è‹\0\"¶Ç|Eüû7.Z»õÖ†>¾~òþÕ“¯xõäýË§N-šZS£¦4;-HíŠË1Ê[@—«¼›ÇÍYñ£0©*2Þ×~(ÝTö&a‡vükiYe{š7lÆM›iÛnÜ°6oXõ6=ýhm\\ï®ß´èÖ-†Ýzwóº¹i½W¿Ú£]³wj:jæL•\0œê¹–òùÖªYSõ¬±ü‡®d¦±pF[6ÝT:ÝT2ÕX\n)è ¾f&ÿs-ð=ûSuÆ‡ªô·e_Ç½,ˆš7–1’7š5eËŽiŽ¯¾­ðú…Œ³	gNÞö8£r;!wó*=R%I©¸Åbz£_ Æ(!‡â˜(‰’”¦¹’¹’<!ŠÊHJ†á®_\0Éäp‚u”Áqùï598xJ\"8ÎàHÜ[(:á­ÒÖ—9úF}ÏFžŽö?|>6ôtdÐéÃëç/FÍ9/_$\"H˜~\nu°§{éý°±ÒôWUùïêK¿6–7•O*ç;—zõ+fP¹mÓÞ¾eoÝìoÝê7íØM[ý†Y¿ÑÛ¼ÙkØ´4n˜µ]šõÞfx²N77®Ó´i\\íj\\š·×,uÕ.™ë–:5s-•ó-•sl\0ëFˆíE3Í0TK¦´E“Ú‚IÀmóâImÉDcÑD}þ×ºœ¯uiÒ?T>|[\Zÿª,éEq¤\0ËPV‚=ëAoÆ}CrxÕƒk%·BÒ.žŽ>ø ðØUŸ³nÞÇ*‘Ð]¤r%¡pH[¸ÐÔ	èœBúFœb#B„\'#!,ò]yR)LWFïâ’”‚ä:dB)ê‚²œÙ\\à8¥.¼¤/Ê9Bœã!à{KéÉ1Ý]Æ¾ÞÎ[O¿Õ<`·Ù¬«ÙiafüÅ#Go»áÖùSn\r)JÁ{Š¥¡\'OTä½ªÉû -ùª+Ÿ\0	ŒµóíÚÅÞ–•¾Öu{×–£cÇÑ¾Ûß¾Ý×º;Ð¶mkÝêÑov7nti7{š·¬úM«aÃrøØÛZ¯Ó§Eó!ßu4^\0J]š•n-ø}±£v¡ðR7	R_6£+þi(û¡+úÑTü£©ì»¦xª©xRS<ÙXôŽ4y_ës¾Öf|®†“ñ¾\"ùuiÒ«ÒÄg…±OŠ ¶&8òb»Ó¢LIáÚ¸°ªðK·.¥ž?}òäeoïÓ*·Sî^Çä®n‘J(W	2hŒ,æ$Á\" B‚XL±P‹B.’øÇæJpN%A‰¹\\!Î—\"œBõG¡Ç²›¾DG·*úFµ€tó£îÝ®«(k34·Œ]míæöÎî¶ÖŽV“ÓîÖÂ÷oïž=²Wgz¨e_)”S{˜«\n?´U1TŽëá(™jvk–Ìú%kËº½c{ û¿rï\r´ïÚ[vìíÛÝú­N\0d³W·eiÞ±áØî7mÒTiÞèÕoô\0Ù\r øZwóÐ¦·q\r†j—fµK»fnZj«[\0ª*f[ª~éËéKi¬ëKaœÖ§›K@k…<£+øx©Ë™¨Ëþ\\“ú©&\rœþ®ô!\0ýyYòÓÒ¤±âÄ¡‚XKv¬))¢.úNù½+¹·BÒ/ŸK8wö~PÐUO¯SîÞrµ‡Hª Å²Ã,‡$éi ˆâ(%7¹HW€P0ZEø!sPž’G©(\\ÝKH	¡J*uå±£,‚‰Ñ—y9@|Œäpp&[ÁN§üýJ«**4U5z®¹±¹±AÛP×à´³97þáÅÓa{smyèÅó*	,¾âÁ•[ãÃm½\r­5ßM5SÆšŸ+z›{k¶Ö\rG×6ö¶½þö}G×ž½“V¼Ç°Ù£ßêmÞêÅ\rÛp€âvPÜ¸Z÷4­™›7z òšY·a×7­gàõî:Ð}¥S»ÔZ\rNŸk­œk©úI+^úK_ò³¹tÈºëŠ§\reÓ†òïMÅõ‡±¶ù—šÜå¯Š“Ÿ—Ä?-MxT7X×›­¿Wu§(ôJÆ¥	gNGœ<v,àšïq…2Páê#U¸|Îs9!°	®3Â¥K\rE2iù(”‹3Q>F€âô%”+åâj’P¤€¾úŠ\"ÀËCNð1]S9˜˜+£ÉdÁdV“¤By?<9ñáÃ”ô¬œ¼‚‚’œÜâœ¬\\§Õ_Ÿ_õ›s³’#îôððSª;k«fÆ:§z§;4S¦ª™6Í\\WÓb¯a¹Ç°ô yÒßèÚwt˜wúÚv-¦-kË¦E¿Ó«ß±v¬­À™CÅ\rë}FPy­»iÃb\\ïó iÓÒ²ÑÞo:T\\¢¯t×-¶V-´VCEš7VÀ,5”Í!½ÿl.û©+þ¡+¥¤K\'5PSiQÎé¯KR_•¦>-I~V–6PØ›Ñ–ÓV~)ûzHÒ…è“Á¡þ~!žÁPú%rOÔ](RPR‘Q\"ÈÔ¨3“dC¥·º$ŸÇ!*ÊÓ³çsWŠ‚Y*Æ\0Aˆˆ’¸Š8‹Ë‚˜È†ÚI_¦ã\\ŠÉ”+Ë(òŒ¿ÿ…óÏŸ¿|åVXFzfVFfFZªÓÂìô‡×O!»d¤$FD>¸zýú©³¿ÞÎ?îúÑ«›éhøÑ®™ëÖÌ›\0Ö¶-{Ç–£}boßëïÜïïÜëïØéošoÙL[4ÁÛ}¦mP¼¯e£¿eËf€$‡cÃÒJOZ«N86zµ4…`{›V:j—Ûë[kaÀ‚â€§³-5àtP*ëO}åOC¥ïÚüoùô6Ž6¦èá¶Læ‡ªì÷åY¯*R•>Žw¥>ÐÇßnŠ»Óu¹2üfú•‹1§NÞññ¹â_yL*õI]	J-’Ê¸B‹]N	Hg€„\\¶°…v7ä½sKHH¾Š+èë>$€ž‹P2±˜’r™8â§ÂÇ¹|.I11J;ýÓG.;s,èTÐ¹k×o&$%ÅÇ?ŒŽIpZYšûòéíØ ­ESŸÛXWß^_µô¦ñq×Œ¹éWgãl§v®«y¡W¿l5®YMëOÀã}@’Î={Çž½}×„ÉiÚƒÛL»¶–8hËÇ»·@ý¾ÖM Io3¬Ä&Ç\r¤FZz‹îð0¬Í;j×º!ÀÔ/¶×Ì›* &þl.þ©/Ÿm.ŸªÏ5Vý4VÌÊJ¦u…0?§\Z‹\'¡‘ÖçÐx©ËüPý®6çUUÆXIÒ`~\\_vlk2ˆ~§êÞõ’Û!—ÎÇõòº¨VR(Ä2o¾ªœ¾YŽžr0\nÓ’@°Qg6½\rË 7a~ò ¡(EÅÐ€¸„ãª„\"ÀÊäJÄn2‰Z€‹1ˆ‰Èá˜¥oûâsP‚àLDÎç9tñÂåèðrôÝðˆ;·#æç~B@´÷ê5ÕÉÑê**¾>±.¿î[iŸ17ÿêÔÍv6Îu5.öèV,ÐÝëNú;vû;\0â@ð=›ißjú±¶íØ[wá°ƒÇ[`@ëm{ë´ÿnˆçº­žCw÷6nö\0a€ûM‡s¾¤YëªYëª_i«_¦›QÅR—fÎTþÓXõ«ÒKÕ¯Öj‹3°†Ò©¦Âi}	tÑÉú¼oõÙPGks>Ôå¼­ÉzU™ö¤èá@^\"äñŽä{Ú¨Ûµ‘¡¥a×²o\\H9uÌÿš›g°LyR.óå”\\JŠp%@jç#¤\0bä\r½•5’ãÌ\0ÉÈÚ.(¼ˆÓ9bƒÉ(JEð¡ÜS”L©ôUŠ\\é;Ô˜ÌC¡qúþ,†8³„yñôÙ˜ð»‰ÑqaaQ¡·Ü¸é4ñåÓÄ—öÞÎŽ–æÈ;¡Æ†º™—ö…§½ÃíóVhMÜb\\²\ZWl&›ë´Ûwì;ö¶Ý¾ö½Ãc‡ö5¨lÜékÙ¥	cÜëkÝ±Á:é• ÅÕå·¬tŒÙ¶êé³¡¿cÓfÜutl˜å«µthioXn­[j¯…¼N‡ú«¥ú—±òWKå/ð¸‘Þ€¤ø\rš‘®RãD}î7mþçz(ÃY`ó×™Àñ‘‚ä¾Ü¤Ž´MdhÅÝÐâÐ+YÏ&F¿áíuNåzR®ðHU8O‰Ó÷ËÉEp@\\6„qŠE’l‚Í`!.l$tBÏF&tzDDð\0è$›­„ç%ôñ9-»KøR\0< 9¤0R‚ã\\NŽ°Wâ¢\"ÂÂ£CoÇ\\¾\Zíôîõ«wï^÷vw·\Z¹iifƒ~åýðòóÒPë¢Í°hÖ¾—¬º{ëZ_Û¦Õ´akß²¶oÛ:Ô;6š*Àˆ[––m«–a»XOëëAË\r}ð-†C¾·l÷ví¦Xzåà´€JÏÕî†•N8´+]\r´âMôæ$tˆŒ´ô\Z+fôeÓÍ z9Ô¢ïtHÿ®-þ¦É×~ªËÿPóº<ûEyæãÒ´Á‚äîŒØæØÐª{a¡W‹o„¤ž=}Ìç~€ße¯“2µ?_äÁA¨P \\úŒ¾\Z&îÂ$™>}\'4§­Í†0ÎepÙGèíY\nÁå”^\"ttäísÊÇ÷‚”f‹\0Â8Bªá!˜‚ „ô\rkè…Ó§ïÞ¹};,>ŽÛ±NCƒÃÃ#ý6‡^Û”“”b®¯Y?¸ü¨kÑÞ²`3,˜uË@p‹iÍnÚèoß´µoXÛ6úº¶l7¶z[wéÚÙ¶çè\0z@VÙíôó]€‰µu¯&þn¿\Zén?<¡á³cÕÃ±ÛGg›m[Ëf_ó¦æªv¥³q¥»q©[»ÔliXl«[lÂ@íªŸ¥·ª «TNC\'ÒN6îÐ‰J&êéùù©&çCmÞÛ\ZZñ§eécÅí™ñ£\rñQšae·®d=tü¶·Ïuw·«nîA‰7O$çr¥&e#ôÍìzáÎ,ÌÅEˆ	Å^á28<„ ]¸\\&Æ@)4—úÎ^”îôB¡üì•H5œ6ÁÂp&‹ “ €\\ˆaAAwïÅ„E¦ÜL»ñ0ìÁC\'ƒÞØÛkën7uÆ¼ôôgfãÚ›¾ÕÇÝËƒ­p7È\r¼fæ@[(¾Õß¶…–Ž˜lfÛÞBkMû\ZTn§óbŸ	Öc(okÝíëØïïÚèØ…×éüÞzø¤}àÞf€l¾Ò­¡Ý;5tni©\\€öoªX8lÿ³tt²WÎèÊ4O[è¸]´t¢¡€¾zW›ÿ¶:ëuUîËÊ¬gå™ÃyI–ô˜6šæw*ïÀü¼–r6öø‰ënî§åŠ\"‰¯PäAð$(ª€h \"Œä±q\n²Š¦Ÿ˜à²Áï(#Q^Ä]¸$Bß5\'!(>Ï‚“\0cqO»}òÌ]…ÌWDJq*ä@åˆLBàp*œ<y?\"9*63:6;*.;26ËéajvKK»AoÒ5óÓ²&F{W_Y—Ç:–M‹ýRŸ~ÅjX±ê×¡ø\0Uì› Ä°6½{ÕF§@+¤ˆ%´;´‹AhŒSä°ùîÿëJÝt t˜iàôwîô·,::ðÐx1nt7®X:ê–ÌšU³v±½v©½fÁT±hª„„>×R=qE_5Šë«fšË§õ`ðâoZ‹e“šâ¯\r9ëòßÕä¿©Ì{U™û²\"ûqqæPN¢9å!îAùÍ«yW/d^N>q\"ödÐu/Ÿ@±Ì—\'tÇyîWÍ%ä\\RˆbB°3“I² U’\"úV:X;ÂàÒ¤G¹.Î|Æ,!`‘ˆCóS¬p»™íá~ÖUâNßÔÈ……áHpøKp¥@péÒíØøÜ„”‚ä´Š”´òäŒ*§¤Äô´Œ‚Ô´¼„¸¤œÔŒ™Ç=«/,Ë£­Ëý0-¡Óë!¢¬ZÖVè>ÐqhÅ[Ù@ímíh`íÃÝÃ¶YO[ÛjÜ³µ8ºa´tï÷·íÙ`j ùÞPÏNû.}®´îö·oYŒØ{›åËíuK\róÐ<Uó-Uó¦ÚYCåœ¾â—Ê\'äzxþÐ•Ðû\\:pz)½½¥)§çgÑ‡ZP<÷EyÎó²ìÇEi#ù)}Y	]©Ñ:°ùí«yWÎ¤=è×Û3ÄÕõ„LáÍ—x’|w‚tÅH>‹A—Êgcàq)”áÐ?¡ˆ²‘¿‡é…	Á‘t0èÅL¶\0ƒ7`9{énÈõXO· ³Ç]yÐý\'QH5¡aÑ9õåºÂ\n}q¹¡¨¢Åé^Xä°û¡·ïß¹–Ÿœúk´kå©ye´mÙÑ²Üg\0¹W,ú5«ñ¿)edµ·nôwnõ·ÓAîÃ@ÒAS»\n\'ŒGÓ¦¹y«×¸SÑlØëï>êÙÛ@n:8þê¥Ç&Ý›Ú÷ûiûÃP…¦ºÑ«£ÁÒY¿ÜQ»Ôå´®š7ÖÍ+ÛPèþËPCo¶ÐQËC)Ýø¡j‹¿ÔåÂñ©¦à]UÎëÊìçÅéÏŠÒGóSr¬ñÉš{·Š¯žÉ8{<Îßû¾§û…â´X6÷å‹ÜqR‰a2²0>F%›¢g ˆ.à3¹$%œ‹ƒeqœ¡¡¨3‡`rxLÈŽ³)„ºy»r\'ÉÏÿ’§*ðRPô)1N_/p‰KWoUi:µ«Öähj6˜†œBïDÝ‹\n»uï^tU^î´£ea¤se¸}	ä¦oYé5^ß”·¢¼uØBÏI:†ïöwÓ6·švéHN÷ ­^¨BÆm3ˆÞ¾ovwî9ºhž\0@º÷ì];ÖöÃ/µïö6ïÐ‘Ñ°aÖB6‡0CïmuÓ_¢{D\0KõØÜXô§l^óòâ}ù4$E]é·Æ²ñÆâñ†¢¯\ZÐ½èSUþ‡ªÜ·´è“Çò“²,™‰)Qšˆ›¥7CÒÏFûÜvW_RÈÎJ¾|>(.‡‚ÎFèXâÌ\".$ëðƒKl.$kôuá`Îs†¨ÎâuaÿÅ$˜´ëyÅvFp„:3æâÕ·`?7¡HÈ%¹LŒDßcæÁ—ÃO¿Ž<Ÿ{5mw¼qJJÍ˜VšQžQØVWûÝ¦Ÿu´âËýú{Ë*x¼—Žá}íkÀtË†\"ÄðfÍkdsÀtMsˆ1]+ÚŠu“n»§u»·eßa>\0¹[{ö]CÖßƒ¶¿‡ûàùï!ËïaLÚ]«‘Þ{éÕÖk=ºå¶úÕ®¦¥íbkÝ‚©j¡´®™õ!’ëËgšJÀàÀú0ÖLëJ¿k‹¾Ö|Õ”ŒkJ¿Ô~®-€ã}eîûªüWåÙOÓ†³¬#º“#\rqwkï]Ë¿z.+ätBÐñpOï¥ú¸Pì‰â\\1›-\0ƒL.ü(‹b!Pú!uðÙ(ýá ú~ 6~§w˜ì#@&ç/g‚	pÇPW©ò¿ãïE)óõS©I6g#$U)Uº¶Ñßž¼žzþvº¦ÉìTTTSPT[X\\]\\RmÑi¿[\r³Óò`Ûr_Ë²2¸	`²¡°¯uÃlÚ‚Ù0±RÚ¶l4OÛöî[çViÃÜºÒÒ8__¿ÑpïÚîÒAT?_wîÚ»†-ƒæßÃ}†­¿û{þìÝw@^ì€W`0À*ÒkimY¶t5.wj—ÚµôÌ¹ëçL5?\ràñªŸ ¸¾\n þS_~¸ÍBï)N‚Üõùp|©/üXSðkóßUe¿¡žù8/y0+Þ’òÀw§ñÁ­š°Ëe·/gœ=éëê©:+“<¸)‡ËgqøP™Å`cG9P5á£8ÅæÐ}c¢àtž¸ ÈQ&LN–3“ùoˆá,„‹ñoE¦^ºžäáq6ÀÓ_‚Q|àÃ’Š„™íÖG]ög]öÕÚ§Î6Sg{KwGkoGûã®æï–fh›+C+ ¸Y¿ÚÔîXï5¬[L›Ö::Ì4F`èÙZ÷Ý;ŽNh;}Ûpô¶nt›Ö;M;v3=NmL:ö»:AÜð;Ø¼óïAëÁ@Ïþ@×¬DI8chÅ[7è=Ý!X@ñÆÅ6Èã5³-µ¿ôPà¨ü©«˜i*§ÏèËû\'(^ö\rb}	ük}ñçš‚àñš<\0ú«²ÌW¥Ï‹RGsúS#z’ï´DÝÔÜ»Vz¹ìúåì3gîý„PìÏã©¸$dsƒI1ã(P…tæà.l!‡yDuîB\" $q`—þÔ—¿\\X.¿3×Ã£ó}¡c¹ùS¹J¸¨C%$uíêìÜò‚Ò†’Ú–:½Ù©°¤<« ,#·4#»ÈÒXóÝÖ2;Ðº<Š·.÷´¬\0»ûÛ×i”·möuíö÷ì˜·ú éÐYpo¨kÏ˜î¡	nôÒØÙŽ[;vè€öý!ºó ¿ãïAóA÷ŸaÇo‡å`Àþ÷ußËÐµï°nõÂü„…±@Úì5®Ó¥_·Šw6/uhé;4³­õsmÚ_ÆêŸú\Z`ú¬±œýó»®tª¹â[#´¡²qMÉ—Ú‚ñúâOÕùïéÛ³ß”Ó4R2–•äÈˆ¶§Fv%EcBµwCkn_.»|>ûLpJÐ±kJe°PìEÜ¹„„Å²Ø¤ƒd°Ivæ±¸ôu	LÈc¢è-l’þˆ-ŠÂ ¶0Ø.ÿf8ÿÅ8ú/g.Æ‹Í\n\nW»z{ŠØˆÇDqÌ?0:!39µ(3·²¨ªÙ))¥01µðaZQjz±¥±nº¿e~¨my¨{µ¿mÕÞ¶áªf_;½-nëÞ8´$Äðþ®]HÖCP&;èlN·Ívx²M—L!f\0,Ãþ\0äBóo˜Úögtà÷HÿŸQÇÁÐÀïAûFû÷ûv`	û{÷‡ûw½›Ö¶õ#°eÅ¬_2–»\Z—:\ZÚ´ó&‹šÙ–º™æj\Z,(ŸU3†ªúª)hžeSÍ•ãõEŸŠ`r~©.ø\\]\0¢¨Éƒùùª(íYaúÓ¼‡£y	ƒéÑ}iQæ¤»¦Ø;ÚðËU¡—‹/Í:s\"&Ð÷¦»ú‚XîSJ*a±E,„\r¨B:’þ\\¤\Z\rFáÎ÷()¼N°¹ôÅeÊqFAô£ÿó×Ñ3Oœ»Yàéu^%U+x|‚Åâ£ˆ—«*2*)%­ \'¿ºº¾ÍéaziZfuzNuV^m¿^;ÝgšèZêZè„i	ßA¡ûôB2é¤+;@y°{wÀLw™¡.XzG…®BµaBÁQiÞµs»÷ÀÑÖÿ<\Zú=2øgtHò÷èðŸ±‘ÿŒÁs\0‹Þ¹?dßqtoÓù§sÝÖ±ÚmZîÒ¯ô»t‹mº…V\r=6AqcÝ¯æ\Z\Z,x¬˜Ö•O7U~×Òy|¼®ðKmÞ—†Â¯uÅ_ëŠ>Wç|ªÊýP•÷®2çEQÚóÂÔ§ùÉc9	#™qöÔKrxg|˜1úºæþ•ÒKgò/žÌ¹p&á¸ÿ]µê’B@ñ¤TÀÄx06]Ø(}!dã\"ÐwÍa@pô/8(úfO€Æuf3ÀãÿãâòoÒ\':¥ìäñª ‰+Æ„‚ãéêŸ–‘UR^©£Ï*lÈ-iÌ/7Uu´§l¦yGPem }½Ï´i?Ü‡¢w£@n \n`¤{o°g×ÑµöêÝèÙíë>lùôµ·½ž=ÈÚvóŽÞ³±ç`Èö÷ÈàÆFÿŒ‚ÇÿyòôŸ±áƒáƒÁþ}‡mßáØèÛ²›Y–ÎukçJwËrwËR·a±£yÎÐ0k¨ûÕR7×¢36Íê¡\rÕÌèj¦›ÊAñ)€‰¦t²±„þR[ô	D¯-þR(ÏýX™û¡2ûmEæ3Úã)Ï\n’ç&ŒeÅ¦Gö¥†›“ïuÄÝl‰¼¦¹{¾úúé¢KçRƒŽÅúùÝps;Á{á|9Bð Ÿ@úvF1z—¡Ÿþè¢2;÷ˆvZ(£/oP‹£—3ÿúŸ#,\Z›uåZ¬‡×Yoµ—ãb.w…*éavaq]MCki¥Þ©Bk©56v>6ZÞ<îîš²˜fûiŽ¯tltl\r˜YÑ¹ëèÝ¡3IÇXx`‚š÷mûC–½Á^ ÌN7½Ö}xÑA›–â‚Áýyúô÷£‘?žüóìéßŸŒï\r8ö›–Þ-›mÃnYíé\\1·.™[çÛMsíú…¶æ9Ý8Ó\\ó³¹ög3ŒÐú_†ú™¦Úï\r¥ßåžh(×¾‹¾Ô–@>ô©*çsMþÇª¼7YÀñ—¥ÇsG2¢‡2ï;2X“îšãï´ÅÞn‰¾Öp;¤êÖù‚‹Á‰>·ÜÕç¥Ê@žÈ\r£09]XpÃ’\"&@`R ½”Kox¡G0ô(}ÁÀ0XúÓ*ý¯#Gþbx‡DÆæ©½Îz¸úª„b˜·j…*\'¯¼¨LSZÝ\\YÓâÔbyÓ1ô©glÂúdê¹Å<ÕÛ2g7­8Ú×º¶\0ÓC–®m{×Þ e×Ñ~<Tôí¥´î[†û÷A_:,‚ñ{wí€	¼yÇÞs\00yüèŸgÏ÷GÆþ÷‹7ÿçíû?/^þ~úüï\'Oþ<~~0údwxpÃbÞ^ëéYîîXîéúÕ¢›ïhkoƒ\'¿Zô¦Ÿ:ÍŒ ^;­«ÒÕN6ÖLOšª&5ô,%ŸaTVæ~ªÎûX÷©ºà}Uî»²ô·å™¯JÒ^g<)\0¹†sâ‡³â†³c3#ì©÷Íô§,îƒèÍ÷®ÖÜ:]r58ç|Pt ß¥ê_âÃHØåÂâ1\\ ½0?™\\ƒîNW½kˆ;cœ¿˜\\Î!ÐQ’‰ý×‘£ÿú‚‘ÉÇƒny¹¹)dá“‚”ôüœÂêœâ†‚òF§¦ÎÇúÞgFëK“õÕ“®¶ï½†Å¶ÕÁŽµÁÎÍáÞæAˆ(={C´Ü»`vÚ¿»ýànÛÞõ`Äq0hwžÝ†ûû>@cÈ±×oÿ{ìÑßOžýçùËÿ¼zûÏ«wûŸŒ=Ù\ZÙ|´á\\±ö­Úú–ÍÝKæî_-Æ¹öÖéãŒQ÷Ã¨ŸÒë¾Cvj¬ÔÔ|­-ý¦©žÔÖ~©«ø\\Sö¥¾t¢ä®˜€Â©­üX]ÈþP•ÿ¦2ëuyÎËÒÌ7¥™¯Ë²éûžóSžäAVIÎIÌŠÈˆîO°>|`IºÛ“x»+î–)òš6ü|Åõ3…ƒ2NàçuV&ó\"®!` Ð†Î¡â(Ÿ¾2‡‰púÿ¡€ÂÉe¢ˆNßƒÈ„¢²1„Áqù_Œ¿þb…Ü‰»–áë{ÁUª$‚ÂÉä”´êZ}}C[­¶Í©ÎÐ¯1ØMýM­ƒÃFýd(Þº2Ð¾1Üµ1Ð¹Móá`ç!ý8h9rÐ¾ÜØéƒÈ/îôïÐ@·Ò€t€ÜÛ½½¿Çþ÷ó×ž¯_þ~òüÿ¾ÿòçõçÑg{#O¶†m>[µ­ô\rÌwšçºzæºÌ?L-?ÛŒ“º¦©ýd³nR«ù¦­›hløÜPñ®ºü]UéËÒÂWåÅ¯Ë?7”kªÆµU_´eŸëKàj\nÞU¼­¢§â”—…é úÓüø\'yI£¹‰C9±ŽÌ¨þ´ˆ¾´»}Ia})á=	7Ûc®î_n¸{¦âfpî¹“ÉÁA7ÜÝOK• ¸ŒC¢/,€OYˆ¡ÅFd<ŸÓñœƒÁhåe \Z÷¤Ê»ù7Ãçäùøô*¿Àk\0…H*\"ùqÑñåÕMušÎ:M›“Fß×`°ký\Z¥¯±n²W?oo[±·m˜7{»Û^Ÿe¨ÿ`¨ØRŒAöpŒ:ö†ì#ý#\0kˆô°íï:ÀéÃƒc ôŸoþ¼|·34¶÷èùîØ‹íG/7F¶Fž®Ø‡–ŽYsÏtkÇd[Ûx³ásSã„Î0¡×ë\Z?Ô×ÕéÞÔT¿¬.+.ÎÏíÏzØ“œdMNéËH{Tó¼,–á,È\r¡°®è}UÑÛÊ¼7å9¯J³^e¾,L{Zœö(/ñ	@<;~8;n(3v =j0-Âñð^ò]kBhwì¶Èëº»gëC/–^;Ÿvêx¤·×%W•ŸPªÄ1±wéë>„„Ë§ÿ·ŠþOM.ƒLç:#øQÎá­B\\xtþ—3!Tæ”·Ÿ¾ëïsÆÃU%å‹#¢cKËëk5ÆÚ&£S½ÎR¯³Ác¦Û¢©ýÖ­›·µ­ôÃØìÚ\ZìÚqôìÚ­ûý¶ýZßÝË>´˜Gƒcú•A;X{<>Ôw@#Þ¾ÛoÛsÀ+CÛvûÞàØnÿÐÁÓW¿Ÿ¾­÷¿Ø{¾9òlkøÙÆÀÈ²cdipt¶×:Ýeùj4›Ú?Œ_ZŒŸšš?6êÞ6Ô?¯©.)väÙóò{²2[“\Z£\"tÑQm‰q-ññÆèHkrâ@vê“¢œçå9/JrßTæ¿®Ìy]‘ÿ¦,ëuI:/Àà©r“žä&<ÊŽÉŠÊŠÍÅ£R#ú“ÃíÉá¶x`ËõÖÈ+ºðê›gó.Eúy\\V*OŠeî„@Ž0Byl6ê(•²	BÖ™t`ˆs]œƒs™(D8“¾Àù þéåW¯Ç{{ŸSÊÔ~ž¾DTU×6hšê›\rNuM½õ:kC³Ek°vT•Ošuó}¦åö5{÷&ˆîèÝî·ìô[v\'#ö½ËÞ°`Òï:vú­{ÃCûC®wm@v\Zß¿‡G÷‡F¶û†\0ß;ƒ£»c÷Ÿ¼Üy¶>8¶9òtsôÙ’m`eàñbßàüÀèL¯u¢­ë«©ó‹¡õˆÞÑõ²¶áyCÓ³:ÍhU]gV¶>1Y›T][q?ªôöÝÒk×+Bo×†ß7ÆÄ¶&Äö<LÊÍ\ZÎÍÎI}Zñª,ûe}ÁóeqêóÂ”§¹)råÅfÇƒÍG`xfÅgDgÆeF;ÒØ’îôÆ…uF]7F\\ÒÜ9_q58ýÔñ0·“±7Å#\\>” ÈÍ³‹8\\ú2ÒŒ¸¤³JsœþTÑï\0À]HPüßÿbûŸ»•Pê¦¾ —ªùûäçÔjêj´\ZƒÁIÓÔ«m¶jô–Æf³¡$ï[—nÎjZ¶™Vû@t¨š=[ý–­>Èà–½Qü\0 cC;ƒ´Ö»ý`yþ`À±ëèßu@Ê¢WÂ1øûÉ‹ƒÇÏwFo\r?Ú~¼j]ì4ßÛ?×7¸8\0î~òÓ20ÑÑ5ÞÞýÞØúªÉð¼A;V_;TY3TQÕWRÙ“[`HÉhJÎÔ$¤TEFg_»Yz·èfháÍÛ¹—/WÜ­¼s»ñÁ}MÄ}Sl”99Ö‘•61œâH’Ÿú¦4çUQÖóÂôgyÉOsg\'Œf\'ÓZ\n=˜vw$3z83| #²/ù®%îVOÌµ¶¨ËúWjnœÏ¿p*ÊÏ÷Œ\\êËçK9\\1tF2Ù\"„+ä\"Ë `ÑwtR¿èëÓ›\\ô®B0qö¿Yÿú_Gyb·´üFßj…ÿ)??mZŒ¾²H×Xß¨orÒ6uk\Z;š=ÚÆöÆ‚¬qhw½†%[ËboËª\rJP÷–£g»ßºë°î8ì´Á‡ü~4¼74|0ú¾Ó$Ü<}¼;4¼;<²34º3ühçÑ“Ý§¯7Ÿ.õ¯ôÍZFÆ]“–‰ëëFÃ­þqMí`yµ­¨Ì^RÚž–^]Y|/¶$<ª,\"¶:!-/<êî±S‰.§]¹~%4ù\\HLàÉ¸ã\'3Ï^Ì¿|µüÖÍŠÛ74áwLQ÷Úb#LÑÚ£ïuEÞr¤Ç<ÊO}Qþ&g~\"(>–•ô(;e$+V<-b05l4+f$#’þÈVÊ}KÒ=sÌ\rsìÖ¨«MwC*®žM	>êá~L­•a 2Îgp@n}à<&K\0T¶ÃF¸ÎLäßQL 9‡}”IßÒÅFŽüë(ƒ‰¥iÎ]xàw)ÈÍ³ýÖ%KÄ¾Ü‡&]ƒ“V×¥m67jÛëêô\r9ÙŸ[5?ÍÆ‹iÑbZéë\\µtnÚÌÛý¶¡~P|’4šQÐztdzÍÞàÀ®£owf)¨?º7:¶;ühwìÙ–cØ½óèõ’ãÉ÷Nëg`ºëM=¨¬(ªìÌÊ·WvfÕF\'–„G¦^¼œrþJêå;Ùá1Ùw£\"Ï\\¹óÿ³ôÞ_M­{×·??Ï}ÎÙÛ†´@ tDÁ.\n¢T¥÷–@HBHï½Ò{o´JèE.\n(ÅÞu»Ëyÿ’÷Š÷3Æ5ÖÊ{ïOfæwÎµ²®UZÓZø°éîýŽ{¥¨²šîâªž¢RÜƒrf}·±QÜÜÂ®¬å<ªãU×	«k•Í-úö6¦{€Dð`»p=“Ü‚±  /rÉó,ü,hœ4Éè3û¦ •£g\"†ì¥gŒ€!t÷µá[}½\rNt“¦½’^V¿_’u1/rC\"4=\ZùÒVL|$9DòØ@<9òDvìJ:w%h¨Eçãê³ÑQ¿G;}¡‹Àon§Ü/ª¾‘uE[Qj/-¶–—¸Ñ§ìî!§¬“É©á	6ú—~ûë!Gú¨$î¯#¡Ÿ“?€ÒÃ“…\'þžšùïüÒßsÓMOýœýr÷äô_á¹Ÿ`…NÏ}›ø2úœzœÜw¾ð7Ìî­%ÌOË5!…ÖÏ){IôšJMSwñ#\\u±¶½·º¹½´îÑµÒê»õ…µ5å®>ºZTw³ ón)º¼s¯_\\B-¯×6ÉZ:±ÈÛ[-ÍÊÖvUK‹¸¦NÑToF´Ú»Ûý8ô¬€9Ç§Ïrhs\"èœs\\Â$‹0Éè™Œ˜8Ó‘Óì8	9„oÐG­½m>l‹¹«NXWÑ}ëÎ£œ‹×¡É9‘û¡‘ïóG\'fÅCSc ©`œFE20–X€¤ÏEAÎž‹ù-*îttÌïÎýçlUºÅ½•_‘›q‘‘KKÊdÁ2•·®ŸrzÝ¾a—oÄh´é$Ò\'Vý¾Ûz2àz=è|7äý0èù<ìÿ\Zü62ô=4òsl ÿLKà\'‹NMýý˜û8ÉÄìÏñéSßCá#co|\'žÁ=«sËäÞ¶xgÒ2sˆÉ)-2¯N®¬Á<¨ê)®¡5vt=xˆ©nBW·Ü-/¿z¯âNiñ•»Å×‹Ë®U\\¿ÿèjAÃõÒÖÛÚo— óïuß,ÄÞ*$ÞçVT‰ªëy55¬ÒrNÅCfQ	­ø¿¢LÙÔhìlÀ¡CdÌ4ƒÔ\rÄ>Ë%…Y}ãôž¹T!à\'a&\n´¡1j÷01Bn&uöµøzëÈ†þÆ\nRqAÝ¥Ë…é™— ¹I‘oEvÚŠŽK³4\n‹‰N¹2â¯àž||üÂ@Ù?uúBì¿Ï^½[Áä™®^+¹’“_s…œ’C‡¦‹²³N…ÂSáéé©Ù¹ññ1›A÷Ø¬Þ¶\Z÷Ýö#¯ã•Ïþ&àúð~||ý:<ò}|4Æ?&ÂEª#àú1:ösbú{|¦¿M|†ÞúGŽœž—nïªZ7\'’ÏKúg„2ªo+vQXý½ªžPRA«ª\'>fÒØóàQ×ƒG¨’ª®âGM÷ÊëòK;Š«5í˜Šz |ÌÃ:ÜÃzði ×6K:r8\Z}w·©méFY0;céî± »ŒÝúŽV]{›¡­ÙÔÖìBÃ‡IØ	zß›4™œ¸I\ZfŒŽ§Ö]Ô®12|’ÖÁœ„’áƒÀX0õNdªù!§¢¨ãÚÕéÙ7’Ó/%e¦FÎgE|<56²Õâ/Ê±©qÐ´Ø¸ìÄ$g@AÍˆŽM:wáÜ¿Ï\\8}>áL,,ýr¿iäÆ­Úk¹w‹ónÒón±Ós…™™§Æ§Âãá©Ðd8\Z³MË&ýªA»i5îÚ­‡Ç¡Ûû6à}7xø0<üidäKpøÛøø×±Ñ/ÃC_G¿ƒß†ƒ_‡Ç¾‡&¿N~	‚Öz7:°»Ÿš¬³YÌ!3€Ÿx‰47fÆ¤­í¼Ú:*páú&AS;¥ª¡·¨ŒVÕÔw¿[V/©k¿WŽ)©äÖv*3Ö!È:{4=Xc/N×ÕëÄ“=xš³ô`L]G/ÚÑ‹3\":UmÜCûû0NT·¥»ËÖw\";‡‰`B¦Y #’fX„iP‚~5ÏIjOˆŠ\0ôÁq„ˆ‘¾ºÙÖU¯k«V•¡ïÞ®ÌÊ¾›‘“¹ã\nZ~&$9íBâ¯\0I‰NÿµEàeHR$ñRäJôRL\"ä·s	§Ï_ŠN€Æ%ó\rÅEíW.ÞÊÍcÜ,â^¼)HO?5155ž\ZOŽŽ…ÜVË”V¹¨×¬™\r;vóžË¹ç´î;/ö—v;íÛ¡Á÷ƒƒÏ#Á¯¡ñOÃ#Ÿ‡†¾cðËHèë(¨ìão|þc—ë™Ñº©1=V¨§ùâ 5Â`\rÒXŽ>²±%njÖv¡¥Ííýmmª8øQÙÞªFt);ÂúFiK›‹ P‡¨´a&k„Ma±Æ8ì ›d³Ç9¬‡¤ÒÆ™Ì	63D¡ŒRI#d\\\0‡\ZèÃøq/˜œèAfˆÔ7Hîà0#ä¾f€Î‰›¦co8’1“tÐ?»\'™˜¥û×ê\ZÂÁ=è+¢ÚÐY-­{Ø[p».÷ò½´Ì¼¤Œ,ˆ†‘³ä™ñ°_2Äã²c\"WA¯\'¥ÞHN¹œË…@rcò¢ãîÆ\'¶d\\Ì¸ØÃPTUõ^ÉÍ¿œu‘^XÆ½z—›ž}*<59ž˜‡Ýãh¿lJÛ¿¨Q-©”‹jÕ¢ºEÝ¿©Õ®«TÛ\Zís‹ýÈí~íñüã[çc`ðƒ/ði`ä½¼ÁÃÁc—wÏdßPëæy¢9¡,Ì†Xô1ž`„Ê´ô 0õH;\ZåíírötÛ»;mè.á@uú0ÃtÒ ?L\"é”A\nnBö“Iƒ$R\0 â†I}Ajßƒ:F\'Œ³iSLò$2Å$MÒ‰c4ü8?N!ŒQüíEvã1ãtB˜Eœ¤úCœaöM³qÓl,Èã4ô@O==FîªÆµù1-ÀÇ\rðJQ}ñ~A3Èˆé©W’SÓb\"; Fn¾…¦G®ZÄu–z75û&,#/11\'6þ$¹5ã\"õvÁíXq-¼ª\n›•y-35“VV%ºý@yåÔÌ\\xzv\"<=61´ëÕ.; 	…6ÛÏâx¬@<%‘N‰¤³BÉ’Lµe0Øì\'^ï+·çÇýÖí{çõ}ðùßûÞyo½¯ü‡ÇžÅº­Õ®J¥Ñ¬@4ÉbiôÑëóa1>ÚéÙ9€lóa:ý¸Õêìn³t´[ámö.¸¿¯o„L¡“F™”ÁÛƒò »lõ¦†j}U¹úQ©¼ô¾¬¢Èï áÇ} ‡L€#0Ií›¤€Ò;„Eõ\"ÃÚ›\nò8°ò…ÈV\"Ä%y¤6¢	F÷$\"uŒàZ‡z›ûÚýèzWwµ¡4þRq~Ë•Ü²‹o¥d		žjg¨ fFÇ§žÉƒ$æB ‘í.a©W“òâò’º/]g•–Ã.&%ç^ºTKÎIOJ!WVIòË„™—NÍ-LÍÍ‡gf\'&&Gur±’Ð§ÄâØmÔº&~gä¶!´½87‘>Äà™ì9±dM©yf2¹œ\'nçk—ç•ÃùÆí~e·¿q{^¹½oCG.×ÍúL§_—Éü-L#…HÄ,f¸;Ðƒ\Zìt·ùºZP¿Xwµ[\Z¤••ÆÖ¶\0ºw‡£Gñ˜<z‡ötµzQHOW»­£ÑÞÞfkn2×WëªÊåÅ÷ÙwîÈk™\r.|4Oz_˜EÓ±S´¾I*~’A\n³I3\\ú<‡º$ /Iè‹<Ê\"Ÿ<Ï!DÒaä¬˜¢â;†úÚ‡ðL‹Ych}(«/¦—´]¹R–™y+53;!-+>)ŒÇ8Xf\\2xÍˆŽ¹—˜ÍK‚åBÓAW?^O€u\\Ígß/oÌºKOËƒA3Ó’Rñªä…UÂô«§–Wæ–Ï..OÏÌ†Ô2`vtÃË«*oäWÞ(€—6ààÄúq\'ÒŠgX°Ä!\Zg†/z¢Tï›ÍGë¡Óþ:‚@÷¼ñúßùýàÇ# q“n[%\"Ísé³LZ˜J\nSp£8Ì0¦c¨ènòÁ[|èž>´°À;úëMí¾nä0\n5Œí	`ÖÛ‹ õùÉd\'…æ£1m´¥iêl1·7XÛëu\rÚÚG¢…¬ü[š¦j\' uRÐô$3AÃLq(Búhž\"Öc°$Ì1c4#i–,¨kœÒ¢ ÁïR»F‰]£$x\0ÓäBÖZ*øJèî¶FâJê5XÊÕÔ¬HD‰‚dÄ$¦ÄÄd\0+MÈŠM»—¹ê¹7‹ìîœ”IzžÕ|ñjÔù„””\\XbZfr&Ô…@<ïÔúÖòÚæÒÊúüÒÊ”FÁG×Ô¶?|tûÞ½Üüüœ[w/>ºUÚy¿šZ×*AôhÐ\'‰>ÎãÏ‰„k\nÙs½ö¥ÃvìrÙl¯\\ö÷~ï[¿ÿÄnår»íûFíÓ~ù!s‰E™¡ƒ{o×ÄvaÚýÝ-ƒ½Èa„€`Pº–fsg‹ÓèîìFz1.ÎN¤é	D™*ìB\Z[È\r­è²JìÃª¾’asµ¢¥FÑT£¨{¤¨¬–°î\\?*sc:Áœ§öètÌ4›<Ë£,(K\"ÆŠˆ¾\"‰¬e!ež¢&ÞB;X!|œŠ§ô	íLƒYcn«”ÕS‹îvÝ¼Y–ž™K¹K~’v>&rò6&>%*6ÄÈWœ/Ä>.ÙÑ9	„™¸¤¤Ø„ÈfëçcÏž‰INÊ\0ÄÓ’Ó1uuò{ÕüÔK§Þ}=ùðíÍço>~>ñ=\rˆÊÚ¢+woçÜºw¥¨øúƒâ¼;­¨¢rvcKW—©ï%SAfX‹7û•»\ZÕ¾IûÒj8vßù¼o¼.%ßÙŒûzå¶\\¸.f®p)ü7æ¦Õ‡höw#ûÐABß`/Á…\01éíét#ü]Hª×N¦‹‘h~/~¯¢43÷\nš›”“ÚvÊù¸¬ó1W!ñ÷a°ö[¹¨[yœŠû‚‡Eì‚[´Û×˜woé[›†ñˆ1J÷8µg‚ŽšbæùÔ) NYä‘\0ë¹_—˜#““DÝ	t=Ò×9&\'©+Dìèmöv5[ÚÊUM¥Ì’äÍ›Õ—/å\'¥^…¦eÅÁ@ÏL‹ŽÍŒ‡B£â`Ñ1ñg¢cÎDÅœ‹Š=MŠO‰05>Ÿœ{ö÷3§?Ÿœ–IMKJïijVqRsN½ùx|üöðÅëýýÃg¡Ð ºµ¥¡ äÁå[U·J›Š*»J«ºËªÑåu¤‡µìš&Ik«ª£Ãˆvâ$“µ âo(å€ì³æØfxç÷|\n?ŽŽ¼\n¼r™_\ZUÏT¢-	c•G\\dgÈØ	b÷HO“§½ÑŠ8=„E{p{G³÷\"ÚœmFœ]S¸UÐt»¸¦ †ØÃ¼s±à24ë2ì\"ª[œ™›’½—“Ž…É©5™—º.åÂs²»/fã¯æ±ïßÓ4Uyzšú\0ÍnÐãƒÀØì]àæÙ¸Yvï4=É@‡HˆQ|Û¡ô q2¤Ã ¨û¸ö@O£¹©¢¿ôØûèÛ×«r.ÝNNÏKHÊILM>Šýß;†’¢bâNŸ>w.\Z—M‚ÀR’#[Ç&$DÇœÿíôoÿ9›”œ’ž™’‰jmÜ-ç§\\<µ²¶²²ºòxuiyåñdx¼³¡¡áv1¼¬š×‰R ±:4Ö„ÅÛñx7ïêÃÚ1([O—µ»Ë‰F¸1è*qAÀÙRH^˜u\'Ý{íÓÈà×±‘Ï£Coœ&ðh%;2ö\ZŸ¾Ì\"ÌQ!<ÂßQïl~èïŽ8ÐÛëíjóÀ;Üm-¶æfqUyû¥ëMW\néÝt«Ê3=±25µÛT‹½yíA~õñçÿïîå‚«°¬œ˜ø¼˜D	òbâæ\\Eç—7_¼V“–S‘’Ñœ™Õu)›|ë–üQ™¶ªÌoB´M3Œ¾0¹sŽ	 cçØ˜z÷¹3DèâÚ#—ßˆmã@ï„ÎQB×¶Ù‡l°¶”«\ZÊx‹0wóërón\'¥\\JLÉŠO=3r6<6zþB÷éqgcb#wÐ&&Æ\'%Ö‰0X,9\n¹wî·s¿ÿç\\rBrZRFfJª³–»H–qjmãÉúÆêêÆãÕµw“ÚS]Kkh3àH4ú—p&y¬Q%€ëu »Ím`vY»Ú­„½§Ääy>ë¹¾ÿ•ÝøÞçü44ðm,øudèÏþÚaÜ×Èž+›@eŒ¾irÏ(ºÍÓVïh®tu´ãÃ$ò \ZîG\"@ü•ô\\ÌUtâçÍ#›“O¶–ž½|úzëÉ1Ÿa*Í»w+»àÑÝ²<ôJt|Þ…Ø¤ëÑñE°lfE«¬’\\ô€r§°ïZíÞQI¡ºªÌÔXåAµ£Û‚}ÈZï£w–Þ3Ïéc£æX¨i:2Líž¤tácÄ8µsœ#µ\rã;üÈ\Z²ÖÞQ¥n(á—`nÝ®Ï¾œŸ”ž“\0Ë†¤¥]ˆ…žÞ{ú< súB|ä\n\'Àœ”Ùx+1=9!%).1þ\\ô™Ÿ9wú,1%-)+\'5ÙYÏ¾^(ÊÎ9µ±³±±½¾¾õdmsumceb|”ÑƒÔã°,ö”?/æL0)l¯³aëh³´µZÚ4M­òšzec›ª¹Eß‰‰ý¢WÃ¿ó{(øçtøÛÄÈ§`t/4â]9gCXbõN“‘ã½í¾Ž\Z{ãCgs}\rsØÃ8¬Ñ)/{@¿v×ÞÝ^|ê	Œ=~µyt²u¼÷äp,°R}¯þjB*èÍW ‰W.Ä\\”¤_BÝ(mFñ*›¸å„Ââ²‡%æ¶ªLk×3Ü×:Šïš bf˜¤y~žÑ»ÀB/±Æ1s¬@šÞ3Iêœ µ‡i «´[€Ò«`š}ÝÕxµª¾˜[z—p§ éâ¥ÂdXvã)iQ1ÉQ1	ç¢b~; _8‰MN¤\0²É	@àiÀU’b ¿ÿçìÙßÎ&Ä$¤%§¦ƒÊššÑobÞÌ—]Í;µ±»±¹³¾±½¶±õd}kuii^Ä kû0cÖ”€=Ô‡ò PCxü`_¯ÙcïìÐ7·é:»\rííºÖ.E}»´®YÞŸ²†~ó÷ÐàÏpèËhàã ûËøB-Ø3Ö¸„efï¡s‡ð#jMÅÞÎÆ1RÏ(©×ÆpŠ˜·ø‘ä‘Nü¦Þµ$3mX‡ž†?]ÚšZ_šÜSU÷ÓoÔ4¶•·µåW\nZÑ\ZÕÚGÓ·w›áhð™s º]]-ƒØNPÖ\'¨¨):hðè)HÜØI\"rž‰[ÿ<Ü»Ì&,€ÎIëšct‡qbë4¥gŠŒÅ5ñÍÀR†úÚ|ÝUNx¥¦¡˜ó €˜~õZarú•HÏLJÁ˜Àú÷sÎDÇžKˆKLŒƒÁÀ–Ÿšž˜‘MO¼÷û¢¢£¢S@\'ÊÊÎIÍÎJÍÂÀ[·ûoÝ9µýtsëéúæÎÚæöjDé+33a=‡â3|8Ô\0¾o”F¡Qm8¢\nÙ+lƒ³›;™­]¢NHŠúTc»¦\rbPŽìú>ë÷Pàg8ømtà½ÇôÆ¡=ÔðwDÔ56n‘Ò=k¡[]õ¶Ærn;¢ÕÐÚ,½_QR¥¯nÔ×4˜ëë~&H i¼1†pÂó’yN\nCOà(KÏ„¥é½ÆÎk{…&&™äiiŠÞ¦\"Ápžb`¦ÁÌÂF®mÒ0KÂ4½÷1Ÿ¸Ì!,sp,Ü,9!Ž\'¶N;&ñÈlÓ¶a\0Ý4€jòõÔ9à•ú¶2eåêÝ›=7®W¤e_ƒ@s¡©9±qéÑñ€xÔïçbÏÅÄÅ$B!0h<D”ä¸”dHjJBjz,>*öÂ¹(X<4%š›‘}9ãòÅŒlDc-óÎ]õ½¢SÛ»[;ÏÖ·w×·ž®mì¬mm­mn®ÍN‡¸4?	5ÊeøLyO/¦¶£æÚƒÒ¬ü«ôÜÄ¬{—îTçÝÂÝ-’T?Ô´ué”—î“ßümÔ÷Ghðó€íƒÇtb‘ªOÅ¤5vØ5ÝÛÿKµöÆrkãÃnÄ!61nx«¹½ÃÄN³ÎŽÄzzÉÓ:§“ÈR÷‡Åý#Ñ«‡£´=^tï ‰4FgÍ‹„óBö²˜\rb_˜	²|–…Ÿ¦cæAC’Ñ3Ç\'Í³zxÄeaàf¢gé˜Yzï4µ{ŠŸ¢uLR;\')#}Íƒ½\rtý@OC\0Uçêª6´”êë€ÌóI7ê³/ÝƒeÞ„¦äÅÅ_Žƒ$9{ö$&â\'¸ÔäX03S¡	ÀU\"&žMN¸\rjý%Xj^FZVJúÅ”lh´¾¬uÿ¦¤üÔÎ³íg[Ï6\0ôm@|{uskucs%ì¶ø™t‘\0/~X{ãNUÉ½E×K¯Â.ÝLÍ½•yõZJöõÄìûÉÙÈ«ùž>Ì+—úcÀümÈñcØóÙoÄ_e/”œaÕ·DEÍ`;Æ»kZ+]Í5Ö†\nª#ÌgO0é#Xd°¯o”Œ’h#xJÄe‹Blñ¸¨?¬4O*ÍA©nBãžÕ:–­ƒ“\"Å„PæòfÅâe¹lY*\\Q§™¸0\r5IFL’ÐS,ü,³o‰O]âg©]³,Ô\";ÇBOÓQÓ´ž)jw˜‚šbbÀïoù5BÁÌìâÛhÀº~\0ÝèCÕ¸•¶¶\nSc©º®˜_z{ûZ×µ[uYÙ…IÐ¢¤äô3g!ç ‰±0HLrb|d\'í”ÄŒ”Äàæ©	©0Häi+y™—S2³SS“Ó’€™CSÚ«‹ËoÞUT×žÚÙÝxKÄ^\"Ä×76VÖ6?^œ–bz*nÞ­»Yb™gÂÛ~ÏÂíìüÂœüŠ{Í¹÷JÎ­©×®Æ§Ü‰K5÷t¾vi?ûÍ?Œ¸¾xÍÆ·Fé¡Š·+ ®10iÈyB×¶eQ;Ø^ímzèm¯éEŽÓÉ“4ò‰0ÃfÍ²83Lö<O8ÁàÎðÅÓBù‚R7£4¯˜Ýóû³àô†ËÿDoZËD¼E1–ÇœaáÇIˆlóh_|3ÂRät´ù\'Ræ\"§oY€è§#Ø0£ÄÎI2˜“Èq\"H‡]S´®)\n2º	Â·¢+˜:OW•·§ÆÕYéB<²µ=2¶”É«Jøï	+ïÞìÌ½X—‘v)ò/Xb|zRl*4>¤”$HZdrÆCA4Œ<ƒêyD,\r––\nËÊ„]ÌLÍ¨.K¥µµ\0âÛO#ßÚyÖæö“\'kK‹3ããC-eÍyjqlmkõhØ=w/ûNÇÃŽÒ‚&\Z]U|å~aú•›q°‚øä0“ôÚ,ÿæ·FönJ÷š>9ôo\r²Ã~Þž„¾ÉÂ­2Ð‹$ø¾3Œj\ZGÖŽu5Í!dë8±kŠÍ˜ãrfèŒYw-˜cKæùÊe±jI\"_’(—¤Š‰hQ*~¬<–‰æ…ÜY}šASÐcøž tðÊlû$dø¢€².c­ËYë\nîºŒ¹*¦<á—äy6fŠ†\Z\'\"ÇðÝ¡>Là“$Ä,=Ã@OÓº\'ã„–aàã˜/²ÚÛ]ãì¨pu<rvTÚ;Ëuµ¥šÆRec‰àá=rÁÖK9Wbb€º¡q©I‘mÈÒ’âÓ ‘ý›ý”_%(+ò…¡XHâ™)Ù7.åßº}óbNñÝÛ©±I]=]§ÀØÒÞŒ¨àŽøÉúÆòüü´F!¬¹w_Pb%òVÜã»3ÛsÎpkYó½ô+wS¯Ü†eç\'eÞ†f&¦T¦f>ÓI?9µß}ÖŸƒÖïnãW‡î³­ÿ½Iq(çí‰Û¬ˆ±<&u-’ºI]Äž™¾ŽYlû,®k×9ÇÀ/òØ‹<Þ\"“³Àä>æÊØÂe¡ì±H²\"­H$‹Ö3ÏbÌ0Ha2f’Ü3Nê\ZÅ#AþÅÁC¸®0»À!­J8ë\nÁ¶Z´­æm«…›\nÞºœ±ÌÇƒÖ3Ï@K™¦DD=Ú×>Iì\0¬g™ø9fŽÞ=EEŒÛG°\rC0<AŠwvV¸à\\ð*[g•©£LUW$|tŸYr³3ïÒÍ¸Dh41>%˜xBFÄÄ!©Iñ)0°€‡@Ò’€Å_€$Æ%%%¤æ¤gÝÈÉ»œv±¤àv:$ùQeÉ©ˆ´·Ö7·žlDpƒH¾<37i5išêªq(ŒN\"ÓaˆÕöm[h=°àÕÜÏ{p’^˜”Ùxç!¥¢ZVW3@À~p¾l9úmxMß†ÏVÕ{­òHÆ{Î§î°¬¾UJÏ2¹HB>¦÷.“{“zç	DÔ6iMè(WÅâE.•/YáI–¹ÂÇBÙŠDº,,ó…‹À¸ÙÌisšA™f¦X¸6qš_‘pVäÜu¹hCÆÛèçîèÄÏt‘»¶ûÙ›\nú†,r:e‰Û·ÄDÏ1±3Àë#Æ‚˜¦tÏ1Ðlü<˜±€8¹yß8ŠmÆ6\"AçtÁËÝ¥D…·ó¡³«ÚÔñH]_\"¯)f—æ#®^)„&%Ç&$Å§&ÇGXƒ™™žÈ\ZŸ”Ž‡Æƒ¹\nËJ¹x1%+3v5÷òåìôâûwNÐë+ÿŸ}¯Ìû´*…Á ô{GüîA‘lInÚöÍìŒ,Ì›‡´x.½¦UÙÙë§r†Üé™VþÕo~ò‡Ïü‡Çúãñ/få;•ìHÌÞãÒw9ÔMaƒNxLê^Æ#Whè\'Â\Zƒ²BE¯Pz×Y¤MwS\"ÜR)·Ôº\r¹ò‰HºÂ­‹•OÄò5™zM®Z‰ƒ%>–\n—¬)M!ÚTK¶”¢tG\'ÛÕ+võ’=“üÀ(Û7(žk¥[Jöš˜².a,óð9„E&nŽ‰™!#¦(ˆi|‘]dõÎ3±³4ô4©mß>Ò[7Ô4^ïíªruTzàÕ.x…»«ÊÙ]kh¯V5–ÊëŠyÅùè›yÅ0XjtbRlr¨šÀPÞœX9,2\'ã’bc’R“.×°¬XF*4%-9=\ršrëÎíSO\0èõ%°6Ö¯­-­¬ÎOM…––¦—f¦@FôÙ$²1¦hŠ-	sed–GõQYÃTÖW>„§ŒSY¯†oÖï^óÀÇ½¦>Û7—ñ«EóV%?0ì=!s›ß¤ã×é˜e|ç\nµJë[gâ×™¸5qE^çP¶Åì§rñsƒ~WoÚQë¶ê\'@ã\"éºL¹®Po¨µàÅ¦ª]©ÚìWmjÕ»:Õs£æ¹¶ÿ™NñÌ¤Ø7k^Ú4Õ¡Ys —ïªD»Z |Æº˜ñX@XP–ÙDÀwŠÜ=CAÍ2‘Ë¼>Í#_×b ¦A\\Áw\0WÄ6PMnø#wG…QéF<ò jœˆÍÕM‘Ü’Ï¿^‘’’\ZIâ)Ð¸¤ˆ±üŠä)‰Ù	XB|24!-).¢î¼+E™°ÌtXV:,–”š’”þ‘ú¦öS`N‚µúdiuuaeeîñãù•åÙå¥™Å…px\"èµ›åH”²£ÇØ…¶¢ðƒ®C\Z¥rBDJˆD%’xÜ÷Ë÷{d— ?›ö?‡½ßÝ¦Ozå¥àH&Úq÷„œ§\\Æ&°AÃ®º–pÈ%rÏ:›¸Î$Ü›Æ›úTÈz*àîÊ¤»ªþ}‹ý¹Ù´k0ïh\r;zÃ–Z³k4í\Z{ÛS½~G­zª‘=×*öõÊ}½ìÀ¨Ú3Ê¦c»îÈ9iüÂØÿL-|ªn+XRú†”õDD\rh…G^â‚ÆY`c@]dc9½³tÄ©#Llb@vVÞèAT;ÛK½ð\n¼Ö×]oGÖ\ZÛi›Êõ÷%îï^¯ÉLÏŽMH†$%Ä&Ã3}¿†&¤\'Æ%\'BR€ðaq)ñqÐ‚Âº$HVZj^NnQrbZbBò•«·û°ÌSCƒƒ~ÿ€Ï7àñ¸=>·Ûç‰ì<éq:]v«Ó¬ÕðxªÏÒr÷âÇéÜq:{‚Ê˜$“Æ	 æÑ7ÒO@Ô ßK°þ1àùsÐó‡ÏñÉ¬y­ËøûBÆ3>c—CÛfÖ©èÇXÄB_÷2	¹ÆÀm0ˆk4ü¼É¤msi;BÞ½+âí©ÕÏ5šƒnßdx¦×ì¨û÷¦çÝsƒö¹VýLXË_#7©¼0Ëlê‡ö•Cdî?ÐúCðè„;rö¶‚½.¥®(kBÆu\rp’–y¤%6v™…Yfc—¸X`5S¤ž)bç(º!Ø×<„iöuE4&§¯«ÆÛUcFÔèÚ*µMeŠúRYU¥ðZûåìÜÈS\"…•‰ ®$d€ô\Z?>“pzíZqblZzöÝ$;-ñ\"øÛ‹¯õ¢(§Œ&›É`7]&“ÛbqÚ¬N§Íí´¹Ü6·×éòØí.#È¤±YÃê‹9I%ðDâ41ÏåïëÕ_Îo>Ëw¿-Ýïøp|w¾ØïÔ²#ë@Ä{Æc\0ï°©Û\\Æ\nz‡\\îëˆ889°Å.ÏÜæÑŸ\nè»BÎ¾„¿\'ïJxûý²çý’½bO+Ö/:Ðöï«{ý²=•üÈ¨<Ô+_\ZG%`ýÚazã4™ô\'6ã±E{hîß7Hwû¹›\"ò¶ˆ¶)f®Ék\"Ê!m]Ì\\å“—Ùø%¸Ê2»o‘Õ7Ëì™\"ÃÇú\ZFz›‡zjýˆ‡®ÎˆÆý€xw­¹³ZÓö°¿¡\\^_Â.) ÝA^É»¹í\Z	… Ù\'fBãAL„%\0iGÌ=	”þ„$>-î49-ÏR¤&^Ž‹‚$&g5U·žr{¼`yÜ~×çóø^Ÿßëxƒ¾À`À?â÷ù…¼Ar_Ö$ã&h qà\'I}lÆ¡`]!iÕ~\rØ¿8~øm?|ö¿†Æ]ß]†/Vý{üD.x!á\0ïp#*Þæ36X„5\Zn†]g¶¸”m}›EÝáÐwÁç@Èx.díK…{2þ‹~é¡Zv ÈJñs){_Æ?\n÷¥â…ôP§zeÕ¿oªÓüÖexk·¼qÚßÚ¯-\0ºîØ¦{a”=sUÊX‘6$¬5 p!í‰ˆþDL[RWx¤e~‰Ù†çBd¢öL“»ÇúšGz›QÕÞ®JO{…^íGÖùPx•ºõ‘¦¥RXYÄ­¼G½yýêmH\"469’™—ÅÇ¤\0‡Iü_ÇÁ€½@b çNGG‹^½Y‰Ë¼\0j*$åRÊåSƒCƒÿw\r‡À\nŒ„†Am€Lðõuã1!~†I[pî\r©t§_~âÐ´~÷›ÿðYÿqÿpüð˜¿Úôt¢×*Á‰lò6—ºÉ¡nñ¨[lÊ&‹²Í&lóH›ÌÞ\rn‡CÝæŸûÞswO\"x)¾”KŽ’cµüH«8ÒI_*„2Î©ø…LðR!9RËNŒê76Ók»éCÀùÞa=6›NÌ¦WFã±M}dÖ¾0*A\\yªàoH9[rÎ†„¾Â\'\0cYæW#žNYbá¨6z‰¦¢Â”® ¶e¤·%€¬ó´—¹ZJ¼ðš ÷žzwO“®ý‘¦9\"sqm1¹¤ çÖ{‰‘Í³`€8\'qÉñqéqñ ôÃ`±)Éq0H|rbLòoÿ‰:÷[ôùß£bÎA/œ‰;:&>.’pNŒƒÃð( <<\Z\nÁqx,8<ž\'º)7Ä¢Ì\n8K\"Þ±pM\"ÝŠ¶’m¥äµÇð5`û°ÿô[þ\nØÿ;ìü+`ùáÐ~1i>h%\'2úºÃ%9orH<òŸ¸?åSŸ	©»Ò—Ìä¹˜¹üGÊ~©i¥ÇZÅ‰Zy¬ÄÅ\'\Zé‰VòJ\';VIò2þKïD%yeèc3¾sÛßyœoö‹ù½ÇûÚf>±E|ü¥Y·§–<WK6¥ì\r	gM±”\'Bú*°*¢.óI‹lâ«w™Ó7KEÍ{¦©è	Bçh_ó@W§½ÄÑZêGV\rt×xux½¡«®¿ù‘´þ´ñ!£¼°/ÿF–|>6¢ã“ã€ÀÒ\"Æ^\'ÅÇ&â¿ÿûÜoÿ:Ž`þ÷¹ógb¢£ I)§Fƒ#£##‘cphttxlt0ŽÁ‘±Pp,429:6ë—¢y)Y&X“	×EüˆÀÅüm…h§_òÎgþâ1ü°ÿé·ý=àøgØõ‡×üÃ©ûlV¾×I^)¸/$ô§â6Ÿ²Î%=á6¸ø§bæŒ»/¢È9{b€›q e½Tò^H¹/ä<@ö•AõÆ ycP¿Ö)_kû_iäoõÊWúþ×zå±FòJ#ygQ¿µhÞÙïú·ÀÄíf ùc‹îØjxe1Z4‡fÝH*É–„».b­Šèk‘[é ´\0oYó“KXbE6çŸcôÎÐÐ‘rDê\nõ5£êÝÕÞÎrOYò¸Þ`„?’×—*\ZK%ue¬òbþõš”´ôó1¸$Py3 ±)À[ ±°Èé­èÄø°’Îþvá_ÿ÷÷ÿÏ™ÿüë÷ßÿ}úÜ™8hUuí©ÑÑ\0z44\n\rÿZÁÿe=>629\r…MÚu|]+YS‰7”Òu±`S&Ü”	¶û¥Ïôª>ÓŸéç€õ¯€ã/?;ˆäÆïNÍ‹ìƒQöZ%>T\0w&ïÉ›|Ê¦¼%¤íŠ˜{þK%ÿ¥œs¨ä©DÇýœcô•Nt¬‘Eø\ZµoôÊ·&õ{“æ½QûÞ¬{gR½Ñõ¿€V½7õ¿1ÊÞYtï]–÷nË;‡éÛòÚª{ï¶ÿïä<¶_Tâ\ZÙŽ\\üDÈX—0×¥€8\r¬Ç<òŠ\0\'/‚ZÄ%EJ=Cí™ +oÄUÞ®²\0¦ÎÛ]åCÕ¹»êÍÕŠ¦Res¹¤¶”UZ@,¸Ùz97;\n’KˆMûß¤ÜM›‰N†Ä&GŸ‰þŸÿóÛ¿ÿç·ßþu:öôÙ¨3ÑPØ%­Áx*\Z\r\r‡ÆFÆÆFÇCÃ€õX¼™Ü#S¡‘i³~Ë¨|fÕì\Z”;*X›J1ðŠ÷Ìê÷ãW¯ä“¿í¬±ûLßœê/Vù{£üD)z¥åÈÙ;bêV„8eKHß1ö¤ü}g_Ê>¾¡WžèDïÀ¤µ™ÞYMoÍú÷Nã»å“ÓñÉaûh3}t˜?z¬Ö6ËGÀ×ªyo¿`¯?º\0qó¯õ}ä…á­Ótb5š4/ôê}­b·_¸-å®é {ÜñU! NÄ.n™Oœg÷ÍÐ{§i¨0­g‚Ø1ŒjÆâê(÷õTûP5ž®Z{{©í‘¦õ‘¢±LT[Ì(»G*¼Ú‘›—yTG4–9Qž&d(÷ÀÓ£ã¢¡qÑÉÑçcþõ~;ó¯31g.dÂR™,ÚøøØÒâÒ)\0:4ŒCA ë±ÐðDh¬©ñÐäxpjthÖ¬Ù6*÷A\0°ŒºçF5@¿«ÅZ~`7YÐïü+èû{Äó÷€ó/Ÿí·ö»C÷ÅªøhS½3\0+Çx&cm€·×Ø¤-ó©ˆ³-bíJ¸{`üšu€éGë“ßó-xï´~ø?8ìŸÝîÏNû§í¨T.Ëg¯P~o×}ö;>y=\\Î÷VË{X\0n—õƒÛöÚf<1ëO@N×ª^hTÏU Ðƒ6Ah‘Ð×EÔP>AçÁ]ä—ù„Voä\\.9N‚OàAFlB69ZJ]Užž:¼ÊÜV­k,5´×IkKDµò‰…7Ú.g_‹ƒÄGÅ]\'Dƒ™™(iÇÇ@b/ÄÇ^HŠ‹IŠŽûíÿþûü¢’.Ä_†¥vu#††–—OMŽ‡~Á\rMN„Â£à~œšÍüZs“Á9‹î¹Ípä±;-‡VÝE{`Õí[4{fÍ¡ÛöiÀñmÀñsØõçû\'(ú.ãnÃw‡ö«K÷É¬|g”½ÒJŽ5¢{WLÙ•p6¸”\'Lâ&—ö„IYeVèä\'læ¶TøÊˆ{?¾¿}\Zý:0ø-0ðÉíýâõ€õÙëøð}ö¸>{ŸÝ¶/>×{§ó£ÇóÁãüà±½wÚ>z]€ûk«áØ¬>2i÷5ÒgJ~ä^fç	¿& ¯©`~®\n\" —y„%Näªð–yvæ×Å\n\0}Õ0„jt¶>´wT;»jðjgw­©tÎE]©´¦„U’O)¸ÈÍ¾“9‰IŽ˜	ðîh(ˆ €Ç»ŽNŠ˜pö·³Ñ§ÏÇÿzJå£Š2—Ë17;sj:<1žœ\nO…ÇÂá±™phfrlv°ŸÍOMÌØÌÏ¬Úc—õÄiyi7¼p^:\rGNÃK‡áuÀþÙoùê7ÿrüôÚú,?=–?<ÆŸý7‡ö“^öÑÔÿÎÆìPÉ=s÷äÜ-\r¬\rqA\\&b–ˆ¨yf‚[çñM–·Nç¯÷“7ð#8ö}pðƒÓ÷Îîüê÷oÃð·àgŸç“?ðÉíùè÷þŽ~\nx¾ÜŸ<¶Ï^÷{Ÿ÷ÓvbÕŸXô‡¦þ=oSDÖ/ÙQðžðëBÒš˜²\nŽBêª¶Â\'-¨\\ü2¸ÀéÞ2Më\Z\'v±ÍCØvOW£µ£Ö¨²tTÙà•Æ–šHç¬.’VóÊïÒ‹òyÙ ‰Ógãb`â`lGAè¸°˜¨ÄØèÄØ‰qçbÏÿv.æÌù¸³Qù·o¹]®¥……S³S“3SãÓáñé©ñ™©±™©ÐÜ`šŸ\Z›Ÿ-MMÙO-ºC‡ñÐayé0¿°OÜ–·ñÐi|ëµ~pþ1d®òÏ°ç¯Ï_ s‚æé2|s\Z¾˜ÔÊ·zÙq¿ð¥‚¿/cî+¸ûræ®„ñLÄÜåÓ7(ØÇDôB_Ï¢=ŒF®ŠÄÏAŸÔkÞX,œžÏnßgÿð—¡/ƒ#_ƒßƒ£„&þÿèñ½s:>ø¼ßGFÿ™žý<øè÷}øèu¿µéA\\94juÊ_\Z?•òw”‚ˆÌ…ä\r	9R‚„dÀ}EIåâ-œ¾È\rŸÀÇÉˆqBÇ(¾ÃßÝèìª²uuWZ:jôÍ•š†2m}©¦®Tüð” «—¦ÂÒÏž=ñî_¬c.\0èÀm’\"ßªøõøÔ¨È…ÿ³ÑgÎfe¤Œúù¹¹SÓ“!0!#k|tz\"8ÜsÓ\0÷ÄÂôøÒôÄŒ×±ePíÛM êui‡q\0Ÿ1¿å~À\rþ×°û¿#ž†<ºþp\Z¾Zµß]‘ôÑ(o«x/û…GýüWjá¡’ÿBÆ™ú@ÊÙaá6èøE<jª»c°±~Ÿ¥RvåŠý~å‰AÿÆdþètÿ{çðƒAúy8ø-þsbúÇØØŸSŒ…þœžýä÷}òø¿öy¿¼olÀRtÇÝ¡¡Oò¸ø™R°ÛÏÛ‘ƒTXS×ÄŒ5Ä•È“)$`,ÀÓ\"ßŽq’Ž\n‘;‚¸Ä]È*`,öÎG6x©õ‘®¡BU_¬¬+=, Ý½Ú}õrezjntlìïQ åè¤èó€rBô…ÄÈŠJˆ‰ŠÎÙRû\\Lôïg¢OŸÍÉÈ´9-K§8tŠ€AåÒÈBK)š5ý›i|È¿.ÎŒ-ÏNÌûVõÚ=›LÎví‰Ëô:r¢ÎòÊgýª¦ËöÃkåþ¿¡Á¿¼‘Œø‡ÛøÕnübÓ2ª>èdÔ¢“~>-Çý JKOú…‡Rö	ÈéÜç\\ê´DBÍö´ÖÕ[ïÝîîYKŸÊÏÒ—jõ±ÖðÖrˆ/âì¡Éoc“ß\'¦ÿÏ	}ü~¿·;@÷ùèõ¼u®o~mÓ¿²è\rªjÉžJ¼«<Uò¶åìMsCê>}MiC ¡?H îÇBÒ—0Çê‰|—ß9ÜÛäëªö\"\"cÓÙ]ei«²4?T5”ÈkïIkïsK)wo¢¯]®ÏH»Ÿð;h“ñóÐñ(06# Çxð\"*&1òåÛsÑ§£²ÓÒJÅãåSÕE…u÷+îæ—ß»ƒ¨«£cÐB­_,°ëÔcïBxli\"¸lPï9Œ/æc—ñÄÙ@éØa}p|ñÚ¾9Mzÿ\Z\0èxÿöê4sÚ¾Ù¬Ÿººþ·\nñI¿øD)9Qˆ•Ò#	÷HÆ?–‹¥Ü=6m‹F{ŒÇÌv5ÖV™óï¸šžqå3¥â¹\\¾/W*\':í«ã“gàûèä_3K_CcßÆ¦?L|\Z~|?øèõEnpXAée1‚– í?ÐJŸ«±žÊØ[\nÖ–œ»)c¯	hëbúº„µ&e‚˜¸Äî®²È#-pð³,TˆÚ{›@(t´×¸\"c³ÞÜZij(VVßSV?UðË\néwnão]kËÉ.M‚fž9ýÛ™˜(À7$–ˆƒŸ‡ÆôQ	‘SW ¨øÄ3çbOG%ÅÄ·=0ií§æß(Ï¿\\t5\'ÿböý¼‹Õ…wPõõ\\<VÁa(D\"·Í93\Zœ3ªŸY ™»\"9ì¤ä±~\Zró8~\\û\"+8ðÏhðOŸó»ÓøÃãúá¶~2™>èõoUª7\ZÅë~Ù+…øP*ØgÓ¤\0·à¥”ûŒIß¡QW‰„™Î–¡ú:ã­|ë£ÊUt[®ØQ*ž*ÛbÁs©ð¥JùÊd}gs}ö¾‡?\rN=þž}ë\r¼²:?o]ö7.÷»åÈ¨y¡Sjû\rê}¬]…x[ÂÞ’€ÈÜ²6%ŒÈDwCÊ\0ŒÐåHï\'/òp3ll%uc[ÝÝõnDQéè¬4·—éšŠÕu÷•µÄU%œ’û´ÂÛäüüÎ¼+ÕiÉ·¢/¤þ~:;6z\r‰=yðGLTBfBRõ•ÜähXÊùèäóç Q±w`™­÷+NUÜ¾ZrãÊ½¼ìÛ™)7ÒRîd¥•æ^i/.fâpÃ^Ÿßá˜øgLú§6Ó‹_gý#[«éØmþ<èþcÐûwDÝƒÿùg,øwpäï!ÿw;h@Ž/Vó{ƒî½IÿJ£<î—GÔ­¼‰öœ—RÁAäJ…à)—½A!¬à±3ðÖ¡ÚJõþÖ¶u‰jW¡|®ê¦/;RÑ®LüR«;1›_;ï½Þ¾á©/Áñ/ƒ‘Í‡^;ì¯Ý€¸óP¯;ÒkŸh•/µòçJá®B¸%åoK9[Rö–„·)á¬‰€ž».¥¯ËÙ«‘+D”e!m–‰žbö†¨ÝÃ ÷µz5NøCøøC[çCSkyÝym‘øÑ}^YµðéÎ-Ôµ+\rYi%ÐÄ±±\r9iÍ—.>¼˜q/=¥ #½$;«åz.õÁõÚk×.&§ß„Ä¥œJŽŠÊIH~K?•Ÿ›}ûRz~NÊµtX64éb\"ôJRòÝôŒê‚\"›F;b5º%’	jÇ¢“óØ¬ym1ž˜Œ ´|tüô{ÿ\nþ74üÏøè?c£†þükÐÿÍi}§Ó½Ñh_éÔ‡ýò±hOÈßñ·¹œ5c‹ËÛäqÖ˜Œ\Zc™DœÅâÆ:Z•åÆ’’9\ng·_{ Ö¼èWí«\0wÅ^¿rW*ÚSÈ\ràãåxmw¿sùß¹Ý\\ïý¯Ž7>ÏÇaÿ‰ÍôR§<Òi#ÝG«~¡–=ëî*EO \nÖ%ü|\'\0\0S‰IDATì\rgKÎ^Ó6$Ü5	g=²Ý\'cUÊYæ“”YVß$7BA`Û†p¾îj{G\r^oë¬´vTZÚ*Õµ÷U5Ä÷8n1‹#×%°7ó:.]¬ÍHy\0ƒ¶\\Îê½•KÈ¿B+¼Æ*¾Ã-»Å«Èç–Þ+¸x­ôRvE:4-êBJT,ø(”$@OÝ»šsëRæÌ”‹Ph*$.5ò$„„ËI°ª¢Ò>·ô!« ØK¡ïÕ{í±V÷Úlzms<³Þ{]?|Þ¿B¡¿&&þ™œù{büŸ±ð?cã?>ÙÌ¯4ý/€<E¢>ƒÍ^cÒ—¨”©^Ì1ï\ZA÷áˆ!<u‹C¡¼MÍž–öYcC¨Ø×hT€þP­z©Ö<W©öTÊ™xO)Â?4\Zß8<¯lÀC\\¯lÖ×ç1P€Ívþv3`}\0†¼F¹¯ÄnÁS9#Â—¿!è¿º> Îz\"¦­Iék2Æ\"—8ËÅÓ°Ô¾!\"ÒjÄµúõ¶¶‡Vx\r^mlyhl¯T7–™‹óJ™÷ïP\n\0ñ«ÝW.5çdW§§´]ÉÄÜÉ%Ü½Â,¼Á+¾ÁÄKnÒ\no]É-„ß¹Ñu-óRtÌ¥˜ø±	ÅÑ	§\nórnæ¤_IƒeBSâ!)q±é		—Ó²p-õ¤‚|æBfž\rÛ·eR˜Œ‡€¸ÅðÆf}j1Û¬ ò}ú\Zý96õÏüÚßs«?GÇ?;¯Ôª}±pFY¦Qç)Ô21ˆBYj¥÷H‹ÊÍµ­Châx9D  û|pÔ\n»Ì”lrdOEÒ…ò¥Ru¤Rµö+^jTZí³~åS¹ìy¿r_œZl–m>²Ð–«åÄf94ENÒ¾Ð)÷´ò=µlW)Þé—îÈ;]s\"”Å¼51s]Ê^“³ŸH+âÈ=A#%ˆ6ÍÁM2ña6>€‡û±í|‡Uom/3¶V˜Úš[k4\r%ºæ\nYM¿¬ˆs?Ÿ~ï&©àFïÍkÝ×/uäæ4ggtæf÷ÝÎ%ÜÉÅ)¾Á-½Å-»ÙrírÁ‡„û×yIÐ[±{qÐòSÀÁ¯¥gå¦¤f$Fž]ž–Ÿ”xûR¦¸‘‹NÉÃ¤å¨ÚáFížÙtl¶¼¶ZÞZÌ/Í¶-­öÈj~k³¿w¹>¸¼_†&¾ŒN~pûÊgá*•4ƒÅ„z±p„¡®YYR¦-¯5Ö´ú˜I<=Œ$L\"±Áî®áôžþ˜)Þ`K·Ø²gé™ü°_u¬V¿ìW½ì]F{¨Ó¿Ôž«µÛ2ÙS…l_£;\0Ÿ\0‹õÄí?²YŽÌ–#›õ\0ŒJÿy¿tW¸äi¿p3r-ø	kEÌ\\±Ÿˆ\0eægCÉ_•2K˜ËbÚc1gYÀ§Ü„	a€€ìmÀ¶âöî*]s¹¾¥ÜØüP×p_×T&«(â—ÞaæÓïß%Ý½¹y­çÚåŽ+yyÈ9øü<ÒKŒ¢«ìÒ|nùm^ùòk·/Ý`_£Þ¿Þx9³0ZzRz6îÔÝÜ¬ÛÙÙ90ØEXjVrR4!+z7ëRûÅ«ÉYh&2)“y¯ü±F¾g6Ùl\'6ók»íÄdz¦Ñn(ä»Jå9±Øàs­}*/3è}8o{§®º^XP¢,®t´w\rbh!ºp\0Mž$2Çº	£¨¾aTo˜Â\\`\nW™¢M–x‹ÅßåIö$òçRÙ¾Tº/ï‘ü¥ÆøBc8Ô^èõOåò…ô™Z½§Ó½´Ø^Z,/M†Í¼–­ò¹:r±\r”Ì% Î_sW`62#7º‰˜«bÎ*Ð¸”|YÂœáRŒE>e†Gs!Zï0±Çl±ÔWYÚkÌð:uS…¦±ØØ\\©o.S7”JJîò²ŠnQ\n¯ãïäao_F^¿„¼–Û}%uó2øÒ<záUöƒ›ÀÇÅ7‹ó‹«.]ä”Ü¡?¸…½{­$VP|r*?\'½àrNnZú¬ŒK©i““2òa©­Ð´fHj{|j\'$’_² ”?5êŽœÖWàƒl6Õ*ÉºT1Ç®Š$[ýªg*í®R³)–,2hc½Xks‹¤ôãz¾° ÈX×6DaŒsd!–lŠ§Ó!yGÇ18âU¾b•)|Bã‚µÁb?•h·%À^€9èöUª¥æ@pkÁ:Ðéž«uO•òg\ZuäÆF0-Íæ&Ã¡Y¿÷Ë¾#— d¼-)ˆ%@ÝÂU!k‘…[äP~í¥Ê\\â3–…Ì	ç±˜¾$å,‰93lúº d„¹äqVßíï…{ºÛìðZkgES¹¦©TÛX¦m®PVß<¸Ã+¸Ãzðÿ“ôÞOm­yº¯ÞÞÛ‡mãœ±IÊ9gÊÊ9çœ’È0ÑäŒ1¶wèžÎ===ÝÓ3Ý·Î™sïª[ç‡ûÜ—¾UoQ/ŠR}ô¬çû<hIï$aÍh˜	\rÄ\rèz-¢ìÍx¸ñá*2ÄD[ñÄ3¬‹F21~:ÒN†	«Ÿ\0\'_ª<ƒxü¸þÁCÈ“Çˆ§O¡O™Wß½K¾}_zë¡¸ò¡´òžìÆC]\rv)š8î.ßßóSO4éŸ÷–~(æ?f’G™ÔN,±MnÇ’;áØº?¸`±v(K\"i„ÁNqxÝ’Ö)‹÷U0=Ê¬&»ÖS]±Ü¢?¾ä¯zã»±ôN0¶Œoão\"™]_ð]ºxMÅ3Ç¹ÒI¶ð©Øý±XþRîýdÞÛõ¥Üõ)ŸiýS©ü¥·çK_ß—ráKWî»rîSgöc>qœŠ¿†bƒˆo/äÚö™vBŽˆ}ÇoÛô[·NßPëÝK¶ãþ­ˆ;âßŠù6CÎ%ŸuÞ­ŸqhÇumÏõ²Áa·œWjá”$Pîó\"fŠK	ÓHa\ZÖGE;p3\ZbFÃµˆ:ªÞˆ¬¹Eƒª\Z÷‘&ÈÀ°jêè0T”…3Ñ^ÊNA¨‘Sâ—¯Ÿ©¹÷ êÖ]àã°GàOÕ<x}ø€qû!¯ò®àÚá·w…•$·ž™mGåâç®ò=]?uuþØU\0Ä?gã‰¹ôa*³‹Íyü“6÷˜Ñ:¤·\r]Ï-î‡![¤VâÅ•x×Vap#Û·‘íYŽæ‰ÕHv+”2_ÄWB‰ulv£©×‘ÄXÉÌa¦p”+f‹o³Å£|áûîî/]]ßJŸ\nÙ…Ü§rþSWç§20™<Àý!›9IÇÃxàm\"´LÃoÛò˜7î u3èØŽ¸öþ×ÉÐn*°÷mEýÛqßFÄ¹âs.ûlÓíK»vÊ,Ó·õwˆ»ä	§ bå…ÌŸç’Â\\˜EùÏ†E˜Qõ\ZD­\ZQ­GAˆZ#¦N…¨µýÃÇý4”“ŒF!HmXdœÄ}4˜“\nµR‘MÑ®Ü9óûÝ¬¾¿\ZtÖûw€À‘wroÜg]»Óðí†«w¯ÞåW>ðÐ¸o\n¹Åü÷Ýå»J_@\Zé]<ö©˜þPH¥S[‘ø<€ŽMb“ÞÈJ¼°Ëï$rë±ÜR´°šè\\I”çÂ…¥dy=×»Uè[ˆågýÉ•Hv=–]‰¤€êWü±_x#’Ü\nG\0ôýxúm¾s?~ÎïÅû™Ün,þ¡T&Œûsgî¤˜Ð?—\n)PPßgG‰À\r\"à›¨k/ìÜö[7¼–uŸu#èÜ{v¢î×éèV,°tm„=ëaÿz,°ñâ+Û¼Û\\å…¡eD#ëQˆJ~NÄÊI\ZSM ø\"lÐïq>\ZÎ‚…[1(²Nª×¢ šÓÍ3#®V®µ >2ÚOFÉáP•g%#\"L´Ÿ\nóRán*ÜNEt jY•÷Î<¾yçÉíÓuz7¹[wÞ¸ƒ¼q‡ùí]æ•›`±®Þb_½Í¹zOxûÉJ8|œOW*|Ná\\üsÔñÈÇbîCgú “^G&¾W‘è|,“€øV¢°‘*ÜKáôZªô*œÛìÜíÛìì[Ë÷,¥K¡Ä´Ã¿\ZM-…“K¡ø¼;°\ZNl%Rë¡ØV0²Ì®EckáøJ0²\ZŽ­†£k‘ÈÛ\\þÈ‹ÅüI&þ±Tø\0@.u’K‚pró¾ƒŽÜ8÷BöÍÓÿšVÜ¦µÓ7èûw¢¾íhp#\n\\‹úWB®hð•ß½´Ï¹Íó3ÈãS¦öQ¼§]Tn$Œ4žh D\Z)&9ÀUfÁ!ÌX¸SkÀ@\rhˆ^§EÔêQuf,ÔI‚ºIHÉ\'ÐÑêÂll”ŽñP .ÔNÛˆÎÍ»gžTÞyTyÿþõÛ÷oÜ¾{ýÆýk7ñ×oÓ®Þ¦\\¾E¹|“våãÊ-úÕ;œoï¦Å-‡ùÄI*ûåôR´øÇ|ü}&ö¡œ?È\'vÓ‰9_hÂ˜D¢	 v0\'—\"Ùµx€^‹çVÅåHn+SÞ-ìöŽl÷l\"é½|y/[\\Iägü±Íd~Þçnu¼ö­x\\«È+tÖéž÷y_úSÿb8´™Lv3éÃdø$ŸùØ™ùPH¿O‡ÞŸ^(:Jß‚Löîì›>ó²S³è4®øík!ÛZÐµêsmFƒÛ©èrÈ³õ,…¼Ó^Ç”Û6ã¶Ìy€ÆõùJØÓ.N7qrF„CŒ4ý’—ŒsSñV<ÊŠG\Z1P¦ÎŒê†±©€=Ó\"a&,ÒMDºˆ€;‡a·¢æTã4„wQëíd„Œ–ÔÖœ©º~íöÕkwNï½\n67ž^¿E>©7À¢^ºA©¸I½|,Æ•Û\Z8f+{›H§nÐžã\'…ÌÛBf#_‰Çfƒ¡!§k*\\N$—£ñåHz>’äçÂ™Õxñe05ŒãÞÉöîõŒítlú7}Û¹®Ý|÷V2·žHoÆk‘(?›Ñøj0¼àvo³‡ý¾I»kÈb²˜‡löÙPp%žÚJeßd2ïò™“\\êC˜xâ8}\\ôI½#ÎÝkÙ©]tëçìÚWýJÀ´r-ºíkßF<4¾òÍûœ/]\0}Âj˜q_Ú5Cjé€ZÚÕÆï³s|f¬‘d“<d¼§-x8XzÄ‚éÐµ i€Æá5Dñnœ_[KÃÐ‚4\\˜8f©—\nòwë¨™‚>S_Yyëò·7.]«¼|z›úw(W*‰€xÅuÊ¥ëÔ\nÀýù2Pý†ÊGÓï~:ZÜq6v”\'xr3˜E…‰@hÊš„×©Y_t+Qœ\r§g@,‰f7/\\±¥Pr-”x\rg»JC¯½+±Ä^gßj²pî6²“H¤Rþð~\"½“ˆÍÙ¬Ë.ï+—gÊa²Ù¦\\Î>ƒ¶×lrzÀÉ4n&âo2Éã¨E)ðxÞ\'CïþÓ›Äü»AÛ–ïôsƒ–Ý–i«rÁezå·­…=Óý¼×ºò.ø\\AïbÈ6sAÿK›yÊ¢~aìèmô+%â†L3#ÉcD©~6ÙKÁø™h\'gÄ‚Ó   œPujX½\Z~\ZWô§q¥ÖM‚Ûp$†*Da\"tl”‰2^\nÂCE8I±ÎA®·SPgê¯Wž¾ýöâÕ+—®Þº|\r}ó.éò\rbÅMbÅ\râ¥ëäŠ›äŠ´+•ô+·XWoÛHÌ­Dè 9JGÞ$B;éØr<ú2\\‡¦¡åPl5–XG—B‘íDáU$5íOÌ{f³ËÁÜz µN¿/ö|îý”ï;J^ÇRGùž7éÂQ:úÖˆXê0–:FÞDc[À»}Á€wÕãž²˜G4†1½fÔ¤0i»\rº!›mÔå^M$^§ï2éã,˜œÉãLò0ê>\0}\'ØO€Æ×|ÖE§fÒ¢šõ¹^º­KaÏbÐ½\Zñƒ¯‹aïK‡y9tzëŒß7a6¾0ªG5òa¥¸[!ÌŠ\ZRMŒ0‡`A\0w“1^\ZÖN è0(¡CÃuHˆ†Êúz\0LQ¢Ö€zê$@[a0&K¦BÕFˆ(¤\"|T”—Šôa\"ÔA€ÚÈð3._½rþòåóW¾­8}‰û6¡â	à¾X	 S.§^ºI»|›yå6çÚ¯ëM*|Žì%\"©èB<<îqÍ†«‰øf\"¹‹íÆ¯cÉ·©Ü~<·ËîE2‡±üA8w-œ¤»¾/þTøçÞ±KýŸ³ÝŸ2 ut}Èæ¢©“Lá},qÆ»¡È¦Ç»áv¬ÛíËûœÕ:¡ï˜¶ÆLš~C{Ù¬ë1›‡­ÎWáð^:\0 gÀ_\0&î;Ê„ÀÃÛ‰:WƒöÕ€cÂ¬žòXçÎW~À\r¼{ÁïYyæž9ŸkÞç˜óÚ\'í¦çFý°J> uµ5gÅ¼hÝËÀØ4;å$à$¤„2áOýÚ€„éõ°jôÔUôðz-¼Z¯¶êØPìA­‡‹0‘ÀRühˆ\n÷Q ‹:ˆ@ÜB€œ¹[q©â›Š‹ç.]>WqíÂ·¸ë7q\0÷\0½’|ñõb%0tZÅuúå»ô+7Wn&‚DàM*\"íR<4\r\r;ó¡àV\"¾—L½‰ÇßÄSS…ïòÝße»>åº>§KŸSÅò}ßgû¿ÏüÔ5òóžÑŸ—Ç,Íå¡/Å¾ÏÙâ—|÷ç|÷‡Lî]*}¿Fw½¾M{Ãå\\²˜g´ÚY£vR¯W·heMÇ Õ4ô=wû–¢áÝDôèÔ^2Ç™ðÛdø ~“Šj³´/yL“õ¤Û0p½ò;–£¡åS;§]öÅDhÖï˜v§ÖajØ¨èhéiÅÜŒ¨)ÖD²:pp´Zhö(#ä˜Q¯‚Õ´Ãªuˆ:èœÈ:žÐ\Z=²®¾\Z!ƒ×iÐ¥!äSâA:ÜE‚ÙqµNPðõgª®\\¹øõÅsgÏ]øúüÕsWPW+±×ñ+I¯S+®bJörù6åÊMÒµ›J~5âÝƒ˜œGF<ž~—c6à]Æö“¹÷Éìa$þ!‘ý.Qú’éù©Ð÷c¾ï‡ÜÀù2½_rC_òCÇ±ÎCæÈŸ~ãŒxb{¶ð®Éu`ó8oœ7áø®Ó»ãñíº=VÇ²Á°¨7.MS\Zí”F5ÞÑÚß*ìS·5mVós·g!ØÍdßfAG=æG©ða2´ŸŒl†Ý«AÇ¢Ë<í´½°ê¦½öy\0=è~òøBÐ5tMz¬3ÇŒË<¦UŒè”C*YIÆÏñØñ&F€K÷ÒI.ÊIÁÙH	c&¡€Ÿè‘p=¢F\0Ð\nbBCtðZ q5¼šõð	¢eÃ×‡è°(¦#ñ0¦#œDˆ\rWç Ô[põg0·n\\þæÒùÓk/|{þüJ%\n¯¸N¨¨¤\\¼I<Å}“|å¥òõaU¬VJ@»¬ÛIPü‹±À¯§d6½ô€NÞ$ö\\m³k×ì:p‡Þû“ï]±Ì§d×{_ú­;þÖŸkÏÝ0ú6•mYe~¥0/vZÔ³Õ´D=-×¼”)§¤ŠIië¸¨ý¹Hþ\\ «†²ž¦æ^¯³Ÿb7Æy\ráæ¦Q‡õ…Ó²‘Œo\'c\'…ìq.z’M¾ËÆÁŒm~9è\\ö»g\\ÖQ“ê…C?çñNƒÌã¶g=îa‹eÒf3iÇmº!]Ç VVhågD\rqp•è¢Ü²™ˆ²’Pf<dp\r8¢V…¨Ó ª(ˆuß„¬VÔ=†=~FxôÌI¨S*,HAøIð(ÐÛ‰5N|½“\0L©æëÁÍê«§Ÿýyáì7•W‘•7Q¯a/žB\'^®$lþàq¤ŽGIH„\ZFFÅY+QÿFÜ?ò¿ð:»¦»m9YµzV´Î%µeQiYÔØ6ŒÞ×®è®%°­soëý[–à¶-¸að®\ZƒóöWj×t‡ùe‡í¥Æ9§÷Îš<“zû„Â8.×O\ZÝ/ŒN°ÆôÚ6E_«rÔtúŽ”@äk3ÆI·TcDQÊ*ÍK¿g3“ÞL%ß³ÇÀ[ïr©ýT|\'\\Šø€wÊƒÕ¸Ý4ësÏúœ3^÷BÀ9á´Ïøœ“nës}Ç‹rÄÐ1¤m/·Š³N\\Øl`ù94\'à¦àÄS›ñh¡EÀ”p¨Q£†×kN‡\'L‹D\Z0HP‚øO={P#®«ö‘ a*\n@÷’a*´ü\raÇU»ðpb@<=Óøø&ùîÍû—._üúüõóWàßÞDV\\2Ç^¿I~ü¤	“°*VÌ É9\'¥aäê¸Ç¾óÎGB/ƒþImÀ¤š´X\'ÚÍ/•–—Jë„ÂrºW9æ´Îy­sQç^Ð¸æUöEwNã˜3x\\ñ•Xn+”YñgN2ý?N/þ°µûya~/™^wx?®l~y}x²º¶ÿbh!~-Mm­¾\\íÎ¶+x–œ&r\ZJ|a¹µcÌeïvfß—SJ¹åÎÃ|f/Zñ{®mÒ¥=n1Îø³~÷«P`>èô¸\'\\öçNËˆ\\;¨mÐ¶[›Râ†0˜™š—NppVÞŠÃZ	H+	<D‹®í€Õ)QõJÄÑp-fÀÀ¹«àµØû÷«n=±bjƒTH„Ž\nÒà>,DÄQ~2Ì†¬ö,Tz†÷èúæµ{—/œ½páëŠ\'—®#€kß»ß¯àÑP“(x)ØÊ ·0	­‚„Š“1é)‹q%ê]Œ†_ú}\0úˆÙ8 Võµ¨ú¤ê>™zÌèœõ„7²Ý«ÎØzª¼UìåsÑ_±‡ß”†¿_ÝþõÑÉo?ÿb}ûc¦xÌüjóõ>þðë·o¿ŸŸÙï*üxôéWŸÿùûƒ÷ï—7úÊÏ©¥™ýÅ©—åq† ­‚FÉÜa¹rÎbÒjm†ùHl;—;î-~ê)Ÿt—òÐ×ã1·§Ý¶çVÝ¨Í\041åºvÍùÁÓ\04n}á°ÙÍcVÝ°©½_×Ú­§¤!>;Ä¡Y4gºÆ`­D¬Ñ£œ!:$¬ZÝŽ®Ó–A\ZñHÕZ÷ôÉì§O]øº0cb\"4x€‹°Ð vúÈufT­·‚\0¯:óøêÕÊ‹ ®€áy¸yå…+„\'OxXx3	%\"£Äœ”Ž‘1ÁÂ·²p2QBÁÊš|V÷T$¸ž/ÅcóñÔ¤Ï?h1÷j´-²½q®ÐûÓþ»v¾™úaeç_~üå¿ÿù¯×_Îüfûí¿ÿâwûýŸþöÛý·ï~üåÂ«†Fÿðá‡ÿùçÿñ‡_~¾»{01öãñO¿øôËÞ>YßZëíÒ“hF¾*¡vÛˆ¬ Žž§6HÛ-öWà¬2Çì–¥xt;—9ì.žtK…×¹äZ26ãr½òyÀ`|á0˜tC&Ã¤ÓòB§öØ_žNKû—iÐ¤1ë{õŠ¢ —¥DüHScEò3	fO(8;k!‚âƒ6¢FÂÛ¥Àê;µZ4Dƒ›‰iÆ\"Ø÷=¾ó¬^å!C@Äýx€†Šq&ÆI€8ðõ>Ü\0}¦ƒ?;s­âÊ•óW.~sñü7çÏŸ½pãòU¼¶‰€’b*FJ%Èèx	ƒØÂ$Ë™1\'¢à‘ß.ÇRk‰Ðz*±OL…¢ã.w¯ÑÐk´êì³éž_þôûß|÷‹ßŸ|÷ÛãïþúÛ?ýíwùë/þå[oþòå×ûÃü?ÿçÿþ¿ÿçÿþë/ÿÇ“?­¯þÇïÿúï¿ù·ß}úá§7o§žw?¿ûé»ÃÏï—Ö¦\"‘Æ;U689Io(²ýÒçbù²Å¾êð,ÚÝsn×´Ï»ïòoŠù“îâÛRi\'—X‰„\'ìÖWÀFN?ùÖÐ§m³hÆÍ†aMÇ¸Ý0å¶N:­=:õˆE?`ÔôëÚ²­¢„Hib‡¹Lä¦lD¼ƒN´’±f<ŒGPy@ÕT@ë;à0ªÇÂMàÉÀÃM`ƒG£n=¨¹óT|  c,l”…v €uª¡\"ìØg~*ÔK„¨ëéaUg®_¾òí¥ËW.\\¹x¾âÂ7ï^þ–«kÀ¢x$¸ˆ‚•ÐðR¡•Ejc¥4‚Œ‘ºV…ßKEsSAÿf6½’É-gó/ƒQ‡c”r§w6øtüó_|úçùÅï~÷Ã/ÿý÷ùÛÿãoÿú÷?}ÿÏýÕŸþöÇÿü_ÿïÿëý¿û—ÿü—/¿üqsçÏ@ô?ýá—~ú²÷î¹É¦	ú^Neûr¢v\'‚$3\n4^7£q„\'}ÙÞ±b²m¹<kNÏ¢Ã½/G#¯B¾×ù·…Üqwé ÝÉ&Vã‘µXx!à˜vš^Ø\r=šö1«ê¹Y3h\0|U£6ã€A5`T÷›´]šÖ’º=×*É\'ØÈ\n7PÝ4‚ƒŠuñfÎLÄëp¡FÃ@\"TB!ÀP#fÀ\"M8éZ¢úöcÜƒG6l0îä?œÄM€§ñéF\\ˆ·ckÂ,¤W£¨~dB_¾ríÒ5@üÈˆ__xXq…¨k  D¸€ŒÓ0¡œESÐBŒOÂšÚÔ~g,J¥Í–•dx#WXNe§Bñùp`.]„ÆÛu¯Wö?|÷›Ÿþí×?üî_óç¿þñïÿùçÿúË¯ÿò§_ýå/¿ÿûßþò_ÿÇü÷ÿøóýáÇ?ü´}x¼qüý»Ÿy}rør%F¸jÐîzb’ÈÉ‘X%\n§‹ÙÔÏNJÓ’¶EµyÃé\\sX6=žU—s+[K¤\"‘tâ°\\xßÝyPÈí¤ãë±\0* ÜOÙu/ìºaPlúçfíˆA; S\rhTeM[IßQÖ©²§·]IIE~.ËÍ¢º$™`%ÍD¬	‡±’ð:,R¬×áPj$´\niµºÖcvÆ†Çò×=¼ñXVWíÆ#$É!\nÆOFç˜$BìØº0bAU·Ö>± Ÿž¹~åòÕ‹W+Î]¸Ï½ðèÒõ&„OFŠÈX!-:ƒÀXÈ2\Z¡‹`Á!\\^%muÙ!OÄ •8í;…Âv¡°OL‡¢sñäZ&?©Ò(Ísù¡ïÞÿòËÉo~õãÿøë¿üþWþ¯ÿïßüð‡ßþâO¿ûå¿ýéwÿ·ßþýWŸ~ûýêÞ˜Ü<aõËŒ%† Df9°›9‚>&-n7ŠæÛTKjíŠÑ¼j·¯9›ßV |/leò‹‰ÄZ*ö¦yW.\0o&¢ëñàRÐ3çq€É9nV\rë•C&õ€VÞÓÞV–·wJE…ŽÖ\\‡\"×&Ï´	sm’ÄéM€¹ÝNÅ[H\'…à¤€ºX$È$JÈÝP\rL\\‹åk#c-d”•Œ6bˆ÷jo=2!êCT\\²˜àQ½D’ƒ/4“L”ñÓ!B\r}Ú^óÈ†®>sõÒ•Šs Œ_øæ«sçÏž{üme&¤€ˆ‚“±R\nd	Ø€FQ |-„CK¸<»Ñå±ú[y\"Ÿ@º’Šnçó[ùü\\4¾HlæÓ&G¯ ¥Ä—MûÒó…±/ï€Ãüúþù·?üáËÖñÏ?üò§“_ýôþ—?ìù0ÿzÑïojëgñgZT³¢–ižì9O:Þ(á4\r5ŠG„Ó\"Å¬D¹¢Òm˜ÍëVëªÝ¶í†Âo™·…Âf:·–Î®§’ûÅÜa±pOï¦“ë±è«€wÊeynÖ™4úö^½ª[%Ï‹e…††œˆ—k‘¤%â¤DR2Q˜Ï\r5²½Lª“NvPðvÎMÅêÐh-ÚZWÛ«Õœ¾ÜS\"!F<ÚNÆ€ßqQ±f\"R^Ww¿ò>ýÉ#o dšÉ1.túŸZàQÂ”\rSãb¼äúŽÚ‡u¨š3ç/ÿÿê>÷Õ…óg/ÖÝ¾ËÇÃyD´‚0 ‰(X	OƒÁñut\rWƒ$¢A‹Ic‘6·ØÚÌ£àz6½W*nd³ÛÅÝb×‚;0Ð¢\Z“«FÅíƒ¢öic`Rx®r½;^ˆ³–ô¼%7­pÏ´\Z\'*@sVØ¾ªÒ¯µëçÅm“Mâ—ÒŽ|ád£dªY>%”N‹Ú–TÆ5£iÃâØtz7]ž×¡ð~4vœÏï¥²ËÑèl0´¯§Ó»¹ô›\\f\'_¦lú1“ê¹ÅÐ¯U\ZÔÝ:M±£%ÑÜ”jæ—Úe™Y^Þ—7GEü¤¬!*à»YL“î\01œJ°q ¢hÑðÖúšVH	S£ @æ¤…€uRq,(GF,ŒrÿáƒO[êžèl3)\' iˆ0SS²Mxü™—Orñn<¤íÙC3ò™\rU}æü7¾ùú›o¾ú@¯øææñcÝL@ñÉ†\'Ÿ„jÄ¢9h$K¦¸†ˆÃ×´Ú™î)1‰õdÂ3±0ÐøëRç^±¸ÝÙ½ä©\r³ZóB»iYg_ÕZ·Œ®%¡j¶±õKúœÓ:/Ð,‹4ëíÆMµm×èÛ1zwMî\r•eY¦žmn™“(g²Y¡|†/[hU-ë-«jýºÙ¶nwm:<;nï~ ô&y—Îds[Éä| ô*^…¶²©½lj-\Z^ðû&­ÆQ³\nÄðA}GŸVÑ­V¦eÂ”Lœ•;Ûe9…,Þ\"KøQqcTÈ\n4\'“l¡€i‰6p&J…‚µCkhèëÑç¤’¢ƒŒEh¿úöÃú÷­8X‚GéS2Mx/ži\"uË¨	.Þ„ª‰qQ	ÆŽxˆ;qµ& þõù³?ûúìÙsßœ=’\"\rRÅÅ!@Vi$¢ø$ˆ€„äPM8TÍ§s%¼vo°sdöhlö](óÂèŒÄû“±î˜Þþ\nŒÐ|f»TXï,/‡¢cíºe“cÛâ{c	¼s„ÞÛc\'ŽØÇ@æØ{o™¢GÆà±+vìI¾ó¤±}spOëÜl7.‰;„íÅ¼ eQ*ßÔ[Wµ@Ý¶\r¸}×åÜ÷ùÞF¢ïÉÃTæm2ý:›YOÄVã1Ê·ÒàÛ$*“.Ç‹nðt[²d•\\«<<DÂOw´4Š´Lpš%ÂP##B!äÒ\\T2È×F\"Ú€Åh±p\Z¡€#:(-\Z©‡£ÌX40n\'d#‘lDŒ‡á=~r¿òA´>ÀÄÄ¬¢„e$Ž(JÈÝRJªã%ÁR<b”ŽÐÖT©jŸx)ÕzØ“3ç¾>hü<ˆ†×n°µl,„ƒG4â‘D4Ÿ€jÄc›Á_\'àxìf‰P¥P¹ì¾¼Ù™µ:“n>íND»µ–a¯9[N&V;KóáØX»~Yg{m¼s§èOþÜ\'_æ“¯ð1P<öeÞ»SÇ®Ô±;ùÎ|ëÎ¼•ö-ám¥iSnXµ-K‹’¶eQË–J³­·­,›n÷†Û½éöìzƒûÁð~0tœÌ%R€ø^:¹™I®&›™üv:½™Š¯Dó^÷¸E?¤k/·‰s-Ò¢RRV*ÒrqJ&Ì*D‰VQL$ˆ‹y‘ÆF›°ƒZ€ÃøÇÝ–±€¸æ7´ì@ÃÕh„4 $ÜˆÇÙ¨x7…è\"“l\\ZwëôþSžn§åE´\0æQÊ2jIB‹Ò‘A:*Ë#È(Eõ}ºÆO(jœùú«s_ÿì< ~áëOoßmÀ@¹‡àâÑMx‡äb0M8\\‘ÄoÉDjy‹I©të\r>³=éðd=ár4ZVª]^g|\"\\J&gcÙ™Pl´U³¢¶½¶EÞy³ïOWæØø¦…#o<tž„JÇá®™á“ÔÐ¾+¶¥u¬µéWDŠ©b]®ÙV6Ô†-«sÍbßöF6½MOp7?ˆ&#É£Xæ]*÷&™ZD^Å¯\"	P×²Ùtr5žqÛGtš>U[AÌK	y…,£DÅÍ)¹(.kŽKcÂ¦¸¨ÑÇ¡{¹#ÕË¦Ûi$3	k$a5x¤‡R¢á*·…ÒcqZÊL ¸(TèQäUWUW#9O«‚t\\¾™V’²Ò\\r€‚î–³{äÌB35@ÃgÏ6üx{Ý7±ÎO„KŸÿæìÏÎƒ¯Ï]D<¾ß€qÑÈFŠG6á0À^88,@l¢Ò…<™T¢”ËõŠ—Zë×›¢&{Úé/úýyµÆmq%“žøt$<KÌGãC’öWJë–ÎõÖ{ç/º3öÄ+ý>˜ëÍ¸’‡þ<Àý!Ùÿ±<uéyíÉ®ª]+\nãZ»fC¡ßQ›wÌ®u“cÝîÛ\rßD¢{ÐëXb?’8Œec©£hò(yL.G³þÈB4¹”J/&Ó‹\0·×ÿÂféQ)Š-Ò$_knŠËø!a ä5Æ$‚¨˜“4Dø¬`3ÇÏã„ùl‹f§âL$œ„ë@£•„\nS£á:,ZƒFéqh	m§D¢ƒ@p’ðzÿðÙãÛxh^Èî”2\n\"f€‚J5S:8½-Ô4›à’ŠbJš…±¡kµˆ*îÆÂx÷nžùúì×gvj,—+®bkŸ2Ð4œErq.\r¸sØF¡™ÎñÛDb¥´ÅØÒnkW¹•º€Î”°¹\noV­óši›/ßé‹ÌF#óñøp»nR¦]î°ì™CŽÄ¾-þÚ;p§€k{3¯ñ7žôÛ`éM ómb`×—ß¶Æ7ôž…e]cÞÖÚw¬ÞMGhÃÜ	ÄßDSû¡Øa2ù6‘<ˆ§â©ÃXæ- žJíÄ’ÞàK·o>žöçÂáÙ`ô¥Ë;n¶hÕùSâ\r		/DÀóyáæÆˆ–6GàHCDÈ\rðY.ˆáD3­Ã¡Õ¸Waà ï€ýi¿G!\rX¼•J´Ÿ²&;ðd3/­­­y¥<~æJ²†R+ÕDò“ÝŠ¦¡6nYH‹1ÐBr„EÆˆ¨²ãê@*7#ë™·¯Ÿùæ«¯¿þ§o€›W~[I‚ÔR‘uLT=‡dâP<†‰Cpp8‰(dqEÍm\"‘VÔ¢—µZä®6•G¥èíY»+­Tùô–¤Ù“÷„Ê=ÞÈ˜/0ç‹Ó-ºukKçÝµ†÷lÑ}wbÏß2…wìñ-{hÛß´FvÝé\rkÜ4x·ŒÞm›ÛØÄ·ý‰ípb?‘—Î½Kg“Àµ“±°ïw©üQ&{Iï$Ó>ÿ¬/\0jç¸Ã³\0\Zo(òÂdí’wd›…i± (å§¤ü´\\”‹B|N\\â 7,ä‡š›¢ÍM>ÛÅ¥¹Yd¯\'\0Üh	ŠSÂaÿ(÷H=e\"íšƒDt“‰@àfžðà\ZBÖ¢1£,o(Q:>ÕLìh\Z”³sMÔL3©KBÎ7aÂd”ö4@Eø)pUÍSî½{€8ˆ†ç.|sîÞÍdx-\rYGEÂ˜h8‹d`0t,šMÀ5Q¨‚T¬’Šu²ƒ\\aomwÉ•Þ6µOcMh©Ü¦4Å¶ŒÍW…úz<Á‰@x\\mv¼”éZ+JÇšÚ½®qo[¢æÀ–%¼¢õ®hÝËj×šÎ»®u¯êÜ[ÖÀ†#¼åoù»±ôn$ù:‘=Ìu½Ïw¥2ï³¹·©Ô»tú0{—+€o²¹½Tz	]hÚœtûfƒ‘)‡}P©êmmÍ‰Äù6QFÖœmiNÈÀµƒM\\à\'!á©«ù¼ ïô®Ê6ÍÅ ‚N¯Å @èÖâ@8AÈ¡ªD!ÉxÃi%;©D\0Ê‘ÀÕ±k\"\\RW[CYÊNrHa¾WÉV7v·0óÍÔ²Œ]’Ò2<²µ 	ÖK€Šßå=zxæìW_óÕùŠsê> ÂêÈp…¤¡à4šŽÅÐ06žÀ§RM`)’³LnmQ8Z;œ->™Ò£4†˜Mšf‰U¡k,‹¿×›œJFzûî™@p\\kw¼*g$ÚÙVÓb»yAiYT\Z—”¶W¶¹6ã¼Ò¶¤u¼Ò9ÌÞ%ghÑÛŒæ6£Ù×Éì~º\0Öû|é0“9Îwžò‡éÌ»tê}*½	¥S)Pv’Ë¡ØŒÇ÷Âé~nsN8œãfs¿Z? R­™VIFÖ”‘2raDÈñ5°#bžÏ‰ùAIƒ‹MqƒIg˜ˆ=\'‡B}«qˆV(L¬W¢ÀðDˆð#3…à P]4ŠƒŒ3P\"8\n§·@ê;eÝmMbjOsXÍêh*\n©Ý-ìîV§ca-èú0çbhãÝ[âgN\'ç¹³ w^B?©\"@j)pŽÐéh4ƒ¥¢Q,‘O£‹›D\"™¶¥ÕÜÒîhUzZ•^¹Ê/Sù„-&š![º¨ÖœÖ»Êo¿ÅÝ3˜\'AñóøFÍ®1•uRm}©µÏ\Z¼ó÷ŒÚ:­v¾Ð¸G”¶­mÌä·^:B¾Ør8µ›.ïgŠù®wýÙÒa¡ó}¡óCgÏI¡ø>W8ÎŽ™ãlú0{›Ní¤R‹¡Ð¬Û\r¼eÒi·;F­ö•¦«]™m“§AÇ®ÝÜ””ñ|¶¯¹ÉX‹›Bž›Çö6ÐÜLŠ‰N0’Ñ:,‚¨v$R	‡·£€µëÀ UX, n£‘«8é$gÀ£Éµ(Ä˜M,É›À\rÄx#c@-ÕðÛ8=2V+»WFÏ7C„‡ˆH6ác¤ö”vó&íÞ]à*ç@¿¿Rqý¬Š\0­%A¡8‚ŠDQP(2\ZCC£Ù8‚Ál´É;\Zg»Îß®*tA¹:$ëðs›TPA(6ËTðtøErw³ØÌ ‰{œn0Ê^xBÏ¡aƒkÄä3û&,qƒgDãèRÚ“­ú‚Î>hñ™\0²øF$»›Ê¿íì=Èßuõ¿ï\ZxßÝ÷¡»çC¹ü±Ôs\\è<Î³ÙãLî¤X8Êfö3éõDj6žñ&Þa³qÈfíÖºuÚLKK\\,N‰›¼M\rA7,hˆÊšA±ô47¹l—ëå1lš‚·R°z\ZÔK@Y€€¥DaT(”\râ\nBMÄZèT;ƒì`2œt*h›Jƒ¤K Ðð\r9?+`¨²œ7¬\r)y½­Üþöæ~9§KBËòðn,Æ%¤q&TþôëÁÝê«7ÎœûÙ¹_¿vé\ZüéSl]\r‡Â(h$ýâXO³xr™Neé,-¡·%\r¶¤ÚšlÕEØMíU¢pÊU!Q›‹\'5qøj2½•ÈÑ‡ìáùxL³9tÆšñ…\']þ»¯_çÔzJJKAeëÑ¹õ®Wd%˜ÙKóÝÇ¥¾÷½\'åÏýC{>tƒÕû©«÷¤ØõpÏåN\n€xî(“y\r‚ÊéÍ\rýã.ÇˆÕ:lµÙ-=S¶½#)•Ä¤¢¸XàmøMž¦†¨„5yEÂ XàârÜ\r,“æ Gip0-	,E@´À m`èèvd½\n‹1Q©6ÅÉbºN‰S<4rGFsœLBYÁË‹¸Q69#b\rk£:ñP[ã@{ó@;¯WÎ)¨1&ÜEAfE4P;]D(÷Áõ†\'n^¸ræ›ŸÿúÆ·ßÂŸUajkð(	£\"Ñ’ŒÂPÑ6 æ6ÈÛL:KToOš\\«\'o\r”Ìnƒ§Ìèq›G$õpxF*[Cd´!¨-¾Ñòæh0²”ˆ/†bKáØ\"()ÑäKwxÊÐ9úõŽ>ƒwÔä™v„½‰Í\0È!…ÃtñCyðcgÏÇbß§îþÝ\'¥“îžO½ËÝË½J€{é}¹üæ4\Z¦VÂ‘	oÀjï3úÌÖn³-­PÇ¤­©VyXÈó°9 “x\Z¸ŽÆ—éå7øÅO#×Æ¤žj–F­ànÿG±lG@eÐú6\\é§Â ÀL˜t\'óTã&ÕÏeyØ6‹{ø4}*ð¦l3°Ú J8ª\r·K†;€7ö´4vK˜i>5HA¦øÔN1=ÁÆáÏX÷î`oß¹z?ûÕÙŸ½}íìi5¦¦à0…!)HGbH¢žXaV‚Zs@7»¶`=<äŠ$ŠÃä(Éôv<E†¤Èê°ªÄ\Zù¨M¯‡í‘ÕTb5‘Z\n\'–#ñõHz=šYfçÜ±1³ÿ¹+2ë¿\ne6bÅ×ñâQ¦ë8ßû¡0x’ë9É÷|êøÔ7ô¹oøcßàç¾]½{º?”\'¥®ÃB~;žzåÎx<.O¯ÕÑ­×—5êN­*ÞÑU´„¥¢ €oã²},OÓÉe»8Wc““Å>ÅÍ Ù)3z,xw+Ò€I¡ð6DZ§Bƒˆ‚ÑâñV:ýTÚ,éA6%Âg[hø3¼‚-¶	óâÆ“T’7©¥£J)°”Ao°½¡WÎ.Šé).9ÌÆ¥´N=DG¶>{ÐðäÁóW/]¸væëŸâ_Ý«¬DT=AÕÖá \"J„#uPEÃ9$ª°¡Y,ÓK;Ü\n•„µ9¦³å5®N•9K¥µ tŽG5ÂPTS5’GíH÷/ÿž|Ûß?Ong³«ñäJ,p¿ÎwR¥ÍXv-œ^\ngVâùdq?Óý®8ø¡4ø©<rRxŸë=ÊuŸt\rêù20úÝàð§®.\0ú¤«ë¸³ó¸³ü:•ZÓïs¹¬–‹uÀf,ëuÉŽÖt{›GÀ÷\nxn~³‡ß`as,,º‘Au5°Æº‹Í²Ó©&Àñp5Ú\n‡IàõmpˆöDˆ†kÐ0-m¢‘,†‹Åð²9#*â%%Í(‰Å&œ¢´)ÉcdÅìUó¨A2¢ä©Ãj`)ÀÊóBJ„ŽÊhE	9Í\':qPöÝ;”{÷®œ¿|å|% þõÙ¯Î=¼qþôº¦àh‡aHH,ðq.™*ÑP¢·ØD\n«¬Ã-i÷\nî&™“ÊÑÔCh`ÕB˜Uµ„ÇÏpŸ`o?ÄðlƒK¿Ö…\'lþî±Pr;ŸÙÉç6RÙHj7U<Èõ¼Ét¾Évî¥\n»™òfª´Ÿ)ä€W~èÿXN2rÔÙRùXþØ;òy`äcwÏQ¡ó]©ü®X~[(®ÆK¡ð”×5æó÷™Oý¤×bìÔèÃ-m!I³_$pó\ZmœF‹ÓA¡›Yl3‡åá5{8\\›îdÐŒd’pÛ‘PI]m©?]íð:ªöM¡Z}3ÈÞ¶M•5§hñ	›éL±†(È\ZA³OñJñ˜V2ªm×	Fµ ñþVnYÊL7RO»¨œU–Ñ’MDm}-íÎDåíoÁ¸¼ðíPñÏ~uþñ­Ûª*Tm=¶N€¡pp4! 0,Kf€ú#i1Ši›E¢p4·89‰Ý\"4>­ÁÕÖ1«ë¨Ãï=¬¿s·þÊMMìWzú‘áTy¦É-&\"û¥Âv¦°™Hì&Ìó{‰$HÜÛ‰8¸_ì=ìì;î\Z9é=.î9.\rè\Z9.ô~è\Z\0Ä?öŽ¾/l¥r+±ôA©k;“;}ƒ@”LÛÝÖkµe´º¼ÁäHüR©_(ð\nšl\r<»AÏ`š™›åâñ\"|¾—AcÐJ£èhà×2xm¬N­“Ö×Ia§ö4®E£m‚Agƒ¯á7fZ¥%eKIÓ®f5\"jpv®(á$é=íÍÃ:ñ½dÒ$~®Œ¨šNÞÂ(Šèq.¡ÜÂèiã–ÄŒ \r#«zÜŽ¨yXñíÕóW/WùêŸÎ~ýÕù\'wîÀŸ<ÅÔBqÿ N€#±p#cIM-‘´Ù%.Y»S¬p6IMt®M•AQœêz\nÕPõ{÷~ýÝû°»÷àõÈ‰*èJŒd{Kƒ«¥®‰çÐV.¿“M¯E‚ë¡Èv,¶=E¿Ÿ+¾ÎßºËï\0èÞ±ãî±=ÏßŽ\n¯ã…w¹®Tq?[<ììÙÊv;»vK=«ÉÔ¸Óý2è5™†\\Þ´RÑ¨\n…KÀwÎæf{S£‰Á6Ñ©z&MÇai,à\'.ÇJ!\ZÉTžÐCH õâzˆ¨®Nƒˆëê[‘ˆvD‰AZ)7‹r*ín\\\"(k}Å QÙ§S6Ù¨;£MÌŒU”7\rk¥¦Ö)kë„I2®á™ÙÛÆ+™ÙDËiýÊ†žV^†G±c‚\'U¼ªªoÏ}ûí…ë/VžùÙ?}ýÍ7ŸÞ»‡¨Y‚‡À‰0$ÄÁ1džJ¤pÈL6K\"UØ¥§¸E­vŽÐDb·c(­µð†z»Ê|ð\0v÷níÃ§XIØaˆ…2Ï«Ý£¥‘õîáÕÞPb5_Œ„^ù<‹þÀr8¶LCÆò6_:%Þ=pPêÛÏ÷žô=ÿØ?qX:Hw¯úã{ñüN*wP,¿.”72…­B÷vgïD :duô[=6gÙj‹´¶ù%-Q…2®huÄvn³‰ÍÕÒÉFUC!«)4+·ÑÃe™ÈT-«ÆâZ1&¬­×ÃÕÏšëëdPh+Ö††€†	ŒË\n6r¢RA·®}È®\Z6©‡­ú ‡®\'ë1ÈT3\'\'åõu\'m³NÍ, |\\{Ú6{ZÙy#Í#ö¶5õÊye3ÆÆ·×<‘ÔV=º|íÒùÊŠ7.]ºuJüÒùŠg÷ïÃ@:¬¯ÅCáD8\ZGáX\nšHÄIX\Z»¡\r°~\"l±ó%fO‹§ËDQU5õÑcÌÝ{õwïÖWU¨M:µ+îœ*\r¯u?ßíß)\r­•‡Öú‹£/ƒá~ßtÀ;¼\nG6â©ý<Pwé _Þ/õöí—{Fß™¼ØïØÉ”·’ÅeolÉÙLó£¸‘-¾Jæ³…ç¡ø‹H²Ûl-[l)µ6«ÑEÚ;|b©O,ñ4\r\\=“©¤ÔD’šLÑƒ@ÍæZ¨LµTÞ\\WïYucuR/ƒÂ[‘õíŒtK*ÕÅ¦z¹Ìt‡¤¨këÒwŒÚcvCQÉÄ±¨5ð—ÓÙÒ4 ’¾°tÌ»õsí”¹e$q5¯¿½¡,åd›©RNŸ¢©§¥!ßÌpÐâÇÁÉtíâµŠ•ouê*•×jñ§UØºZ,Ž‡\"	p	M$!ñš@lâ5«%­NPè…zN£–D¸õhA-¢ñö}Ø­Û5Uõ¶Ô-Îõ½x}ÊúÅë‰×ƒÏwú†×±t÷ÌõzÝý×„Ï=åNùc«ÀÄ³ù7¥òA¹ÿ¨§¯PÚ+ô¾î\ZÝ+Llwmg{güÉçvß{p)–YÅ—Ù…xn*ŸJä] ðŒJ—VrEZ¥	·¶yÄR3§ÑD§·b°­xR™ÜN\"™\07M\rA¶\"1b(”ó¨†û°®âV×4Cà2Py@§ÇŒ¼‹Aqq\Z=\r\rYrØa¶šrm-Ã&ÝˆÉèiL%ž“5õ)¤3å¼×ôÊkž±«\'Ò1uó°†t]ròÍ´ÞöÆþŽæ²¬!Â\"h`õ­õÐúÊ{—.^¿tþÖÅó7.\\¼}æì?½yõzõýÐªg¨Z‚ÀAQ8–„$\" œHf)xb­¼Ã*SXxbÝ†Ä6Õ àä6šÌc*	¥Lõ§ŸwïöMìõŒïôŒoN¾Ð_ì–†×{F·2®pÃ1âvOxƒ/‘ÕDz5™~ÛÕ»WìÛ+ì•¶‹ë};]#§÷¶êŸÜíz>Ÿêž\rgæƒ‰™Pl>–Ž¤æR…™hzÈétxss¼]Ôâ*mF«\rµÈMMz:SE¥·`ðrQŽÁµ“IZ2®GAÍ(§ºšýôóéSî³\ZQ=\\†D·¢Q\n4H&D“ziB.é1ëÆœæq»~Ä¢±èÇ¬º.U+I£TÕEy\r=\né¤ÕðÊo_ôÆ_Z”Ï\ròqµh@Åï’5äš™eyã@GS;?Ãg»ˆIÕ3øû—/Ü¨¸XYQqëâ….Tž¾êvïÚêû`«P50L=]cY‡Õ ÈT“§È´*£]éhëpñ“\Zòý§T,Ç 	¸sÑò\\ºw©kt«wâu@ì{t½âõèÔ›Ñ©ýžñ­>ðô¼Ì˜¬Ýû¨Û;áÍ…“«©ÒV®{3W^Kw®e:_¥Š3‰ÎÅüÀZyxg`j9ß7ŸíŸOÀÃé©pîe8ý\"’\ZtúÆ¼þ§¯dqÄTÚ¸RlU†ZÛìÂf“£%SåÀš,Ec„h4Pz++e¡¤×g¬§ÏØÏªÙ5ÏÄp n´\nK21ÅÉ¥ÆZ„Y•¬×¨ê¶˜Æmº	‡î…Í8bÕê˜$$ÙŒGd[„£Ví«c1äZôYgìúIƒ¤Ãµ¼(â–[\ZºZøÝ­ü’ŒbuPöÆýëo\\ºx³âÂ­‹oW\\¸]QqãÌé•o7ï<½ÿ\0ò¤\nVU¯ k0ð:¤\n‚FÒ™J¶@#i7ê.µÖÅ*!HÚÝGè\Z8[¤‰ÇŠ¯2ýk=£ë]ãÛý/öN‰ï\0Q—G6€ÒÇ^¾›9…Þ$?µ›vúËg¿Û7æNGâó±ü|¬sÏWR¯ù—áÜL$;ŸèœO÷,¥Ë3ÉÎ¹Ti.š™g_Æ€“„ÆáIlÐæ-[]Iµ>©T‡äín±Ì+–Y9-….ÇâÛðD)\n+F\"åDœ…n‚B\Zê ¬§UìªgÜ\'µÀI$hð:ÎÂ º9ì €›h‘•õš!«øõ`í´N8Œ/Ý¦	»¥[£n¤42>50G-ºWAïrÈ½èwÎ¹­/mêçZñ¨V4¨vÉ‹2Ä›|$bVÈI53Ýóþ“[7+.^¯¸xóbÀ}çâ…Û€_9_ñðÖg÷V?zR[U_ÿ\n}Š¨y×bÈÌV³Ž#4(:¬&“Ooô6ðÛê1\rdN›Ò	eÆ;VºG×{†×zFÖ\'v†¦ö\'v»ÆÖ»ÇÖ{žoM¿Ÿ=|>s0ø|»ÏŒön«»×îóEF}±çÁìl2?“Ì?f†CÉ_ì…/6L¿Œd§bÓÉò«lÏt²0ÎŽùÁ/\'F\\a§¯ßêé4šc\nUZ¥µ´ø¥2pêil\n\'A!„(¬†B‘4ž[SÃ®­e=­a?«i®‡€ ¨ÀâTœ…Fss8>>#Ñ\"(iÛ,¦¶~Ün™rÛ^ºLS.°1YŒVN3ò1Ü‰FTóa×bÈ·ö.ø¬Óvý“rL\'ÑH{[Ý œ´7wŠ¹<!)bE¸-öèêÍË*/_¼séÂé§\"^¼xëRÅÍnœùöÒ¥G·ï>½ÿøÙƒ\'µkê« ÕkjŸ\"ðd§ã6\Z$F¥÷k\r®Vk‰ESÃùî™òà«žÑÕ¾Ñõî¡¥®¡•¡‰í‘ÉÝá©î±Õž±õ¾±õ±©½±Ù7³#»CÏ·\'¦¶‚:[Þh+˜]wÉæËš<ƒžð°?š·ºò ž:<C®Ð˜/:àûã3éîùLÏD4=`÷M„S±L¿3lÕu*\rE9,i\rµ(¼\"©»Yd¢3:ðD-úÿj:ï§D¶}‹ÏÏ¯^½AÇˆ ¦gFÌŠ‚’S7MçnšŒbcD$çèÌ™sÏ¹çÝ{î­óÞÍ¼zU»¨\r–ü°Xûó]«‘É´““ÛŸeû`HŽÉV?|Ò|ü¼?þÅ43Ë¨Õe—j‰XQ†4Û =À†$áÌ’x‘#+M‰™º-{èªŸmþùGFÐô„B;úñF¿óËIä÷ÓÃßŽC;ô½ú©\n‹äI€S\ZÖÅm)\'XÆ»îú@}ªÝò)W{Þ•y½<00yÀéB¯yÐüM_{Ç P<\"–~\Zø8:8:5¹¬Ø´¯ì¡ZRkd1Ìa³ãÂ·×÷…‡—×hò—çôDö·dö—Ì¯‰ïéÂ?²å?såÅ³¿Ç2¿ÅÓË–þ,Ôÿ*7þ*Tÿ.üo±öïçhñŠ`îHú‘õ$}‡q.”ŸF}‡Q.üä?28.ø3þHŠ;,øOŠàú“J¸éý$Š’î;~\r¹nìHXoñƒ¬ªÙ\'VÔˆbE?5»úIº%_Û›ŸwÇeÖÙyçâ©\\r¯Ø·Ð¬‡ö6ÏŒ{·Cœ€S$T`0À\n`çšÏÝð»^ªæ#êwÅÏæi]ßUÈ½Ê™<çþqþýìè·“ð÷»—©ºáã(RÖ¢KÃú4¢Ï¢Æ$¢»3îœío\ZÆÆ{Z{¼^˜\0ßM‚wµñ…¼ÖN úñ;¡DØ7$–Œ¾•H†?Q\\¿¬q­ïb\Z-u``õFr^®•¯[¯oswÑâÃsññ¹£±ÊKò5žh<>×’™_3ù¿g\n¿Ç3?¢/õçÄ·Tú×\\éŸ…ÊŸ`%säÊÿ¬6þº\nžß ÌãON£ßaÂ”Dn	ÿéKxCY&”&Ã)2e‚O¤>+„Î^ß=B]š¬çf«oÇÜÕ³ÛZrkU­›æµ“ó[Ÿ¿¬Œ}Yùðiutl[6éR(ØõU€é fãh=¢Õì^š5÷N}·\'IŒÄ\\Ùd‰*ã¯>OÃÏ½ÙoaO#è<E¸¶–¶¶G‡Ÿ,ÚÆQèàî³ãG¾†Ÿix¨š×Ur;ó”Á,9ÌV@­yÊ”t\Znö5^ÅÂ§N‰ µ§/n&Â&XÄÀÚ¼fb@ï}Ó×Ñ+éˆÄ#ÃýCcÃ ©lÊ7ìË;Àà ìsòý1éRHº°aN~e¾¿¤^cñÊósîòkü9–ŽîÓ±X!™¬&SõøKõñ1ûø”‹½”3™o‰T=ûžLËæ~TªÿH¥\ZÇ„ïe£Üá#îN¸_Ø@ÖŠsÁgÊÅ<qÜ› <)Ê›¦ƒ¸ç™ò>`ì©º2C‘³w[Ïn`ë\ZÛÒšyA±=>¹òalõÃøÆÇ/æ9¹{k-¢ß;Ñïž\Z´Í·•_m÷%\n[˜-Cº²´+Ï`%–¬zèš,¦t7\\#à~\rrÍOjqtÉC3kêEéìÉŠ<ÏÒ?NŽ~=>üqè¯éF€®ûèª*Ò¶åK‘2ç	 =ô`Õm­Í‰Gº}m\0#­ Ÿˆ~Ú¼çÿº\'äñû€âÝ’žþa±d°oè½dT&•ËUÅ¼º‡oì’3óûÉxw÷Ð;á‡-Ïý=Uü#]ø-žª\'RÕ»§l*^ˆÇòñØS2ñ’=§_¢é§»—ÇûØÓC2MÇ¢¹øs.+Äbùl¦–NVÏC—¬:GÝ÷ìá¼ÇÙÈ0ÞŒ’;ÜÌÃ¹˜¾ur8{ë œä¥\r9ÒÛ‚ûFj}×®Ü°Ê—÷&f×¥SË£ÒMÙŒcI1ìÝÛ-@Ü;—ã±?cp‡ã˜3M£i\Zi~¦Í\rŒÙ¤v™£ª`yèº—B•_îoA®æc«,]ó0	]˜U\'eúíjÐûËqð{Èÿ-äŠ×LÍK”9g‰A@ó,RŽ2ëŠ\'`Ó^«•NtñÁÀ¶µöƒNÏlií¢ƒ±Éÿ96ßòúÞ;zºú„ýC}C££S3òÝ…UËâ¶seWnÚ$_ºÞ‰::zÄãjƒûkü;€øÃóëí}éé¡ððy¸K<ÞÄ.Ïî.Îîn..Ï®o.n/\"—gGWg‡§á‹«ã›³ÈÅyäò$tq\Z¼:=º\"zF¦ÄÇ0{Ç„#0q	Ó.6N]Ü¹•¼„©;qï ÏÍÎ~nA.,pDg÷¨÷¨µX©6Ì.mÏoMLC›êS‡í™ÄÒ,™uSi†N’XŠ!3•áØ<Gå9¼Ä…Ÿ»À9‹,Zä\\5¯Å¾ýHUØ°\rÀ[óq \Zº·õãÃ_N×3„½\n|û¾z_CLÃ‹5<d•#ÊnW™E«¬«HÂ%\nÊbÎ¨ÍÌ­l´‹ z€èÝô¸°Ü6ƒJWSôÖ¾Vžð¨£KÒ%”ôŠ‡?J§ÖdòÝéã’Rí¹ÀÝ6¨$Ê–îö6‘r—a‹ÎSrjvYñ3;zbÅOaâÜŒ;°#±G,bwE,H,+±ýÿÞîYÁ#®ð¶’L™ìbf<v2dÃŽ¬è“¹G½_!úØ„œØˆc31Àa­%d°ê ÷–X=@jÝÜòŽb{wÓBêlÏ–õº‹A®ì”\\)à+z½yŽ.ø™¼+ù½e¿\ZŒÇƒ’ÜD‘½ÆUöd]e)ã!\Z~ò`‹jø˜\nGåHdI¦$”òû}u¹ù/ßÜl#ÀÔ½ÈŽePî9¬Â7YbÑ<áL öíÁŒè}_ØÞÒÓ×ÛŒƒ­M›óÀž/„iá‰[’7}]ý]=ý\" ÷âøìöÔÒÁüº]µƒÍ¯[{ÅŸ›õ´ùBí 8)7	Š‹k´nÍAó¹Ö\ZÖÙ#fèØŸ[ÑSvn%®œÔµ¿‚ˆ+ð2Àø¹ƒ¼tà\'VìÄá<µÃ\'ôÜŽ‚±×\'™4™<Ç	x{ëf«ZKíÛ¨}È­³yµF­\'6È=×ê¶C±É7ô³+š‰eÕüÎŽ-dÄnu®k;ùŠÂiŠ,e¯§\Zð•CJÐW«?P¿àŠ~®àes–¥\\€à9\ZÉSHäh*PpÆ+nW#\0ä)…®¹q wÃOÃŠÍí¥í+µ2é«~ï+Ð\Zœ€\0]ó‘UVñ!5©±Dà…%òrg3«Ç¾ô4ñÝÇo$émãðÀÀliÆAA3·ô	ÚÚþxü¸³{hhLúE51·3³lšß€6 ¡±¥ÎÞOïÀùÿm;7B‰lèãb·HÚ!”\nEãBÉÌàèÒÄÂþô²~ZešR™fW,òUëÂªulT†ùUƒ|Å2§:XPå*\\aZRéåËû³‹;\"ñÇ©é\r¹J» Ø™Û˜›Y™›\\žŸTÉ\'—§–2…â‹rbxúSßØ@§¸ß	ÊÛP×ûé%Hm»Ø…¿\Zð{#~Ë‡÷(šbÜ9Î[	„ÊÁ@)ì/<Å ¯Ð4;“eˆ4ååä“fO¡ö<›A*n¬ê%»«?}\n´«rXÍƒÕÁá`0ÍºÞ,Ÿ¿V+S.GÍËÖ½xØàÛO¿úAl6§š¿ØâÁó,Cì¶Ù¥~_;_*à‹^?CRÄ=¨Ì—ð[›‚Y*\0Š;ºú{ECï\'¥2åäüö¬Ò¸°aû<­nï´‰ßµt´¼mq<WWç@Gç @ÐÃt·µßuˆ§ç6VÔhGuF§Á›v‹Éi2CF“Ãb´›ÍV“	2\Zl“Ãd²™Ù›£ÞþqXº®Ú°\ZÍf½É¨3[tzýž^»«Û×è¶6ÕË\nµr~mìÃÿmGËñZþ»…ÿ¶³£M\"›·/jOÖçÎë}äZGÜz`öÞE$i*Ãpy/“æ˜C§X2E/8ü‚B1Ô‘@¬1ÄœpYÁÊâPžBK^¤^2í*3h‘†.\Z~\nzisH?LßÔ7;kÒYæÈ:¨  ù‰z„B7°yÝN^ñà%Žˆhxï`¸s¨¨ÝËo–Nš=³•\'ný@n~«¤¥¥·…Dïÿ99ECÃ¦¥²50¬Ê8>«éîáuöˆdm¼Þ·¼ÎÖÖîÎÞ‘÷²¥)¥VµïØ¶±Z;£6 z2¾-]¥Œ6A(\'Ê (ƒ¸¨æ!N…	Ä‰9ÂéÄ]0ŽÀ¨B!ÿ4±$_vÚ]„8lÝ\n[-6«Ùn6Yz“~ß¨Û9Ð¬nIGÇÚZÚÚyÝí}ÝïF¤Û“ëîé­ÐâÁ‘Jw¢2@—¤½uBO(\'°Ç\\®ÂG¡îˆ¹ ˜Ëò£NcSnJáŽ,çIW‘¥€­°hÃK¾rô·\0@¹{sfÞÒ<j7\r»àµ©Å}ÀÝLÝOÕ}àX€1KT¬Èà\ZI‘Žs½aªo¤S\0ÐÑ	¨Âkº \\ØÔ½™ÄñÁ,ñy\"^KK«è?a>1Fo\n§\0\0\0\0IEND®B`‚','DSC02173.JPG','54222','2012-08-22 19:30:44','image/png',74),(9,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0%\0\0\01\0\0\0Ò»÷Ù\0\0OIDATxÚ-—wWZ[·ÆùwÜ÷¤ªt6@ì€5ö^#\n\nÒ{ïE°\0\"X°b711&&šSNNÊIrÓÎûÞûAîÎwŒõÇ{öo=óyÖ\\ÐÓÇ·÷–ŒÎúÒ’ô,\n‡^ŽƒÇB€d,†%Ba)pŸÿµRã1‰Px2•‚ÄüzƒˆOA “è$:•˜€Cß&\"Ð©(³­îÙ½ÿýüòßŸžÿýáôË@;›ó*»†RT•“•œ‰E¢ãÁ0‰…£	)Åié¥øÒL\"—U„Å$¥§¤QRÒŠ°)YHL*ùÿ›@b=!1Y‰X*á×^À‘ÙÉÉFïëûÇÿùëùßŸN¿¾{â³zJòòrÓ³²’qø”ìÌÄÔd*7×RD‘´¶ª»:,½=†žnm{‹®½YÞP+ª®V”0\nr[²³‹0I™HŠH€Äc˜äxL22!#‹EÄÃb€\"A“h21ûéñÞßŸžÿøøìà•åçåfdÓ2ÉéDlzqZ­´ÜÞÇ«${zÉ¡]uÛ¡ÞÓ\n·TüuwUÊ™æ2=´¶áŽ:]}e_~~-.ƒˆÂ câP` \rA`àèd$ƒ^†\"ãàXx¼U+øöáôÛŸÏ¾¼}ª,*$¤¦g$$g\'¥tÉNÿžQ~âÖ?õ˜O=æç>Ë3ñ‘[{Ï¦<4IŒ¢}½pWÃÊXóÜîá¶jé•²F!‰œFÆBa(‘„@Ž@.ÅÁb¡h¼†RðêÉ­Ïoüë¨«Â\'§RR{J(sBÖ‘CûÂïx??þaÑû.4úvÚõvÆõzÒ~êÑ?q«¹T÷ò»éM=GÉŠHû¼}íÜrJQrjz| FHÀK V€8Øe†$8ÜëÔŸ>8|õähÄfÌÏÈ,\'ælhøÇŒoCãŸ–|g«þÏKÞ¿<àùÑw³®7“Öß}¦ãú§#ÚGnÕ±]r çn©Ø!>MÝRÛHÊËIJKC%%B)¢‹‹GTXs ®0zKÃvte{tt°Û|¥Ò)`?òYÿOL]òŸ-yÏ–\'>/úþZð~¨³î?üÿ =†ÓqýÃaÅ]‹èº» a\Zºšz(”âô,*\rF\0FÐáâãC8Š†Â)9µL>lw‚ŽnZU²£Ù±W³#.O~\rOÿÏ|]	|[™<[\r|^ð~Yšø²äûr½:_û­¯|æ>ãÓQõ‡üÀ\"Z”ö[zZz‹‹È)ié¿Ž&	Pd*2>…Å €£‚LCaj¯T1™ÀùÛXš}zèX\rž­L}O[\r~¿­Nv°\Zø¶\Zø4?úaväí´ó€õ¥ÏôlL÷Ø­¹c“G”œaz;§”R™ž™‰D%Áñ@FÀDôTR*6\r¥ Q•åÕ]WAf³}Ùç~\r~\0ªðV§¾®L@â÷Õ©ÿÈ€ò~¹ßM9ÞLÚ^MXž{ŒOFu÷œªëÉ,Ÿ©m©k%Iè„dÅ@\0†Å$‘Ê²R2“ãÑ­-=2Õ0H(T¬Œ;ßGŸ–Ÿ—éûž9[šüšø™ý	ý@U?Î¿›rþ1iå³¼ôšŸŒê¸´w,ŠmÏÛßÁ/§\\IÃá`HL,… .ƒá—!ØÄô’’&\\BƒÉ\rÌmƒŒFÛf`ì}8ð±:À¾¯Í~]®Íþ;ºðŸõåŸk‹ß#s-L¼Ÿû#àzåJjy:nzèÒÝ³«nèDac„ÖÌ+!S±Ø8:–H¼€/K*Ú³Ó²Ë(ej½d°úwg¦>®MŸ…XèûÚü¯žý™ÿ¹¾ò?»;ÿÙÙþœ…ç?.ßLy^û]¯¼ŽÓ1Ëc·á¾S}lSÜÔ‹¶eCÝ®ÎZ9?•€Ž&B‰ÿ¸½Á$¦VQ\nÈ\ZÝ0È7³}saþctöÛÚâõåë+?7Ã?£Ë?ÖVÿÞÚúŸë?w÷¿¬o¾›Ÿô?óŽÝwYl†»6ý±S×¦ºm’ík[òˆ°wšÕji®hÎÎÆA‘	€D(è8ðhÜÅ¸ÒÊjq™Ö8\Zñ,lOú>F\0qK¿H[‘k?£áë?¶÷Î¶®Œî¼^\nß÷oŽE\r¦‰!Þ0îg1×ä‚ë: Ñˆ¯«y[2Î†¤o•wu²·_VDB\'&‚aXH<:\n~	JÌ-o¨i¶Ùì qïÌÚøÈ›EÀ¿…ïë‘¿·6¬Gll}ÛØùÙyœß¶ºüB™¶ã*¿¹›^^×_^Ë«¬Õ5·8:;üLzX8¸§ô\rmJú£BÆâ`»££¦\"5\rA`¡ñ@vP1`èÅ˜dlvweÓp}\rhi5œx2å{šþ°´x]ÿ	o¼[º3<¶*S±8ò†6am3»²ž[Û\"mê4´w»¯Ò<tÚhwç$“¶*ØRp×%Ì¨˜¹ÂïñÑê»r‰88*	‚HÃ’!ˆ„ËqÙ‰W(u¢Ô,ÐÆæZhÄ5£P¬h´vç‹@ðílè]hþEpúÀl‰HÄS¬þ@o‡Öéé¡…¸œY\'À ùº;¦Ùôe{•ÇZs÷Ô‚%€ì[á^õÓØä¼là.„Æ§€áYT&Ñ”™KÌÌ\nAG÷n8ôêª<J+¹ÆÞËÞÖêŸù<¯§&_ýw-ºm1g‰Ý³0Ð?ÞÝ5Ëìc±„Mmj‰¬²T[Aq·5®‰Ø»j>àâžr(\"¤Gô\0½‘K.ÈÅ$%&Œ¸AAãì`ÑXQ.tòðžÏí’´_µ÷2Gi´É>æ–Bö{Ðó~~æñ°qO<°Àèœcöz[[Lî„=@É.ÎKÎ &¦õóyù9žÎÆu!kOÎÚ–öEø=a~÷£I\\R˜‡NB]œ‹…ÇÂÑp4pQ$¡ùùE »\'wv¶£‹Fí,oH×Ö%®n°¶tœúÝŸ–¦Ÿ:u{‚ÞyzkˆÕ;ÒÐ–ëwG§´=am«­“>ÍêŸcu®‹úvåƒûÊÁiÿ†¶ÌiŸf4h*É%	ÉØX0ø\"	Acà	À8“Må“A\'îÞ½w\Z‘t²4BKuqmIbÆ“1ë§YÏ3›j_@_¦5­2Öü\r‰r[oÛ±\\so*Ä>cKÜC+¸¡á­ë‚Þ\rQïò`ë4½n¬­BV^T”ˆˆEÅÃÐ0Ÿ‘œVO!ƒ\0ØÁ­kn»uJ®ŸR÷R«µõÍŒŒ¼°¨$û|Æ>¿ïP§>ÐnÌ7õúkjÙžJxS/?6œ84Z> nSÄØ•ö…9m³½\rÁžjWK93\'‰xÿ ’1)9ÙÙ µèZ8¼º²´Tª–ÄòˆHzì°œÍù>Æ^šµÇrÁ-!ë¶„{O%y`1Ý·ÛOöÃŽÇ#öS¯ó¹oø±Ûxdhø×ƒ×d¬·#Ä¨ÒjÝí•¼\"\"úKŠÁ “ÓRI9Ä\"ÐüÜüÂÜüÒÂü²Ý•ojÔ¿ûG¾†&Î‚ã¯¬šc•è®‚wOÁ ?1iž;ÌÏÆS›éÕ˜óMÀûzÂûlÄzÏ¤<Ô‰ä5);:Ô¢×%uwT‹Ë3áh\0†\0£Á1ppl|<<^]Ž„—£áåÝ‰±#»éØf|ý>çÿtÿîÔk…÷õ’§få§þõ¨ã­gäwä­ÇõvbämÐóÊ7r:î¸gV™e¿xòÁMaï<£~º·ÞÕQ%¯,ÊF\'0\ZŽ»»tîRSchc=²\ro¯‡÷ƒÞSÿØSŸûpó-Î‚#ïÆ¬Íòô®Rt¬Uý19ñqzöãÌô§¹Ð§ÐÌŸ³Á·AßéˆíÄª¾£hûª¡-1s±¿u²§ÎÝvEUYDÆ$@c‘X$ø2\Z¶˜M ½Bâ¶šVçföCS§“c¿Oy?ÏNü\\œ:zþ±¾´éž›Õ\'\nÑ½ãšHüÂ=ú.0õyuýójäÃ\\èMÀó|ÔñÀ¦92Êu¢jþŽŒµÄnŸ¼Zçn)×TþÑË0HŒ¿cy¬•€#gà¤lv0Ã?úfÚ÷}qîï•Å/ÿ÷ðs³þ‘Vy,¯u¶npX­Oö·Ó3Î/½™¾~:l>±¨ïš”wŒ²[:Ñ¦Œ=ÿ‹Wëj)S—Ó2qW1¥ÉØêŒô<&‰‘R±)HdsI^\\öd|ä¥Ïó~zú¯Å•S‡c‹;´ÜÇ^ ³\"ì¡þ½ù™ÝþÄéxìt¾ðú^x=ÏFìlÆ;Fåm 2&Å¾V•Î0[=]5Ã-Ê’6)»—€xÔÜf|f	ÊJHÈ@£«‘	44î¶Ýv:ê:±YÍ–UžÐ×E_ª¢rã¦T{]i8TéOÌ¶‡N÷#pÜOF‡ÚMGzå¾Z¼¯Ý0(ö´’ˆdpŠÙæn¯²Ô•È(¹9™¬œq1¾¿(oˆL¬Cc@À—CRcáÕq¨Ð ç‘ÃrßiÞÐhÃ*Ã–Î±apî8<[&gTm\\W¨÷tÆ-•fW¯?vØî0£òP+Ý–íi¥;ZET!ZsÌ6[S¥º’<T@`çd°I\0Ð]P +!öâq Ä¥˜äKàâ‹ê˜ ˆz`Pou«*õ¦Ö´®µnj¬‡ö±CÇøM£õ†Þ°«R-Á!ND¥:²˜ï™47MBVTÁ_WIVdÂ¹¡þ±îF}m‰„š?˜‡ï\'f°ˆé½¹N1IFÅÈÙ è¹‹	çb\nÏƒ)¡ÙBnH.ÝRko©GZë±Öy¢wÝV˜o×²uo¡·Ïßsu¬¹©Q[\r@W[s–¥‚°Rº(æY½öÖZy9™_Lb‘²™„Œ><®:#SIÅË)xAa&ŽCŸ»LF ê‰Ùm”g?mN&	\rp—XÂM¾j‹¯ÙSÛöµŽ“àÂÛsÃ?¹<<ákt]Kré‰Û¾oÒ-‰¹s¢¡%™h†7àevjë+…”¢Áü\0ËÉêÈÄuáqê¢ŒŒçå¥ƒbÎ]DÇkòñm¥íeÅ²~VØ ŸŠ\"Ž±çûG_^¾ÿúüýç§¯>¾;‰îîNÌ\nÉU#µ-+lnD©8r9¶õê9áà=5Äö\r0,mÍò\n*¯8·/OÃg²óñ5©i2^]FR–) ¿]H„Âê\nˆ­Ô‚ê‚Fc\\\"ß0™Ã\Zã5ÏìÓÝ;×o=\nïokœóôÁñŠ†éúö\rÖà5…rC«;p\0+g†X>ÍÙÕnínU×U	¨…ì¼FNv_.‘•OlJÇé®hËsü/Þ¿þë_)HDM!¡®(·©ª‘\'2iUÎ­.,Sn\rÊŽd–Û\"Óm±qŸ£Üè`DÚ¯n²÷D’C­~ÏhØ1™Ve\"/³ÇÞÝnélÖ6Ö(ªÊ\ns$B‰À#vð}Cuµ®HZœÍÉùÅû\rŸ”P•ŸS]˜ß\\ßAgJD2‡B \r	¤»\0»#µ)‡o)œÛ4Î›C¡>Pë–5•&¬ÕÏ\rYÛš´Í\rÀ_U}%¿¤¨pŽD`æò‹ŠÚ	ÙŠ+Å–:Š£,§âYøTÐùÿ>GJK)ÍÍ¹RTØÚLï¤‰ºRæ€Ö,ÔÍ1yk}âÍAE„-r»Ý\r½õ®Õ~d¶ÜF7…*$’ŒÑé¦ÖFMC²±F|¥¬?ŸÔK\"0rs¸ä¢ÁÂüžÂBkC©§»ÚÑHQ—åt¦&‚.üëB.GÉ!U‘©=!“«/¯¡µt‰;hr¿L»$PÌr¤ýÂU±æÐâ:vßw8]@š—H\'¸<KW§²¡VÑP%©½Â¥ô’ð=9Va ŒJ+(–V—ŒtÖLôÔ:K¥9Ôx$èâoçsqé…xbµ¼“.ìå\ZÉÔ¶lRM#Ãb×¸·\r¦]½mSk=°ŒÜwúî»&z|÷\\®-­v’Ï·ÐhÒ¦FAU¥¤¦ŠWJ¡‘ðYYŒ\\\"¿Œª®¯n( ·×ã¨¯§ÆRO	Ø(èòùK$\\F!1·’r¥¹‹WZÃHË,IÍ w0Õ6×ÂºÑ´£3Ü´:î¸¼wÝCÛèmçè–ÙIlÌ>qC§²’S^Î¥R®æ[³2zHDay‰¥«EÞÒÌ/§ú™-SýMî¶\n{SY7>r‚\\Ž#á2ó²sK+ZÚØy¥]¥õ¬‘sØ¿5>µçÑ˜—”šk6×uçøu—ÓäŽ\Zìó\Z“›Ë×ÓèÜªš«…Å´Â¢ÆÌÌ†ŒŒž¼\\qÍãê8«—U^áïïYä3ü½®¶+š**‘pá<„‚\0“a:)§´®•ÝÙÃíakÞ5ÏÌžgæÚÔÂ-Ÿou\\ ›S›‚JCHeZ6‡Ôf¿HncHš[ÛI¹MxbmzfÏ¦›:[&‡úCBŽ¶½ÝÒÕUˆCƒ4/­ÑP[Þ’…¿tvþ„†\"qÉ™ÅåU=´~…{|aÌ»èñ-û–ü5ßÄŠSa*ÆørÏÌÇ“ûøRc\'WÓtµÒB\"±JKåõÕæÎ&/›>#X”ð¦ùeSãŒphUÎŸåÒ¬.Um*	ÀÎƒ‚PPd&¡$—Ú\'–×õqDvžØÊ›ù\"°\"³WÄêPtõiºXòš ¶QÕÑßÐ¡ëê\Zè÷ó\\VÛ7ÃëŸqÅÜf¯¡½uIÊ_ÎñúÜ´N*€ý³à 4\"!;¯…Í»ð[,*‰€#–´ÑÍý­}­í`UT4ÔV5µ5´5V5‘ÒIñ1ˆ‚²þfšÖ60MpÙÞ~šŸÕ3Íe†x¬E‡_ßèct-J¸¢Á\0§¯!§àŸJÂÏŸCž;ÿ?®Œ	iXß\0\0\0\0IEND®B`‚','DSC02173.JPG','5256','2012-08-22 19:30:44','image/png',74);
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `player` (
  `id` int(11) NOT NULL auto_increment,
  `invitationDate` datetime default NULL,
  `invitationEmail` varchar(255) default NULL,
  `invitationMessage` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `association_id` int(11) default NULL,
  `owner_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (13,NULL,NULL,NULL,'Andre Agassi',NULL,74),(14,NULL,NULL,NULL,'Pete Sampras',NULL,74),(15,NULL,NULL,NULL,'Diogo MagalhÂes',NULL,74),(16,NULL,NULL,NULL,'Bernardo',NULL,74),(17,NULL,NULL,NULL,'Pete Sampras',NULL,NULL),(18,NULL,NULL,NULL,'Pete Sampras',NULL,NULL);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `profile` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `city` varchar(45) default NULL,
  `country` varchar(45) default NULL,
  `club` varchar(45) default NULL,
  `leftHanded` bit(1) default NULL,
  `coach` varchar(45) default NULL,
  `showContactInfoToFriends` bit(1) NOT NULL,
  `phone` varchar(45) default NULL,
  `avatarHash` varchar(255) default NULL,
  `avatar_id` int(11) unsigned default NULL,
  `smallAvatar_id` int(11) unsigned default NULL,
  `style` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_profile_file_2` (`smallAvatar_id`),
  KEY `fk_profile_file_1` (`avatar_id`),
  KEY `FKED8E89A95F859C2F` (`smallAvatar_id`),
  KEY `FKED8E89A991537956` (`avatar_id`),
  CONSTRAINT `FKED8E89A95F859C2F` FOREIGN KEY (`smallAvatar_id`) REFERENCES `file` (`id`),
  CONSTRAINT `FKED8E89A991537956` FOREIGN KEY (`avatar_id`) REFERENCES `file` (`id`),
  CONSTRAINT `fk_profile_file_1` FOREIGN KEY (`avatar_id`) REFERENCES `file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_file_2` FOREIGN KEY (`smallAvatar_id`) REFERENCES `file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'','','',NULL,NULL,'','','4df7625e21ff0f48241f1b9530bf6abb',8,9,'');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `score` (
  `id` int(11) NOT NULL auto_increment,
  `date` datetime default NULL,
  `set1Left` int(11) default NULL,
  `set1Right` int(11) default NULL,
  `set2Left` int(11) default NULL,
  `set2Right` int(11) default NULL,
  `set3Left` int(11) default NULL,
  `set3Right` int(11) default NULL,
  `set4Left` int(11) default NULL,
  `set4Right` int(11) default NULL,
  `set5Left` int(11) default NULL,
  `set5Right` int(11) default NULL,
  `groupingId` int(10) unsigned default NULL,
  `time` datetime default NULL,
  `winnerDefined` bit(1) NOT NULL,
  `owner_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (1,'2012-08-22 00:00:00',6,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1970-01-01 21:00:00','\0',74),(2,'2012-08-22 00:00:00',6,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1970-01-01 21:00:00','\0',74),(3,'2012-08-22 00:00:00',6,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1970-01-01 21:00:00','\0',74),(4,'2012-08-22 00:00:00',6,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1970-01-01 21:00:00','',74),(5,'2012-08-26 00:00:00',6,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1970-01-01 09:00:00','',74),(6,'2012-08-26 00:00:00',6,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1970-01-01 09:00:00','',74),(7,'2012-08-26 00:00:00',6,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1970-01-01 09:00:00','',74),(8,'2012-08-26 00:00:00',3,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1970-01-01 09:00:00','\0',74),(9,'2012-08-26 00:00:00',6,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1970-01-01 09:00:00','',74),(10,'2012-08-26 00:00:00',6,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1970-01-01 09:00:00','',74);
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_player_left`
--

DROP TABLE IF EXISTS `score_player_left`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `score_player_left` (
  `score_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY  (`score_id`,`player_id`),
  KEY `FK186DB47894E2D581` (`score_id`),
  KEY `FK186DB478145255F3` (`player_id`),
  CONSTRAINT `FK186DB478145255F3` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`),
  CONSTRAINT `FK186DB47894E2D581` FOREIGN KEY (`score_id`) REFERENCES `score` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `score_player_left`
--

LOCK TABLES `score_player_left` WRITE;
/*!40000 ALTER TABLE `score_player_left` DISABLE KEYS */;
INSERT INTO `score_player_left` VALUES (7,13),(8,15);
/*!40000 ALTER TABLE `score_player_left` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_player_right`
--

DROP TABLE IF EXISTS `score_player_right`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `score_player_right` (
  `score_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY  (`score_id`,`player_id`),
  KEY `FKF59F3BCB94E2D581` (`score_id`),
  KEY `FKF59F3BCB145255F3` (`player_id`),
  CONSTRAINT `FKF59F3BCB145255F3` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`),
  CONSTRAINT `FKF59F3BCB94E2D581` FOREIGN KEY (`score_id`) REFERENCES `score` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `score_player_right`
--

LOCK TABLES `score_player_right` WRITE;
/*!40000 ALTER TABLE `score_player_right` DISABLE KEYS */;
INSERT INTO `score_player_right` VALUES (7,14),(8,16);
/*!40000 ALTER TABLE `score_player_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `avatarUrl` varchar(45) default NULL,
  `birthday` datetime NOT NULL,
  `password` varchar(32) NOT NULL,
  `gender` char(1) NOT NULL,
  `profile_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_user_profile` (`profile_id`),
  KEY `FK36EBCBC2484461` (`profile_id`),
  CONSTRAINT `FK36EBCBC2484461` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`),
  CONSTRAINT `FK_user_profile` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (74,'Bernardo','Roubach','broubach@yahoo.com.br',NULL,'2012-02-01 19:28:25','5670f434940508df14a1825a4c144ad2','M',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userconnection`
--

DROP TABLE IF EXISTS `userconnection`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `userconnection` (
  `userId` varchar(255) NOT NULL,
  `providerId` varchar(255) NOT NULL,
  `providerUserId` varchar(255) NOT NULL default '',
  `rank` int(11) NOT NULL,
  `displayName` varchar(255) default NULL,
  `profileUrl` varchar(512) default NULL,
  `imageUrl` varchar(512) default NULL,
  `accessToken` varchar(255) NOT NULL,
  `secret` varchar(255) default NULL,
  `refreshToken` varchar(255) default NULL,
  `expireTime` bigint(20) default NULL,
  PRIMARY KEY  (`userId`,`providerId`,`providerUserId`),
  UNIQUE KEY `UserConnectionRank` (`userId`,`providerId`,`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

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

-- Dump completed on 2012-08-27  0:27:51
=======
Usage: mysqldump [OPTIONS] database [tables]
OR     mysqldump [OPTIONS] --databases [OPTIONS] DB1 [DB2 DB3...]
OR     mysqldump [OPTIONS] --all-databases [OPTIONS]
For more options, use mysqldump --help
>>>>>>> refs/remotes/origin/master
