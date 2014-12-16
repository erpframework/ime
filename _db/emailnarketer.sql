/*
SQLyog Ultimate v11.5 (64 bit)
MySQL - 5.5.40-0ubuntu0.14.04.1 : Database - emailmarketer
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`emailmarketer` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `emailmarketer`;

/*Table structure for table `email_addons` */

DROP TABLE IF EXISTS `email_addons`;

CREATE TABLE `email_addons` (
  `addon_id` varchar(200) NOT NULL,
  `installed` int(11) DEFAULT '0',
  `configured` int(11) DEFAULT '0',
  `enabled` int(11) DEFAULT '0',
  `addon_version` varchar(10) DEFAULT '0',
  `settings` text,
  PRIMARY KEY (`addon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_addons` */

insert  into `email_addons`(`addon_id`,`installed`,`configured`,`enabled`,`addon_version`,`settings`) values ('checkpermissions',1,1,1,'1.0','a:0:{}'),('dbcheck',1,1,1,'1.0','a:0:{}'),('dynamiccontenttags',1,1,1,'1.0','a:0:{}'),('emaileventlog',1,1,1,'1.0','a:0:{}'),('splittest',1,1,1,'1.0','a:0:{}'),('surveys',1,1,1,'1.0','a:0:{}'),('systemlog',1,1,1,'1.0','a:1:{s:7:\"logsize\";s:4:\"1000\";}');

/*Table structure for table `email_autoresponders` */

DROP TABLE IF EXISTS `email_autoresponders`;

CREATE TABLE `email_autoresponders` (
  `autoresponderid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `format` char(1) DEFAULT NULL,
  `textbody` longtext,
  `htmlbody` longtext,
  `createdate` int(11) DEFAULT '0',
  `active` int(11) DEFAULT '0',
  `pause` int(11) DEFAULT '0',
  `hoursaftersubscription` int(11) DEFAULT '0',
  `ownerid` int(11) NOT NULL DEFAULT '0',
  `searchcriteria` mediumtext,
  `listid` int(11) DEFAULT '0',
  `tracklinks` char(1) DEFAULT '1',
  `trackopens` char(1) DEFAULT '1',
  `multipart` char(1) DEFAULT '1',
  `queueid` int(11) DEFAULT '0',
  `sendfromname` varchar(255) DEFAULT NULL,
  `sendfromemail` varchar(255) DEFAULT NULL,
  `replytoemail` varchar(255) DEFAULT NULL,
  `bounceemail` varchar(255) DEFAULT NULL,
  `charset` varchar(255) DEFAULT NULL,
  `embedimages` char(1) DEFAULT '0',
  `to_firstname` int(11) DEFAULT '0',
  `to_lastname` int(11) DEFAULT '0',
  `autorespondersize` int(11) DEFAULT '0',
  PRIMARY KEY (`autoresponderid`),
  KEY `email_autoresponders_owner_idx` (`ownerid`),
  KEY `email_autoresponders_list_idx` (`listid`),
  KEY `email_autoresponders_queue_idx` (`queueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_autoresponders` */

/*Table structure for table `email_banned_emails` */

DROP TABLE IF EXISTS `email_banned_emails`;

CREATE TABLE `email_banned_emails` (
  `banid` int(11) NOT NULL AUTO_INCREMENT,
  `emailaddress` varchar(255) DEFAULT NULL,
  `list` varchar(10) DEFAULT NULL,
  `bandate` int(11) DEFAULT NULL,
  PRIMARY KEY (`banid`),
  UNIQUE KEY `email_banned_emails_list_email_idx` (`list`,`emailaddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_banned_emails` */

/*Table structure for table `email_config_settings` */

DROP TABLE IF EXISTS `email_config_settings`;

CREATE TABLE `email_config_settings` (
  `area` varchar(255) DEFAULT NULL,
  `areavalue` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_config_settings` */

insert  into `email_config_settings`(`area`,`areavalue`) values ('SMTP_SERVER','tls://smtp.gmail.com'),('SMTP_USERNAME','tamnt@zigexn.vn'),('SMTP_PASSWORD','bmd1eWVudGFtQDIwMTQ='),('SMTP_PORT','465'),('BOUNCE_ADDRESS',''),('BOUNCE_SERVER',''),('BOUNCE_USERNAME',''),('BOUNCE_PASSWORD',''),('BOUNCE_IMAP','0'),('BOUNCE_EXTRASETTINGS',''),('BOUNCE_AGREEDELETE','0'),('BOUNCE_AGREEDELETEALL','0'),('HTMLFOOTER',''),('TEXTFOOTER',''),('FORCE_UNSUBLINK','0'),('MAXHOURLYRATE','0'),('MAXOVERSIZE','0'),('CRON_ENABLED','0'),('DEFAULTCHARSET','UTF-8'),('EMAIL_ADDRESS','nguyentamvinhlong@gmail.com'),('IPTRACKING','1'),('USEMULTIPLEUNSUBSCRIBE','0'),('CONTACTCANMODIFYEMAIL','0'),('MAX_IMAGEWIDTH','700'),('MAX_IMAGEHEIGHT','400'),('ALLOW_EMBEDIMAGES','1'),('DEFAULT_EMBEDIMAGES','0'),('ALLOW_ATTACHMENTS','1'),('ATTACHMENT_SIZE','2048'),('CRON_SEND','5'),('CRON_AUTORESPONDER','10'),('CRON_BOUNCE','60'),('CRON_TRIGGEREMAILS_S','0'),('CRON_TRIGGEREMAILS_P','1440'),('CRON_MAINTENANCE','0'),('EMAILSIZE_WARNING','500'),('EMAILSIZE_MAXIMUM','2048'),('SYSTEM_MESSAGE',''),('SYSTEM_DATABASE_VERSION','5.5.38-0ubuntu0.14.04.1'),('SEND_TEST_MODE','0'),('RESEND_MAXIMUM','3'),('SHOW_SMTPCOM_OPTION','0'),('SECURITY_WRONG_LOGIN_WAIT','0'),('SECURITY_WRONG_LOGIN_THRESHOLD_COUNT','0'),('SECURITY_WRONG_LOGIN_THRESHOLD_DURATION','60'),('SECURITY_BAN_DURATION','60'),('CREDIT_INCLUDE_AUTORESPONDERS','1'),('CREDIT_INCLUDE_TRIGGERS','1'),('CREDIT_WARNINGS','0'),('DEFAULT_EMAILSIZE','0'),('CRON_SPLITTEST','0');

/*Table structure for table `email_customfield_lists` */

DROP TABLE IF EXISTS `email_customfield_lists`;

CREATE TABLE `email_customfield_lists` (
  `cflid` int(11) NOT NULL AUTO_INCREMENT,
  `fieldid` int(11) NOT NULL DEFAULT '0',
  `listid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cflid`),
  UNIQUE KEY `email_customfield_lists_field_list_idx` (`fieldid`,`listid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `email_customfield_lists` */

insert  into `email_customfield_lists`(`cflid`,`fieldid`,`listid`) values (11,1,1),(5,2,1),(6,3,1),(8,4,1),(7,5,1),(4,6,1),(1,7,1),(2,8,1),(10,9,1),(9,10,1),(3,11,1);

/*Table structure for table `email_customfields` */

DROP TABLE IF EXISTS `email_customfields`;

CREATE TABLE `email_customfields` (
  `fieldid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `fieldtype` varchar(100) DEFAULT NULL,
  `defaultvalue` varchar(255) DEFAULT NULL,
  `required` char(1) DEFAULT '0',
  `fieldsettings` mediumtext,
  `createdate` int(11) DEFAULT '0',
  `ownerid` int(11) DEFAULT '0',
  `isglobal` char(1) DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `email_customfields_owner_idx` (`ownerid`),
  KEY `email_customfield_id_name` (`fieldid`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `email_customfields` */

insert  into `email_customfields`(`fieldid`,`name`,`fieldtype`,`defaultvalue`,`required`,`fieldsettings`,`createdate`,`ownerid`,`isglobal`) values (1,'Title','dropdown','','0','a:2:{s:3:\"Key\";a:5:{i:0;s:2:\"Ms\";i:1;s:3:\"Mrs\";i:2;s:2:\"Mr\";i:3;s:2:\"Dr\";i:4;s:4:\"Prof\";}s:5:\"Value\";a:5:{i:0;s:2:\"Ms\";i:1;s:3:\"Mrs\";i:2;s:2:\"Mr\";i:3;s:2:\"Dr\";i:4;s:4:\"Prof\";}}',1407311161,1,'1'),(2,'First Name','text','','0','a:4:{s:11:\"FieldLength\";s:2:\"50\";s:9:\"MinLength\";s:1:\"0\";s:9:\"MaxLength\";s:1:\"0\";s:12:\"ApplyDefault\";s:0:\"\";}',1407311161,1,'1'),(3,'Last Name','text','','0','a:4:{s:11:\"FieldLength\";s:2:\"50\";s:9:\"MinLength\";s:1:\"0\";s:9:\"MaxLength\";s:1:\"0\";s:12:\"ApplyDefault\";s:0:\"\";}',1407311161,1,'1'),(4,'Phone','text','','0','a:4:{s:11:\"FieldLength\";s:2:\"50\";s:9:\"MinLength\";s:1:\"0\";s:9:\"MaxLength\";s:1:\"0\";s:12:\"ApplyDefault\";s:0:\"\";}',1407311161,1,'1'),(5,'Mobile','text','','0','a:4:{s:11:\"FieldLength\";s:2:\"50\";s:9:\"MinLength\";s:1:\"0\";s:9:\"MaxLength\";s:1:\"0\";s:12:\"ApplyDefault\";s:0:\"\";}',1407311161,1,'1'),(6,'Fax','text','','0','a:4:{s:11:\"FieldLength\";s:2:\"50\";s:9:\"MinLength\";s:1:\"0\";s:9:\"MaxLength\";s:1:\"0\";s:12:\"ApplyDefault\";s:0:\"\";}',1407311161,1,'1'),(7,'Birth Date','date','','0','a:2:{s:3:\"Key\";a:5:{i:0;s:3:\"day\";i:1;s:5:\"month\";i:2;s:4:\"year\";i:3;i:1914;i:4;s:4:\"2014\";}s:12:\"ApplyDefault\";s:0:\"\";}',1407311161,1,'1'),(8,'City','text','','0','a:4:{s:11:\"FieldLength\";s:2:\"50\";s:9:\"MinLength\";s:1:\"0\";s:9:\"MaxLength\";s:1:\"0\";s:12:\"ApplyDefault\";s:0:\"\";}',1407311161,1,'1'),(9,'State','text','','0','a:4:{s:11:\"FieldLength\";s:2:\"50\";s:9:\"MinLength\";s:1:\"0\";s:9:\"MaxLength\";s:1:\"0\";s:12:\"ApplyDefault\";s:0:\"\";}',1407311161,1,'1'),(10,'Postal/Zip Code','text','','0','a:4:{s:11:\"FieldLength\";s:2:\"50\";s:9:\"MinLength\";s:1:\"0\";s:9:\"MaxLength\";s:1:\"0\";s:12:\"ApplyDefault\";s:0:\"\";}',1407311162,1,'1'),(11,'Country','dropdown','','0','a:2:{s:3:\"Key\";a:230:{i:0;s:3:\"AFG\";i:1;s:3:\"ALB\";i:2;s:3:\"ALA\";i:3;s:3:\"DZA\";i:4;s:3:\"ASM\";i:5;s:3:\"AND\";i:6;s:3:\"AGO\";i:7;s:3:\"AIA\";i:8;s:3:\"ATG\";i:9;s:3:\"ARG\";i:10;s:3:\"ARM\";i:11;s:3:\"ABW\";i:12;s:3:\"AUS\";i:13;s:3:\"AUT\";i:14;s:3:\"AZE\";i:15;s:3:\"BHS\";i:16;s:3:\"BHR\";i:17;s:3:\"BGD\";i:18;s:3:\"BRB\";i:19;s:3:\"BLR\";i:20;s:3:\"BEL\";i:21;s:3:\"BLZ\";i:22;s:3:\"BEN\";i:23;s:3:\"BMU\";i:24;s:3:\"BTN\";i:25;s:3:\"BOL\";i:26;s:3:\"BIH\";i:27;s:3:\"BWA\";i:28;s:3:\"NUL\";i:29;s:3:\"BRA\";i:30;s:3:\"BRN\";i:31;s:3:\"BGR\";i:32;s:3:\"BFA\";i:33;s:3:\"BDI\";i:34;s:3:\"KHM\";i:35;s:3:\"CMR\";i:36;s:3:\"CAN\";i:37;s:3:\"CPV\";i:38;s:3:\"CYM\";i:39;s:3:\"CAF\";i:40;s:3:\"TCD\";i:41;s:3:\"CHL\";i:42;s:3:\"CHN\";i:43;s:3:\"COL\";i:44;s:3:\"COM\";i:45;s:3:\"COG\";i:46;s:3:\"COD\";i:47;s:3:\"COK\";i:48;s:3:\"CRI\";i:49;s:3:\"CIV\";i:50;s:3:\"HRV\";i:51;s:3:\"CUB\";i:52;s:3:\"CYP\";i:53;s:3:\"CZE\";i:54;s:3:\"DNK\";i:55;s:3:\"DJI\";i:56;s:3:\"DMA\";i:57;s:3:\"DOM\";i:58;s:3:\"ECU\";i:59;s:3:\"EGY\";i:60;s:3:\"SLV\";i:61;s:3:\"GNQ\";i:62;s:3:\"ERI\";i:63;s:3:\"EST\";i:64;s:3:\"ETH\";i:65;s:3:\"FLK\";i:66;s:3:\"FRO\";i:67;s:3:\"FJI\";i:68;s:3:\"FIN\";i:69;s:3:\"FRA\";i:70;s:3:\"GUF\";i:71;s:3:\"PYF\";i:72;s:3:\"GAB\";i:73;s:3:\"GMB\";i:74;s:3:\"GEO\";i:75;s:3:\"DEU\";i:76;s:3:\"GHA\";i:77;s:3:\"GIB\";i:78;s:3:\"GRC\";i:79;s:3:\"GRL\";i:80;s:3:\"GRD\";i:81;s:3:\"GLP\";i:82;s:3:\"GUM\";i:83;s:3:\"GTM\";i:84;s:3:\"GGY\";i:85;s:3:\"GIN\";i:86;s:3:\"GNB\";i:87;s:3:\"GUY\";i:88;s:3:\"HTI\";i:89;s:3:\"VAT\";i:90;s:3:\"HND\";i:91;s:3:\"HKG\";i:92;s:3:\"HUN\";i:93;s:3:\"ISL\";i:94;s:3:\"IND\";i:95;s:3:\"IDN\";i:96;s:3:\"IRN\";i:97;s:3:\"IRQ\";i:98;s:3:\"IRL\";i:99;s:3:\"IMN\";i:100;s:3:\"ISR\";i:101;s:3:\"ITA\";i:102;s:3:\"JAM\";i:103;s:3:\"JPN\";i:104;s:3:\"JEY\";i:105;s:3:\"JOR\";i:106;s:3:\"KAZ\";i:107;s:3:\"KEN\";i:108;s:3:\"KIR\";i:109;s:3:\"KOR\";i:110;s:3:\"KWT\";i:111;s:3:\"KGZ\";i:112;s:3:\"LVA\";i:113;s:3:\"LBN\";i:114;s:3:\"LSO\";i:115;s:3:\"LBR\";i:116;s:3:\"LBY\";i:117;s:3:\"LIE\";i:118;s:3:\"LTU\";i:119;s:3:\"LUX\";i:120;s:3:\"MAC\";i:121;s:3:\"MKD\";i:122;s:3:\"MDG\";i:123;s:3:\"MWI\";i:124;s:3:\"MYS\";i:125;s:3:\"MDV\";i:126;s:3:\"MLI\";i:127;s:3:\"MLT\";i:128;s:3:\"MHL\";i:129;s:3:\"MTQ\";i:130;s:3:\"MRT\";i:131;s:3:\"MUS\";i:132;s:3:\"MEX\";i:133;s:3:\"FSM\";i:134;s:3:\"MDA\";i:135;s:3:\"MCO\";i:136;s:3:\"MNG\";i:137;s:3:\"MSR\";i:138;s:3:\"MAR\";i:139;s:3:\"MOZ\";i:140;s:3:\"MMR\";i:141;s:3:\"NAM\";i:142;s:3:\"NRU\";i:143;s:3:\"NPL\";i:144;s:3:\"NLD\";i:145;s:3:\"ANT\";i:146;s:3:\"NCL\";i:147;s:3:\"NZL\";i:148;s:3:\"NIC\";i:149;s:3:\"NER\";i:150;s:3:\"NGA\";i:151;s:3:\"NIU\";i:152;s:3:\"NFK\";i:153;s:3:\"MNP\";i:154;s:3:\"NOR\";i:155;s:3:\"OMN\";i:156;s:3:\"PAK\";i:157;s:3:\"PLW\";i:158;s:3:\"PAN\";i:159;s:3:\"PNG\";i:160;s:3:\"PRY\";i:161;s:3:\"PER\";i:162;s:3:\"PHL\";i:163;s:3:\"PCN\";i:164;s:3:\"POL\";i:165;s:3:\"PRT\";i:166;s:3:\"PRI\";i:167;s:3:\"QAT\";i:168;s:3:\"REU\";i:169;s:3:\"ROU\";i:170;s:3:\"RUS\";i:171;s:3:\"RWA\";i:172;s:3:\"SHN\";i:173;s:3:\"KNA\";i:174;s:3:\"LCA\";i:175;s:3:\"SPM\";i:176;s:3:\"VCT\";i:177;s:3:\"WSM\";i:178;s:3:\"SMR\";i:179;s:3:\"STP\";i:180;s:3:\"SAU\";i:181;s:3:\"SEN\";i:182;s:3:\"SRB\";i:183;s:3:\"SYC\";i:184;s:3:\"SLE\";i:185;s:3:\"SGP\";i:186;s:3:\"SVK\";i:187;s:3:\"SVN\";i:188;s:3:\"SLB\";i:189;s:3:\"SOM\";i:190;s:3:\"ZAF\";i:191;s:3:\"ESP\";i:192;s:3:\"LKA\";i:193;s:3:\"SDN\";i:194;s:3:\"SUR\";i:195;s:3:\"SJM\";i:196;s:3:\"SWZ\";i:197;s:3:\"SWE\";i:198;s:3:\"CHE\";i:199;s:3:\"SYR\";i:200;s:3:\"TWN\";i:201;s:3:\"TJK\";i:202;s:3:\"TZA\";i:203;s:3:\"THA\";i:204;s:3:\"TGO\";i:205;s:3:\"TKL\";i:206;s:3:\"TON\";i:207;s:3:\"TTO\";i:208;s:3:\"TUN\";i:209;s:3:\"TUR\";i:210;s:3:\"TKM\";i:211;s:3:\"TCA\";i:212;s:3:\"TUV\";i:213;s:3:\"UGA\";i:214;s:3:\"UKR\";i:215;s:3:\"ARE\";i:216;s:3:\"GBR\";i:217;s:3:\"USA\";i:218;s:3:\"URY\";i:219;s:3:\"UZB\";i:220;s:3:\"VUT\";i:221;s:3:\"VEN\";i:222;s:3:\"VNM\";i:223;s:3:\"VGB\";i:224;s:3:\"VIR\";i:225;s:3:\"WLF\";i:226;s:3:\"ESH\";i:227;s:3:\"YEM\";i:228;s:3:\"ZMB\";i:229;s:3:\"ZWE\";}s:5:\"Value\";a:230:{i:0;s:11:\"Afghanistan\";i:1;s:7:\"Albania\";i:2;s:12:\"Aland Island\";i:3;s:7:\"Algeria\";i:4;s:14:\"American Samoa\";i:5;s:7:\"Andorra\";i:6;s:6:\"Angola\";i:7;s:8:\"Anguilla\";i:8;s:19:\"Antigua and Barbuda\";i:9;s:9:\"Argentina\";i:10;s:7:\"Armenia\";i:11;s:5:\"Aruba\";i:12;s:9:\"Australia\";i:13;s:7:\"Austria\";i:14;s:10:\"Azerbaijan\";i:15;s:7:\"Bahamas\";i:16;s:7:\"Bahrain\";i:17;s:10:\"Bangladesh\";i:18;s:8:\"Barbados\";i:19;s:7:\"Belarus\";i:20;s:7:\"Belgium\";i:21;s:6:\"Belize\";i:22;s:5:\"Benin\";i:23;s:7:\"Bermuda\";i:24;s:6:\"Bhutan\";i:25;s:7:\"Bolivia\";i:26;s:22:\"Bosnia and Herzegovina\";i:27;s:8:\"Botswana\";i:28;s:11:\"Timor-Leste\";i:29;s:6:\"Brazil\";i:30;s:17:\"Brunei Darussalam\";i:31;s:8:\"Bulgaria\";i:32;s:12:\"Burkina Faso\";i:33;s:7:\"Burundi\";i:34;s:8:\"Cambodia\";i:35;s:8:\"Cameroon\";i:36;s:6:\"Canada\";i:37;s:10:\"Cape Verde\";i:38;s:14:\"Cayman Islands\";i:39;s:24:\"Central African Republic\";i:40;s:4:\"Chad\";i:41;s:5:\"Chile\";i:42;s:5:\"China\";i:43;s:8:\"Colombia\";i:44;s:7:\"Comoros\";i:45;s:5:\"Congo\";i:46;s:37:\"Congo, the Democratic Republic of the\";i:47;s:12:\"Cook Islands\";i:48;s:10:\"Costa Rica\";i:49;s:14:\"CÃ´te d\'Ivoire\";i:50;s:7:\"Croatia\";i:51;s:4:\"Cuba\";i:52;s:6:\"Cyprus\";i:53;s:14:\"Czech Republic\";i:54;s:7:\"Denmark\";i:55;s:8:\"Djibouti\";i:56;s:8:\"Dominica\";i:57;s:18:\"Dominican Republic\";i:58;s:7:\"Ecuador\";i:59;s:5:\"Egypt\";i:60;s:11:\"El Salvador\";i:61;s:17:\"Equatorial Guinea\";i:62;s:7:\"Eritrea\";i:63;s:7:\"Estonia\";i:64;s:8:\"Ethiopia\";i:65;s:27:\"Falkland Islands (Malvinas)\";i:66;s:13:\"Faroe Islands\";i:67;s:4:\"Fiji\";i:68;s:7:\"Finland\";i:69;s:6:\"France\";i:70;s:13:\"French Guiana\";i:71;s:16:\"French Polynesia\";i:72;s:5:\"Gabon\";i:73;s:6:\"Gambia\";i:74;s:7:\"Georgia\";i:75;s:7:\"Germany\";i:76;s:5:\"Ghana\";i:77;s:9:\"Gibraltar\";i:78;s:6:\"Greece\";i:79;s:9:\"Greenland\";i:80;s:7:\"Grenada\";i:81;s:10:\"Guadeloupe\";i:82;s:4:\"Guam\";i:83;s:9:\"Guatemala\";i:84;s:9:\"Guernesey\";i:85;s:6:\"Guinea\";i:86;s:13:\"Guinea-Bissau\";i:87;s:6:\"Guyana\";i:88;s:5:\"Haiti\";i:89;s:29:\"Holy See (Vatican City State)\";i:90;s:8:\"Honduras\";i:91;s:9:\"Hong Kong\";i:92;s:7:\"Hungary\";i:93;s:7:\"Iceland\";i:94;s:5:\"India\";i:95;s:9:\"Indonesia\";i:96;s:25:\"Iran, Islamic Republic of\";i:97;s:4:\"Iraq\";i:98;s:7:\"Ireland\";i:99;s:11:\"Isle of Man\";i:100;s:6:\"Israel\";i:101;s:5:\"Italy\";i:102;s:7:\"Jamaica\";i:103;s:5:\"Japan\";i:104;s:6:\"Jersey\";i:105;s:6:\"Jordan\";i:106;s:10:\"Kazakhstan\";i:107;s:5:\"Kenya\";i:108;s:8:\"Kiribati\";i:109;s:18:\"Korea, Republic of\";i:110;s:6:\"Kuwait\";i:111;s:10:\"Kyrgyzstan\";i:112;s:6:\"Latvia\";i:113;s:7:\"Lebanon\";i:114;s:7:\"Lesotho\";i:115;s:7:\"Liberia\";i:116;s:22:\"Libyan Arab Jamahiriya\";i:117;s:13:\"Liechtenstein\";i:118;s:9:\"Lithuania\";i:119;s:10:\"Luxembourg\";i:120;s:5:\"Macao\";i:121;s:42:\"Macedonia, the Former Yugoslav Republic of\";i:122;s:10:\"Madagascar\";i:123;s:6:\"Malawi\";i:124;s:8:\"Malaysia\";i:125;s:8:\"Maldives\";i:126;s:4:\"Mali\";i:127;s:5:\"Malta\";i:128;s:16:\"Marshall Islands\";i:129;s:10:\"Martinique\";i:130;s:10:\"Mauritania\";i:131;s:9:\"Mauritius\";i:132;s:6:\"Mexico\";i:133;s:31:\"Micronesia, Federated States of\";i:134;s:20:\"Moldova, Republic of\";i:135;s:6:\"Monaco\";i:136;s:8:\"Mongolia\";i:137;s:10:\"Montserrat\";i:138;s:7:\"Morocco\";i:139;s:10:\"Mozambique\";i:140;s:7:\"Myanmar\";i:141;s:7:\"Namibia\";i:142;s:5:\"Nauru\";i:143;s:5:\"Nepal\";i:144;s:11:\"Netherlands\";i:145;s:20:\"Netherlands Antilles\";i:146;s:13:\"New Caledonia\";i:147;s:11:\"New Zealand\";i:148;s:9:\"Nicaragua\";i:149;s:5:\"Niger\";i:150;s:7:\"Nigeria\";i:151;s:4:\"Niue\";i:152;s:14:\"Norfolk Island\";i:153;s:24:\"Northern Mariana Islands\";i:154;s:6:\"Norway\";i:155;s:4:\"Oman\";i:156;s:8:\"Pakistan\";i:157;s:5:\"Palau\";i:158;s:6:\"Panama\";i:159;s:16:\"Papua New Guinea\";i:160;s:8:\"Paraguay\";i:161;s:4:\"Peru\";i:162;s:11:\"Philippines\";i:163;s:8:\"Pitcairn\";i:164;s:6:\"Poland\";i:165;s:8:\"Portugal\";i:166;s:11:\"Puerto Rico\";i:167;s:5:\"Qatar\";i:168;s:7:\"Reunion\";i:169;s:7:\"Romania\";i:170;s:18:\"Russian Federation\";i:171;s:6:\"Rwanda\";i:172;s:12:\"Saint Helena\";i:173;s:21:\"Saint Kitts and Nevis\";i:174;s:11:\"Saint Lucia\";i:175;s:25:\"Saint Pierre and Miquelon\";i:176;s:32:\"Saint Vincent and the Grenadines\";i:177;s:5:\"Samoa\";i:178;s:10:\"San Marino\";i:179;s:21:\"Sao Tome and Principe\";i:180;s:12:\"Saudi Arabia\";i:181;s:7:\"Senegal\";i:182;s:6:\"Serbia\";i:183;s:10:\"Seychelles\";i:184;s:12:\"Sierra Leone\";i:185;s:9:\"Singapore\";i:186;s:8:\"Slovakia\";i:187;s:8:\"Slovenia\";i:188;s:15:\"Solomon Islands\";i:189;s:7:\"Somalia\";i:190;s:12:\"South Africa\";i:191;s:5:\"Spain\";i:192;s:9:\"Sri Lanka\";i:193;s:5:\"Sudan\";i:194;s:8:\"Suriname\";i:195;s:22:\"Svalbard and Jan Mayen\";i:196;s:9:\"Swaziland\";i:197;s:6:\"Sweden\";i:198;s:11:\"Switzerland\";i:199;s:20:\"Syrian Arab Republic\";i:200;s:25:\"Taiwan, Province of China\";i:201;s:10:\"Tajikistan\";i:202;s:28:\"Tanzania, United Republic of\";i:203;s:8:\"Thailand\";i:204;s:4:\"Togo\";i:205;s:7:\"Tokelau\";i:206;s:5:\"Tonga\";i:207;s:19:\"Trinidad and Tobago\";i:208;s:7:\"Tunisia\";i:209;s:6:\"Turkey\";i:210;s:12:\"Turkmenistan\";i:211;s:24:\"Turks and Caicos Islands\";i:212;s:6:\"Tuvalu\";i:213;s:6:\"Uganda\";i:214;s:7:\"Ukraine\";i:215;s:20:\"United Arab Emirates\";i:216;s:14:\"United Kingdom\";i:217;s:13:\"United States\";i:218;s:7:\"Uruguay\";i:219;s:10:\"Uzbekistan\";i:220;s:7:\"Vanuatu\";i:221;s:9:\"Venezuela\";i:222;s:8:\"Viet Nam\";i:223;s:23:\"Virgin Islands, British\";i:224;s:20:\"Virgin Islands, U.s.\";i:225;s:17:\"Wallis and Futuna\";i:226;s:14:\"Western Sahara\";i:227;s:5:\"Yemen\";i:228;s:6:\"Zambia\";i:229;s:8:\"Zimbabwe\";}}',1407311162,1,'1');

/*Table structure for table `email_dynamic_content_block` */

DROP TABLE IF EXISTS `email_dynamic_content_block`;

CREATE TABLE `email_dynamic_content_block` (
  `blockid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `rules` longtext NOT NULL,
  `activated` char(1) DEFAULT NULL,
  `sortorder` int(4) unsigned NOT NULL,
  PRIMARY KEY (`blockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_dynamic_content_block` */

/*Table structure for table `email_dynamic_content_tags` */

DROP TABLE IF EXISTS `email_dynamic_content_tags`;

CREATE TABLE `email_dynamic_content_tags` (
  `tagid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdate` int(11) unsigned NOT NULL,
  `ownerid` int(11) unsigned NOT NULL,
  PRIMARY KEY (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_dynamic_content_tags` */

/*Table structure for table `email_folder_item` */

DROP TABLE IF EXISTS `email_folder_item`;

CREATE TABLE `email_folder_item` (
  `folderid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  PRIMARY KEY (`folderid`,`itemid`),
  UNIQUE KEY `email_folder_item_folderid_itemid_idx` (`folderid`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_folder_item` */

/*Table structure for table `email_folder_user` */

DROP TABLE IF EXISTS `email_folder_user`;

CREATE TABLE `email_folder_user` (
  `folderid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `expanded` char(1) NOT NULL DEFAULT '1',
  `ordering` int(11) DEFAULT NULL,
  PRIMARY KEY (`folderid`,`userid`),
  KEY `email_folder_user_userid_folderid_idx` (`userid`,`folderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_folder_user` */

/*Table structure for table `email_folders` */

DROP TABLE IF EXISTS `email_folders`;

CREATE TABLE `email_folders` (
  `folderid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `createdate` int(11) DEFAULT '0',
  `ownerid` int(11) DEFAULT NULL,
  PRIMARY KEY (`folderid`),
  UNIQUE KEY `email_folders_name_type_ownerid_idx` (`name`,`type`,`ownerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_folders` */

/*Table structure for table `email_form_customfields` */

DROP TABLE IF EXISTS `email_form_customfields`;

CREATE TABLE `email_form_customfields` (
  `formid` int(11) DEFAULT '0',
  `fieldid` varchar(10) DEFAULT '0',
  `fieldorder` int(11) DEFAULT '0',
  UNIQUE KEY `email_form_customfields_formid_listid_idx` (`formid`,`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_form_customfields` */

/*Table structure for table `email_form_lists` */

DROP TABLE IF EXISTS `email_form_lists`;

CREATE TABLE `email_form_lists` (
  `formid` int(11) DEFAULT '0',
  `listid` int(11) DEFAULT '0',
  UNIQUE KEY `email_form_lists_formid_listid_idx` (`formid`,`listid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_form_lists` */

/*Table structure for table `email_form_pages` */

DROP TABLE IF EXISTS `email_form_pages`;

CREATE TABLE `email_form_pages` (
  `pageid` int(11) NOT NULL AUTO_INCREMENT,
  `formid` int(11) DEFAULT '0',
  `pagetype` varchar(100) DEFAULT NULL,
  `html` longtext,
  `url` varchar(255) DEFAULT NULL,
  `sendfromname` varchar(255) DEFAULT NULL,
  `sendfromemail` varchar(255) DEFAULT NULL,
  `replytoemail` varchar(255) DEFAULT NULL,
  `bounceemail` varchar(255) DEFAULT NULL,
  `emailsubject` varchar(255) DEFAULT NULL,
  `emailhtml` longtext,
  `emailtext` longtext,
  PRIMARY KEY (`pageid`),
  KEY `email_form_pages_formid_idx` (`formid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_form_pages` */

/*Table structure for table `email_forms` */

DROP TABLE IF EXISTS `email_forms`;

CREATE TABLE `email_forms` (
  `formid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `design` varchar(255) DEFAULT NULL,
  `formhtml` longtext,
  `chooseformat` varchar(2) DEFAULT NULL,
  `changeformat` varchar(1) DEFAULT '0',
  `sendthanks` varchar(1) DEFAULT '0',
  `requireconfirm` varchar(1) DEFAULT '0',
  `ownerid` int(11) DEFAULT '0',
  `formtype` char(1) DEFAULT NULL,
  `createdate` int(11) DEFAULT '0',
  `contactform` varchar(1) DEFAULT '0',
  `usecaptcha` varchar(1) DEFAULT '0',
  PRIMARY KEY (`formid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_forms` */

/*Table structure for table `email_jobs` */

DROP TABLE IF EXISTS `email_jobs`;

CREATE TABLE `email_jobs` (
  `jobid` int(11) NOT NULL AUTO_INCREMENT,
  `jobtype` varchar(255) DEFAULT NULL,
  `jobstatus` char(1) DEFAULT NULL,
  `jobtime` int(11) DEFAULT '0',
  `jobdetails` text,
  `fkid` int(11) DEFAULT '0',
  `lastupdatetime` int(11) DEFAULT '0',
  `fktype` varchar(255) DEFAULT NULL,
  `queueid` int(11) DEFAULT '0',
  `ownerid` int(11) DEFAULT '0',
  `approved` int(11) DEFAULT '0',
  `authorisedtosend` int(11) DEFAULT '0',
  `resendcount` int(11) DEFAULT '0',
  PRIMARY KEY (`jobid`),
  KEY `email_jobs_fkid_idx` (`fkid`),
  KEY `email_jobs_jobtime_idx` (`jobtime`),
  KEY `email_jobs_queue_idx` (`queueid`),
  KEY `email_jobs_owner_idx` (`ownerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_jobs` */

/*Table structure for table `email_jobs_lists` */

DROP TABLE IF EXISTS `email_jobs_lists`;

CREATE TABLE `email_jobs_lists` (
  `jobid` int(11) DEFAULT '0',
  `listid` int(11) DEFAULT '0',
  UNIQUE KEY `email_jobs_lists_jobid_listid_idx` (`jobid`,`listid`),
  KEY `email_jobs_lists_listid_idx` (`listid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_jobs_lists` */

/*Table structure for table `email_links` */

DROP TABLE IF EXISTS `email_links`;

CREATE TABLE `email_links` (
  `linkid` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`linkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_links` */

/*Table structure for table `email_list_subscriber_bounces` */

DROP TABLE IF EXISTS `email_list_subscriber_bounces`;

CREATE TABLE `email_list_subscriber_bounces` (
  `bounceid` int(11) NOT NULL AUTO_INCREMENT,
  `subscriberid` int(11) DEFAULT '0',
  `statid` int(11) DEFAULT '0',
  `listid` int(11) DEFAULT '0',
  `bouncetime` int(11) DEFAULT '0',
  `bouncetype` varchar(255) DEFAULT NULL,
  `bouncerule` varchar(255) DEFAULT NULL,
  `bouncemessage` longtext,
  PRIMARY KEY (`bounceid`),
  KEY `email_list_subscriber_bounces_statid_idx` (`statid`),
  KEY `email_list_subscriber_bounces_listid_idx` (`listid`),
  KEY `email_list_subscriber_bounces_subscriberid_idx` (`subscriberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_list_subscriber_bounces` */

/*Table structure for table `email_list_subscriber_events` */

DROP TABLE IF EXISTS `email_list_subscriber_events`;

CREATE TABLE `email_list_subscriber_events` (
  `eventid` int(11) NOT NULL AUTO_INCREMENT,
  `subscriberid` int(11) NOT NULL,
  `listid` int(11) NOT NULL,
  `eventtype` text NOT NULL,
  `eventsubject` text NOT NULL,
  `eventdate` int(11) NOT NULL,
  `lastupdate` int(11) NOT NULL,
  `eventownerid` int(11) NOT NULL,
  `eventnotes` text NOT NULL,
  PRIMARY KEY (`eventid`),
  KEY `email_list_subscriber_events_subscriberid_idx` (`subscriberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_list_subscriber_events` */

/*Table structure for table `email_list_subscribers` */

DROP TABLE IF EXISTS `email_list_subscribers`;

CREATE TABLE `email_list_subscribers` (
  `subscriberid` int(11) NOT NULL AUTO_INCREMENT,
  `listid` int(11) NOT NULL DEFAULT '0',
  `emailaddress` varchar(200) DEFAULT NULL,
  `domainname` varchar(100) DEFAULT NULL,
  `format` char(1) DEFAULT NULL,
  `confirmed` char(1) DEFAULT '0',
  `confirmcode` varchar(32) DEFAULT NULL,
  `requestdate` int(11) DEFAULT '0',
  `requestip` varchar(20) DEFAULT NULL,
  `confirmdate` int(11) DEFAULT '0',
  `confirmip` varchar(20) DEFAULT NULL,
  `subscribedate` int(11) DEFAULT '0',
  `bounced` int(11) DEFAULT '0',
  `unsubscribed` int(11) DEFAULT '0',
  `unsubscribeconfirmed` char(1) DEFAULT '0',
  `formid` int(11) DEFAULT '0',
  PRIMARY KEY (`subscriberid`),
  UNIQUE KEY `email_subscribers_email_list_idx` (`emailaddress`,`listid`),
  KEY `email_list_subscribers_sub_list_idx` (`subscriberid`,`listid`),
  KEY `email_subscribe_date_idx` (`subscribedate`),
  KEY `email_list_subscribers_listid_idx` (`listid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `email_list_subscribers` */

insert  into `email_list_subscribers`(`subscriberid`,`listid`,`emailaddress`,`domainname`,`format`,`confirmed`,`confirmcode`,`requestdate`,`requestip`,`confirmdate`,`confirmip`,`subscribedate`,`bounced`,`unsubscribed`,`unsubscribeconfirmed`,`formid`) values (1,1,'nguyentamvinhlong@gmail.com','@gmail.com','h','1','2b64291fdf11eab371617c12a0a40ba5',1407311854,'',1407311854,'',1407311854,0,0,'0',0),(2,1,'nnhansg@gmail.com','@gmail.com','h','1','cf036ffb7eb51ad406e1aa19be3f851b',1407311881,'',1407311881,'',1407311881,0,0,'0',0),(3,1,'ntamvl@gmail.com','@gmail.com','h','1','93d8edf15981f14de61aedfdd92298cc',1407311892,'',1407311892,'',1407311892,0,0,'0',0);

/*Table structure for table `email_list_subscribers_unsubscribe` */

DROP TABLE IF EXISTS `email_list_subscribers_unsubscribe`;

CREATE TABLE `email_list_subscribers_unsubscribe` (
  `subscriberid` int(11) NOT NULL DEFAULT '0',
  `unsubscribetime` int(11) NOT NULL DEFAULT '0',
  `unsubscribeip` varchar(20) DEFAULT NULL,
  `unsubscriberequesttime` int(11) DEFAULT '0',
  `unsubscriberequestip` varchar(20) DEFAULT NULL,
  `listid` int(11) NOT NULL DEFAULT '0',
  `statid` int(11) DEFAULT '0',
  `unsubscribearea` varchar(20) DEFAULT NULL,
  KEY `email_list_unsubscribe_sub_list_idx` (`subscriberid`,`listid`),
  KEY `email_list_subscribers_unsubscribe_statid_idx` (`statid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_list_subscribers_unsubscribe` */

/*Table structure for table `email_list_tags` */

DROP TABLE IF EXISTS `email_list_tags`;

CREATE TABLE `email_list_tags` (
  `tagid` int(11) unsigned NOT NULL,
  `listid` int(11) unsigned NOT NULL,
  PRIMARY KEY (`tagid`,`listid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_list_tags` */

/*Table structure for table `email_lists` */

DROP TABLE IF EXISTS `email_lists`;

CREATE TABLE `email_lists` (
  `listid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `ownername` varchar(255) DEFAULT NULL,
  `owneremail` varchar(100) DEFAULT NULL,
  `bounceemail` varchar(100) DEFAULT NULL,
  `replytoemail` varchar(100) DEFAULT NULL,
  `bounceserver` varchar(100) DEFAULT NULL,
  `bounceusername` varchar(100) DEFAULT NULL,
  `bouncepassword` varchar(100) DEFAULT NULL,
  `extramailsettings` varchar(100) DEFAULT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  `companyaddress` varchar(255) DEFAULT NULL,
  `companyphone` varchar(20) DEFAULT NULL,
  `format` char(1) DEFAULT NULL,
  `notifyowner` char(1) DEFAULT '0',
  `imapaccount` char(1) DEFAULT '0',
  `createdate` int(11) DEFAULT '0',
  `subscribecount` int(11) DEFAULT '0',
  `unsubscribecount` int(11) DEFAULT '0',
  `bouncecount` int(11) DEFAULT '0',
  `processbounce` char(1) DEFAULT '0',
  `agreedelete` char(1) DEFAULT '0',
  `agreedeleteall` char(1) DEFAULT '0',
  `visiblefields` text NOT NULL,
  `ownerid` int(11) DEFAULT '0',
  PRIMARY KEY (`listid`),
  KEY `email_lists_owner_idx` (`ownerid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `email_lists` */

insert  into `email_lists`(`listid`,`name`,`ownername`,`owneremail`,`bounceemail`,`replytoemail`,`bounceserver`,`bounceusername`,`bouncepassword`,`extramailsettings`,`companyname`,`companyaddress`,`companyphone`,`format`,`notifyowner`,`imapaccount`,`createdate`,`subscribecount`,`unsubscribecount`,`bouncecount`,`processbounce`,`agreedelete`,`agreedeleteall`,`visiblefields`,`ownerid`) values (1,'Newletter August 6','Zigexn Ventura','nguyentamvinhlong@gmail.com','nguyentamvinhlong@gmail.com','nguyentamvinhlong@gmail.com','','','','','Zigexn Ventura','','','b','1','0',1407311796,3,0,0,'0','1','0','emailaddress,subscribedate,format,status,confirmed',1);

/*Table structure for table `email_log_system_administrator` */

DROP TABLE IF EXISTS `email_log_system_administrator`;

CREATE TABLE `email_log_system_administrator` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `loguserid` int(11) NOT NULL,
  `logip` varchar(30) NOT NULL DEFAULT '',
  `logdate` int(11) NOT NULL DEFAULT '0',
  `logtodo` varchar(100) NOT NULL DEFAULT '',
  `logdata` text NOT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_log_system_administrator` */

/*Table structure for table `email_log_system_system` */

DROP TABLE IF EXISTS `email_log_system_system`;

CREATE TABLE `email_log_system_system` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `logtype` varchar(20) DEFAULT NULL,
  `logmodule` varchar(100) NOT NULL DEFAULT '',
  `logseverity` char(1) NOT NULL DEFAULT '4',
  `logsummary` varchar(250) NOT NULL,
  `logmsg` text NOT NULL,
  `logdate` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `email_log_system_system` */

insert  into `email_log_system_system`(`logid`,`logtype`,`logmodule`,`logseverity`,`logsummary`,`logmsg`,`logdate`) values (1,'php','','2','unserialize(): Error at offset 4700 of 8910 bytes','unserialize(): Error at offset 4700 of 8910 bytes in /var/www/html/emailmarketer/admin/functions/subscribers_add.php at 363<br/>\n<table style=\"width: 100%; margin: 10px 0; border: 1px solid #aaa; border-collapse: collapse; border-bottom: 0;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n<thead><tr>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">File</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Line</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Function</th>\n</tr></thead>\n<tbody>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">[PHP]</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">&nbsp;</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">HandlePHPErrors</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">363</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">unserialize</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">55</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->AddSubscriber_Step2</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">103</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/com/init.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">556</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/index.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">80</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">require_once</td>\n</tr>\n</tbody></table>\n',1407311805),(2,'php','','3','Invalid argument supplied for foreach()','Invalid argument supplied for foreach() in /var/www/html/emailmarketer/admin/functions/subscribers_add.php at 368<br/>\n<table style=\"width: 100%; margin: 10px 0; border: 1px solid #aaa; border-collapse: collapse; border-bottom: 0;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n<thead><tr>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">File</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Line</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Function</th>\n</tr></thead>\n<tbody>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">368</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">HandlePHPErrors</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">55</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->AddSubscriber_Step2</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">103</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/com/init.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">556</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/index.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">80</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">require_once</td>\n</tr>\n</tbody></table>\n',1407311805),(3,'php','','2','unserialize(): Error at offset 4700 of 8910 bytes','unserialize(): Error at offset 4700 of 8910 bytes in /var/www/html/emailmarketer/admin/functions/api/customfields.php at 243<br/>\n<table style=\"width: 100%; margin: 10px 0; border: 1px solid #aaa; border-collapse: collapse; border-bottom: 0;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n<thead><tr>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">File</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Line</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Function</th>\n</tr></thead>\n<tbody>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">[PHP]</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">&nbsp;</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">HandlePHPErrors</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/api/customfields.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">243</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">unserialize</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/api/customfields.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">206</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">CustomFields_API->SetAllOptions</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">133</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">CustomFields_API->Load</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">103</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/com/init.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">556</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/index.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">80</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">require_once</td>\n</tr>\n</tbody></table>\n',1407311854),(4,'php','','2','unserialize(): Error at offset 4700 of 8910 bytes','unserialize(): Error at offset 4700 of 8910 bytes in /var/www/html/emailmarketer/admin/functions/api/customfields.php at 243<br/>\n<table style=\"width: 100%; margin: 10px 0; border: 1px solid #aaa; border-collapse: collapse; border-bottom: 0;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n<thead><tr>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">File</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Line</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Function</th>\n</tr></thead>\n<tbody>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">[PHP]</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">&nbsp;</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">HandlePHPErrors</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/api/customfields.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">243</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">unserialize</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/api/customfields.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">206</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">CustomFields_API->SetAllOptions</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/api/customfields.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">290</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">CustomFields_API->Load</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/api/customfields.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">725</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">CustomFields_API->LoadSubField</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">166</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">CustomFields_API->ValidData</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">103</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/com/init.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">556</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/index.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">80</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">require_once</td>\n</tr>\n</tbody></table>\n',1407311854),(5,'php','','2','unserialize(): Error at offset 4700 of 8910 bytes','unserialize(): Error at offset 4700 of 8910 bytes in /var/www/html/emailmarketer/admin/functions/subscribers_add.php at 363<br/>\n<table style=\"width: 100%; margin: 10px 0; border: 1px solid #aaa; border-collapse: collapse; border-bottom: 0;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n<thead><tr>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">File</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Line</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Function</th>\n</tr></thead>\n<tbody>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">[PHP]</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">&nbsp;</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">HandlePHPErrors</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">363</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">unserialize</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">194</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->AddSubscriber_Step2</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">103</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/com/init.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">556</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/index.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">80</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">require_once</td>\n</tr>\n</tbody></table>\n',1407311855),(6,'php','','3','Invalid argument supplied for foreach()','Invalid argument supplied for foreach() in /var/www/html/emailmarketer/admin/functions/subscribers_add.php at 368<br/>\n<table style=\"width: 100%; margin: 10px 0; border: 1px solid #aaa; border-collapse: collapse; border-bottom: 0;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n<thead><tr>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">File</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Line</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Function</th>\n</tr></thead>\n<tbody>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">368</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">HandlePHPErrors</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">194</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->AddSubscriber_Step2</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">103</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/com/init.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">556</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/index.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">80</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">require_once</td>\n</tr>\n</tbody></table>\n',1407311855),(7,'php','','2','unserialize(): Error at offset 4700 of 8910 bytes','unserialize(): Error at offset 4700 of 8910 bytes in /var/www/html/emailmarketer/admin/functions/api/customfields.php at 243<br/>\n<table style=\"width: 100%; margin: 10px 0; border: 1px solid #aaa; border-collapse: collapse; border-bottom: 0;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n<thead><tr>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">File</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Line</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Function</th>\n</tr></thead>\n<tbody>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">[PHP]</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">&nbsp;</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">HandlePHPErrors</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/api/customfields.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">243</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">unserialize</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/api/customfields.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">206</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">CustomFields_API->SetAllOptions</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">133</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">CustomFields_API->Load</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">103</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/com/init.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">556</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/index.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">80</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">require_once</td>\n</tr>\n</tbody></table>\n',1407311881),(8,'php','','2','unserialize(): Error at offset 4700 of 8910 bytes','unserialize(): Error at offset 4700 of 8910 bytes in /var/www/html/emailmarketer/admin/functions/api/customfields.php at 243<br/>\n<table style=\"width: 100%; margin: 10px 0; border: 1px solid #aaa; border-collapse: collapse; border-bottom: 0;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n<thead><tr>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">File</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Line</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Function</th>\n</tr></thead>\n<tbody>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">[PHP]</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">&nbsp;</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">HandlePHPErrors</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/api/customfields.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">243</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">unserialize</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/api/customfields.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">206</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">CustomFields_API->SetAllOptions</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/api/customfields.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">290</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">CustomFields_API->Load</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/api/customfields.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">725</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">CustomFields_API->LoadSubField</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">166</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">CustomFields_API->ValidData</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">103</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/com/init.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">556</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/index.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">80</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">require_once</td>\n</tr>\n</tbody></table>\n',1407311881),(9,'php','','2','unserialize(): Error at offset 4700 of 8910 bytes','unserialize(): Error at offset 4700 of 8910 bytes in /var/www/html/emailmarketer/admin/functions/subscribers_add.php at 363<br/>\n<table style=\"width: 100%; margin: 10px 0; border: 1px solid #aaa; border-collapse: collapse; border-bottom: 0;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n<thead><tr>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">File</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Line</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Function</th>\n</tr></thead>\n<tbody>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">[PHP]</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">&nbsp;</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">HandlePHPErrors</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">363</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">unserialize</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">194</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->AddSubscriber_Step2</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">103</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/com/init.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">556</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/index.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">80</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">require_once</td>\n</tr>\n</tbody></table>\n',1407311882),(10,'php','','3','Invalid argument supplied for foreach()','Invalid argument supplied for foreach() in /var/www/html/emailmarketer/admin/functions/subscribers_add.php at 368<br/>\n<table style=\"width: 100%; margin: 10px 0; border: 1px solid #aaa; border-collapse: collapse; border-bottom: 0;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n<thead><tr>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">File</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Line</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Function</th>\n</tr></thead>\n<tbody>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">368</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">HandlePHPErrors</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">194</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->AddSubscriber_Step2</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">103</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/com/init.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">556</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/index.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">80</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">require_once</td>\n</tr>\n</tbody></table>\n',1407311882),(11,'php','','2','unserialize(): Error at offset 4700 of 8910 bytes','unserialize(): Error at offset 4700 of 8910 bytes in /var/www/html/emailmarketer/admin/functions/api/customfields.php at 243<br/>\n<table style=\"width: 100%; margin: 10px 0; border: 1px solid #aaa; border-collapse: collapse; border-bottom: 0;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n<thead><tr>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">File</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Line</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Function</th>\n</tr></thead>\n<tbody>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">[PHP]</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">&nbsp;</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">HandlePHPErrors</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/api/customfields.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">243</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">unserialize</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/api/customfields.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">206</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">CustomFields_API->SetAllOptions</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">133</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">CustomFields_API->Load</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">103</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/com/init.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">556</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/index.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">80</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">require_once</td>\n</tr>\n</tbody></table>\n',1407311891),(12,'php','','2','unserialize(): Error at offset 4700 of 8910 bytes','unserialize(): Error at offset 4700 of 8910 bytes in /var/www/html/emailmarketer/admin/functions/api/customfields.php at 243<br/>\n<table style=\"width: 100%; margin: 10px 0; border: 1px solid #aaa; border-collapse: collapse; border-bottom: 0;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n<thead><tr>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">File</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Line</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Function</th>\n</tr></thead>\n<tbody>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">[PHP]</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">&nbsp;</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">HandlePHPErrors</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/api/customfields.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">243</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">unserialize</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/api/customfields.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">206</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">CustomFields_API->SetAllOptions</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/api/customfields.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">290</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">CustomFields_API->Load</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/api/customfields.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">725</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">CustomFields_API->LoadSubField</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">166</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">CustomFields_API->ValidData</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">103</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/com/init.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">556</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/index.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">80</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">require_once</td>\n</tr>\n</tbody></table>\n',1407311891),(13,'php','','2','unserialize(): Error at offset 4700 of 8910 bytes','unserialize(): Error at offset 4700 of 8910 bytes in /var/www/html/emailmarketer/admin/functions/subscribers_add.php at 363<br/>\n<table style=\"width: 100%; margin: 10px 0; border: 1px solid #aaa; border-collapse: collapse; border-bottom: 0;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n<thead><tr>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">File</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Line</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Function</th>\n</tr></thead>\n<tbody>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">[PHP]</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">&nbsp;</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">HandlePHPErrors</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">363</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">unserialize</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">194</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->AddSubscriber_Step2</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">103</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/com/init.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">556</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/index.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">80</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">require_once</td>\n</tr>\n</tbody></table>\n',1407311892),(14,'php','','3','Invalid argument supplied for foreach()','Invalid argument supplied for foreach() in /var/www/html/emailmarketer/admin/functions/subscribers_add.php at 368<br/>\n<table style=\"width: 100%; margin: 10px 0; border: 1px solid #aaa; border-collapse: collapse; border-bottom: 0;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n<thead><tr>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">File</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Line</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Function</th>\n</tr></thead>\n<tbody>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">368</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">HandlePHPErrors</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">194</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->AddSubscriber_Step2</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">103</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/com/init.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">556</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/index.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">80</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">require_once</td>\n</tr>\n</tbody></table>\n',1407311892),(15,'php','','2','unserialize(): Error at offset 4700 of 8910 bytes','unserialize(): Error at offset 4700 of 8910 bytes in /var/www/html/emailmarketer/admin/functions/subscribers_add.php at 363<br/>\n<table style=\"width: 100%; margin: 10px 0; border: 1px solid #aaa; border-collapse: collapse; border-bottom: 0;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n<thead><tr>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">File</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Line</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Function</th>\n</tr></thead>\n<tbody>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">[PHP]</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">&nbsp;</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">HandlePHPErrors</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">363</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">unserialize</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">213</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->AddSubscriber_Step2</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">103</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/com/init.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">556</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/index.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">80</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">require_once</td>\n</tr>\n</tbody></table>\n',1407311903),(16,'php','','3','Invalid argument supplied for foreach()','Invalid argument supplied for foreach() in /var/www/html/emailmarketer/admin/functions/subscribers_add.php at 368<br/>\n<table style=\"width: 100%; margin: 10px 0; border: 1px solid #aaa; border-collapse: collapse; border-bottom: 0;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n<thead><tr>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">File</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Line</th>\n<th style=\"border-bottom: 1px solid #aaa; background: #ccc; padding: 4px; text-align: left; font-size: 11px;\">Function</th>\n</tr></thead>\n<tbody>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">368</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">HandlePHPErrors</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers_add.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">213</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->AddSubscriber_Step2</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/functions/subscribers.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">103</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers_Add->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/com/init.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">556</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">Subscribers->Process</td>\n</tr>\n<tr>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">/var/www/html/emailmarketer/admin/index.php</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">80</td>\n<td style=\"font-size: 11px; padding: 4px; border-bottom: 1px solid #ccc;\">require_once</td>\n</tr>\n</tbody></table>\n',1407311903);

/*Table structure for table `email_login_attempt` */

DROP TABLE IF EXISTS `email_login_attempt`;

CREATE TABLE `email_login_attempt` (
  `timestamp` int(11) NOT NULL,
  `ipaddress` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_login_attempt` */

/*Table structure for table `email_login_banned_ip` */

DROP TABLE IF EXISTS `email_login_banned_ip`;

CREATE TABLE `email_login_banned_ip` (
  `ipaddress` varchar(15) NOT NULL,
  `bantime` int(11) NOT NULL,
  PRIMARY KEY (`ipaddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_login_banned_ip` */

/*Table structure for table `email_modules` */

DROP TABLE IF EXISTS `email_modules`;

CREATE TABLE `email_modules` (
  `modulename` varchar(50) NOT NULL,
  `moduleversion` int(11) DEFAULT '0',
  PRIMARY KEY (`modulename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_modules` */

/*Table structure for table `email_newsletters` */

DROP TABLE IF EXISTS `email_newsletters`;

CREATE TABLE `email_newsletters` (
  `newsletterid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `format` char(1) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `textbody` longtext,
  `htmlbody` longtext,
  `createdate` int(11) DEFAULT '0',
  `active` int(11) DEFAULT '0',
  `archive` int(11) DEFAULT '0',
  `ownerid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`newsletterid`),
  KEY `email_newsletters_owner_idx` (`ownerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_newsletters` */

/*Table structure for table `email_queues` */

DROP TABLE IF EXISTS `email_queues`;

CREATE TABLE `email_queues` (
  `queueid` int(11) DEFAULT '0',
  `queuetype` varchar(255) DEFAULT NULL,
  `ownerid` int(11) NOT NULL DEFAULT '0',
  `recipient` int(11) DEFAULT '0',
  `processed` char(1) DEFAULT '0',
  `sent` char(1) DEFAULT '0',
  `processtime` datetime DEFAULT NULL,
  KEY `email_queues_id_type_recip_idx` (`queueid`,`queuetype`,`recipient`),
  KEY `email_queues_id_type_processed_idx` (`queueid`,`queuetype`,`processed`),
  KEY `email_queuetype_recipient_idx` (`queuetype`,`recipient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_queues` */

/*Table structure for table `email_queues_sequence` */

DROP TABLE IF EXISTS `email_queues_sequence`;

CREATE TABLE `email_queues_sequence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `email_queues_sequence` */

insert  into `email_queues_sequence`(`id`) values (1);

/*Table structure for table `email_queues_unsent` */

DROP TABLE IF EXISTS `email_queues_unsent`;

CREATE TABLE `email_queues_unsent` (
  `recipient` int(11) DEFAULT '0',
  `queueid` int(11) DEFAULT '0',
  `reasoncode` int(11) DEFAULT '0',
  `reason` text,
  KEY `email_queues_unsent_queueid_idx` (`queueid`),
  KEY `email_queues_unsent_recipient_idx` (`recipient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_queues_unsent` */

/*Table structure for table `email_segments` */

DROP TABLE IF EXISTS `email_segments`;

CREATE TABLE `email_segments` (
  `segmentid` int(11) NOT NULL AUTO_INCREMENT,
  `segmentname` varchar(255) NOT NULL,
  `createdate` int(11) DEFAULT '0',
  `ownerid` int(11) NOT NULL,
  `searchinfo` text NOT NULL,
  PRIMARY KEY (`segmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_segments` */

/*Table structure for table `email_settings` */

DROP TABLE IF EXISTS `email_settings`;

CREATE TABLE `email_settings` (
  `cronok` char(1) DEFAULT '0',
  `cronrun1` int(11) DEFAULT '0',
  `cronrun2` int(11) DEFAULT '0',
  `database_version` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_settings` */

insert  into `email_settings`(`cronok`,`cronrun1`,`cronrun2`,`database_version`) values ('0',0,0,20111011);

/*Table structure for table `email_settings_credit_warnings` */

DROP TABLE IF EXISTS `email_settings_credit_warnings`;

CREATE TABLE `email_settings_credit_warnings` (
  `creditwarningid` int(11) NOT NULL AUTO_INCREMENT,
  `enabled` char(1) NOT NULL DEFAULT '0',
  `creditlevel` int(11) NOT NULL DEFAULT '0',
  `aspercentage` char(1) NOT NULL DEFAULT '1',
  `emailsubject` varchar(255) NOT NULL,
  `emailcontents` mediumtext NOT NULL,
  PRIMARY KEY (`creditwarningid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_settings_credit_warnings` */

/*Table structure for table `email_settings_cron_schedule` */

DROP TABLE IF EXISTS `email_settings_cron_schedule`;

CREATE TABLE `email_settings_cron_schedule` (
  `jobtype` varchar(20) DEFAULT NULL,
  `lastrun` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_settings_cron_schedule` */

insert  into `email_settings_cron_schedule`(`jobtype`,`lastrun`) values ('autoresponder',0),('bounce',0),('send',0),('triggeremails_s',0),('triggeremails_p',0),('maintenance',0),('splittest',0);

/*Table structure for table `email_splittest_campaigns` */

DROP TABLE IF EXISTS `email_splittest_campaigns`;

CREATE TABLE `email_splittest_campaigns` (
  `splitid` int(11) DEFAULT '0',
  `campaignid` int(11) DEFAULT '0',
  UNIQUE KEY `email_split_campaigns_split_campaign` (`splitid`,`campaignid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_splittest_campaigns` */

/*Table structure for table `email_splittest_statistics` */

DROP TABLE IF EXISTS `email_splittest_statistics`;

CREATE TABLE `email_splittest_statistics` (
  `split_statid` int(11) NOT NULL AUTO_INCREMENT,
  `splitid` int(11) NOT NULL DEFAULT '0',
  `jobid` int(11) NOT NULL DEFAULT '0',
  `starttime` int(11) NOT NULL DEFAULT '0',
  `finishtime` int(11) NOT NULL DEFAULT '0',
  `hiddenby` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`split_statid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_splittest_statistics` */

/*Table structure for table `email_splittest_statistics_newsletters` */

DROP TABLE IF EXISTS `email_splittest_statistics_newsletters`;

CREATE TABLE `email_splittest_statistics_newsletters` (
  `split_statid` int(11) NOT NULL DEFAULT '0',
  `newsletter_statid` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `email_split_stats_newsletters_split_news` (`split_statid`,`newsletter_statid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_splittest_statistics_newsletters` */

/*Table structure for table `email_splittests` */

DROP TABLE IF EXISTS `email_splittests`;

CREATE TABLE `email_splittests` (
  `splitid` int(11) NOT NULL AUTO_INCREMENT,
  `splitname` varchar(200) DEFAULT NULL,
  `splittype` varchar(100) DEFAULT NULL,
  `splitdetails` text,
  `createdate` int(11) DEFAULT '0',
  `userid` int(11) DEFAULT '0',
  `jobid` int(11) DEFAULT '0',
  `jobstatus` char(1) DEFAULT NULL,
  `lastsent` int(11) DEFAULT '0',
  PRIMARY KEY (`splitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_splittests` */

/*Table structure for table `email_stats_autoresponders` */

DROP TABLE IF EXISTS `email_stats_autoresponders`;

CREATE TABLE `email_stats_autoresponders` (
  `statid` int(11) NOT NULL DEFAULT '0',
  `htmlrecipients` int(11) DEFAULT '0',
  `textrecipients` int(11) DEFAULT '0',
  `multipartrecipients` int(11) DEFAULT '0',
  `bouncecount_soft` int(11) DEFAULT '0',
  `bouncecount_hard` int(11) DEFAULT '0',
  `bouncecount_unknown` int(11) DEFAULT '0',
  `unsubscribecount` int(11) DEFAULT '0',
  `autoresponderid` int(11) DEFAULT '0',
  `linkclicks` int(11) DEFAULT '0',
  `emailopens` int(11) DEFAULT '0',
  `emailforwards` int(11) DEFAULT '0',
  `emailopens_unique` int(11) DEFAULT '0',
  `htmlopens` int(11) DEFAULT '0',
  `htmlopens_unique` int(11) DEFAULT '0',
  `textopens` int(11) DEFAULT '0',
  `textopens_unique` int(11) DEFAULT '0',
  `hiddenby` int(11) DEFAULT '0',
  PRIMARY KEY (`statid`),
  KEY `email_stats_autoresponders_statid_idx` (`statid`),
  KEY `email_stats_autoresponders_autoresponderid_idx` (`autoresponderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_stats_autoresponders` */

/*Table structure for table `email_stats_autoresponders_recipients` */

DROP TABLE IF EXISTS `email_stats_autoresponders_recipients`;

CREATE TABLE `email_stats_autoresponders_recipients` (
  `statid` int(11) DEFAULT '0',
  `autoresponderid` int(11) DEFAULT '0',
  `send_status` char(1) DEFAULT NULL,
  `recipient` int(11) DEFAULT '0',
  `reason` varchar(20) DEFAULT NULL,
  `sendtime` int(11) DEFAULT NULL,
  KEY `email_stats_autoresponders_recipients_stat_auto_recip` (`statid`,`autoresponderid`,`recipient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_stats_autoresponders_recipients` */

/*Table structure for table `email_stats_emailforwards` */

DROP TABLE IF EXISTS `email_stats_emailforwards`;

CREATE TABLE `email_stats_emailforwards` (
  `forwardid` int(11) NOT NULL AUTO_INCREMENT,
  `forwardtime` int(11) DEFAULT '0',
  `forwardip` varchar(20) DEFAULT NULL,
  `subscriberid` int(11) DEFAULT NULL,
  `statid` int(11) DEFAULT '0',
  `subscribed` int(11) DEFAULT '0',
  `listid` int(11) DEFAULT NULL,
  `emailaddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`forwardid`),
  KEY `email_stats_emailforwards_subscriberid_idx` (`subscriberid`),
  KEY `email_stats_emailforwards_statid_idx` (`statid`),
  KEY `email_stats_emailforwards_listid_idx` (`listid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_stats_emailforwards` */

/*Table structure for table `email_stats_emailopens` */

DROP TABLE IF EXISTS `email_stats_emailopens`;

CREATE TABLE `email_stats_emailopens` (
  `openid` int(11) NOT NULL AUTO_INCREMENT,
  `subscriberid` int(11) DEFAULT '0',
  `statid` int(11) DEFAULT '0',
  `opentime` int(11) DEFAULT '0',
  `openip` varchar(20) DEFAULT NULL,
  `fromlink` char(1) DEFAULT '0',
  `opentype` char(1) DEFAULT 'u',
  PRIMARY KEY (`openid`),
  KEY `email_stats_emailopens_subscriberid_idx` (`subscriberid`),
  KEY `email_stats_emailopens_statid_idx` (`statid`),
  KEY `email_open_statid_subscriberid` (`subscriberid`,`statid`),
  KEY `email_stats_emailopens_statid_opentime_idx` (`statid`,`opentime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_stats_emailopens` */

/*Table structure for table `email_stats_linkclicks` */

DROP TABLE IF EXISTS `email_stats_linkclicks`;

CREATE TABLE `email_stats_linkclicks` (
  `clickid` int(11) NOT NULL AUTO_INCREMENT,
  `clicktime` int(11) DEFAULT '0',
  `clickip` varchar(20) DEFAULT NULL,
  `subscriberid` int(11) DEFAULT '0',
  `statid` int(11) DEFAULT '0',
  `linkid` int(11) DEFAULT '0',
  PRIMARY KEY (`clickid`),
  KEY `email_stats_linkclicks_subscriberid_idx` (`subscriberid`),
  KEY `email_stats_linkclicks_statid_idx` (`statid`),
  KEY `email_stats_linkclicks_linkid_idx` (`linkid`),
  KEY `email_stats_linkclicks_subscriberid` (`subscriberid`),
  KEY `email_stats_linkclicks_statid_clicktime_idx` (`statid`,`clicktime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_stats_linkclicks` */

/*Table structure for table `email_stats_links` */

DROP TABLE IF EXISTS `email_stats_links`;

CREATE TABLE `email_stats_links` (
  `statid` int(11) DEFAULT '0',
  `linkid` int(11) DEFAULT '0',
  KEY `email_stats_links_statid_idx` (`statid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_stats_links` */

/*Table structure for table `email_stats_newsletter_lists` */

DROP TABLE IF EXISTS `email_stats_newsletter_lists`;

CREATE TABLE `email_stats_newsletter_lists` (
  `statid` int(11) DEFAULT NULL,
  `listid` int(11) DEFAULT '0',
  UNIQUE KEY `email_stats_newsletter_lists_list_stat_idx` (`listid`,`statid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_stats_newsletter_lists` */

/*Table structure for table `email_stats_newsletters` */

DROP TABLE IF EXISTS `email_stats_newsletters`;

CREATE TABLE `email_stats_newsletters` (
  `statid` int(11) NOT NULL DEFAULT '0',
  `queueid` int(11) DEFAULT '0',
  `jobid` int(11) DEFAULT '0',
  `starttime` int(11) DEFAULT '0',
  `finishtime` int(11) DEFAULT '0',
  `htmlrecipients` int(11) DEFAULT '0',
  `textrecipients` int(11) DEFAULT '0',
  `multipartrecipients` int(11) DEFAULT '0',
  `trackopens` char(1) DEFAULT '0',
  `tracklinks` char(1) DEFAULT '0',
  `bouncecount_soft` int(11) DEFAULT '0',
  `bouncecount_hard` int(11) DEFAULT '0',
  `bouncecount_unknown` int(11) DEFAULT '0',
  `unsubscribecount` int(11) DEFAULT '0',
  `newsletterid` int(11) DEFAULT '0',
  `sendfromname` varchar(200) DEFAULT NULL,
  `sendfromemail` varchar(200) DEFAULT NULL,
  `bounceemail` varchar(200) DEFAULT NULL,
  `replytoemail` varchar(200) DEFAULT NULL,
  `charset` varchar(200) DEFAULT NULL,
  `sendinformation` mediumtext,
  `sendsize` int(11) DEFAULT '0',
  `sentby` int(11) DEFAULT '0',
  `notifyowner` char(1) DEFAULT '0',
  `linkclicks` int(11) DEFAULT '0',
  `emailopens` int(11) DEFAULT '0',
  `emailforwards` int(11) DEFAULT '0',
  `emailopens_unique` int(11) DEFAULT '0',
  `htmlopens` int(11) DEFAULT '0',
  `htmlopens_unique` int(11) DEFAULT '0',
  `textopens` int(11) DEFAULT '0',
  `textopens_unique` int(11) DEFAULT '0',
  `hiddenby` int(11) DEFAULT '0',
  `sendtestmode` int(11) DEFAULT '0',
  `sendtype` varchar(100) DEFAULT 'newsletter',
  PRIMARY KEY (`statid`),
  KEY `email_stats_newsletters_queue_idx` (`queueid`),
  KEY `email_stats_newsletters_sentby_idx` (`sentby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_stats_newsletters` */

/*Table structure for table `email_stats_sequence` */

DROP TABLE IF EXISTS `email_stats_sequence`;

CREATE TABLE `email_stats_sequence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `email_stats_sequence` */

insert  into `email_stats_sequence`(`id`) values (1);

/*Table structure for table `email_stats_users` */

DROP TABLE IF EXISTS `email_stats_users`;

CREATE TABLE `email_stats_users` (
  `userid` int(11) DEFAULT '0',
  `statid` int(11) DEFAULT '0',
  `jobid` int(11) DEFAULT '0',
  `queuesize` int(11) DEFAULT '0',
  `queuetime` int(11) DEFAULT '0',
  KEY `email_stats_users_all_idx` (`userid`,`queuetime`,`queuesize`),
  KEY `email_stats_users_statid_idx` (`statid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_stats_users` */

/*Table structure for table `email_subscribers_data` */

DROP TABLE IF EXISTS `email_subscribers_data`;

CREATE TABLE `email_subscribers_data` (
  `subscriberid` int(11) NOT NULL DEFAULT '0',
  `fieldid` int(11) NOT NULL DEFAULT '0',
  `data` text,
  UNIQUE KEY `email_subscribers_data_subscriber_field_idx` (`subscriberid`,`fieldid`),
  KEY `email_subscribers_data_data_idx` (`data`(255)),
  KEY `email_subscriber_data_field_subscriber_idx` (`fieldid`,`subscriberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_subscribers_data` */

insert  into `email_subscribers_data`(`subscriberid`,`fieldid`,`data`) values (1,1,'Mr'),(1,2,'Tam'),(1,3,'Nguyen'),(1,4,'84907516603'),(1,5,'84907516603'),(1,7,'27/03/1985'),(1,8,'Ho Chi Minh'),(1,9,'HCM'),(1,10,'70000'),(2,7,'00/00/'),(3,7,'00/00/');

/*Table structure for table `email_surveys` */

DROP TABLE IF EXISTS `email_surveys`;

CREATE TABLE `email_surveys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT '0',
  `name` tinytext,
  `description` text,
  `created` int(11) NOT NULL,
  `updated` int(11) DEFAULT NULL,
  `surveys_header` enum('headertext','headerlogo') NOT NULL DEFAULT 'headertext',
  `surveys_header_text` varchar(255) NOT NULL,
  `surveys_header_logo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_feedback` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `after_submit` enum('show_message','show_uri') NOT NULL DEFAULT 'show_message',
  `show_message` text NOT NULL,
  `show_uri` text NOT NULL,
  `error_message` text NOT NULL,
  `submit_button_text` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_surveys` */

/*Table structure for table `email_surveys_fields` */

DROP TABLE IF EXISTS `email_surveys_fields`;

CREATE TABLE `email_surveys_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `surveys_widget_id` int(11) unsigned NOT NULL DEFAULT '0',
  `value` text,
  `is_selected` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_other` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `other_label_text` tinytext NOT NULL,
  `display_order` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `surveys_widget_id` (`surveys_widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_surveys_fields` */

/*Table structure for table `email_surveys_response` */

DROP TABLE IF EXISTS `email_surveys_response`;

CREATE TABLE `email_surveys_response` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `surveys_id` int(11) unsigned NOT NULL DEFAULT '0',
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `surveys_id` (`surveys_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_surveys_response` */

/*Table structure for table `email_surveys_response_value` */

DROP TABLE IF EXISTS `email_surveys_response_value`;

CREATE TABLE `email_surveys_response_value` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `surveys_response_id` int(11) unsigned NOT NULL DEFAULT '0',
  `surveys_widgets_id` int(11) unsigned NOT NULL DEFAULT '0',
  `value` text,
  `is_othervalue` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `file_value` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `surveys_response_id` (`surveys_response_id`),
  KEY `surveys_widgets_id` (`surveys_widgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_surveys_response_value` */

/*Table structure for table `email_surveys_widgets` */

DROP TABLE IF EXISTS `email_surveys_widgets`;

CREATE TABLE `email_surveys_widgets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `surveys_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` tinytext,
  `description` text,
  `type` varchar(255) NOT NULL,
  `is_required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_random` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_visible` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_file_types` text,
  `display_order` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `surveys_id` (`surveys_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_surveys_widgets` */

/*Table structure for table `email_templates` */

DROP TABLE IF EXISTS `email_templates`;

CREATE TABLE `email_templates` (
  `templateid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `format` char(1) DEFAULT NULL,
  `textbody` longtext,
  `htmlbody` longtext,
  `createdate` int(11) DEFAULT '0',
  `active` int(11) DEFAULT '0',
  `isglobal` int(11) DEFAULT '0',
  `ownerid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`templateid`),
  KEY `email_templates_owner_idx` (`ownerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_templates` */

/*Table structure for table `email_triggeremails` */

DROP TABLE IF EXISTS `email_triggeremails`;

CREATE TABLE `email_triggeremails` (
  `triggeremailsid` int(11) NOT NULL AUTO_INCREMENT,
  `active` char(1) NOT NULL DEFAULT '0',
  `createdate` int(11) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `triggertype` char(1) NOT NULL,
  `triggerhours` int(11) DEFAULT '0',
  `triggerinterval` int(11) DEFAULT '0',
  `queueid` int(11) NOT NULL,
  `statid` int(11) NOT NULL,
  PRIMARY KEY (`triggeremailsid`),
  UNIQUE KEY `queueid` (`queueid`),
  UNIQUE KEY `statid` (`statid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_triggeremails` */

/*Table structure for table `email_triggeremails_actions` */

DROP TABLE IF EXISTS `email_triggeremails_actions`;

CREATE TABLE `email_triggeremails_actions` (
  `triggeremailsactionid` int(11) NOT NULL AUTO_INCREMENT,
  `triggeremailsid` int(11) NOT NULL,
  `action` varchar(25) NOT NULL,
  PRIMARY KEY (`triggeremailsactionid`),
  UNIQUE KEY `triggeremailsid` (`triggeremailsid`,`action`),
  CONSTRAINT `email_triggeremails_actions_ibfk_1` FOREIGN KEY (`triggeremailsid`) REFERENCES `email_triggeremails` (`triggeremailsid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_triggeremails_actions` */

/*Table structure for table `email_triggeremails_actions_data` */

DROP TABLE IF EXISTS `email_triggeremails_actions_data`;

CREATE TABLE `email_triggeremails_actions_data` (
  `triggeremailsactionid` int(11) NOT NULL,
  `datakey` varchar(25) NOT NULL,
  `datavaluestring` varchar(255) DEFAULT NULL,
  `datavalueinteger` int(11) DEFAULT NULL,
  `triggeremailsid` int(11) NOT NULL,
  KEY `email_triggeremails_actions_data_datavaluestring_idx` (`triggeremailsactionid`,`datakey`,`datavaluestring`),
  KEY `email_triggeremails_actions_data_datavalueinteger_idx` (`triggeremailsactionid`,`datakey`,`datavalueinteger`),
  KEY `email_triggeremails_actions_data_triggeremailsid_idx` (`triggeremailsid`),
  CONSTRAINT `email_triggeremails_actions_data_ibfk_1` FOREIGN KEY (`triggeremailsactionid`) REFERENCES `email_triggeremails_actions` (`triggeremailsactionid`) ON DELETE CASCADE,
  CONSTRAINT `email_triggeremails_actions_data_ibfk_2` FOREIGN KEY (`triggeremailsid`) REFERENCES `email_triggeremails` (`triggeremailsid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_triggeremails_actions_data` */

/*Table structure for table `email_triggeremails_data` */

DROP TABLE IF EXISTS `email_triggeremails_data`;

CREATE TABLE `email_triggeremails_data` (
  `triggeremailsid` int(11) NOT NULL,
  `datakey` varchar(25) NOT NULL,
  `datavaluestring` varchar(255) DEFAULT NULL,
  `datavalueinteger` int(11) DEFAULT NULL,
  KEY `email_triggeremails_data_datavaluestring_idx` (`triggeremailsid`,`datakey`,`datavaluestring`),
  KEY `email_triggeremails_data_datavalueinteger_idx` (`triggeremailsid`,`datakey`,`datavalueinteger`),
  CONSTRAINT `email_triggeremails_data_ibfk_1` FOREIGN KEY (`triggeremailsid`) REFERENCES `email_triggeremails` (`triggeremailsid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_triggeremails_data` */

/*Table structure for table `email_triggeremails_log` */

DROP TABLE IF EXISTS `email_triggeremails_log`;

CREATE TABLE `email_triggeremails_log` (
  `triggeremailsid` int(11) NOT NULL,
  `subscriberid` int(11) NOT NULL,
  `action` varchar(25) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  KEY `email_triggeremails_log_idx` (`triggeremailsid`,`subscriberid`,`action`,`timestamp`,`note`),
  CONSTRAINT `email_triggeremails_log_ibfk_1` FOREIGN KEY (`triggeremailsid`) REFERENCES `email_triggeremails` (`triggeremailsid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_triggeremails_log` */

/*Table structure for table `email_triggeremails_log_summary` */

DROP TABLE IF EXISTS `email_triggeremails_log_summary`;

CREATE TABLE `email_triggeremails_log_summary` (
  `triggeremailsid` int(11) NOT NULL,
  `subscriberid` int(11) NOT NULL,
  `actionedoncount` int(11) DEFAULT '0',
  `lastactiontimestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`triggeremailsid`,`subscriberid`),
  CONSTRAINT `email_triggeremails_log_summary_ibfk_1` FOREIGN KEY (`triggeremailsid`) REFERENCES `email_triggeremails` (`triggeremailsid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_triggeremails_log_summary` */

/*Table structure for table `email_user_activitylog` */

DROP TABLE IF EXISTS `email_user_activitylog`;

CREATE TABLE `email_user_activitylog` (
  `lastviewid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `viewed` int(11) NOT NULL,
  PRIMARY KEY (`lastviewid`),
  KEY `email_user_activitylog_userid_viewed_idx` (`userid`,`viewed`),
  CONSTRAINT `email_user_activitylog_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `email_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `email_user_activitylog` */

insert  into `email_user_activitylog`(`lastviewid`,`userid`,`icon`,`text`,`url`,`viewed`) values (1,2,'images/user.gif','admin','index.php?Page=users&Action=Edit&UserID=2',1418693243);

/*Table structure for table `email_user_credit` */

DROP TABLE IF EXISTS `email_user_credit`;

CREATE TABLE `email_user_credit` (
  `usercreditid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `transactiontype` varchar(25) NOT NULL,
  `transactiontime` int(10) unsigned NOT NULL,
  `credit` bigint(20) NOT NULL,
  `jobid` int(11) DEFAULT NULL,
  `statid` int(11) DEFAULT NULL,
  `expiry` int(11) DEFAULT NULL,
  PRIMARY KEY (`usercreditid`),
  KEY `email_user_credit_transactiontype_idx` (`transactiontype`),
  KEY `email_user_credit_userid_transactiontype_idx` (`userid`,`transactiontype`),
  KEY `email_user_credit_transactiontime_idx` (`transactiontime`),
  KEY `email_user_credit_userid_transactiontime_idx` (`userid`,`transactiontime`),
  KEY `email_user_credit_transactiontype_transactiontime_idx` (`transactiontype`,`transactiontime`),
  KEY `email_user_credit_userid_transactiontype_transactiontime_idx` (`userid`,`transactiontype`,`transactiontime`),
  CONSTRAINT `email_user_credit_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `email_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_user_credit` */

/*Table structure for table `email_user_credit_summary` */

DROP TABLE IF EXISTS `email_user_credit_summary`;

CREATE TABLE `email_user_credit_summary` (
  `usagesummaryid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `startperiod` int(11) NOT NULL,
  `credit_used` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usagesummaryid`),
  UNIQUE KEY `userid` (`userid`,`startperiod`),
  CONSTRAINT `email_user_credit_summary_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `email_users` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_user_credit_summary` */

/*Table structure for table `email_user_stats_emailsperhour` */

DROP TABLE IF EXISTS `email_user_stats_emailsperhour`;

CREATE TABLE `email_user_stats_emailsperhour` (
  `summaryid` int(11) NOT NULL AUTO_INCREMENT,
  `statid` int(11) DEFAULT '0',
  `sendtime` int(11) DEFAULT '0',
  `emailssent` int(11) DEFAULT '0',
  `userid` int(11) DEFAULT '0',
  PRIMARY KEY (`summaryid`),
  KEY `email_user_stats_emailsperhour_statid_idx` (`statid`),
  KEY `email_user_stats_emailsperhour_userid_idx` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_user_stats_emailsperhour` */

/*Table structure for table `email_usergroups` */

DROP TABLE IF EXISTS `email_usergroups`;

CREATE TABLE `email_usergroups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(255) NOT NULL,
  `createdate` int(11) NOT NULL,
  `limit_list` int(11) DEFAULT '0',
  `limit_hourlyemailsrate` int(11) DEFAULT '0',
  `limit_emailspermonth` int(11) DEFAULT '0',
  `limit_totalemailslimit` int(11) DEFAULT NULL,
  `forcedoubleoptin` char(1) DEFAULT '0',
  `forcespamcheck` char(1) DEFAULT '0',
  `systemadmin` char(1) DEFAULT '0',
  `listadmin` char(1) DEFAULT '0',
  `segmentadmin` char(1) DEFAULT '0',
  `templateadmin` char(1) DEFAULT '0',
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `email_usergroups` */

insert  into `email_usergroups`(`groupid`,`groupname`,`createdate`,`limit_list`,`limit_hourlyemailsrate`,`limit_emailspermonth`,`limit_totalemailslimit`,`forcedoubleoptin`,`forcespamcheck`,`systemadmin`,`listadmin`,`segmentadmin`,`templateadmin`) values (1,'System Admin',1407311145,0,0,0,NULL,'0','0','1','0','0','0');

/*Table structure for table `email_usergroups_access` */

DROP TABLE IF EXISTS `email_usergroups_access`;

CREATE TABLE `email_usergroups_access` (
  `groupid` int(11) NOT NULL,
  `resourcetype` varchar(100) NOT NULL,
  `resourceid` int(11) NOT NULL,
  KEY `groupid` (`groupid`),
  CONSTRAINT `email_usergroups_access_ibfk_1` FOREIGN KEY (`groupid`) REFERENCES `email_usergroups` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_usergroups_access` */

/*Table structure for table `email_usergroups_permissions` */

DROP TABLE IF EXISTS `email_usergroups_permissions`;

CREATE TABLE `email_usergroups_permissions` (
  `groupid` int(11) NOT NULL,
  `area` varchar(255) NOT NULL,
  `subarea` varchar(255) DEFAULT NULL,
  KEY `groupid` (`groupid`),
  CONSTRAINT `email_usergroups_permissions_ibfk_1` FOREIGN KEY (`groupid`) REFERENCES `email_usergroups` (`groupid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_usergroups_permissions` */

/*Table structure for table `email_users` */

DROP TABLE IF EXISTS `email_users`;

CREATE TABLE `email_users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) NOT NULL,
  `trialuser` char(1) DEFAULT '0',
  `username` varchar(255) NOT NULL,
  `unique_token` varchar(128) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `admintype` char(1) DEFAULT NULL,
  `listadmintype` char(1) DEFAULT NULL,
  `templateadmintype` char(1) DEFAULT NULL,
  `segmentadmintype` char(1) DEFAULT NULL,
  `status` char(1) DEFAULT '0',
  `fullname` varchar(255) DEFAULT NULL,
  `emailaddress` varchar(100) DEFAULT NULL,
  `settings` text,
  `editownsettings` char(1) DEFAULT '0',
  `usertimezone` varchar(10) DEFAULT NULL,
  `textfooter` text,
  `htmlfooter` text,
  `infotips` char(1) DEFAULT '1',
  `smtpserver` varchar(255) DEFAULT NULL,
  `smtpusername` varchar(255) DEFAULT NULL,
  `smtppassword` varchar(255) DEFAULT NULL,
  `smtpport` int(11) DEFAULT '0',
  `createdate` int(11) DEFAULT '0',
  `lastloggedin` int(11) DEFAULT '0',
  `forgotpasscode` char(32) DEFAULT '',
  `usewysiwyg` char(1) DEFAULT '1',
  `enableactivitylog` char(1) DEFAULT '0',
  `xmlapi` char(1) DEFAULT '0',
  `xmltoken` char(40) DEFAULT NULL,
  `gettingstarted` int(11) NOT NULL DEFAULT '0',
  `googlecalendarusername` varchar(255) DEFAULT NULL,
  `googlecalendarpassword` varchar(255) DEFAULT NULL,
  `user_language` varchar(25) NOT NULL DEFAULT 'default',
  `eventactivitytype` longtext,
  `credit_warning_time` int(11) DEFAULT NULL,
  `credit_warning_percentage` int(11) DEFAULT NULL,
  `credit_warning_fixed` int(11) DEFAULT NULL,
  `adminnotify_email` varchar(100) DEFAULT NULL,
  `adminnotify_send_flag` char(1) DEFAULT '0',
  `adminnotify_send_threshold` int(11) DEFAULT NULL,
  `adminnotify_send_emailtext` text,
  `adminnotify_import_flag` char(1) DEFAULT '0',
  `adminnotify_import_threshold` int(11) DEFAULT NULL,
  `adminnotify_import_emailtext` text,
  PRIMARY KEY (`userid`),
  KEY `groupid` (`groupid`),
  KEY `email_users_logincheck_idx` (`username`,`password`),
  CONSTRAINT `email_users_ibfk_1` FOREIGN KEY (`groupid`) REFERENCES `email_usergroups` (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `email_users` */

insert  into `email_users`(`userid`,`groupid`,`trialuser`,`username`,`unique_token`,`password`,`admintype`,`listadmintype`,`templateadmintype`,`segmentadmintype`,`status`,`fullname`,`emailaddress`,`settings`,`editownsettings`,`usertimezone`,`textfooter`,`htmlfooter`,`infotips`,`smtpserver`,`smtpusername`,`smtppassword`,`smtpport`,`createdate`,`lastloggedin`,`forgotpasscode`,`usewysiwyg`,`enableactivitylog`,`xmlapi`,`xmltoken`,`gettingstarted`,`googlecalendarusername`,`googlecalendarpassword`,`user_language`,`eventactivitytype`,`credit_warning_time`,`credit_warning_percentage`,`credit_warning_fixed`,`adminnotify_email`,`adminnotify_send_flag`,`adminnotify_send_threshold`,`adminnotify_send_emailtext`,`adminnotify_import_flag`,`adminnotify_import_threshold`,`adminnotify_import_emailtext`) values (1,1,'0','tamnguyen','107d697581c4c94947b68cb53da2d40d6c9dd3465a5bbf6f1b31f87c860f16aa6f42ab1ec12e01f2a13ff5587e1e9e4aedb8242d','4b0d4bd1a4a53e7f565e09c2515424b4','a','a','a',NULL,'1','','nguyentamvinhlong@gmail.com','a:1:{s:10:\"LoginCheck\";s:14:\"1548f8a95bf89c\";}','0','GMT+7:00','','','1','','','',25,1407311145,1418693269,'','1','0','0','',0,'','','default','a:0:{}',NULL,NULL,NULL,'nguyentamvinhlong@gmail.com','0',1000,'***This is an automatic email, please do not reply***\r\n\r\n%%user_fullname%% has just sent an email campaign titled \"%%campaign_title%%\" with subject line \"%%campaign_subject%%\" to %%number_of_contacts%% contacts.\r\n\r\nTo stop receiving these messages, login to the email system, edit %%user_fullname%%\'s user account and go to the \"Admin Notifications\" tab.','0',1000,'***This is an automatic email, please do not reply***\r\n\r\n%%user_fullname%% has just imported %%number_of_contacts%% contacts into the list named \"%%list_name%%\" list.\r\n\r\nTo stop receiving these messages, login to the email system, edit %%user_fullname%%\'s user account and go to the \"Admin Notifications\" tab.'),(2,1,'0','admin','ceb9eb8c04b763b4970129d3c0406af012361551314fd50f239bbedc3c76b67554ec0c8836c4a4fa902f3e51582b0979dc06f0d3','c8a71948b6cc60b04e4edb1886984dc5','','','','','1','','tamnt@zigexn.vn','a:1:{s:10:\"LoginCheck\";s:14:\"1548f8a8b74285\";}','1','GMT+7:00','','','1','','','',0,1407311255,1418693259,'','1','1','0','',0,'','','default','a:3:{i:0;s:10:\"Phone Call\";i:1;s:7:\"Meeting\";i:2;s:5:\"Email\";}',NULL,NULL,NULL,'nguyentamvinhlong@gmail.com','0',1000,'***This is an automatic email, please do not reply***\r\n\r\n%%user_fullname%% has just sent an email campaign titled \"%%campaign_title%%\" with subject line \"%%campaign_subject%%\" to %%number_of_contacts%% contacts.\r\n\r\nTo stop receiving these messages, login to the email system, edit %%user_fullname%%\'s user account and go to the \"Admin Notifications\" tab.','0',1000,'***This is an automatic email, please do not reply***\r\n\r\n%%user_fullname%% has just imported %%number_of_contacts%% contacts into the list named \"%%list_name%%\" list.\r\n\r\nTo stop receiving these messages, login to the email system, edit %%user_fullname%%\'s user account and go to the \"Admin Notifications\" tab.');

/*Table structure for table `email_whitelabel_settings` */

DROP TABLE IF EXISTS `email_whitelabel_settings`;

CREATE TABLE `email_whitelabel_settings` (
  `name` varchar(100) NOT NULL,
  `value` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email_whitelabel_settings` */

insert  into `email_whitelabel_settings`(`name`,`value`) values ('APPLICATION_FAVICON','images/favicon.ico'),('APPLICATION_LOGO_IMAGE','images/logo.jpg'),('LNG_AccountUpgradeMessage','You are on day %%trial_days_current%% of your free trial. You have %%trial_days_left%% days remaining.'),('LNG_ApplicationTitle','Interspire Email Marketer'),('LNG_Copyright',''),('LNG_Default_Global_HTML_Footer',''),('LNG_Default_Global_Text_Footer',''),('LNG_FreeTrial_Expiry_Login','Your free trial account has expired. Please contact your admin'),('SHOW_INTRO_VIDEO','0'),('SHOW_SMTP_COM_OPTION','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
