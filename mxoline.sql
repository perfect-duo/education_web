-- MySQL dump 10.13  Distrib 5.5.51, for Win32 (x86)
--
-- Host: localhost    Database: mxonline
-- ------------------------------------------------------
-- Server version	5.5.51

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'me');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (4,1,31),(1,1,32),(2,1,33),(3,1,67);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add 用户信息',6,'add_user_wang'),(17,'Can change 用户信息',6,'change_user_wang'),(18,'Can delete 用户信息',6,'delete_user_wang'),(19,'Can add 轮播图',7,'add_banner'),(20,'Can change 轮播图',7,'change_banner'),(21,'Can delete 轮播图',7,'delete_banner'),(22,'Can add 邮箱验证码',8,'add_emailverifyrecord'),(23,'Can change 邮箱验证码',8,'change_emailverifyrecord'),(24,'Can delete 邮箱验证码',8,'delete_emailverifyrecord'),(25,'Can add 课程',9,'add_course'),(26,'Can change 课程',9,'change_course'),(27,'Can delete 课程',9,'delete_course'),(28,'Can add 课程资源',10,'add_courseresource'),(29,'Can change 课程资源',10,'change_courseresource'),(30,'Can delete 课程资源',10,'delete_courseresource'),(31,'Can add 章节',11,'add_lesson'),(32,'Can change 章节',11,'change_lesson'),(33,'Can delete 章节',11,'delete_lesson'),(34,'Can add 视频',12,'add_video'),(35,'Can change 视频',12,'change_video'),(36,'Can delete 视频',12,'delete_video'),(37,'Can add 课程评论',13,'add_coursecomments'),(38,'Can change 课程评论',13,'change_coursecomments'),(39,'Can delete 课程评论',13,'delete_coursecomments'),(40,'Can add 用户咨询',14,'add_userask'),(41,'Can change 用户咨询',14,'change_userask'),(42,'Can delete 用户咨询',14,'delete_userask'),(43,'Can add 用户学习课程',15,'add_usercourse'),(44,'Can change 用户学习课程',15,'change_usercourse'),(45,'Can delete 用户学习课程',15,'delete_usercourse'),(46,'Can add 用户收藏',16,'add_userfavorite'),(47,'Can change 用户收藏',16,'change_userfavorite'),(48,'Can delete 用户收藏',16,'delete_userfavorite'),(49,'Can add 用户消息',17,'add_usermessage'),(50,'Can change 用户消息',17,'change_usermessage'),(51,'Can delete 用户消息',17,'delete_usermessage'),(52,'Can add 城市',18,'add_citydict'),(53,'Can change 城市',18,'change_citydict'),(54,'Can delete 城市',18,'delete_citydict'),(55,'Can add 课程机构',19,'add_courseorg'),(56,'Can change 课程机构',19,'change_courseorg'),(57,'Can delete 课程机构',19,'delete_courseorg'),(58,'Can add 教师',20,'add_teacher'),(59,'Can change 教师',20,'change_teacher'),(60,'Can delete 教师',20,'delete_teacher'),(61,'Can view log entry',1,'view_logentry'),(62,'Can view group',3,'view_group'),(63,'Can view permission',2,'view_permission'),(64,'Can view content type',4,'view_contenttype'),(65,'Can view 课程',9,'view_course'),(66,'Can view 课程资源',10,'view_courseresource'),(67,'Can view 章节',11,'view_lesson'),(68,'Can view 视频',12,'view_video'),(69,'Can view 课程评论',13,'view_coursecomments'),(70,'Can view 用户咨询',14,'view_userask'),(71,'Can view 用户学习课程',15,'view_usercourse'),(72,'Can view 用户收藏',16,'view_userfavorite'),(73,'Can view 用户消息',17,'view_usermessage'),(74,'Can view 城市',18,'view_citydict'),(75,'Can view 课程机构',19,'view_courseorg'),(76,'Can view 教师',20,'view_teacher'),(77,'Can view session',5,'view_session'),(78,'Can view 轮播图',7,'view_banner'),(79,'Can view 邮箱验证码',8,'view_emailverifyrecord'),(80,'Can view 用户信息',6,'view_user_wang'),(81,'Can add Bookmark',21,'add_bookmark'),(82,'Can change Bookmark',21,'change_bookmark'),(83,'Can delete Bookmark',21,'delete_bookmark'),(84,'Can add User Setting',22,'add_usersettings'),(85,'Can change User Setting',22,'change_usersettings'),(86,'Can delete User Setting',22,'delete_usersettings'),(87,'Can add User Widget',23,'add_userwidget'),(88,'Can change User Widget',23,'change_userwidget'),(89,'Can delete User Widget',23,'delete_userwidget'),(90,'Can add log entry',24,'add_log'),(91,'Can change log entry',24,'change_log'),(92,'Can delete log entry',24,'delete_log'),(93,'Can view Bookmark',21,'view_bookmark'),(94,'Can view log entry',24,'view_log'),(95,'Can view User Setting',22,'view_usersettings'),(96,'Can view User Widget',23,'view_userwidget'),(97,'Can add captcha store',25,'add_captchastore'),(98,'Can change captcha store',25,'change_captchastore'),(99,'Can delete captcha store',25,'delete_captchastore'),(100,'Can view captcha store',25,'view_captchastore'),(101,'Can add 轮播课程',9,'add_bannercourse'),(102,'Can change 轮播课程',9,'change_bannercourse'),(103,'Can delete 轮播课程',9,'delete_bannercourse'),(104,'Can view 轮播课程',26,'view_bannercourse');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (368,'JYXC','jyxc','3c75a71edcb847fb4a21f38bc34396b9778b87d8','2018-08-25 14:43:13'),(370,'LAXA','laxa','0727f62146af7748402d190a715cca3e1f4211e9','2018-08-25 14:43:54'),(371,'EPBK','epbk','0198baed8f72a7cee6bfd6e31e9828f517d053e1','2018-08-25 14:44:52'),(372,'EJWS','ejws','15547db86e957429bbc7ada8f1b338f72ff599e5','2018-08-25 14:45:05'),(374,'BMWR','bmwr','7befdd104ffa8348ca902437c0090dca6f3bb13c','2018-08-25 14:45:37'),(375,'OFPS','ofps','b4161ce8bf1d5bdde8f9a59ac11654da014905ce','2018-08-25 14:45:46'),(377,'NBIK','nbik','1700e178b94b812aa44846de9c51b8ac09d3e8a7','2018-08-25 14:46:08'),(379,'LYWN','lywn','786137ada310363566f564c64353dba1505fc76b','2018-08-25 14:46:35'),(380,'YWDS','ywds','c3e6d9d98691ca269d2c82d56c93824245b58c7c','2018-08-25 15:02:10'),(381,'FDZL','fdzl','4adf3700782c9c0b5beb1c95a48011ca061a2059','2018-08-26 15:15:23'),(382,'QLKT','qlkt','beae6de14a8dc5759636355cf177f9d56450081f','2018-08-26 15:18:44'),(383,'DRFG','drfg','353fa8657d3d92083ec6d9d1f8d0cdd17e1fee71','2018-08-26 15:27:25'),(384,'DFNF','dfnf','a576f7af77f7604f5ed2b944d22d726d7e5b79c2','2018-08-26 15:27:47'),(385,'EZVC','ezvc','a7767463ca9333c47c667f4062ed9985695b3068','2018-08-26 15:28:52'),(386,'ANGG','angg','b187265d7fdee389e4d8e9ea8b54f382dd28ecca','2018-08-26 15:28:53'),(387,'REBB','rebb','650537f9618d5e22ba9c3f5cef2e62058511cb58','2018-08-26 15:28:53'),(388,'ILRG','ilrg','54da5004ac8898db761211c92e76536d4c3f1164','2018-08-26 15:28:53'),(389,'ZHEL','zhel','574bcf0b49899156a470c48aa1a3f6cfb7ae2d63','2018-08-26 15:28:53'),(390,'OKWY','okwy','0bb4b8bb4c921839adf5c3ba2ac81842cef26d3a','2018-08-26 15:28:53'),(391,'DCXO','dcxo','6ad834bbaa11cea0ddfa1fba00426a0ebef0b375','2018-08-26 15:28:54'),(392,'FGUQ','fguq','36aae0d525441510b50bb4cfd406a823ce24ac84','2018-08-26 15:34:02'),(393,'ZSIH','zsih','cc6c6c09b9a7edcf9c5a447d6cadda7c3094e7ec','2018-08-26 15:34:03'),(394,'VOOT','voot','edd901d39cd0bbe192d4ad4ff8d1c40116cde1c9','2019-05-19 10:10:43'),(395,'PAMG','pamg','1d9d31de2e0d964dbb3f57834e2128e4bb9d60b6','2019-07-11 19:16:45'),(396,'KFZY','kfzy','7175fcfbb30d5b8303b897ad4eeac91682adf3d3','2019-07-11 19:16:46'),(397,'GAXK','gaxk','3a78bab96ae31c5c684685b08517b095fb806cfd','2019-07-11 19:16:47');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course`
--

