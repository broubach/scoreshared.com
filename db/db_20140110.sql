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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (4,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0h\0\0\0h\0\0\0µ¡\0\0\0sRGB\0®Îé\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0tIMEİ\n2ŒŒ\0\00IDATxÚí›_SWÆ	$$‚bÅ¿j[­­igœvoì7ØO´—ùD¹ï7™ŞuìŒøÔŠ\n(\"B’ôbŸÓRE+aØÕ÷7³3IÈ&›}Îó¾ïyÏÃ0Ã0Ã0Ã0Ã0Ã0Ã0Ã0Ã0Ã0Ã0Ã0ãó ŒÂ(8´óƒ¬Él2iq@µRó_Ë\0c@È#Ş€ë;@h\0­j¥Öİëó’J.Åƒk8	|\rœè5$Ì&°,\0/€-sĞ;GÏóÀ¤Ä™(ï	ôÖèo‰´Ô>/ÑNÊ¥Ğ5³å\np\n—0£\nsèñPÎ\0«À#à>04ÍAÃwSFNù	¸\n\\JrÅ°\rt¼WĞß\'ô·%‰ó‡µ“\'åR\"Î(p¸|\\Pq°ÜÏ•w2\nwg€9¹Í=ï\0oôgÎŠ„!W¾¹¤=lH˜;ÀCàEµR«KĞ2°¦P6ªsËÊ[ß*G­;,íŸqàE¹à¡Ä¹­b ã½K9§¡’»!\'•$r¸¼6\r¯8˜Ö1&w,(é/W+5_ª•Zh‡Qğ\\¿1§‚bJ¹é¸„¶NÂ‹™¼nî¨ñx2(Î€P;À½·©ß›•`cihû¤µÕ³lî%\'RWs¢4şŞ´\\°Ë#M=Î…ÿá€Q¹°ç	ÜJC«\'›\"Ç¼UåÖÖ\rŸ\0&Â(Èú_´0\n2aôŞœ\n‰--sĞğh¯tl+M\'$Ö^Î™Vy](/ul§á‡çR&ĞKİì\"pVeòêó™‚æ@3:§	¬èœ–ï¼¤Î‡Òä —ãê&ÌI„÷QT÷Áµ…\ZÄMÓå´„¸4:Èu¦ÔU˜\r£ ©›ßñB[IÕ¼gTâ®èhy•å ı rzM¹î@F9è:ğ‹&¢§\0øUïqóŸm¹pU¢\'‘$]L\\¾1Ãİ›Oÿó·»7ŸrùÆLF9h\\…¼$XI‚Ì?(÷”$è:°üY­Ô6Şõ{}¿…¸c\r¸¥ùÌÀWÄMĞY=n{­¡’×yX#^jøK.L\r™¤8ç]¹@ËnAn„xÙ`Z‰ÿšïxÑÀ…ì—²Ê_óÄı»gÄÍÖ…¼zµRkÌõ˜ƒvß¤ñ\ZĞà¼B×„Q”X=¯CĞõûù5C¼D~¸£İ’@+h¹\"Œ‚U5XÍA\Z©z­,wÌJ 9å<PW¡P—(9‰‘¡¿›§ëµuœh9_–»ÖˆWVç‰—&V‰û{½$9)—0× 6«\nì¢rIIye[ájYó™\\U”Hn7ëÙuBà$pN%ú1{xmé`1Œ‚­$¹éPzÇÈ<\"q®ßÉ5\rõÎVÔ9Xöæ2#sSVŸÿJ%ùIÍNIüM]Ã#õı‘ƒ’T$ŒÊ1¿)¬Õèÿ7W(ÁoI´¶çŒ‘â ë=œV¸F«ÛS÷³Ü´¡p÷;°%%Ä©L•H\'èïk[\0wª•ÚÚ¾ïu®ñZ&Ş§pBßı\0xFÁëÁêîK¨HÏÛ²@¼cç6ñaïeÛ”3Ñ`¸.±®È·Tí™@šPÓQ¤¿ç`Xô÷Uï§ºòÏÓ¹ëatôWUDœ—0÷’ PRzq9å)¯”^\0\rŠs\0…Ê¦Ú@-…Úãô›«–ƒ¼R”“Üœ&O¼¬İĞæ½ª¿Oª\ZÃ(È)¤Nª€ÈĞo¸fM İø%qY½¶<ñşµ•úÎ)à²ò›Àö&º&nÌ†bş¸&¦t}¹0\n«Hèh”êô §Ãíİ>%\\×»¥ğú†İ!¿xÜæö£*µËô7Ñæ¨Î(„¹®·[²¨«bLÌ¾í¤ÔTÉë6\'fè¯šôòÒ0q¡¬­£®öÑ}úM ÑP?l[Éº­ğ3±Ïö!¹N¸çæ?K&ĞîyIh†Q°¤pÓ$^X›”“²ïiİì·ÅåôF=–ª•Zc?ó­ÏµŠs¹è¡Fğ˜®ï ä\rå¹&	ûï»DäÔ.ıŸ‡~=I™ \Z†a†a†a†a†a†a†a†a†a†a†a†a†‘Nşİ´±ñü\0\0\0\0IEND®B`‚','foto-jogador.png',15956,'2012-06-05 00:00:00','text',NULL,'\0'),(7,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\04\0\0\04\0\0\0Åxë\0\0\0tEXtSoftware\0Adobe ImageReadyqÉe<\0\0\"iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmp:CreatorTool=\"Adobe Photoshop CS5 Macintosh\" xmpMM:InstanceID=\"xmp.iid:E94F0620C4E811E2B287FCA54FD79914\" xmpMM:DocumentID=\"xmp.did:E94F0621C4E811E2B287FCA54FD79914\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:979B4EA5C4E811E2B287FCA54FD79914\" stRef:documentID=\"xmp.did:979B4EA6C4E811E2B287FCA54FD79914\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>šh½\0\0¹IDATxÚì™Ï+aÇw¤E¢”8i³Ië )7m6QR¸ºˆÜ•ƒü.®®h­\\$¡¤6?rä ö°‰\"»j|ßúNMÛLfj¶ŞwzúôÌ¾ïÌ»ó™wŞçm[Ë¶íDœ¢!³!!!!!!\nQ2½9æ×Õ² —Ÿ_Á)xö:9¿}¥‡OäÀTM[;`OÛòˆÊüªnøzRt”8[F¬!gf\n¼éwP\'à}Ùz<Ğz	u2Ÿyô9mÍ Å¡2s«G_s|™\"ôÈ<äÑ7ÌüÀ5f„P‘y$]íê5›äñ­IUî	|‚°€æÙöã’6B¨Êr½R`£¦ÿ|› ÔfAæŸóæÈg¯¤£P?Xu­™\"éæ÷¼\ng/ÉÍW‰€¾¦Úõ€u§û¾«tûÅ9Hƒe°¶¢˜©¨ª\\2Ç`7€Œ÷<_];£SÙN¹zØxaNë$äl,aŠÈ\"+:­¡Kn˜™\0Î/®u*p,U¹ÚB^ûÁŸù(nÄ’¿$EH„DH„DH„DH„DH„DH„â\0ÁuL|~ôÇ\0\0\0\0IEND®B`‚','foto-jogador.png',6464,'2012-06-05 00:00:00','text',NULL,'\0'),(55,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0h\0\0\0h\0\0\0’~\"ö\0\01˜IDATxÚµ	´Õ™¶¯STP Še\Z‚ˆ\n\n\Zœ”!JŒ¨€ ˆQˆ\Z‡¨%N 	¢ş‰+ét:.“^i“tÚh»MÌ`†îõ?UÏ½/åá^D³ú®½jÕ­S§jïşæıí}êî½wÎİwÏşú×g-[vùí·åÊ+Ï>öØÏrÈGqÇ{tP·ÃësÜq‡~éKÃ¾ò•ñ‹Oå+ßøÆ÷ßÕƒÎµyÎ‘ë<Íò´%K.¾é¦éW_}>_üò—O½è¢“Ï>ûø3Ï<îŒ3Fò´N8Âvüñ‡óü´‘#ëÛğáƒ¾øÅÁÓø7Ÿr\'_¤ùÚèÑCÆŒ9rìØ¡§6œWø\"çŸ?šWOŸ~\nİ¸ì²‰Ğ8şyôjÁ‚ çæ›/¾îº)\\ç‹Pİµk‡½öÚc=Zµnİrï½?Ç¿°ïÀûáıyÅ¥—N¸ë®™+V,¬ƒBQ[ºtæw^vÕUç\0HÚ€=ûöíŞ§O×£êG/\'LøâW¿:ñÖ[gğM ¹ç9U¼DLzh>ÿòÀ;î¸ôÆ§/^<eÎœ3y6mœÄğ(z)Á\"\0Í“ 6bÄ!^¤UKµ“N:JàN?ıX^D;ë¬Q\07yò˜©SÇÑ™3\'ÑŸ¹sÏ7ï\\°»öÚo¸a\Z\rÂ¹àöİwÏvívÿÜçv8ìÖmïìÜ¿ÿ~|Ä+ÀW¾©ƒ/l·İö°ç¡tÔh¢ÆñÈ#>õÔcx=À]sÍd€k°“ï8Şwß•´ê	÷ÜrË%tˆÁdxgÍ:ƒN3ì“\'ŸI<\rò R¯Êe4\0’¹8»chóºÀÕ`wâ‰Cxæ¸qCáå\ZàÎ;ïÄ/<	à`:(‡F`;:¶páäE‹¦ÀwüË§<¹wï® &på¸ƒî÷ĞU¾iK—^^^0ÑÍ7_rÓM_†AfÏ>“ÚàÁğˆ^½:ó¸”n]pÁ˜K.9o‚ˆÂÈ1bËQ¾ã¨øsÏd0èß¸©SÇ‚”@L…\'Ÿü…Í6lĞ°akä”‹b¾ãÎˆjxMàx8¬m;ûìQçœs|Éqc†±‡FÚWœ¥Ì‚2{ùå§s\Z<ø@$^8Pàà>…\nH»:È£-YR ƒ0\Z¼şğÃê×o?X´gÏ}Ğq€\rpŒƒÆ\r0ªŒ‹’+pprÊ£€CO„¹øâ/ñÔœL7nÜÑÇwXÄ3|$4U8NÄ®ªìF*ÄÕ|ÇcnüøáUÔè9âÓ¡+ Ô ‚&v ¦¦c@áˆgçÎí¯}û6;ïƒ\0&¼…Ûê9/ƒº|Kã¹Œ?¨ƒ¨í·_\'¤£[°	æ}H_šú‘&‚ª¹eËf¡.Ñq	ãAÏx>C*pĞÃ£Õ\Zí¶¹Ìx>€«âËıŒ(Ø…ã”S€SHEí‚\np(„†ÈtĞÂÔ$œ›ù\"œuÀÁÎ¦e@é«ã€ÚSÀ`k@!|Á :xõìÙiÿı÷åàèüO\'`u-¸ÀSiÀø€;óµ¯}µÔ\0\npô˜·Ò{€ƒ<µAÊªZUd6\\¦ÀFı	œÆÔzåtÒ¤p4\ràix\r%3eÊXŞÎÈÑ\rÔ\\°ã’!\n)qÓ ˜à£Á7pÀ)s<\n[Ôy4èTó2ŒÀñå^½º\0œâÍs!›×0DÀ«B;ÆøÀ‹ó\\Yã}ôvSTcUG:,^HXI‡/xíè£TJ®‹À©ãx üB59w)§èÖ\0§šƒİ‚\Zùy5¨õêÕU9Å2€W>ÿù^¼šç€’Ú¼ji-åÌi€òª^„/»¬°å0&p\0Š­Š À)¤ã±hÑEÜÏ·ĞŒ*ĞëÊñ4å+ğEÍÉw%j‡í_b7@^«²dÕÃtDxàÄ‰ğÚH}7Ş¢œrŒ;‚¨Ò¤È0ôá>şå:÷À­¼CÎöÙ§pJ0İ»ï\r¡àè!÷C#ê—«N#(ŠHdƒ=`Và8Q/òh*B\rp°*èˆqES“ÆEØsŞ¼óè£J§yŒ\0G(ªº#<ì®µHj…#\r]1thWyÒ?6Wàä8€ƒ‘‘Óh7“×lFca4ìVšûBèo‡¹ \Zà:thßœŞ/Ï‡@xâá‡¯.`=/ü	ı/ôúˆ[1%v]tGèdë:¢‘h°‹€‹švYLıˆR°VèÄÀê8´†ş„Wµ	@@B–Æ¿2`Õ›Ó> ›ô{µ§1R:Oƒ³”VÀJ›1c<ü¨“D7-ÇµNÚÂ}ğ\r/e°ÁgõêëW­ºîñÇ×\rŞKüÄ (ª6€£ˆî˜a\n\rŒ¢uÙ@*íúë§áš‹ÚÌ™§;ÔÈ)”Ğ¿*¯5`Wï—ˆ NoUµñ¯BªÌnà’ã\nã€à3$Ø‰\Zf—N™r²¨U“×”SË —–AG„wqç£^»ví­Ï>{ó3Ï,©[¹rQµ\"¤b}e:¤•c4Ø_‘#\r¦;9°ä¸zÈ\0”À·µI\n©*ãf”Z\r•DMÈbgµ\0JnMì?Æø;ı|CàsÏ=¡ŠLàVQ»ä’/Ù7n¦o<˜\0³Ğ©S;ğ:gÍš[¾ûİ»^|ñk/¼pGŒGp°wp«jät ô-Pö4 §øWÔJúâ 	…×è1İ¢ë€š0Ø‚H”šªMú«^0%ê/ù«4µƒÂŒUA;İ`°Ó¤òj$‘>€R)¯1œ¨]í€˜ûqhx2´#¤p|‡…„y>4>ÿüm¯¾zí•Wî®C\\‘[çË—/€øÒ	Üv8¬¯×òêô•¨MUñ8Õ(¸£ñÈgÍ:]ñ¤[h$Te”tHòADã ß»™P¡êÍ%Š9òóAéĞ©Ì\Z{2Ë«u€õ~E\rû¨¨ª|•q…L:I÷0£ F#l\0Ğ€1¯½vÿ~ôMÚø@İ“OŞøÔS7y¤¶•[QŠZUâVã£¨n˜ÔÔq\ZPı5P2»Å·°tˆÁDï@OE6NÑçHÚCÙ‘ò8@ë)¬ÕÌRâVNÂnÆùZØ»Â.”cóñÁNÃÊÅáº2A?±È€2ÅªÒU€ÃÎ‚>Ú\rÈşùŸúÉO¡5(p+ªÍX™&\r.Ì#€êhUaCÄ“1ª½6zl¨ \r…;ª¼“œGxJ#PµòW\0UfÀ-\"°pœ.á‰\'ÖÇü	Â0µ¸)gUXŒªI5`µH+@óR„tŸ}ÚÁq&”Ğéˆçë¯/ÿùÏWşë¿>Æ±N¼0O?½Da8	…İà;ü\0œ½<Ü?a*ıŞúÁŞ1”ómt%A”@˜Š\'zgaŸ\Zàr=WôE{…[|ºz•WM7i1èFÉzÇ±ªìÌ\"ª`:ì0ó•.]Úƒ±*<Ä{quùËÕ¿úÕê_ÿúÉÿ÷oÓê0®ø#\r¡àP8F?LêÒN!”ù¨BBµ›&¼::ACLP»²©R©ø´¼%Í+à¢‹˜™~wêsÎõ*ÖÕpB®ÌQ); ¡‡Œk°sŒÑƒpœ\råˆÂnğ\r8ğ®\r–¾õÖÓo¿ıÌ;ï<Ëñ7¿yº°{îVì\rCpğßÄ˜\nô\'wd(jpf`{Âíºİ\nÇjRíaĞÏ#øÕÆ¯‹ˆˆ]² (Ö:Ã~Åæc\r3ø((‡=1 `‡â;#ŠéÓ¿$Àe¼\'O>IA2ÜdN\'Ù|ï½çÒ~ûÛµuÕ	|äÙ\0×«Wgìú’Oï¹gN’—4€»òÊsĞ(nvœ+)‘;8òbEcèĞ9·zho!Y©¬\ZÖ«	!=á(d*#aìFòÆhÀ¤9a+\r…ÀM:ViU`‘V Ãª\Z6€ã»ï®ııï¿ó»ß½ğşûëşë¿»‚ãt…Uvx$xa|ÓàR1I™‚‘õ€^Ãtâ£+â€%Á÷Ñõ#¸ƒÏy%ÇRÅî©²Øo¿N\\áS>Âµî×o?qtb(’¥Ö •ıí*9%ÂÑnO£ òQ†GLyZLƒ\r@Nß\0œI¢¦¦ã™t[_\rşÁßùÃÖğÁ‹¯éİ¸qíå—¿Nã˜ĞVN8Ğxb5\0vh·Ù³ÏPa„€=;	Ó{´jÙ²ù®»6Ûyç?ó™íiÛo¿ç­Zí²ûîE&º}û6úG È¨»0KXµ*†~*d ÀWÀÆ\00Œ\noW+ÑW˜ŒtÀ …û\r¡†9Öƒ•\0e× æÆè*s‚bÈM©Åÿñëÿô§ïşñß\r|uë×ßI#’\0AA$\"ãAfGOÎUpqJp;Tj(È0@qrÈ¶İv›m¶©Ûü«\r¶hÓæ³íÛïQrbºØ@O±2¤otDÊ/4Qkî7Å¨íóí­[·äáÍ›ïÄ[Z´hN£3^äÈˆ2`\ncò4øÚ©;İàr\"©\018Ş¢/Ÿ¢Áş÷ÿß_ş²‘öá‡/ ğÕá›àÎıøÇÑpğ°x$ÊŒÓ¶rÒï«\\ABáy(1‰B×a%úG¿·ÛnÛ¦°ã¯Y³;È€û:vl+Ùp\r#™ª²\'èA!+Õ™t9‹#*œÆ}ïf£Ua|ĞD>ûÙ]égæ_Ìë:ƒchhª•á<Ÿ#dÂqûÛËàÅ1ØÕáÎÑ~ö³GúÓo½ñÆŠïÿ\0—Ñ?ÃÈfÆú®».C2,ŒšbúõëÁm_¦L÷\0pa´é(mÇw@T¡\'eî„C[xÇ XÍE| FÓÀ)æô}]‡m@#’Óëšøã£vØn—]v;nŞk¯=	x*…nìÌt\n2Î–Äà‚\0Ñ_ÿºì8şùÏêŞ|óql-íßşm•\r¤x\nåÑLy\rÔğàĞn¼IoVwÏi†İøbèYÛ¶Åœ.z\r¡Š¯#,Iïå¸¶mwKz\Z0 §BTm²!ª×úôé³˜óÉ|»ZuûíåômªxyÂhÑè@›6­öÜ³uæç\r:Ğ\"XAóªv¼š^ñRØƒ¹nİíßúÖ5ÿû+ÿó?¯Ò€¯î¿xŸ˜#rÂÑy<Šò}¼9NßmÁ‚øO\r³€‚ù³XÊÑ8°ÏŞ{·\'t!	îSïpÁİvkÑºu«p4€»ú¢¥fãŠ†j»wïhÎ‡¯œÃÃóiZ$0â½&×y·Ùø\nJ,%Ç© C!¯qÄ\\Ğx;½âS,,~+Á%=šV`Ùˆ\'h\0ç\\ˆ¸Ä[ªØf>Å¤šq5å6€5úDÏ †®C@Âq\\lÕjW‰ÑÂÊqåÄPçÒÈî/Ø	œ6ûÇñØ§D­ù:9+À•¨íÊq3@ëÑÏÒwé	#ë!:Ğ‚¹ƒ¹ôŠ˜àÀã3sñî»kV\0gädüàÌ{.QJFe4E-ipÊŠ§ pÍMã‘h@á¦—ô[×˜ÆÙÂ,ÎÀêwé‚}Ø‡¢1é1.X¼°À\'ppÄó-9š‡¨F«¶ˆs4šÖ@ˆû$tBé\0õÁ8@ j8ˆ8Ğ?òjÈ\r0Á’8˜®.¨¾¢á,çŞ±›Œ	6°pDÜÂ…“Q‚<ÚÄ$ÈˆÁ•03Oç:\Z²©¬\ZY[°C%iaÛµkyÕ­‹+pj·\0%\0ÇàÍ€HPã5ÃÃ5A@^t&.s<ÎHB!8Î\0™eè	ŸB&®>ìXVÏqÇQÔĞe|Á0íºë¦DT	¸ÁÙeXL]šôÁ)ÿÒã¦L[Uys¦ˆšÈ\rM\'Ó%~Â§8‹`7€@Òá&FÔxÈæ®S´À–¦€QAù€šçğ„Ó’VëÀ(\0gë©p	o¹ˆÒ¿ùæ‹«¨À%OBCÁÁPpDàx.¸¤ú(³ËH>ï#x†“\r^Ì›¬jÊ\'€Ze\nìªº±‚}¬Ò€$‡ZÔ<Ø	œ®f4¾N•—7ÿãùè8XUSÀoä4À~ú±‡\"BhnâÄV†aöÿñ”ªÑZ±Ğt]1DT1©™–Ç#A—}¤¹\Z^Î†@\r\\uªÜ(4¨UxÓ¸Õ/AğéñàÁ›Ø„ôjë°›ÀŠfG±m\n;øš±t £·øNÎc\0!ĞÄ‰ÀYyˆÑYn†Lş½âŠ³ˆ¬j{ë­§m¿ùÍÓ\0‡0®\\¹hõêëF\')¸RÖÑ\\®UYeîà`x$´œÇííœKSL(Ä¿È0i1”\\€ƒl¸UàDÍ¬IRI\0p&[ßP3Ú¢E3şÓ¼±êÇñd¿…‘E!è¢Z¢q3æH˜	µ–	Í˜#vW\\q6FŒĞ$p4D¿fÍ-\0‡6#ˆÓ8˜şušY§Äñá8iÒ±É’æÍw®á8à1aœÿ™ÏìÈGpÀ¡¿Æj®))ƒfã~Œ¦hIÃ‰\Z	…µ=1şåNšú4ó~Œ\rİÆ@<-Ù„\' OÁ”A†ÿÑpğš\roŒÖ®½•¨‹ï\0<¶ÈÎô/LçL3ù\noªàA´Úª†İè(4ÓïÍõ„Ym»™†L¦7YbÈÇiOKË°m8—+h‰ªlæ-`Ê3y¶Õ9f9¥É‹€£ÿÕrƒá¢öc\rjµÀ!ª`ôüó·Áw<\0?!®5ˆ¦Sğ ‚N8`ÎS™@W®fÍvŠƒT Q7ÀzTCA3’ÅWP=ô~üøáNM: !™ŞÏ9…rl%b|šË£àn5Ö²å.Æ6É’Y@äÄ./‚FT\rr:}ú©Ö”@2¹eeÌ°aÃÒF€ûÏÿ|Ÿøw¥ÜÃ_e\0Ì%rÊ	W¹lK—^n©%\"\\ÖY3jGÙ×şi¿Ğ;º©FE„fğ2iÁ=ˆ0_GÅ _v(ÑÃÊ4ÍĞ¡ı•VÓ0È5ÚJÑSy™D2ZĞ1æ¨ì§–Ã¨•iı£œCV,çögÏ.J˜Ì[b¯\0K#À‰\Zì&pX|…wğMş5o:|eì5oŞ¹ 6cÆiÜÓÁùj\"…\na%ãù (p!•O‘ ë<ÖC4Ù—ùC­ƒÄxË>ÙÇú\nnü[†\n­Ëyø½Ìn‚ î›ì&Xh!\0Áãp‰•šN\n;;õÃ9ƒãj\\ßMÀÑJ¾[K±|ù‚+b€¡DËğè£×â ÜsÏì`‡kb990¼M°b9©˜½@Y&……ršyÂê5³¥cŒn†®§\"ÓIU°³2™ç36fâÌeQù:sMe¡Q».]Ú÷èÑÑj\\:fêÜIXg]ê‡RëÂ¡\ZŠh¼ŠPVœCìæ¨Õ÷Ûß®µÁq÷ßLÇ´Ç=ğÀU÷Ş{E×Äµk›\r†İôQ!ŒN–)Y3,y‹êiÈ PÓÔÀtNû#M™çw–Ài \'\0ÏDòNœÜ°%5o:9(C‘>Îi ´cøkVm¢%LhşübÕˆÀq{\nùÔS\0‹A€I7Ğá›Õ\"üä—´§(¼Úàˆ$0Œ\rÃæi•ß$E, ã»²›À9!U™ÃÏÊ¸Ï ¾>¹/8Ï`Ö wï.FZñr\0:İs€Ú¹ç8mÚ8to‡\"¸ND~¹ˆ¨¾øâ×>¸÷Ş{.ÀAĞ{Hâ_‹ğ©	pJ+ÇXÁÕxŞÿ#zù hİº4gô¡@bÀÂÕ:©CÅàL)ª)ğj¨>¤´?EÀÄó¬	‚¾ÈàÄWÌgVe\\ùzü	FXÃï\\×œ9gA\Z¨MœXÌE Ê_{í¾U€#êšûï¿t\0^	BëY¯©‰HĞêº\n˜57cÆxËhy%p3ªetÙ+$9·BS| \0\Z˜x‚!G´ãlÕ„`¢f-€¶Âùš{š¹§o´›œ8Qi°É‹Ğnğ©ş <ËsŒL1Œ÷”)cM%Y¢RĞÈÈÑ1şÅøéO¿õñÀáÓ©Ë,¼çøÍoÎÃq­W–.Ù°Bkªë*x_ªFĞë\0W–Z®»UÎÄà\nòâ’:zÃÎŸ^jcy ]tS&6UX]\rªéDÍá#ar~Úë®O°QæÅˆMš4âœsN`˜AgÚ´StßPëV„C5^lÁ¿¼y°õ«*px$XÙ\n°V­ºÔ|p^V~X¿hÑk¨Íšu†ÓºŒaYpyŒ,?Al\"4TÓuğe´]S…ZQTmƒÁÇ¹õHªëÅUà$¨9fÎÍßÕL•¢%õÎx2¨ñ\nëª«¾,¥GAxYÍ6MªÁdKÀÑ,‰ ŞB6ùnpiæ!§6SHçÍ;^+ëà&8¡K,õQÙ)n¹0¶a\"ú!ãx“î‚\ZÏI6\Z\0éà™©S2ıÑ£ëëñj	„š+•;)~0—gg¶R[™ò`9nóF8\0ra$á&Ä\"€\0:qµÆöÊ+wá?ùä)+Uã¡.K1Î¿ä’5+T·Ö8*‰–‹Z}ÆkHu5áY„´,µ«¯N¤÷<5çœ†Œ&pÀ–	˜CÀÎø_tR°o9åêğ„Ñ£‡¸8(éåR¥¢\nÂ¯ì€ˆ\ZÇFƒ­MÀUëpé5knİpƒ—-+Jl,æ7	,pVÃ¤hR=—d}%¸–{óQÖìù©¨!¡.m\"–6™ÌsäP+,9ZmM§›Å\"Õ±š\ZE+‡i|÷”SŠÅqH€…ÁÖ,İ†÷Uph7×ñmÜ¸ì\'?yä—¿\\ı³Ÿ=Ú$pUÔhÜıíoß\0»¼Î‡–A_Np_Â>a\"30|j ¬öÉ²«\\•S%ÈKäh˜/ò•TõgI¥…Ñ˜–Úe!fCQS}e§…\r)/5ª~«EJº»@–¥J¦’ìŒšQÅwƒğ1~÷»šî¿ÿ{íı÷‹†+g5À\'X&a0³*Ü…²@qäßÅ‹§˜ª‹›’J`kZU(ˆ°âÌ×±ÑÆp<eÊ‹\0=ÀW¸G-éêNl2]5†MÑk*	kÖLYƒ¯{‚üV&ƒ:Ppë\noøñ8`ÙZà`:P{ì±kò’¹œœ	t}‘E‹. Wjº@[¡CÓ_ıT¥3a.´°6u:&ù¢k¬é(>6Ö\\à@Üt_A¾Äë”S†3«±.%´PmÃ‡×®|\0q^”e„D®±Y#»iRaüôàPpHë›o>Ş$pâOÒ,şBÂQpÚV+çŠªéL½_WÖXºïªMÓS\'Ùà/jyK¥ŒƒBaHx>Åïyâ‰‚Çy>ßEğîÔS‡‰]ÖÂ;ÆÿZ†#èké`˜.î‹¹#WÆ‰ÚäÉE\".Ñƒ£çZhtæ`İºÛ±¯¿¾¼Ià™¨Ñpƒá8ğ‚$½ß,XRZk ‰`¼ØÍ5½åÄk}‚­…Fš8ôY¸ØL¥£Ï<³„w©ãä8†_àµR©4A°³ä‡†U=M¤Q\Z“B\'ºRÄ„\Zz ãùN› g,8ß€sİ2…5øê_ÿúr“À×ş°Ş£%s´õëïLµ4\\PºÁE¡«q¾ó®ãA8.K…]šJ_­Æÿ2N²æÔğÈ	7‹é.ƒ‚\Z†ú.wÆÑ5‡ÆÌ`À¹<°»ş.×WZe7İF´›ÎõæN÷©šU2hgÈÉ\rRÊÉ[o=ÕjõÀ‰šMìPyğªé\n\Z’ûtƒ]W¦Üàz\rÂÜ¹çE0’êÎBÀ\ZVå4”ÛJ¸,bîÊ0·U@÷Y_Q]µëúS\ZğO¶X‚øì!èîê¾\0*pz¼F,.=€èr u\'ß|ó‰- ¶‰ãll–5›ëeC¼“Ÿÿ|¥ú(Àimw\\sÍ…P‹kÆ0^vÿiPèR\Z”jIsUáG=7¶àßD²’İÊ…®ÅN/(>×óœrH/KLLU*°1.ÄDÕê™ëNºÒ¶š…èq„ôƒÖoµ¸@Ôşüç\rùËÆ?ıiC ä¹§mMØÁQ<ékjXı~zošDàÂB7;\0\rzYœ^.Œ×ƒ“xW—º¢Z† KˆË¾ˆReº¬µÑƒCKê\'ğÒÄX®Es\ZÏœ#œñ±m.‰š-5›~¸j<² šÑ”ãœ²8\'Xã»Òïc`õ$\rPŸ}”TÓŸÖùC§¬¡çµÕÅ[Î­øi*òLäZ{^m)Z¯Y\0!ÓÁİ=§ÿh·®ãİZàª¨…İÒÀîo{}‡31—<p*\"”S€£O8Jtv<“j7 Ë:WYx]nò±\\£gë·RéãR<a×&ÔÔ	›DÒÂ6¬È<,+	Í’\'#ÂÈ1Ş.}pö½ïİ»µÀU¹,çÎª××^»O3~İ”Óùó‹Ğ\n!5Œ&bxm¤&–	…ãªË8Lf”5hİ»víà\\„…|j¦ŒDÓœèAuwú1p†9Ø¢×ÜÌE­„»CŒw´;‘Ğ=·EpK–:Îä£ œŞ­®Ê_+\rÔho¼±B§œò¦$Ëğéú“šBú\nCII™q< «iLÌ9c	1×3Á±[·šİ¬öĞƒ)³áfC]«Ğ0åZ__’Vè«%U12gœqœ;uêØ2L,6PQÇ½ıö3[œ\0ÕàUEöÎ;ÏKœrŠ^ÀÑkÓº\n!ÕØ‰ˆ‚™Õ.jˆ\ZÊÛ(!r²*Ø¹ì!éï^½:g&Á:ag²r+-Øe}\\–²*­ê„	#ï±EHIöÑªr²yÈÇ\0WVµ²¸ÿ%ã‡2Ÿ>½\0jéœ9E.3ëí]uæXÈTF²\0ÄdıxÉ_p.ç–®wêÔ¶cÇ¶–éºXÀ•ÆVíŠã€=««çŒ·’¿ôzÒpÙµJ%Œ)·‰(r$D`H	L!î±¥ÛJÔêRÁ.Ú-q‰œY3|]7*°ÅáV\"ô•®§UucS<QØÚP—\Zr‚ş†rnv\ZÌÒ}·‹±9	¯yi`·¾Y}“ÂyĞw)§Õù\Z¶¬\Z–=ù’‰s‚æŠ”í\'\0nªáµÍEõï;m¢‰ñÁƒš[Âé˜w¤ £Ç£uÔÁæ|’htjÎı­L·¹lZé#Ø\r ^Î™ú¯Ó£‘S‘*—dõµ–)ÚÍ\\Sf²ep4ƒeÊ¬WÍH£jĞtºôÏ?Û\'.©ïªjÜ·aÃRãJ«Fp>¦O?ÕõO°=\Z·Rí1@Ù1……|²ƒ–îä“ÒeÓ›å[®”(-À&ÔœÍ„¼f!Ë“ªM•*¬§CWİ¡\\u^Ì]”^qQf.Ó¡é\"·Ş¤nÒqU©¬á8g+şå_8¢ØMƒ j)=0BB4ÊMjé\"@¡ÁiCár±G”¸“eb\0è±èD¼¬mpÉß¾ûå\0\\‘İxZÖºêÜ¨IùÈ·\\6hĞşG=°!IW_6^qV­¢éĞ?˜WœÖO\0\\²FQ³½÷ŞsÎ\râñ¢Úª³3ÕmÍ”;€ ÂGsá#Ä—kgºÀ\0m½\nË¿¾ê5îïÒ¥½¼fEˆ+½`(œA]ÓJ±§uÖhyyQæ²‚áDÃC]vÉğ#=Nm=j\0·yËê%Í‚ënxx•Êb$ÆÑR€s³ˆ±$«\\Ò8ç7Mrø•c¤KaÒ	Èzôèè\0çÂx°hˆç¬Ê©óĞÎå&œ[›”M’­3†5ÍéÚr,‘ùôÀÕÈl8n]µê:÷È08G<Ë\Z‹Ùd\né³ÊÈ$ Ù\"@+×\0BvcÀ]Tàæ=N˜X‡HÎ³‹·,;­´†{zgŸ<PæE¼Î]V\\‘\Z¦ËÖ_™PZy;À¡æĞEÿpMaÇ­èNç0F¦¶Í=¸³*VÉ¡Œà/Úİwoé²*€ƒ˜RÅøÑ]é!ïºÍ°†é€xdÆğ©¯)ì‹yûl¡aå>òu–à1Z®˜ä†ì÷Rİ‹I¾£Ãômc¥ySÏ[®)¼j°#†µ^Dÿ#óO¦³İ)Ãİ°è:´lÙ|›mŠUîkbVö)KÑ]^Öfí[-œÑNáSâ+QÜUÆMPá2+dimÛuåî(p±­I«g!DT?j[«ãrÙ†ãÌŒ£§ª›ÈZêşkĞæÚ¡,ié >æ¢ºŠŞxõT®ñÛ+kìsC6EÈ’Xë/­¶Ûm·;î¸#”•HÜúºufJjö·\npÆü7.û¿–ääÉ\'oÄõÍL»Ài¤œôDTñ×ÔÖ \0I;ï¼cÖB›Ó–²ºNŞUF.÷îÚµ½AŒK#R\0Ê]—*síºëÎ» {‡Š5—<\'¸AöoQTÅ.©:İ`Ôë\'•Ó¸*CÕğ×ævã‡?|\0àÌn;ÅÙ°kÛĞìĞÂ »7©ˆ@j³f;¹TÍ‘®Åõ\r(Ë\0M¶½p—Jİ]—E)w‚uÍrT°sÍ‡GZ´h&Çñ4€c«»«Y³“Ä:}¶Wá“¢Ö8Ç*Ğ\Z…oÎœe€3Á-Ç¹—±ÅÀMïSÍéÒr.ÂVÈ,\'Àçê_°€ÅÜ€¯#ì\"È¿€(7¹Ì:kÑe]Æ=íÚíæ8q[!Ç´V·N•œîÇ-L×o-páXO6ç>øñ±Ëıà’~Èï.Ô8 )çël-¡v>XĞ{ØA»#VêÊÒ-N·Â_Äi.ªæ9Ñw\nµIZVN3\0p( ›H¦Ä±(8 CT1ëŸµF8.^[uıy\ZWV®\\ä*5êğT›bæéY\\}+)qe·Ğ ‡Ş}ğâ4‚â)eƒvÎı×õºš”lÆÒ³g\'—iÆk”ŒÒ|Q’šÈl‚\Z=×+ØB!×V—ğ 1V\rjùô7Vhˆœ=©îg¹¤Ş|¶kpt¼\\0thÿ¬gÁ\rÎª~7²†Xµ¾ö@Â\rtVzõªOp%!Šµoßîe¦ H¨T€ëWİL\0BÁ}\n³ĞÇ¹=D\rëm¦[åÃt®ªnúæ>[îËÄ°C³Uôn6ï\ZmH*{ÕÖÎ‡éš™+”„ı|½ÜA±‹ûï”IºÎ®9Í”_ìÛ·›Á†Õlúå†¸fR9şâO|:Ô>\\6ÕhÊ°»‡š?gÎ™I%5l¡×ß”¬‰L}×ìğÀ¿PÅP»w„…3¢lÅ™° f¾ËÀÌ	‡äNÜHüĞC{[Åc‹¸‚‡óÓL1ÉÈ9ax¸Ó)GtÜ§Fí#ÀU-CµU-¬àşèGßDÍá7ZÃ‘™À¤İBA~q_È ßôØ*\\\\b¤P³r)òWlin†¼s2`Àş–b‡ÙÓMÎŞ¦ğÜ\r´l(›Ò¨~K:nsMi­â‹muú%åjæÄÎµIÊ”yèä#T›ëY¹œj€}Ì EıW÷åJäàõrÃƒ.™´7ÿaĞÈ¿äÙú4‚%ÿÊÎN*ª.>µvkÄÕ<4÷èâqå;.9s’³ñô^\r•båN‘qs.jËÜe6Ài\nÜX¼ašMK²²ó”û/iC\rÚß9\Z£¨ü^FVV8-|ÙÊXËëÏ2¸}âòåşÔ>Âq:t5’+pœÜ¹§dæh\\u`ïÍÍšÛĞÀeÛ\0#3¾åf`f\ZöoWÊc‡ÌŠ£;k¸ÑŠ:>­¨qT½Ò5]rÎõ8~&8¼İšŒUkÔ\\ ƒİûï¯8äÎ¹ªù¨aÕ\"cäù‹fŸ¬Tºn.ş`™Í.}n~áú]³ì<=„“e’×pMÔ˜åŠ®.æíÛš5·üƒ¨mšÜzÔÒ®¾ú|·”¶>²Z„ànHbç\"ƒ§¸FàÜ>Sqv\'ÿì¥gæcï½Û\ZN™Ë¬ÎCW\'b†\rÃ>Ô…T©¹PÛ= y,Ø [EÁqnöó±LWÔ|TW3ßhèZE-÷Ü{ï«A«Å\"îGcH°Ó\\¸K…™şT€5üfÚş!µº’ÒÉmKæ¶Md–¹ÌM¿#R.àïïŒšùİ=½¿Ì¹ÎĞêÕ×ÿş÷ßÙ.hı¦TîgğöÛÏ¼ûî\ZËÏSlÙaªç,Ìñä©§nÂ°â[¤zV¯Ñ¬ôk˜3îghmjÌ˜£Œ10)e-S}XßuíŞ½£IÍÌá«1.°KìÔnVá©[óqktt,hä[Ä§„=?|õ{ï=÷á‡/iëâÛo\rÊ7uÖ¨[Sg½ê£^ûØc‹V­ºÎµI\0´ví­îì>š´W^¹›Ûˆ½LÌˆLçnŒî¹”*CkSşæô¿Â¤1‚n®×†÷—5‡rœC’Í54‘NHsİ*¼ fÜ¦®°kÍ9ÒóW_½1\0¯	67ŒÕózàÜ:9ÛÙºÍ¾¿U\04˜mš€æ÷2²=ë‚Àt¦‚•>Å3^»Ş‰U#êò¬4ä2~p®Úò75zòã¬Õ½Ñªå#1GZğ8ŞzÎ.0wç!îwƒ_îGÃÜxãt(}óÍÇ‘-Ï4\ZSÕÁ;6<ŒlmKËEwºå<?eÀˆİ½O¦‹Šië%ƒègK’Ì•˜pOÄ*š.‚H®;W§S³7ZÕ|»0VEid¦œ®å< yóx&š…Èyá…;`JÒ÷¿ÿüàú§	^}¹ˆrb7u¤ıú×OÖ‹ªË²”†£Áq²^~ğÆ\\¿şNä×)¢ıY³ÎÀ\rvšÊ\reôKtå,AsWçJ’¹nøÍÀ#ü)73?eÔY±ëÊ¦PL¦ËTaYÑ;Uˆ\rám}œí&Ç«5Auuu˜lîçßÙ³Ï„L¼«%­şË’„üÜ“?\"ŸğXçú´•+ÔŠi<² 5æîæ¯âùssçkå%\'`‡Cç/Z\\ê_äYcÈƒ\rÅ+›Zö×Wô\'‚Q\\hkŸÄ+•9–¶¨§9%ÙM-)»Áwş°=Ásr¡í¶Û(\'×ÎÃ\r‘ªï}ï^8îµ×îƒéhœğ/ëMî„7ë€‰pàÅµåËøü1y-zÏ˜qš.(¸K‡™tpÔ5Ë|¨»¬f‡©´deSŞF«Æ‘Öhº„œÆsI¢ AÍ°°€Ì½ tª­åÀ´ıöõ{ Ç~é¥ ,0€!6â_d€4‰ ë¿âûÒKË\n÷«_­æø6îxŠ¬àÚ@gşüóÊ©è‘°½÷\'J	ZıáT¤Ï©Òr\n¹Gæ’K[Ñ§f;n“‹Y.ïˆ…x¥>Î(U×$‰L¯hÊcgù«f+\r<KIü½¢ì¹ÔªÕ.\0fí¢‹N¾öÚ]‚ç2\".5?9V]7´pád%å^ìu_†ÌwÌùøÃ±eáç3KÏ‹a.MH% ÷sæ\"Y‘éOŒÊ¡SìªKåpsé@Ôo¿˜)gw}QĞ<‰©MvS©ÔO.­SğÊÎô.«à]\'`€«û‡s#7uê8ËÏÑtH›r&Ó!ÂşÆ¦ÃGZ·îvœsR¬spÎè‚:§Ê\rZ\'€ï”Šp´nİÒı2å¸êFAnY&IrŠ’¥bJ²Ì…#eaô>ùuIMYs{!·vÑ®n+¢î×SëÖí#óÖn¯Ã‰ûró‚K¢«}ñ]l\ZôºÂ}ˆÙ	={ø«š9æ°?¾X{\\g}>ÀÁqåïjœæbpøü2”Edî¶ä”‚»é¦/;[èoaXdéšH¸ÃñwO(qT¸tâ³ãŠ{æy³¿^à|¯ØsÏİ³Q°Û–x’Z€dŸìš«cÇ¢Øßéq²üA6ä¦\n°r’]çÓaÍGTˆ9?åTııR®Ô—ëÜ\r7Ls-gPóGÀ¦Lër+DØ©?H-§™wô€]íšfsùŒp)ƒ=²‰{r“UWŞ_\"b¸hw÷b.w	noÑ\\¤“xå˜}–¸Yv3s‰€QAmå÷2ÌtÛïğ?Bÿ]Q9¸ÊÊ–ÅÆXÂMÀ-^<ÕŸ5¬@v²+îNp|œ€67gk—†¸u²‹ôK!ÜvËic§VÍI_çÎíÍVŠ‘èOŠÁ>ÎŸV«L²×•-û^q3O {˜Wu«[gY~8¨\rº .{ æüuD—iFeeÇ\rO\n©7;pî2£ƒËx¢?XU®¸›À³p\\ÎÚw¶s§L90¤îd€è^p¹z±gk›6ŸÍÜ¾hZvèr‚TõÇD§ÊJŒ›İ|Ú\rãÜMa‡[QªTkûÑPni€J©Çuºª«\0ÙÎ£%Ï8á¡¦	èÿİ£Ñ±#¾óü\0\0\0\0IEND®B`‚','avatar.png',12753,'2014-01-10 17:14:22','image/png',38,'\0'),(56,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\04\0\0\04\0\0\0J\ZŒ¼\0\0®IDATxÚÙ°UÕàK‘\" ÒëCÊ£<Ê£WiÒ;‚4y¤#E)J‘f\"EdP‘E“LFÄ™D’!Å$˜ÄôhÊä»gáUjŞ¬9sŞ½ûìıïı«ìsS;w.Ş±ãşµk§wëÖ²mÛÆ99Y=z´ÎËòøãóvï^ºoß²={t}úéŒÜ¼yöêÕùsæŒ™:uğøñ}‡í:`@Ç~ı:ôë×¾oßö·ßŞ®wï6½zåºöéÓÖ\'ıûw0€\rÒeÔ¨wİÕwÂ„~ùùCfÍ\Z½hÑ]+VÜ½zõ´õëgÜsÏ°fÍêU¬Xİzköí›LœØßŠ©­[çnŞ<gÕª|àZ¶¼Õ “Î˜1Ò3Ğ|íkK\rrİ³\'\rnãÆYkÖL»ÿşñ¦»óÎ>#Gö<¸K ëÓ§X0¹Ú^¯^m`…²Áƒ;Ñı;z7qb?›1c„Ix`|kÖÜ3gÎ]ºäÜrËM*”©_¿zÛ¶ÙS¦Ü¾ışÔÃßÃ–-›Ü³gn“&u7®mÒÉ“zlÛ¶…O=µhçÎE»w/ÁŸÑ[¶Ìyä‘{—.8sæ(ÌY¬Œy8´Aôh9ò6àĞ6yò€¼¼ÁÓ§_°`Ü’%LµråÔ{ïn3YYÕkÕº€šÚÆ‹R>zß†\r3Ñk®ììÚM›Ö³V|pò–-³{l.ÿnß¾=ñÄü­[ç¬]{¯M›}Ü¸Û¹mŸ²=[Û$dáÜ¾}Û\rØiØ°n£G÷?şvàP2mÚĞûî5wîØÅ‹\'˜jşü;§LÄo\rÖªW¯\Z‚¿pá8Œ¤n?ùäûóE“&uÌkíåË§p\"§³@‰6š{è¡<ÓÙ«•¬Êe„ÈLÚ­[‹îİ[º¹í¶VPÚpÿş‡ï>n\\Ÿ OIbæÌ‘³gßnì³k×U©R\0OÕ+Sûö-ß»7­w›kÚ´.Í\r\ZÔÙBª›6Í(Øe¤¹dÉDr&jãí‡¤€·¢\r&ÈºwO_æÚ`I4ô»ûîAùùC	s0Í›7–ù—B¸U(pknn#3=úğ‰RÏ>ûˆ»C‡V¡=\'§~‹õ…ªà%DW°às4ƒ,¢aèĞnd„ïÚ»w[›ÏÆWÏNšÔßä7ÉÜ¹cx@(ğFlĞ fÍšipÜröìçÏoO=÷ÜzvìØZRhÜ¸p+VL}ì±yëÖÍ\0ˆg1%Ù¢Ó\\8;¶7v!#©~&27Œ[Ù\'Û>DéøÃdÜ*+MŸ>bÔfg×Á\\ëÖ\re«·ŞÚÿöÛÏ¤N|ôÔ©Gq(š7ÏjÕªÁ¶mH0`ˆ‚#ÙåN¡!Cº‚•¬İšû\"ÜÄ=‹TÂÜ\'	åJÂ#PÇŒée-øøˆÎ\'8«]»²PæâÅgö³c©_ÜüÒK[NŸŞŒsn•ovíZ,6)şpF¼&ô÷0eÈ–±$ıvîœÃŒg‚€\\hNèÀâs7>Oà¦i†>üq.|ÁóTVV5ƒß{ïèåË/şö·/¦¾ñ5G¬¡9CùÔÃ\nƒøeòmd ›ÙV‹·B|éÆÕ`.h×.;p$qĞ2ƒ†y\n\r-[6à\rI¿cÇ¦®:5Ñ¸Ä¢Â(äj¡àHó|ùOúÖşğÍÔùóÛ^}uÇk¯í@’U‰W‚a‡‡éT~©Y³RÉ’Å‹-\\¨PÁB…\n]ıuåÊ•®\\ù¦:uªp¸-vêÔ °TB\"‘Q%ˆ\Z5*U¬X¶R¥r•+—¯R¥BÕª7Ó>Ä¶M‚¡Î¥N©NôÑ«ÿûù¿üå•Ô»ïşá¿ş½ïíÙ´i¶<B˜QmélàÀ¸iØ°&À]w]‘Â…,XÀŸ›²eK*8$ŒEP\0\n.©ÑõëÖ­Z£FEPŠ¿®@TæÏ&K—¾JĞñM6ª%#eSY÷w¿{éã/üã¯¦~úÓca$oR	EZ&8\\HFÁÅPõêAAX©RÅo¸¡+W®>£Fµø.så;¬øĞWfpû*\\¨X±¢X·Ï›n*]­\Zşj´iÓXŠ¦(„©ÔÍšeÉ¯²Ç¿ÿıÆ¿şõzêÒ¥ç.]:Nƒ*ï(/Ñ}Hirº¬a1ûó\Z‡9Æ¿Å‹+_şF.“<QÎ¹\n¶ÁğQ§qÈ¾\"ÌÆ<‚KQé\\Ø¼,£lp®bhW€¾ğÂ¦ÿüçÛğ¥~şóç~ñ‹gÎl•ØP%Û\'ñ*ü¤\0“\nTú¸ùæ²E‹I;µ@*®EŠºñÆğq‚Õã‘È†O¶Ş´¥Ò¥K Œ»iÎ#*2`¹Â–ÜÅ\npb\08–‚ŒÉvû÷/78n\rph“;HÁò¥Jİ`Ñà\n?¡°\0Ğúà:th\"H-Ip4`¶ŒqÍÎ4mbEPãI„ªÜ5şXûªí~tè\n¸_ıê“íxZ&“;ôHBU±Â™‚¢Çğ¡j³Û=é…„	>JÒDËÎ›‹z±i@áÂíô$Š˜Áx¥½L™²†H1rŠµ»pıë+WÀ½ÿş)öÊ+OJx[Ó±qã}QïESR@ÛÁd\rÒÆ\nÁQ’Åü+V¢u³pÖ@pB²X±4 ø`B¡ÇE	¿ƒKšh¶m5Í”£Şh?wíZÈÒà$âßüæ…×_ß©µ\\áŠìFæÓê\ZO¿’ÅP4¶–,Qâzˆ!3Lñ&šhL,LsB©¬L™’®²P\r¨Z>ÕMÜâÅw	[óœ;·íSp\nÅåË§i[66My¤:!²té$\rˆˆ§l\Z8‰4úiøÄ#\ZœÖ­›>iÒ\0ëEÉÇÙÉ²`Õª`é„[¯^UÈäNÂÇ4d&\r:\0§o(ßzkß§à>øà4ƒ\Z´«·šr¥\0¹[#C6–îQ\"XÌÂ¢’t\nQë+£‡ëİ;WäJ(ønÔ¨6yÉ,Lò£3à¨ß*•§xÆ*¶§àr«Ôv88õ~ıú™ºÎ8héG´túaá£åB*If’¸İ[UlÓmÀÉœˆ®:Ü\0!JÚ´Ie&6£“&v‡\rëJ	ª>¶İ@ª“_?øà¥«Ü\nß›oîƒILhŒ1>E5)xy”ŸÈ‚\0‘ƒuâ!¶jU¸±o¢F<d”—ø·\rz¢l¸aR`T}Ğ‡ï¦ÍIa#µ‰Öâ+ÈœA?úèµÏ3§|IuÑ¯3Á6A¦k\0.Ú/âPglwáÂñpkK‘-ïhş„›V2Ğm éÚs#xQãM‰Ó6ĞÆ§f¼´wïƒ¼÷ıïïÏ KƒûıïÏ°_ÿúùãÇ×9œÚp˜s¤\0^í”Üh$i‰ÔÆ»\Z¦ÜÅt” Fú™“NY4›dÀ€ó Xî7vIWûğÃo~øáË®’°\"qğàC³2œµ‰É¡7ÎdË¢RX9Bóù™gV8…¯\'_õğ-qdhp¡Ee2Ã¦MK»‚Ù¤m>KŸ>½åí·\\N[÷ç?ŸuıÁöƒ/,ŒC!24Q‰fHx\n†¹DÀ€Ô\0‘AÔÉ^mvŞÁ‡LÉ¹n\\‘§0ÊÌ1L½‰?Ä	,h¼iİ<Ÿ\rÕ48È´u*†]çR%|1À!gÜiÇ¶Şµk\0”Æ$¤._~÷²eSIhaˆñ¹‘À	 ÌiUTÛ8éHlÔ–¤‘I0å«UâuG¦¤~\n²¿ıíÓÜé?İìß¿8Í0>lËò²	a¢¯U«†ztË(Ä>Ôâƒ˜â ã…ÎÖ±%é£• .Ê€ÁúÈ \"èçƒŸC–\rLL³?~Ía8ş¥S1Ë_‚€Ø-&5 MÆâVşbòªœ,Gğ H\"²víšDû½{rt¸âÜ8`£ÖÆtpêû5ÀA˜ÂşùÏN³rŠ€h³Å©SÓ	6¤Æ\"‘*J ê’ÊŠÉÜÈÒ²®dZºqê&D±UK4Hü#EğÛµÁ}b c”\'`åj·]I×”‹³ä¬•@>JÔ“•¥LEX:\"È‚E°¢‰JÂ¶µ§’wu]GêI”zGjVâÿ\"».0en~ò“£gO4KjQ—¢SÇD,ÉÅ²<‘‘5,j(geUWß´L<«$(qÉy\';b6Î­¤icøÓ,:TË	¢ğÚàPœÎİQ©ªb*//ıÓ\\6İ¥KAª~;,¸Tâsàh][‹¦åßèˆÄA¦°FÉ§¼OŞµ.6L|\"CÓpáÂÎ¯\0æÌªU\'1ÙC¦³d­Z•u‘œh\r[—Ïx\\[†âC®`!møÓ¹èetYµ%JÍ¼@/^*ÿ¸ ïÔ©2¤ùöw ÄqÁ=t-!Ë&>G	F#Vrr²t~NxÑ’øJÒÑÏ•-[ÊÖxë/Ppo	åëšÈ®Íœ«,âİ%|ÀñUé{uçztÍ¦{$ ®uë¦›¼Œ¡Ö\0­o…\n7:qÙsš.\\og]¥tÌI[_.Ğ¸ÆM˜>eÑ¢ñ-pæ¢­¯Û	ŞJ›îĞ_²äõXÑŞYâĞlÁ§nßêÎ9zç‰„¹ì8m„™Y9¹xñØW0Ç•ñ«$\\4gLúà)mp•*å-£á& %’Ú´ã„˜œ-Ê ,\0áO|$ïxëP[r_•“l—~İ”tuİ%„/Bv\\Ğ¡W¦½“áâX “>0§áæGi\r_™]#pÚBÎğ-uÊyBØ‡\0Ñbóæõ|(¹DæÓrÒ	·~öÄğ…àâøŸq®ë{ï•Á%LEÎ1BR@!w;È«æSïÅà‹ãBrÌnï¯£´ˆnµ0Ö|	²+šËpö9Ïj6¥U|, Yà€Æ;^k\'/ÈÒ§²Úµ«ˆƒˆÈŒt,Ÿr’j›mKL\\3Å÷Ë/?şà2šá/Ì¿\ZIåA|Åb7{Ì+ır\nÜÀ©\nğW­ZÅDÕdDD•pœ›ì­^x\\ØjÓ¿ÙUåësÊóÉ…OåçáAÈ¤(¾ˆw–L;]âˆ…K¥6)\ZPIOÊFæU+Ïzë!3’©úK|	²ô[&Ç\n\'êï|g÷›oî•ŞŞyçÀ»ïR^iNS¯¶†äss&Èšc+~4’E“ßò²i%\n¿°E¤),Óƒ &-`_CÀñ¸Òòüó£ÉäŠÏ\"=\rïÏœÙš¼¶ŞâÄ6‰V½‰f.91´ú/8()ùu!ıv<‡NJJÂ\"\rÎ6â]gôyI´f‰$Z1vbov¢ï·è|äâÅg/]:şË_|ÿıç/_NŸ¹Òï„ZuøğªV:Ú<¸Ò\r©8°B³®’84‚gYø+Á×^ŒDÈq@„ä“·ˆ“ÂŸÍpF‚²]BmÚD½ı+VT`ifOÜàlåzâÄ†ãÇ×Ç6G<ì:{ö	íÔ¼ycÔ+õTƒd^Ş™B³9kÖhù,Ë°è\"]IÉ¹f0ÅË‡$å¦ß ‹‘_oFNÆœÍ–J¥9yòÀ„—•8ê˜3N°Ãü›~Ëôİï>-åL$©\nz$}¹^ˆÆµùp+²Ô±fa³ã<!ùáÃÕòbÃ>‡À\'Éë•JØŸb8uÏÌÈs$HêãâGØ•+§:û8=¥H’ğ0¤q¥ƒ–ªçyµÈ _E#8+%!™./óƒ’øYMÂso@¼·H15jTô¡­I´9‚\Z8Ïa\"9TÏ ­IÊSçÎm§MÈÀ×`ŠP<Ño¹r¥xÙ¿Ê3añ ÎêÔ©¬¼*¦\nhœ¤78”İš5+ÁáCæF—`ŒfÄ½oãwz°6W½z%ÌiQ¥ñÆ‹Æ=ù5gpØ\\˜xSûLÁ\0\0\0\0IEND®B`‚','avatar.png',4583,'2014-01-10 17:14:22','image/png',38,'\0'),(57,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0h\0\0\0h\0\0\0’~\"ö\0\0dÒIDATxÚt»TSkÚşygæ¬3çAXô’À¢wÅ¥Ø°ëkÁ\nH\'½\'ô\ZÒèU,Hï\"ˆØè]ì½wEÅJÉwïld|ç?ŸëZ{=Ù$ıËu·gGLŞÉ–¢SM ÒÚÖê¶\r—o·ßzÔvóaËõûû¾<yÿµûã@ï·Ñ£Sß&g†~(G”Ê÷#Ó½ßÆŸö}½õüÍ¹Û/Ü8Ñz¾ª¡#§¬æpIufŞ‘¤’¤a²Qd,/TJˆÂ\Z?ÚêË¡ğBA~œ`n˜+Ø‹àIyS¼(¢½¾|wO?;”Â	£q\"±£é¬(\Z3’J¤sÄTVlŒ+RÀ‘É“ø3¢©l	“¯ qc¸:K=5>¦üñf¸ÿÖôèå÷W_Ÿ*•cw=JØw(­¬%¡¨Q–ß‘]’U×SĞu&æpƒ$·Iš×ç6Eç4ÂÄùÍÒ‚VI~(&¯9Fõ#æYÿÀ£7ı·_ô^ºÿ´ıÚ½º®«•õí9\'ÓrËâäIÓ…ËS\Z?x/…¹İÍ{ó·-»|@[wûº¸Qvy2\\}Øî~\\7_«7ßİWèáàI	DåE\rò¦{QÂ}éQ oZ˜=ÜŸEaGù1#|éb#†Î–³ùñ<Q’0 Y˜BãH\\ ¢:)Hà’…Â§o´‡O½üÄ>	*Xs	şLKÈ&Pa›6íºpî¼rrljä™râåØÀ£áÁgÓ?¾MÌLUÕ*ö•)òjåùõÑ¹\rQ¹âÂvEi—¼¨]š×$Íiš‡Pû	.&¿	•8¯qNçM{œ7îY³Å}ƒ‹Ï–”m».®lT»<E;=„»<î¾>ô0ø¨áóP9Ñş¬H_F8®AÀ÷¦…îõ	öòó£ƒ)bhl	\\<[ËÅ{ø…{S£T˜¢üÀ`ğÑyñ /Æ‰¥0d¾Ô?%FœÌL‚F—Á_±·O´7EâK“ù3f,**+Æw÷\r€7éEƒ·áIá)bãgf 0\'F+¼¸;<ö|Bù­ëæÍ¨Ô|Ù¡òÜºØÂfYa›¬¸™Ó”YšyB×\"ËGà¢²\"×Gæ pcr\Z@’ÜF€+Ëo–´(\n[1àoJ8•)ercœ8\nCáG“ÑY	~ª?3É—çMUøP¾4¹Uîí¸-Ú‹ééGÀáÏ”€kà¤/UêO—ÓXqtv<®Š&7Ñ‡EáHh<•CãIB^	…íËŒ¡pà¤œÊ–Áoğ£‰)	%ƒ·äE\rÁó¡FPhb\ZCBgJ½(Ñ¾t	˜Ë!õ¡ÅÀCo*|ˆzV`3@ìA¸ûQ<¾3>Ñ7=Ù3=ılxøöĞØıeß—ïï2Š\nÅJâŠšyõò‚&@‘İÔBÕE®K©èŠFõâlÀÔÁQ)-j“—tÄ«WÜ[ÔÈ\0àÃÀÃ›€·2÷†@–œÎƒ+ñ£IwF—û1c}Yq~ìD_N¢=Â+¡ğeŞ¬hwjØ^Z¸\'#Ò‹ÅdÄ1˜\n*S dÁJàó€ögŠ),øµ‘§LÈJ\"•YOJc\'À\'Ä`$ÒiñLj<ƒ@gÄQè±Z„=Œ\nÖ4z$ƒéÇ¦1 x«ğˆt)È—áÍ¹ùû*Ø?£ü6òí¹òûÛé‰‡Cƒ÷¿O~˜RNB\n’(O-o‹Ê:\rW’¶@ÄEd×…åÔEä5D5‹óêç“ß -l’5Ë‹[beyu²¼Ea3€ë!¡ªÊ2Rx(2CŠÊÛ?Ò‡\"†ğñ¡J½iROŠÄİ?ÆÕ7Æ—íÏyÓ#A° r¥à)*M\n }T×æM†#<T‰†õôóğ…õgGû0Ã?[JãÈ™Üx.7ÍF Ã“ÁGà/øÌ¼©ÔpOj(’‘&ò=ü£<)Ñ³o*öö›ÃÇ,åÄîñazPı>|íı1óY9ùväóÃ©‰‡?¦_O+¿¾î{›}äDbî	ğ\Z\\9Dâš¢V`\rìò\Z@‘ù(²èÜ:PTN-º\0AB”äœ‘æ\">…8ÈwU¬ÉæœZzúG5¸øT3ÒåÀÎÃ?Æİ7Ú%2¸0€1HçË/‰bšX%‰UÄáÂè\\ÈÜ±`:ğ…\r92&ÔÀ¹’É“ò…±Â€x^@dw–(åÅì¥Gí+±´Oó¡K€á§¨ãĞÏŞdPxÊv7ßšºšåğôTßäØó©±§cc”Ê¾É™S-­q‡J“\nêÅYuqÅpåHª*nIÀwùM€/*·ê,*i^Ã¯R4\0;EASlQ, è¨ãÀhb$I©Ö ÈåÑÑ·…‚Cø =C‡èAôÁ\Zˆ PĞ“,‰7$#¸lD·.¢r64f¤#é0˜¡~Ô@:+ÌæKñ§…Ğèa4z„/-1M\nÉÑ—!÷¤Çì¥‹İQ¬(¶˜ÂA~9¤EÄ&*È‰ğûY™`pxÔŒrbt¼w|ôR¦_O<ış£¯·¿\')+?)¿F–S+ËmÉnjà5¸xÔt’‚Ùº‰bpà,UTşTÂê	€CÓ¼\nƒöH>bCâ€˜…‰Bôòƒò	‚…*.¢!ˆà\né)ú&6¤¿(xB²8ĞáH|ÙrN¬GYŸÎ‰aq£©Ì@6?œÍDˆ„a\\N P,ŠùÜp>;LÀ	g3Âü|‚İ÷†¸î\r÷ò‹€ÊãNp§EºÒ#á‚LêÃƒ¼hğÆ\"Ñ2\rÔ ˜°Øb—Ş—.]P*‡§¦ŞŒ?Tşx=:vû<<ùñt{«ta|>PkŠ-hgÕÏñBZŸ…“]+É©ƒ„tö«TvCÀ¡¡\nÏGrœª F‚Y ‡DS8´]_T­ƒªxùEyøDxù„ùøEøQ\"ü©Ğ‹Fsx\n(\r‘\rg(´(ä/UK ‹Ã‚Ê`²C¸ŸÏ,&Fõç0¨_·=¾n»ıÜ<üİÜ9>~¡^8?(€ÊcFñÙrJ0ØiqX‘Ş±+Æ‹)B2…~3Rgh‘ğn¡ãíÜí—˜ªTN ]îÔëßÁqO§Æ_Î(Gzû{ãæ$	ß_\r•†*nC+ÚdÈóšù- øà,ÄeM€8M(	%-‰¥íñ%mª $Tá£ƒ )$X\"P!ïŒ‹D(R¾˜J¡ÓÅF“%†›-ÁC\Z-\Z,–”	¥X)Ó‘~ôp\ZSÄbqxl\Zâêçµc§Ëš­ë—îØ°ÂeÍâõKm×/±Ù°ÈtÃ\"ãÎVş.+8[8Şn|\n#˜ÄfÁiœP\n7Ò+öçÉ©Ğè±ã ™2…± è‘&™\'‡&\\O£s^t?Æm|øÙØmúÕ×wÁnß?ŸlnNÍI*i†Á\0x)Š\Zåùµ@\r\ZàSËm–e7ÆA\n+j‰/nÁep‰¥­Éå‰e‰eg“Ê»âÊ:1ËÀnp©Pò ğ¡ÈŠk\nR\"Òå±¥@ŠÃ•ò¹2\0¼üı#||B)”H Æå*8¹%Ö‡GZƒÎå0)<–7ÍÇÅÛ}ËÇMÎv{6/ñØ¼ÔuÃB·õ½6˜ïv&ì^ià¹–ì½ÙÚ{ëšë¡¿›Éa2¸&ß—Ij,èuãÁn‚%Šd(;\nS-wAQ!ØmèÛ‹‰áGJåk(ÃİÊ™/w>ŠKMÌ©É>ä\\øáÚ„²fqv5x\r¨İ NZl^‹<§I–UÆ)ê;,PpâÃ§ Z”HškK(íT”´cöxğ}Y^ôĞ½” ,üØ‘Ğ+Ğø1H‹ë‡€€0C5O.ÄB)A²÷‡*	}5ÔÏ?Ä×/xg\\^¾‡Ç¥û»(®´İkİ×Û¹,7]·€°Ş¿u1y÷J·UÖî«m<­ÜWšíu6÷[kÍİ¶@´}1o›=k½UÏ\'šÏ zxHhŒ($ıó¦R¨`°#}|ƒø9/¡ĞXÜ`[ œ\ZU~ÿ<=ú||ğö÷Ñ{ãÏÇÆßOÿ•çTÉòË\nOI\nÏH\nkå…\rñ…-ÉEĞÊ¶*T	X@\0&•´Ãy9bÀú9Å@şÔx2\rx¼Î``¬Ü]ô÷p„,*´Òƒ Ni4$T™*¡“|Ú0ZÑ™1–¢s8‡ÃC€?ƒJóeù»Q\\7n[a³m™‰Ë\n³İ«­÷®µs_cëêlµs¹Ùe¦[íñÛìq;‰+M™›ìD;—íFÄÚ½œçµU@õäğ…QŞ~B?ÁvWÚÚ;Ü<i®î´½^ômÛİ<<}·ïtéìj›ÿ¢T~›zÔ”ÊWcc/§g/]¹(>X“]%-8)+®“—4Ä•4\'·¥ Iê¿€Sä5¢õ•b¶†\"š+¯°jªL×ŠHDº\'A<*&?ÎU å­YD\Z:|ø´\næShâÁnˆ Ë÷§†ûSÂüüCı|…;wúøøÒX,†çN—õN«7,1Ùélî½e{Ï\n â³Ñ~çr“­›ì°kMæ¯3ÕØd¥åboàæDôYcJßlÃqqğİhá³Ùï·îã\Z#QÄË“ScÓ3ŠTæ—¬m8q¦ööİ[]Z›«™ò{?t¼cƒ&ÇŸLO½‚d÷ú]ÏÁœ\"ñÊ˜ÃÕ²‚3ò’zEi#€K(jM*lEYÈUu\0ÒĞŒ+hp€cj±¹¥O˜†	}?;‚Â‚L}4V^”@wÁO®›Ûİ“ródîÙK‡âU›‹çÚ­{×»xnŞîã²›²ÛOğôæyùğ™ô@½¾|Õ×uİr›¥6Ø6ºîëmİ×˜R¶Ù1w:úo²ÙµŒ¸ÙAw£­Ö&;ímVš.ÖZ[­µ6Yi¬·š\']aá	Ü‹¶8\Znv²ğÚ¹©şô‰‘ÑOÃ£=Ÿ>ß}ôâÂÕ›·î>:wéò‰SÕgê\r÷LÏ|PÎ|şr|øÑØèã¯Ï§•“5µ‰™ÅŠœSŠü3òÂZiQ¤ ^’W+Ë©Wd×ÏAAÓP‹Ío‚PESÛ\\‚›¤98ƒ\r´à‚U1Îk·mvÙ³u‡Ûö=n^?:—ÅEˆB¢\"År±4NŸ’”¹ïPöÁÜÜÃ9EEyGUUWœ8}¢¡¹¹ãÜÙ‹W/_»}õÆİÇ^>úâÆÅÎ`®ÇJ;ı\r‹°horĞÜ¹Tï*¢Çjâ.\'ıÍvê[lÕ·/ĞÚé¨ã¿‚à¿œè½Œ¸ÛÑ`£æ\Z+uvzâ6Ø®±!®´2¶#¬ívïñØèâæâîï²“êK	ğôæp¹ANNN••ÅßÇ?LŒ÷ÎLB½95şlt´ûûÔ—§½=òôÜ´üÓ	õqõ²‚Zq^mdö©¨Ã\'c²ÎÈ²jšÅ€R\r`fÈ©Í5q(š„’¶¤²œ^ğçQŸb®Ü¸}ÿñ³{Ş}øŸ¿|şª÷eï»WoúĞ3u?{ùêEoïË·½İ}o^¾ûªÿÓówï¼xuõîƒÎWêšÛŸ¬;zìdnniIQq²,Ü}ÓÂíËğÔMÆ>«±îË´›HÂ–;­8›¨«p Új<m.h“QàV3ş&3ÿÕ&;ã7Øc×ØÖ. -³$:\Z,°zÖDc«lf0OCaÃäÅâH¸¼??^¬<njbP9ıihàùè\0b·éÉ¦•ùG«Ë“¡\0‚<ÄhQ9§#ŸŒÎ>ÃCÜ/é_¢’4»‡˜.¯ñÿXb\"\Z¬A˜¦Ö³--êê:ª«ëKJª.ÉÈÈILÜ›.‰IJ\n•sùşt›c»›÷Ö]{×mó€Pİäâ½u§ßö]”{h»]é /?¶··÷¦U}]&‹¶Ä1–„ì2Šv7?´®D²ã¨|O~ØæLîÊú’DŠc¼·}¢m‚CŒçÁv[g³\rÄeVøEæ‚¦9Q×œˆ%ééë¨ë¬rŞ*\n’ÓyÑ\0ÎË\'(0X±g÷åKÆFŞy9=ñ|ôÛÃé‰îéÉ7cß?<|ñP’~ >ï¸<÷•¹H’BGw ›ßX0;Z!ø~‚C‘AÀ‚`¼*»Nr¸\n‚Ò|è]cvíñwÙæÚîâ¿{İc/×Ç[èïˆÈ7Yr¿?-i>XáğÉsDÉlaGÄæ\'r¸	lN<‹Ëd*¼B—ï²aißê“¸U	n…¡kJ#ÖÕ¥{Ÿ/àİ(êÊaÕ&í­Qìª–í¨»¯*Z“É[å½Ìo½ÍZ{¢IÏ«©­ùw}í™õpZóµÕ5íí–„DÄzúiìh˜I½` ‹KúşìÖ£ÕÄÈí™‰—“cİSßßÿt¸8/şp!ÔSI€CüMZˆHVPà~Nò²Ÿm\Z’øT¶R¨ûæ\\„–Ô’(YXcèÌh\ZCu¦( /Œ‡#¬aœ‚†úrK™<Dn¼u*+Jµ–ĞØbä†\0GLçF`zg‡ÁĞê½ØF»z?ûJ™ 9cÏÑHçÆä­‡\\Ïåz])¦Ü,¦_/ \\Íö»rÈçòAïö¤m•aÎù«c¼;s2×w0»añ:j&†úx=mœ>™hŠÕ7ÚµÓ/$, fñB|©´oş˜ú<üõ™RùaâëÃ©ÁGÓão qkêº’p(±°60­4±´Móèõ^ÑY§Aà¸¹&˜IÑá\ZcIvƒ4§1®°iaÌ˜<Ä@‡‰t¿Z3@‰¡ªfMÅ¦B‰J1@\nÆ{”œG6ÓUûéˆøÁ{÷,µÒ=u€{³BØ’¾£<ÜétâæSI»²İã¾>Ú}<àv>õ|†kk‚Ëù};ªÂW­’x/^„ÿ›¹ŞïÍyà2¬A_[K]MC]Ó@ß7uu§D’€—®•ÇNıššü09úJ9İ;1øxjø4%?¿Ï*9š˜SŸ:±¬I’s\n­‰søĞ‰ê×Y\n­h¡T=Fz„#r&¿¨bÚĞ-\0˜íç10`\Zhe$T€M\"•é€ÑO‰éª›)\0Ê‚¼ói‘‘ì¹s×\Z[Ü™LÖ£Â9{ê“×Ëİİ±Çµ¯GU¬gÇx÷Kh—ìíHpi–ojM\\_° 7`YŒ÷Â¥Ä\ZişVıC]m\"Ş@WGK[SË@Ÿ€Å’q?Š0,2‰ÉDÂı=Ğ©tÃdªœêù1Ş­œ|¯T4´µHÓ²2Ëë%Ù\'R+Ú£ÿ¯àÀMèy´8¢µ¹¡Úwƒ\0Ÿõ`~‹,·	$ÏkùïààâU\\¤È´¬ıçM&t@È½˜Oa‡üˆ¯`baìqSC!ıĞ”åå·ËÉ¼BáÙuØûJÛ…Üí7+<ï—ùß-ñ½UàyùkWºKKüæ&ùúéÚâ%¹|ëÃ\"§w»Uj65c-<A_WoŞ¼y\Z\ZZxIK7_·×“*Ûã¶ûâ¥Ò‰±WĞ‚|¾ûãûË‰±n öªç…\"53%ïXzYSLÖ	°›¢ n®)û8mßT\ríÎT(\\Lv-Ò Ñ*ÏkVİÁ™İ€úU¶Hl3ğ,A,ˆ-ŒCÈ^À!RmE°ø2GÀ%ñ\0p§0£À}\\‘\"*(1”) m^–ìrL¼¶%mS{æÆÖÌu—³vŸß¿½#mK[ò–¶¤ÍŠ\r§¢«BœE,.-Ì\r\\)t1_o«½ØLß‚ˆÃëêêëë«X=]Ü|\r,¦C*F?&ßO@vë…dbâõèxÏØÔø‰†¦è¤ıYU-IEĞ¯ÖÂTŸPÒ4›h0Îu¶¿¢ün\\Q¼‡´»Eí(;E~+ê²_©!7kXB9ÊğB÷(¬\ZKbpÓ±ùñaW„lpÃx‹\n\\Ô‘`=¶@ P±DÛòÃw—…¯ª[WŸ¸ö„|ÙiÙª\ZñŠc‘KG®8)v>)^},|EyàâB¾C6waß™±­ï\"s€Ó?«o@&’pXõyææ[˜™sÙ‡{çÎ%Ò™‰^åÄ‹‘/w”Ó06ôÏ(o<z’”U˜Qt2©\0)ˆ`™øâæ˜ì“ÿà~µºU‰\ZÀ¡7eˆ…mè&ä8Ea+zskNÈíA\Z7…EçÊĞ½L¦…9NAgƒãâÑ°‹Ğ:Jr7‡\ZdC¶L>Îs¼\'3OÆîhŒßÒ˜°éLìúSÒÕ\'bœ«¢VXQº´,dii°è€¿]š]\ZÃÙ×™´ŞgKÔ\"aµu5Õ¡,èjjh¨ÍÓRûKOSÊk\0U^”§TM½ı1úZ9òlğı½?”ß¾öç=%İW°¿¼Iš}F‚ÜÜC®<âÀ±ÿ\Zª(Çÿ¨³Auoá×â€n\Z£ÛåsìĞ5†Î—Òx2d/„ŞµBobQ¹R:;^e·xro˜%ƒ¢*\Z;_*²“gĞmtP!Mâ²„qAÌæì°†T¯ZùæZùÆÆø­õ	[ZÓvtfîiMßuJ±ñH¸shqÀñ€Ÿc²‡C*m•ß*“u¶x’Ö¿tÔş¥¥> ¯Èôµæ/²µ²·0…“ò¨‰Á~åôğøàåÈkåèsåÔë‰áWãß?_¾uIš“’<.çtjùÙ¨ƒEª{€ùµhİœ‹Í¹R0—à¶CÅ…¥¢V>‰³êàc€PıïÅAèG	ƒnÉ–¢{DlLn,	àäh•P¤#añ¥lLJ^”áËDvhıø1¾<±\'7ŠÍ‰	¹,ÿµ%ş5™¾WËk“]k¤š’][2Ü/ÑÎìÛÑ’çyjß®¢èÕ‡DNG¹ÏÒĞ‹¸ëz¯pXDÔÓûóô´şÄébÕÿÛ\"Ã=–RwnÙ±Æ¹£±\Zñ¡—“#/”Ï\'†îM¿üşã”	ùÜ„‚3	ù§“òjSò’‘½#ÈPò¢v˜æn’¢B¢X!¨¡•‹:t*òàIÄ)$¸èCµQk£©¨!³}s\\~›\"·E–İ‚El^+¼\0ÚÍıì„¡cqhM@K*£ªJ8B˜~$;˜\nG¾„*RE2ŠPJ£G\nx{·¯ÚºŒÈŞj+Øbu$Æ­Jº»,rkvàº‚ÈírÊ²OGî6ÖF2s)x—CôŞe‘{–FìYâºz×r[+‚&^ëOyjæÄõNæ[—YYcç³öîœëéşcğÓ]\0÷}äñğàK«\Z›¤ûó¡ãpñ¹g’rëóò‘@_H\n\Zç4hşº»‹ŞU@…0*B*©4\Z¨§Í*c\"ëÈqv#Ö±yÈ¦1\Z]UG}†ıÎğB»(ƒtÕ5T\0xÚ8_ÊÈ Ìg%’3\\®‚Ï\rez{’Ôÿi­ñ¯Z¿¸,ÉÙæf»ÎìŸ‹°ÿ0ıc­5ÏÁ@s9YÇ‰¨æêHf¬µ\np±‹ñrŠclàí\\¶ÔÂ@ÿÏ¿µÔVÙ;™ilr ÚaÕı\\•?¾Œ\r>Ÿ\Z6>ô`züÙôÄ«‰ïı¯>¼“ïËIÌ;_TŸ_¡\Zøt\\N]lN\Zô÷ÿusM¢Ú#ú#ô\nNÕ…@‡D«ê§õ@\rP‹Ëo/hƒ#†Å‘AAÍ™‹zm\nò\Zôkª¶#ÀAÌ5(Ç€ı\r „3±l–(Q\Z³ÁÑüÇ?pZ¶ê˜dîÖÿËÿÇ÷—…¶–…6ÎLSÏ§oc0±ÎÛ,u«ÉQî¶Élçß•›\rçaìğZëìpÛd§Oß²4)”©{-ÈÔÄcèBFı˜ş\0v+®>	©-£¬5¾¨ÀÅfŸË:›]à5ÿÿlL*foî!B§tt„®á$ôqhY@Á!“²ïTû³n†%¡¸©\0“)´rpÙPXÑ†É‡V.#JpĞåMÔqsàVNˆTX@Ãy´ªòùaL:ãpFlßÛÙDw½™–ƒ¦*É¯­Œë½ÎÀŞ\0CüãoÚ\ZvXfX\'c5Du·8ÑVs…Ck™„ºÒ}µ¥^m^İoİÅ¸˜[_<U¤œ|^º\rà¾}{üC9ô¤çuhlFfYszYGl!t!µŠœÓÀ.!».!™äã›æz´ŒÎtkÅ‡²›•\nĞA*)¢VÕkŞ]6Ğ{`.?ü®ŞígŒPã¥ ı8Íq U(¼€8WËåËÙ\\)‹ÃæHT7ÀÂCøY)!Å©Ü`÷î‹æ§2—¾;›Úİ\Z#ó³q±ıİA³÷÷å¤ß¶/Ğñv6»/‹õ^Î\\™Î\\.õví²ßµÂÄø×j=Áö%»q·Úy8[tßPÎ|y86t{òûóñ‰¾Á±ŠÓÒÌiV\rR%‹j›SŸ[Ÿ”ÛTĞ”TØœPÔ<Gmr‡¡¬#¥¸=¹¨-©°²a|^S\\n#*´A›Ş_ÁÍİÁA6U·#àˆÈôÈ—ıX1¨ãè\\D€‰YDq,:ÕƒĞªÊŒGØ	\0/Pù\nOÎçÊ9òèÀ ƒq¬Ó9ìŠ¸í8‹V‡\\L»˜åW·£óõDâŞì õ¡;ŒcÜ­òC7Lò8íR´)¶R´ÕÒÛÙhãBœ5á·Fœ­#=—KüÖŒ )¿u#» ãO\'GN}ı}êë¥Û·§—5D<./lP©v5rëÁkÉyI\r‰ù¼u¨5Ğîw®p©%³ìZPv¨Ppè˜Bº_8ø²‚zi~höÏ5b ì~{Î—COçËD¾kGhÜ\0:0@`Bp  †¤E®”Ë“	„±Â¸\0~¬+PâşœŒJs!»=ÇóN)óíéğûù´fÙöªàÕí)®7Šoš%w+„—sè÷µò¨oÌá;\'x.a¯6Ù»Ìhë¢£…úGSÑv\'9um´Ïêş;-ÊéÊÉŞ¡á“£g¦ßzŸU\\*İW”\\T—XÚ,Î9-/VEY~ƒ\n\\=(>‰\\äŞûÏ[Ë¿²›¦vÿV)òSÈ_q…ˆ`Ä5œ,k+iFyÅ7Á:¾´ãE‰¤²e³÷wYˆõÀ€l‘œ¯¢‰ô@–)”ƒh<	œá ã=YOìÌh#šÇ‘\nc9L\"ŒY›ü¸2úN6ûõqñålN‹|ÃÉğÕg¢]j%nÊ\"ŸT†İ«`7§o.Ü˜ÉZšÄXê¾Ğgƒùö•¦Îv„ÅV8Wg‹\0ßM;×9ÔT˜\Zë»}şp]9ùbd\0ŠÃ`}g‡ì@Ñ¾ªö¤r(|§\nO¡·P(èîvRI;zpöGÚJÛU÷á!é¯ ùÊò„Å¬Êdn¥!ø+ÎÆ•µÃtû-ÄˆM_:òÅ?¹úÀ—ªZ\r)Kˆ4º¨Ğæhë1ùÀ±T©\r—-P\rˆò‚äá¼’DNË>ÖõÃÂ7uÉÏN%^>È¼xİšJ)à¯;\Z¹£)Õ÷b»!Í-/xSm©Ä×‰±Õjû2âæ¥FÎÈËHË,´6.6âù»Œ|aşóÄÈsåô+\0§T~éyû´´ædRş±”ŠVˆ\ZIÎ©¸Â3\0‘j@³>z[`îÆè¾Y©ÀCUÛ–)–¼¤„:KfÆÂ6dh-i•5£Ô?m‹0ÇµÙÊ\0ES(ÇqcÁYsâÆÁéİxÈ6ÔP¤,¨ÀA´\nEqì`Èçqƒ\"Cù‰á¾™¢5±´J™ßÁ 9n™œ-±^NüõD±«]:kÍá€mqşÎ2?ç İü»WÙë¯Yd´|!ÉÉ¸m…ƒ‰NlH}y=üõ	ô\"ĞôN)G«ëN&æ§i„ğ¶Ø%iM˜ı:ÌlFCÁ!wK¹\rú« nÌ²+lœ‡°S9Â¤íI¥gA@\rÙyWİ®Eïa—u` ÷Cå$\05Ôq\0Hš‘ÂN\0ñ‚âQ;´qù*ƒ@†˜œø¡³cˆøvgoˆïÆìpŞVGgS5g¢ƒY¬‰£­*Œqçoµq[Lº8{¯±vw6÷Ü`÷¿KŒ‘›°äEö†¶VØeö&$½¿²3eĞ÷*§>€éFÀnö¼JÉ-Pd•§U´!±SÚì ĞC{4tM.í€¹\rÌY?ş¢Äâ–YvEHÓ;Kª´e|*	*:Ée])åçàoéæîI£=\r©Œ¿€.\0H’ \nKúYdsB·Ë™,1XxÁkœ0 ^˜\0(Cãèì`&ŸÏdzó¼\\2ÃX¬mË—›jû»£\ZÏeQU2·\"%Ú³tv•q££ñ\ZâÖåÖ«\Z9Zã–-4v´#ÚXâZ“Œñ\ZRb”Óß&Gú†z&ÆŞCv+¯oKÎ¯H+oH*kA¾5tô|TN½¼¸eÖEÍèw;ĞÒùóËEÿ/¾¤’ÖYvÅÍ0Q!˜T’×ƒf‹\0Ú÷©Úİ„#Àn.ÒÑœ€ˆSõH‚vh`B‚cğ%(5dN@\Zz«\Z7LQ@<¸Ø!øTˆy	“%ˆsD<ªÇ®ßİ´ÍËÖ[ã6Û˜…ºoKbí‘ú¬ál±cn[¸ŞŞ¨†Ù²Ìj¹qÕBã¥¶Dì;£…¶Ä…¶ä-«/²&†(Ê™A¥røİ»ç3ÊÉ›÷nÈ–¦–Ú_Ù×\\2]F®¤¼CQÖ[:«ÙËSÕŠ\'µÿ«äÒ¶YvÈ·ŞZËÛP¡9n¶Pü—XÒ	‡VøÓH¨2YÑ–jÛRÕ\05ˆG:Êk$¸	MdHçÆÆ‚ÀYP wp¡`7tbƒæÁŒbÊ‚äI¢È(ª§»ëj\'ïU6Yc]lWÔœ´0ÛÌ4	ÿ°ÓÅibLçí\\·p¹áR[ÃÅV{3œƒ%ÑÎï`A\\åhádCÚ»mÕÍ‹MÊ©!¥rê»RYtìx\\n5ôn)%M)ª/|¤”uî?~1éH{l9\"¸<°r,mG‡­_kÂ¿ã\Zà²YÓµ¤²6ø\r \0¤‹¹P…ÑŠ‚C_›TŞ™rä,°CÀ1x±h/BeK~P	°c°ÄÎ@°@Ù¡	b\\`PbxDzph\nŒĞÙE¦Ağ\nÃäÉÑ1lš¿›ó’À=ëèë¾›ÒY»²¸G\"Ù‰4—0ïÕÏ¥‘.»79.±Á-¶Æ.±6t0ÇÛ™àÌÚDƒÕÍ@8\';£Ì´Ø\'İO;¯İØ_RYÖr#«úlRAı£gÙµ1Nì?vNš{ZVÒ¦‹;Òù×†–‹9^èƒ’ášœp³¦SK®è@Ùµ¸òf †$—©¿>’ÿH¥íhú‘âÈ›õÑñ‹Švptä>!\rú¾FT\0Ä&0yIÁ\n @.‰HÅCÃOùA’\0q\n=@Ìä\nölZá½Á.Ä{UA\"·H’Á<šKÙÀŞl“ìšìê·Åv±®£\rÖÁÜĞÎ˜lM6²&“lMˆv¦„evFk—X¯p47!éjiª`ñVvK–¬Üº›\"‹Û°¼6¿¦=ÿô¹Âº«û«;¡•‹/†â³$ò€EÚÑs`\nU……‰µ!£¼9«²#Šæáúø‚ÎÕw÷]JÎ9›”×¹¯üâÊ‹©å4S+Ú3ªÎ%—C[Ó‚~eİöU]ş·[UBïRƒãÄH«ÊS ´_CÕ“ÜÍâŠ¼ 8´;Q}!,18,™/R†$…&pø1¢ Øğ¨TAp,)àEîË)æñ8.+úïÕ&	]|Ö/%Î³TÃÿ†±ñ]e’(Ø%ôp^…PÓw°Ğ·5ÆY	f<mŒ	­+íL6¯tX·ÂÎÒ§©1oş|Mm=¢.ÖT‡`nh¾Ğjñ\Z§\r»·yóÙ‘©	¹Õy5]Ù\'.¨:!›_—PÔø`HB¾¦šWÍ,kŞ_Ş”VÚ?…Jš}âü¾ŠÖäâú¤Ò(Ğ©GÛR´%—ñôµªc;²GPØøş;8:#j8îg,cAç!ŒgÄsƒâ9A±ì@œá&ğC’ƒ \nódãAÁñ‘ÑI^¸?‡ÁŒŠ-¯<:6=éë»ÇXóãMG±b/m“¡×ZËOgÎvGÁn\'Û…ëæ¼u¹É†%&¶fz6&Xk#¼‰hcDZ`i´lùª¥–ËmI[œl\\¹ĞÆÔPOk¾¶¶®¶6~:V×€¬6ßà/u¬¶¾1–hklµlÅú={)Aá	ùiù§Nœ;\\Õ›{2ê`¥,ÿ4tÈû^ÚwäÜ¾òöŒ²V˜Ïârk‹N§W6+Š+’*§«Ï¬iŞ²sÿÉ®Œê®äŠ6\0¾K­èL;z6µ¢+QÕT#UõgÙUÍd-Hr,nÁ@‰DÛ1´€Îí¯ãqtQ,U ¥ñcB)à„!ı“)‘I%Äå†‡Åñx¡¢¼¼‚ÌŒ¿ê›QN8Ø®¶×R]{ÜO_§½/Üõdvxq§ Ip@ÆövY¶Â¨¯F4Ğ ãtŒ	zæD¬­	~‘q¹£ÑJ;£M+ìÙãtµÕçáõpDCc}\"KÂéX#2 ¶ÔÑ!éë›˜Ø›Ú8¯\\çæÇ‹?P^têlYÓÕCÇÛÇÃSËóë2Š[â×‚2KÛ 9¦7eT7g9{èTWRy£4ÿ´¢¨\\ÊQÈúm¨\0ÊB„ÖÜÿU•j/svc’¦úßjt‘¨Qø˜R!Z¡+†¤Æ’E„¥Š„²°•ÂÙ³Ëµ(/{|ä‹R9¦{=9ò\Zş_;W\'^Ò(w#Ñ6›ìudíZÈ÷Zí·cå*GÈú$]#¢®)	galhmB´2Æƒûì-±ĞĞ­q4ßàd»ÄÊÈ@]MíÿÔ¯×#èkauçiëkèê’qd2Îˆ„72!šYšX[X-16]@2[`»d­‹#@–”w4óÈ©üãÍûŠO¥äÎ,n?PÚ•×º¯°5»¢+!¯6­¤9*CQcbqê2(0ü\"*ƒ6¥I•é ~UµõH+(±¼éK›á% \0 è* Ÿ€óº»	ààÈ\rJ…¦G¤‡%Š%\\~„HÀe	S“>¾ëQ*GF¾¾F¾R:ò|røõŒò›™‰ÚUDå×Ş®”“©»÷.ÓÙ³DwçRÃÿu\"[ªÁT`oN´6Á™›í¬,/°\\boædoºÜÁÔy±ùÚE«Z9˜±jj\Z¿ı©§®…Õ\0ëit	Fx# †ÓÆaµ°$,É”h\n\"à-,ìí–YØ,\"[,0³_ºdË†İŞ¢é¡‚ÊÊº•mY%õ…ÇšJ«Ï**.©>WQy ¸\"³ôXvusîéóû«»\0VÆ±Î}ÕgÓ« ÓAµmI9Ò|)GÛ!©Î\'•4ƒ0ĞI à„Á‰ tÆB†­D$6CÃÒ‚BR¡ÕP„ƒİä\\Ig9}R93şB#åç/ïî(¿=œèş>ùÑÚB×XÓs)çe{âµ£ÂDš³¿3i‹½şJkıE–xG2D¥Q@Ô66ÆÚXímÈlH‹l–;˜¯^b[fclcˆ#jjbÕ5ñ\Zz†Zz8M}-C\"	O&b!l‰ÆD¢±1ÑÈÔÄÒˆlF04Ââˆx¢©‘¹­™µƒ©åkëEf{<™…GOœj­?T’T~2áÑëãcÓg{ûk/ß9Rİ”Ÿ]Y^r$£¢î`M×ş\Zˆß‹ Ìã]ûueVŸÛwì<˜1µ²øĞ\Z’\\ÚÂ ]˜jğj¢$a(\"QX²(<¯€ĞäÀà.WÁ EòØ‘âˆ„ôÄı€ìÛ×JåÄÌä·ñÁ‘/Ï†?=ø1üL9ütrèÕ÷ÉÏkVÛ™ã0‘o/ft0Ï¤pâ(ëù»–{mZâé²jçÆ•¾œÛ\Z›\ZXXlíH¶dk¢£5€³X½Ø~ã«%–$s]CuN]7_› ¥­6Os¾º¾.€#\rHDc\0gF6%“ÍÌ,ÌÍ¬IdSÀG62·²¶··w²µ\\¶Øq™å¢)Ù›¹õÂİ¼ieó¸²br&cFY¨TÖ~\Zkéº[“{¢,³òT~íÅÔ£-ÀîàÉNœ?Psáà‰‹ûŸGò]U(µ²©¿­)å- …ùKU5 ,-,&xñ„ÒĞˆD¾H\"IÂâSÏw]x×Ó«œù¡ü1¨üñU9ùY9Ñ73şvf¬G9ú\n‘òÓĞ\0¹Šè@ı¿0…ñÈq×J|ó%n2úÊ O\'÷Õ–>Û–ùîX¿sÃªÕK­Zl³r¡•“é\"k£¥v²U‹–ÛÛ,´´0ÅãğšZà2œ¦Ş|}œ–¡1ŞL_×@OG8<‰H6&›‘ŒÉD#s#3T¦$#C2jgikF¶p´³17ù“m8£ÌW*ÏLRN\'(•©SS’	eÔ 2şâıÄœŠ‚Ãe7³ud;›uìÜÁcç x3wî«iÏ8Ş’YÕuğø…C5¡ßN…*=MA=†)’ø¹“ I»ñã„²àPExdBPˆŒJå××µ(g”3“0ùLBxÎLª¨M~T~à¦G^M=Ÿ\Zx69újlø5`xû³{…áç›E¹Ôìˆ-b¿En¾[,}¶.tİ´hûÚE®[W¯Zlëìh½ÌŞÜÉÖ|¹½Ps^h·Ä¥¦¡3OM_]S_SW\\¦a@Ğ#á±ÎĞv#2ˆQ#SŸŠPXèÑÒÄÂÚÌÊÜÔÂÁf­•©µÍ?G¾Q*s¾Ä|ÿ‘úC)U*cG§#¿N~˜ß|\r-ÊÑ¼cWQp‡«Ïg¿\0¤œè:pš•v@vøäePÖ‰Kp8î«<‹á‡‚İäÂÀ8ˆJä;°KˆˆN	‹ˆ“ÉRAIñ‘Ñ\'”?†ÆGŞA˜û\0ò¿¾¿WN¼ÇM\r¿\0pƒo~y2Ğÿtjøä©…Ä?³¢¼ÏçK·Gú:îµ£»X»®3úmbzm^³ÔbãŠÅë–.tv´—-³³v²µ^`njM\"bçkhıù—ÖŸjóµ gƒJª§i\0ohhH$ID\"Yu$Í®qD24Ç¬‡‚³²²±³µ×ÓùÃİÃJ©¬ú4ñy<ø»2v`Jôm*¨o„ıì‹ïıŒ‹/ÕçdUµäoÏ©îp‡«/ª>àø¹ı5ûO´¨>^^p„5Â´ú<€K	O…$B^ƒRÀ	P„D¥DÇ¤‰iTvzjÆÄø0´\ZŸ><\Z{ƒ|…ïû›ÉáéáŞ™Ñ·@Mù½Oùo”=ÊáGÊáçÃ\r}x1ğö‰&cÿ#GÆ®H¦ÆrÖ±¶Ûº®2Ş¼„¸m¥ÕÆ¥6.«]Ö8o\\±ÌÙqÁbkK{KCC²®>N]COM]gºšNÇÀP½ª\0˜Œ!‘I&èIğÈC¢šïŒHà>3,P™˜˜ØÙØpó’ÓÜßKş2:¤{3Ìëg¼bv£ßy¿·ã©kı-Ñ±³¹yÇkówäVw‚éUu\0[Uu¦Wµ¥U6ƒ¿Ò+:RÊZ!N3vÂC8b`$R…\'S\0‡la†ÄŠD‘,¦024ìó‡wHƒ†ÔÍÓ#İÊÉ7Ëf†{PMôü}ä¸ñ^„İ×Ê¡\'S_Ÿ+|Sj¨,0TûIıoP’D¢½¶:YÒvntİàìhf¼kãzçENv¶v¦&æ†D²¾^CG÷/u­Í£éihékjãu±Ğı\"‚2J /²‘™±‰…‘±9¬d*(¯92àÏ755µ±¶Äéÿîãm64q°,¨oLøô#ëqÇígî×Ÿy½¿ëXçúÂÓnE\'Êªk²«š³«Zaü8Xyö`e×şÊ³Àn_U;D(Xå¾G´ÂààÔ‚Åéá’~€˜Ï‘ÄÄ¾|úHùcBr|ğ¹rªgràñÀÛ[ß??U€¹^ÿz95ğâû×gãßf5úş†rò5<g¬ÿ‰r¬ofàÍ­³õÆÚYíïkìÍìˆú–xCMM#}¼%ÉxV]K_MK÷/\r¾šäµYié  `õ¡’\ZÎ9D&šÀ\Zc(d32œ„8²‰hLMMÈxC=µ¿¹ï$÷ôÆİ~ìwó9å~OàÍkn—Î»7·í9Q¿­ôØºÜ’İ¥%ò3ÇO>Úu´ñpeÛáª®¬cH¦;tQö©+hvCc5 &02\rÊhHt:ô!1Ò}AD¬\"åÊ¥ëÊ™±½!<§F\rô]W¿Rö(§¡Ñ}¥~93yíÅÄ—§#Ÿö?øpøıİ¡¾; åÈËá¾û“_^|ÿÒ=Úÿ¼:wßbSCíbşÄ`LpXÍù&D’ºVCBRû¯ùĞâê«ëê2u]¼&AjÃêhëëjÏ‚ÃãñD/	K6&˜ 2Â‘ÍIDSË!@‘µ!Áˆ\0³š¶¾½¶¦8ôÚù ºÆíÕ\r7Zı/ÕÓ«\nvde8æl¬(ô;×RV“]Ù˜]Ù”]Õ‚ƒ4:Xƒx\rMppÓ¥i‡˜ÅÃ’ùÁñĞ…€õx!ñ¢ğ8+8/·Êèø×wÊ‰ÀejğÑä×ı”£}}/”ƒ/”CİÊán”İØ×§C~ë¿?üáÁÀ»»ıİ—?¿¾¾ûüêÆû×”#o‡úL¼­­*ÒUû§5ÿ¯ßçÏûCOWZ\r}um^2P××W×Ãi`a*@æS¬¡¡:<G  .Éú$	ÎØ‚hnE²´$Z˜‚ÅÌGÂa‰¨°D}=‚1h7ZbJ>S\ZSSæ™œdSZá’˜±º¹`÷él×xÑ\"î^Y İá¸]9QaLZ^uS^ukÎ±¬Ê³0ÕféÈ8Òq¤\ræ€…â¯5\\`X\nÌ\\~lpH2ô%B~d øÓ»wÊßÇßM¼øôlüÃı©\0ÜØ§§?FŞÀØéo€¬×==ğlâóƒ‘wÆ>ÂñŞà»ÛßŞÜüÚ{ãÓ««ïŸ_|÷ôüÇ;oŸ_SN}”GqÇ`ÚêóÁnH$Â$@Ä‘\rõÉZjz\Zó4—¾¶¾¤}#C™€%‘Á>ctaD4Á|jªÂhaM´„ß@&Ãè\n¿\rù…cx9NŸh†\'[kı…	cm9[-õÙ¬/ .âs×%‡onÌbWËöJiÎÙ™Á	q¼ºKºÏÆãÇOä9XØ[{/¥¸=³´\rØ¥=77íÃ\"½ò<¤	NˆÂÂÓB‚ãC$Ò~š031ô±ûó›_^ß{OùíùÌ·g#ı?¿½;3ø\ZÂp¬ÿÑè‡‡ŸÁŒO@ß¿<„‡¡ƒoï~ë½ıµq\\ÿ‹«ïŸ]j¯_ºs¹aøóÅ\rØÙ[˜AÑÔTÓĞV×Qÿc¾Úï°Ğ%èBc¡£¡i \rvƒ®„Œ¡ëX,ŒIæ(8X›š‚×PÁCS’9œ‡gÂ\Zš^x&àÃi˜à‰óşÙ°˜p,“•²v³Ó_XMLÕ¹.S¸Kê·!ï@ŒBÌçì^ë¾%7ë@åÉæƒ`¨³	¹M‡*Îfí<tò\ZÊ‹Œª X``Ò\nJM‹ˆLO–´7µ}xójzô¤§o½÷†ßÜí»;Ø{¬¥àÇĞë¡wß û€iüããï_>Änï½»7ğæ€CÙ}zyıc÷µş×·ŸÜiv¯sğã“wİwlM5ÿüİ²–¾^x=@F†…Î|míù\Z(8Ô>\0ÂÈĞ~Š‚C!k4»á!l<5Ñ\'À\Z™ …ÓSûã“²Âw^(É^GVÇ¬!ı–+ØSä•)ò=š“~0%ŞoËúÀmë\"ùôŠ#ÇŠk:Ò‹š3Š[òk.§—ud»ŒŞdHVİm@	Â#J€i4\"2#\",5,DÕıøñ³û×?½{:òşñ›Gß=¹<Ü÷pòË³éÁîñÏÏ>öŞşÒswàİı¡÷GúC^ôßıø`èı}Èq_ßÜÓ—Ş[Ÿ^ßxóü\n¼ªïåõG·Û>¿{x®åäoŒ†š¶–¶ªtbQpÚêZĞ›A¯‹Ä¯²‡’BwÀJsàPL(_dS9#C\r17´€b¢¯¦¶Á”)Úv¡PØİœ”Â[¹t>&Ş}å)9\'/’Y\";Y^JõŞ»=Ší}83óÈñ¶ìÊÎƒåíyÕRKÚËÎ¢q:­³à`°M‰ŒÚ\Z’ D‹Ã%_ûûn_éxõäÊÀ›ûo_îyx±¯ûVï=¸æ¡OOÇ^~¾<ÚÿØ}î¹\rhûîAyì{ğíí½/½wà$¿¾ˆwaÑóôÒ§7wú^^í}~åùƒsoäQÀˆ×Ãëëbqó¡ÑÂšY@5 èãájÁJP:É8#K#+²%øËŒˆØ\rb(CH‚\0rT‰*ÇÁká… ¨6¶fvĞñÕ0\nzWûnUèíêˆèí6rWû“	´ÂhÿÔzGMÙYˆ˜³wŸX \rÍ->‘_}.%¯.½°1£¼3©â$54BÑ‡\n‘\Z–\Z‘	ÏËHŞ71ğåÎ•ÖÏ|xò±ç^÷Ãk/ŸİşøáÅ‡¾gïß=zsçrS÷ƒóŸzï~xüµï>@ùôæÖ×¾»_ŞİƒØßsSGôíıƒ×OÎÃsz_\\zÛ}íÅÃ‹#_{ÿwÓ¼?şÇ@Gs‘ÃX-um\0]\r¸fHapVÆÖÀ8´2¨2Ô\nh8ĞJ\n-€ƒ5\n!®*¾D<´ñKíha0GãØ÷ªÄ§âw×exd®ÜDÈ\rÛV‘À:Ín.9”›Nİ½Bä³Óuûö´ƒåyÕç’sk“òj3+º\0Ü¯FCc)!‘éPÂCSÂCÜĞÊÒŠñ÷o´u?<ûåíÃ×On^:ßrïşÍ‰©‘şÏï::ëê]?WûèfÇ»×¿õ=ì\\€Î‡××¿¼½4?¼ºõşåMÈkPLá!hàÃÃşo_\\üÜwëÁ­¦7/®½{u÷lË	\"AûïĞ`ÌÔ™¯KÄ!qS§)ŞIùX#È_6FÖÖd+8cF0ER”U’9™d†ğ24ÂáIp4À\"ı\Z­x4ƒD-‚±¾ş˜¿/²±Õü&ír¡ ø¹ÄÓL¼İ\"r—y\"seN¤w:ÏïPh@Yš|û*Ûå¶&ëÖ¬?Pt2·ú\"ä8P:rK°ı^\0Pƒúıä¾*8€‹‚‰•ŞxºvèÓ›{×[Ÿİk|ûÜ›÷.]ê8YwâTÃ™¬üìŒƒi-íuÃŸ}÷èÃ«;À5ğàûüæÀ‚3 À‡²CÎ¼ºÑóôÂè—G\0®ûq×ËÇî\\kéó°¸à Ñ@ı¯?UÛAP:ÁnzÈ¬ş¨A¿APæÀ!½ÉÔhÔàø+8‚šACM¼	V×ŠldN$j`0ê–£2w³È½Æª°–R–ó·-ôq²g­]ÛT”KİµŞÎ„èåí_ÕpõÀÑsi…-ûJZ!Ç¥W]ú5TÑL§\nÕĞ˜UÃ\"SD’à ¨ç.~êpçİ¾x¥åäÕ‹m^>âˆ#Ö¹ï>ÓŞØÛóâÃ«\'İ¬\nj( BÁéæğõuß@	~î¹	yô±÷&Xïİ««/Ÿœ{z¿}x¨›âïòÏ¿c Æ` €::Zææ¦d<ˆ„#’qd€…D(Ù\nd	c<œ40474µ4²4\'Y µˆ“ T<iablÇ\rô	:º8@iE6Óûı÷İËªRölŒñ0õ±çm\"íŞ¹}	ÑÙÒÀÕyA°÷Æ¶õæv¾Tá©ö;ĞÊe¿šV}1ıØ¹ı5çÒUÈfe]™åç`1ÁIÁaÉ‘QiÁÁR‘0ìÆµë}=İ·¯œ}xëÂåæ5wİ);S³¿¤ğÆÃ;Ïß¹{¹ãù½óo]ï}<\\€šİæbp~Îthmíyíı+D\0’İ«§çßôÜxøàœ¥9^íÏÂj\re€	‹\0ÈLˆFfdScK\0“)ÒãÉF’ÉÄÆÌÊÆÔ†L0‚âş‚R‹ì¤C²ÓÅcõ	dÕ”ª«ƒÕÒÔ›?_[OK‚qíÏ-0˜W“²%…á¶ƒLuÖe¬Upw@Á]coâ¶vÅæÅöææ‚`ùé³÷a`È<~yÿ©kûO\\:tòRšª\Z\0/ †¨1 â¸ğ”hqFh¨œÇ\rxñäé«gn\\l}xóÜƒóÍÍ§vmé¼r¾íâÙë7¯Üºzşö¹–\'·Î½|påíóï^ÜD£\0AAø5<‘3ª5z¨­_İ„˜Eôú&ªgOÎ}{yëZ‡¾šµ…±®¶‰1Yc¾\ZÔG¸~3K3S+(§$#\"‘lH$“ŒH@ØØ˜ŒLø‰Mdl0B#Î\0eCY[K§¡£¯k`¨«ûóğÇœÉFlÍ	Xq8`­p+Y°Ã.‚ºe¥\ra‰%ÉËeÓÆËÌ­—À¨^|òBRòUÿ¨em)e­Ç.)à…‚‚Hõ4q€ã²„ûŞ=pëÆ…æ‡7Ïvß8w©ùTıéÊ¦æÚ3u\'OÔT^êl|~ëÒã›]Ïï^|õğjïÓk`=”İœÅæL‡\Z‡ö%³¥öíİÏïî}é»ßÛ}µ·ûšR9x¤$ë`t4Õ€Á@ßØÂÍ\"H2ÁˆX<2€È†$¨™DC˜ö	Õv¦¡ÂBœ\"à ªÈ\0­©¡à4 Vq8c¼Ô eäy-ù‘Õñ{«d.Uñ^ñg)}}‡Ó®õ‹6:/Ùí²ÕÎÚÆÕ›°øù00@İÜürry{ÆÑ®}Õ—ö»ˆ‚Ë(=›ZÒ|wÉqÁIáaIÁ?xl`àÉİ«7.4>¼ÑşäZçãk]mõÕ§—U),/>|¶ñÔƒk]`ÆÇ·/<¿éÕãk=Ï®õ>¿ş¶ûzß+„j1Ğÿa÷úôÌĞıAD’à»Y\rô?ˆğB`ç²qå_¿aílì­¬¬,í,-ìÀn$²1€Wı¿U=}‚,ˆd’	4$$’NOG’š	Ñ‚)¦ªìt´\rÔæihÌ‡1DÀ™ñb0!~[\ZòÄUI”#\n×ÁÖXö)ËeıBâª…VË/°²²Y¸xeF~Myıå}¥M‡k.ª¹|øôµdW«Î§¨z‘Œò. –^Ò9N ŠL\nŒ	¢Äá1ScÃOn_ºu±áîÕ†G×:^?ºv±ıLUiö‘Âƒ úåWÏ58”]÷Ã+¯Ÿ\\vo^Üè{u{Z\"Pvpìï¾ùéÕmR:ŞÜíï½Bê	€{yıûĞë¾—w\r4ÿ´55²7·@ƒÑÔØÌDõllD$\r!÷Lp…Dˆ5„lGm,PƒÁÃØâtŞ_óÁqÚ:ğ¯§õ“)H‹ğS7Fø8s÷¬3wòönÜ¸Ä\n*éê•Î+R÷åW·ßÍ?}!!ÿôşÊÎôŠÕyÉ¥è7—€PCØ©f	äN~hpr€@&äF$Ç¥ü\"·.Ö];WsûrKÏÓĞŸ<š{¤è@qn:ÄÔÕË­÷ovİ½Ş	Çg®¼|r\rô\ZØu#et¶V ÎRY!ø\nìö`àí#hb |sæ8~è¾şííñoÏ ~•ÊoûbtçıiÉ‡CDÀ›ÈfæV–f–ì àÂ” ¯§c £kD@Ê¥	ÚmÔqHmUmm²¿şT|Ğ£`±øyÿúİ¯è³cÕ–¥–››Zè«­w´r¶3[¿Øa¡¥…£İ\"C¢µ?3ìÌ•îƒÇ:UŸ;\\sêCŞ©ë@-½âú]¹´ÒN¨ª °Ò\0â#ÂÒD|9Œ\rÒN>ºuşæ…ÚËm•]\'»_C]h¯9]]s(éğ¡¤[·Îİ»Şuûj;°{rïÒ‹GWà9/Ÿ\\é}qãíókì2ªúúî4É€l¨ïÉğû§ïŸ@Sıéí˜Ş¾¾Ì¶0®A›OV^joMĞÒß™ƒ©`˜Âb‰Ğ³™™™C¹À\"7l°q::†:úFúx}\"Y¯¯e€:â²ºšæï¿ı5_]f	¬áß0˜Õ+–Fñ·­YºÔÆx¥½ùB“Uì–Z[¬_²ØeíF;+m]#5-£ŠÎ‡	Å\rEõ7\0\\rq€jiGºRƒª\n9nÿ$Íãod\'F„ìpá!ÒÊÒòáÏ}Ïî\\¸{±şÆÿ×Õ™5yç<[­£‚\\CîÂ\0O.&á<aªb[ÛÚºÚí¹Ö]­molEÅ‹CÄz*‚ ‚È!w’î„ûV¼¯Ö¶v·¿mı½Ÿ<.ÓÙ™Ï<ó5Iÿğ5ïÏñş~¿­/BÂÂ$Lô[QËêÊó.NÎÉÊh1U Ì!z[;›GìV¤ó¡G=T˜ê	SøÀˆG<)ñïçcwFmOïõüøpååï?ŸHI¢»N—‹}ı¼à\04S@Ä÷óóCWEş¢E\nxBX83G bñtÏƒIy{r÷	î•%dyq˜líÃfòÜ]g©ş»âÿ¹ \\£WÈ4’`T«\rVéÊ¨ĞèğH-¡°E3§»½µú«º¶[Î–)kOÍ7\'­:]Ôš•]6¥f7Bh@–BJ¯6ùR5íË{wlIÛºùPü7	eEÅÏîÛ­µmõÅÖÚkèVcq—¥òÖ`ÊYQîÙs\'Ch#ö–¾6S­¡¿İ4êh™è³İh»©nğ?A‘¢À!¨	ˆû»k~qûÙırãàîÀãÉ—ÿz\"÷c¸ÌÒÉeş\"\Zƒ \Z‚P(B ’}“j l‘K$b\nŞ<ò\n“ó.$®“\Z‚EpX|€cÓ]ß[¸d^øüP½N*\'ôz¹Z+#ô¦	8i€Ì‡/–ªe_o>[Ø|$».ıš%)«îT¡-*ËAKmú_p7$nÚ˜£úµ_™ëëMw™«;M¥í\r7ZKÛLeM•£½Ö½U7rÏ?ØÕb¼ÕßpÍµ=¶z(à¨ ÌÖŸG“)õM	|jˆ¼¾5lzöÀşüqïóGı?=DMxùÇ×.ŸdÎœ®—K!:ø	™Bî<E%ç8T1Œl>È-<_ÈRì(ÅQ;Q\\2s¹Àš\0ì6{–Ëë4•T¼|ñ¼Eaaa\nb®:<ŒĞj¤\nUP0š¸R*\'‚Š@…«‡xGâÉ\"Cï¾3%Ç‹Z\'\n¬HÏcWÌéÎ«vNv$¸”ì\ZZü¦ƒßlÜ·->é“¿}1`·ßŸ€âìæÊÆsmqgsU»©¢¥áæİ‚á.ÿÒ©ŠâÜ±Ön‹ÁV_Ñe®ê2c µÉÁö‰~3·­î¦\ZÅ’Ö ‹àg?ÜGK5?¹ÓùÃ}û/O_<ŸkùÇ“bøÒ=•;ÂÀÀ  @n|!åH:Ş\\62‘Î;_LíÁQŠCªâ‰œE¸¼îêáâÂpCÏá¼»$6Z«ViC¤j¥D.÷ó—û‹•Aji:X®”H=½}cã>ºz³-=§SÈ±«æcWšÒsê3ò,`G\Z\'82\0nç¶”Û$ì<´ö³>˜œ˜é¸Æ²æªünKM‹±Ô\\[RW~ÕÖXÑÛfª.ÍÏ>wl¨ÛÚÑŒ,¾Ùi©èjv˜1”Üë‹ñ¾fÅôÿNpT» ªÖ`JırÈ^÷âéÀİQë¯Ï†_<zùë$Ù^\\wí2&/½Bà+Æã‰\ZÏbqÈôäú\nY\"—åÁ†¸@ŠÚï¤òZóvgxÎñör£3<ÈıQ—i.,Oo—·?ûáÛoÇ†‡/ÒëUB&–„Á\"¡:(0ŒP„„^AHC¸|iRzvneÇ¬\nŒ#)9Æ£9õ”âş\\Â´ÛmßŠinËó\'Ç†õ¦rsõ5È\rÔ +h­©¦¤¹¶´¦ìZEqÀ¡Å€Y¯n°ÛLCm2,à‚\'şH	j¸£ªhâ+ŠïëİÁ–‡£í?ŞéyvÛşÛÓÑ—/îş0éxñp”íöz€»êéÆğ!·ÅÅ0ªHL1‡ÜÚåÑù”¦(dTNópõ;,¼\\½½\\½„.ÓÕİ‡Áúä½÷ŞY¼ì¢uQ!ÈN_QH@ú†ÒH•\"BI„*çÒhs>ü|k‘Ñqà|YÚ•Ä1Ò¥šœá´÷Ù	nÇÖä-›7}½k_âş_Ÿ?r´t4v7W´Õ—4UÛêoöµ5:l\r]CSMYåü¶æ:ødxóš­©’\ZåÆ[ïŒuQÔÆz›F{LxbZ6µ@õêàßâ‰Åa©º7Ô6foº?ÜşËƒ¡‡Ÿİîùã×;Ÿ¬~ÓuÆ4ÔlC \nø¡\'0D¾l1BÀqéBò\ZÇ­sj»u\r=îÎD`jw×ƒí=Ë=€+|/fI\\ttŒ^??4:L©Qøûğb&HAÍ%äª\0Õ4šklÜ‡9e–´œZ¸Ôô|r6ù\"„F8\';ã+pÛ6‘rÛŸğ}Æ‰ÿüúSoGSÍ\0j6C1äÖÙ\\c®-…ÜîöÜ´×–6Õ•·›k«JòJ\n.6J\0nb¨\rq{¤¼†í\rƒ]ÆNÃPw=©)§è(|Ô^Ä8âhD€]¿­áñXï@[}ŸÍğÃdÿ/F0*Oô˜ÿ×ò9Óh4•\\í/ˆ9~\"o¾Gà)1¡;_>ÇgŠàÁØ²–An$/2Z8,X,¯YŒ,ª€àùpU\nb¡VKÊä~ä5b€óã…ùÌUJh‰\0xÎtÏ˜%œË¯=SdNÊ¼‰l…èeÖ¹`¤À!sÁªqG¶Äïÿğ¯¯)¯xvwşÖ:km‘­¾¬µ¡ÜRwÃX^PWVĞ\0·_pùÂéŒ3)ÆÊ’²Â+åE¹}Í½&Ptài»Õß\nóLìjíA¥³RàÈ3ÆÉÄı±N|ˆ¯ã}–ñŞVL‚øO0	â«ç0Ûºê0ÙÙmÆ\0!“š?P\"’:Ë™PÄ LrÈ`2¸ò¼ŸÇàğ½°fàXL¾—;©Š$¥»1ĞRg½6Ã—%ğ>;€Éz?666\"d~ˆ\"R£UÉdr‰¿,ÈO.ñ%z©xF\Z«”{OŸ)•êRN_?yÍrğBuò…Ê³…\rè©¹‡/`$0cÁ˜{¿}ÛÁÏ>^ßf¶şˆÚVßc­¦À!O-u¥%yY™ß\'g~Ÿz.#õÈŞïâ¿)ÎÏ®)+B½ƒ<aªC=æáŞf´WÏ‡ÄtÎ%(s˜Bºî·áó¡îFÃİ–ŞVƒ\r#v3¾B÷€*{ÛjÈ-ƒQûüp=ß›<õáçªq9|8»ŸÉ8Pcrtß¹ `Ğ¹¨‰ds!ÙœÇl†‹ıu	›³4\"bYTD´F®R«ƒ¥Ò\01ÀÁ~äkJIL˜rå‚H©€¯×Ï;|òêñ« S—z¹&=»*=¿ùh¤g¢á‰5mÓæ¤Û¬_÷ÍÄĞĞ÷Fu§ÕXêì§xŞ¼~9óHbÂ¡o>”¼/1as|Ö©cÖ†\ZK}e_§e¤·u´Ñ2è µ\nä¦S72s‰•ê­P¨İí¸=hq4+~€Š)Ê~õäP«s;¾İa«r„İùëŠ7çL›¹ñ¼ÉSWrîe“à =ø(ÍqjÍIÍ¹éF8Ù¬9î,7ÚLæÌ9R?Š –D„†Hüurf‘@_Q°¿,Ğ‡ˆôòÀ:â½…¡QZe\\ÜŠ£ç3òêæ\ZàödUÉ6R°@\rºCŠ‹ßvhË–Ä­›w>¹çşXï`»Šë4U@k¦Ê’S]íÂS©É©ûöLI=‘’š~ğHjÒŞöæÆNk£½Õ4ÜcC™°õu5‚Zo« †íh8,ÿJ0‘tèàs`‚Ü°\08êÇ·ÈT}v·p»­U}uğ­Ÿ¯Y5ƒö\Z¨B+€â ˜yr›—ÁcÒ9o6l<tÇá\ny|6GH÷æ OQà¼çĞé.Ş^³<İgx¢3xLŸÅœ1“\n¨ˆZ•BÄ×Iåäõ&‘4ÀW(†GQJÄè­Ñê€è0Õ»¬:}¥ää5ã‘‹•äM¯lt	Ø‘¦5ÛHÃš¶mgò†\rñ‡$?¹®e ÍĞÛRã° \'”ËŠÚkÍ5³N¦$§ìİ—¼w_Æá”Ä[M5•]-&›©¦·ÃŒ&;ÔcíqR\082õM84V€sNØŠÃ‡øŠúv ³x,ë†ÂÚÕRñâéíOV­8U°VÄ‹…ştwòÖ9‡ÎeAht.‡-À”\'àûr9\"–Ól‘m-uìÜgy°İ¼¹®îŒÓ´bÑÛóÂiˆĞà@D¢ğ£«ªäÁ*y\"È_è¯“ë~:•lÑË_¸vîzı¡¬›NÑ)­XSiK¦êß×®¿’“÷èîx_‡	©Úc­…âjnä5×”@w¥Ws2;ôíîÄÛRöíÇ³´ ¯§­Åfª¸ş.3D7`7SyŠ2G	\nA5ªÀMu†WŠs6_ÈÔÈw Ù*\nÌÆBŒ‡q‹æ»Ïp\r#UÏ\0’\nXWòú¹À÷Õõ$§Ùbº³XnL{ğÑYnî|7W±—K¬Nşá²ùKÃÕK#CÔşş\n__€S+¤\ZBF’\0­4xnˆšP2¥.1õÜ¹¢FJqä…¥ÜFP£ŞºÆ\Zàğ¤}óõŞO>]k³¶<¾7Ñ×ÑĞg«no(…âZÈlµ\ZÊe7ò²®d<‘rğàw	‡öìŞ»s{æ‰ã½í¶¶f#UæĞ%ÀÈ}øËS\\ğDª:‡¸Wr£ò”JUÀa.ÁÈ½¦‰»Ãv«¡¢0»ÃR^[–/óóáz2‘§\0‡1,m,>‹<mà’O¾³™rĞj;rc¹28n èÉv›ÃœM‹Vú®{ñ±¡±¡²¸H­^Døùş~JY!’(üĞ.B5aJB²#éÄ™#Zj†óšùT†bAÖä8p“·\'=º5Ğeêm©BKµ›«;šjĞì-u†²«…—Ï\\:}ñTzòşo÷ìØüíÖøC{¾í²6Cq(sCVLvHØán²?àIÉG#Sà¦ä†²1Í9o<¹İwg¨ccI^æÑÖâ¼óŞ®³|†.\"G9¡?òàà½øÿ‡¡„ ƒG\'7BH#pÈS$)ÎÛÅ•ãáê9¶&.bÿæâæÊ¢	Ÿh¥ß|µ&\\N¾\0Å2)À!4R™ÄŸĞª£	õ‚og¼b _ŒuöÖ)¡!C!=Š íë\r»÷—ôdòÁ½‘á;ıİCíM­†òÆÊ¢öæj$,FSè®²è2D—›u2#y_Ò{¶oùâ£5–újkCU{S£Õ\0×5äÀ brz~tí˜éÈ½¦á6Ô/òê	y–Ø…&€¢ÖÛV‡ÆŠÒ¦˜‡QÚ?üá^ÿıÑnSUá•óé¶ÜÌ³³h4SJ\\7Ãø2Y—·\'ÖL&›Ãá	0Û‘M–\'¤ó1|ì93fyÍqwŸíÈ±^ÿËº·}óş«ê–†+çiå¡JBGÈ5²`uĞ«PI‚”µJ/\'BC£ãf• ŸÂ9$+OÎ{E\nîÕ¾¦St´Ï?ş¦øZá“É;İ–æ.SMgc•¹ª¸¡¢V´­¾l¤«	^£ÜÅSi™\'ÓÎO>},9ípÒÖ¯şQ^”7h·Qsœ£İØÙR…i£Ù¨£ì0Ó‚QıÔyìß•õwÈVÚƒzñdàğ-ÒÜX_šşşØàáÄo_§Ñ|ø¾0ª¾Àaæ 3X,6Ô¸\\>ë¿àøàÈ{{ó^<+<Oİ>{ú,ww¶ßõµ™¯Ñ>\\2oİŠÅoFª–ÏÓE¨‚€L,QJ‚TAÁZ©Ó‰^®U¨ä2M€Dó×Ï6Ê¯AË(l:”]{¬ÈLQƒè¨bGuXÚG«7ÔV•ıøpr¼¯İa®³JlueßŒ7¡5€qØàºÎ?’vğ»§Ó³3O¥L<úèè`‡E­ßÚÕnptGìV€sF3Òœ\Z2ÈC†‰nDgÀøÅáé4mğdpc¿ıxë×§cäí»Ù9u—Ø×¼û¶ûìÙ>\0\' öÓa¼™àÅu‚#ÿÍVO¬™\\€xºsy¦wú_\\<Üä›šLÑLÚLï™3†(?~3vÅüğ¥Q:uH+—’r–\"=õ„*\\¥„Ó†)z~Aò÷¹KÌIçJO•´É1»ÖL:\r?É—1‹`3Ò¶mŞßÓm{zoìŞ˜c²¿µ·¥àlõõÅ¦ªëMÕ7`ï\'‡ºû;šó²N¤îßu*-éLÆ‘ã)ûS’vÙ;L­Æîã@Ÿed¨•‡2GõhŠ¼ÿ@z{rsÊ38gcµÏşËãLpøÖj€ııÑÒdPÊ$B6;ĞWâ¼ÖJŞ‡¦;gôVò$Kš8F97O¾7ÃÇËCàéÆs›Íš1İ3(H«ÓD©	/_ Fë´ËF/‰\n[<W¢Ğ¨B	%n?L£×††kÂCô?^µÜ’Yl>ŒÎPh>x©&5¯>Ÿrû\0d,h™g\n^¾ü×½ñ~\0\Zhm„èª/—åg—ä‚Tõ<älOkãİtW^péØÁİÇï9vøÛÄU…#}6€›œèî…%è4!@\r™HÕÿî¿RÜTg ª³ÆÁœşôpÂìk7Ô–äæœM+»šÙİffz»	¹(œ¼HàÇuî÷ú’[r>>Îû„TsÀŒâæÎãpü½=…sfa\0È¥úE1ï,‰[5/jÉâ…ËcÇ½¿rN«ŠŸ¦‹‰Ò/Š›§×E¨5¡„:„Ğ„(u!J=\"4bÉ÷çŠ®ŞlËÈ©Ë(h¦ŞíOËoD‹øóE}ÒŠå\Zh9Kşøíßÿùùùó“CíÍ³ÁRM¾×s/\\>w-ç<ú)ğÚÃñ^t½WÎ—åÍJOÚ¾ácü=oµcˆ¹Ëao3 H‘ãˆSSè§Ôiáıñ6´€CæN¾TÀÉ>½ã@Ã·=­µ˜àoõtÏ™=éå	ÅÁ3péBS@Şïåø ÄÎ@9#ßşu‚c3}ø\\/w®§+ıÓ¿\\õÁÚÅKŞ›??N2ïƒ5ëÎg_YúN D¦U*\"Cˆazˆ.L©ÒJµB¥VhU„¡	_V\\Ù~\nm!³âLIÀ»fùşºz	A]×.)1£®Òpoôöï?ı<Şİq«§cÂÑ>Ğni®­hi¬-º’…Nz2uÑå³å+¯]¨/Ë+:“²óëOßŠ9}p÷­Ş¸´‚ŞvÒÛ£„á‰éì•Kw†³3\0€R¦k|‚,şùÑ ˆÍ7¡8€{ñx¼¨(wÚk4xQ$\\=Û—Ëàc”`úˆ™\"_¦HÄ	YÎ}$Œ LõÊ9}‹íÎQ¨÷}—ºfÍºØ%ï½÷Ş\'s£—Ç.ÿÛéœòÛ÷š0]ˆféÂ¨)p\Z¡VhTDˆJª\"Âusß,®éNËªLË6œ¼Şš–gÎ(´fX¦Şâú³èhë>ß²õë„¤]û¯œ»PUP0`³XkÊ¡¸–ú*cuœ|}Õ²‚K¥ùYW/œ8“š˜²\'şË÷ãV/ˆÑ9¸û^oë€Íˆ™Ò\Zå¢†í\r¤gk¥ngb\"¡l¨QzÄËñãı>L¿ä	d¯¹Ë\\m·Ö¾üíéúõŸı…Fó÷#oÓÀ{ú	%Ô&¥]$†á÷ÁxµÇÃ“)`ys/Ï\'ÙŸ¾êıÏA-&fÅ[+?Ÿ·ìÃÙ7›º&>Z»Q­VGé4‹#Éã.¤ªN©Ö°¡je¾‰\\øyàp±úT¡•ü‡òÌiùM˜EÒòéWëÉwâ®:_ğÊ­MÎ©¡mÛºwkÚ\r{v¯ß±áı5oÏœ,ÖˆXˆÀ¥¡ÚåsÃâ¢ô‹C‰ù*I¬Zò¶Nº2\\¾2šX%ûjÍ2GcÉp‡¶|¤ÏÚÓMzÊ<-µ¿õŞH×ƒ1;‚šHĞ\r¨=%\nìÄÓñ?O>\Zë¸;„ògê4WÜµ¿üıgI ¯y‡š/äûŒ-¢ú€ÛWDBqÔµC–ã.Ÿ!àºÑ%<?Ï×=]hnÑá‹÷\'¦¬ıûúÏ>]·jõº¹‹Ş÷ÖG‰\'ó.V4Ÿ»Z°ç°Lª\\¶ 6&4jyÄÂ·\"ÍWFFêæëç.\rÔ,ørÿÉô+µ™e-Ç¯6¿Úx¦Øzòš%=·áx~“sıÕÙ XÓ¶lMŞöeÒ-’¶ìYûÎûoF„.ĞÆh¤±Úà|Y¨*.Bµ4ŒX&[I|0—XI¬Z Z)İùÅÊ_&²l|°µİVƒœ¥¶‰@p¢Ï…™ögÅA\\øà~¼3ğÓ½Çãäeëş:”¹ûã=O&‡èŞn6]$’/lQ—¤ÔÄ, #OH¡	A\rJä¹3xb¾—@Ì“l\\¿sÛøÍ;6oÚöÅ?7¿ñÖê…ï|\npÙ•-Y×\rg.]ß¿G¬Š›·4.êEš¨hõ<™D§\n]²fCBJvå©\"Ó©¢æ£¹up©GsÈ£çaM#ğM£‚¶9şğ¶MöíLNÚ±ïÓï,Ó,PÆhç>o¨$Ë´Aqúàå¡AoG¯Š\">ŒR¬®¯ŠÓùKXÿòÿİêi²®÷Û:¬ÕT®æ8Ø†)ÅAkTg Œ*µp?İz0ÒÅ!ÛL%ÖÊÇ“°w¯M£y¡«\n…¾‡îJ½e$ä¹s€àŞ|®7|µ‹ë›%ğâ\né¸ÅQK““Å³sû¶İ»v~·#ü¿Á¼ñ×u	ÇsÏ—Z]®Î,0\\È«ùjcBXÈ…X½,êÍ7¢Wè´o¬şlûùÂ¦³7¬ĞZò¥ª´œºïL©Ù†#j :°£vÌÉÓ\';|N‚Û–°ıÀîÍ»>÷İ¸pMŒÊ?*˜³€à/W‹WèüWF®ŒXé¿fnàš¹AkÂWFÊ–©}K3S^>¿5î05Õ\\ƒĞÈ#K\rÈVêR´öpÜ˜j¥ÀQ³Ö¸_=»İƒ11\0Û{ÃR_üÛÏ÷¿øxåL—i,]ä#b±ù^pÈZ‡+ä¸³EÎÎÀöä O©“S¦\'ù¡çl:ÛC°öã\r{vØµ=qËæí;vìúnßş\r[v®øô«G³O[“ÎŞL»P}æªéúÍ–lø.D Ö«•‹¿X¿ÿ\\^cvYGF¬híÁ•èø=·#Ùu\'Š¬S³Xcş.FÅöHS\0\0\0\0IEND®B`‚','220px-Pete_Sampras_crop.jpg',25867,'2014-01-10 17:17:28','image/png',39,'\0'),(58,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\04\0\0\04\0\0\0J\ZŒ¼\0\0	IDATxÚM—wT“i·öóÇwÎZç}gF©é=t¥¨¨£bgtìJé@¨ÒÒ!tT”^BeF¥¡wAltÁ:pœ9;rÎ·ÎZ{İ+yÒ~¹öŞ×Ş¢i`´®k°¶sğ÷–îk\r­×ZË«Õª7óÊn\\.¸–r¥(öBVtlúyI²0<–+1|#}øÑ^œó>üon¸\';Ü‡ÉäE3¸Q,_ÇOÆóU°8R/F”GÂäÉ˜\\)ËWÁñ“DEI¿®¼Xy7¾üqúáÔTÜÕkòÜºÈìi~³øj4G-ÎnˆÎnçª%¹jqNƒ(§ñËIö‰sg<CÎx?G>íáÁˆ¦³ÄŞìhOf„+Ò›íáéÍ3¹r6?†Á•Ò¹bˆé\'öáK˜¾1>\\™7SÌäI™|	%¢3Ä^>ğq-÷fÉ¼ØQŞ¼ğsÁèØà_«3?}ú²¡ªTd×ÈrÕ¢Ü¦ğÌjiv½°²u@Ò¼FùÿÂKÇ!õbIà¤³%^L±KîÁR¸³$t_‰;+Ò“íÃ‘ú°ágà:ŞåÍ‰òñ1}el’ËQ2Ù1tø 3ÒƒNgEø°Eî#ƒoƒÏzqB“/¥üµºøåãäÊêlÿè}eÎ-iNƒ,¿Q”S‘S[/Ê©…çÖÉòê¥Ù5ŠüFqN=Â›-ödŠ\0ÂåÍ”À—z2¥p4ódE2øR:GäÁŸÓı™GÌä‹éÜ:;ŒÎ…œFğ|%L¾ŒÁ‹ñdKÏ°£<yÑ><‰\'[¬S”%a°¥,~ØÒ‹©•ÏOV—\'?®,fVÊ³ke¹²ü&YA“8·A’S/ËÕ…<¯AW¯È«)h’ç7r\".È&ò`D;=úœW„—OÅ(˜\\±73’®KÄ›\'cñ£yü`¾ŸÏp™.ƒËóáòCX>ç½é:ÙÎr¢Î²£=ØP”º/dp%tfxyùµÕ•ùÕÏ¾¬.tÜé•_½¡Èk‚œJòÔ’ìz9Pæ4Èørêd9µÊÂF€]Ì(OHJ-B§KÊ`K¸\\	—#f³ÅF—+eBı1¢¼˜áŸË<{úØ_öºİãxd‡ÍW\nıgGö™£/‹+„ò¢óä¾‚Ãò…?#†Hß¿_\\ı4¹üááÛ?“³T²<H(¨U#Ê\Zµ\"G-Ïµ\ZbòÕÀ98e‘F©Ò‚r‘¬pv„ò(òbˆ˜,1+asÅtN‚éåNg‡3Ø\\×±“nö?o3;ºÍüÄ«ãÛÌ»Pû6:	Oíô÷9ç/ˆ„š;ã!p÷xûxx±úz:¾.ƒl÷—WæojÚ¥¹UÒ‚šØu|a³\"_WÔt‚åşßÌ6Ä6A àÏ±tE5áîâåæI:ëîwâ,ÿÄ9ß³ğtz —\'Ãıô/»i¿şhÁ<âèµßöğ&Ü£CV‡í§\\É>lÎìs…×k´ušÖú&mS‹¦§¯ùï¯/–ßO|şôpz~:.³L–{KVXU›§–SK™ß¸&œ²o™)hÔÁ4\"S/¦]ÊºšWTRQU~ı÷Êßn×¨›\Z[µÍ]]šî¾æöîÆ–ö†ÆÖÚ›U§öÛwÅtE±šÛ9ã‚dìÀsöĞ;áÜ6¢÷ØM‰Í,İ½x§=ı¬0îâÂäç?˜X^}^p½:!¯V[•uK|õ–,«V’]+…ÎÈÒ…˜ò\Z”€r6Å6+š±Êt©$%2\".,T(”úù‰™ìĞstÁi/ÿ3^Áî^!^¡táéã?+‡Òü·g‡î©K§WÈå»eúnKaoåŞ¸İ\ZoŠ×3ÁaObĞ9>ÌĞ²²ò/Ğã_–§<‘_.’gÕÈsêÁ/ä¹µ1P^9u\0\'Ï®SäÔ¯ hLnÃÚ‰`qD”ç+çòeL°	„í!şvJX|‹Åò8´×¹9×ïfÌşÚä_z¼ï—ûõez¶¥S…î<·`C0 ¢ğ(C\nçì¼G,‡½{·ğeyfõÏ‰ååW‹®Ësn*òêÖ2)ƒS’UppE±fùÒ¬úµFÖ¹`®\ZÁàŠ\0È‡#bpÅ,¾ŒÍ—ëª¯ƒãøÉ}8QŞ¬p?êäŞí—™m™GzóNß-ò¾“ëÑ’ğs|wĞÑc\'fü	ƒ6Ğ×Ç`ˆ.[÷ñÁİ=Ú/+s+}]]èîïIÊ¸Û²œšÿó­!à1I²ª¹j9t.8K®z-\\×?‚#P°ø\n6?–ëÃó‡ˆå	”Lh)\nc„g‹Â6$íkHÚ[§t«U¸İí*\rvÊØrÚ•`GÃbŒ‘8,N_Ïp÷î½JeÌß½úòéá—•é×ï–ÒóÊ’\n¡Òkbòë×°¾©Õğÿ@ó‚ƒÄæ7)r´	éÆËO3\0†âr±ßXĞ©›˜\"/f‹/á(Â|¹Õ)ŒÚ˜ƒ51ûk”~“º‡lÍâmN¦»s&QëúëôÖ™pwïXœ{ôåıì_ï\'VWkZZ²«ä04sÀÃªÁÉÖ”ƒP6é:4r\r§Zrµn\rîf+ø‹#æûÅ²yrH%ĞÀÁH}xÑt_İ_ÂàGs§eü=%âc7dGªâgGîKà9GŸµ‹>µÅÿ§-$Æ`½­)æğ6»¼ŒÄ•O³«Àu\'ç^.Ä\\-Ë¹˜[¯Ìo’æÁÒQ·R£9uâ«ÕÑ™·@6Yv½ø\n4JCl~£<«A¥ÉiB°y€¢³ro×/à`XAp2¿Œå\'a	¤ \\ ŸpJo7Í(–ıãVòZ\Z¬³Ç\Zo\'0všÈéÛÎî±¡èÿ—«…ÑA{rËmÕêÇ‡«Ó//T7ë\nªc³oÇ^½­Ğ5x˜ü›ŸéÒ\n9ÍÕ`1 UN# Ê²ëäÙĞ­MÊ|\r‚ç¯`ùI¡à¸şJ~@<W €8~€ÜW¸R6Oäë­ˆõt;åˆê¯=½ÍĞÆğ?v˜\Zœt\"†İÇpæü¼Ñ‘´µßÖk·Õë™¡Oïï-/O=š}*¿TW¨VdWÇeÕÄëlL½–Sèƒ„\"M|A“2W›Ó“û;¯\ZòÃşL	,glÜG·ÉpA6_¡Â×_áç¯\nbx\nE¿ú²Wo6c$Ÿ[§<¦¹LWE¨Ou/\nÛ}ÜşØò.kTØ©mùrŞ?+óË,¯,f•ŞˆË¯‘å×ÅäÖ%äÔÅçÖ*¿5hÕ–XÜ’T¨‰ÏkŒË…!Ğ\0[\0SK-Ï¯ƒˆ)l@Ğa_åëöD¿òÈ\0‡ƒl\n¤PèS¾¯”ÇŠğ@:3p¢$¼ï*·!öTµülÿ†üp<s+ã å>\'ê.{¢ç/[g‡W>=úkejhl(¡Œ\r¦x½²¨fhÜ·‰©{Z¬Ç\0­ëß\"uLQƒ.\n@TxU£ø–zĞÁPê|Ä_î#‰ó\rŠ…à	ÁVÄ|à„Ja€Â_à/õ;|Ê÷Ã9gŠÂ{KäiçĞ[Y‡ìö9]7‘]hîÇvÿıåùò‡©wÒ\nJK`]S+UÍŠoöpñÅ\Z [€Sæƒ‰4(‹c‹Õ±*u\\qs‚JWÜ\"ÿ–Sx3‚ÿÍäÀí\0/Ô%T×\nP…|q€0ÖO cııåÜ€0.ã\\¨ûámcîÁ-©¿Ùiéj‰Û³™æbKt¶£¸Ø›9ºçï/o>¼_lîéIQİN(Ö­=Šâ&y¡nëì#¾´„âkŒ/i8E!,˜0U5q*­òŞ Ñu+\ZV ‡´²ùbOÌó•B©	\n¡06$4ZÕ?06 :ÎW ğÚ»Õ{§\r÷GÛ€›;O´Ûb‹ßlE°5Å9ÛPw;Y–\\š¾”YQªR\'6%©41EêØM\\)H¢YËi¼ª\"±¤%¡¨)AÕœP\n¯6Å•4rñÅ-ñ%­qª–„mb‰‰ãƒ0ß\\ƒ©3)_(ç•‚ÀxapŒ0D¬ôŠB$	t÷é¡î{n^;Íbıìq\"Ø[à¬É$*ÑÉšì¶ukˆÅSlvŸdeiñy7/”6%YÔ\'•j¡âê2J\ZãóÔie]IÍ©¥Ú¤Òæ”ò¥ª%® [×dƒvFpa\0äl?]p„1œÀPæ¬ôŠ?–ª\rUİ¸6·0½İ‘ò¤+[pÌ&9ød|Ğénv›,±f$”%¿Ù†²c“É>W{ÆƒÂ£$#ChE3wÜÿ‹w$#­¸6¥´A™_“\njåÖ&kMz•:©¼!©B“T¦I.Ó¤”·‚Zñ*ÈlS|q$!ˆñ&Œ-²äl¡Â?$>04V(\r	’$\'$ÍN=øgué¯•[í_äGœ³öŞo~t—µƒ%Ş‚†İ`Aq°¦9Úwl2uİhnô¯côQh}M$¢ˆ4‚‰ÍÚÜj³ÃV·S,aD|F¦ª:SÕ|µ¤á²êfFñ­ªÚôÊÖ„’¦ärÈicb‰&±T“\0b«\ZŠÔ Š÷„Æ†%	ücB‚d	q)ím-_WÿXù8»úÇƒ•O¶æúÍI·R¼¹mm³Şê`aeN°²\"Úo »l4İãlã`BÀ¯×Çë!QúÆ$„#ÓH&&TSšH3µ´µ±qvrqméÍúãSÅ‹7•Íıå×/Uµ^ú½3ãF{Æ”\nmrEKRYs’ªá ñP…§ø)BÂbƒ%••¿?_|öÏ×ÿ|yõÏòÂ×S_?Í¬.¿àzü-ƒû{Ê™Ogƒö\'¸îÛ¾ÙÕÁr‹­Åbs‚¡!VÏ­‡!`H8D$›PLMÈ&æ3S²‰ÅÔÚÌj£•Ÿ¿Ã—¿.~ıšø×WùÛ¯Ñµ]W²*º®T¶]ºŞ‘Q¥Í¸¡Íü­;£²=IÕ„†*… Yˆò|TbHˆXU\\ºüùÍ_ËK«æşşôìŸ•gùòçÄ§W“½š[»7àË“Ùa§ö˜ûyÛáİ.»]6»ØXÙÒ¨DCCãïÖáŒĞX#K\"‘¨\"™D¤PI4SŠ™ÕÜÂÌÒ”F¸]ëÿfõüë• gøÃÏ<jS²®7f]o½\\Ù~]›^Ùr¡\\›VÑ\n|ÿ8ˆ È¤€Àè´”´ÕÏo`=\\ùsòë»©¿ßOy÷ôË{ˆ‡«o\'¾~|V‘º™b|z—Ãn{K3“-7Z’È$#4ú{}Ô†h}c¬1‹Æ‘ˆT*ÕŒB1#‘hTŠùZPÈ¦4Š	gT\\|æÑoì)£ûÎéß›åWŠ*«¯T4]¾ÖvñzûåªÎ‹×;Ò¯µ\"\"à|BPdJpTR´HùÇ«çŸßN-¿²¯ïfÿyÿäËÛGï_>øsiôù¡K÷Ş-ŒÍ÷KyXıïQzh}CäúX=z\n«Á£pX‡Á‘p$2šl‚71\'š›ÌIĞx*K´!ê*Ë®ü­üxå•£ñ¢ÍEi|U^eVes&ÀU´^(oÙ ’KšĞÁ	ABiÃíÚÕO¯ß/M¬¾x°ür|ùõã•W¿¼y¸úfâÓ‹±wÏFş˜zñ¤oñqßÂ“ÁÈ .ÎPµŞmˆ1^Æ\"±hC	G!ãi$<•JÒ1™’Ì-IfD3\ZÑ”¬»hFB“ğ†z‰çOğO™3NnªRz§DzŠÜ3Å¡WËêSKÚ3J[.\\ëL.kK­è€@CÂÃSÏ‡ÊÆG†?¼|úòÉàÇÅÑÏ¯&Ş-ŞÿsaìÃÒıO/ïx>öv~ä¹aX‡–ÌLv?›\ZÚµÕDâXš„1Ä@BIX2•@£LLÉfd`¢à©d…ôí„ë&Sœ¾‘ÿ	M®à•^nÀ©Ü˜PexĞy¯“E%UªæKåmIeíI¥­À9Ÿtş|Rd˜læáèÒÓ¡¹ÉşgÓ£/\'^Î¾šùãÙØë¹á?—Æ^Íİ}9;üznäÅÌğâÔÀÌÃÑA-kD%(\ZÑ„€\"Pñ43’¹9‘tp Gù–P\n™@£`©$$ÁŠbæ½wSW®_iô‘œÙ\"öµÌ„pöI‰DyQÕT¦ÓÈRÊÛa©a‰’2æŸŒLw\rw÷õV×ßèiš4ørväõÂ½Wó#Ï§‡—¦†^ÌÜ}97ò|f`öq×ÓñîìÌ$c=\nL@L	43¼©ÑÜêŒ`\ni¥’-ˆ$‘\n·d`.x<‰5Áá:˜F°Häì¹ÈŒÙ¿Åö¼(>£D›ZÔœ\\ÖX0*@?DpXbèye^nÑÈkgãÀ`gD¢rxôÎãÑŞ¥©»@ófaôÕü½Ws÷Öø^Î½œ\\š˜{Ò3?İöôO8ŠD\"PId\ZbJ6£é\nÎÔŒD³ XPp4“ˆ×iDÅÈCÆ’l±†…RO™»uÄ™M§vZqÛú££còåÒÔò¶´ªîôëÊ;ÒKÚÓÊ;¡ç“#\"âËK*îu÷k5õ¿©µê¶¦mS÷ûæ\r,>½³4­Ól-ŞÌ¾½û|fèùìğüÔÀÒÂW{<…ÇàMi–à 0_\n™D\"“Áçpdè\n¤•HC£ğúHMışÿU%1‹\"Eœut?èôÓ®mÛ]÷¤çß„&¹¬5µ¢=­¢à’KZAÁñ!Aò†êÚÑ~íışæ¡®ÆÊ’œ›×\nïõk\'îvNMôÏ=XÁfG@<]Z§ï¾y=?úrşŞëg£Ïg†º¨8$LPsS+\n•Š\'âñDÕª²I\0Ù0gñ}=#‡Ùçl›-õ‰åˆbŞioêìè,‰ÏÌ¼¦¹XÙZÖ¦ë•öBqk’J‹ğukÛîõ7÷¶İ||¿çöü¼¬ÔáÖ‘í£û½O\'úæBNâÍÜØŸão¼œƒ§ï–Fß¾˜à™ê*gB¦X˜‚~T<C@aÌpdœ!†ˆ!‚-ÿğ4·Şz½3Ç~:¼Ãa‹ùG;ë=ÎN¦&‚d/]oË¨Ğ^ªìN.mK)måR@¹°¤°`Åİ¾ÑŞÆ¡Îš{}ãÃí¥ù£m;ôÌN>Ÿ\ZÑiöM<ßÂ„®\ng†ß>ğæÙÄôÃ»4Œ‘µ	•L&ÉH&PH0Ä¼x2&\"õĞhC0Gƒı»\\voqt¶¶w²±wut¶1·±´ŞR|»/ãFÏ…²ÎŒÒ´ÒT•6EÕŒ†[Aä“÷îõ¨Ûª‡»\ZöVß(\Zíoéi™êœ˜{80ÿ¨ÿÙ“A@\\ãƒ€§Ïö¿~v÷ıË‰·Ï\'ãDÁ6’	F$‘‰xÎGDIĞ\r\0‡\" \r±8$qı¿ ¢ôı¸cÛÆÍ›,7ØYZØ[ÛñæñåÊZ/Vv_,ïÊ(ïºPÒšªÒ D‘)¡Á¢¥ÙÇ÷z\Z®¿µ®§¥¦K£‹võı;íOÀHšì…XúV| œğtz¼ëåÌğûç+oŸ>:BF\Z0ºò‚<’1dŒø3œ™ˆ!#õÑzß\Z­G\Zı`@44>}èĞ.64Ó\r&”mv¶N6ït;‘ı[gZE{FygzY§®Dƒˆ‹—K•ÏçÀ:šúZnu6\r´÷¶6ÜéÖ4×^‡²›~88÷hğéıÎÇ£ísûÖø@6¸2;Ñ7=Ö;?1ğ~qòı‹‡İv˜S,M°4Š1‘ŒåHx&±dÍhÒxÒè;C\nwp«ëÎMNvfæ6ü3\'KssÇÜ*hmji[ªª-­´íBI\"\"<áâ…ËGîvÖ\r´ÕµÕWİ,Ï/¼š¡ÊÉTß¾>~·ëÉxßôDÿäpÇãÑÎ¹‡ı/fF^ÎB¢ŸŒu×LwÎM‚–Ó“=	²H\n†B8,Ö`ğcìPx†hÊ}g`´ÎØğ;=Âú¿ü¸}ç&û–,iÖÔC.öóU#Ô,NàsĞp\"Î‡ÇU]»17qg¤«¡GSÓ^+M©¸”””¯ìÒNŞë{2Ş?9Ò9~§\rhf\'A¹áçÓ#3}Àúø^×ÄP€îƒ!ÍoeXÔB ÆX–„Dâ\rÖ!õ¿3Ğû—¾ÑéQõ\rİ6;l67·¢R¬Í(ö–Ô½Î¶÷ºe–7¤•µ¤¨4©e:“Óù\\`¸C«aî÷5w¨oöjêËr³e²D¹¬·µy¤¿}ò^ÏøpÇÄPûÓûİ3½Ï§ïÂä\0¸©=ÀõÙãáş¶ÛEWÓq†8PV‡Fâ°hOÆ\0¨\Zùƒ.§˜ÖoÀ#îtÙ¶ÁÊÖ„ê`k½ÑÒÌe£•““Ëå’šÔ’æ´r•\0X1B Ÿ›~<~G{·³şnws¦ºª$÷R²2&:¢æFåHÇøİÉ‘îG#]@pÖgO†€	âñXtñ›ùqè¦^í-?¦Á˜\0#n ğXG8´1ƒ$ ô1ÈïŒQß ÿıŸÌã»»ÚìvØ°ÉÂÜnƒÕ33k;Û®ÉÙUJ5)¥Z >r1ÒÄ…G\':º›n\ruªG{57Ëóò¯\\H‰“_MOº7\0Êu‚ó=í›œtdƒ€OŞm[x›Á=0ä‘¦–Ú#ö°d¸ÁâÑ\ZÅâH(#<Î\0cğİz}€û×¿øÇöıºsóV;›MÖVVÖÖ6ì·îü)£´1©TãàÖ2‹È¹š÷bvòA¿v@[×Ñxë^¯vb¸;;=>ÿJÚ¥Tåı‘î£0\'@›\'£İï¬uÃ£{ $LŞ·‹ã¯æÆz4·z[ëm-Í)\"Ái\\x,†€FaQ}‚Ñz˜\rh€Áaö8múe×¶mœmm]lí¶mrvŞä\Z•xùš¦~z%ìè©0dËZ#Cc/f÷··Ü¾ş{YAıïe÷;Fû[K².$ËÃúÛëLôßíx8Ò9=ŞK\0Ô¬R@6=ŞÍûçÒ<n¼Y2v§i°¶Kğ09*†¬³:hX#<Òˆ‚Ô\'şéÌŞıÇöí?æéÍqŞ¼iÏ6§›7;ntØ´ÑÙÑi·ªªıÒ5İ&wñFÜC¤éöu-\"16£«©õ~o×H—¶G«®¾QrC•UU|%\'IÊşuëÍÒÉ;í“w!Ú¦Ç»—¦aC^óè	¨?€ƒ¶èÓVw¶Õë­ûA·a©¬dLP\\¨õh*Ú$X}ä¨û¾Ÿ=²Kkwüè¶wû€Û¼ÑÁÁn‹Ó–ƒ…U]—*{Ò¯÷€ÃmNz%ô„–\"’{úi·­ÙÍ~ÙîxÀeÃ±-6gwndİ9;Ú1q·ışpt+¸ÚÒÓ{KS# \0ÍNö¿½ÿîÙøìDÏ“±¤8)ƒ½\rkŠ|4,†TÉàlç\Z&ær÷ñ¸X¡Î,¼±ÏO?oß·Ïq—£“=86ë÷Î‹×Ú.Wv^¬èH‡{U˜p²<Ryv¿ÛşM¦ì¨¿ºXœtµğÜií¾Ã&ÂçèÛgFzGû5[aÈ>Ÿ\Z]|¢óhU@|ûlâÕÌÈäHËôäÀ~·íPh(‹%Á­+MÆêc‰h˜z=VÈ‹8/Iäç8AÉªúŒ’¦+·wï8âºù\0Ç/&ïfoj©nªSKa1éJ+k»PÚšRÒòßÆèõy~˜à\'\0\0\0\0IEND®B`‚','220px-Pete_Sampras_crop.jpg',7490,'2014-01-10 17:17:28','image/png',39,'\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitation`
--

LOCK TABLES `invitation` WRITE;
/*!40000 ALTER TABLE `invitation` DISABLE KEYS */;
INSERT INTO `invitation` VALUES (57,NULL,NULL,NULL,NULL,NULL,0,NULL,'\0'),(58,NULL,NULL,NULL,NULL,NULL,0,NULL,'\0'),(59,'2014-01-10 17:19:11',NULL,NULL,NULL,'Ciao Pete Sampras! Posso condividere i miei score con te?',NULL,0,'\0'),(60,'2014-01-10 17:25:08',NULL,NULL,NULL,'Ciao Pete Sampras! Posso condividere i miei score con te?',NULL,0,'\0'),(61,'2014-01-10 17:28:12',NULL,NULL,NULL,'Ciao Pete Sampras! Posso condividere i miei score con te?',0,0,'\0'),(62,NULL,NULL,NULL,NULL,NULL,0,NULL,'\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (139,'Bernardo Roubach',38,38,57,NULL,'\0'),(140,'Pete Sampras',39,38,61,NULL,'\0'),(141,'Andre Agassi',NULL,38,NULL,NULL,'\0'),(142,'Patrick Rafter',NULL,38,NULL,NULL,'\0'),(143,'Pete Sampras',39,39,58,NULL,'\0'),(144,'Bernardo Roubach',38,39,62,NULL,'\0');
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
  CONSTRAINT `fk_playerinstance_player_right` FOREIGN KEY (`scoreRight_id`) REFERENCES `score` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_playerinstance_score_left` FOREIGN KEY (`scoreLeft_id`) REFERENCES `score` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_playerinstance_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerinstance`
--

LOCK TABLES `playerinstance` WRITE;
/*!40000 ALTER TABLE `playerinstance` DISABLE KEYS */;
INSERT INTO `playerinstance` VALUES (13,140,9,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(14,139,NULL,9,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerinstancecomment`
--

LOCK TABLES `playerinstancecomment` WRITE;
/*!40000 ALTER TABLE `playerinstancecomment` DISABLE KEYS */;
INSERT INTO `playerinstancecomment` VALUES (7,38,14,'Foi um prazer jogar com um dos maiores de todos os tempos! Passei um pouco de vergonha, mas foi muito legal! =)','\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (35,'Belo Horizonte','Brasil','Lob TÃªnis','\0',NULL,'','31 96862253','0d6de8af31a2dda39baf2d648662c4e9',55,56,'','',0,'','\0'),(36,'Lake Sherwood, California','United States','private','\0',NULL,'\0','','1345bbb540ffec28beba458daa26f969',57,58,'','',0,'','\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (9,'2014-01-10 00:00:00',6,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',38,NULL,0,NULL,'\0');
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (38,'Bernardo','Roubach','broubach@yahoo.com.br',NULL,'1981-04-28 17:13:48','5670f434940508df14a1825a4c144ad2','M',35,'2014-01-10 17:29:05','2014-01-10 17:27:46',NULL,NULL,NULL,NULL,'\0'),(39,'Pete','Sampras','pete.sampras@mail.com',NULL,'1971-08-12 17:16:59','576dc1060ea0b6d02640de48c28fca46','M',36,'2014-01-10 17:28:33','2014-01-10 17:16:59',NULL,NULL,NULL,NULL,'\0');
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

-- Dump completed on 2014-01-10 17:31:18
