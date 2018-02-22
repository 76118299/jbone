CREATE DATABASE  IF NOT EXISTS `jbone_sys` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `jbone_sys`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: jbone_sys
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `rbac_menu`
--

DROP TABLE IF EXISTS `rbac_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '权限类型(-1:减权限,1:增权限)',
  `system_id` int(10) DEFAULT NULL,
  `pid` int(10) DEFAULT NULL COMMENT '父菜单',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `url` varchar(100) DEFAULT NULL COMMENT '链接',
  `target` varchar(10) DEFAULT NULL COMMENT '打开方式',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  `add_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `version` int(10) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_menu`
--

LOCK TABLES `rbac_menu` WRITE;
/*!40000 ALTER TABLE `rbac_menu` DISABLE KEYS */;
INSERT INTO `rbac_menu` VALUES (9,3,NULL,'','',NULL,NULL,'2018-02-02 07:42:18','2018-02-02 07:42:18',0,NULL),(10,3,0,'ffeeedf','asdf',NULL,111,'2018-02-02 07:49:57','2018-02-02 07:49:57',0,NULL),(13,3,10,'wef','wef',NULL,1111,'2018-02-02 07:57:11','2018-02-02 07:57:11',0,NULL),(14,3,10,'rrr','阿斯顿发',NULL,111,'2018-02-02 08:19:35','2018-02-02 08:19:35',0,NULL),(19,2,0,'23','123',NULL,123,'2018-02-02 08:46:59','2018-02-02 08:46:59',0,NULL),(21,3,0,'权限管理','#',NULL,1,'2018-02-02 08:46:59','2018-02-04 14:02:28',23,NULL),(22,3,21,'用户管理','/user/index',NULL,3,'2018-02-02 08:46:59','2018-02-02 08:46:59',0,NULL),(23,3,21,'角色管理','/role/index',NULL,2,'2018-02-02 08:46:59','2018-02-02 08:46:59',0,NULL),(24,3,21,'菜单管理','/menu/index',NULL,1,'2018-02-02 08:46:59','2018-02-02 08:46:59',0,NULL),(25,3,0,'系统管理','#',NULL,1,'2018-02-02 08:46:59','2018-02-04 14:02:28',23,NULL),(26,3,25,'系统管理','/system/index',NULL,1,'2018-02-02 08:46:59','2018-02-02 08:46:59',0,NULL),(27,3,10,'eef','ef',NULL,111,'2018-02-06 03:39:48','2018-02-06 03:39:48',0,NULL),(29,3,10,'1211111','124444',NULL,112111,'2018-02-06 03:40:01','2018-02-08 07:05:52',1,NULL),(30,3,21,'权限管理','/permission/index',NULL,0,'2018-02-06 08:53:24','2018-02-06 08:53:24',0,NULL);
/*!40000 ALTER TABLE `rbac_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_organization`
--

DROP TABLE IF EXISTS `rbac_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_organization` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pid` int(10) DEFAULT NULL COMMENT '所属上级',
  `name` varchar(20) DEFAULT NULL COMMENT '组织名称',
  `description` varchar(1000) DEFAULT NULL COMMENT '组织描述',
  `add_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='组织';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_organization`
--

