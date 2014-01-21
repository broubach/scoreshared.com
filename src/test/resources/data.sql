--
-- Dumping data for table profile
--

INSERT INTO profile (id, city, country, academy, leftHanded, coach_id, showContactInfoToFriends, phone, avatarHash, avatar_id, smallAvatar_id, style, site, sport, signupProcessCompleted, deleted) VALUES (35,'Belo Horizonte','Brasil','Lob Tênis',false,NULL,true,'31 96862253','0d6de8af31a2dda39baf2d648662c4e9',null,null,'','',0,true,false), (36,'Lake Sherwood, California','United States','private',false,NULL,false,'','1345bbb540ffec28beba458daa26f969',null,null,'','',0,true,false);

--
-- Dumping data for table user
--

INSERT INTO user (id, firstName, lastName, email, birthday, password, gender, profile_id, lastAccess, beforeLastAccess, dateAccountWasClosed, reasonAccountWasClosed, forgotPasswordInstructionsHash, forgotPasswordInstructionsDate, deleted) VALUES (38,'Bernardo','Roubach','broubach@yahoo.com.br','1981-04-28 17:13:48','5670f434940508df14a1825a4c144ad2','M',35,'2014-01-10 17:29:05','2014-01-10 17:27:46',NULL,NULL,NULL,NULL,false), (39,'Pete','Sampras','pete.sampras@mail.com','1971-08-12 17:16:59','576dc1060ea0b6d02640de48c28fca46','M',36,'2014-01-10 17:28:33','2014-01-10 17:16:59',NULL,NULL,NULL,NULL,false);

--
-- Dumping data for table invitation
--

INSERT INTO invitation (id, date, hash, hashExpirationDate, email, message, response, type, deleted) VALUES (57,NULL,NULL,NULL,NULL,NULL,0,NULL,false),(58,NULL,NULL,NULL,NULL,NULL,0,NULL,false),(59,'2014-01-10 17:19:11',NULL,NULL,NULL,'Ciao Pete Sampras! Posso condividere i miei score con te?',NULL,0,false),(60,'2014-01-10 17:25:08',NULL,NULL,NULL,'Ciao Pete Sampras! Posso condividere i miei score con te?',NULL,0,false),(61,'2014-01-10 17:28:12',NULL,NULL,NULL,'Ciao Pete Sampras! Posso condividere i miei score con te?',0,0,false),(62,NULL,NULL,NULL,NULL,NULL,0,NULL,false);

--
-- Dumping data for table player
--

INSERT INTO player (id, name, association_id, owner_id, invitation_id, shouldNotReinvite, deleted) VALUES (139,'Bernardo Roubach',38,38,57,NULL,false),(140,'Pete Sampras',39,38,61,NULL,false),(141,'Andre Agassi',NULL,38,NULL,NULL,false),(142,'Patrick Rafter',NULL,38,NULL,NULL,false),(143,'Pete Sampras',39,39,58,NULL,false),(144,'Bernardo Roubach',38,39,62,NULL,false);

--
-- Dumping data for table file
--

INSERT INTO file (id, name, size, date, mime, owner_id, deleted) VALUES (4, 'foto-jogador.png',15956,'2012-06-05 00:00:00','text',NULL,false),(7,'foto-jogador.png',6464,'2012-06-05 00:00:00','text',NULL,false),(55,'avatar.png',12753,'2014-01-10 17:14:22','image/png',38,false),(56,'avatar.png',4583,'2014-01-10 17:14:22','image/png',38,false),(57,'220px-Pete_Sampras_crop.jpg',25867,'2014-01-10 17:17:28','image/png',39,false),(58,'220px-Pete_Sampras_crop.jpg',7490,'2014-01-10 17:17:28','image/png',39,false);

update profile set avatar_id=55, smallAvatar_id=56 where id = 35;
update profile set avatar_id=57, smallAvatar_id=58 where id = 36;