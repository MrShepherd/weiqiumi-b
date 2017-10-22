-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: weiqiumi
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Current Database: `weiqiumi`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `weiqiumi` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `weiqiumi`;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `abbr` varchar(100) NOT NULL COMMENT '缩略',
  `content` varchar(5000) NOT NULL COMMENT '内容',
  `image` varchar(1000) NOT NULL COMMENT '配图地址',
  `enable` int(11) NOT NULL COMMENT '标志位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文章';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'标题1','缩略语1缩略语1缩略语1缩略语1缩略语1缩略语1缩略语1缩略语1缩略语1缩略语1缩略语1缩略语1缩略语1缩略语1缩略语1缩略语1','内容内容内容','http://XXXXX',1),(2,'标题2','缩略语2缩略语2缩略语2缩略语2缩略语2缩略语2缩略语2缩略语2缩略语2缩略语2缩略语2','内容内容内容','http://XXXXX',1),(3,'标题3','缩略语3缩略语3缩略语3缩略语3缩略语3','内容内容内容','http://XXXXX',1),(4,'标题4','缩略语4缩略语4缩略语4缩略语4缩略语4缩略语4缩略语4','内容内容内容','http://XXXXX',1);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradehistory`
--

DROP TABLE IF EXISTS `gradehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradehistory` (
  `openid` varchar(1000) NOT NULL COMMENT '用户ID',
  `date` date NOT NULL COMMENT '日期',
  `gradetime` time NOT NULL COMMENT '时间',
  `grade` int(11) DEFAULT NULL COMMENT '等级',
  `typekey` varchar(20) DEFAULT NULL COMMENT '类型',
  `typevalue` varchar(50) DEFAULT NULL COMMENT '类型值',
  PRIMARY KEY (`openid`,`date`,`gradetime`),
  KEY `fk_gradehistory_user1_idx` (`openid`),
  CONSTRAINT `fk_gradehistory_user1` FOREIGN KEY (`openid`) REFERENCES `users` (`openid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评级历史';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradehistory`
--