DROP TABLE IF EXISTS `courses_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(2) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `lesson_type` varchar(50) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_course_org_id_4d2c4aab_fk_organizat` (`course_org_id`),
  KEY `courses_course_teacher_id_846fa526_fk_organization_teacher_id` (`teacher_id`),
  CONSTRAINT `courses_course_course_org_id_4d2c4aab_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES (1,'django入门','django入门','<p style=\"text-align: center;\"><img src=\"/images/courseUEditor/image/5b5d88e5000151ec06000338-240-135_20180824182502_740.jpg\" title=\"undefined\" alt=\"5b5d88e5000151ec06000338-240-135.jpg\" width=\"81\" height=\"123\" style=\"width: 81px; height: 123px;\"/> </p><p><img src=\"/images/courseUEditor/image/0df431adcbef76096709930527dda3cc7cd99e2d_20180824182502_387.jpg\" style=\"width: 77px; height: 112px; float: left;\" width=\"77\" height=\"112\"/> </p><p style=\"text-align: right;\"><img src=\"/images/courseUEditor/image/2f738bd4b31c870168f8cf9f257f9e2f0708ff79_20180824182502_353.jpg\" style=\"width: 131px; height: 126px;\" width=\"131\" height=\"126\"/> </p><p><br/> </p><p style=\"text-align: center;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<video class=\"edui-upload-video  vjs-default-skin  video-js\" style=\"float: left\" controls=\"\" preload=\"none\" width=\"362\" height=\"203\" src=\"/images/Michael Jackson - You Are Not Alone (Live Munich 1997)_20180824182114_872.mp4\" data-setup=\"{}\"><source src=\"/images/Michael Jackson - You Are Not Alone (Live Munich 1997)_20180824182114_872.mp4\" type=\"video/mp4\"/></video>&nbsp; &nbsp;&nbsp;</p><p style=\"text-align: center;\">django入门</p>','cj',34,1,8,'courses/2018/08/f8844b3103a4d4c95a19fd79379a34ad.jpg',156,'2018-07-18 10:48:00',1,'后端开发',1,0),(2,'mysql基础','mysql基础','m y s q l ......................................................','cj',0,1,8,'courses/2018/08/f8844b3103a4d4c95a19fd79379a34ad_r62QDE9.jpg',141,'2018-08-04 17:34:00',1,'后端开发',1,0),(3,'数据结构','数据结构','数据结构','cj',0,1,1,'courses/2018/08/024b498c3e98342ee4bb240bfaea0cdb.jpg',4,'2018-08-04 17:54:00',2,'后端开发',1,0),(4,'python基础','。。。。。。。。。。。。。','。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。','cj',1,1002,112,'courses/2018/08/to.jpg',789,'2018-08-07 18:04:00',1,'后端开发',1,1),(5,'java','java入门','Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程 [1]','zj',999,100,99,'courses/2018/08/0df431adcbef76096709930527dda3cc7cd99e2d.jpg',17,'2018-08-07 18:06:00',1,'后端开发',4,0),(6,'PHP','php课程','PHP（外文名:PHP: Hypertext Preprocessor，中文名：“超文本预处理器”）是一种通用开源脚本语言。语法吸收了C语言、Java和Perl的特点，利于学习，使用广泛，主要适用于Web开发领域。PHP 独特的语法混合了C、Java、Perl以及PHP自创的语法。它可以比CGI或者Perl更快速地执行动态网页。用PHP做出的动态页面与其他的编程语言相比，PHP是将程序嵌入到HTML（标准通用标记语言下的一个应用）文档中去执行，执行效率比完全生成HTML标记的CGI要高许多；PHP还可以执行编译后代码，编译可以达到加密和优化代码运行，使代码运行更快。','cj',1,3,2,'courses/2018/08/2f738bd4b31c870168f8cf9f257f9e2f0708ff79.jpg',4,'2018-08-07 18:07:00',1,'后端开发',1,0),(7,'个性化推荐算法实战入门必修课','个性化推荐算法','现如今个性化推荐算法主导的产品越来越多，无论信息流，电商等等场景下个性化推荐算法都起到了非常重要的作用。在此大背景下，结合我多年工业界实战得出的经验。本实战课程前导课程将会给大家讲述工业界推荐算法的大体架构，以及个性化召回算法的几种工业界落地架构。并选取一种相对快速接受的算法协同过滤来从理论公式与代码落地的角度。完成实战个性化推荐算法。最后与大家一同展望未来的实战课程会带给大家哪些精彩。','zj',2,65,56,'courses/2018/08/5b5d88e5000151ec06000338-240-135.jpg',54,'2018-08-12 15:39:00',7,'后端开发',1,0),(8,'私有区块链，我们一起GO','私有区块链，我们一起GO','区块链作为当前火爆的新兴技术被广为关注，本课程将使用Go语言带领大家实现一个区块链私有链','gj',3,54,3,'courses/2018/08/5b4705c90001fc9506000338-240-135.jpg',89,'2018-08-12 15:41:00',2,'后端开发',2,1),(9,'ElasticSearch入门','ElasticSearch入门','：ElasticSearch是一个分布式、可扩展、实时的搜索与数据分析引擎，它能从项目一开始就赋予你的数据以搜索、分析和探索的能力。通过本课程的学习，你可以了解到，ElasticSearch在互联网行业里的火热程度，也可以了解到它的实际应用场景。本课程会通过理论与实践相结合的方式，带领你一步一步走进ElasticSearch的世界，使你轻松掌握ElasticSearch的基本概念，学习ElasticSearch的服务搭建，了解ElasticSearch的常用技巧，并通过案例项目让你拥有实际的应用能力。 老师实战课程已经上线：http://coding.imooc.com/class/167.html ElasticSearch+MySQL+Kafka强力组合，更有ES结合百度地图，Nginx等高级应用。','gj',65,56,555,'courses/2018/08/59b77bac0001985906000338-240-135.jpg',667,'2018-08-12 15:43:00',6,'后端开发',1,1),(10,'c++','c++','c++','cj',0,0,0,'courses/2018/08/024b498c3e98342ee4bb240bfaea0cdb_pWQY6S9.jpg',0,'2018-08-23 18:41:00',1,'后端开发',1,0),(12,'c','c','c','cj',12,100,1,'courses/2018/08/de8bbe165250ce8a03e5293c22a078f4_83b4RZX.jpg',0,'2018-08-24 12:16:00',1,'后端开发',1,0),(13,'ddd','dd','<p>&nbsp; &nbsp; dd</p>','cj',0,0,0,'courses/2018/08/2f738bd4b31c870168f8cf9f257f9e2f0708ff79_AFVjaX9.jpg',1,'2018-08-24 16:56:00',1,'后端开发',1,0);
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_courseresource`
--

DROP TABLE IF EXISTS `courses_courseresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_courseresource`
--

