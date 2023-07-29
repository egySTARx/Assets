-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (i386)
--
-- Host: localhost    Database: radius
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `nas`
--

DROP TABLE IF EXISTS `nas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nasname` varchar(128) NOT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT 'other',
  `ports` int(5) DEFAULT NULL,
  `secret` varchar(60) NOT NULL DEFAULT 'secret',
  `community` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT 'RADIUS Client',
  `starospassword` varchar(32) NOT NULL,
  `ciscobwmode` tinyint(1) NOT NULL,
  `apiusername` varchar(32) NOT NULL,
  `apipassword` varchar(32) NOT NULL,
  `enableapi` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nasname` (`nasname`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nas`
--

LOCK TABLES `nas` WRITE;
/*!40000 ALTER TABLE `nas` DISABLE KEYS */;
INSERT INTO `nas` VALUES (6,'10.0.0.1','Mikrotik','0',NULL,'1234567m',NULL,'mikrotik','',0,'api','meem',1);
/*!40000 ALTER TABLE `nas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radacct`
--

DROP TABLE IF EXISTS `radacct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radacct` (
  `radacctid` bigint(21) NOT NULL AUTO_INCREMENT,
  `acctsessionid` varchar(64) NOT NULL DEFAULT '',
  `acctuniqueid` varchar(32) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `realm` varchar(64) DEFAULT '',
  `nasipaddress` varchar(15) NOT NULL DEFAULT '',
  `nasportid` varchar(15) DEFAULT NULL,
  `nasporttype` varchar(32) DEFAULT NULL,
  `acctstarttime` datetime DEFAULT NULL,
  `acctstoptime` datetime DEFAULT NULL,
  `acctsessiontime` int(12) DEFAULT NULL,
  `acctauthentic` varchar(32) DEFAULT NULL,
  `connectinfo_start` varchar(50) DEFAULT NULL,
  `connectinfo_stop` varchar(50) DEFAULT NULL,
  `acctinputoctets` bigint(20) DEFAULT NULL,
  `acctoutputoctets` bigint(20) DEFAULT NULL,
  `calledstationid` varchar(50) NOT NULL DEFAULT '',
  `callingstationid` varchar(50) NOT NULL DEFAULT '',
  `acctterminatecause` varchar(32) NOT NULL DEFAULT '',
  `servicetype` varchar(32) DEFAULT NULL,
  `framedprotocol` varchar(32) DEFAULT NULL,
  `framedipaddress` varchar(15) NOT NULL DEFAULT '',
  `acctstartdelay` int(12) DEFAULT NULL,
  `acctstopdelay` int(12) DEFAULT NULL,
  `xascendsessionsvrkey` varchar(10) DEFAULT NULL,
  `_accttime` datetime DEFAULT NULL,
  `_srvid` int(11) DEFAULT NULL,
  `_dailynextsrvactive` tinyint(1) DEFAULT NULL,
  `_apid` int(11) DEFAULT NULL,
  PRIMARY KEY (`radacctid`),
  KEY `username` (`username`),
  KEY `framedipaddress` (`framedipaddress`),
  KEY `acctsessionid` (`acctsessionid`),
  KEY `acctsessiontime` (`acctsessiontime`),
  KEY `acctuniqueid` (`acctuniqueid`),
  KEY `acctstarttime` (`acctstarttime`),
  KEY `acctstoptime` (`acctstoptime`),
  KEY `nasipaddress` (`nasipaddress`),
  KEY `_AcctTime` (`_accttime`),
  KEY `callingstationid` (`callingstationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radacct`
--

LOCK TABLES `radacct` WRITE;
/*!40000 ALTER TABLE `radacct` DISABLE KEYS */;
/*!40000 ALTER TABLE `radacct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radcheck`
--

DROP TABLE IF EXISTS `radcheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radcheck` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '==',
  `value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4300 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radcheck`
--

LOCK TABLES `radcheck` WRITE;
/*!40000 ALTER TABLE `radcheck` DISABLE KEYS */;
INSERT INTO `radcheck` VALUES (4276,'meem','Cleartext-Password',':=','meem'),(4277,'meem','Simultaneous-Use',':=','1'),(4278,'49720936','Cleartext-Password',':=',''),(4279,'49720936','Simultaneous-Use',':=','1'),(4280,'01569693','Cleartext-Password',':=',''),(4281,'01569693','Simultaneous-Use',':=','1'),(4282,'32072650','Cleartext-Password',':=',''),(4283,'32072650','Simultaneous-Use',':=','1'),(4284,'28345550','Cleartext-Password',':=',''),(4285,'28345550','Simultaneous-Use',':=','1'),(4286,'02275307','Cleartext-Password',':=',''),(4287,'02275307','Simultaneous-Use',':=','1'),(4288,'50043226','Cleartext-Password',':=',''),(4289,'50043226','Simultaneous-Use',':=','1'),(4290,'86366911','Cleartext-Password',':=',''),(4291,'86366911','Simultaneous-Use',':=','1'),(4292,'10609262','Cleartext-Password',':=',''),(4293,'10609262','Simultaneous-Use',':=','1'),(4294,'65561523','Cleartext-Password',':=',''),(4295,'65561523','Simultaneous-Use',':=','1'),(4296,'06119579','Cleartext-Password',':=',''),(4297,'06119579','Simultaneous-Use',':=','1'),(4298,'m1','Cleartext-Password',':=','m1'),(4299,'m1','Simultaneous-Use',':=','1');
/*!40000 ALTER TABLE `radcheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radgroupcheck`
--

DROP TABLE IF EXISTS `radgroupcheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radgroupcheck` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '==',
  `value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `groupname` (`groupname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radgroupcheck`
--

LOCK TABLES `radgroupcheck` WRITE;
/*!40000 ALTER TABLE `radgroupcheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `radgroupcheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radgroupreply`
--

DROP TABLE IF EXISTS `radgroupreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radgroupreply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '=',
  `value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `groupname` (`groupname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radgroupreply`
--

LOCK TABLES `radgroupreply` WRITE;
/*!40000 ALTER TABLE `radgroupreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `radgroupreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radippool`
--

DROP TABLE IF EXISTS `radippool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radippool` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pool_name` varchar(30) NOT NULL,
  `framedipaddress` varchar(15) NOT NULL,
  `nasipaddress` varchar(15) NOT NULL,
  `calledstationid` varchar(30) NOT NULL,
  `callingstationid` varchar(30) NOT NULL,
  `expiry_time` datetime DEFAULT NULL,
  `username` varchar(64) NOT NULL,
  `pool_key` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radippool`
--

LOCK TABLES `radippool` WRITE;
/*!40000 ALTER TABLE `radippool` DISABLE KEYS */;
/*!40000 ALTER TABLE `radippool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radpostauth`
--

DROP TABLE IF EXISTS `radpostauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radpostauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `pass` varchar(64) NOT NULL DEFAULT '',
  `reply` varchar(32) NOT NULL DEFAULT '',
  `authdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nasipaddress` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `authdate` (`authdate`),
  KEY `nasipaddress` (`nasipaddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radpostauth`
--

LOCK TABLES `radpostauth` WRITE;
/*!40000 ALTER TABLE `radpostauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `radpostauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radreply`
--

DROP TABLE IF EXISTS `radreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radreply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '=',
  `value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radreply`
--

LOCK TABLES `radreply` WRITE;
/*!40000 ALTER TABLE `radreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `radreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radusergroup`
--

DROP TABLE IF EXISTS `radusergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radusergroup` (
  `username` varchar(64) NOT NULL DEFAULT '',
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT '1',
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radusergroup`
--

LOCK TABLES `radusergroup` WRITE;
/*!40000 ALTER TABLE `radusergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `radusergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_actsrv`
--

DROP TABLE IF EXISTS `rm_actsrv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_actsrv` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `username` varchar(64) NOT NULL,
  `srvid` int(11) NOT NULL,
  `dailynextsrvactive` tinyint(1) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `datetime` (`datetime`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_actsrv`
--

LOCK TABLES `rm_actsrv` WRITE;
/*!40000 ALTER TABLE `rm_actsrv` DISABLE KEYS */;
/*!40000 ALTER TABLE `rm_actsrv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_allowedmanagers`
--

DROP TABLE IF EXISTS `rm_allowedmanagers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_allowedmanagers` (
  `srvid` int(11) NOT NULL,
  `managername` varchar(64) NOT NULL,
  KEY `srvid` (`srvid`),
  KEY `managername` (`managername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_allowedmanagers`
--

LOCK TABLES `rm_allowedmanagers` WRITE;
/*!40000 ALTER TABLE `rm_allowedmanagers` DISABLE KEYS */;
INSERT INTO `rm_allowedmanagers` VALUES (0,'admin'),(33,'admin'),(34,'admin'),(35,'admin'),(36,'admin'),(37,'admin'),(38,'admin'),(11,'admin'),(32,'admin'),(39,'admin'),(40,'admin');
/*!40000 ALTER TABLE `rm_allowedmanagers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_allowednases`
--

DROP TABLE IF EXISTS `rm_allowednases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_allowednases` (
  `srvid` int(11) NOT NULL,
  `nasid` int(11) NOT NULL,
  KEY `srvid` (`srvid`),
  KEY `nasid` (`nasid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_allowednases`
--

LOCK TABLES `rm_allowednases` WRITE;
/*!40000 ALTER TABLE `rm_allowednases` DISABLE KEYS */;
INSERT INTO `rm_allowednases` VALUES (0,6),(33,6),(34,6),(35,6),(36,6),(37,6),(38,6),(11,6),(32,6),(39,6),(40,6);
/*!40000 ALTER TABLE `rm_allowednases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_ap`
--

DROP TABLE IF EXISTS `rm_ap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_ap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  `accessmode` tinyint(1) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `community` varchar(32) NOT NULL,
  `apiusername` varchar(32) NOT NULL,
  `apipassword` varchar(32) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_ap`
--

LOCK TABLES `rm_ap` WRITE;
/*!40000 ALTER TABLE `rm_ap` DISABLE KEYS */;
/*!40000 ALTER TABLE `rm_ap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_cards`
--

DROP TABLE IF EXISTS `rm_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_cards` (
  `id` bigint(20) NOT NULL,
  `cardnum` varchar(16) NOT NULL,
  `password` varchar(8) NOT NULL,
  `value` decimal(22,2) NOT NULL,
  `expiration` date NOT NULL,
  `series` varchar(16) NOT NULL,
  `date` date NOT NULL,
  `owner` varchar(64) NOT NULL,
  `used` datetime NOT NULL,
  `cardtype` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `downlimit` bigint(20) NOT NULL,
  `uplimit` bigint(20) NOT NULL,
  `comblimit` bigint(20) NOT NULL,
  `uptimelimit` bigint(20) NOT NULL,
  `srvid` int(11) NOT NULL,
  `transid` varchar(32) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `expiretime` bigint(20) NOT NULL,
  `timebaseexp` tinyint(1) NOT NULL,
  `timebaseonline` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cardnum` (`cardnum`),
  KEY `series` (`series`),
  KEY `used` (`used`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_cards`
--

LOCK TABLES `rm_cards` WRITE;
/*!40000 ALTER TABLE `rm_cards` DISABLE KEYS */;
INSERT INTO `rm_cards` VALUES (1,'49720936','','50.00','2023-03-31','2023-0001','2023-02-22','','0000-00-00 00:00:00',0,0,0,0,0,0,39,'63f66ab74fb56',1,0,0,0),(2,'01569693','','50.00','2023-03-31','2023-0001','2023-02-22','','0000-00-00 00:00:00',0,0,0,0,0,0,39,'63f66ab74fb56',1,0,0,0),(3,'32072650','','50.00','2023-03-31','2023-0001','2023-02-22','','0000-00-00 00:00:00',0,0,0,0,0,0,39,'63f66ab74fb56',1,0,0,0),(4,'28345550','','50.00','2023-03-31','2023-0001','2023-02-22','','0000-00-00 00:00:00',0,0,0,0,0,0,39,'63f66ab74fb56',1,0,0,0),(5,'02275307','','50.00','2023-03-31','2023-0001','2023-02-22','','0000-00-00 00:00:00',0,0,0,0,0,0,39,'63f66ab74fb56',1,0,0,0),(6,'50043226','','50.00','2023-03-31','2023-0001','2023-02-22','','0000-00-00 00:00:00',0,0,0,0,0,0,39,'63f66ab74fb56',1,0,0,0),(7,'86366911','','50.00','2023-03-31','2023-0001','2023-02-22','','0000-00-00 00:00:00',0,0,0,0,0,0,39,'63f66ab74fb56',1,0,0,0),(8,'10609262','','50.00','2023-03-31','2023-0001','2023-02-22','','0000-00-00 00:00:00',0,0,0,0,0,0,39,'63f66ab74fb56',1,0,0,0),(9,'65561523','','50.00','2023-03-31','2023-0001','2023-02-22','','0000-00-00 00:00:00',0,0,0,0,0,0,39,'63f66ab74fb56',1,0,0,0),(10,'06119579','','50.00','2023-03-31','2023-0001','2023-02-22','','0000-00-00 00:00:00',0,0,0,0,0,0,39,'63f66ab74fb56',1,0,0,0);
/*!40000 ALTER TABLE `rm_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_changesrv`
--

DROP TABLE IF EXISTS `rm_changesrv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_changesrv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `newsrvid` int(11) NOT NULL,
  `newsrvname` varchar(50) NOT NULL,
  `scheduledate` date NOT NULL,
  `requestdate` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `transid` varchar(32) NOT NULL,
  `requested` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `requestdate` (`requestdate`),
  KEY `scheduledate` (`scheduledate`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_changesrv`
--

LOCK TABLES `rm_changesrv` WRITE;
/*!40000 ALTER TABLE `rm_changesrv` DISABLE KEYS */;
INSERT INTO `rm_changesrv` VALUES (1,'meem',0,'Default service','2023-01-11','2023-01-11',1,'','admin'),(2,'meem',36,'1 M 40 G','2023-02-22','2023-02-22',1,'','admin'),(3,'m1',37,'2 M 80 G','2023-02-23','2023-02-23',1,'','admin');
/*!40000 ALTER TABLE `rm_changesrv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_cmts`
--

DROP TABLE IF EXISTS `rm_cmts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_cmts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `name` varchar(32) NOT NULL,
  `community` varchar(32) NOT NULL,
  `descr` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_cmts`
--

LOCK TABLES `rm_cmts` WRITE;
/*!40000 ALTER TABLE `rm_cmts` DISABLE KEYS */;
/*!40000 ALTER TABLE `rm_cmts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_colsetlistdocsis`
--

DROP TABLE IF EXISTS `rm_colsetlistdocsis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_colsetlistdocsis` (
  `managername` varchar(64) NOT NULL,
  `colname` varchar(32) NOT NULL,
  KEY `managername` (`managername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_colsetlistdocsis`
--

LOCK TABLES `rm_colsetlistdocsis` WRITE;
/*!40000 ALTER TABLE `rm_colsetlistdocsis` DISABLE KEYS */;
INSERT INTO `rm_colsetlistdocsis` VALUES ('admin','comment'),('admin','email'),('admin','state'),('admin','country'),('admin','zip'),('admin','city'),('admin','address'),('admin','company'),('admin','lastname'),('admin','firstname'),('admin','groupname'),('admin','upstreamname'),('admin','cmtsname'),('admin','pingtime'),('admin','rxpwr'),('admin','txpwr'),('admin','snrus'),('admin','snrds'),('admin','username'),('admin','cmmac'),('admin','cmip'),('admin','cpeip');
/*!40000 ALTER TABLE `rm_colsetlistdocsis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_colsetlistradius`
--

DROP TABLE IF EXISTS `rm_colsetlistradius`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_colsetlistradius` (
  `managername` varchar(64) NOT NULL,
  `colname` varchar(32) NOT NULL,
  KEY `managername` (`managername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_colsetlistradius`
--

LOCK TABLES `rm_colsetlistradius` WRITE;
/*!40000 ALTER TABLE `rm_colsetlistradius` DISABLE KEYS */;
INSERT INTO `rm_colsetlistradius` VALUES ('admin','username'),('admin','starttime'),('admin','onlinetime'),('admin','download'),('admin','upload'),('admin','ip'),('admin','mac'),('admin','nas'),('admin','firstname'),('admin','address'),('admin','comment');
/*!40000 ALTER TABLE `rm_colsetlistradius` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_colsetlistusers`
--

DROP TABLE IF EXISTS `rm_colsetlistusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_colsetlistusers` (
  `managername` varchar(64) NOT NULL,
  `colname` varchar(32) NOT NULL,
  KEY `managername` (`managername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_colsetlistusers`
--

LOCK TABLES `rm_colsetlistusers` WRITE;
/*!40000 ALTER TABLE `rm_colsetlistusers` DISABLE KEYS */;
INSERT INTO `rm_colsetlistusers` VALUES ('admin','username'),('admin','srvname'),('admin','expiry'),('admin','availtotal'),('admin','availtime'),('admin','firstname'),('admin','address'),('admin','email'),('admin','registered'),('admin','lastlogoff'),('admin','comment');
/*!40000 ALTER TABLE `rm_colsetlistusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_ias`
--

DROP TABLE IF EXISTS `rm_ias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_ias` (
  `iasid` int(11) NOT NULL AUTO_INCREMENT,
  `iasname` varchar(50) NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `downlimit` bigint(20) NOT NULL,
  `uplimit` bigint(20) NOT NULL,
  `comblimit` bigint(20) NOT NULL,
  `uptimelimit` bigint(20) NOT NULL,
  `expiretime` bigint(20) NOT NULL,
  `timebaseonline` tinyint(1) NOT NULL,
  `timebaseexp` tinyint(1) NOT NULL,
  `srvid` int(11) NOT NULL,
  `enableias` tinyint(1) NOT NULL,
  `expiremode` tinyint(1) NOT NULL,
  `expiration` date NOT NULL,
  `simuse` int(11) NOT NULL,
  PRIMARY KEY (`iasid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_ias`
--

LOCK TABLES `rm_ias` WRITE;
/*!40000 ALTER TABLE `rm_ias` DISABLE KEYS */;
INSERT INTO `rm_ias` VALUES (2,'500 MB','10.00',500,0,0,0,0,0,0,0,1,0,'2020-12-31',1),(3,'10 hours online time','5.00',0,0,0,10,0,1,0,0,1,0,'2010-12-31',1),(4,'2 days','5.00',0,0,0,0,2,0,2,0,1,1,'0000-00-00',1),(10,'15 minutes online time','1.00',0,0,0,15,0,0,0,0,1,0,'2020-12-31',1);
/*!40000 ALTER TABLE `rm_ias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_invoices`
--

DROP TABLE IF EXISTS `rm_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invgroup` tinyint(1) NOT NULL,
  `invnum` varchar(16) NOT NULL,
  `managername` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `date` date NOT NULL,
  `bytesdl` bigint(20) NOT NULL,
  `bytesul` bigint(20) NOT NULL,
  `bytescomb` bigint(20) NOT NULL,
  `downlimit` bigint(20) NOT NULL,
  `uplimit` bigint(20) NOT NULL,
  `comblimit` bigint(20) NOT NULL,
  `time` int(11) NOT NULL,
  `uptimelimit` bigint(20) NOT NULL,
  `days` int(6) NOT NULL,
  `expiration` date NOT NULL,
  `capdl` tinyint(1) NOT NULL,
  `capul` tinyint(1) NOT NULL,
  `captotal` tinyint(1) NOT NULL,
  `captime` tinyint(1) NOT NULL,
  `capdate` tinyint(1) NOT NULL,
  `service` varchar(60) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `transid` varchar(32) NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(8) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `taxid` varchar(40) NOT NULL,
  `paymentopt` date NOT NULL,
  `invtype` tinyint(1) NOT NULL,
  `paymode` tinyint(4) NOT NULL,
  `paid` date NOT NULL,
  `price` decimal(25,6) NOT NULL,
  `tax` decimal(25,6) NOT NULL,
  `vatpercent` decimal(4,2) NOT NULL,
  `remark` varchar(400) NOT NULL,
  `balance` decimal(20,2) NOT NULL,
  `gwtransid` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invnum` (`invnum`),
  KEY `username` (`username`),
  KEY `managername` (`managername`),
  KEY `date` (`date`),
  KEY `gwtransid` (`gwtransid`),
  KEY `comment` (`comment`),
  KEY `paymode` (`paymode`),
  KEY `invgroup` (`invgroup`),
  KEY `paid` (`paid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_invoices`
--

LOCK TABLES `rm_invoices` WRITE;
/*!40000 ALTER TABLE `rm_invoices` DISABLE KEYS */;
INSERT INTO `rm_invoices` VALUES (1,0,'2023-0001','admin','meem','2023-02-22',0,0,42949672960,0,0,42949672960,0,0,28,'2023-03-22',0,0,1,0,1,'1 M 40 G','','63f54c0a5acae','1.00','','','','','','TechnoMeeM ','','2023-02-23',0,0,'2023-02-22','80.000000','0.000000','0.00','','0.00','','',''),(2,1,'','admin','admin','2023-02-22',0,0,0,0,0,0,0,0,0,'0000-00-00',0,0,0,0,0,'المرجع.: نقدي-2023-0001','','63f54c0a5acae','1.00','','','','','','','','2023-02-23',0,2,'0000-00-00','-80.000000','0.000000','0.00','','-146619.09','','','');
/*!40000 ALTER TABLE `rm_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_ippools`
--

DROP TABLE IF EXISTS `rm_ippools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_ippools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `name` varchar(32) NOT NULL,
  `fromip` varchar(15) NOT NULL,
  `toip` varchar(15) NOT NULL,
  `descr` varchar(200) NOT NULL,
  `nextpoolid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `nextid` (`nextpoolid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_ippools`
--

LOCK TABLES `rm_ippools` WRITE;
/*!40000 ALTER TABLE `rm_ippools` DISABLE KEYS */;
/*!40000 ALTER TABLE `rm_ippools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_managers`
--

DROP TABLE IF EXISTS `rm_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_managers` (
  `managername` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(8) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `company` varchar(50) NOT NULL,
  `vatid` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `balance` decimal(20,2) NOT NULL,
  `perm_listusers` tinyint(1) NOT NULL,
  `perm_createusers` tinyint(1) NOT NULL,
  `perm_editusers` tinyint(1) NOT NULL,
  `perm_edituserspriv` tinyint(1) NOT NULL,
  `perm_deleteusers` tinyint(1) NOT NULL,
  `perm_listmanagers` tinyint(1) NOT NULL,
  `perm_createmanagers` tinyint(1) NOT NULL,
  `perm_editmanagers` tinyint(1) NOT NULL,
  `perm_deletemanagers` tinyint(1) NOT NULL,
  `perm_listservices` tinyint(1) NOT NULL,
  `perm_createservices` tinyint(1) NOT NULL,
  `perm_editservices` tinyint(1) NOT NULL,
  `perm_deleteservices` tinyint(1) NOT NULL,
  `perm_listonlineusers` tinyint(1) NOT NULL,
  `perm_listinvoices` tinyint(1) NOT NULL,
  `perm_trafficreport` tinyint(1) NOT NULL,
  `perm_addcredits` tinyint(1) NOT NULL,
  `perm_negbalance` tinyint(1) NOT NULL,
  `perm_listallinvoices` tinyint(1) NOT NULL,
  `perm_showinvtotals` tinyint(1) NOT NULL,
  `perm_logout` tinyint(1) NOT NULL,
  `perm_cardsys` tinyint(1) NOT NULL,
  `perm_editinvoice` tinyint(1) NOT NULL,
  `perm_allusers` tinyint(1) NOT NULL,
  `perm_allowdiscount` tinyint(1) NOT NULL,
  `perm_enwriteoff` tinyint(1) NOT NULL,
  `perm_accessap` tinyint(1) NOT NULL,
  `perm_cts` tinyint(1) NOT NULL,
  `enablemanager` tinyint(1) NOT NULL,
  `lang` varchar(30) NOT NULL,
  PRIMARY KEY (`managername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_managers`
--

LOCK TABLES `rm_managers` WRITE;
/*!40000 ALTER TABLE `rm_managers` DISABLE KEYS */;
INSERT INTO `rm_managers` VALUES ('admin','b92f74f01c13d0a568b1638a9f501a1f','Default','Manager','','','','','','','','Superuser','TechnoMeeM','','','-146619.09',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,'Arabic');
/*!40000 ALTER TABLE `rm_managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_newusers`
--

DROP TABLE IF EXISTS `rm_newusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_newusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(8) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `vatid` varchar(40) NOT NULL,
  `srvid` int(11) NOT NULL,
  `actcode` varchar(10) NOT NULL,
  `actcount` int(11) NOT NULL,
  `lang` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_newusers`
--

LOCK TABLES `rm_newusers` WRITE;
/*!40000 ALTER TABLE `rm_newusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `rm_newusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_onlinecm`
--

DROP TABLE IF EXISTS `rm_onlinecm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_onlinecm` (
  `username` varchar(64) NOT NULL DEFAULT '',
  `maccm` varchar(17) DEFAULT NULL,
  `enableuser` tinyint(1) DEFAULT NULL,
  `staticipcm` varchar(15) DEFAULT NULL,
  `maccpe` varchar(17) DEFAULT NULL,
  `ipcpe` varchar(15) DEFAULT NULL,
  `ipmodecpe` tinyint(1) DEFAULT NULL,
  `cmtsid` int(11) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  `groupname` varchar(50) DEFAULT NULL,
  `snrds` decimal(11,1) DEFAULT NULL,
  `snrus` decimal(11,1) DEFAULT NULL,
  `txpwr` decimal(11,1) DEFAULT NULL,
  `rxpwr` decimal(11,1) DEFAULT NULL,
  `pingtime` decimal(11,1) DEFAULT NULL,
  `upstreamname` varchar(50) DEFAULT NULL,
  `ifidx` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`),
  KEY `maccm` (`maccm`),
  KEY `staticipcm` (`staticipcm`),
  KEY `ipcpe` (`ipcpe`),
  KEY `groupname` (`groupname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_onlinecm`
--

LOCK TABLES `rm_onlinecm` WRITE;
/*!40000 ALTER TABLE `rm_onlinecm` DISABLE KEYS */;
/*!40000 ALTER TABLE `rm_onlinecm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_phpsess`
--

DROP TABLE IF EXISTS `rm_phpsess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_phpsess` (
  `managername` varchar(64) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `sessid` varchar(64) NOT NULL,
  `lastact` datetime NOT NULL,
  `closed` tinyint(1) NOT NULL,
  KEY `managername` (`managername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_phpsess`
--

LOCK TABLES `rm_phpsess` WRITE;
/*!40000 ALTER TABLE `rm_phpsess` DISABLE KEYS */;
INSERT INTO `rm_phpsess` VALUES ('admin','30.30.30.1','poos1u7k96veoi3e9pj714a2k7','2023-01-10 21:26:00',1),('admin','10.0.9.252','ng7v5dth52qeo1jgoje5dp9kf0','2023-01-10 21:25:48',1),('admin','30.30.30.1','g6blg8tdk8mcdecrgcdo7l2cn6','2023-01-11 08:17:12',1),('admin','30.30.30.1','g6blg8tdk8mcdecrgcdo7l2cn6','2023-01-11 08:42:03',1),('admin','192.168.55.1','jkjsogi54jkk0hb6ujs2gu7a66','2023-02-22 00:13:06',1),('admin','192.168.55.1','jkjsogi54jkk0hb6ujs2gu7a66','2023-02-22 00:57:41',1),('admin','192.168.55.1','jkjsogi54jkk0hb6ujs2gu7a66','2023-02-22 00:59:42',1),('admin','192.168.55.1','guoq8i1hl3bteb7m5b698g1rm3','2023-02-22 22:31:51',1),('admin','192.168.55.1','guoq8i1hl3bteb7m5b698g1rm3','2023-02-22 23:15:45',1),('admin','192.168.55.1','guoq8i1hl3bteb7m5b698g1rm3','2023-02-22 23:38:44',1),('admin','192.168.55.1','s09sk8m11efp4np8jmgb6hu9g7','2023-02-23 10:28:59',1),('admin','192.168.55.1','s09sk8m11efp4np8jmgb6hu9g7','2023-02-23 11:24:02',1),('admin','192.168.55.1','i7ck8115mua2u7q56vvemige45','2023-02-23 10:59:32',1),('admin','192.168.55.1','s09sk8m11efp4np8jmgb6hu9g7','2023-02-23 11:44:38',1),('admin','192.168.55.1','s09sk8m11efp4np8jmgb6hu9g7','2023-02-23 16:55:09',1),('admin','192.168.55.1','0rcf0tkps6d54am03lpheshn83','2023-02-23 16:55:00',1),('admin','192.168.55.1','i7ck8115mua2u7q56vvemige45','2023-02-23 16:55:26',1),('admin','192.168.55.1','10hql5qkeb0ctulp0ak1nj7oe3','2023-02-23 17:15:42',1),('admin','192.168.55.1','oveka55olkviunuuu52qmp0536','2023-02-23 18:04:40',1),('admin','192.168.55.1','4toos5ttsdjsc63cr4m0n0fmk5','2023-02-23 20:40:34',1),('admin','192.168.55.1','4toos5ttsdjsc63cr4m0n0fmk5','2023-02-23 21:09:28',1),('admin','192.168.55.1','4toos5ttsdjsc63cr4m0n0fmk5','2023-02-23 21:41:01',1);
/*!40000 ALTER TABLE `rm_phpsess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_radacct`
--

DROP TABLE IF EXISTS `rm_radacct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_radacct` (
  `radacctid` bigint(21) NOT NULL,
  `acctuniqueid` varchar(32) NOT NULL,
  `username` varchar(64) NOT NULL,
  `acctstarttime` datetime NOT NULL,
  `acctstoptime` datetime NOT NULL,
  `acctsessiontime` int(12) NOT NULL,
  `acctsessiontimeratio` decimal(3,2) NOT NULL,
  `dlbytesstart` bigint(20) NOT NULL,
  `dlbytesstop` bigint(20) NOT NULL,
  `dlbytes` bigint(20) NOT NULL,
  `dlratio` decimal(3,2) NOT NULL,
  `ulbytesstart` bigint(20) NOT NULL,
  `ulbytesstop` bigint(20) NOT NULL,
  `ulbytes` bigint(20) NOT NULL,
  `ulratio` decimal(3,2) NOT NULL,
  KEY `acctuniqueid` (`acctuniqueid`),
  KEY `username` (`username`),
  KEY `acctstarttime` (`acctstarttime`),
  KEY `acctstoptime` (`acctstoptime`),
  KEY `radacctid` (`radacctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_radacct`
--

LOCK TABLES `rm_radacct` WRITE;
/*!40000 ALTER TABLE `rm_radacct` DISABLE KEYS */;
/*!40000 ALTER TABLE `rm_radacct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_services`
--

DROP TABLE IF EXISTS `rm_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_services` (
  `srvid` int(11) NOT NULL,
  `srvname` varchar(50) NOT NULL,
  `descr` varchar(255) NOT NULL,
  `downrate` int(11) NOT NULL,
  `uprate` int(11) NOT NULL,
  `limitdl` tinyint(1) NOT NULL,
  `limitul` tinyint(1) NOT NULL,
  `limitcomb` tinyint(1) NOT NULL,
  `limitexpiration` tinyint(1) NOT NULL,
  `limituptime` tinyint(1) NOT NULL,
  `poolname` varchar(50) NOT NULL,
  `unitprice` decimal(25,6) NOT NULL,
  `unitpriceadd` decimal(25,6) NOT NULL,
  `timebaseexp` tinyint(1) NOT NULL,
  `timebaseonline` tinyint(1) NOT NULL,
  `timeunitexp` int(11) NOT NULL,
  `timeunitonline` int(11) NOT NULL,
  `trafficunitdl` int(11) NOT NULL,
  `trafficunitul` int(11) NOT NULL,
  `trafficunitcomb` int(11) NOT NULL,
  `inittimeexp` int(11) NOT NULL,
  `inittimeonline` int(11) NOT NULL,
  `initdl` int(11) NOT NULL,
  `initul` int(11) NOT NULL,
  `inittotal` int(11) NOT NULL,
  `srvtype` tinyint(1) NOT NULL,
  `timeaddmodeexp` tinyint(1) NOT NULL,
  `timeaddmodeonline` tinyint(1) NOT NULL,
  `trafficaddmode` tinyint(1) NOT NULL,
  `monthly` tinyint(1) NOT NULL,
  `enaddcredits` tinyint(1) NOT NULL,
  `minamount` int(20) NOT NULL,
  `minamountadd` int(20) NOT NULL,
  `resetcounters` tinyint(1) NOT NULL,
  `pricecalcdownload` tinyint(1) NOT NULL,
  `pricecalcupload` tinyint(1) NOT NULL,
  `pricecalcuptime` tinyint(1) NOT NULL,
  `unitpricetax` decimal(25,6) NOT NULL,
  `unitpriceaddtax` decimal(25,6) NOT NULL,
  `enableburst` tinyint(1) NOT NULL,
  `dlburstlimit` int(11) NOT NULL,
  `ulburstlimit` int(11) NOT NULL,
  `dlburstthreshold` int(11) NOT NULL,
  `ulburstthreshold` int(11) NOT NULL,
  `dlbursttime` int(11) NOT NULL,
  `ulbursttime` int(11) NOT NULL,
  `enableservice` int(11) NOT NULL,
  `dlquota` bigint(20) NOT NULL,
  `ulquota` bigint(20) NOT NULL,
  `combquota` bigint(20) NOT NULL,
  `timequota` bigint(20) NOT NULL,
  `priority` smallint(6) NOT NULL,
  `nextsrvid` int(11) NOT NULL,
  `dailynextsrvid` int(11) NOT NULL,
  `disnextsrvid` int(11) NOT NULL,
  `availucp` tinyint(1) NOT NULL,
  `renew` tinyint(1) NOT NULL,
  `carryover` tinyint(1) NOT NULL,
  `policymapdl` varchar(50) NOT NULL,
  `policymapul` varchar(50) NOT NULL,
  `custattr` varchar(255) NOT NULL,
  `gentftp` tinyint(1) NOT NULL,
  `cmcfg` varchar(10240) NOT NULL,
  `advcmcfg` tinyint(1) NOT NULL,
  `addamount` int(11) NOT NULL,
  `ignstatip` tinyint(1) NOT NULL,
  PRIMARY KEY (`srvid`),
  KEY `srvname` (`srvname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_services`
--

LOCK TABLES `rm_services` WRITE;
/*!40000 ALTER TABLE `rm_services` DISABLE KEYS */;
INSERT INTO `rm_services` VALUES (0,'Default service','',0,0,0,0,0,0,0,'','1.000000','0.000000',2,0,0,0,1,1,1,0,0,0,0,0,0,0,0,1,0,0,1,1,0,0,0,0,'0.000000','0.000000',0,1048576,1048576,1048576,1048576,10,10,1,0,0,0,0,4,-1,-1,-1,0,0,0,'512','128','',0,'',0,1,1),(11,'Expired','',262144,131072,0,0,0,0,0,'Expired','0.000000','0.000000',2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,'0.000000','0.000000',0,0,0,0,0,0,0,1,0,0,0,0,8,-1,-1,-1,0,0,0,'','','',0,'',0,1,1),(32,'Exceeded quota','',131072,131072,0,0,0,1,0,'Exceeded','0.000000','0.000000',3,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,'0.000000','0.000000',0,0,0,0,0,0,0,1,0,0,0,0,8,11,-1,11,0,0,0,'','','',0,'',0,1,1),(33,'1M Unlimited','1M Unlimited',1048576,262144,0,0,0,1,0,'','100.000000','0.000000',3,0,1,0,0,0,0,0,0,0,0,0,0,2,0,0,1,0,1,1,1,0,0,0,'0.000000','0.000000',0,0,0,0,0,0,0,1,0,0,0,0,8,11,-1,11,0,1,0,'','','',0,'',0,1,0),(34,'2M Unlimited','2M Unlimited',2097152,524288,0,0,0,1,0,'','150.000000','0.000000',3,0,1,0,0,0,0,0,0,0,0,0,0,2,0,0,1,0,1,1,1,0,0,0,'0.000000','0.000000',0,0,0,0,0,0,0,1,0,0,0,0,8,11,-1,11,0,1,0,'','','',0,'',0,1,0),(35,'4M Unlimited','4M Unlimited',4194304,524288,0,0,0,1,0,'','250.000000','0.000000',3,0,1,0,0,0,0,0,0,0,0,0,0,2,0,0,1,0,1,1,1,0,0,0,'0.000000','0.000000',0,0,0,0,0,0,0,1,0,0,0,0,8,11,-1,11,0,1,0,'','','',0,'',0,1,0),(36,'1 M 40 G','1 M 40 G',1048576,262144,0,0,1,1,0,'','80.000000','20.000000',3,0,1,0,0,0,40960,0,0,0,0,0,0,2,0,0,1,1,1,1,1,0,0,0,'0.000000','0.000000',0,0,0,0,0,0,0,1,0,0,0,0,8,32,-1,11,0,1,0,'','','',0,'',0,10240,0),(37,'2 M 80 G','2 M 80 G',2097152,524288,0,0,1,1,0,'','150.000000','20.000000',3,0,1,0,0,0,81920,0,0,0,0,0,0,2,0,0,1,1,1,1,1,0,0,0,'0.000000','0.000000',0,0,0,0,0,0,0,1,0,0,0,0,8,32,-1,11,0,1,0,'','','',0,'',0,10240,0),(38,'4 M 150 G','4 M 150 G',4194304,524288,0,0,1,1,0,'','250.000000','20.000000',3,0,1,0,0,0,153600,0,0,0,0,0,0,2,0,0,1,1,1,1,1,0,0,0,'0.000000','0.000000',0,0,0,0,0,0,0,1,0,0,0,0,8,32,-1,11,0,1,0,'','','',0,'',0,10240,0),(39,'Card 1M','1MEGA',1048576,131072,0,0,1,1,1,'','0.000000','0.000000',2,0,0,0,0,0,0,0,0,0,0,0,1,2,0,0,0,0,1,1,0,0,0,0,'0.000000','0.000000',0,0,0,0,0,0,0,1,0,0,0,0,8,11,-1,11,0,0,0,'','','',0,'',0,1,0),(40,'Card 2M','2MEGA',2097152,262144,0,0,1,1,1,'','0.000000','0.000000',2,0,0,0,0,0,0,0,0,0,0,0,1,2,0,0,0,0,1,1,0,0,0,0,'0.000000','0.000000',0,0,0,0,0,0,0,1,0,0,0,0,8,11,-1,11,0,0,0,'','','',0,'',0,1,0);
/*!40000 ALTER TABLE `rm_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_settings`
--

DROP TABLE IF EXISTS `rm_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_settings` (
  `currency` varchar(15) NOT NULL,
  `unixacc` tinyint(1) NOT NULL,
  `diskquota` tinyint(1) NOT NULL,
  `quotatpl` varchar(30) NOT NULL,
  `paymentopt` int(11) NOT NULL,
  `changesrv` tinyint(1) NOT NULL,
  `vatpercent` decimal(4,2) NOT NULL,
  `disablenotpaid` tinyint(1) NOT NULL,
  `disableexpcont` tinyint(1) NOT NULL,
  `resetctr` tinyint(1) NOT NULL,
  `newnasallsrv` tinyint(1) NOT NULL,
  `newmanallsrv` tinyint(1) NOT NULL,
  `disconnmethod` tinyint(1) NOT NULL,
  `warndl` bigint(20) NOT NULL,
  `warndlpercent` int(3) NOT NULL,
  `warnul` bigint(20) NOT NULL,
  `warnulpercent` int(3) NOT NULL,
  `warncomb` bigint(20) NOT NULL,
  `warncombpercent` int(3) NOT NULL,
  `warnuptime` bigint(20) NOT NULL,
  `warnuptimepercent` int(3) NOT NULL,
  `warnexpiry` int(11) NOT NULL,
  `emailselfregman` tinyint(1) NOT NULL,
  `emailwelcome` tinyint(1) NOT NULL,
  `emailnewsrv` tinyint(1) NOT NULL,
  `emailrenew` tinyint(1) NOT NULL,
  `emailexpiry` tinyint(1) NOT NULL,
  `smswelcome` tinyint(1) NOT NULL,
  `smsexpiry` tinyint(1) NOT NULL,
  `warnmode` tinyint(1) NOT NULL,
  `selfreg` tinyint(1) NOT NULL,
  `edituserdata` tinyint(1) NOT NULL,
  `hidelimits` tinyint(1) NOT NULL,
  `pm_internal` tinyint(1) NOT NULL,
  `pm_paypalstd` tinyint(1) NOT NULL,
  `pm_paypalpro` tinyint(1) NOT NULL,
  `pm_paypalexp` tinyint(1) NOT NULL,
  `pm_sagepay` tinyint(1) NOT NULL,
  `pm_authorizenet` tinyint(1) NOT NULL,
  `pm_dps` tinyint(1) NOT NULL,
  `pm_2co` tinyint(1) NOT NULL,
  `pm_payfast` tinyint(1) NOT NULL,
  `unixhost` tinyint(1) NOT NULL,
  `remotehostname` varchar(100) NOT NULL,
  `maclock` tinyint(1) NOT NULL,
  `billingstart` tinyint(2) NOT NULL,
  `renewday` tinyint(2) NOT NULL,
  `changepswucp` tinyint(1) NOT NULL,
  `redeemucp` tinyint(1) NOT NULL,
  `buycreditsucp` tinyint(1) NOT NULL,
  `selfreg_firstname` tinyint(1) NOT NULL,
  `selfreg_lastname` tinyint(1) NOT NULL,
  `selfreg_address` tinyint(1) NOT NULL,
  `selfreg_city` tinyint(1) NOT NULL,
  `selfreg_zip` tinyint(1) NOT NULL,
  `selfreg_country` tinyint(1) NOT NULL,
  `selfreg_state` tinyint(1) NOT NULL,
  `selfreg_phone` tinyint(1) NOT NULL,
  `selfreg_mobile` tinyint(1) NOT NULL,
  `selfreg_email` tinyint(1) NOT NULL,
  `selfreg_mobactsms` tinyint(1) NOT NULL,
  `selfreg_nameactemail` tinyint(1) NOT NULL,
  `selfreg_nameactsms` tinyint(1) NOT NULL,
  `selfreg_endupemail` tinyint(1) NOT NULL,
  `selfreg_endupmobile` tinyint(1) NOT NULL,
  `selfreg_vatid` tinyint(1) NOT NULL,
  `ias_email` tinyint(1) NOT NULL,
  `ias_mobile` tinyint(1) NOT NULL,
  `ias_verify` tinyint(1) NOT NULL,
  `ias_endupemail` tinyint(1) NOT NULL,
  `ias_endupmobile` tinyint(1) NOT NULL,
  `simuseselfreg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_settings`
--

LOCK TABLES `rm_settings` WRITE;
/*!40000 ALTER TABLE `rm_settings` DISABLE KEYS */;
INSERT INTO `rm_settings` VALUES ('L.E',1,1,'template',1,1,'0.00',1,1,1,1,1,1,0,80,0,80,0,80,0,80,3,1,1,1,1,1,0,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,'127.0.0.1',0,1,1,0,1,1,1,0,0,0,0,0,0,0,1,1,1,1,0,1,0,0,0,0,0,1,1,1);
/*!40000 ALTER TABLE `rm_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_specperacnt`
--

DROP TABLE IF EXISTS `rm_specperacnt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_specperacnt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `srvid` int(11) NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `timeratio` decimal(3,2) NOT NULL,
  `dlratio` decimal(3,2) NOT NULL,
  `ulratio` decimal(3,2) NOT NULL,
  `connallowed` tinyint(1) NOT NULL,
  `mon` tinyint(1) NOT NULL,
  `tue` tinyint(1) NOT NULL,
  `wed` tinyint(1) NOT NULL,
  `thu` tinyint(1) NOT NULL,
  `fri` tinyint(1) NOT NULL,
  `sat` tinyint(1) NOT NULL,
  `sun` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `srvid` (`srvid`),
  KEY `fromtime` (`starttime`),
  KEY `totime` (`endtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_specperacnt`
--

LOCK TABLES `rm_specperacnt` WRITE;
/*!40000 ALTER TABLE `rm_specperacnt` DISABLE KEYS */;
/*!40000 ALTER TABLE `rm_specperacnt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_specperbw`
--

DROP TABLE IF EXISTS `rm_specperbw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_specperbw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `srvid` int(11) NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `dlrate` int(11) NOT NULL,
  `ulrate` int(11) NOT NULL,
  `dlburstlimit` int(11) NOT NULL,
  `ulburstlimit` int(11) NOT NULL,
  `dlburstthreshold` int(11) NOT NULL,
  `ulburstthreshold` int(11) NOT NULL,
  `dlbursttime` int(11) NOT NULL,
  `ulbursttime` int(11) NOT NULL,
  `enableburst` tinyint(1) NOT NULL,
  `priority` int(11) NOT NULL,
  `mon` tinyint(1) NOT NULL,
  `tue` tinyint(1) NOT NULL,
  `wed` tinyint(1) NOT NULL,
  `thu` tinyint(1) NOT NULL,
  `fri` tinyint(1) NOT NULL,
  `sat` tinyint(1) NOT NULL,
  `sun` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_specperbw`
--

LOCK TABLES `rm_specperbw` WRITE;
/*!40000 ALTER TABLE `rm_specperbw` DISABLE KEYS */;
/*!40000 ALTER TABLE `rm_specperbw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_syslog`
--

DROP TABLE IF EXISTS `rm_syslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_syslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  `name` varchar(64) NOT NULL,
  `eventid` int(11) NOT NULL,
  `data1` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_syslog`
--

LOCK TABLES `rm_syslog` WRITE;
/*!40000 ALTER TABLE `rm_syslog` DISABLE KEYS */;
INSERT INTO `rm_syslog` VALUES (1,'2023-01-10 21:00:41','30.30.30.1','admin',3,'poos1u7k96veoi3e9pj714a2k7'),(2,'2023-01-10 21:06:25','30.30.30.1','admin',14,'Linux'),(3,'2023-01-10 21:06:29','30.30.30.1','admin',14,'Localhost'),(4,'2023-01-10 21:11:39','10.0.9.252','admin',3,'ng7v5dth52qeo1jgoje5dp9kf0'),(5,'2023-01-10 21:14:45','10.0.9.252','admin',13,'Mikrotik'),(6,'2023-01-10 21:16:27','30.30.30.1','admin',11,'Access list - Mikrotik'),(7,'2023-01-10 21:16:27','30.30.30.1','admin',11,'Access list - StarOS'),(8,'2023-01-10 21:16:27','30.30.30.1','admin',11,'Cable postpaid 1024/768'),(9,'2023-01-10 21:16:27','30.30.30.1','admin',11,'Cable prepaid 512/256'),(10,'2023-01-10 21:16:27','30.30.30.1','admin',11,'Card download limit 128 k'),(11,'2023-01-10 21:16:27','30.30.30.1','admin',11,'Card expiration + download limit'),(12,'2023-01-10 21:16:27','30.30.30.1','admin',11,'Card expiration limit'),(13,'2023-01-10 21:16:27','30.30.30.1','admin',11,'Card online time limit'),(14,'2023-01-10 21:16:27','30.30.30.1','admin',11,'Disabled'),(15,'2023-01-10 21:16:27','30.30.30.1','admin',11,'Email'),(16,'2023-01-10 21:16:27','30.30.30.1','admin',11,'IAS download limit'),(17,'2023-01-10 21:16:27','30.30.30.1','admin',11,'IAS expiration limit'),(18,'2023-01-10 21:16:27','30.30.30.1','admin',11,'IAS uptime limit'),(19,'2023-01-10 21:16:27','30.30.30.1','admin',11,'Postpaid MB download'),(20,'2023-01-10 21:16:27','30.30.30.1','admin',11,'Postpaid monthly 1 GB'),(21,'2023-01-10 21:16:27','30.30.30.1','admin',11,'Postpaid monthly 1 GB + overquotas'),(22,'2023-01-10 21:16:27','30.30.30.1','admin',11,'Postpaid monthly flat'),(23,'2023-01-10 21:16:27','30.30.30.1','admin',11,'Postpaid monthly flat + quotas'),(24,'2023-01-10 21:16:27','30.30.30.1','admin',11,'Postpaid online time'),(25,'2023-01-10 21:16:27','30.30.30.1','admin',11,'Prepaid expiration &amp; online time'),(26,'2023-01-10 21:16:27','30.30.30.1','admin',11,'Prepaid MB download'),(27,'2023-01-10 21:16:27','30.30.30.1','admin',11,'Prepaid monthly'),(28,'2023-01-10 21:16:27','30.30.30.1','admin',11,'Prepaid monthly 1 GB download'),(29,'2023-01-10 21:16:51','30.30.30.1','admin',11,'Prepaid monthly flat + quotas'),(30,'2023-01-10 21:16:51','30.30.30.1','admin',11,'Prepaid online time'),(31,'2023-01-10 21:16:51','30.30.30.1','admin',11,'Prepaid total MB'),(32,'2023-01-10 21:19:39','30.30.30.1','admin',5,''),(33,'2023-01-10 21:20:31','30.30.30.1','admin',8,'manager1'),(34,'2023-01-10 21:21:32','30.30.30.1','admin',7,'admin'),(35,'2023-01-10 21:23:08','30.30.30.1','admin',10,'Expired'),(36,'2023-01-10 21:24:27','30.30.30.1','admin',10,'Exceeded quota'),(37,'2023-01-10 21:45:01','30.30.30.1','admin',38,'poos1u7k96veoi3e9pj714a2k7'),(38,'2023-01-10 21:45:01','10.0.9.252','admin',38,'ng7v5dth52qeo1jgoje5dp9kf0'),(39,'2023-01-11 07:56:46','30.30.30.1','admin',3,'g6blg8tdk8mcdecrgcdo7l2cn6'),(40,'2023-01-11 07:58:56','30.30.30.1','admin',9,'1M Unlimited'),(41,'2023-01-11 08:01:18','30.30.30.1','admin',9,'2M Unlimited'),(42,'2023-01-11 08:03:00','30.30.30.1','admin',9,'4M Unlimited'),(43,'2023-01-11 08:04:52','30.30.30.1','admin',9,'1 M 40 G'),(44,'2023-01-11 08:07:37','30.30.30.1','admin',9,'2 M 80 G'),(45,'2023-01-11 08:09:50','30.30.30.1','admin',9,'4 M 150 G'),(46,'2023-01-11 08:10:12','30.30.30.1','admin',10,'Expired'),(47,'2023-01-11 08:10:27','30.30.30.1','admin',10,'Exceeded quota'),(48,'2023-01-11 08:12:01','30.30.30.1','admin',9,'Card 1M'),(49,'2023-01-11 08:13:10','30.30.30.1','admin',9,'Card 2M'),(50,'2023-01-11 08:14:02','30.30.30.1','admin',29,'DOCSIS CM'),(51,'2023-01-11 08:14:02','30.30.30.1','admin',29,'DOCSIS CPE'),(52,'2023-01-11 08:16:22','30.30.30.1','admin',2,'user'),(53,'2023-01-11 08:17:04','30.30.30.1','admin',0,'meem'),(54,'2023-01-11 08:35:01','30.30.30.1','admin',38,'g6blg8tdk8mcdecrgcdo7l2cn6'),(55,'2023-01-11 08:42:02','30.30.30.1','admin',3,'g6blg8tdk8mcdecrgcdo7l2cn6'),(56,'2023-01-11 11:00:01','30.30.30.1','admin',38,'g6blg8tdk8mcdecrgcdo7l2cn6'),(57,'2023-02-22 00:13:01','192.168.55.1','admin',3,'jkjsogi54jkk0hb6ujs2gu7a66'),(58,'2023-02-22 00:30:01','192.168.55.1','admin',38,'jkjsogi54jkk0hb6ujs2gu7a66'),(59,'2023-02-22 00:54:16','192.168.55.1','admin',3,'jkjsogi54jkk0hb6ujs2gu7a66'),(60,'2023-02-22 00:54:54','192.168.55.1','admin',1,'meem'),(61,'2023-02-22 00:57:41','192.168.55.1','admin',4,'jkjsogi54jkk0hb6ujs2gu7a66'),(62,'2023-02-22 00:59:41','192.168.55.1','admin',3,'jkjsogi54jkk0hb6ujs2gu7a66'),(63,'2023-02-22 13:05:01','192.168.55.1','admin',38,'jkjsogi54jkk0hb6ujs2gu7a66'),(64,'2023-02-22 21:05:36','192.168.55.1','admin',3,'guoq8i1hl3bteb7m5b698g1rm3'),(65,'2023-02-22 21:19:21','192.168.55.1','admin',23,'2023-0001'),(66,'2023-02-22 22:50:01','192.168.55.1','admin',38,'guoq8i1hl3bteb7m5b698g1rm3'),(67,'2023-02-22 23:01:34','192.168.55.1','admin',3,'guoq8i1hl3bteb7m5b698g1rm3'),(68,'2023-02-22 23:35:01','192.168.55.1','admin',38,'guoq8i1hl3bteb7m5b698g1rm3'),(69,'2023-02-22 23:38:44','192.168.55.1','admin',3,'guoq8i1hl3bteb7m5b698g1rm3'),(70,'2023-02-23 09:55:01','192.168.55.1','admin',38,'guoq8i1hl3bteb7m5b698g1rm3'),(71,'2023-02-23 09:57:47','192.168.55.1','admin',3,'s09sk8m11efp4np8jmgb6hu9g7'),(72,'2023-02-23 10:45:01','192.168.55.1','admin',38,'s09sk8m11efp4np8jmgb6hu9g7'),(73,'2023-02-23 10:50:25','192.168.55.1','admin',3,'s09sk8m11efp4np8jmgb6hu9g7'),(74,'2023-02-23 10:55:48','192.168.55.1','admin',3,'i7ck8115mua2u7q56vvemige45'),(75,'2023-02-23 11:15:02','192.168.55.1','admin',38,'i7ck8115mua2u7q56vvemige45'),(76,'2023-02-23 11:40:01','192.168.55.1','admin',38,'s09sk8m11efp4np8jmgb6hu9g7'),(77,'2023-02-23 11:42:09','192.168.55.1','admin',3,'s09sk8m11efp4np8jmgb6hu9g7'),(78,'2023-02-23 12:00:01','192.168.55.1','admin',38,'s09sk8m11efp4np8jmgb6hu9g7'),(79,'2023-02-23 16:42:22','192.168.55.1','admin',3,'s09sk8m11efp4np8jmgb6hu9g7'),(80,'2023-02-23 16:45:12','192.168.55.1','admin',3,'0rcf0tkps6d54am03lpheshn83'),(81,'2023-02-23 16:46:38','192.168.55.1','admin',3,'i7ck8115mua2u7q56vvemige45'),(82,'2023-02-23 17:03:30','192.168.55.1','admin',3,'10hql5qkeb0ctulp0ak1nj7oe3'),(83,'2023-02-23 17:10:01','192.168.55.1','admin',38,'0rcf0tkps6d54am03lpheshn83'),(84,'2023-02-23 17:15:01','192.168.55.1','admin',38,'s09sk8m11efp4np8jmgb6hu9g7'),(85,'2023-02-23 17:15:01','192.168.55.1','admin',38,'i7ck8115mua2u7q56vvemige45'),(86,'2023-02-23 17:35:01','192.168.55.1','admin',38,'10hql5qkeb0ctulp0ak1nj7oe3'),(87,'2023-02-23 17:54:21','192.168.55.1','admin',3,'oveka55olkviunuuu52qmp0536'),(88,'2023-02-23 20:30:01','192.168.55.1','admin',38,'oveka55olkviunuuu52qmp0536'),(89,'2023-02-23 20:32:01','192.168.55.1','admin',3,'4toos5ttsdjsc63cr4m0n0fmk5'),(90,'2023-02-23 21:00:01','192.168.55.1','admin',38,'4toos5ttsdjsc63cr4m0n0fmk5'),(91,'2023-02-23 21:05:13','192.168.55.1','admin',3,'4toos5ttsdjsc63cr4m0n0fmk5'),(92,'2023-02-23 21:07:09','192.168.55.1','admin',0,'m1'),(93,'2023-02-23 21:25:01','192.168.55.1','admin',38,'4toos5ttsdjsc63cr4m0n0fmk5'),(94,'2023-02-23 21:41:00','192.168.55.1','admin',3,'4toos5ttsdjsc63cr4m0n0fmk5'),(95,'2023-02-23 22:00:01','192.168.55.1','admin',38,'4toos5ttsdjsc63cr4m0n0fmk5');
/*!40000 ALTER TABLE `rm_syslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_usergroups`
--

DROP TABLE IF EXISTS `rm_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_usergroups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(50) NOT NULL,
  `descr` varchar(200) NOT NULL,
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_usergroups`
--

LOCK TABLES `rm_usergroups` WRITE;
/*!40000 ALTER TABLE `rm_usergroups` DISABLE KEYS */;
INSERT INTO `rm_usergroups` VALUES (1,'Default group','');
/*!40000 ALTER TABLE `rm_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_users`
--

DROP TABLE IF EXISTS `rm_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_users` (
  `username` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL,
  `groupid` int(11) NOT NULL,
  `enableuser` tinyint(1) NOT NULL,
  `uplimit` bigint(20) NOT NULL,
  `downlimit` bigint(20) NOT NULL,
  `comblimit` bigint(20) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(8) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `gpslat` decimal(17,14) NOT NULL,
  `gpslong` decimal(17,14) NOT NULL,
  `mac` varchar(17) NOT NULL,
  `usemacauth` tinyint(1) NOT NULL,
  `expiration` datetime NOT NULL,
  `uptimelimit` bigint(20) NOT NULL,
  `srvid` int(11) NOT NULL,
  `staticipcm` varchar(15) NOT NULL,
  `staticipcpe` varchar(15) NOT NULL,
  `ipmodecm` tinyint(1) NOT NULL,
  `ipmodecpe` tinyint(1) NOT NULL,
  `poolidcm` int(11) NOT NULL,
  `poolidcpe` int(11) NOT NULL,
  `createdon` date NOT NULL,
  `acctype` tinyint(1) NOT NULL,
  `credits` decimal(20,2) NOT NULL,
  `cardfails` tinyint(4) NOT NULL,
  `createdby` varchar(64) NOT NULL,
  `owner` varchar(64) NOT NULL,
  `taxid` varchar(40) NOT NULL,
  `email` varchar(100) NOT NULL,
  `maccm` varchar(17) NOT NULL,
  `custattr` varchar(255) NOT NULL,
  `warningsent` tinyint(1) NOT NULL,
  `verifycode` varchar(10) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `selfreg` tinyint(1) NOT NULL,
  `verifyfails` tinyint(4) NOT NULL,
  `verifysentnum` tinyint(4) NOT NULL,
  `verifymobile` varchar(15) NOT NULL,
  `contractid` varchar(50) NOT NULL,
  `contractvalid` date NOT NULL,
  `actcode` varchar(60) NOT NULL,
  `pswactsmsnum` tinyint(4) NOT NULL,
  `alertemail` tinyint(1) NOT NULL,
  `alertsms` tinyint(1) NOT NULL,
  `lang` varchar(30) NOT NULL,
  `lastlogoff` datetime DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `srvid` (`srvid`),
  KEY `groupid` (`groupid`),
  KEY `enableuser` (`enableuser`),
  KEY `firstname` (`firstname`),
  KEY `lastname` (`lastname`),
  KEY `company` (`company`),
  KEY `phone` (`phone`),
  KEY `mobile` (`mobile`),
  KEY `address` (`address`),
  KEY `city` (`city`),
  KEY `zip` (`zip`),
  KEY `country` (`country`),
  KEY `state` (`state`),
  KEY `comment` (`comment`(255)),
  KEY `mac` (`mac`),
  KEY `acctype` (`acctype`),
  KEY `email` (`email`),
  KEY `maccm` (`maccm`),
  KEY `owner` (`owner`),
  KEY `staticipcpe` (`staticipcpe`),
  KEY `staticipcm` (`staticipcm`),
  KEY `expiration` (`expiration`),
  KEY `createdon` (`createdon`),
  KEY `contractid` (`contractid`),
  KEY `contractvalid` (`contractvalid`),
  KEY `lastlogoff` (`lastlogoff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_users`
--

LOCK TABLES `rm_users` WRITE;
/*!40000 ALTER TABLE `rm_users` DISABLE KEYS */;
INSERT INTO `rm_users` VALUES ('01569693','d41d8cd98f00b204e9800998ecf8427e',1,1,0,0,0,'','','','','','','','','','','','0.00000000000000','0.00000000000000','',0,'2023-03-31 00:00:00',0,39,'','',0,0,0,0,'2023-02-22',2,'0.00',0,'admin','admin','','','','',0,'',1,0,0,0,'','','0000-00-00','',0,0,0,'',NULL),('02275307','d41d8cd98f00b204e9800998ecf8427e',1,1,0,0,0,'','','','','','','','','','','','0.00000000000000','0.00000000000000','',0,'2023-03-31 00:00:00',0,39,'','',0,0,0,0,'2023-02-22',2,'0.00',0,'admin','admin','','','','',0,'',1,0,0,0,'','','0000-00-00','',0,0,0,'',NULL),('06119579','d41d8cd98f00b204e9800998ecf8427e',1,1,0,0,0,'','','','','','','','','','','','0.00000000000000','0.00000000000000','',0,'2023-03-31 00:00:00',0,39,'','',0,0,0,0,'2023-02-22',2,'0.00',0,'admin','admin','','','','',0,'',1,0,0,0,'','','0000-00-00','',0,0,0,'',NULL),('10609262','d41d8cd98f00b204e9800998ecf8427e',1,1,0,0,0,'','','','','','','','','','','','0.00000000000000','0.00000000000000','',0,'2023-03-31 00:00:00',0,39,'','',0,0,0,0,'2023-02-22',2,'0.00',0,'admin','admin','','','','',0,'',1,0,0,0,'','','0000-00-00','',0,0,0,'',NULL),('28345550','d41d8cd98f00b204e9800998ecf8427e',1,1,0,0,0,'','','','','','','','','','','','0.00000000000000','0.00000000000000','',0,'2023-03-31 00:00:00',0,39,'','',0,0,0,0,'2023-02-22',2,'0.00',0,'admin','admin','','','','',0,'',1,0,0,0,'','','0000-00-00','',0,0,0,'',NULL),('32072650','d41d8cd98f00b204e9800998ecf8427e',1,1,0,0,0,'','','','','','','','','','','','0.00000000000000','0.00000000000000','',0,'2023-03-31 00:00:00',0,39,'','',0,0,0,0,'2023-02-22',2,'0.00',0,'admin','admin','','','','',0,'',1,0,0,0,'','','0000-00-00','',0,0,0,'',NULL),('49720936','d41d8cd98f00b204e9800998ecf8427e',1,1,0,0,0,'','','','','','','','','','','','0.00000000000000','0.00000000000000','',0,'2023-03-31 00:00:00',0,39,'','',0,0,0,0,'2023-02-22',2,'0.00',0,'admin','admin','','','','',0,'',1,0,0,0,'','','0000-00-00','',0,0,0,'',NULL),('50043226','d41d8cd98f00b204e9800998ecf8427e',1,1,0,0,0,'','','','','','','','','','','','0.00000000000000','0.00000000000000','',0,'2023-03-31 00:00:00',0,39,'','',0,0,0,0,'2023-02-22',2,'0.00',0,'admin','admin','','','','',0,'',1,0,0,0,'','','0000-00-00','',0,0,0,'',NULL),('65561523','d41d8cd98f00b204e9800998ecf8427e',1,1,0,0,0,'','','','','','','','','','','','0.00000000000000','0.00000000000000','',0,'2023-03-31 00:00:00',0,39,'','',0,0,0,0,'2023-02-22',2,'0.00',0,'admin','admin','','','','',0,'',1,0,0,0,'','','0000-00-00','',0,0,0,'',NULL),('86366911','d41d8cd98f00b204e9800998ecf8427e',1,1,0,0,0,'','','','','','','','','','','','0.00000000000000','0.00000000000000','',0,'2023-03-31 00:00:00',0,39,'','',0,0,0,0,'2023-02-22',2,'0.00',0,'admin','admin','','','','',0,'',1,0,0,0,'','','0000-00-00','',0,0,0,'',NULL),('m1','ae7be26cdaa742ca148068d5ac90eaca',1,1,0,0,0,'MaGeek','egySTARx','','','01142798108','Egypt','','','','','','0.00000000000000','0.00000000000000','',0,'2023-02-23 00:00:00',0,37,'','',0,0,0,0,'2023-02-23',0,'0.00',0,'admin','admin','','ma6eek@gmail.com','','',0,'',0,0,0,0,'','','0000-00-00','',0,1,1,'Arabic',NULL),('meem','b92f74f01c13d0a568b1638a9f501a1f',1,1,0,0,42949672960,'TechnoMeeM','','','','','','','','','','','0.00000000000000','0.00000000000000','',0,'2023-03-22 00:00:00',0,36,'','',0,0,0,0,'2023-01-11',0,'0.00',0,'admin','admin','','','','',0,'',0,0,0,0,'','','0000-00-00','',0,1,1,'Arabic',NULL);
/*!40000 ALTER TABLE `rm_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rm_wlan`
--

DROP TABLE IF EXISTS `rm_wlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rm_wlan` (
  `maccpe` varchar(17) DEFAULT NULL,
  `signal` smallint(6) DEFAULT NULL,
  `ccq` smallint(6) DEFAULT NULL,
  `snr` smallint(6) DEFAULT NULL,
  `apip` varchar(15) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `maccpe` (`maccpe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rm_wlan`
--

LOCK TABLES `rm_wlan` WRITE;
/*!40000 ALTER TABLE `rm_wlan` DISABLE KEYS */;
/*!40000 ALTER TABLE `rm_wlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'radius'
--

--
-- Dumping routines for database 'radius'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-19 17:52:19