LOCK TABLES `gradehistory` WRITE;
/*!40000 ALTER TABLE `gradehistory` DISABLE KEYS */;
INSERT INTO `gradehistory` VALUES ('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-17','21:58:13',1,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18','11:38:21',4,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18','12:29:09',4,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-19','17:19:16',3,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-19','17:20:04',5,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-19','17:22:03',5,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-19','17:24:02',3,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-19','17:41:14',5,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-19','17:42:39',2,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-20','15:45:42',1,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-20','18:57:08',4,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-20','20:57:24',4,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-20','20:57:27',4,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','11:31:00',3,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','11:57:05',5,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','13:57:34',3,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','13:59:03',3,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','17:23:06',4,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','18:17:47',4,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','18:21:00',4,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','18:24:47',5,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','18:33:55',3,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','20:47:58',4,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','21:53:10',4,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','21:56:04',4,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','21:59:51',4,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','22:00:51',4,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','22:35:32',4,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','22:37:19',4,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','22:42:34',4,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','22:44:40',3,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','22:48:50',5,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','22:49:35',5,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','22:51:31',3,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21','23:06:32',2,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-22','11:45:04',3,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-12-15','12:34:56',14,'队伍','皇马');
/*!40000 ALTER TABLE `gradehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitecode`
--

DROP TABLE IF EXISTS `invitecode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitecode` (
  `code` varchar(100) NOT NULL COMMENT '邀请码',
  `openid` varchar(1000) DEFAULT NULL,
  `enable` int(11) NOT NULL COMMENT '有效值',
  PRIMARY KEY (`code`),
  KEY `fk_invitecode_user_idx` (`openid`),
  CONSTRAINT `fk_invitecode_user` FOREIGN KEY (`openid`) REFERENCES `users` (`openid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邀请码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitecode`
--

LOCK TABLES `invitecode` WRITE;
/*!40000 ALTER TABLE `invitecode` DISABLE KEYS */;
/*!40000 ALTER TABLE `invitecode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payhistory`
--

DROP TABLE IF EXISTS `payhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payhistory` (
  `openid` varchar(1000) NOT NULL COMMENT '用户ID',
  `date` date NOT NULL COMMENT '日期',
  `paytime` time NOT NULL COMMENT '支付时间',
  `amount` float DEFAULT NULL COMMENT '金额',
  PRIMARY KEY (`openid`,`date`,`paytime`),
  KEY `fk_payhistory_user1_idx` (`openid`),
  CONSTRAINT `fk_payhistory_user1` FOREIGN KEY (`openid`) REFERENCES `users` (`openid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付历史';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payhistory`
--

LOCK TABLES `payhistory` WRITE;
/*!40000 ALTER TABLE `payhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `payhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(1000) NOT NULL COMMENT '题目',
  `image` varchar(300) DEFAULT NULL COMMENT '相关图片',
  `answer` varchar(10) NOT NULL COMMENT '正确答案',
  `optionlist` varchar(1000) NOT NULL COMMENT '选项列表',
  `difficulty` varchar(10) NOT NULL COMMENT '难度',
  `typekey` varchar(20) NOT NULL COMMENT '题型',
  `typevalue` varchar(50) NOT NULL COMMENT '题型值',
  `category` int(11) NOT NULL COMMENT '分类编号',
  `righttimes` int(11) NOT NULL DEFAULT '0' COMMENT '正确次数',
  `wrongtimes` int(11) NOT NULL DEFAULT '0' COMMENT '错误次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='试题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'皇家马德里一线队的7号队员是？',NULL,'C罗','贝尔-本泽马-克罗斯-格里兹曼-里贝里-卡卡-巴洛特利-阿森西奥','简单','队伍','皇家马德里',1,175,0),(2,'皇家马德里一线队的7号队员是？',NULL,'C罗','贝尔-本泽马-克罗斯-格里兹曼-里贝里-卡卡-巴洛特利-阿森西奥','简单','队伍','皇家马德里',1,7,165),(3,'皇家马德里一线队的7号队员是？',NULL,'C罗','贝尔-本泽马-克罗斯-格里兹曼-里贝里-卡卡-巴洛特利-阿森西奥','容易','队伍','皇家马德里',2,10,164),(4,'皇家马德里一线队的7号队员是？',NULL,'C罗','贝尔-本泽马-克罗斯-格里兹曼-里贝里-卡卡-巴洛特利-阿森西奥','容易','队伍','皇家马德里',3,171,0),(5,'皇家马德里一线队的7号队员是？',NULL,'C罗','贝尔-本泽马-克罗斯-格里兹曼-里贝里-卡卡-巴洛特利-阿森西奥','容易','队伍','皇家马德里',4,9,0),(6,'皇家马德里一线队的7号队员是？',NULL,'C罗','贝尔-本泽马-克罗斯-格里兹曼-里贝里-卡卡-巴洛特利-阿森西奥','困难','队伍','皇家马德里',4,9,0),(7,'皇家马德里一线队的7号队员是？',NULL,'C罗','贝尔-本泽马-克罗斯-格里兹曼-里贝里-卡卡-巴洛特利-阿森西奥','变态','队伍','皇家马德里',4,10,0),(8,'皇家马德里一线队的7号队员是？',NULL,'C罗','贝尔-本泽马-克罗斯-格里兹曼-里贝里-卡卡-巴洛特利-阿森西奥','变态','队伍','皇家马德里',3,11,1),(9,'皇家马德里一线队的7号队员是？',NULL,'C罗','贝尔-本泽马-克罗斯-格里兹曼-里贝里-卡卡-巴洛特利-阿森西奥','困难','队伍','皇家马德里',5,10,0),(10,'皇家马德里一线队的7号队员是？',NULL,'C罗','贝尔-本泽马-克罗斯-格里兹曼-里贝里-卡卡-巴洛特利-阿森西奥','困难','队伍','皇家马德里',6,10,0),(11,'皇家马德里一线队的7号队员是？',NULL,'C罗','贝尔-本泽马-克罗斯-格里兹曼-里贝里-卡卡-巴洛特利-阿森西奥','困难','队伍','皇家马德里',7,10,0),(12,'C罗从曼联转会到皇马的转会费是多少？','','9600万欧','1.01以欧-2.2亿欧-8000万欧','简单','队伍','皇家马德里',2,9,0),(13,'皇马的欧冠最好成绩是?','','冠军','亚军-四强-八强','简单','队伍','皇家马德里',13,10,0),(14,'皇马的现役11号球员是谁?','','贝尔','莫德里奇-马塞洛-卡西利亚-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-拉莫斯-瓦拉内-纳乔-C罗-克罗斯-本泽马','简单','队伍','皇家马德里',14,3,0),(15,'皇马的现役12号球员是谁?','','马塞洛','莫德里奇-贝尔-卡西利亚-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-拉莫斯-瓦拉内-纳乔-C罗-克罗斯-本泽马','简单','队伍','皇家马德里',14,2,0),(16,'皇马的现役1号球员是谁?','','纳瓦斯','莫德里奇-贝尔-马塞洛-卡西利亚-卡塞米罗-科瓦契奇-略伦特-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-拉莫斯-瓦拉内-纳乔-C罗-克罗斯-本泽马','简单','队伍','皇家马德里',14,1,0),(17,'皇马的现役20号球员是谁?','','阿森西奥','莫德里奇-贝尔-马塞洛-卡西利亚-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-拉莫斯-瓦拉内-纳乔-C罗-克罗斯-本泽马','简单','队伍','皇家马德里',14,3,0),(18,'皇马的现役22号球员是谁?','','伊斯科','莫德里奇-贝尔-马塞洛-卡西利亚-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-阿森西奥-马约拉尔-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-拉莫斯-瓦拉内-纳乔-C罗-克罗斯-本泽马','简单','队伍','皇家马德里',14,0,1),(19,'皇马的现役2号球员是谁?','','卡瓦哈尔','莫德里奇-贝尔-马塞洛-卡西利亚-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-巴列霍-拉莫斯-瓦拉内-纳乔-C罗-克罗斯-本泽马','简单','队伍','皇家马德里',14,4,0),(20,'皇马的现役4号球员是谁?','','拉莫斯','莫德里奇-贝尔-马塞洛-卡西利亚-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-瓦拉内-纳乔-C罗-克罗斯-本泽马','简单','队伍','皇家马德里',14,0,0),(21,'皇马的现役5号球员是谁?','','瓦拉内','莫德里奇-贝尔-马塞洛-卡西利亚-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-拉莫斯-纳乔-C罗-克罗斯-本泽马','简单','队伍','皇家马德里',14,5,0),(22,'皇马的现役7号球员是谁?','','C罗','莫德里奇-贝尔-马塞洛-卡西利亚-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-拉莫斯-瓦拉内-纳乔-克罗斯-本泽马','简单','队伍','皇家马德里',14,5,0),(23,'皇马的现役8号球员是谁?','','克罗斯','莫德里奇-贝尔-马塞洛-卡西利亚-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-拉莫斯-瓦拉内-纳乔-C罗-本泽马','简单','队伍','皇家马德里',14,3,0),(24,'皇马的现役9号球员是谁?','','本泽马','莫德里奇-贝尔-马塞洛-卡西利亚-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-拉莫斯-瓦拉内-纳乔-C罗-克罗斯','简单','队伍','皇家马德里',14,3,0),(25,'皇马的主场球场叫什么名字？','','伯纳乌球场','诺坎普球场-迪斯蒂法诺球场-老特拉福德球场','简单','队伍','皇家马德里',15,10,0),(26,'皇马俱乐部现任主席是谁?','','弗诺伦蒂诺','伯纳乌-卡尔德隆-巴托梅乌','简单','队伍','皇家马德里',35,7,1),(27,'皇马现任主教练是谁？','','齐达内','安切洛蒂-穆里尼奥-贝尼特斯','简单','队伍','皇家马德里',40,8,0),(28,'欧冠改制以来第一支成功卫冕欧冠冠军的球队是？','','皇马','巴萨-拜仁-曼联','简单','队伍','皇家马德里',43,8,0),(29,'C罗的违约金是多少？','','10亿欧','2.5亿欧-5亿欧-7.5亿欧','容易','队伍','皇家马德里',3,12,0),(30,'被称为“水爷”的球星是？','','拉莫斯','莫德里奇-贝尔-马塞洛-卡西利亚-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-瓦拉内-纳乔-C罗-克罗斯-本泽马','容易','队伍','皇家马德里',5,12,0),(31,'皇马的绰号叫什么？','','银河战舰','宇宙队-白魔-床单军团','容易','队伍','皇家马德里',10,12,0),(32,'皇马的队歌是什么名字?','','加油，马德里','加油,伯纳乌-加油,皇马-加油,加油','容易','队伍','皇家马德里',12,11,0),(33,'皇马的现役10号球员是谁?','','莫德里奇','贝尔-马塞洛-卡西利亚-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-拉莫斯-瓦拉内-纳乔-C罗-克罗斯-本泽马','容易','队伍','皇家马德里',14,1,0),(34,'皇马的现役14号球员是谁?','','卡塞米罗','莫德里奇-贝尔-马塞洛-卡西利亚-科瓦契奇-略伦特-纳瓦斯-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-拉莫斯-瓦拉内-纳乔-C罗-克罗斯-本泽马','容易','队伍','皇家马德里',14,2,1),(35,'皇马的现役6号球员是谁?','','纳乔','莫德里奇-贝尔-马塞洛-卡西利亚-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-拉莫斯-瓦拉内-C罗-克罗斯-本泽马','容易','队伍','皇家马德里',14,0,0),(36,'皇马队史射手王是谁？','','C罗','劳尔-迪斯蒂法诺-卡斯普什','容易','队伍','皇家马德里',24,10,0),(37,'皇马队史最多出场次数的球员是？','','劳尔','迪斯蒂法诺-卡西利亚斯-拉莫斯','容易','队伍','皇家马德里',25,8,2),(38,'皇马获得过多少次国王杯冠军?','','19','12-33-22','容易','队伍','皇家马德里',28,3,6),(39,'皇马获得过多少次欧冠冠军？','','12','10-14-13','容易','队伍','皇家马德里',29,12,1),(40,'皇马获得过多少次欧洲超级杯冠军?','','4','3-5-6','容易','队伍','皇家马德里',30,2,10),(41,'皇马获得过多少次世俱杯冠军？','','5','3-4-6','容易','队伍','皇家马德里',31,7,4),(42,'皇马获得过多少次西超杯冠军？','','10','19-12-22','容易','队伍','皇家马德里',32,1,10),(43,'皇马获得过多少次西甲冠军?','','33','28-32-36','容易','队伍','皇家马德里',33,8,0),(44,'皇马球迷昵称叫什么?','','美凌格','枪迷-红魔-皇马米','容易','队伍','皇家马德里',36,10,0),(45,'皇马上一任主教练是谁?','','贝尼特斯','安切洛蒂-穆里尼奥-齐达内','容易','队伍','皇家马德里',37,0,12),(46,'皇马现任队长是谁？','','拉莫斯','莫德里奇-贝尔-马塞洛-卡西利亚-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-瓦拉内-纳乔-C罗-克罗斯-本泽马','容易','队伍','皇家马德里',38,16,0),(47,'被国际足联评为20世纪最伟大的球队是？','','皇马','巴萨-拜仁-曼联','困难','队伍','皇家马德里',6,9,2),(48,'被国际足球历史和统计联合会评为20世纪欧洲最佳俱乐部的是？','','皇马','巴萨-拜仁-曼联','困难','队伍','皇家马德里',7,8,0),(49,'创最长连续进球场次记录的球队是？','','皇马','巴萨-拜仁-曼联','困难','队伍','皇家马德里',8,7,0),(50,'带领皇马取得队史最长连胜记录的主教练是？','','安切洛蒂','齐达内-穆里尼奥-贝尼特斯','困难','队伍','皇家马德里',9,13,0),(51,'皇马的第三队长是谁?','','C罗','莫德里奇-贝尔-马塞洛-卡西利亚-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-拉莫斯-瓦拉内-纳乔-克罗斯-本泽马','困难','队伍','皇家马德里',11,8,1),(52,'皇马的现役13号球员是谁?','','卡西利亚','莫德里奇-贝尔-马塞洛-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-拉莫斯-瓦拉内-纳乔-C罗-克罗斯-本泽马','困难','队伍','皇家马德里',14,11,0),(53,'皇马的现役16号球员是谁?','','科瓦契奇','莫德里奇-贝尔-马塞洛-卡西利亚-卡塞米罗-略伦特-纳瓦斯-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-拉莫斯-瓦拉内-纳乔-C罗-克罗斯-本泽马','困难','队伍','皇家马德里',14,5,0),(54,'皇马的现役18号球员是谁?','','略伦特','莫德里奇-贝尔-马塞洛-卡西利亚-卡塞米罗-科瓦契奇-纳瓦斯-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-拉莫斯-瓦拉内-纳乔-C罗-克罗斯-本泽马','困难','队伍','皇家马德里',14,4,0),(55,'皇马的现役21号球员是谁?','','马约拉尔','莫德里奇-贝尔-马塞洛-卡西利亚-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-阿森西奥-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-拉莫斯-瓦拉内-纳乔-C罗-克罗斯-本泽马','困难','队伍','皇家马德里',14,10,0),(56,'皇马的现役24号球员是谁?','','塞瓦略斯','莫德里奇-贝尔-马塞洛-卡西利亚-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-阿森西奥-马约拉尔-伊斯科-亚涅斯-卡瓦哈尔-巴列霍-拉莫斯-瓦拉内-纳乔-C罗-克罗斯-本泽马','困难','队伍','皇家马德里',14,8,0),(57,'皇马的现役3号球员是谁?','','巴列霍','莫德里奇-贝尔-马塞洛-卡西利亚-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-拉莫斯-瓦拉内-纳乔-C罗-克罗斯-本泽马','困难','队伍','皇家马德里',14,3,2),(58,'皇马队史连续不败场次最多是多少?','','35','36-43-39','困难','队伍','皇家马德里',21,1,11),(59,'皇马队史联赛最多出场次数的球员是？','','劳尔','迪斯蒂法诺-卡西利亚斯-拉莫斯','困难','队伍','皇家马德里',22,12,2),(60,'皇马队史联赛最长连胜记录是多少场?','','16','22-19-24','困难','队伍','皇家马德里',23,1,7),(61,'皇马队史最长连胜记录是多少场？','','22','19-16-24','困难','队伍','皇家马德里',27,5,0),(62,'皇马现任副队长是谁？','','马塞洛','莫德里奇-贝尔-卡西利亚-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-亚涅斯-卡瓦哈尔-巴列霍-拉莫斯-瓦拉内-纳乔-C罗-克罗斯-本泽马','困难','队伍','皇家马德里',39,12,0),(63,'皇马主场的座位数是多少?','','94497','103475-98772-87449','困难','队伍','皇家马德里',41,1,5),(64,'皇马最长连续进球场次是多少？','','73','49-81-77','困难','队伍','皇家马德里',42,11,0),(65,'1958年,皇马曾经与如日中天的球王贝利领衔的巴西桑托斯队对垒，比赛结果是多少?','','5:3','4:3-3:4-3:5','变态','队伍','皇家马德里',1,8,1),(66,'阿尔弗雷多·迪·斯蒂法诺离开皇马转会去的球队是?','','西班牙人','瓦伦西亚-毕尔巴鄂-塞维利亚','变态','队伍','皇家马德里',4,9,2),(67,'皇马的现役25号球员是谁?','','亚涅斯','莫德里奇-贝尔-马塞洛-卡西利亚-卡塞米罗-科瓦契奇-略伦特-纳瓦斯-阿森西奥-马约拉尔-伊斯科-塞瓦略斯-卡瓦哈尔-巴列霍-拉莫斯-瓦拉内-纳乔-C罗-克罗斯-本泽马','变态','队伍','皇家马德里',14,8,0),(68,'皇马的主场是何时更名为“圣地亚哥·伯纳乌球场”的?','','1955年','1945年-1965年-1975年','变态','队伍','皇家马德里',16,5,5),(69,'皇马第一任主教练是谁?','','阿瑟·约翰逊','胡安·帕德罗斯·鲁比奥-约翰·卢基奇-迪诺·佐夫','变态','队伍','皇家马德里',17,2,9),(70,'皇马队史获得第一个顶级联赛冠军是在哪个赛季?','','1931/32赛季','1910/11赛季-1921/22赛季-1922/23赛季','变态','队伍','皇家马德里',20,0,5),(71,'皇马队史最年轻的联赛出场球员是？','','厄德高','C罗-阿森西奥-拉莫斯','变态','队伍','皇家马德里',26,3,1),(72,'皇马俱乐部的成立时间是？','','1902年3月6日','1902年3月5日-1889年8月9日-1890年11月3日','变态','队伍','皇家马德里',34,3,8),(73,'终结皇马最长连胜记录的球队是？','','瓦伦西亚','毕尔巴鄂-塞维利亚-巴萨','变态','队伍','皇家马德里',44,0,5);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testhistory`
--

DROP TABLE IF EXISTS `testhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testhistory` (
  `openid` varchar(1000) NOT NULL COMMENT '用户ID',
  `date` date NOT NULL COMMENT '日期',
  `rightnum` int(11) DEFAULT NULL COMMENT '正确数量',
  `wrongnum` int(11) DEFAULT NULL COMMENT '错误数量',
  `timestart` time NOT NULL COMMENT '开始时间',
  `timeend` time DEFAULT NULL COMMENT '结束时间',
  `timecost` int(11) DEFAULT NULL COMMENT '耗时（秒）',
  `mark` int(11) DEFAULT NULL COMMENT '分数',
  `typekey` varchar(20) DEFAULT NULL COMMENT '题型',
  `typevalue` varchar(50) DEFAULT NULL COMMENT '题型值',
  PRIMARY KEY (`openid`,`date`,`timestart`),
  KEY `fk_testhistory_user1_idx` (`openid`),
  CONSTRAINT `fk_testhistory_user1` FOREIGN KEY (`openid`) REFERENCES `users` (`openid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试历史';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testhistory`
--

LOCK TABLES `testhistory` WRITE;
/*!40000 ALTER TABLE `testhistory` DISABLE KEYS */;
INSERT INTO `testhistory` VALUES ('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-16',4,2,'22:39:18','22:39:34',16,17,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-16',5,1,'22:43:49','22:44:03',14,20,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-16',6,0,'22:46:49','22:47:01',12,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-16',6,0,'22:49:53','22:50:09',16,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-16',5,1,'22:53:36','22:53:48',12,20,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-17',4,2,'19:12:17','19:12:30',13,17,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-17',6,0,'19:13:20','19:13:35',15,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-17',4,2,'21:20:44','21:20:58',14,17,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-17',6,0,'21:29:25','21:29:39',14,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-17',6,0,'21:30:41','21:30:52',11,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-17',5,1,'21:32:02','21:32:19',17,20,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-17',6,0,'21:33:54','21:34:05',11,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-17',6,0,'21:36:40','21:36:55',15,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-17',6,0,'21:37:23','21:37:36',13,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-17',5,1,'21:38:44','21:38:56',12,23,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-17',4,2,'21:39:57','21:40:09',12,17,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-17',6,0,'21:41:55','21:42:06',11,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-17',4,2,'21:42:45','21:42:59',14,18,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-17',6,0,'21:43:46','21:44:00',14,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-17',6,0,'21:56:27','21:56:42',15,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-17',2,4,'21:57:54','21:58:09',15,9,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',6,0,'11:23:34','11:23:51',17,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',5,1,'11:37:55','11:38:08',13,20,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',5,1,'11:39:45','11:39:57',12,21,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',6,0,'11:45:24','11:45:34',10,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',5,1,'11:46:17','11:46:31',14,23,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',5,1,'11:47:09','11:47:23',14,20,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',6,0,'12:05:09','12:05:24',15,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',6,0,'12:17:37','12:17:47',10,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',5,1,'12:28:46','12:28:59',13,20,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',4,2,'12:31:18','12:31:31',13,16,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',5,1,'12:36:05','12:36:17',12,23,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',6,0,'12:39:01','12:39:14',13,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',5,1,'12:40:46','12:41:01',15,20,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',3,3,'12:43:08','12:43:24',16,12,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',5,1,'12:44:05','12:44:16',11,20,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',5,1,'12:45:03','12:45:17',14,23,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',4,2,'12:51:05','12:51:18',13,17,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',5,1,'12:52:39','12:52:52',13,23,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',4,2,'12:55:37','12:55:54',17,20,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',4,2,'20:12:50','20:13:06',16,17,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',4,1,'20:20:02','20:20:17',15,16,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',6,0,'20:21:46','20:21:57',11,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',6,0,'20:23:00','20:23:17',17,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',5,1,'20:24:47','20:25:01',14,20,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',6,0,'20:25:31','20:25:44',13,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',6,0,'20:28:50','20:29:08',18,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-18',3,3,'21:02:43','21:02:56',13,15,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-19',4,2,'17:18:58','17:19:11',13,17,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-19',6,0,'17:19:44','17:19:59',15,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-19',6,0,'17:21:25','17:21:37',12,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-19',4,2,'17:22:16','17:22:31',15,18,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-19',6,0,'17:38:02','17:38:14',12,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-19',3,3,'17:42:10','17:42:30',20,13,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-19',5,1,'17:42:45','17:43:04',19,21,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-20',1,1,'15:44:38','15:45:06',28,5,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-20',5,1,'15:47:09','15:47:21',12,21,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-20',5,1,'18:56:41','18:56:54',13,21,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-20',3,1,'21:49:34','21:49:58',24,13,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21',4,2,'11:28:54','11:29:11',17,17,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21',6,0,'11:56:42','11:56:58',16,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21',4,2,'13:06:17','13:06:33',16,17,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21',4,2,'13:58:35','13:58:48',13,17,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21',5,1,'17:22:45','17:23:02',17,20,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21',5,1,'18:20:38','18:20:56',18,21,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21',6,0,'18:24:31','18:24:43',12,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21',4,2,'18:33:36','18:33:51',15,17,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21',5,1,'20:47:30','20:47:51',21,23,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21',5,1,'21:52:52','21:53:06',14,20,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21',5,1,'21:55:50','21:56:02',12,21,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21',5,1,'21:59:33','21:59:47',14,20,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21',5,1,'22:35:15','22:35:28',13,23,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21',5,1,'22:37:02','22:37:17',15,23,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21',5,1,'22:42:21','22:42:32',11,20,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21',4,2,'22:44:22','22:44:38',16,16,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21',6,0,'22:48:31','22:48:47',16,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21',6,0,'22:49:21','22:49:33',12,26,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21',4,2,'22:51:16','22:51:29',13,16,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-21',3,3,'23:06:24','23:06:30',6,11,'队伍','皇家马德里'),('ozHMb0bW_QOvlNCfMueamKQaALUM','2017-10-22',4,2,'11:44:44','11:45:00',16,15,'队伍','皇家马德里'),('ozHMb0TRoWUoGkifkt9tDnsYE5ls','2017-10-20',6,0,'18:47:43','18:47:54',11,26,'队伍','皇家马德里');
/*!40000 ALTER TABLE `testhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `openid` varchar(1000) NOT NULL COMMENT '用户ID',
  `nickname` varchar(100) DEFAULT NULL COMMENT '微信昵称',
  `gender` int(11) DEFAULT NULL COMMENT '性别',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `province` varchar(100) DEFAULT NULL COMMENT '省份',
  `avatarurl` varchar(1000) DEFAULT NULL COMMENT '头像地址',
  `dongqiudiID` varchar(45) DEFAULT NULL COMMENT '懂球帝账号',
  `hupuID` varchar(45) DEFAULT NULL COMMENT '虎扑账号',
  `tiebaID` varchar(45) DEFAULT NULL COMMENT '贴吧账号',
  `weiboID` varchar(45) DEFAULT NULL COMMENT '微博账号',
  PRIMARY KEY (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('ozHMb0bW_QOvlNCfMueamKQaALUM','shepherd',1,'Erdos','Inner Mongolia','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKG9FuqsHQcuAcMIeBB83kAkER3GcIJEk2ZkEK45hV1NIPrWAIwodiazrZgj82C0nnY6vSQ85mckAw/0','1000',NULL,NULL,NULL),('ozHMb0QAJkte9kiAYsnz2mZUBVdk','tbag',1,'','Beijing','https://wx.qlogo.cn/mmopen/vi_32/z4aW287Nq9YicKrXDia0HnIJud7zQ9BhiasmYBjnbyM7Cqiakt1VH0M7sye9bq6kUMsIKGJkEEW9doTwknfYlSP8kw/0',NULL,NULL,NULL,NULL),('ozHMb0TRoWUoGkifkt9tDnsYE5ls','LANG128',1,'Yichun','Jiangxi','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIRjqbI7sEf8GDpb03qZ6DBbnstHGF8t7PWnoZojibnmlqT5OV1S9ue8cSndKqjibovnlFztZGDlF6A/0',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-22 11:53:11