LOCK TABLES `courses_courseresource` WRITE;
/*!40000 ALTER TABLE `courses_courseresource` DISABLE KEYS */;
INSERT INTO `courses_courseresource` VALUES (1,'王','course/resource/2018/08/16移动一班1615925402-王梦多.zip','2018-08-14 08:56:00',1);
/*!40000 ALTER TABLE `courses_courseresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_lesson`
--

DROP TABLE IF EXISTS `courses_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `add_time` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  KEY `indexname` (`name`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_lesson`
--

LOCK TABLES `courses_lesson` WRITE;
/*!40000 ALTER TABLE `courses_lesson` DISABLE KEYS */;
INSERT INTO `courses_lesson` VALUES (1,'第一节','2018-07-18 11:01:00',1),(2,'第二节','2018-07-18 11:14:00',1),(3,'mysql语句','2018-08-13 17:01:00',2),(5,'%ee11','2019-06-26 11:10:19',2),(6,'牛露苗','2019-06-26 11:10:34',6),(8,'王','2019-06-26 11:10:54',6),(9,'王梦多','2019-06-26 12:36:33',8),(10,'1梦2','2019-06-26 12:37:09',10),(11,'牛','2019-06-26 12:37:09',6);
/*!40000 ALTER TABLE `courses_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_video`
--

DROP TABLE IF EXISTS `courses_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `add_time` datetime NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_video`
--

LOCK TABLES `courses_video` WRITE;
/*!40000 ALTER TABLE `courses_video` DISABLE KEYS */;
INSERT INTO `courses_video` VALUES (1,'第一步','2018-08-13 17:05:00',1),(2,'第二步','2018-08-13 17:06:00',1),(3,'第三步','2018-08-13 17:06:00',2),(4,'第四步','2018-08-13 17:06:00',2);
/*!40000 ALTER TABLE `courses_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_user_wang_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_wang_id` FOREIGN KEY (`user_id`) REFERENCES `users_user_wang` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(25,'captcha','captchastore'),(4,'contenttypes','contenttype'),(26,'courses','bannercourse'),(9,'courses','course'),(10,'courses','courseresource'),(11,'courses','lesson'),(12,'courses','video'),(13,'operation','coursecomments'),(14,'operation','userask'),(15,'operation','usercourse'),(16,'operation','userfavorite'),(17,'operation','usermessage'),(18,'organization','citydict'),(19,'organization','courseorg'),(20,'organization','teacher'),(5,'sessions','session'),(7,'users','banner'),(8,'users','emailverifyrecord'),(6,'users','user_wang'),(21,'xadmin','bookmark'),(24,'xadmin','log'),(22,'xadmin','usersettings'),(23,'xadmin','userwidget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-07-17 03:29:59'),(2,'contenttypes','0002_remove_content_type_name','2018-07-17 03:29:59'),(3,'auth','0001_initial','2018-07-17 03:30:00'),(4,'auth','0002_alter_permission_name_max_length','2018-07-17 03:30:01'),(5,'auth','0003_alter_user_email_max_length','2018-07-17 03:30:01'),(6,'auth','0004_alter_user_username_opts','2018-07-17 03:30:01'),(7,'auth','0005_alter_user_last_login_null','2018-07-17 03:30:01'),(8,'auth','0006_require_contenttypes_0002','2018-07-17 03:30:01'),(9,'auth','0007_alter_validators_add_error_messages','2018-07-17 03:30:01'),(10,'auth','0008_alter_user_username_max_length','2018-07-17 03:30:01'),(11,'auth','0009_alter_user_last_name_max_length','2018-07-17 03:30:01'),(12,'users','0001_initial','2018-07-17 03:30:02'),(13,'admin','0001_initial','2018-07-17 03:30:02'),(14,'admin','0002_logentry_remove_auto_add','2018-07-17 03:30:02'),(15,'courses','0001_initial','2018-07-17 03:30:03'),(16,'operation','0001_initial','2018-07-17 03:30:04'),(17,'operation','0002_auto_20180717_1129','2018-07-17 03:30:05'),(18,'organization','0001_initial','2018-07-17 03:30:06'),(19,'sessions','0001_initial','2018-07-17 03:30:06'),(20,'users','0002_auto_20180717_1401','2018-07-17 06:02:15'),(21,'xadmin','0001_initial','2018-07-17 09:09:00'),(22,'xadmin','0002_log','2018-07-17 09:09:00'),(23,'xadmin','0003_auto_20160715_0100','2018-07-17 09:09:00'),(24,'captcha','0001_initial','2018-07-22 05:22:36'),(25,'courses','0002_auto_20180722_1322','2018-07-22 05:22:36'),(26,'organization','0002_courseorg_category','2018-07-24 09:37:31'),(27,'organization','0003_auto_20180728_1557','2018-07-28 07:57:43'),(28,'courses','0003_course_course_org','2018-08-04 07:54:08'),(29,'organization','0004_teacher_teacher_image','2018-08-06 08:57:20'),(30,'organization','0005_auto_20180806_1701','2018-08-06 09:01:27'),(31,'organization','0006_auto_20180806_1708','2018-08-06 09:08:11'),(32,'courses','0004_auto_20180806_1718','2018-08-06 09:18:47'),(33,'organization','0007_teacher_teacher_courses','2018-08-08 06:33:03'),(34,'courses','0005_course_lesson_type','2018-08-13 04:22:56'),(35,'users','0003_auto_20180813_1244','2018-08-13 04:44:46'),(36,'users','0004_auto_20180813_1245','2018-08-13 04:46:00'),(37,'operation','0003_auto_20180813_1326','2018-08-13 05:26:29'),(38,'courses','0006_course_teacher','2018-08-14 09:11:46'),(39,'users','0005_auto_20180819_1622','2018-08-19 16:22:23'),(40,'operation','0004_auto_20180821_1232','2018-08-21 12:32:48'),(41,'users','0006_auto_20180821_1359','2018-08-21 13:59:45'),(42,'users','0007_auto_20180821_1401','2018-08-21 14:01:15'),(43,'courses','0007_course_is_banner','2018-08-21 15:48:06'),(44,'courses','0008_auto_20190401_1518','2019-04-01 15:18:26');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1238e0h3jo39v0f2036mlhotbmvmtzrh','MGM1MTA2MDEyMjE0ZDY1ZTgyNzNhMDdjNDY0ZmFjNTk2ZjFiNjQzMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tc0JhY2tlbmRzIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWY3YWYzMDFiZWE5OWQ5NDEyYzMyMDk4MDc3YmMzNGVhNWQ1ZDAyZiJ9','2018-08-23 09:11:21'),('2gp0uuy4h5cpsgevzjluyjz4o29bikkp','YWU0NjQzNDg2NWUzMjY3MWFmZWNjMmQzNTE5MmZhN2E3NjVkNzlmYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tc0JhY2tlbmRzIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGU5ZWYxMzhmNmM1M2M0NDg1MzYzYzM1NmVkYzc4ZmIzMTA4YzMyOSJ9','2018-09-02 15:56:39'),('2kmdqabff4alrtcmfv69o3ovybf23v0i','YWU0NjQzNDg2NWUzMjY3MWFmZWNjMmQzNTE5MmZhN2E3NjVkNzlmYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tc0JhY2tlbmRzIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGU5ZWYxMzhmNmM1M2M0NDg1MzYzYzM1NmVkYzc4ZmIzMTA4YzMyOSJ9','2018-09-05 13:37:20'),('6crmjnfv4ua2w0a2w7a0jz30b6iyiku1','YmYyZTU4NjQyNzg0Y2Q3M2U2ZDMwNzE0OGQxMzY4N2FmNTc4MzFiOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tc0JhY2tlbmRzIiwiX2F1dGhfdXNlcl9oYXNoIjoiOGVjOTg3YWY5OTIyNWVlNzgzOGM2NTVjZGNjMzFkM2Q2M2I0NWNjYyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9','2018-08-25 12:42:33'),('7e2qkj281rgimwe45m53otblppcr5cxj','ODdlNGVlMDNjYzgyYzBiODE1Y2U5MTg0NzhiNzM1NjNmYWM0ZWE0Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tc0JhY2tlbmRzIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWY3YWYzMDFiZWE5OWQ5NDEyYzMyMDk4MDc3YmMzNGVhNWQ1ZDAyZiIsIkxJU1RfUVVFUlkiOltbIm9yZ2FuaXphdGlvbiIsInRlYWNoZXIiXSwiIl19','2018-08-18 10:11:43'),('8fkzrilaeavaph1cpdsqhnryn9ogosho','ZTZhOTE5Y2ZmZjM0NDE0ODMyYjEwZmIyOWIwZTE4ZjllYmM3YWRkZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tc0JhY2tlbmRzIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWY3YWYzMDFiZWE5OWQ5NDEyYzMyMDk4MDc3YmMzNGVhNWQ1ZDAyZiIsIkxJU1RfUVVFUlkiOltbImNvdXJzZXMiLCJjb3Vyc2UiXSwiIl19','2018-08-20 09:19:15'),('bzou3zlxm37mcgt8vih75pn6newxwld9','MGM1MTA2MDEyMjE0ZDY1ZTgyNzNhMDdjNDY0ZmFjNTk2ZjFiNjQzMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tc0JhY2tlbmRzIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWY3YWYzMDFiZWE5OWQ5NDEyYzMyMDk4MDc3YmMzNGVhNWQ1ZDAyZiJ9','2018-09-01 17:10:59'),('fg4dfibxdftx767ztvzzsq8afzkahal9','YmYyZTU4NjQyNzg0Y2Q3M2U2ZDMwNzE0OGQxMzY4N2FmNTc4MzFiOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tc0JhY2tlbmRzIiwiX2F1dGhfdXNlcl9oYXNoIjoiOGVjOTg3YWY5OTIyNWVlNzgzOGM2NTVjZGNjMzFkM2Q2M2I0NWNjYyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9','2018-08-25 12:40:33'),('hvgieyenfm28eoi44nb1faty5cq5per3','NGQ2YjQ3MzVjMDIyNTg3NDA4ODgyNjg1MzZiYmVkMjMyMjc2NDdmYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tc0JhY2tlbmRzIiwiX2F1dGhfdXNlcl9oYXNoIjoiOGVjOTg3YWY5OTIyNWVlNzgzOGM2NTVjZGNjMzFkM2Q2M2I0NWNjYyIsIkxJU1RfUVVFUlkiOltbImNvdXJzZXMiLCJjb3Vyc2UiXSwiIl19','2018-09-09 15:06:39'),('ppco2sza18wzoqim40ain89kdr9gtgys','NjhmMGE3MTE3MWM5MjFhNjU5MzMxNmYxNTllYWIzOTg3ZGE2MTc3Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tc0JhY2tlbmRzIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWY3YWYzMDFiZWE5OWQ5NDEyYzMyMDk4MDc3YmMzNGVhNWQ1ZDAyZiIsIkxJU1RfUVVFUlkiOltbImNvdXJzZXMiLCJsZXNzb24iXSwiIl19','2018-08-21 10:48:42'),('uemlluxct1hxksgxcdxir6du7ezrn6pw','YjU1N2Y2NjU1Mjg1OWRhN2E4MjE2Yzk5YTFhNDA2ZTIxMTViMjVjODp7Il9hdXRoX3VzZXJfaWQiOiIyMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbXNCYWNrZW5kcyIsIl9hdXRoX3VzZXJfaGFzaCI6IjM5Mjg2OWIyMzFjZTM3OTZhM2Q4YzY5Zjk2MjcxZTdlZjcwM2M4MzkiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdfQ==','2019-04-15 15:28:03'),('vrycz78k01a5g1cptk7yrmgay1xi6ret','YWU0NjQzNDg2NWUzMjY3MWFmZWNjMmQzNTE5MmZhN2E3NjVkNzlmYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tc0JhY2tlbmRzIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGU5ZWYxMzhmNmM1M2M0NDg1MzYzYzM1NmVkYzc4ZmIzMTA4YzMyOSJ9','2018-09-02 18:29:37');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_coursecomments`
--

DROP TABLE IF EXISTS `operation_coursecomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomments_user_id_f5ff70b3_fk_users_user_wang_id` (`user_id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_coursecomments_user_id_f5ff70b3_fk_users_user_wang_id` FOREIGN KEY (`user_id`) REFERENCES `users_user_wang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_coursecomments`
--

LOCK TABLES `operation_coursecomments` WRITE;
/*!40000 ALTER TABLE `operation_coursecomments` DISABLE KEYS */;
INSERT INTO `operation_coursecomments` VALUES (1,'老师这门课讲的very good','2018-08-14 12:13:00',1,1),(2,'菜','2018-08-14 12:13:00',1,4),(3,'perfect','2018-08-14 12:14:00',1,3),(4,'feichanghao','2018-08-14 14:00:46',1,1),(5,'nishiyigedahuanda','2018-08-14 14:28:30',1,1);
/*!40000 ALTER TABLE `operation_coursecomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userask`
--

DROP TABLE IF EXISTS `operation_userask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userask`
--

LOCK TABLES `operation_userask` WRITE;
/*!40000 ALTER TABLE `operation_userask` DISABLE KEYS */;
INSERT INTO `operation_userask` VALUES (1,'wew','123456','rewrew','2018-08-04 12:41:38'),(3,'wew','123456','rewrew','2018-08-04 12:41:39'),(4,'wew','123456','rewrew','2018-08-04 12:41:40'),(5,'wew','123456','rewrew','2018-08-04 12:41:42'),(6,'wew','123456','rewrew','2018-08-04 12:41:42'),(7,'wew','123456','rewrew','2018-08-04 12:41:42'),(8,'wew','123456','rewrew','2018-08-04 12:41:42'),(25,'王','15836572803','django','2018-08-04 15:28:00'),(26,'第一节','15836572803','django','2018-08-18 18:43:39');
/*!40000 ALTER TABLE `operation_userask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usercourse`
--

DROP TABLE IF EXISTS `operation_usercourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_user_wang_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_user_wang_id` FOREIGN KEY (`user_id`) REFERENCES `users_user_wang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usercourse`
--

LOCK TABLES `operation_usercourse` WRITE;
/*!40000 ALTER TABLE `operation_usercourse` DISABLE KEYS */;
INSERT INTO `operation_usercourse` VALUES (3,'2018-08-13 17:55:23',1,1),(4,'2018-08-14 08:54:50',5,1),(5,'2018-08-14 09:30:23',2,1),(6,'2018-08-15 15:17:00',3,1),(7,'2018-08-15 15:17:20',4,1),(8,'2018-08-15 15:34:30',1,3),(9,'2018-08-15 15:34:38',6,3),(10,'2018-08-15 15:34:50',8,3),(11,'2018-08-15 15:38:29',4,3),(12,'2018-08-15 16:10:03',6,4),(13,'2018-08-15 16:10:17',9,4);
/*!40000 ALTER TABLE `operation_usercourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userfavorite`
--

DROP TABLE IF EXISTS `operation_userfavorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_user_wang_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_user_wang_id` FOREIGN KEY (`user_id`) REFERENCES `users_user_wang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userfavorite`
--

LOCK TABLES `operation_userfavorite` WRITE;
/*!40000 ALTER TABLE `operation_userfavorite` DISABLE KEYS */;
INSERT INTO `operation_userfavorite` VALUES (17,4,2,'2018-08-14 10:30:01',1),(18,1,3,'2018-08-16 17:12:32',1),(25,1,1,'2018-08-20 18:33:58',1),(27,1,2,'2018-08-25 12:24:41',1);
/*!40000 ALTER TABLE `operation_userfavorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usermessage`
--

DROP TABLE IF EXISTS `operation_usermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usermessage_user_id_716f8b9d` (`user_id`),
  CONSTRAINT `operation_usermessage_user_id_716f8b9d_fk_users_user_wang_id` FOREIGN KEY (`user_id`) REFERENCES `users_user_wang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usermessage`
--

LOCK TABLES `operation_usermessage` WRITE;
/*!40000 ALTER TABLE `operation_usermessage` DISABLE KEYS */;
INSERT INTO `operation_usermessage` VALUES (1,1,'欢迎来到我们这个大家庭',1,'2018-08-21 12:32:00'),(2,1,'你是否可好',1,'2018-08-21 12:49:00'),(3,20,'欢迎加入我们的大家庭',0,'2018-08-21 12:58:55'),(4,21,'欢迎加入我们的大家庭',0,'2018-08-21 13:02:16'),(5,22,'欢迎加入我们的大家庭',0,'2018-08-21 17:28:55');
/*!40000 ALTER TABLE `operation_usermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_citydict`
--

DROP TABLE IF EXISTS `organization_citydict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `desc` longtext NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_citydict`
--

LOCK TABLES `organization_citydict` WRITE;
/*!40000 ALTER TABLE `organization_citydict` DISABLE KEYS */;
INSERT INTO `organization_citydict` VALUES (1,'河南省','河南，古称中原、中州、豫州，简称“豫”，因历史上大部分位于黄河以南，故名河南。河南位于中国中东部、黄河中下游。','2018-07-24 16:58:00'),(2,'北京市','北京，简称“京”，是中华人民共和国的首都、直辖市、国家中心城市、超大城市、国际大都市，全国政治中心、文化中心、国际交往中心、科技创新中心，是中国共产党中央委员会、中华人民共和国中央人民政府、全国人民代表大会、中国人民政治协商会议全国委员会、中华人民共和国中央军事委员会所在地，也是中部战区司令部驻地。\r\n北京位于华北平原北部，背靠燕山，毗邻天津市和河北省。北京的气候为典型的北温带半湿润大陆性季风气候。','2018-07-24 16:59:00'),(3,'上海市','上海，简称“沪”或“申”，是中国共产党的诞生地，中华人民共和国直辖市，国家中心城市，超大城市，沪杭甬大湾区核心城市，国际经济、金融、贸易、航运、科技创新中心 [1-2]  ，首批沿海开放城市。上海地处长江入海口，是长江经济带的龙头城市、G60科创走廊核心城市。隔东中国海与日本九州岛相望，南濒杭州湾，北、西与江苏、浙江两省相接。','2018-07-24 17:00:00'),(4,'深圳市','深圳，简称“深”，别称“鹏城”，是中国四大一线城市之一，广东省省辖市、计划单列市、副省级市、国家区域中心城市、超大城市，国务院定位的全国经济中心城市和国际化城市、国家创新型城市、国际科技产业创新中心、全球海洋中心城市、国际性综合交通枢纽，中国三大全国性金融中心之一','2018-07-24 17:01:00'),(5,'广东省','广东，名由岭南东道、广南东路演变而来，简称“粤”，省会广州，是中国大陆南端沿海的一个省份。位于南岭以南，南海之滨，与香港、澳门、广西、湖南、江西及福建接壤，与海南隔海相望。下辖21个地级市（其中2个副省级城市），119个县级行政区（60个市辖区、20个县级市、36个县、3个自治县）','2018-07-24 17:01:00'),(6,'浙江省','浙江，简称“浙”，省会杭州。境内最大的河流钱塘江，因江流曲折，称之江、折江，又称浙江，省以江名。\r\n地处中国东南沿海长江三角洲南翼，东临东海，南接福建，西与安徽、江西相连，北与上海、江苏接壤。浙江省东西和南北的直线距离均为450公里左右。据全国第二次土地调查结果，浙江土地面积10.55万平方公里，为全国的1.1%，是中国面积较小的省份之一。','2018-07-24 17:03:00');
/*!40000 ALTER TABLE `organization_citydict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_courseorg`
--

DROP TABLE IF EXISTS `organization_courseorg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `desc` longtext NOT NULL,
  `click` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `add_time` datetime NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(5) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_courseo_city_id_4a842f85_fk_organizat` (`city_id`),
  CONSTRAINT `organization_courseo_city_id_4a842f85_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_courseorg`
--

LOCK TABLES `organization_courseorg` WRITE;
/*!40000 ALTER TABLE `organization_courseorg` DISABLE KEYS */;
INSERT INTO `organization_courseorg` VALUES (1,'慕课网','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。',0,3,'org/2018/08/timg_1.jpg','河南省禹州市方岗乡','2018-07-24 17:15:00',1,'pxjg',8,0),(2,'极客学院','极客学院 [1]  是中国android开发在线学习平台，汇集了几十名国内顶尖的有多年项目和实战经验的Android开发授课大师，精心制作了上千个高质量视频教程，涵盖了Android开发学习的基础入门、中级进阶，高级提升、项目实战开发等专业的android开发课程。\r\n极客学院 [2]  背后是一支疯狂喜欢编程，狂热开发移动app的超有活力团队。他们希望通过最新的，高质量的，专业实战的在线开发课程打破传统的编程学习模式，以新一代的编程学习模式帮助开发者更快更好的学习Android开发，帮助开发者通过技术实现自己的理想。',0,0,'org/2018/07/de8bbe165250ce8a03e5293c22a078f4.jpg','北京市','2018-07-24 17:18:00',2,'pxjg',2,0),(3,'github','gitHub是一个面向开源及私有软件项目的托管平台，因为只支持git 作为唯一的版本库格式进行托管，故名gitHub。\r\ngitHub于2008年4月10日正式上线，除了git代码仓库托管及基本的 Web管理界面以外，还提供了订阅、讨论组、文本渲染、在线文件编辑器、协作图谱（报表）、代码片段分享（Gist）等功能。目前，其注册用户已经超过350万，托管版本数量也是非常之多，其中不乏知名开源项目 Ruby on Rails、jQuery、python 等。',0,0,'org/2018/07/d4628535e5dde7119c3d076aabefce1b9c1661ba.jpg','上海市','2018-07-24 17:19:00',3,'pxjg',4,0),(4,'网易课堂','网易云课堂，是网易公司打造的在线实用技能学习平台，该平台于2012年12月底正式上线，主要为学习者提供海量、优质的课程，用户可以根据自身的学习程度，自主安排学习进度。',0,0,'org/2018/07/a6efce1b9d16fdfa483d6d7ebe8f8c5495ee7bc9.jpg','深圳市','2018-07-24 17:21:00',4,'gx',1,1),(5,'腾讯课堂','腾讯课堂是腾讯推出的专业在线教育平台，聚合大量优质教育机构和名师，下设职业培训、公务员考试、托福雅思、考证考级、英语口语、中小学教育等众多在线学习精品课程，打造老师在线上课教学、学生及时互动学习的课堂。',0,0,'org/2018/07/622762d0f703918f2eb19d635a3d269759eec433.jpg','浙江省','2018-07-24 17:23:00',6,'pxjg',2,0),(6,'阿里云','阿里云，阿里巴巴集团旗下云计算品牌，全球卓越的云计算技术和服务提供商。创立于2009年，在杭州、北京、硅谷等地设有研发中心和运营机构',0,0,'org/2018/07/b0255783b53ae85b699282d472925e34_222_222.jpg','北京市','2018-07-24 17:26:00',2,'pxjg',3,0),(7,'千峰教育','千锋教育致力于打造IT教育全产业链人才服务平台，采用全程面授高品质、高成本培养模式，教学大纲紧跟企业需求， 拥有全国一体化就业保障服务，千锋价值观“做真实的自己，用良心做教育”。',0,0,'org/2018/07/3993b2cdde2918ca1efb2368a212e324_222_222.jpg','上海市','2018-07-24 17:27:00',3,'pxjg',0,1),(8,'王梦多','王梦多',0,1,'org/2018/07/f8844b3103a4d4c95a19fd79379a34ad.jpg','河南省','2018-07-27 15:57:00',1,'gr',0,0),(9,'未知','未知',0,1,'org/2018/07/f8844b3103a4d4c95a19fd79379a34ad_7k61Yin.jpg','上海市','2018-07-27 15:59:00',3,'gr',0,2);
/*!40000 ALTER TABLE `organization_courseorg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_teacher`
--

DROP TABLE IF EXISTS `organization_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `org_id` int(11) NOT NULL,
  `teacher_image` varchar(100) NOT NULL,
  `teacher_courses` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teacher_org_id_cd000a1a_fk_organizat` (`org_id`),
  CONSTRAINT `organization_teacher_org_id_cd000a1a_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_teacher`
--

LOCK TABLES `organization_teacher` WRITE;
/*!40000 ALTER TABLE `organization_teacher` DISABLE KEYS */;
INSERT INTO `organization_teacher` VALUES (1,'王梦多',8,'XXXX科技公司','XXX','风趣幽默',1,3,'2018-08-04 15:36:00',1,'/teacher/2018/07/to.jpg',0),(2,'张三',0,'XXXX科技公司','XXX','风趣幽默',0,5,'2018-08-06 17:08:00',1,'teacher/2018/07/to.jpg',0),(3,'李四',7,'XXXX科技公司','XXX','风趣幽默',7,9,'2018-08-16 13:41:00',5,'teacher/2018/08/024b498c3e98342ee4bb240bfaea0cdb.jpg',7),(4,'王五',7,'XXXX科技公司','XXX','风趣幽默',9,3,'2018-08-16 13:41:00',7,'teacher/2018/08/to.jpg',9);
/*!40000 ALTER TABLE `organization_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_banner`
--

DROP TABLE IF EXISTS `users_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_banner`
--

LOCK TABLES `users_banner` WRITE;
/*!40000 ALTER TABLE `users_banner` DISABLE KEYS */;
INSERT INTO `users_banner` VALUES (2,'beautiful','banner/2018/08/timg_2caixe2.jpg','http://www.baidu.com',1,'2018-08-21 16:07:00'),(3,'beautiful','banner/2018/08/timg_1_dx6cC2u.jpg','http://www.baidu.com',2,'2018-08-21 16:08:00'),(4,'beautiful','banner/2018/08/timg_2.jpg','http://www.baidu.com',3,'2018-08-21 16:12:00'),(5,'beautiful','banner/2018/08/timg_4_EFQ3Pe8.jpg','http://www.baidu.com',4,'2018-08-21 16:13:00');
/*!40000 ALTER TABLE `users_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_emailverifyrecord`
--

DROP TABLE IF EXISTS `users_emailverifyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(15) NOT NULL,
  `send_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_emailverifyrecord`
--

LOCK TABLES `users_emailverifyrecord` WRITE;
/*!40000 ALTER TABLE `users_emailverifyrecord` DISABLE KEYS */;
INSERT INTO `users_emailverifyrecord` VALUES (2,'admin','XXX@qq.com','register','2018-07-17 18:41:00'),(3,'王梦多','123@qq.com','forget','2018-07-17 18:50:00'),(7,'K9sYY1LM','1449907540@qq.com','forget','2018-07-23 18:43:40'),(8,'we1LCaTg','1449907540@qq.com','forget','2018-07-24 12:02:11'),(9,'w5BE26sT','1449907540@qq.com','forget','2018-07-24 12:04:32'),(10,'LLNVE','1449907540@qq.com','update_email','2018-08-19 16:22:40'),(11,'OMJZU','1449907540@qq.com','update_email','2018-08-19 16:27:56'),(12,'VKHQM','1449907540@qq.com','update_email','2018-08-19 16:28:12'),(13,'UVWHD','1449907540@qq.com','update_email','2018-08-19 16:28:14'),(14,'RUNZH','1449907540@qq.com','update_email','2018-08-19 16:28:15'),(15,'WLVIP','1449907540@qq.com','update_email','2018-08-19 16:28:17'),(16,'YSXPE','1449907540@qq.com','update_email','2018-08-19 16:28:18'),(17,'YAARP','1449907540@qq.com','update_email','2018-08-19 16:28:19'),(18,'AQWVB','1449907540@qq.com','update_email','2018-08-19 16:28:24'),(19,'HSWFY','1449907540@qq.com','update_email','2018-08-19 17:34:19'),(20,'RBDBZ','15836572803@qq.com','update_email','2018-08-19 17:35:29'),(21,'DbFJ1exl','1449907540@qq.com','register','2018-08-19 17:39:27'),(22,'OHBajDMz','1449907540@qq.com','forget','2018-08-19 17:47:36'),(23,'APRCA','1449907540@qq.com','update_email','2018-08-19 17:50:41'),(24,'IQQOB','1449907540@qq.com','update_email','2018-08-19 17:53:54'),(25,'LKTFV','1449907540@qq.com','update_email','2018-08-19 17:57:42'),(26,'DDYDQ','1449907540@qq.com','update_email','2018-08-19 17:59:00'),(27,'YRDKJ','1449907540@qq.com','update_email','2018-08-19 18:07:09'),(28,'LGCSU','15836572803@qq.com','update_email','2018-08-19 18:12:33'),(29,'RPKWM','15836572803@163.com','update_email','2018-08-19 18:13:01'),(30,'LELTO','1449907540@qq.com','update_email','2018-08-19 18:13:30'),(31,'ZZCRS','1449907540@qq.com','update_email','2018-08-19 18:14:14'),(32,'DPHFO','1449907540@qq.com','update_email','2018-08-19 18:16:31'),(33,'u5xoFXou','1449907540@qq.com','register','2018-08-19 18:22:55'),(34,'XEYTL','1449907540@qq.com','update_email','2018-08-19 18:25:49'),(35,'CNYUP','1449907540@qq.com','update_email','2018-08-19 18:26:14'),(36,'CQYYX','1449907540@qq.com','update_email','2018-08-19 18:26:44'),(37,'JB9CG11w','1449907540@qq.com','register','2018-08-19 18:27:26'),(38,'HOEGC','1449907540@qq.com','update_email','2018-08-19 18:30:10'),(39,'XPLME','1449907540@qq.com','update_email','2018-08-19 18:31:49'),(40,'CCZYV','1449907540@qq.com','update_email','2018-08-19 18:32:21'),(41,'QOUNG','1449907540@qq.com','update_email','2018-08-19 18:32:55'),(42,'DUOXJ','1449907540@qq.com','update_email','2018-08-19 18:33:57'),(43,'NHKWM','1449907540@qq.com','update_email','2018-08-19 18:35:49'),(44,'OIWQR','1449907540@qq.com','update_email','2018-08-19 18:36:32'),(45,'KCBBO','1449907540@qq.com','update_email','2018-08-19 18:39:23'),(46,'OFLPF','1449907540@qq.com','update_email','2018-08-19 18:45:26'),(47,'XDKPY','1449907540@qq.com','update_email','2018-08-20 12:01:10'),(48,'MBLGB','1449907540@qq.com','update_email','2018-08-20 12:04:38'),(49,'PNXLB','1449907540@qq.com','update_email','2018-08-20 12:06:33'),(50,'DOMPY','1449907540@qq.com','update_email','2018-08-20 12:07:07'),(51,'LPPHH','1449907540@qq.com','update_email','2018-08-20 12:07:34'),(52,'Bm7V0ehL','15836572803@163.com','register','2018-08-21 12:58:51'),(53,'z68mRctt','1449907540@qq.com','register','2018-08-21 13:02:13'),(54,'1IzK9aBA','1449907540@qq.com','forget','2018-08-21 13:36:48'),(55,'wEh1Vz4H','1449907540@qq.com','forget','2018-08-21 13:40:35'),(56,'HPTFPfQO','1449907540@qq.com','forget','2018-08-21 13:44:18'),(57,'QEBVC','1449907540@qq.com','update_email','2018-08-21 13:47:56'),(58,'RZ7eO7dq','1449907540@qq.com','forget','2018-08-21 13:51:22'),(59,'00p6E8Pl','1449907540@qq.com','forget','2018-08-21 13:52:22'),(60,'9lgvvl3h','1449907540@qq.com','forget','2018-08-21 13:53:13'),(61,'QWztv7sk','1449907540@qq.com','forget','2018-08-21 13:54:41'),(62,'fQNnhmA1','1449907540@qq.com','forget','2018-08-21 13:55:47'),(63,'tJykrYhN','110@3.com','register','2018-08-21 17:28:52');
/*!40000 ALTER TABLE `users_emailverifyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_wang`
--

DROP TABLE IF EXISTS `users_user_wang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user_wang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `address` varchar(50) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_wang`
--

LOCK TABLES `users_user_wang` WRITE;
/*!40000 ALTER TABLE `users_user_wang` DISABLE KEYS */;
INSERT INTO `users_user_wang` VALUES (1,'pbkdf2_sha256$100000$D1e7rnKaAaI4$GvlkBFfRXssZ56YeDvfxj57EsnqxKn+OHnHbBiyhDM8=','2019-05-09 09:02:53',1,'django','','','1449907540@qq.com',1,1,'2018-07-17 09:14:00','duo','2018-07-09','male','河南省','112','images/2018/08/5b4705c90001fc9506000338-240-135_QHuGO2O.jpg'),(3,'pbkdf2_sha256$100000$UBYQuuoVefcX$5yY67wJXfebKiQaA1EQi0kb7dJIE/+zu99A+LoD5qT8=','2018-08-15 15:37:42',0,'wang','','','1449940@qq.c',0,1,'2018-07-21 02:42:00','wa',NULL,'male','河南省',NULL,'images/2018/08/59b77bac0001985906000338-240-135.jpg'),(4,'pbkdf2_sha256$100000$j8PTlS5XN2KT$p1Og0kFu8oghgaO+8HSLgTKXGOjIypS8kSVpuYTwcz8=','2018-08-23 14:56:00',0,'meng','牛','牛','1444@qq.com',1,1,'2018-07-21 03:05:00','小王','2018-08-23','female','河南省','15836572803','images/2018/08/2f738bd4b31c870168f8cf9f257f9e2f0708ff79_pXKNNl6.jpg'),(20,'pbkdf2_sha256$100000$91dWA0AfxqhN$pvLsvoe1t+OanuGrKx4NIzTdhGKt8CsvgFU4s4MhcNc=',NULL,0,'15836572803@163.com','','','15836572803@163.com',0,0,'2018-08-21 12:58:51','',NULL,'female','','','images/default.png'),(21,'pbkdf2_sha256$100000$Zv7aknAxj1Qd$ZCITOQpqqLzit5n57A9nzxH1BmkkywBU+ScBpX/YX9o=','2018-08-21 14:02:15',0,'1449907540@qq.com','','','1449907540@qq.com',0,1,'2018-08-21 13:02:00','小王','2018-08-20','female','he','空','images/2018/08/f8844b3103a4d4c95a19fd79379a34ad.jpg'),(22,'pbkdf2_sha256$100000$ZYA0tEoOS65K$a97IhDxPaShX7B2huuZCc+bXt1yt6jQ60r04ZfhIcL8=',NULL,0,'110@3.com','','','110@3.com',0,0,'2018-08-21 17:28:52','','2018-08-21','female','','','images/to.png'),(23,'pbkdf2_sha256$100000$mzETONv6B1sm$QXASqU7ni+5S30oIJizImYU/yGTOI1MfeOy1wjBTuo0=','2019-04-01 15:27:07',1,'wangmengduo','','','149907540@qq.com',1,1,'2019-04-01 15:26:46','','2019-04-01','female','','','images/to.png'),(24,'pbkdf2_sha256$100000$LWK2PGNsWLwf$j8BwuXRWwqUEU9Lympnkb7XdKmQu8nyrtrLJCLrSfd0=',NULL,1,'123456789','','','',1,1,'2019-05-09 09:42:39','','2019-05-09','female','','','images/to.png'),(25,'pbkdf2_sha256$100000$aUGz43WVlNad$aG+CWXWnxI3rceprCcnROz94mg0hTNaS9heyAR60GqE=',NULL,1,'admin123','','','',1,1,'2019-05-09 09:46:09','','2019-05-09','female','','','images/to.png'),(26,'pbkdf2_sha256$100000$v5XdkLdjFbbN$z5zn3q4XaRAeSHW3FhvchMfMzJ1cmRIdN4GvJI/16k8=',NULL,1,'admin1234','','','1111@ww.com',1,1,'2019-05-19 10:10:23','','2019-05-19','female','','','images/to.png'),(27,'pbkdf2_sha256$100000$4u4B9PtbnUNy$JB922a8PYkGts4Efcu1iWhkxsZk4wfIXQJ7FRRCtKEQ=',NULL,1,'ngst123456789','','','1449907540@qq.com',1,1,'2019-07-11 21:40:43','','2019-07-11','female','','','images/to.png');
/*!40000 ALTER TABLE `users_user_wang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_wang_groups`
--

DROP TABLE IF EXISTS `users_user_wang_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user_wang_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_wang_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_wang_groups_user_wang_id_group_id_bb0c66fd_uniq` (`user_wang_id`,`group_id`),
  KEY `users_user_wang_groups_group_id_2f5772ee_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_user_wang_groups_group_id_2f5772ee_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_user_wang_grou_user_wang_id_66713f70_fk_users_use` FOREIGN KEY (`user_wang_id`) REFERENCES `users_user_wang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_wang_groups`
--

LOCK TABLES `users_user_wang_groups` WRITE;
/*!40000 ALTER TABLE `users_user_wang_groups` DISABLE KEYS */;
INSERT INTO `users_user_wang_groups` VALUES (1,4,1);
/*!40000 ALTER TABLE `users_user_wang_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_wang_user_permissions`
--

DROP TABLE IF EXISTS `users_user_wang_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user_wang_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_wang_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_wang_user_per_user_wang_id_permission__e33bac47_uniq` (`user_wang_id`,`permission_id`),
  KEY `users_user_wang_user_permission_id_814b6c9e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_wang_user_permission_id_814b6c9e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_wang_user_user_wang_id_cbb29b8e_fk_users_use` FOREIGN KEY (`user_wang_id`) REFERENCES `users_user_wang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_wang_user_permissions`
--

LOCK TABLES `users_user_wang_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_wang_user_permissions` DISABLE KEYS */;
INSERT INTO `users_user_wang_user_permissions` VALUES (18,4,28),(17,4,66),(15,4,79);
/*!40000 ALTER TABLE `users_user_wang_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_user_wang_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_user_wang_id` FOREIGN KEY (`user_id`) REFERENCES `users_user_wang` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_user_wang_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_user_wang_id` FOREIGN KEY (`user_id`) REFERENCES `users_user_wang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2018-07-17 10:34:45','127.0.0.1','1','EmailVerifyRecord object (1)','create','已添加。',8,1),(2,'2018-07-17 10:41:03','127.0.0.1','1','EmailVerifyRecord object (1)','delete','',8,1),(3,'2018-07-17 10:41:13','127.0.0.1','2','EmailVerifyRecord object (2)','create','已添加。',8,1),(4,'2018-07-17 10:51:14','127.0.0.1','3','EmailVerifyRecord object (3)','create','已添加。',8,1),(5,'2018-07-18 02:05:05','127.0.0.1','1','Banner object (1)','create','已添加。',7,1),(6,'2018-07-18 02:49:02','127.0.0.1','1','Course object (1)','create','已添加。',9,1),(7,'2018-07-18 03:03:06','127.0.0.1','1','Lesson object (1)','create','已添加。',11,1),(8,'2018-07-18 03:15:06','127.0.0.1','2','Lesson object (2)','create','已添加。',11,1),(9,'2018-07-21 02:34:06','127.0.0.1','2','王梦多','create','已添加。',6,1),(10,'2018-07-21 02:37:49','127.0.0.1','2','王梦多','change','修改 is_staff，nick_name，gender，address 和 image',6,1),(11,'2018-07-21 02:38:13','127.0.0.1','2','王梦多','change','修改 is_staff 和 image',6,1),(12,'2018-07-21 02:40:07','127.0.0.1','2','王梦多','change','修改 last_login 和 image',6,1),(13,'2018-07-21 02:42:02','127.0.0.1','3','wang','create','已添加。',6,1),(14,'2018-07-21 02:46:07','127.0.0.1','2','王梦多','change','修改 image',6,1),(15,'2018-07-21 03:05:08','127.0.0.1',NULL,'','delete','批量删除 1 个 用户信息',NULL,1),(16,'2018-07-21 03:05:42','127.0.0.1','4','meng','create','已添加。',6,1),(17,'2018-07-21 03:06:02','127.0.0.1','3','wang','change','修改 last_login，nick_name，gender，address 和 image',6,1),(18,'2018-07-21 03:07:32','127.0.0.1','3','wang','change','修改 image',6,1),(19,'2018-07-21 03:08:16','127.0.0.1','3','wang','change','修改 image',6,1),(20,'2018-07-21 03:09:41','127.0.0.1','3','wang','change','修改 image',6,1),(21,'2018-07-24 08:57:36','127.0.0.1','13','144','change','修改 last_login，username，nick_name，address 和 image',6,1),(22,'2018-07-24 08:57:53','127.0.0.1',NULL,'','delete','批量删除 1 个 用户信息',NULL,1),(23,'2018-07-24 08:59:54','127.0.0.1','1','CityDict object (1)','create','已添加。',18,1),(24,'2018-07-24 09:00:34','127.0.0.1','2','CityDict object (2)','create','已添加。',18,1),(25,'2018-07-24 09:01:06','127.0.0.1','3','CityDict object (3)','create','已添加。',18,1),(26,'2018-07-24 09:01:44','127.0.0.1','4','CityDict object (4)','create','已添加。',18,1),(27,'2018-07-24 09:02:53','127.0.0.1','5','CityDict object (5)','create','已添加。',18,1),(28,'2018-07-24 09:03:54','127.0.0.1','6','CityDict object (6)','create','已添加。',18,1),(29,'2018-07-24 09:16:35','127.0.0.1','1','慕课网','create','已添加。',19,1),(30,'2018-07-24 09:19:44','127.0.0.1','2','极客学院','create','已添加。',19,1),(31,'2018-07-24 09:21:22','127.0.0.1','3','github','create','已添加。',19,1),(32,'2018-07-24 09:23:54','127.0.0.1','4','网易课堂','create','已添加。',19,1),(33,'2018-07-24 09:25:01','127.0.0.1','5','腾讯课堂','create','已添加。',19,1),(34,'2018-07-24 09:26:38','127.0.0.1','6','阿里云','create','已添加。',19,1),(35,'2018-07-24 09:28:12','127.0.0.1','7','千峰教育','create','已添加。',19,1),(36,'2018-07-27 07:58:03','127.0.0.1','8','王梦多','create','已添加。',19,1),(37,'2018-07-27 07:59:50','127.0.0.1','9','未知','create','已添加。',19,1),(38,'2018-08-04 07:37:03','127.0.0.1','1','王梦多','create','已添加。',20,1),(39,'2018-08-04 07:55:09','127.0.0.1','1','django入门','change','修改 course_org 和 image',9,1),(40,'2018-08-04 09:35:25','127.0.0.1','2','mysql基础','create','已添加。',9,1),(41,'2018-08-04 09:55:02','127.0.0.1','3','数据结构','create','已添加。',9,1),(42,'2018-08-06 09:08:52','127.0.0.1','2','张三','create','已添加。',20,1),(43,'2018-08-06 09:19:09','127.0.0.1','3','数据结构','change','修改 course_org',9,1),(44,'2018-08-07 10:05:12','127.0.0.1','4','python基础','create','已添加。',9,1),(45,'2018-08-07 10:07:15','127.0.0.1','5','java','create','已添加。',9,1),(46,'2018-08-07 10:08:26','127.0.0.1','6','PHP','create','已添加。',9,1),(47,'2018-08-12 07:41:33','127.0.0.1','7','个性化推荐算法实战入门必修课','create','已添加。',9,1),(48,'2018-08-12 07:43:02','127.0.0.1','8','私有区块链，我们一起GO','create','已添加。',9,1),(49,'2018-08-12 07:44:23','127.0.0.1','9','ElasticSearch入门','create','已添加。',9,1),(50,'2018-08-13 04:36:10','127.0.0.1','1','UserCourse object (1)','create','已添加。',15,1),(51,'2018-08-13 04:37:10','127.0.0.1','2','UserCourse object (2)','create','已添加。',15,1),(52,'2018-08-13 04:46:46','127.0.0.1','1','django','change','修改 last_login，nick_name，gender，address，mobile 和 image',6,1),(53,'2018-08-13 17:01:53','127.0.0.1','3','mysql语句','create','已添加。',11,1),(54,'2018-08-13 17:06:13','127.0.0.1','1','第一步','create','已添加。',12,1),(55,'2018-08-13 17:06:37','127.0.0.1','2','第二步','create','已添加。',12,1),(56,'2018-08-13 17:06:52','127.0.0.1','3','第三步','create','已添加。',12,1),(57,'2018-08-13 17:07:03','127.0.0.1','4','第四步','create','已添加。',12,1),(58,'2018-08-13 17:36:55','127.0.0.1',NULL,'','delete','批量删除 9 个 课程',NULL,1),(59,'2018-08-14 08:56:27','127.0.0.1','1','王','create','已添加。',10,1),(60,'2018-08-14 09:12:30','127.0.0.1','9','ElasticSearch入门','change','修改 teacher',9,1),(61,'2018-08-14 09:12:36','127.0.0.1','8','私有区块链，我们一起GO','change','修改 teacher',9,1),(62,'2018-08-14 09:12:42','127.0.0.1','7','个性化推荐算法实战入门必修课','change','修改 teacher',9,1),(63,'2018-08-14 09:12:56','127.0.0.1','6','PHP','change','修改 teacher',9,1),(64,'2018-08-14 09:13:03','127.0.0.1','5','java','change','修改 teacher',9,1),(65,'2018-08-14 09:13:11','127.0.0.1','4','python基础','change','修改 teacher',9,1),(66,'2018-08-14 09:13:18','127.0.0.1','3','数据结构','change','修改 teacher',9,1),(67,'2018-08-14 09:13:24','127.0.0.1','2','mysql基础','change','修改 teacher',9,1),(68,'2018-08-14 09:13:29','127.0.0.1','1','django入门','change','修改 teacher',9,1),(69,'2018-08-14 12:13:48','127.0.0.1','1','CourseComments object (1)','create','已添加。',13,1),(70,'2018-08-14 12:14:06','127.0.0.1','2','CourseComments object (2)','create','已添加。',13,1),(71,'2018-08-14 12:14:24','127.0.0.1','3','CourseComments object (3)','create','已添加。',13,1),(72,'2018-08-14 12:20:03','127.0.0.1','4','meng','change','修改 last_login，nick_name，address 和 image',6,1),(73,'2018-08-14 12:20:14','127.0.0.1','3','wang','change','修改 last_login 和 image',6,1),(74,'2018-08-16 13:41:55','127.0.0.1','3','李四','create','已添加。',20,1),(75,'2018-08-16 13:42:23','127.0.0.1','4','王五','create','已添加。',20,1),(76,'2018-08-16 15:04:08','127.0.0.1','8','私有区块链，我们一起GO','change','修改 teacher',9,1),(77,'2018-08-16 15:04:26','127.0.0.1','5','java','change','修改 teacher',9,1),(78,'2018-08-21 12:49:23','127.0.0.1','1','UserMessage object (1)','create','已添加。',17,1),(79,'2018-08-21 12:49:36','127.0.0.1','2','UserMessage object (2)','create','已添加。',17,1),(80,'2018-08-21 14:00:24','127.0.0.1','21','144990754@qq.com','change','修改 last_login，nick_name 和 birthday',6,1),(81,'2018-08-21 14:01:33','127.0.0.1','21','144990754@qq.com','change','修改 image',6,1),(82,'2018-08-21 16:08:22','127.0.0.1','2','Banner object (2)','create','已添加。',7,1),(83,'2018-08-21 16:12:50','127.0.0.1','3','Banner object (3)','create','已添加。',7,1),(84,'2018-08-21 16:13:03','127.0.0.1','4','Banner object (4)','create','已添加。',7,1),(85,'2018-08-21 16:13:15','127.0.0.1','5','Banner object (5)','create','已添加。',7,1),(86,'2018-08-21 16:16:28','127.0.0.1','9','ElasticSearch入门','change','修改 is_banner',9,1),(87,'2018-08-21 16:16:37','127.0.0.1','8','私有区块链，我们一起GO','change','修改 is_banner',9,1),(88,'2018-08-21 16:16:43','127.0.0.1','4','python基础','change','修改 is_banner',9,1),(89,'2018-08-21 16:19:48','127.0.0.1','2','Banner object (2)','change','修改 image 和 index',7,1),(90,'2018-08-21 16:20:15','127.0.0.1','3','Banner object (3)','change','修改 image 和 index',7,1),(91,'2018-08-21 16:20:28','127.0.0.1','4','Banner object (4)','change','修改 image 和 index',7,1),(92,'2018-08-21 16:20:44','127.0.0.1','5','Banner object (5)','change','修改 image 和 index',7,1),(93,'2018-08-21 16:25:41','127.0.0.1','1','Banner object (1)','delete','',7,1),(94,'2018-08-23 14:56:02','127.0.0.1','4','meng','change','修改 last_login，user_permissions，first_name，last_name，email，birthday 和 mobile',6,1),(95,'2018-08-23 14:56:22','127.0.0.1','4','meng','change','修改 is_staff',6,1),(96,'2018-08-23 14:57:58','127.0.0.1','4','meng','change','修改 last_login',6,1),(97,'2018-08-23 14:58:20','127.0.0.1','4','meng','change','修改 user_permissions',6,1),(98,'2018-08-23 15:01:15','127.0.0.1','4','meng','change','修改 last_login 和 user_permissions',6,1),(99,'2018-08-23 15:02:01','127.0.0.1','4','meng','change','修改 user_permissions',6,1),(100,'2018-08-23 15:02:22','127.0.0.1','4','meng','change','修改 user_permissions',6,1),(101,'2018-08-23 15:02:35','127.0.0.1','4','meng','change','修改 user_permissions',6,1),(102,'2018-08-23 15:03:11','127.0.0.1','4','meng','change','修改 user_permissions',6,1),(103,'2018-08-23 15:04:27','127.0.0.1','1','me','create','已添加。',3,1),(104,'2018-08-23 15:05:00','127.0.0.1','4','meng','change','修改 groups',6,1),(105,'2018-08-23 18:35:21','127.0.0.1','1','django入门','change','修改 learn_times',9,1),(106,'2018-08-23 18:39:28','127.0.0.1','1','django入门','change','修改 learn_times',9,1),(107,'2018-08-23 18:41:49','127.0.0.1','1','慕课网','change','修改 course_nums 和 image',19,1),(108,'2018-08-23 18:42:58','127.0.0.1','10','c++','create','已添加。',9,1),(109,'2018-08-24 11:37:19','127.0.0.1','2','mysql基础','change','修改 fav_nums',9,1),(110,'2018-08-24 12:17:21','127.0.0.1','12','c','create','已添加。',9,1),(111,'2018-08-24 12:30:11','127.0.0.1','1','慕课网','change','修改 course_nums 和 image',19,1),(112,'2018-08-24 16:51:55','127.0.0.1','1','django入门','change','修改 fav_nums',9,1),(113,'2018-08-24 16:56:03','127.0.0.1','1','慕课网','change','修改 course_nums 和 image',19,1),(114,'2018-08-24 16:56:24','127.0.0.1','1','django入门','change','修改 students',9,1),(115,'2018-08-24 16:57:06','127.0.0.1','13','ddd','create','已添加。',9,1),(116,'2018-08-24 18:09:00','127.0.0.1','1','django入门','change','修改 detail',9,1),(117,'2018-08-24 18:21:21','127.0.0.1','1','django入门','change','修改 detail',9,1),(118,'2018-08-24 18:22:13','127.0.0.1','1','django入门','change','修改 detail',9,1),(119,'2018-08-24 18:26:07','127.0.0.1','1','django入门','change','修改 detail',9,1),(120,'2018-08-24 18:26:35','127.0.0.1','1','django入门','change','修改 detail',9,1),(121,'2018-08-24 18:28:53','127.0.0.1','1','django入门','change','修改 detail',9,1),(122,'2018-08-24 18:29:22','127.0.0.1','1','django入门','change','修改 detail',9,1),(123,'2018-08-25 12:22:33','127.0.0.1','13','ddd','change','修改 detail 和 image',9,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_user_wang_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_user_wang_id` FOREIGN KEY (`user_id`) REFERENCES `users_user_wang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','',1),(2,'site-theme','/static/xadmin/css/themes/bootstrap-xadmin.css',1),(3,'dashboard:home:pos','',4),(4,'dashboard:home:pos','',23);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_user_wang_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_user_wang_id` FOREIGN KEY (`user_id`) REFERENCES `users_user_wang` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-22 10:35:55