LOCK TABLES `rbac_organization` WRITE;
/*!40000 ALTER TABLE `rbac_organization` DISABLE KEYS */;
INSERT INTO `rbac_organization` VALUES (1,NULL,'总部','北京总部',NULL,NULL,0),(4,NULL,'河北分部','河北石家庄',NULL,NULL,0),(5,NULL,'河南分部','河南郑州',NULL,NULL,0),(6,NULL,'湖北分部','湖北武汉',NULL,NULL,0),(7,NULL,'湖南分部','湖南长沙',NULL,NULL,0);
/*!40000 ALTER TABLE `rbac_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_permission`
--

DROP TABLE IF EXISTS `rbac_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_permission` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `system_id` int(10) unsigned NOT NULL COMMENT '所属系统',
  `menu_id` int(10) DEFAULT NULL COMMENT '所属上级',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型(1:功能,2:菜单,3:按钮)',
  `permission_value` varchar(50) DEFAULT NULL COMMENT '权限值',
  `add_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COMMENT='权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_permission`
--

LOCK TABLES `rbac_permission` WRITE;
/*!40000 ALTER TABLE `rbac_permission` DISABLE KEYS */;
INSERT INTO `rbac_permission` VALUES (93,3,0,'系统管理-查看',1,'sys:system:read','2018-02-08 08:35:15','2018-02-08 08:37:48',1),(94,3,0,'系统管理-新增',1,'sys:system:create','2018-02-08 08:36:08','2018-02-08 08:38:11',1),(95,3,26,'系统管理-修改',1,'sys:system:update','2018-02-08 08:36:52','2018-02-08 08:36:52',0),(96,3,0,'系统管理-删除',1,'sys:system:delete','2018-02-08 08:39:14','2018-02-08 08:39:30',1),(97,3,0,'菜单管理-查看',1,'sys:menu:read','2018-02-22 13:47:08','2018-02-22 13:47:08',0),(98,3,0,'菜单管理-新增',1,'sys:menu:create','2018-02-22 13:47:39','2018-02-22 13:47:50',1),(99,3,0,'菜单管理-修改',1,'sys:menu:update','2018-02-22 13:48:21','2018-02-22 13:48:29',1),(100,3,0,'菜单管理-删除',1,'sys:menu:delete','2018-02-22 13:48:58','2018-02-22 13:48:58',0),(101,3,30,'权限管理-查看',1,'sys:permission:read','2018-02-22 13:49:57','2018-02-22 14:32:12',1),(102,3,30,'权限管理-新增',1,'sys:permission:create','2018-02-22 13:50:14','2018-02-22 14:32:02',1),(103,3,30,'权限管理-修改',1,'sys:permission:update','2018-02-22 13:50:31','2018-02-22 14:31:50',1),(104,3,30,'权限管理-删除',1,'sys:permission:delete','2018-02-22 13:50:59','2018-02-22 14:31:32',1),(105,3,0,'角色管理-查看',1,'sys:role:read','2018-02-22 13:51:48','2018-02-22 13:51:48',0),(106,3,0,'角色管理-新增',1,'sys:role:create','2018-02-22 13:52:12','2018-02-22 13:52:22',1),(107,3,0,'角色管理-修改',1,'sys:role:update','2018-02-22 13:57:26','2018-02-22 13:57:26',0),(108,3,23,'角色管理-删除',1,'sys:role:delete','2018-02-22 13:57:54','2018-02-22 14:34:59',1),(109,3,0,'角色管理-分配菜单',1,'sys:role:assignMenu','2018-02-22 13:58:17','2018-02-22 13:58:17',0),(110,3,0,'角色管理-分配权限',1,'sys:role:assignPermission','2018-02-22 13:58:40','2018-02-22 13:58:40',0),(111,3,0,'用户管理-查看',1,'sys:user:read','2018-02-22 13:59:09','2018-02-22 13:59:09',0),(112,3,0,'用户管理-新增',1,'sys:user:create','2018-02-22 13:59:25','2018-02-22 13:59:25',0),(113,3,0,'用户管理-修改',1,'sys:user:update','2018-02-22 13:59:40','2018-02-22 13:59:40',0),(114,3,0,'用户管理-删除',1,'sys:user:delete','2018-02-22 13:59:57','2018-02-22 13:59:57',0),(115,3,0,'用户管理-分配角色',1,'sys:user:assignRole','2018-02-22 14:00:18','2018-02-22 14:00:18',0),(116,3,0,'用户管理-分配菜单',1,'sys:user:assignMenu','2018-02-22 14:00:42','2018-02-22 14:00:42',0),(117,3,0,'用户管理-分配权限',1,'sys:user:assignPermission','2018-02-22 14:01:03','2018-02-22 14:01:03',0);
/*!40000 ALTER TABLE `rbac_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_role`
--

DROP TABLE IF EXISTS `rbac_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `title` varchar(20) DEFAULT NULL COMMENT '角色标题',
  `description` varchar(1000) DEFAULT NULL COMMENT '角色描述',
  `orders` bigint(20) NOT NULL COMMENT '排序',
  `add_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_role`
--

LOCK TABLES `rbac_role` WRITE;
/*!40000 ALTER TABLE `rbac_role` DISABLE KEYS */;
INSERT INTO `rbac_role` VALUES (8,'sso','单点登录','单点登录',1,'2018-02-02 08:46:59','2018-02-02 08:46:59',1),(9,'serverAdministrator','服务管理员','服务管理员',1,'2018-02-02 08:46:59','2018-02-02 08:46:59',1),(10,'admin','系统管理员','系统管理员',1,'2018-02-02 08:46:59','2018-02-22 14:35:51',5);
/*!40000 ALTER TABLE `rbac_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_role_menu`
--

DROP TABLE IF EXISTS `rbac_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='角色-菜单关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_role_menu`
--

LOCK TABLES `rbac_role_menu` WRITE;
/*!40000 ALTER TABLE `rbac_role_menu` DISABLE KEYS */;
INSERT INTO `rbac_role_menu` VALUES (31,10,21),(32,10,22),(33,10,23),(34,10,24),(35,10,25),(36,10,26),(37,10,30);
/*!40000 ALTER TABLE `rbac_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_role_permission`
--

DROP TABLE IF EXISTS `rbac_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_role_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色编号',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COMMENT='角色权限关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_role_permission`
--

LOCK TABLES `rbac_role_permission` WRITE;
/*!40000 ALTER TABLE `rbac_role_permission` DISABLE KEYS */;
INSERT INTO `rbac_role_permission` VALUES (46,10,93),(47,10,94),(48,10,95),(49,10,96),(50,10,97),(51,10,98),(52,10,99),(53,10,100),(54,10,101),(55,10,102),(56,10,103),(57,10,104),(58,10,105),(59,10,106),(60,10,107),(61,10,108),(62,10,109),(63,10,110),(64,10,111),(65,10,112),(66,10,113),(67,10,114),(68,10,115),(69,10,116),(70,10,117);
/*!40000 ALTER TABLE `rbac_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_system`
--

DROP TABLE IF EXISTS `rbac_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_system` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `basepath` varchar(100) DEFAULT NULL COMMENT '根目录',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(-1:黑名单,1:正常)',
  `name` varchar(20) DEFAULT NULL COMMENT '系统名称',
  `title` varchar(20) DEFAULT NULL COMMENT '系统标题',
  `description` varchar(300) DEFAULT NULL COMMENT '系统描述',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  `add_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  `service_registered` int(11) DEFAULT '1' COMMENT '是否注册为CAS服务',
  `service_cas_filter` varchar(200) DEFAULT NULL COMMENT '服务CAS过滤器路径，对应CAS的service_id',
  `service_theme_server` varchar(200) DEFAULT NULL COMMENT '主题皮肤服务，用于加载服务',
  `service_id` int(10) DEFAULT '0' COMMENT '服务ID',
  `service_description` varchar(500) DEFAULT NULL COMMENT '服务描述',
  `service_evaluation_order` int(11) DEFAULT '0' COMMENT '服务皮肤加载权重',
  `service_name` varchar(50) DEFAULT NULL COMMENT '服务名称',
  `service_theme_path` varchar(45) DEFAULT NULL COMMENT '服务皮肤路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_system`
--

LOCK TABLES `rbac_system` WRITE;
/*!40000 ALTER TABLE `rbac_system` DISABLE KEYS */;
INSERT INTO `rbac_system` VALUES (2,'http://jbone-sm-admin.majunwei:10002/jbone-sm-admin',1,'jbone-sm-admin','服务管理系统','服务管理系统',2,NULL,NULL,0,1,'http://jbone-sm-admin.majunwei.com:10002/cas111','http://localhost:20001/Jbone-sys-server/service/getTheme',10002,'Jbone服务管理系统，是基于Spring Cloud、Spring Boot Admin做的服务管理，包含服务健康检查、内存分析、JVM监控、垃圾回收、环境变量等监控和管理等功能',1,'Jbone服务管理系统','jbonesmadmin1'),(3,'http://jbone-sys-admin.majunwei:20002',1,'jbone-sys-admin','系统管理','系统管理',0,NULL,'2018-01-28 08:32:46',1,1,NULL,NULL,20002,NULL,1,NULL,NULL),(17,'test',-1,'测试系统','测试系统','ffffeeee',0,'2018-01-28 08:14:08','2018-01-28 08:30:59',2,0,NULL,NULL,0,NULL,0,NULL,NULL),(18,'qwe',1,'qwe','qwe','qwe',0,'2018-01-29 10:56:57','2018-01-29 10:56:57',0,0,NULL,NULL,0,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `rbac_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_user`
--

DROP TABLE IF EXISTS `rbac_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(20) NOT NULL COMMENT '帐号',
  `password` varchar(32) NOT NULL COMMENT '密码MD5(密码+盐)',
  `realname` varchar(20) DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(150) DEFAULT NULL COMMENT '头像',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别',
  `locked` tinyint(4) DEFAULT NULL COMMENT '状态(0:正常,1:锁定)',
  `add_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_user`
--

LOCK TABLES `rbac_user` WRITE;
/*!40000 ALTER TABLE `rbac_user` DISABLE KEYS */;
INSERT INTO `rbac_user` VALUES (14,'test123','test','123','123','123fff','123',1,1,'2018-02-01 01:31:47','2018-02-22 14:08:10',1),(24,'jbone','jbone','渔樵','http://majunwei.com/logo.png','1','1',1,1,'2018-02-01 01:31:47','2018-02-08 09:54:52',15);
/*!40000 ALTER TABLE `rbac_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_user_menu`
--

DROP TABLE IF EXISTS `rbac_user_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_user_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2519 DEFAULT CHARSET=utf8 COMMENT='用户-菜单-关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_user_menu`
--

LOCK TABLES `rbac_user_menu` WRITE;
/*!40000 ALTER TABLE `rbac_user_menu` DISABLE KEYS */;
INSERT INTO `rbac_user_menu` VALUES (2515,24,25),(2516,24,21),(2517,24,21),(2518,24,25);
/*!40000 ALTER TABLE `rbac_user_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_user_organization`
--

DROP TABLE IF EXISTS `rbac_user_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_user_organization` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `organization_id` int(10) unsigned NOT NULL COMMENT '组织编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='用户组织关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_user_organization`
--

LOCK TABLES `rbac_user_organization` WRITE;
/*!40000 ALTER TABLE `rbac_user_organization` DISABLE KEYS */;
INSERT INTO `rbac_user_organization` VALUES (19,1,1),(20,1,4),(21,1,5),(22,1,6),(23,1,7);
/*!40000 ALTER TABLE `rbac_user_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_user_permission`
--

DROP TABLE IF EXISTS `rbac_user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_user_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='用户权限关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_user_permission`
--

LOCK TABLES `rbac_user_permission` WRITE;
/*!40000 ALTER TABLE `rbac_user_permission` DISABLE KEYS */;
INSERT INTO `rbac_user_permission` VALUES (32,24,93),(33,24,96);
/*!40000 ALTER TABLE `rbac_user_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_user_role`
--

DROP TABLE IF EXISTS `rbac_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rbac_user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `role_id` int(10) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COMMENT='用户角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_user_role`
--

LOCK TABLES `rbac_user_role` WRITE;
/*!40000 ALTER TABLE `rbac_user_role` DISABLE KEYS */;
INSERT INTO `rbac_user_role` VALUES (4,1,1),(5,1,2),(6,2,1),(7,2,2),(46,24,8),(47,24,9),(48,24,10);
/*!40000 ALTER TABLE `rbac_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `description` varchar(100) DEFAULT NULL COMMENT '操作描述',
  `username` varchar(20) DEFAULT NULL COMMENT '操作用户',
  `start_time` bigint(20) DEFAULT NULL COMMENT '操作时间',
  `spend_time` int(11) DEFAULT NULL COMMENT '消耗时间',
  `base_path` varchar(500) DEFAULT NULL COMMENT '根路径',
  `uri` varchar(500) DEFAULT NULL COMMENT 'URI',
  `url` varchar(500) DEFAULT NULL COMMENT 'URL',
  `method` varchar(10) DEFAULT NULL COMMENT '请求类型',
  `parameter` mediumtext,
  `user_agent` varchar(500) DEFAULT NULL COMMENT '用户标识',
  `ip` varchar(30) DEFAULT NULL COMMENT 'IP地址',
  `result` mediumtext,
  `permissions` varchar(100) DEFAULT NULL COMMENT '权限值',
  PRIMARY KEY (`id`),
  KEY `log_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-22 22:44:33