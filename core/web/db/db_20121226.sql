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
  `id` int(10) unsigned NOT NULL auto_increment,
  `owner_id` int(10) unsigned NOT NULL,
  `pvt` bit(1) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `score_id` int(10) unsigned NOT NULL,
  `deleted` bit(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_comment_score` (`score_id`),
  KEY `fk_comment_owner` (`owner_id`),
  CONSTRAINT `fk_comment_owner` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_score` FOREIGN KEY (`score_id`) REFERENCES `score` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `data` longblob NOT NULL,
  `name` varchar(45) default NULL,
  `size` bigint(20) default NULL,
  `date` datetime default NULL,
  `mime` varchar(45) default NULL,
  `owner_id` int(10) unsigned default NULL,
  `deleted` bit(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_file_user` (`owner_id`),
  CONSTRAINT `fk_file_user` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (4,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0{\0\0\0¢\0\0\0aö²˜\0\0\0	pHYs\0\0\0\0\0šœ\0\0\nOiCCPPhotoshop ICC profile\0\0xÚSgTSé=÷ÞôBKˆ€”KoR RB‹€‘&*!	Jˆ!¡ÙQÁEEÈ ˆŽŽ€ŒQ,Š\nØä!¢Žƒ£ˆŠÊûá{£kÖ¼÷æÍþµ×>ç¬ó³ÏÀ–H3Q5€©BàƒÇÄÆáä.@\n$p\0³d!sý#\0ø~<<+\"À¾\0xÓ\0ÀM›À0‡ÿêB™\\€„Àt‘8K€\0@zŽB¦\0@F€˜&S\0 \0`Ëcbã\0P-\0`\'æÓ\0€ø™{\0[”! ‘\0 eˆD\0h;\0¬ÏVŠE\0X0\0fKÄ9\0Ø-\00IWfH\0°·\0ÀÎ²\0\00Qˆ…)\0{\0`È##x\0„™\0FòW<ñ+®ç*\0\0x™²<¹$9E[-qWW.(ÎI+6aaš@.Ây™24àóÌ\0\0 ‘àƒóýxÎ®ÎÎ6Ž¶_-ê¿ÿ\"bbãþåÏ«p@\0\0át~Ñþ,/³\Z€;€mþ¢%îh^ u÷‹f²@µ\0 éÚWópø~<<E¡¹ÙÙåääØJÄB[aÊW}þgÂ_ÀWýlù~<ü÷õà¾â$2]GøàÂÌôL¥Ï’	„bÜæGü·ÿüÓ\"ÄIb¹X*ãQqŽDšŒó2¥\"‰B’)Å%Òÿdâß,û>ß5\0°j>{‘-¨]cöK\'XtÀâ÷\0\0ò»oÁÔ(€hƒáÏwÿï?ýG %\0€fI’q\0\0^D$.TÊ³?Ç\0\0D *°AôÁ,ÀÁÜÁü`6„B$ÄÂBB\nd€r`)¬‚B(†Í°*`/Ô@4ÀQh†“p.ÂU¸=púažÁ(¼	AÈa!ÚˆbŠX#Ž™…ø!ÁH‹$ ÉˆQ\"K‘5H1RŠT UHò=r9‡\\Fº‘;È\02‚ü†¼G1”²Q=ÔµC¹¨7\Z„F¢Ðdt1š ›Ðr´\Z=Œ6¡çÐ«hÚ>CÇ0Àè3Äl0.ÆÃB±8,	“cË±\"¬«Æ\Z°V¬»‰õcÏ±wEÀ	6wB aAHXLXNØH¨ $4Ú	7	„QÂ\'\"“¨K´&ºùÄb21‡XH,#Ö/{ˆCÄ7$‰C2\'¹I±¤TÒÒFÒnR#é,©›4H\Z#“ÉÚdk²9”, +È…ääÃä3ää!ò[\nb@q¤øSâ(RÊjJåå4åe˜2AU£šRÝ¨¡T5ZB­¡¶R¯Q‡¨4uš9ÍƒIK¥­¢•Ó\Zhh÷i¯ètºÝ•N—ÐWÒËéGè—èôw\r†ƒÇˆg(›gw¯˜L¦Ó‹ÇT071ë˜ç™™oUX*¶*|‘Ê\n•J•&•*/T©ª¦ªÞªUóUËT©^S}®FU3Sã©	Ô–«UªPëSSg©;¨‡ªg¨oT?¤~Yý‰YÃLÃOC¤Q ±_ã¼Æ c³x,!k\r«†u5Ä&±ÍÙ|v*»˜ý»‹=ª©¡9C3J3W³Ró”f?ã˜qøœtN	ç(§—ó~ŠÞï)â)¦4L¹1e\\kª–—–X«H«Q«Gë½6®í§¦½E»YûAÇJ\'\\\'GgÎçSÙSÝ§\n§M=:õ®.ªk¥¡»Dw¿n§î˜ž¾^€žLo§Þy½çú}/ýTýmú§õGX³$ÛÎ<Å5qo</ÇÛñQC]Ã@C¥a•a—á„‘¹Ñ<£ÕFFŒiÆ\\ã$ãmÆmÆ£&&!&KMêMîšRM¹¦)¦;L;LÇÍÌÍ¢ÍÖ™5›=1×2ç›ç›×›ß·`ZxZ,¶¨¶¸eI²äZ¦Yî¶¼n…Z9Y¥XUZ]³F­­%Ö»­»§§¹N“N«žÖgÃ°ñ¶É¶©·°åØÛ®¶m¶}agbg·Å®Ãî“½“}º}ý=\r‡Ù«Z~s´r:V:ÞšÎœî?}Åô–é/gXÏÏØ3ã¶Ë)ÄiS›ÓGgg¹sƒóˆ‹‰K‚Ë.—>.›ÆÝÈ½äJtõq]ázÒõ›³›Âí¨Û¯î6îiî‡ÜŸÌ4Ÿ)žY3sÐÃÈCàQåÑ?Ÿ•0kß¬~OCOgµç#/c/‘W­×°·¥wª÷aï>ö>rŸã>ã<7Þ2ÞY_Ì7À·È·ËOÃož_…ßC#ÿdÿzÿÑ\0§€%g‰A[ûøz|!¿Ž?:Ûeö²ÙíAŒ ¹AA‚­‚åÁ­!hÈì­!÷ç˜Î‘Îi…P~èÖÐaæa‹Ã~\'…‡…W†?ŽpˆX\ZÑ1—5wÑÜCsßDúD–DÞ›g1O9¯-J5*>ª.j<Ú7º4º?Æ.fYÌÕXXIlK9.*®6nl¾ßüíó‡ââã{˜/È]py¡ÎÂô…§©.,:–@LˆN8”ðA*¨Œ%òw%Ž\nyÂÂg\"/Ñ6ÑˆØC\\*NòH*Mz’ì‘¼5y$Å3¥,å¹„\'©¼L\rLÝ›:žšv m2=:½1ƒ’‘qBª!M“¶gêgæfvË¬e…²þÅn‹·/•Ék³¬Y-\n¶B¦èTZ(×*²geWf¿Í‰Ê9–«ž+ÍíÌ³ÊÛ7œïŸÿíÂá’¶¥†KW-Xæ½¬j9²<qyÛ\nã+†V¬<¸Š¶*mÕO«íW—®~½&zMk^ÁÊ‚ÁµkëU\nå…}ëÜ×í]OX/Yßµaú†>‰Š®Û—Ø(Üxå‡oÊ¿™Ü”´©«Ä¹dÏfÒféæÞ-ž[–ª—æ—n\rÙÚ´\rßV´íõöEÛ/—Í(Û»ƒ¶C¹£¿<¸¼e§ÉÎÍ;?T¤TôTúT6îÒÝµa×ønÑî{¼ö4ìÕÛ[¼÷ý>É¾ÛUUMÕfÕeûIû³÷?®‰ªéø–ûm]­NmqíÇÒý#¶×¹ÔÕÒ=TRÖ+ëGÇ¾þïw-\r6\rUœÆâ#pDyäé÷	ß÷\r:ÚvŒ{¬áÓvg/jBšòšF›Sšû[b[ºOÌ>ÑÖêÞzüGÛœ4<YyJóTÉiÚé‚Ó“gòÏŒ•}~.ùÜ`Û¢¶{çcÎßjoïºtáÒEÿ‹ç;¼;Î\\ò¸tò²ÛåW¸Wš¯:_mêtê<þ“ÓOÇ»œ»š®¹\\k¹îz½µ{f÷éž7ÎÝô½yñÿÖÕž9=Ý½ózo÷Å÷õßÝ~r\'ýÎË»Ùw\'î­¼O¼_ô@íAÙCÝ‡Õ?[þÜØïÜjÀw óÑÜG÷…ƒÏþ‘õC™Ë†\r†ëž8>99â?rýéü§CÏdÏ&žþ¢þË®/~øÕë×ÎÑ˜Ñ¡—ò—“¿m|¥ýêÀë¯ÛÆÂÆ¾Éx31^ôVûíÁwÜwï£ßOä| (ÿhù±õSÐ§û“““ÿ˜óüc3-Û\0\0\0gAMA\0\0±Ž|ûQ“\0\0\0 cHRM\0\0z%\0\0€ƒ\0\0ùÿ\0\0€é\0\0u0\0\0ê`\0\0:˜\0\0o’_ÅF\0\03oIDATxÚì½y´$Y}ßùùÝˆÈÌ·¿Zºªºªz+ºéaiÆì›„ÀF3¶–Ì™‘lðHã3£™ã±=sÐ™ñÑXGÌÛZÀXÈ¶$„¥ÖÁ’@4\r	±¨›nÖ†ÞªºöíÕÛ2#îýÍ7\"òFdd¾|õ^VU7u¢òefddd|ïoûþ~÷wEUÙÌöž|‘IoF<w€s«øÝAæ«àTÉò×3UœËó×\n\n,¥=N¬­=_á?Gp`±‘ál×ÑUwø¹©¨óg±$8UP(:Š;¥ôß+ž_êíÜÞ¸á11?\0›ªÎÌDÉ]›wu{®!‰hÅ±nÖˆüýX¢u‡>	<òl¼ÏV°ç€[€^¼XÑùé8‰;šk\n…T•ÄDÄ(\no·ªoÖ€À×/\0<\nœ¹öåµÝ\0¼KàÍ\n?$@¹‹×»ŠWëˆú×µTÃ­ü\nŸÌßþ*ðiàÀýWÀ¾´Û‹~QàG€ý W¼+Ò7°µM6>·\0/Ï÷÷÷\0¿\nü%>“n’y†ƒü2à·/x·z{·Ú`Ø¼Iánà?o¸öä·À¯ü™ÀÏ*øbnoÏÕúï\07_{2Û;¿ø¥\\Ò@/Yø3¼ø<ðSWÀÞ¾måß\0WôV¨÷¢ó˜Wƒ88°×ôâþ€hú‹Æ×ÆDr	ÿ`>\0®€½…íùÀŸ;xŸ*QHfh\r¥âyáekÓq\r(ŽU7ù¿|\nØwìÛ~ÕO:åª>>.öâ¹âcç\nã }÷JÝ ÄªNºn›!xðçù\0½ö&¶Ÿuè\'¬ÓkJPµŠK©ÂuPmSÆÖÅëÒ å:	{ÿBàÎË\rpsyÍ‡¬Ó›KjÁ…ka—sàÖºêÖj¼A«ëÏ7aÃÉ=ôO\"¼h`Ë÷àÆ¾5SýÌºØ:pÎ\'?œó\0»hWPŸ.Wéø„…×R“|iaF£`×FØkÙœÖ¿ø}`ær\0{ÓZê&;òDx¹sú;m—6ÚUŸå*°)V°×£þ®Èæ€—Þ,Æ£2ƒc`þÚÜKÿ‡€}FÝµ“‹ház>ìì;`E*“2õX>W­8j¥TçRìòT§cÐ3wsWWõãªþÍ˜$à+À¿F=	#_$\"~Ý)ÏW—{×¡4ç‚˜å YO¼PíÅ¹Ä¿8˜sÎ¾j˜TkÍ‹¿€ûüÿ\0_¾ûRã“‘ìHø\'™òcaHäC¨~!uê®„_\ZØq)C/œP0aABáè©6:fã+›¼»€_þÎ3ìIhq—£ü¯UUªA•H^\0ti»	¶ü³¥únPÓMU&:$÷¥AÚ–UûÛ€þË3ìl›%Û3Fø—ëd‡Jîi‡ çÙJ[—h2úÅ	…TÒª4»\nÅÚ×ò~icÈ%[¼üS|ÖlõN²Þí”\Z`¶ò\'¥ƒ¥ý½o£û@kèWœ²¾‡j¼IZÔwƒ·¾\rDÛËréþØeöv\n¶×XåŸ5ªÕ°I)A¯Ûh¤tÁ¦yýšK\0K©î;f:Ú‡ÛŠ½®o¿øŒ\0;Û>Qþ‘øŒQ£Õcä¢ÂÓ•À{ ¬Óšã&U–­øLŽzŸ…“F¦ÍûÚ éÛtA§¾_ãv«ñm\"Uná=Cù\r4íóâqt.¡}©®]÷¾/4†¾ÀpkÔÖþÛËl·}¿úí¥T<dqú¢J[µZØf\r@V¹ æ±kèÙ÷‹µQƒT¥z‚E¯®ÂW²^ž`÷¶ìéHx\Zpâ\r6³b¤z!Í®x©Ð¡Ú\0t£Ã¥õØZ²m´Õáö<àÅøªÕËlUÙŽï}“Un@ ’ÒgÃ\\%l\Z”æêŽ~ê³¢	Šd‡ÖsàZš‹aê{Rþ¦Ë\Zl»uÉyG­f»Áfë@XTHr!ñ.¤?ê‰!@\0§Õðly2!uþÚËÛfoýgïÕ—†=\r·µN® UuÆÐ¡—\\dÉB\'/ZƒPÌiu°\\‚íf`7pò2eÐ¶ünôPëPéÑÀlÖœÕ’!UZ¯\\MšëáSèµ,“Ÿ¸7Ûí».S5¾5›-~4\'^ŸëHŸ@ä}€×Öz˜ÆÐy°ŠEkU©ƒ@_„ûÓåë mqœkX¦£²¡¿ÛHmj3ËF…&•§Ï…ŸBœ0y§¬I•?;éR#H.Õ\rj\\›È•êûNµj“B¨ªÇ^·æTk10š’ŸXÑ´äx-Õ¤¹\Z<Òæãòïßiž`;„ÉTÔqÞÆ‚`¤?ÓRŠÙ•ÞmGòl–T\n6»?YßLq§ýkÞÛ\'<wÉßhùš«\rˆ2GN_{´Œ”Çj0å7ÌÆ9¨$c¬JiZ\\P(Y|.SØ!)Nä¹gm¼[Ð“—Ø×™å-HµÐÂE‡\\‹žBË1ýÑ/ø®`ŒŒŒŸ‘	1éwf0†Ê±Å ‰Œøã¢¨8o~.ñŸcúÄKFQØèÁó]›nÈ¬w\0-ô»@äÇXÀ:Áâ«k2\'å È¬?ÎWØŸcXŒ•Uë®vÄ‹ÑEðÈ7\röÎ…‹¶Aé)Ç¾¿ž nüÌ°2º¡ÏBÕïrI—€¥“ œ\\\nû])^lø;ÚzI”\rw†Ÿ§RûX‰80¥$‡àØ‘“g¢¿õçH×/?5~öèSv³rêéoíLæ{ñs^Ñ:ßÍp(ÑeÑ•d²›â¥ºÝjsmv\n¹ïÓ<þ¥O¢iÖæá¯¶qÙÖ¾à_|qûÁ~âmk¡—ê\\/žMvÞq˜ùƒ¯`uf/K6BÕ>+A/b}‹a—é2ô[œ»÷O8ùð·ˆŒ!î®·ì£_IÆjp±%{ïî][úÂ(ŠæŸ8|L¹û÷XüÆ_0{Ó‹Øwðed»žÃm“å-0¶X\0tÉA–\\µ+³ôxÑì*7¬?ÆÞõŽ=Bgj\Z›e¾ò\'n_žÞ¸ÈIÖ9TáÜñ§9qè	ÞÀ1ÞðÖŸàÑto¯LsÔvH]Bf\"?@.VÄ»]R¬ jY¤Ëó¦VxÉüyn›é2M1û?Ì¿þOŸàì¹óD™µëYf»—%ØssÓ[úÂ$ŽO¦™MOŸ9—ÌLOñ†×¼”ŸyçYœv´§yÅÂG{m\\móäúgµÍš&¤aDˆ\r¨\\j¹ïsô6£R…Ø9¥Ë®h›f×¹ufk:)³‰¥›*k©ò†Wÿ-®ß¿‡_þ×ÿ‡ž8ÌÍ×ï?õ_ß~ó©4Ë.?°ÿñßûñ-}áT§µúÑù»í=ß|(ùÉ7¿Žw¾éµôRÇ™ó+8ÉØ‘dìn;ž7·N×-s¼sx=æTÚâxÖbÉÆ¬º„UcAÄ ˆ¼mDÑBû”Áµ6P2B>ûï+…§_¨e‹U‡µÔ± ‹q=I—«â.×O[LõháˆEIÒÍ„©NÂÂô³Óm~äå/âÆý{øëû¿Ím7\\{î¶›¯ëfÙägÉf;>ùùßÛªP¼ÔZwWfÝÂâÂÝ^† X§¬t{¬v»¬¬õJ|Ld¼##°l#–z°š	+.æLq:X³+6bÝE¬jìM1y,-ˆñN>—ÌÇèâcnÍce„Sªàlæ‰çAqL™Œi“1[v$ŽIÆœÉXh);[%s¹™Êg¶Z	;g=È\"à¬Ã©‹¿¶,KÿcfÝ{¶êžÝðÃ?½ý’Ù-À“FÌÉv+YX][1þÆG†…Ùiæg§I3Çz/ce­K×fX=«ÄbÙÓñÄJ¥8ÍèYÒø––‚Š¡ëàlj…U«™gÂÆ±û|Ki%egK=±ƒ#%H\"ˆð3N2§ôœ,±1$±¡ÄÌMw˜jÅÄ‘ñƒ§˜¤†’:‡¦U=r±<’KÑí¤SwZ-7Ï—æä†âœ1´’˜v»ÅâüÖ9ºiF/µ¬§ifÉ¬c%µâœÒ\"ÂžŽÍ9iApãÝM	©Ý*)_–7åÉõÔ)]F”V3“$´’ˆN+¦ÓJ0\"¨:ÔY\\îæÌÕ†/|ÿ²M„lÃv8R‰z+y²ADQuH^¬E†Ù¸ÓÒ¯W¯*3ëH3ë@féY×OYjXh!•ú²‘î´äGž‘+8w#ž–MbCâ8¢$žš5ÆS±¹]°Îå\0k-±£y~=wï<KûØ³l”(_õ)AR¢hLèTÑ<ö6Æ‰Ð’òDI‘V*ü²4¯°È¬Å9ED¼S•Y6ªŽ1”×‰AŒ” z:6,…ÑØ`ç*§ÖÊLEW\0¢k\\Äö˜›³·\'«‚USJ7âåO+™hßE@Š*Sç³\'ªê=ñ’€‘,ßqZIÜÏt‰lÈhPú¢á#ZÎ6¡ÐZ}ô×“?)´JUžjSuE]À^Ë={%à‹ÀŠÂœäi@‘~ÊCÕÛßâ†€C‹G)Œ½ô³Å€(€*+€”1”N\røÊßZâ×Øc%˜o$Eµjµº>áì//æM¿T`ÕûUõµ¥K^’¤…ÝÎA)%Hòu\rM€üY™þàG²^Ó\0åBk0ÛP ”ðPúCÉ÷?/Ðªw_Ì›~)»%}JÊ~WíŒ ý9Õ‰xA1pXmØ·T«Õª m´7_æAÃY½îuu‚Á@Ç‡ÊgÐï÷ý €ýÔ-Su(½×àæÛË©$5°Ê¿]þ·+Éxž£€\\®a€Ô¯Õ“0¢.¿W­y+¥š/\0‡/o°G°¹ý; _ñj9X#¨*of*n_úÕU@èõj­:±<G`K+‡¶5˜PØ?Ç D‹Pœj‹Á\n‹ò¢¾£±ýA‘ìuTï”¼GYÕ»\rgiT&×öÿ€×@­÷Í–5`ÁM1û>”f*¦aÀK¯«íš]—PËH¨ÖK[ýèŸoPƒ³Éýòàc¨>¢jÕ›«Ýœ—Ö2–Å«HçJ•*¹^J­«¾¯¹ZÕ\\h®Z›÷þ1¨ëÿ]œ/¸–p×àýòú¨]Sðùç~eù\"c}ÉÁ>úÁ°\rU(ÝUuîj¯ÒUs°*’¨A£êPÇ6²˜ŠR;„Z£´¾LI	g–1v ÚM$ªOáW?¸èÛ„^ÛNÙ\\ÔýŽƒmª˜`ÖŸóT‰út•ª Æy¿Üyö¬äJrŠTD¼=ïV*ÛÐfhÚï£¦‡¯Á‚2õÁPjJ-BÞïrÉ§ €Ð_ç\"ÎÉÞ¢ƒ¶íûI”¢ê¤æ…ç÷/°¿MÞox¼zŽ½8P“°1B¯¢Ü4?^Jìûß\rÞxøX×*ZÚñ€\\*5z¹¬þó;ªú“¯/T¶hŸ—.IkçŠ™^zÉùk%§x¦-çÅ‘þ„¿2ÑQç®‰.ˆ9§þT®ê|U¾J¨Gß×Ã?ç%ZCà\\¤›Û¶N&óºüSUý¬¨LRÕ*àI´@jíÅû9Ê¾ÂV‚³ö$LDUì}/÷š£YÃÙÏª!}àAþàRJÔ¦Õx\"Zîqmßâöà—qq¹Úvj´ùÜ,Í»”ºàfW¼ßœ—vUïTˆpwy²ƒ\ZÍÙ÷º‹„Mð}®°É9èlù½.ü<îIàÞJšÐˆ‹«ìI°OD²ÿ¿c×’©a_ÒåÇæO’bP|ÕÆ¾¤ë»ªÐUs!•ÐTô•`ß&NQ1ÔbÎ—Wä¾Õ•\Z•š3É3Œ7.å¼±vLªñ6hi\nšÔ¶‡};-®dñ,Ê/ <¹­¨¹`µÄ‡˜§²„aPZÆñµ•yîY™§ýÁI€ýT¯GÒß\\›óvM„)q¼aî$áª¸Ç;çé©©”JyŒŸÚEÜ{/ Üæµ«	t´Ë¡¦Ÿè¢?OƒDg¨Þ«lys>[‚(L‚yà4!ÀÅ\0ÐÒ®çq|@£©s úÏA>±YU;e,ßO;|wm†iãøÊò<w;¥µJP1!›ÝªMµ-|šT…;ÏîÃ	,F–/·ÖÙõxÃì	R5tŒeÚX2z#¥^N€{¯S÷Ç¢ì•\"œK­¡–\ZÓÏ…kq\\nŸ+Ó:eÃ{Ò_5(\\SDƒò¤ ëRÎuý0«NQqøW£Tœ-ñ•¨\n,YŸƒÿÓ³ûøîú,‡»-\"¼„·«E‘›3ÛæK>\ZE UÃ÷º3ÄLó­õyºj¸­½Ì§Î1o2nj­ÐSS‚>xÉòeTß£â~ÇN1>ÎVSg‹sAÙpþàò©½¾âÁŸÓ–£óÙõ&:Õ^]*vãêB­‡4)õäÞ»Š:p¯h‹#1Ž‡»³œÊZÄ(Ÿ:Ëy¥¬ ÌGYm%„Ë,ô2(|žuª~Êíw»³|}}«â.7$«\\÷xÕô)B[?H‚í.Tß£ØªšÝ¢ÆŠà¼¸÷«Or{\\Úe#þÆéÇÞ›\0[¥Æµ«V<õÒfç”­ä¥F>Úr ú;ÀûüÐµ¢?¾«ƒòÙå«8™µx´7Ã‰¬Q¥e,’K2lo¯Ø‰ÇÙÅíEiIÆ²‹¹om‘¶qÜ³¶ƒqÊëgN`PnLVPQÖû ÿðÔ}Tq7¡¨ ¦(Cê/\'S6P²pýLhIÄ™È\"íÛúê” Î¦\ZV•,\Z„ßÂ¯RÂÔ1íÎbî>gl‹eÑSCKs&Ë§÷êdxÊ‹Mª^{l,¬iÄá,æ£go`ÊX^Ü9K\"–WM\'ïÒY•/:ä­Ào©Ú×‚€5%±RzàùÐòdKP©(®ˆ¶‡jCÆŒVá(Ò\'NüHIüªA5E1X„OŸßGª†{WYs‘—ZH”i±“n›yé´P6cãð—Öwôxiç$×%ËÌJÊ‚I¿×ÅüXªæWý9ÅÆž(÷š”N›µ,ÒON›nühPŒR[*´««Ð£(O²÷·ü™ˆ²lžL§ùìêÕX…#i§B[,SÆfWÀèRïà‰Wwçlâo“s\\“¬²?^Y¹1^zó9àªz»æà:õ]VÄhY…Š“²šÓ;m5)gpþ—Ôì´”¡W™Á.4Õ7\"£o;Õ¾öûß=›ÒÇc½9¾×›\'ÁOõéˆ+W@¸”sQ/°+%Šhay4ç{évÆ]¢7ÆKw¢ò™’¥ÿmŠî?é×‘¢–3§ÎqÅL“¾ÄWšâVœ57P\"ÚOz±µú¼`Ym®up»~jfw:Ab„ˆ¾zv—®{â3ì*‹äh‰cMc³œ%·³3Ï5pýßô®ž¹ufýäñÐ5¢™gÛ(X2KÁ†««uÃeXÌ]+K\Zˆc}<oL‚‰bTc»¬Z¹c……÷-v{vZì\'c‘§&ÐŸüYv¸x\rðj#zs„^/Èõd6cÇâNdêv8ó&]íÇ¼…—,£ÀÝ`˜¹þäDˆâ6&i!büŠi—ž®Û{õ­Ý¹èß|îñ³*èÃŠ<\nÜƒ_@ý^üt§+`7l7·ã¯¿¸ßu¿ÂÖ„õ•ó<v4ã¶Û¯\'êì :÷ÉúÉ ŒÈæ“êl_õ6Å„Z[:]A¢Eˆ‰ˆZmLÜÊ5¾ÅÙÍR\\2M¶û9LÏ\\…v{<yü„LŒÛƒNõÍÀÿ®¾Há.à³À×ñ¸¥?È`_¼x5~íŒ›$°©Ò€¡•$<qô8½ƒû™nwHwÜŒ®í Y}šÄ®ƒ‰pp~^µ6¯óêû¢Æ+ÇˆDHùGcPõŸsÎ‚ÍP›agöÎ_ñ4Fà‰“K¬­u™Ÿ]Ë£\"ü¢éïÉ÷“À×ð³@þøÖ\nØ·¯\0þ.¾+ï®¡.zÁˆ®Æ«$í+K†#çV8¸w!›¾\nÛ^À.¦µ~’(R¤Õöó5huH•?/W9}¸˜…™O·u².Ö´Iç®\'›Þ›ŸÓ‘Ä1OŸ[FMŒ)[m6@í~4ß)—ôßÆO…zôÙö|.Á?\n¼ÅÏóº@ÇM•8na¢„§Nžæ¶ý;É\\ž¢4	½ùç`Û‹tÖŽe+ˆ‰!Š½w^QùÐq.¹r†ÓåEþÖ¢.Ã¶éÍ_‡Kæ0ù:b„õÌrìü:QÒÚÌOXÈMÕëðªþ?bÂ­¨\'\r¶É¥øgUy»·0Ý^`\\nQÒâé³+>Û”Ï.QÛÙÉj2Ckí8­õ˜´¹]°l¡©¨0eeYr†S¡7s€lzD	¦¨ë!Ž#Ž[áäò\ZS3;/ô§\\üÀ»s›þëøåO<SÀŽ·\0¿:]§)¬ÚàªLMMsöüiž>·Êþs¤™-³æF\Z%tg¯!Kæh¯!Î–}o.	\Z¦&·Š†*u)6™¡7{-¶³£ o‚¹àBEœYé²Ôsì\\ˆ·\ZoMå&íßá\'èÿ.ð€G¶Sò¶skïTô/€;~èÔW+Þ–\\•V»ÅJf9¶´JEccÊòb#>gÛ¬-ÜÌúôÕ¾\\(ëy¯ÚÚ|Oq6Em†f=¬MI§÷ÐÝq+njG‘Wñ\rŒ18Už>s‰[³­·òFàŸã×ìüÂí—	Ø?|&·=¯ÞÖs7¬³åçj$iqèÌyRë0b*iÏt¢˜ÞÌVÒKæqYŠËzX›a³Ì7¸I»¤&¡·x½…Ñ¸…ä´œÔv#Bf•ÇO-Ñé´}šu2‘Ê/åqûÿ”;y—ìç€Ÿ¨öšq™±Ê,\Z‰U©ýùìà®NOÍðô™eÖRKdLEò\nÐ%ocmP4™£»ãzó×‘aÐtµ=\\–’uvî¼\r;³/oÆã”	wéïÝÔrb¹K’´úŽ]p¥ÃÖàÖšã¢Õ4LÓ¶ø5ü²Po»`ðß£ü%^]×…q\0ØÍR¥µ´rãÔ¦v»Å±åuÎ®®™¢ý $öU»\"&\"›»†t÷óH§vÓ“ÙÂud»o…ÖtÞÞn°5G¿Õ=Ä‘á±ãgè:ˆ“VuöfÍÜl….®m/Î=÷ÿ˜™8ØÁD×ÿø°k¬$ÃG¸4¬áUþÕTL@áG9L\'m9zÚKp])/í9¾ô¹=½È©Ù[¸OnÆ.Þ@;IÊ¨là<äÏ#?\0’8âÉ“çPã}m\\C›©wl×¡c)üðÉ×Ÿ´7þJàÙŠwö>uN\r–C°8IxòÔRÉ™ô‹ò¤ô²MÞt ‰#lfù«‡ñ‰ŽqbÍñÂ=ÇùÛ/º–÷î —Ù’`•Àû.ïv$¬§–#çW}|=dÙÇ‘*|\\‘V†Õ®¼#§aÿí¤Á~p‘TG)ÏQôC€•pê‡j‡¼9­v›“çÏsz¥ËŽ™6™u%3¦*8çK1J;ŽxüÄ>öåïñ—AÚÓ´§g¹û»OqïÃOòÓ¯¼7¿èF\"‰Èr²Å	f	­8æû§—8½²NgzçP[Û¨Å¶7*ù»[•xAe­ñƒRÄ¬2 ‰u»Vù–eÁÄ¾â|±hž6ÅWùT­V‡sKg9tf‰½óWã4«$ÆZQÄzšò\'÷?Âïé{]é27·@ÜòÀüÜ\"Ë«Ë|èßæìÚ:o|þìß1Gæ\\Þ“­_ÂG†ãçWYêYv.DeWˆª“9d\rn\Z’kä&_gÀ\'PžìŽMÊAÛ\\=Ê©\Z5Êu7°–—V:]Ô¿ËD]\'<uòåÍi¥ïHµ“ˆGŸác_y€?º÷aŽ­ÃÂân¢¤wLôS‹ÚÓ³LÏïàá“+|øó_ç/x’Ìzm ¹WE«Ê¡Sç!JüB†4s¥»ÇàÆè3¯p‡NL²á*«CûY–ñˆH·ôçhô\rTµBQº+A¬*áèÎ	ÊRá¼ý¡ËË•\rÂÔÌ‡NŸçüZ©–ïB‹pfuÏç	î{â$-vîÞË	»ägS¸j¸äTétZ\\µwKKK|ê›óÐÑS¼åŽƒ<çªÅr¹¦^fyêÄY:)Ÿß®HžÖz¬Ô¥Zšìº8qè 6¨½ÝÊ	˜‰…^À\\£6I«6{\\ÚxlØí`Hlõ°x~jjšÃg–9½²ÎTË/¹ñµ\'Žð›Ÿ¹—/>r˜dv‘=ûµÚ¸Ì·Ñ°VY]·¬u-ÎæÓÇ¬‚‰˜[ÜÁÎ½ûxäÔ*¿ùÙûøÌ·c=Í˜iÇ,w{^Z¥ÕJªþÛê?F7ˆ¯7²Ý0Im^¡-Á…\n2Ô«®ƒÔä¨9_Ï_	YT¤¯!´¨!ÔršÚŸ|çŒÃD†.OŸ9Ïl\'áOï{ˆûŸ<Fgz–=Wð±0êû}çëwÍ´oyÁÖ{Ÿð4½ÌáœâÔ\n&í6{®¾šå¥%þäþGøÎá¼ó¥·rv¹KªÂ¬Iò™ŸTÚ_,9ÄV7Dgþ~ðG\rþxÿÉÞI‚=52ŒêkÝ‘®z¿…eÍYÔ¹4|G¥ø_Ã9ø†™©)îþæ£|êë³ÔsìØ½©éi?P¬ÃITN”_Yw¼÷Õ×òS¯¸š^æhåÎûO0•/6;·H{jšÇOžäßÞu/SmÚ­6&Ž|¾»B_ä_\\”›ºb©3ˆüû¦pD‹•%~M­·I_?hGt`Í°þZk‹™#X´É“\rôÓ>•êÂu¶ó92I«Å©Õ.½¸Ãž«÷Ó™™FU±êò4åê\0Ö*GÖ[Æ¦+ìŸœÍç[»`r^>8â8aÏÞ½˜©9Ž,­arÖŒšÖÚo°Õu\'®q•W3ööšv\\6íB$;®«h©©`	R‡2$æ.™1Ô\nö© 5‚i¹e{ê<¼+–cˆ[-víÝO”$¾í´uÁ)úÜŸU%‰\rŸ¼ÿ8WO[z>ý3ˆh_-‡×˜ÏÍV„©Ù’Î4bÖÚFiÖ\rÈ’zIs“ý®.=Ò+ß‘ûPç\'¶›\Z«y›4—®´Ífõ^6¥m\0¼b/Š	÷&Âä]‹ƒYõ9pRò×N…V$Üw8åÁ;â€µÌ÷w*µ~û@:çu¬‰â\\­ê`(8\"´ldT*¯›`ÔÊm††zí\"Un`Áq•B­æucUðª1fP¦ö®A‡Í€Kþ5\"•yx¾ñ]iËµúrêªýNbk~Ú±)šìxéwTC\'WvoÒ¡ÜnÀ+h?^´Ða!—¤zkã`7ª‹“RãSõJšä·O \rÄÝŸ«tNäÁû\rç)½ôJIxØòl *•¥y\'¤´¦×=g¢®µYX©ÅÔÚ˜Tdˆä*£³}µM\'¶«S¤Ãlw‘@ßíl…@	ž„^·#ðÒCpÊuE‚ëhì;¨á¼IŽsçmsš‡^ƒ’Y,5Ì&H²4K}¥/kñ\\´93æAÃåƒoZKÞcûÁÖQ¡DÍšt7;|ÅŽaÙ.­Æ[ƒŽG›íAÏœ²ÚõÝ\"fÚqÙåm’0Ÿ\n®I³Ö¤¹.áÒ@Æ4‘5C¶˜Ø-\Z ÕX;°ß5P¼ý-~ymibÊ‚_Ü_»ß¹?ŒÉ+*¾‹ÃºÌ*×îhñ·_~+Ý”}éKkYÞ&‹Z£xm”êŠ•fÕÞr£ê¯{hh²÷ƒæ}\"`ß0Räk\'¹Ú\ZŽÕ9ö0,kL‡†Ë‚„K{è½P”Á¾ÒÍøï^ñÞûú«YëYÖV×øÈ_)%´F[ê°dŽTÁivÜt(c&\rˆmjÕ«Æì[¾å8[\Z¤°î—Î‘‡†Å“¥FÎH¡Ë¥ÜäÒj‚dDò6Ðþïøb¥%µ Vˆ$ãô¹s>³e,jÅ¿—«s	\"F\rYÆéè¤AéÙí5µúÁš¦R@Ç¤L/ ôR•Ú\r”Þ¹CªÍ^C•ž#ïÂv“R=˜Ä^X8O¡ZñÔÕÖñp®\\“‡N+âc}“uq(tï)\"CvUí¬kÒ—:ŠãQŽ‹»i\rhm WBÇæû&%ÙCyëaê¼®ÒàÏ›Â²Ê@Òj±Cã÷ÕèØæ|»¡£<t¢Çÿù§GK+ &˜<ßÒ‡©Ñ.3LµW–œzSø7d›Œ\Z÷\0h¥I\r‚£xµ³`xè´j]5œt7H3VªŒ¥Ù›mr€ŠðÎ9¿|¢qB}õ\'›¿§CÒ•®)=$}Éµ!‡=¸¢…65RËvlHÏn‡doFâ©,Ð&>h\nj^ØIPýŒ’j‚æCâŒ\r•Þ1AG«Ù¾†D¦Žqþr¶.(ÐÖ@%o áÏ«åíÂ›¥¼ÏèKrÈ«ƒßQ‘„ºã(}é.šÎÒj¤ÿºj5K5\0³Ž&Vš$¹pó8Óæ&;:ÜŒè$Á¼ÕªÐQ6½ÑæÖC©ð­02P X÷Þë#@›\nö‚½g&?Èå­2+eCCˆ‘á¤Š6:ßÃ€ šu´Æ¦Æ#—½emXð0	ï^³ã]“ò*+¨½šçÞÑÁ×êÑ’Ã/¾~ûþ~æ5×‘:ø»å©SÝþ„úgFÍöšixRð cL!òÛÄèÒñßPÂµš¨˜¦Ê”T JEekƒC£\rdNYíe¼ûÕø©×î§›*OŸ:Ç¯ýù¡\n=˜¥jæ«†<,#VSdc`¾úÚ‹£Æk€ŸÐxè¸•ÞzAƒÊ ™R=WUÅ‡o7©û²‚Äù.xK+«œ>{–Ì)Ë«ëy•Ju™M\r;ŽÐa oôÈó\rÆØC@tQÔ85	×šÓÖ,™µ_Ôdtƒu7ê¸TŽ”\ZÙp³û‘äu\\B\'1|ôG8rb‰Ì)ÿåËD‘©,ÛX?i“ÇCË|‡¾8ÒÁ\Z–2QmªäÆƒ*†*S!å}i¬T.À4¹iòÂeDì¥ÁZÅ?càÉ3)¿õÅ3^4Œ”ôk0JÓÊ½c¦ÇEä€žxèµàá¨S«C¥¼.ò2<TzïCÃ©ÞjŠ32ÕÑásÙÚØÌ]uÕ¼7ß?ÿƒtDÂš‹tì‹Ù&R¥±Œxß”@‰}MÉ	&ò‡uLr¥’þj\Z\rè`þY7ÎDmä e¬ÌÖ¥•ìa€Wc`X­¾Qo é¡×ªa·Bm(ï‘á¤‡U%³®±Šs>ÏÝ_bjJrÉdmÎV\rÌÁƒGØyÝ”`o7>ìÂÇ‘üQ\'nÊ}‹Týð¦kXC–9vÍOóÂƒû‰\"`ÏU•VUÜ³¡U/Â6Ž¡ÖÙ`môü¢qãÃÀ¯wXhœ\"TcS‡þ8\rÃ«ú\r”JÅê€äZÇÂÂ;vÌ6Ut•Ö9FÍ¤®÷D‘¡^{ÞÃ<Xí@j6X6è¡ÀV{®ÊdÀÌQŒ”ðFßà¼mäŸç˜„&£ùòªog:Â‰k:¹6;BJ ¯TÈÖa\\µ=ð]å;½É©ñ†Òßqìø€çÞHGÚ›n‚mëÚi«7CŠ‡ù:ºyµýÐdI­:BãJù0Õl(íß#f»¶Šþx“öš±Qàm”ÍÒáMH×òÒ¡÷+cØïœ¶QÒ> ÍÊ&~êE\08P+º°ÒÄMŒ\0ºÇô?/2ö\\îx+w@ƒê“ÐMôQ—W‘v‘\r5Ç°“Éæ1½°;Ñ ¦]°ˆk}VJ(#ïCíoiº\"d“{t\"dc)o”æê¾â¼Œøíp³áÔ05Üÿ•%a/è>\rÍæm‚xÙR¥ŠTlÇ…I9ãü !ö}#Éß6`UÇ\ZHÃ¼fCn¨½FÜ§	Úìaza£w$“4äµjl[B*í\'/PŒÎ0mZƒŒsŸ6Ë]Ô^{tâ`opÆ]Æ¯††]ãÏ‘Ú²)E~è˜÷‰1#›Q G\"k“±ÙÃšäl ®ÆQíM7PÆðR\'véßuŸÊ{¥ÇŽ…ÎYnÚý0ÓŽæ¤mVQL¾.iÌ±õë8qv‘ÇŽÜÀ¹Þ²4Â©1\'N\'ŽÞO·ûI”™2ßã¬N†.9z/@Ò7\"N6S&D¦Œ;Fôd\r¯3Ž7îy[ö>ÊK®ý\n×N=„#.éàjg\nÁ`9ûüÝ|íè«xàðs9¾zãÉÑ¥Z£4öè­Q¡*›HÇQ¶Û×-~¸LÙáo÷Í\'¼êº/ñš›?ÌîÎQRíà$&’|öúˆ_ÀbGr’{ÎÇxÕþ9¾¿ô–É«¾¡Ê=“±Ùüm$d0TcóÒ~¡ƒàb…iõÎ	È ”·“.wÜðï¸é˜_Är†uFÄ â<È¢È@PÿNuí4x‰ÛwÅ×v»æó>€_Cl[Àð€Æ‘ôÁP- \Zìúv¨ä‹µ¦nä¡ÕîS;Iyë>Á¯»‹©ø5ôì¢_gD2ëÁ.[xÖkŸ¤äülS¡çÚ8ç¦M”ýc1r‡:~–†…d.¸Ú0µ¹›_M÷iÃ\ZÙOän×¥5`¶VœòöÜÉsàãD&#uN{ ~å\"‘bwqå£©=\"Š—æK=bxµ@COÓ{nÔ¯«<Æ|H‹©Àëå°n|m‘q¼ùùŸâõûïÄ‡s-ºë;PaèaŒ/×`ý£©?`¥×Kpv\Z)bäÅÀÇ½zK`U¶ªývÝ4òjµEdÐépÈÍwv\rîMß?\0ðà³p»ýÚïð¦¿‹1>Ù£²ƒÞú,Î“æÞk¡Æs)6›Krñ˜ïXO!G’öÀÚ…²¾^‚ò¯BKh¶2ÂÇ9hè£Ï7øª69?›÷±µBÃy‡Õð³¯ÎM¯ð®[>D$=”È¢7%ŽÈÉ¼ú†üQ+ ÷÷¾ãÖ?þ8qr\nô ªS¹~Š`±³jm,ÐË> :öýÕ2¨ué¯iúÎ0É¶Ö5c½úüÐ\rÊ¾é§ÈhçÂe¨ÞAÒ:AE4\0î]¨îÈØ\\…ÛÒvûãÀH—VûÛ¨¾\0aª|]¼Žÿ€*EÓÛ‹‹nBÚÇsÐÆíÍ+ûÛ7Ú:gxÍ5wamD9ÑA\"ºëÿiú8&z‘¸rf©H¯–áXñ<Œ]=[z/k«· :ë%¿ÆT§?«N·oU=½\0Jû8àc‹/Ì’oF§lÎAl%/yÎ=Ì›ãdäKIIŠs×ƒ ŠBäªQRÞSªW^ì”j<È’›‰¬=ˆˆëÇ­þ ·ª2½Ýkqn>¾­…+ºèÙf´Í:s›Í„¿!’”Ûw~•Ì%•ú@goÅ˜E’ä>ü\Z;Cîã8…£\ZÅ‘´ŽbÓWYýˆ— Ü:ñRâ±‰mˆ×ë‹ÈÅˆc\0»ÑÉgÎruü0šO´ôU¦BÚ»™nW™š»4)ºöy‚ÔwZ68q¦ì»­jÊÆ÷…|«kÇcíƒdöE$íN¿_‹¿¬yU}±á\"l,)Ú,ùª—†b	¿¿2W{Ä|þ5ß Šlð¶ÃÚy„Ðj=˜ãå@¨Òˆ9ð\Z¡Î”þ=ãw\rýì5’Öƒˆ KoBH+\rzTy•¹¨7k+’U÷¤‹Ân2 5øžÑõ»¢Ã.ˆ2Ð²ì…˜øË^åª …TÅßÎxi¦xô¯»ÚñÐ&Š¿2ƒs7£ôª•ãK\"![HXŒ:áPÀå\"éõ†-a5, &ïž˜ía}m‘¹Î=€õ6»²zô°+¶Bm‡ «É%!N¾ÃÚÚ\Zp}Ùd¿¨Nuú’€=ì~ËÅ\Z]qsjjÚ¬½•vç,ÆòªÙÐ_³Ì¯iä;ðiÃ¬ðRZC-àAGÎÑj=…º›±vÕÔô³»,À…‰pùo#K—\nÉrê{©:‡ð<LtugpÎ`\\¾Æ7y;M?GLË¹aaûÆÂK÷©/áÎ¥DñwÁ½u³¨;å[x:P‡˜gÂ¼Ü2_›¹¦Ô%X×_:JdÙ~ÒôqDNãœ)W5*íri£#¿ÓÍ©Ý…v\\‹•-è·évçQmù1}>#y†m›\\&tÞq·³n™hE\'‚X]ÝE»ý°‚sóý¬N±È;ýÙž\"ZiÂ®P±Û^ÂA­æËDbuuŽV»åK¯ÁqÈð,ß&I Œ³}ïøóé¥â;*:E-€Å˜U\\¦¨õ»³^0UƒË%Ú’^Hse\\¾¤¤s…¯‘¦ùr“¹&qªXÇßÄ\\Ù&º?·“½L\'K1U»G«µ„µ…æœ«”ÍÑüòUR™]vLÎ%Ö·àt~ ±ÄqkÅ‡âN±–®S¾j®À1aÍ\"†‡V_ŠËzd8ç@—Y>?‹ª—@—åÒi—9l–?ZÅf`3Lùh—)6S¬uågqŽn×àt	a-?²Œoe–®€=á­›vøúá—±âæÈ2ëscí<ÎÆ~%¢R+¶|Ô`í„ðõò5*ŸÍìÐ£¨[Á9¡—Af¹K§¯€}¶ÓëxàÌKÀvé¥ú7¤ÙM¤½Ý¨Ëªm]_rs©µY¸;¬u¹T÷?çµ€°¾ör\"ó\0Î%Í\"Ò”³Öñëà\nØ…X‰øÂ±Ÿæto7iæpîë¤é<iz.K=P…tfä@*<ÿ»jH{Öÿœ³›ÎÑí>#÷“e=º=!Íø—ÎñØ°/¦t¯ìá‹\'ÞE–*½ì(Î}Ž•µw‘eêœ_ò9­\0ÒÿípYm¯¿ou+¬¬¾ëÎ¡|‰noŠ^ÊWTù\rW8oW`¸X›pÿÉå[ko\"ë¦ H¯·›¥å·“¦ë’[Hoá”¹ÒI³\"\\[cmí6Î+qô{¤é9Ö»æiçxÁê»Û²Xú•m¼-ÍZ|îÐ»‰ö¯psûóˆù0+«ÿÕCLM}#SDÆ`L>¿ËöÛ…“AÊU‰œ¢Ú%MwsæÜû1æKÀ_±ÖmŸ\0þ~d¸/üþû÷sÀõ\n|ÃÍ4¾x\n%Ð Ëë‹üÅ‘0]µú²ë¦>· tXYýG¤Ù>:íOE=\"ÓÁH¾Ò°©²€ùBÀ8ÍP×e½wKçž(úQôaÖºÑÓ¨üƒ(âîÝr©\n~P¶¿óáOä öí:Æ-;î\'Ñ%öº¯ïœ×\'þoe?gä•¸ì½DñStÚ\'ŽÄÁˆq‘þ:NÑŒÔî£Û}3Ýîk0Ñçˆ£“9þ\Z¢ÿ1Š¸/2»v^aÐ.™×Óªæç{éô§#óåÿCxâ…Îþ8éò/ÇOÇ_%ŠBdcz N;Xw\rÖ¾„^÷VLt1¿ŠòÝ³Ý´õ+\"æ7áì°ï¼ö¥ßþØÚ©O+\'~FäCo¹ö•j_=ßë½‘·ÇŠ˜ ódÙ4Ö.aâ\'AþV¿óUœý,´Ûyd£/ºöå±­BòëÎ%¿Ç^dùÝ; órÑ½7Ûlqâºœ\"Ç9wî«\"ñ×T[ßâÓ3=‡lÿÿ\0wºqÁ,¨­\0\0\0\0IEND®B`‚','foto-jogador.png',15956,'2012-06-05 00:00:00','text',NULL,NULL),(7,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0%\0\0\01\0\0*ÞP\0\0\0	pHYs\0\0\0\0\0šœ\0\0\nOiCCPPhotoshop ICC profile\0\0xÚSgTSé=÷ÞôBKˆ€”KoR RB‹€‘&*!	Jˆ!¡ÙQÁEEÈ ˆŽŽ€ŒQ,Š\nØä!¢Žƒ£ˆŠÊûá{£kÖ¼÷æÍþµ×>ç¬ó³ÏÀ–H3Q5€©BàƒÇÄÆáä.@\n$p\0³d!sý#\0ø~<<+\"À¾\0xÓ\0ÀM›À0‡ÿêB™\\€„Àt‘8K€\0@zŽB¦\0@F€˜&S\0 \0`Ëcbã\0P-\0`\'æÓ\0€ø™{\0[”! ‘\0 eˆD\0h;\0¬ÏVŠE\0X0\0fKÄ9\0Ø-\00IWfH\0°·\0ÀÎ²\0\00Qˆ…)\0{\0`È##x\0„™\0FòW<ñ+®ç*\0\0x™²<¹$9E[-qWW.(ÎI+6aaš@.Ây™24àóÌ\0\0 ‘àƒóýxÎ®ÎÎ6Ž¶_-ê¿ÿ\"bbãþåÏ«p@\0\0át~Ñþ,/³\Z€;€mþ¢%îh^ u÷‹f²@µ\0 éÚWópø~<<E¡¹ÙÙåääØJÄB[aÊW}þgÂ_ÀWýlù~<ü÷õà¾â$2]GøàÂÌôL¥Ï’	„bÜæGü·ÿüÓ\"ÄIb¹X*ãQqŽDšŒó2¥\"‰B’)Å%Òÿdâß,û>ß5\0°j>{‘-¨]cöK\'XtÀâ÷\0\0ò»oÁÔ(€hƒáÏwÿï?ýG %\0€fI’q\0\0^D$.TÊ³?Ç\0\0D *°AôÁ,ÀÁÜÁü`6„B$ÄÂBB\nd€r`)¬‚B(†Í°*`/Ô@4ÀQh†“p.ÂU¸=púažÁ(¼	AÈa!ÚˆbŠX#Ž™…ø!ÁH‹$ ÉˆQ\"K‘5H1RŠT UHò=r9‡\\Fº‘;È\02‚ü†¼G1”²Q=ÔµC¹¨7\Z„F¢Ðdt1š ›Ðr´\Z=Œ6¡çÐ«hÚ>CÇ0Àè3Äl0.ÆÃB±8,	“cË±\"¬«Æ\Z°V¬»‰õcÏ±wEÀ	6wB aAHXLXNØH¨ $4Ú	7	„QÂ\'\"“¨K´&ºùÄb21‡XH,#Ö/{ˆCÄ7$‰C2\'¹I±¤TÒÒFÒnR#é,©›4H\Z#“ÉÚdk²9”, +È…ääÃä3ää!ò[\nb@q¤øSâ(RÊjJåå4åe˜2AU£šRÝ¨¡T5ZB­¡¶R¯Q‡¨4uš9ÍƒIK¥­¢•Ó\Zhh÷i¯ètºÝ•N—ÐWÒËéGè—èôw\r†ƒÇˆg(›gw¯˜L¦Ó‹ÇT071ë˜ç™™oUX*¶*|‘Ê\n•J•&•*/T©ª¦ªÞªUóUËT©^S}®FU3Sã©	Ô–«UªPëSSg©;¨‡ªg¨oT?¤~Yý‰YÃLÃOC¤Q ±_ã¼Æ c³x,!k\r«†u5Ä&±ÍÙ|v*»˜ý»‹=ª©¡9C3J3W³Ró”f?ã˜qøœtN	ç(§—ó~ŠÞï)â)¦4L¹1e\\kª–—–X«H«Q«Gë½6®í§¦½E»YûAÇJ\'\\\'GgÎçSÙSÝ§\n§M=:õ®.ªk¥¡»Dw¿n§î˜ž¾^€žLo§Þy½çú}/ýTýmú§õGX³$ÛÎ<Å5qo</ÇÛñQC]Ã@C¥a•a—á„‘¹Ñ<£ÕFFŒiÆ\\ã$ãmÆmÆ£&&!&KMêMîšRM¹¦)¦;L;LÇÍÌÍ¢ÍÖ™5›=1×2ç›ç›×›ß·`ZxZ,¶¨¶¸eI²äZ¦Yî¶¼n…Z9Y¥XUZ]³F­­%Ö»­»§§¹N“N«žÖgÃ°ñ¶É¶©·°åØÛ®¶m¶}agbg·Å®Ãî“½“}º}ý=\r‡Ù«Z~s´r:V:ÞšÎœî?}Åô–é/gXÏÏØ3ã¶Ë)ÄiS›ÓGgg¹sƒóˆ‹‰K‚Ë.—>.›ÆÝÈ½äJtõq]ázÒõ›³›Âí¨Û¯î6îiî‡ÜŸÌ4Ÿ)žY3sÐÃÈCàQåÑ?Ÿ•0kß¬~OCOgµç#/c/‘W­×°·¥wª÷aï>ö>rŸã>ã<7Þ2ÞY_Ì7À·È·ËOÃož_…ßC#ÿdÿzÿÑ\0§€%g‰A[ûøz|!¿Ž?:Ûeö²ÙíAŒ ¹AA‚­‚åÁ­!hÈì­!÷ç˜Î‘Îi…P~èÖÐaæa‹Ã~\'…‡…W†?ŽpˆX\ZÑ1—5wÑÜCsßDúD–DÞ›g1O9¯-J5*>ª.j<Ú7º4º?Æ.fYÌÕXXIlK9.*®6nl¾ßüíó‡ââã{˜/È]py¡ÎÂô…§©.,:–@LˆN8”ðA*¨Œ%òw%Ž\nyÂÂg\"/Ñ6ÑˆØC\\*NòH*Mz’ì‘¼5y$Å3¥,å¹„\'©¼L\rLÝ›:žšv m2=:½1ƒ’‘qBª!M“¶gêgæfvË¬e…²þÅn‹·/•Ék³¬Y-\n¶B¦èTZ(×*²geWf¿Í‰Ê9–«ž+ÍíÌ³ÊÛ7œïŸÿíÂá’¶¥†KW-Xæ½¬j9²<qyÛ\nã+†V¬<¸Š¶*mÕO«íW—®~½&zMk^ÁÊ‚ÁµkëU\nå…}ëÜ×í]OX/Yßµaú†>‰Š®Û—Ø(Üxå‡oÊ¿™Ü”´©«Ä¹dÏfÒféæÞ-ž[–ª—æ—n\rÙÚ´\rßV´íõöEÛ/—Í(Û»ƒ¶C¹£¿<¸¼e§ÉÎÍ;?T¤TôTúT6îÒÝµa×ønÑî{¼ö4ìÕÛ[¼÷ý>É¾ÛUUMÕfÕeûIû³÷?®‰ªéø–ûm]­NmqíÇÒý#¶×¹ÔÕÒ=TRÖ+ëGÇ¾þïw-\r6\rUœÆâ#pDyäé÷	ß÷\r:ÚvŒ{¬áÓvg/jBšòšF›Sšû[b[ºOÌ>ÑÖêÞzüGÛœ4<YyJóTÉiÚé‚Ó“gòÏŒ•}~.ùÜ`Û¢¶{çcÎßjoïºtáÒEÿ‹ç;¼;Î\\ò¸tò²ÛåW¸Wš¯:_mêtê<þ“ÓOÇ»œ»š®¹\\k¹îz½µ{f÷éž7ÎÝô½yñÿÖÕž9=Ý½ózo÷Å÷õßÝ~r\'ýÎË»Ùw\'î­¼O¼_ô@íAÙCÝ‡Õ?[þÜØïÜjÀw óÑÜG÷…ƒÏþ‘õC™Ë†\r†ëž8>99â?rýéü§CÏdÏ&žþ¢þË®/~øÕë×ÎÑ˜Ñ¡—ò—“¿m|¥ýêÀë¯ÛÆÂÆ¾Éx31^ôVûíÁwÜwï£ßOä| (ÿhù±õSÐ§û“““ÿ˜óüc3-Û\0\0\0gAMA\0\0±Ž|ûQ“\0\0\0 cHRM\0\0z%\0\0€ƒ\0\0ùÿ\0\0€é\0\0u0\0\0ê`\0\0:˜\0\0o’_ÅF\0\0[IDATxÚ$Í1A€á&[éˆB)ÑjôP*ÅIô{…ÇP®()‚‰¨ØØÝØ™÷¾|FUÍî¹ïR·°\0ÇÔ\rEØ\n`T•ózA­ÙÒP})?ocâgG³z—ÙµÁôÖG\0¹ÄÉ…*€]Y€Â¯Ò“¹Àr2$Q#ÿƒí¦ú\0\0ÿÿÁ»ÁP\0€áÿ4m‡¶b“Ø\\b5x1ˆÍSlƒÁhñ\"±-À\"1¶.ƒ‰“êé¹ø>1\\HÁþšO¥vK\0ÿò)±à~ÆŒ®¿ë¥„q… JÏûÀŸeÍj-	™t\nöù«Œð”±ïW^2ØÜÊPZ‡¯ŒÅ(h´ê¬ús\nuŠ=B+´±b{tQ–jù\0\0ÿÿT¿JBqGÏo&ap%A(¬!š\\ë	D_Ågh÷FgÇÄè\r‚Z\"ñ^S»þ~¿Oƒ\ZtæÃŽí/HÒçÂ3Xy¾]\00vD\0÷³ãé¬1½ª’9Ž¹>9àh“PöÖýá$÷\'öÎêdJQ»Yx›d7]Ìð?Ë×ÇüÃÝ¼,Â^ô’²ž’LâãkÄåùÅm*Ix$,H½pÁ±L\r3(c’•ÃKHÐ¶èBà?€Ví™Óø…qýþK%ì4FQøûgh-D1’P¢A¡Mˆ11qí†àðº`í‚\'ð\\úlXà†K…(+ØIBB°îl‹3ítþÿþÇÅÔ¦ÝßûÝsÏ9“¯S¹\\õ†Ì§m/åÿ×’)Ä³Â¤ZRk\neÀ¯[~ö=‰ã&7ñ×/p°63´¯/´[[|ê<aa~þ°äýÊ-ßNO˜i!éœ\Z‹Ë¤µ:Ñe~•…›>vZ¼~˜¹]ëˆzóËÁ¼;è¶ÀB%<u±].êswm ö\'YS\\Ô„d‘¥Ò\"yRãÝÑ/ž{BÕW$@‚ÉøÓR˜ð&L\"H«•ë\n†ŽW/×)BÄ¢5Mt	I>V±d£:‡{ÛŒ.çÆw1ElÜ>ožÂ2ÆqEšnæX/ß¿åìësç.öÿ±Q6«QAþúö½™L%‘$AÐ€\nÑ?(¾€KWî³P@ßÄ•O ¸Pˆ‚ÑˆA7YHÀYH\"J\"Í8™ŸÜŸ®ãâÎ£ICCS§OUSN*Ã}i—-jìN×»a«ž\Z{™ÑÎU$m\09âôd/µa0ýìŠva´rqP”s%Ÿ=b7€Õ#Á¬¹@†_ÚŽ§˜ŠñØ1]ñL$ŽÔD+r£ž\nöwW~iÄ;i\06(óë«§ýØ©¸Rý>RÃ\'	‘‹J>½<Yz@Öm¿—´x$³ûÌW[÷ù´®‡¯Åq…(Ž!Š@B!P!=Øð„ÅÄ‰Ï	ji7ö¼1ÍËýY’ˆÑ‘8ºë#Ÿ.Ì$•…PQœ€s|°9ÞÖ;E´˜›VóÂ°ÿ(Ô’‰®™8…Êêv—cn³´–po*goòú[3Í›x\'!Ie`ÁÏƒ‘›HƒhçF!ñxùŽðD<Z®aÎ“–»ëoéÜ@Ö}ý[€`Fæ r®wÅöï6±÷Ìž´€z\n&&ÿ@P¹!à\rä~åòÔs¥z¹i^áÖÜ&ÇöØ¬_m\\šy6¤³Òï¸¾Q8ç©\\çgÖ¹¿°ÉÔ‰\'$¾ Ñ¼Së´^|Š%=4$Èá³¾sÆÎ2E6Š‹<ÖÍ¦=üËhù„ÖQEqø»sgÞ¼¾$mHÁÚ´ÐÄ\"´X«UEÝXEÑb7ºî¢èBÁ­q#¸v!¸QÄB³0.,i­P¢‚Æ4)–HIxù÷’yïÍÜ{Ïq1ïM^l\n8›áò»÷œ{îï;{ÓÿFjm\'¬vƒ]í„÷[Î]r_ÌE~–ýõ‰¹ï§ÓFy5Ž±‰qÐßm\nøõ„r/·3ÇD.Š^ÿô²½œ–î\Zt	ï(:Ñ\rJæ•\\ß3¸¬ý¬jvCõ#2|¡@!‹ÒõB!àÙí¥¾3UÈëëUÜNÒ‚ƒ	Ç–F’ZÃV.d^Ø,”•Ââ7–Ï†¸~sÐÛÉl¹…XX¼ÃÄs¯qµ5Ê–6¨Ù„ºP%ç•á\rÞÏøò»™l°ßJÎíúX»‘\ZMÒ:‘+ÓGU%xGÞÞÁ»bO¢>¦ªðþ’w¾(pÎá¥dç.Ï	ÞeF…Áˆ¦7Çxü@ÆdÚFÔ|åóÎç¨Ù—A¼Ã¹õîDj„UŸr#Á©)…fwq½=\nÆ2{^Y>#[K…M\'1TqYàäôÎøÚoQ¹gô f„\\£?´Í}¼vfÒ>IDÀ\0I­Fòði>[{ô¯¥|èÓÔHe¿æ“^]Î%Û£´?O=­“y†ÎÐ8u%À{€ìîˆäo¢| ”Ï!(¨\nsw7¹µÚâ©¯·ùåÎ:óÍíÊ%zw3‰ò“j¯NU\"…€Á…2ïÙw¨§)ipsÍÓZnEQ0=Wõè©êDªUBP‚‚È½à‰è¸ÀÓ\'Fh»€\Z‹ÓÒ¦ƒ(AQ=$ª¥PPµÚ[àC	¯à‚Rá›k+-!à‚à‚”ãŒ€@,Õ‰zžÜ+¼à¼PˆâE¹>ßÄI)êƒ„2TQˆ«\Z‰BdJ‘HËÜûsÞz}Š®ó}?\"h		)ëâ”JHT1DÄ”ãØ.Y rfÑÓÕ2^:5ÃwŸçÇgz©«*•+\rå(ÎÀ¤f®ý±‡®ñá‹sØä\núD½ÞÚŽ®ö¯ß\0¨”\'Q£Ì¾NÞu)—§>Â›cÔãÚ¨¾ðìþH\ZÀ‘ùªCÞ9‚m4i›ƒˆ\Z:;Ç«\'r_šè ï€ºípåïó´š	[ë­µ6›‹®/t±Oî‰ïÿ¹ln-Öß]X8·üçü¹o·³ßkÿ±f~!v]Uÿ­½÷¹sïÜ$Ó©tb2™ØPE‹M[Ä–VEú\"*Ò‹ÒDA,¢/Ö7ÿ<XÑ`iQ|*öÁÄ¡µ\"¢U\n!Š¶“6)&i2Ifî{ÎÙ{-ö93÷ÎÜ	ðÀæœ{î¾û|g­½¾õ­ue<£nM”ã‡˜-fÆz47¨õÑa²¯£}x”LF\nU´¼÷¢Úé„=£ÆÓÀunâpÜÜqo2ÎÖJJÆóI¹ßÌD-ëÅÆLjGvº\\ÞíC&|V&½¥ä·£˜>YkÎÁU2J…2±™“µeµ¬¾Æœ0×Ðæ¯Go\nÔÅõ© ‚^áÍb2s6übS+ ª‘°¬@¶¯õYà§ÀWv\rj%Nó%1½§\ràöa™-3Ö:[-$Ó”¡ÇEä)3;·+PïúÍ7\'¾a—>È¡<Âj˜Ã‹ÐÂlf=ô¼0„žD„õh£²A„Õ:Ë®YŸ8´ú:~öû·\\»º²è‹ÎŽ &¢ïí?=?mÎÇC(^JšõI•aKÉA„‘:jÝ4……3ºÎèco!ÌÎx¼÷\0^.¦ï2xgW–\Z­—Óæ¼ŒT/¸P|Â‡@èÌ0×Ì;‡x8‡Ùp–‘ý©ª˜&T–)ÖYpÅú7\0´\rT—¸Á”ÑÜFí†ñi­õ3}Ð«âRÄ|@’C\\£cÚ,Ò¤7³TjGÅø°ïŒ«\\/†ÛÔgß‹tœ1K’÷Ï¬ñžÎ Íûê!ªòñZŠ_Š/¼¸€8‡ˆ N&2ˆi¥ª\"¢õù@ü”áN^ŽÞª»œ.ûœ\Zö¹\Z}F;ZÊ5\"O„Þ(§«>\"‚‰\'8ùÕm¡üý|¨´å»ºÒ‹87†©Ir\"x1^÷Gžzq¥{b¥ö’*NòÞÔ&ZgDQÙuùÄ2ðyà¸Ãîô¢ÖaµêðG×ã‘»$VéÎS¤5Ä,ÕÔÒe´g	·çVN<óäjžœ‘DCÁ¼<<7-¹ÉÌk‡Á~‡a†1ø–Áí>Sòz\'œ]K¼ue•þ¾yÜâ]œí~€ÿ*øk¼ƒpè^öÜ²À…ëÞX))¼ßT<†Ü‡ñ3àZã¹¯îH	ýâ_ø‘Á»\\å{ÉZÍ	xçòY25îs5s3ž3k‰¾y…íñ·s5Kûç8ÐÍìÿßÊçn@C¶-këB5Ôø7p(·¹ÏŒ4¡Ñ¢x¤YHqI\'pÕ×†BÁ`Xòó—¯°´GÞÆÛejÚ6‘	tÌmÃÌÞmp;ðæP¶\'kBÁš(r\"XñÉ\"Tl£Å!€sÂ¨ŒVSV‘2*UÊù¯å.m”ž5•A¶Ts†®ÁÞ©{*5Ù6:99ÁÖšõx²NÏ÷ŒZ¡²\\xk2Žß¿Ÿ@Ó4l\n*j£ç5\'ëæ÷mË ±`ô¦FŸ“fGJÞŠ!²©i¥ÙWíõòòy\'rûbŸ:¥¬¯lráÖ•‚l\\7®`ª	P­¿]Ó:’1î¯Z\Z_¨?Û¥?Û´ÆRÃê[jŒö5TuêÐÖ\0ÁÅ:Z\\KÚb©æÕÔµ¡¹i\r“-]”ñNé4‰²åžªQ¦‚Žœãñû^äÐüs8	€±V-v,~îÁ~ü…X»‹[Ý·—¶fÛüWi[Ms£O[¡e÷8‚|ïá/²|ë1(V01œ¯1 ×9ÏZ9øLÉò…²ºô\r·CI4Nv9´ush;ÌPÓíclŽ©1ªgxèàè­0,âüITg©c‡˜:¨Ä¿F9úšFO„ÝŠyÛõÍ)RÄÕœºtŒ—ØÛÿ©Eç³¡5*UyžÁõE4É+[AýØù?ÁÕrixÄ}ûÕ–~ú}wÌ=pw¯÷BXñTå××\'å¥/¡xæ\0‹Æ»ë³Ä\0\0\0\0IEND®B`‚','foto-jogador.png',6464,'2012-06-05 00:00:00','text',NULL,NULL);
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `player` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `association_id` int(10) unsigned default NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `invitationHash` varchar(255) default NULL,
  `invitationDate` datetime default NULL,
  `invitationPreviousDate` datetime default NULL,
  `invitationEmail` varchar(255) default NULL,
  `invitationMessage` varchar(255) default NULL,
  `invitationResponse` int(10) default NULL,
  `deleted` bit(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_player_association` (`association_id`),
  KEY `fk_player_owner` (`owner_id`),
  CONSTRAINT `fk_player_association` FOREIGN KEY (`association_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_player_owner` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
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
  `academy` varchar(255) default NULL,
  `leftHanded` bit(1) default NULL,
  `coach` varchar(45) default NULL,
  `showContactInfoToFriends` bit(1) NOT NULL,
  `phone` varchar(45) default NULL,
  `avatarHash` varchar(255) default NULL,
  `avatar_id` int(10) unsigned default NULL,
  `smallAvatar_id` int(10) unsigned default NULL,
  `style` varchar(255) default NULL,
  `site` varchar(255) default NULL,
  `deleted` bit(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_profile_file_2` (`smallAvatar_id`),
  KEY `fk_profile_file_1` (`avatar_id`),
  CONSTRAINT `fk_profile_file_1` FOREIGN KEY (`avatar_id`) REFERENCES `file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_file_2` FOREIGN KEY (`smallAvatar_id`) REFERENCES `file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

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
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `score` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `date` datetime NOT NULL,
  `set1Left` int(10) default NULL,
  `set1Right` int(10) default NULL,
  `set2Left` int(10) default NULL,
  `set2Right` int(10) default NULL,
  `set3Left` int(10) default NULL,
  `set3Right` int(10) default NULL,
  `set4Left` int(10) default NULL,
  `set4Right` int(10) default NULL,
  `set5Left` int(10) default NULL,
  `set5Right` int(10) default NULL,
  `groupingId` int(10) unsigned default NULL,
  `time` datetime default NULL,
  `winnerDefined` bit(1) NOT NULL,
  `owner_id` int(10) unsigned default NULL,
  `deleted` bit(1) default b'0',
  `approvalResponse` int(10) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_score_owner` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_player_left`
--

DROP TABLE IF EXISTS `score_player_left`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `score_player_left` (
  `score_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`score_id`,`player_id`),
  KEY `fk_score_playerleft_score` (`score_id`),
  KEY `fk_score_playerleft_player` (`player_id`),
  CONSTRAINT `fk_score_playerleft_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_score_playerleft_score` FOREIGN KEY (`score_id`) REFERENCES `score` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `score_player_left`
--

LOCK TABLES `score_player_left` WRITE;
/*!40000 ALTER TABLE `score_player_left` DISABLE KEYS */;
/*!40000 ALTER TABLE `score_player_left` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_player_right`
--

DROP TABLE IF EXISTS `score_player_right`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `score_player_right` (
  `score_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`score_id`,`player_id`),
  KEY `fk_score_playerright_score` (`score_id`),
  KEY `fk_score_playerright_player` (`player_id`),
  CONSTRAINT `fk_score_playerright_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_score_playerright_score` FOREIGN KEY (`score_id`) REFERENCES `score` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `score_player_right`
--

LOCK TABLES `score_player_right` WRITE;
/*!40000 ALTER TABLE `score_player_right` DISABLE KEYS */;
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
  `deleted` bit(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_user_profile` (`profile_id`),
  CONSTRAINT `FK_user_profile` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

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
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `userconnection` (
  `userId` varchar(255) NOT NULL,
  `providerId` varchar(255) NOT NULL,
  `providerUserId` varchar(255) NOT NULL default '',
  `rank` int(10) NOT NULL,
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

-- Dump completed on 2012-12-26 20:40:40
