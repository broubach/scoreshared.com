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
INSERT INTO `file` VALUES (4,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0{\0\0\0�\0\0\0a���\0\0\0	pHYs\0\0\0\0\0��\0\0\nOiCCPPhotoshop ICC profile\0\0xڝSgTS�=���BK���KoR RB���&*!	J�!��Q�EEȠ�����Q,�\n��!���������{�kּ������>�����H3Q5��B�������.@�\n$p\0�d!s�#\0�~<<+\"��\0x�\0�M��0���B�\\���t�8K�\0@z�B�\0@F���&S\0�\0`�cb�\0P-\0`\'��\0����{\0[�!��\0 e�D\0h;\0��V�E\0X0\0fK�9\0�-\00IWfH\0��\0���\0\00Q��)\0{\0`�##x\0��\0F�W<�+��*\0\0x��<�$9E�[-qWW.(�I+6aa�@.�y�2�4���\0\0������x����6��_-��\"bb���ϫp@\0\0�t~��,/�\Z�;�m��%�h^�u��f�@�\0���W�p�~<<E���������J�B[a�W}�g�_�W�l�~<�����$�2]�G�����L�ϒ	�b��G�����\"�Ib�X*�Qq�D���2�\"�B�)�%��d��,�>�5\0�j>{�-�]c�K\'Xt���\0\0�o��(�h���w��?�G�%\0�fI�q\0\0^D$.Tʳ?�\0\0D��*�A��,�����`6�B$��BB\nd�r`)��B(�Ͱ*`/�@4�Qh��p.�U�=p�a��(��	A�a!ڈb�X#����!�H�$ ɈQ\"K�5H1R�T UH�=r9�\\F��;�\02����G1���Q=��C��7\Z�F��dt1�����r�\Z=�6��Ыhڏ>C�0��3�l0.��B�8,	�c˱\"���\Z�V����cϱw�E�	6wB aAHXLXN�H� $4�	7	�Q�\'\"��K�&���b21�XH,#��/{�C�7$�C2\'��I��T��F�nR#�,��4H\Z#���dk�9�, +ȅ����3��!�[\n�b@q��S�(R�jJ��4�e�2AU��Rݨ�T5�ZB���R�Q��4u�9̓IK�����\Zhh�i��t�ݕN��W���G���w\r��ǈg(�gw��L�Ӌ�T071���oUX*�*|��\n�J�&�*/T����ުU�U�T��^S}�FU3S�	Ԗ�U��P�SSg�;���g�oT?�~Y��Y�L�OC�Q��_�� c�x,!k\r��u�5�&���|v*�����=���9C3J3W�R�f?�q��tN	�(���~���)�)�4L�1e\\k����X�H�Q�G�6����E�Y��A�J\'\\\'Gg����S�Sݧ\n�M=:��.�k���Dw�n��^��Lo��y���}/�T�m���GX�$��<�5qo</���QC]�@C�a�a�ᄑ��<��F�F�i�\\�$�m�mƣ&&!&KM�M�RM��)�;L;L���͢�֙5�=1�2��כ߷`ZxZ,����eI��Z�Yn�Z9Y�XUZ]�F���%ֻ�����N�N���gð�ɶ�����ۮ�m�}agbg�Ů��}�}��=\r���Z~s�r:V:ޚΜ�?}����/gX���3��)�i�S��Ggg�s�󈋉K��.�>.���Ƚ�Jt�q]�z��������ۯ�6�i�ܟ�4�)�Y3s���C�Q��?��0k߬~OCO�g��#/c/�W�װ��w��a�>�>r��>�<7�2�Y_�7��ȷ�O�o�_��C#�d�z��\0��%g��A�[��z|!��?:�e����A���AA�������!h�쐭!��Α�i�P~���a�a��~\'���W�?�p�X\Z�1�5w��Cs�D�D�Dޛg1O9�-J5*>�.j<�7�4�?�.fY��X�XIlK9.*�6nl��������{�/�]py�����.,:�@L�N8��A*��%�w%�\ny��g\"/�6ш�C\\*N�H*Mz�쑼5y$�3�,幄\'���L\rLݛ:��v m2=:�1����qB�!M��g�g�fvˬe����n��/��k���Y-\n�B��TZ(�*�geWf�͉�9���+��̳�ې7�����ᒶ��KW-X潬j9�<qy�\n�+�V�<���*m�O��W��~�&zMk�^�ʂ��k�U\n�}����]OX/Yߵa���>������(�x��oʿ�ܔ���Ĺd�f�f���-�[����n\r�ڴ\r�V����E�/��(ۻ��C���<��e����;?T�T�T�T6��ݵa��n��{��4���[���>ɾ�UUM�f�e�I���?�������m]�Nmq����#�׹���=TR��+�G�����w-\r6\rU����#pDy���	��\r:�v�{���vg/jB��F�S��[b[�O�>����z�G��4<YyJ�T�i��ӓg�ό���}~.��`ۢ�{�c��jo�t��E���;�;�\\�t���W�W��:_m�t�<���Oǻ�����\\k��z��{f���7����y���՞9=ݽ�zo������~r\'��˻�w\'O�_�@�A�C݇�?[�����j�w����G��������C���ˆ\r��8>99�?r����C�d�&����ˮ/~�����јѡ�򗓿m|������������x31^�V���w�w��O�| (�h���SЧ��������c3-�\0\0\0gAMA\0\0��|�Q�\0\0\0 cHRM\0\0z%\0\0��\0\0��\0\0��\0\0u0\0\0�`\0\0:�\0\0o�_�F\0\03oIDATx��y�$Y}���݈�̷�Z����z+��ai�원��F3��̙�l�H�3���=sЙ��XG��Z�Xȶ$�����@4\r	���nֆ�������2#���7\"�Fdd�|�^VU7u��efddd|�o��~�wEU�����|�IoF<w�s���A���T���3U���ם\n\n,�=N��=_�?Gp`���l��Uw�����g�$8UP(�:�;���+�_���޸�11?\0����D�]�wu�{�!�h��nֈ��X�u�>	<�l��V��[�^�X���8�;�k\n�T��D�(\no��oր�ׁ/\0<\n�����\0�K��\n?$@��׻�W��׵Tí��\n�����*�i���W���ۋ~Q�G�� W�+�7��M6>�\0/����\0�\n�%�>�n�y���2ශ/x�z{��`��I�n�?o��䷝������*�bno����\07_{2�;����\\�@/Y�3��<�SW�޾m��\0W�V����W�88������h�����Dr	�`>\0��������;x�*QHfh\r��y�ek�q\r(�U7��|\n�w��~�O:��>>.���c�\n��}�JݠĪN�n�!x���\0��&��u�\'��kJP��K��uPmS����� �:	{�B���\rpsy͇���Kj��ka�s�ֺ��j�A���7a��=�O\"�h`���ƾ5S��̺�:p�\'?��\0�hWP�.W�����R�|iaF�`�F�kֿٜ�}`�r\0{�Z�&;�Dx�s�;m�6ځU��*�)�V�ף���怗�,ƣ2�c`���K���}F�ݵ��h�z>��;`E*�2�X>W�8j�T�R��T�c�3w�sWW���͘$�+��F�=	#_$\"~�)�W�{ס4炘� YO�P�ŹĿ8�sξj�Tk͋�����\0_��R㓑�H�\'��caH�C�~!�u�ꮄ_\Z�q)C/�P0aAB��6:f�+����_��3�Ihq�����UU�A�H^\0ti�	�����nP�MU&:$��AږU�ۀ��3�l�%�3F���d�J�i� ��J[�h2��	�TҪ�4�\n����~�ic�%[��S|�l�N���\Z`��\'�����o��@k�W����j�IZ�w���\rD��r���e�v\n��X�5�հI)A��h�t��y��K\0K��;f:ڇۊ��o���\0;�>Q����Q��c��ӕ�{��Ӛ�&U���L�z���F���� ��tA��_�v��m\"Un�=C�\r�4���qt.�}��]��/4���pk�����l�}���T<dq��J[�Z�f\r@V���k�����Q�T�z�E���W�^�`����Hx\Zp�\r6��b�z!ͮ�x�С�\0t�å��Z��m����<������lUَ�}�Un@ ��g�\\%l\Z����~곢	�d��s�Z��a�{R���\Zl�u�yG�f��f�@XTHr!�.�?ꉏ!@\0���ly2!u����fo�g�՗�=\r��N��Uu�С�\\d�B\'/Z�P�iu�\\��f`7p�2eж��n�P�P���l֜Ւ!UZ�\\M���S��,���7���.S5�5�-~4\'^��H�@�}���z���y��EkU��@_�����mq�kX������Hmj3�F�&��υ�B�0y��I�?;�R#H.�\rj\\�ȕ��N�j�B���^��Tk10���XѴ�x-դ�\Z<������i��`;��T�q���`�?�R�ٕ�mG�l�T\n6�?Y�Lq��k��\'<w��h���\r�2GN_{����j0�7��9�$c�JiZ\\P(Y|.S�!)N�gm�[Г��י�-H���E�\\��Bˁ1��/��`�����	1�wf0�ʱŠ������8o~.�c��KFQ����]��nȬw\0-��@��X�:��k2\'�Ȭ?�W��cX��U�vċ�E��7\r��΅��A�)Ǿ���n�̰2���B��rI������\\\n�])^l�;��zI�\rw���R�X�80�$��ؑ�g����H�/?5~��Sv�r��o�L�{�s^�:��p(�eѕd��⥺�jsmv\n���<��O�i��᯶q�־�_|q��~�mk���\\/�Mv�q����`uf/K6B�>+A/b}�a��2�[���O8�𷈌!�_I�jp�%{��][��(��8|L���X��_0{Ӌ�w�ed���m��-0�X\0t�A�\\�+��x��*7�?����=Bgj\Z�e��\'n_�޸�I�9T���9q�	��1��֟��t�o�Ls�vH]Bf\"?@.VĻ]R� jY���Vx��yn��2M1�?̿�O����D���Yf��%�ss�[��$�O��MO�9��LO�׼��y�Y�v��y��G{m\\m���g�͚&�aD�\r�\\j��s�6�R��9�ˮh��f׹uf�k:)����*k��W�-�߿�_������8����?�_�~�4�.?������-}�T�������=�|(��7��w���RǙ�+8�ؑd�n;�7�N�-s�sx=�T��x�b�Ƭ��Uc�AĠ���mD�B����6P2B>��+��_�e�U��Ա �q�=I���.�O[L�h�EI��̈́�N�����m~��/���{�����m7\\{��f��g�f;>���۪P��ZwWf�����^� X��t{�v����J|Ld�##�l#�z��	+.�Lq:�X�+6b�E�j�M�1y,-��N>�����cn�ce�S��l��A�qL��i�1[v$��IƜ�Xh);[%s���g�Z	;g=�\"�é���,K�cf�{�����?�����-���F��v+YX][1��G���i�g�I3�z/ce�K�fX=��b����J�8��Y���������lj�U���g����|Ki%egK=��#%H\"��3N2���,�1$�����Mw�j�đ񃧘���:��U=r�<�K��SwZ-7ϗ���1���v�����9�iF/���ifɬc%����\"��9iAp��M	��*)_�7����)]F�V3�$���N+��J0\"�:�Y\\���Ն/|��M�l�v8R�z+y�ADQuH^�E�ٸ�үW�*3�H3�@f�Y�OYjXh!������G��+8w#��MbC�8��$��5�S��]���\0k-��y~=w�<K�سl�(_�)AR�hL�T�<�6��В�DI�V*��4��Ȭ�9ED�S�Y6��1���A���z:6,���`�*���LEW\0��k\\�������\'���USJ7��O+�h�E@�*S�\'��=񒀑,�qZI��t�l�hP���#Z�6��Z}�ד?)�JU�jSuE]�^�={%�����i@�~�C�����C�G)����ŀ(�*�+��1�N\r���Z���c%�o$E�j��>��//�M�T`��U���K^�����A)%H��u\rM��Y���G�^�\0�B�k0�P���P�C��?/��w_̛~)�%}J�~W팠�9ՉxA1pXmط�T�ժ�m�7_�A�Y���uu��@Ǉ�g��������-Su(�����˩$5�ʿ]��+�x���\\�a�ԯՓ0�.�W�y+��/\0�/o�G����; _�j9X#�*of*n_��U@��j�:�<G`K+��5�P�?ǠD�P�j���\n������A��uTGYջ\rgiT&�����@��́�5`�M1�>�f*�a�K���]�P�H��K[��oP������c�>�j՛�ݜ��2�ūH�J�*�^J�����Z�\\h�Z���1���]�/��p������]S���~e�\"c}��>���\rU(�Uu�j��Us�*��A��P�6���R;�Z���LI	g�1v��M$�O�W?����^�N�\\����m��`֟�T��t�� �y��y���Jr�TD�=�V*��fh������2��PjJ-B��rɧ���_�\"��ޢ����I������/��M�ox�z��8�P��1B���4?^J���\r�x�X�*Z����\\*5z����;����/T�h��.Ik犙^z��k%�x�-�ő���2�Q��.�9��T��|U�J�G���?�%Z�C�\\����N&��SU���LR�*��I��@j���9ʾ�V���$LDU�}�/���Y��Ϫ!}�A��RJԦ�x\"Z�qm�����qq��v�j���,ͻ���fW�ߜ�vU�T��pwy��\Z������M�}���9�l��.�<�I��J�Ј���I�OD���cג�a_����O�bP|�ƾ����Us!��T��`�&NQ1�bΗW�Օ\Z��3�3�7.弱�vL��6hi\n�Զ�};-�d�,�/ <����`�ć����aPZ��y�Y�����I��T�G��\\��vM�)q�a�$᪸�;�驐��Jy���E�{�/��浫	t������?�O�Dg�ޫlys>[�(L�y�4!��\0�Ү�q|@��s ��A>�YU;e,�O;|wm�i����<�w;��JP1!�ݪM�-|�T�;���	,F�/����x��	R5t�e�X2z#�^N�{�S�Ǣ�\"�K���\Z�υkq\\n�+�:e�{�_5(\\SD���R��u�0�NQq�W�T�-�\n,Y���ӳ����,��-\"�����E��3���K>\ZE U���3�L��y�j������1o2nj��SS�>x��eTߣ�~�N1>�VSg�sA�p��򩽾���Ӗ����&:�^]*�v��B��4)���޻�:p�h�#1������Z�(�:�y����GYm%��,�2(�|�u�~��w��|}}���.7$�\\�x��)B[?H��.Tߣ؏��ݢ��༸��Or{\\�e#����ޛ\0[�Ƶ�V<��f甭�F>�r �;������?������8��x�7É��Q�e,�K2lo�؉����EiIƲ��om��qܳ���q��gN`PnLVPQ������}Tq7�� �(C�/\'S6P�p�LhIę��\"����� Φ\ZV�,\Z��¯R��1��b�>gl�e�SCKs&˧��dxʋM�^{l,�i��,�go`�X^�9K\"�WM\'��Y�/:��o��ׂ�5%�Rz����dKP�(�����jC�ƌV�(�\'N�HI���A5E1X�O��G��{WYs��Z�H�i��n�y��P6c���w�xi�$�%��JʂI����X��W�9�ƞ(���N��,�O�N�n�hP�R[*���У(O��������l�L�����X�#i�B[,S�fW��R���Ww�l�o�s\\���?^Y�1^z�9��z���:�]V�hY������;m5)gp���촔�W��.�4�7\"�o;վ���=���c�9�כ\'�O��+W@��sQ/�+%�hay4��{�v�]�7�Kw�����m��?�ב��3��q�L���W��V�57P\"�Oz����`Ym�up�~jfw:Ab���zv��{�3�*��h�cMc��%��3�5p������uf����5��g�(X2K����u�eX�]+K\Z�c}<oL��bTc��Z�c���-v{vZ�\'c��&П�Yv�x\r�j#zs�^/��d6c��Nd�v8�&]�Ǽ��,���`����D��6&i!b��i����{��ݹ��|��*�Ê<\n܃_@�^�t�+`7l7������u�������<v4�ۯ\'�� :���ɠ����l_�6ńZ[:]A�E���ZmL��5����R\\2M��9L�\\�v{<y���L�۝�N������H�.������?�`_�x5~팛$��Ҁ���$<q�8����nwHw܌�� Y}�Į��pp~�^�6������+ǈDH�GcP��s΂�P�ag���_�4F���K��u��]ˣ\"����������@���\nط�\0�.�+ﮡ.z���ƫ$�+K�#�V8�w!��\n�^�.��~�(R����5huH�?/W9}����O�u�.ִI�\'�ޛ�ӑ�1O�[FM�)[m6@�~4�)����O�z���|.�?\n����@�M�8na���N���;�\\��4	���`ۋt֎e+��!��w^Q��q.�r���E�֢.ö��_�K�0�:�b���r��:Q���OX�M������?b­�\'\r�ɥ�gUy��0�^`\\nQ���+>۔ύ.Q���j2Ck�8�����]�l���0eeYr�S�7s�lzD	���!�#��[���\ZS3;/��\\���s�����O<S����\0�:]�)���LMMs��i�>����s��-��F\Z%tg�!K�h�!Ζ}o.	\Z�&���*u)6��7{-����o���BE�Y��s�\\��\ZoM�&���\'��.��G�S�sk�T�/�;~��W+ޖ\\�V��Jf9��JEcc��b#>g��-����վ\\(�y���|Oq6Em�f=�MI����q+njG�W�\r�18U�>s�[����F��������	�?|&�=���s7����j$iq��yR�0b*i�t����V�K�qY��zX�a��7�I��&��x��Ѹ�䴜�v#Bf��O-��}�u2��/�q���;y��������q���,�\Z�U�����NO����e�RKdLE�\n�%ocmP4����z�בa�t�=\\��uv��\r;�/o���	w����rb�K����]p����֚��4LӶ�5��Po�`�ߣ�%^]ׅq\0��R���r�Ԧv�ű�uή�����$�U�\"&\"���t��H�vӓ��ud�o��t��n�5G��=đ��g�:��Vu�f��l�.�m/�=����8��D����k�$�G�4��U��TL@�G9L\'m9z�Kp])/�9���=�ȩ�[�On�.�@;Iʨl�<��#?\0�8�ɓ�P�}m\\C��wlסc)������7�J�يw�>uN\r��C�8Ix��Rə����M�t �#lf�����qb���=���/���ْ`���.�v$���#�W}|=d�Ǒ*|\\�V�ծ�#�a���~�p�TG)�Q�C��p�j��9�v����sz�ˎ�6�u%3�*8�K�1J;�x��>����A�Ӵ�g���Oq��O�ӯ��7��F\"��r��	f	�8����8��Ngz�P[ۨŶ7*��[�xAe���RĬ2 �u�V��e�ľ�|�h�6�W�T�V�sKg9tf���W�4��$�ZQ�z��\'�?���{]�27�@�����\"˫�|�����:o|����1G�\\ޓ�_�G���WY�Yv.DeW���9d\rn\Z�k��&_g�\'P���M�A�\\=ʩ\Z5�u7���V:]Կ�D]\'<u���i��H���G���c_y�?��a�����n���wL�S��ӳL����+|��_�/x��zm �WE�ʡS�!J�B�4s������3�p�NL��*��C�Y��H���h�\rT�BQ�+A�*���	�R����˕\r����N���Z����B�pfu���	�{�$-v���	��gS�j��T�tZ\\�wKKK|ꛏ���S�厃<��r��^fy��Y:�)�߮H��z�ԥZ��8q�6����	���^�\\�6I�6{\\�xl��`Hl��x~jj��g�9���T�/��\'�𛟹�/>r�dv�=��ڸ̷ѰVY]��u-���Ǭ���[��ν�x��*�����̷c=͘i�,w{^Z��J����?F7��7��0Im^�-��\n2ԫ����9_�_	YT��!��!�r�ڟ|��D�.O�9�l\'�O�{���<Fgz�=W�0��}��wʹoy��{��4�����\n&�6{����%���G�����rv�K�¬I�T�_,9�V7Dg�~�G\r�x���I�=52��kݑ�z��e�YԹ4|G��_�9����)���|����s�ؽ���i?P��ITN�_Yw�����S���^�h���O0�/6;�H{j��O����u/Smڭ6&�|��B�_�_\\���b�3����pD��%~M���I�_?hGt`Ͱ�Zk��#X�ɓ\r���>���u��92I�ũ�.��Þ��ә�FU���4��\0�*G�[Ʀ+����[�`r^>8�8a�޽��9�,�ar֌����o��u\'�q�W3���v\\6�B$;��h��`	R�2$�.�1�\n�� 5�i�e{�<�+�c�[-v��O�$��u�)�ܟU%�\r���8WO[z>��3�h_-�ט��V�����4b��Fi�\rȒzIs���.=�+ߑ�P�\'��\Z�y�4���͐f�^6�m\0�b/�	�&��]��Y�9pR��N�V$�w8��;�‵��w*�~�@:�u���\\��`(8\"�ldT*��`��m��z��\"Un`�q�B��ucU�1fP���A���K�5\"�yx��]i˵�r��Nbk~��)��x�wTC\'Wvoҡ܁n�+h?^��a!��zk�`7���R�S�J��O�\r����tN���\r�)��JIx��l *���y\'����=g���YX���ژTd��*��}�M\'��S��lw�@��l�@	��^�#��Cp�uE��h�;��I�s�m�s��^��Y,5�&H�4K}�/k�\\�93�A��oZK�c���Q�D͚t7;|Ŏa�.��[����G��AϜ����\"f�q��m�0�\n�I�֤�.��@�4�5C����-\Z �X;��5P��-~ymibʂ_�_�߹?��+*���ú�*��h�_~+ݔ�}�KkY�&�Z�xm�ꊝ�f��r��{h�h����}\"`�0R�k\'��\Z��9�0,kL��˂��K{�P�������^�����Y�Y�V���_)%�F[�d�T�iv�t(c&\r�mj����[��8[\Z��΍����œ�F�H��˥���j�dD�6����b�%��V�$���s>�e,jſ��s	\"F\rY���A���5������R@ǤL/ �R��\r�޹C��^C��#��v�R=��^X8O�Z�����p�\\��N+�c}�uq(t�)\"CvU�kҗ:��Q���i\rhm WB���&%�Cy�a꼮��ϛ²�@�j�C������|����<t�����GK+ &�<�����.3L�W���zS�7d��\Z�\0h�I\r��x��`x�j]5�t7H3V���ٛmr����9�|�qB}�\'���Cҕ�)=$}���!�=���65R�vlH�n�doF�,�&�>h\nj^�IP���j��C�\r��1AG�پ�D��q�r�.(��@%o �ϫ������Krȫ��Q����(}�.���j���j5K5\0��&V�$�p�8��&;:܌�$��ժ�Q6����C���02P�X���#@�\n���g&?��2+eCC��ᤊ6:�À��u����#��emX�0	�^��]��*+���������ђ�/�~��~�5ב:����S����gF���ix�R�cL!�������Pµ����ʔ�T�JEek�C�\rdNY�e������*O�:ǯ���\n=��j櫆�<,#VSdc`��ڋ��k���x踕�zA�� �R=WUŇo7������.xK+��>{��)˫�y�Ju�M\r;���a o���\r��C@tQ�85	ך��,��_�dt�u7��T��\Z�p����u\\B\'1|�G8rb��)���D��,�X?i��C�|��8��\Z�2Qm����*��*S!�}i�T.�4�i��eD��Z�?c��3)���3^4���k0J�ʽc��E���x��ᝨS�C��.�2<�Tz�Cé�j�32���s����]uռ�7�?��tD���t��&R���xߔ@���}M�	&��uLr���j\Z\r�`�Y7�Dm� e��֥��a�Wc`X��Qo �תa�Bm(�ᤇU%����s>��_bjJr�dm�V\r���G�yݔ`o�7>��Ǒ�Q\'n�}�T��kXC�9v�O���\"`�U�VUܳ�U/�6����`�m���q����wXh�\"TcS��8\rë�\r�J���Z���;v�6Ut��9Fͤ��D��^{��<X�@j6X6���V{��d��Q���F��m䟍瘄&���og:k:�6�;B�J���T��a\\�=�]�;�ɩ���q����ސHGڛn�m��i�7C���:�y���dI�:B�J�0�l(��#f����x�����Q�m����MH���ҡ�+c��Q�> ��&~�E\08P+����M�\0���?/2�\\�x+w@���M�Q�W�v�\r5ǰ���1��;Ѡ�]��k}VJ(#�C�oi�\"d�{t\"dc)o���⼌���p���05����%a/�>\r��m�x�R��TlǅI9���!�}#��6`U�\ZHüfCn��Fܧ	��aza�w$�4�jl[B*�\'/P��0mZ��s�6�]�^{t�`op�]����]�ϑڲ)E~���1#�Q�G\"k���Ú�l���Q�M7P��R\'v��u��{�ǎ��Yn��0����mVQL�.i̱��8qv�ǎ�����4©1\'N\'��O��I��2��N�.9z/@�7\"N6S&D��;F�d\r�3�7�y�[�>�K��\n�N=�#.��jg\n�`9���|��x��s9�z��ѥZ��4��Q�*�H�Q���-~�L��o��\'��/�?���QR��$&�|���_�bGr�{��x��9����ɫ���=����m$d0Tc��~���b�i��	Ƞ���.w�����_�r�u�F� �<Ȣ�@P�Nu�4�x��w��v���>�_Cl[���Ƒ��P- \Z��v�䋵�n���S;Iy�>������5��_gD2��.[x�k����lS���8�M��c1r�:~���d.��0���_M�iÍ\Z�O�n�ץ5`�V�����s��D&#uN{ ~�\"�bwq壩=\"���K=bx�@CO�{nԯ�<�|H������n|m�q����������s-��;Pa�a�/�`���?`��Kpv\Z)b�����zK`�U���v�4�j�Ed��p��wv\r�M�?\0��p�������1>٣����,����k��s)6�Kr��XO!G����څ��^��BKh�2��9h��7��69?����B�y�����M��[>D$=���7%��ɼ���Q+������?�8qr\n� �S��~�`��jm,��>�:���2�u�i���0����5c�����\rʾ��h��e��A�:AE4\0�]����\\���v���H�V�ۨ�\0a�|]����*E�ۋ�nB��s����+��7�:gx�5wamD9�A\"���i�8&z��rf�H���X�<�]=[z/k���:�%��T�?�N�oU=�\0J�8��c�/̒oF�l�Al%/y�=̛�d�KII�s׃ �B��QR�S��W^�j<Ȓ���=���ǭ����2��kqn>���+���f��:s����!���w~��%��@goŘE��>�\Z;C��8��\Zŏ���b�WY�����:�Rⱉm�������c\0���g�ru�0�O��U�Bڻ�nW���4)��y�ԐwZ68q�컭j����|�kǏc�d�E$�N�_���yU}��\"l,)�,����b	��2W{�|�5� �l���y��j=����@�҈9�\Z�Δ��=�w\r��5�փ� KoBH+\rzTy���7k+�U����n2�5�������.�2��션��^媠�T����xi�x������&��2�s7�����K\"![HX�:�P��\"���-a5,�&�a}m���=��6��z���+�Bm� ��%!N����\Zp}�d��Nu���=�~��\Z]qsjj����v�,����_�̯i�;�iì�RZC-�AG��j=����v�����,���p�o#K�\n�r�{�:��<Ltugp�`\\��7y;M?GL˹aa���K��/�ΥD�w��u��;�[x:P��g��2_����%X�_:Jd�~��qDN�)W5*�ri�#��ͩ݅v\\��-��v�Qm�1}>#�y�m�\\&t�q��n��hE\'�X]�E����s���N��;�ٞ\"Zi®P��^�A���Dbuu�V��K��q��,�&I���}�����;*:E-�ŘU\\�����^0�U��%��^Hse\\���s�����r��&q�X���\\�&�?����L\'�K1U�G������末�����UR�]vL�%ַ�t~���qkŇ�N���S�j��1a�\"��V_��zd8�@�Y>?���@���i�9l�?Z�f`3L�h�)6S�u�gq�n��t	a-?��oe���=᭛v��ᗱ���2�s�c�<��~%�R�+�|�`�����5*���У�[�9��Af�K���}���x��K�v��7��M��ݨ˪m]_rs��Y�;�u�T�?絀���r\"�\0Ν%�\"Ҕ�����\n��X��±��to7i�p���<iz.K=P�tf�@*<���jH{��������>#��e=�=!�������/�t���\'�E�*��(�}���w�e�_�9�\0���pYm��ou+����Ρ|�no�^�WT�\rW8oW`�X�p���[ko\"릠H����巓���[Hoᔹ�I��\"\\[cm�6Ν+q�{��9ֻ�i�x��۲X��m�-�Z|�л���ps���0+���CLM}#SD�`L>������A�U����%Mws���1�K�_��m�\0�~d�/����s��\n|��4�x\n%Р���ő0]����>��tXY�G��>:�OE=\"��H�Ұ����B�8�P�e�wK��(�Q�aֺ�Ө��(���r�\n~P����O� ��:�-;�\'�%�����\'�oe?g䕸�D�St�\'����q��:Nь���}3��k0�爣��9�\Z��1��/2�v^a�.��Ӫ��{���#���Cx���8��/�O�_%�Bdcz�N;Xw\r־�^�VLt1���ݳݴ�+\"�7���������کO+\'~F�Co���j_=����Ǌ���d�4�.a�\'A�V��U��,��yd�/��屭B���%��^d��;��rѽ7�lq����\"�9w�\"��T[���3=�l��\0w�q�,��\0\0\0\0IEND�B`�','foto-jogador.png',15956,'2012-06-05 00:00:00','text',NULL,NULL),(7,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0%\0\0\01\0\0*�P\0\0\0	pHYs\0\0\0\0\0��\0\0\nOiCCPPhotoshop ICC profile\0\0xڝSgTS�=���BK���KoR RB���&*!	J�!��Q�EEȠ�����Q,�\n��!���������{�kּ������>�����H3Q5��B�������.@�\n$p\0�d!s�#\0�~<<+\"��\0x�\0�M��0���B�\\���t�8K�\0@z�B�\0@F���&S\0�\0`�cb�\0P-\0`\'��\0����{\0[�!��\0 e�D\0h;\0��V�E\0X0\0fK�9\0�-\00IWfH\0��\0���\0\00Q��)\0{\0`�##x\0��\0F�W<�+��*\0\0x��<�$9E�[-qWW.(�I+6aa�@.�y�2�4���\0\0������x����6��_-��\"bb���ϫp@\0\0�t~��,/�\Z�;�m��%�h^�u��f�@�\0���W�p�~<<E���������J�B[a�W}�g�_�W�l�~<�����$�2]�G�����L�ϒ	�b��G�����\"�Ib�X*�Qq�D���2�\"�B�)�%��d��,�>�5\0�j>{�-�]c�K\'Xt���\0\0�o��(�h���w��?�G�%\0�fI�q\0\0^D$.Tʳ?�\0\0D��*�A��,�����`6�B$��BB\nd�r`)��B(�Ͱ*`/�@4�Qh��p.�U�=p�a��(��	A�a!ڈb�X#����!�H�$ ɈQ\"K�5H1R�T UH�=r9�\\F��;�\02����G1���Q=��C��7\Z�F��dt1�����r�\Z=�6��Ыhڏ>C�0��3�l0.��B�8,	�c˱\"���\Z�V����cϱw�E�	6wB aAHXLXN�H� $4�	7	�Q�\'\"��K�&���b21�XH,#��/{�C�7$�C2\'��I��T��F�nR#�,��4H\Z#���dk�9�, +ȅ����3��!�[\n�b@q��S�(R�jJ��4�e�2AU��Rݨ�T5�ZB���R�Q��4u�9̓IK�����\Zhh�i��t�ݕN��W���G���w\r��ǈg(�gw��L�Ӌ�T071���oUX*�*|��\n�J�&�*/T����ުU�U�T��^S}�FU3S�	Ԗ�U��P�SSg�;���g�oT?�~Y��Y�L�OC�Q��_�� c�x,!k\r��u�5�&���|v*�����=���9C3J3W�R�f?�q��tN	�(���~���)�)�4L�1e\\k����X�H�Q�G�6����E�Y��A�J\'\\\'Gg����S�Sݧ\n�M=:��.�k���Dw�n��^��Lo��y���}/�T�m���GX�$��<�5qo</���QC]�@C�a�a�ᄑ��<��F�F�i�\\�$�m�mƣ&&!&KM�M�RM��)�;L;L���͢�֙5�=1�2��כ߷`ZxZ,����eI��Z�Yn�Z9Y�XUZ]�F���%ֻ�����N�N���gð�ɶ�����ۮ�m�}agbg�Ů��}�}��=\r���Z~s�r:V:ޚΜ�?}����/gX���3��)�i�S��Ggg�s�󈋉K��.�>.���Ƚ�Jt�q]�z��������ۯ�6�i�ܟ�4�)�Y3s���C�Q��?��0k߬~OCO�g��#/c/�W�װ��w��a�>�>r��>�<7�2�Y_�7��ȷ�O�o�_��C#�d�z��\0��%g��A�[��z|!��?:�e����A���AA�������!h�쐭!��Α�i�P~���a�a��~\'���W�?�p�X\Z�1�5w��Cs�D�D�Dޛg1O9�-J5*>�.j<�7�4�?�.fY��X�XIlK9.*�6nl��������{�/�]py�����.,:�@L�N8��A*��%�w%�\ny��g\"/�6ш�C\\*N�H*Mz�쑼5y$�3�,幄\'���L\rLݛ:��v m2=:�1����qB�!M��g�g�fvˬe����n��/��k���Y-\n�B��TZ(�*�geWf�͉�9���+��̳�ې7�����ᒶ��KW-X潬j9�<qy�\n�+�V�<���*m�O��W��~�&zMk�^�ʂ��k�U\n�}����]OX/Yߵa���>������(�x��oʿ�ܔ���Ĺd�f�f���-�[����n\r�ڴ\r�V����E�/��(ۻ��C���<��e����;?T�T�T�T6��ݵa��n��{��4���[���>ɾ�UUM�f�e�I���?�������m]�Nmq����#�׹���=TR��+�G�����w-\r6\rU����#pDy���	��\r:�v�{���vg/jB��F�S��[b[�O�>����z�G��4<YyJ�T�i��ӓg�ό���}~.��`ۢ�{�c��jo�t��E���;�;�\\�t���W�W��:_m�t�<���Oǻ�����\\k��z��{f���7����y���՞9=ݽ�zo������~r\'��˻�w\'O�_�@�A�C݇�?[�����j�w����G��������C���ˆ\r��8>99�?r����C�d�&����ˮ/~�����јѡ�򗓿m|������������x31^�V���w�w��O�| (�h���SЧ��������c3-�\0\0\0gAMA\0\0��|�Q�\0\0\0 cHRM\0\0z%\0\0��\0\0��\0\0��\0\0u0\0\0�`\0\0:�\0\0o�_�F\0\0[IDATx�$�1A��&[�B)�j�P*�I�{��P�()������؝���|FU���R��\0��\rE�\n`T��zA���P})?oc�gG�z�ٵ���G\0��Ʌ*�]Y���ғ��r2$Q#����\0\0�����P\0���4m��b��\\b5x1��Sl��h�\"�-�\"1�.������>1\\H���O�vK\0��)��~�����륄q� J�����e�j-	�t\n�������W^2�ܐ�PZ����(h���s\nu�=B+��b{tQ�j�\0\0��T��JBqG�o&ap%A(�!�\\�	D_�gh�Fg���\r�Z\"�^S��~�O�\Zt����/H���3Xy�]\00vD\0����1���9��>9�h�P����$�\'���dJQ�Yx�d7]��?�����ݼ,�^�����L��k����m*Ix$,H�p��L\r3(c���KHж�B�?�V����q��K%�4FQ��gh-D1�P�A�M�11q����`�\'�\\�lX���K�(+�IBB��l�3�t�����Ԧ����s�9��S��\\���̧m/��ג)ĳ¤ZRk\ne��[~�=��&7��/p�63��/�[[|�<aa~������-�NO�i!�\Z�ˤ�:�e~�����>vZ�~��]�z����;��B%<u�].�swm��\'YS\\Ԅd���\"yR���/�{B�W$���@����R��&L\"H���\n���W/�)BĢ5Mt	I>V�d�:�{ی.��w1El�>o��2�qE�n�X/�����s�.���Q6�QA�����L%�$AЀ\nэ?�(��KW�P@�ĕO �P��шA7YH�YH\"J\"�8��ܟ�����ICCS�OU�SN*�}i�-�j�N׻a��\Z{���U$m\09��d/�a0��va�rqP�s%�=b7��#���@�_ڎ������1]�L$��D+r��\n�wW~i�;i\06(�뫧�ة�R�>R�\'	��J>�<Yz@�m���x$����W[���������q�(�!�@B!P!=����ĉϝ	ji7��1���Y��ё8��#�.�$��PQ��s|�9��;E���V�°��(�����8���v�cn���po*go��[3͛x\'!Ie`�σ��H�h�F!�x����D<Z�aΓ���o��@�}�[�`F� r�w���6��̞��z\n&&�@P�!�\r�~���s�z�i^���&��ج_m\\�y6���︾Q8��\\�gֹ���ԉ\'$��ѼS�^|�%=4$�᳾s���2E6��<��ͦ=��h���QEq��sg޼�$mH�ڴ��\"�X�UE�XEэb7���B��q#�v!�QčB�0.,i�P���4)�HIx���y���{�q1�M^l\n8�����{��;{���Fjm\'�v�]��[�]r_�E~�������Fy5���q��m\n����r/�3�D.��^�������\Zt	�(:�\rJ�\\�3�����jvC�#2|�@!����B!���3U����U�N�Ґ��	ǖF��Z�V.d^�,����7�φ�~s����l���XX���s�q�5ʖ6�ل��P%��\r����l��J���X��\ZM�:��+�GU%xG����bO��>�����w�(p��d��.�	�eF����7�x�@�d�F�|������A�ù��Dj�U�r#��)�fwq�=\n�2{^Y>#[K�M\'��1TqY������o�Q�g��f�\\�?���}�vf�>ID�\0I�F��i>[{���|���He��^]�%ۍ���?O=��y���8u%�{����o�| ��!(�\nsw7���⩯����:����%zw3��j��NU\"����2��w��)ips��ZnEQ0=W���D�UBP��Ƚ�����\'Fh��\Z��Ҧ�(AQ=$��PP��[�C	���R�k+-!�����㌀@,Չz��+��P��E�>��I)��2TQ��\Z�BdJ�H���s�z}���}?\"h		)��JHT1DĔ��.Y��rfс��2^:5�w���gz��*�+\r�(���f�������s��\n�D��ڎ����\0��\'Q�̾N�u)��>c��ڨ����H\Z����C�9�m4i���\Z:;ǫ\'r_�� �p���	[���6���/t�O�����ln-��]X8�����o���k��f~!v]U�����s��$ө�tb2��PE�M[ĖVE�\"*���DA,�/�7�<X�`iQ|*�����\"�U\n!���6)&i2If�{��{-�93���	���{��|g�����ue<�nM���-f�z47���a���}x�LF\nU������=����un�p��qo2��JJ��I���D-���LjGv�\\��C&|V&���䷣�>Yk��U2J�2����e���Ɯ0��毁Go\n������^��b2s�6�bS+ ����@���Y��Wv\rj%N��%1��\r��a�-3��:[-$Ӕ��E�)3;�+P���7\'��a�>ȡ�<�j�Ë��lf=��0��D��h���A��:ˮY�8��:~���\\����Ύ�&���?=?m��C(^J��I�a�K�A��:j�4��3���co!��x��\0^.��2xgW�\Z���漌T/�P|@��0��;�x�8��p������&T�)�Yp��7\0�\rT������F��i��3}Ы�R�|@�C\\�c�,Ҥ7�TjG����\\/���gߋt�1K���Ϭ�� ���!���Z�_�/���8�� N&2�i���\"���@���N^�ު��.��\Z��\Z}F;Z�5\"O���(��>\"��\'8��m���|�����ҋ87��Ir\"x1^�G�zq�{b���*N���&ZgDQ�u��2�y������a���G�㑻$�V��S�5�,���e�g	��VN�<��j����DC��<<7-���k��~�a��1�����>S�z\'�]K�ue���y��]��~��*�k��p�^�ܲ����X))��T<�܇�3�Z㹯�H	���_����\\�{�Z�	x��Y25�s5s3�3k��y����s5K��8�������n@C�-k�B5��7p(��ό4�Ѣx�YHqI\'p�׆B�`X�󗯰�G���ej�6�	t�m���mp;��P�\'kB��(r\"X��\"Tl��!�s¨�VSV�2*U����.m��5�A�Ts���ީ{*5�6:99�֚�x��N���Z��\\xk2�߿�@�4l\n�*j��5\'���mˠ�`��F����fGJފ!��i��W����y\'r�b�:���lr�֕�l\\7��`�	P��]�:�1��Z\Z_�?ۥ?۴�R��[j��5Tu���\0��:Z\\Kڝb���Ե��i\r�-]��N�4��垪Q�������^���s8	��V-v,~��~��X��[ݷ��f��Wi[Ms�O[�e�8��|��/�|�1(V01��1��9�Z9�L�򅲺�\r�CI4Nv9�ush;�P��cl��1�gx���0,��ITg�c��:�ĿF9��FO�݊y���)R�՜�t������E糡5*Uy���E4�+[A���?��rix�}����~�}w�=pw��BX�T���\'�/�x�\0�ƻ���\0\0\0\0IEND�B`�','foto-jogador.png',6464,'2012-06-05 00:00:00','text',NULL,NULL);
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
