/*
SQLyog Ultimate v12.14 (64 bit)
MySQL - 8.0.12 : Database - position
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`position` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `position`;

/*Table structure for table `companies` */

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `companies` */

/*Table structure for table `e_dict` */

DROP TABLE IF EXISTS `e_dict`;

CREATE TABLE `e_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKf5wwh5osfukkeebw7h2yb4kmp` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `e_dict` */

/*Table structure for table `e_dict_item` */

DROP TABLE IF EXISTS `e_dict_item`;

CREATE TABLE `e_dict_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `erupt_dict_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKl0kiq8otpn3fvtlvarebt8xkh` (`code`,`erupt_dict_id`),
  KEY `FKrrbi2dt94rjd8sjt830m3w0a` (`erupt_dict_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `e_dict_item` */

/*Table structure for table `e_upms_login_log` */

DROP TABLE IF EXISTS `e_upms_login_log`;

CREATE TABLE `e_upms_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `browser` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `region` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `system_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `e_upms_login_log` */

insert  into `e_upms_login_log`(`id`,`browser`,`device_type`,`ip`,`login_time`,`region`,`system_name`,`token`,`user_name`) values 
(1,'Chrome 10 104','Computer','10.100.53.165','2022-08-23 22:06:46','0|0|0|内网IP|内网IP','Windows 10','CuaOM1is9PFdqAmv','erupt');

/*Table structure for table `e_upms_menu` */

DROP TABLE IF EXISTS `e_upms_menu`;

CREATE TABLE `e_upms_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `param` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_menu_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK95xpkppt33d2bka0g2d7rgwqt` (`code`),
  KEY `FK5mkgea183mm02v7ic1pdwxy5s` (`parent_menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `e_upms_menu` */

insert  into `e_upms_menu`(`id`,`create_by`,`create_time`,`update_by`,`update_time`,`code`,`icon`,`name`,`param`,`sort`,`status`,`type`,`value`,`parent_menu_id`) values 
(1,NULL,'2022-08-23 22:06:27',NULL,NULL,'$manager','fa fa-cogs','系统管理',NULL,1,1,NULL,NULL,NULL),
(2,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptMenu','','菜单管理',NULL,0,1,'tree','EruptMenu',1),
(3,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptMenu@ADD',NULL,'新增',NULL,10,1,'button','EruptMenu@ADD',2),
(4,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptMenu@EDIT',NULL,'修改',NULL,20,1,'button','EruptMenu@EDIT',2),
(5,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptMenu@DELETE',NULL,'删除',NULL,30,1,'button','EruptMenu@DELETE',2),
(6,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptMenu@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptMenu@VIEW_DETAIL',2),
(7,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptRole','','角色管理',NULL,10,1,'table','EruptRole',1),
(8,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptRole@ADD',NULL,'新增',NULL,10,1,'button','EruptRole@ADD',7),
(9,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptRole@EDIT',NULL,'修改',NULL,20,1,'button','EruptRole@EDIT',7),
(10,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptRole@DELETE',NULL,'删除',NULL,30,1,'button','EruptRole@DELETE',7),
(11,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptRole@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptRole@VIEW_DETAIL',7),
(12,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptOrg','','组织维护',NULL,20,1,'tree','EruptOrg',1),
(13,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptOrg@ADD',NULL,'新增',NULL,10,1,'button','EruptOrg@ADD',12),
(14,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptOrg@EDIT',NULL,'修改',NULL,20,1,'button','EruptOrg@EDIT',12),
(15,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptOrg@DELETE',NULL,'删除',NULL,30,1,'button','EruptOrg@DELETE',12),
(16,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptOrg@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptOrg@VIEW_DETAIL',12),
(17,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptPost','','岗位维护',NULL,30,1,'table','EruptPost',1),
(18,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptPost@ADD',NULL,'新增',NULL,10,1,'button','EruptPost@ADD',17),
(19,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptPost@EDIT',NULL,'修改',NULL,20,1,'button','EruptPost@EDIT',17),
(20,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptPost@DELETE',NULL,'删除',NULL,30,1,'button','EruptPost@DELETE',17),
(21,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptPost@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptPost@VIEW_DETAIL',17),
(22,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptUser','','用户配置',NULL,40,1,'table','EruptUser',1),
(23,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptUser@ADD',NULL,'新增',NULL,10,1,'button','EruptUser@ADD',22),
(24,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptUser@EDIT',NULL,'修改',NULL,20,1,'button','EruptUser@EDIT',22),
(25,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptUser@DELETE',NULL,'删除',NULL,30,1,'button','EruptUser@DELETE',22),
(26,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptUser@VIEW_DETAIL',NULL,'详情',NULL,40,1,'button','EruptUser@VIEW_DETAIL',22),
(27,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptDict','','数据字典',NULL,50,1,'table','EruptDict',1),
(28,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptDict@ADD',NULL,'新增',NULL,10,1,'button','EruptDict@ADD',27),
(29,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptDict@EDIT',NULL,'修改',NULL,20,1,'button','EruptDict@EDIT',27),
(30,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptDict@DELETE',NULL,'删除',NULL,30,1,'button','EruptDict@DELETE',27),
(31,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptDict@EXPORT',NULL,'导出',NULL,40,1,'button','EruptDict@EXPORT',27),
(32,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptDict@VIEW_DETAIL',NULL,'详情',NULL,50,1,'button','EruptDict@VIEW_DETAIL',27),
(33,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptDictItem','','字典项',NULL,60,2,'table','EruptDictItem',1),
(34,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptDictItem@ADD',NULL,'新增',NULL,10,1,'button','EruptDictItem@ADD',33),
(35,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptDictItem@EDIT',NULL,'修改',NULL,20,1,'button','EruptDictItem@EDIT',33),
(36,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptDictItem@DELETE',NULL,'删除',NULL,30,1,'button','EruptDictItem@DELETE',33),
(37,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptDictItem@EXPORT',NULL,'导出',NULL,40,1,'button','EruptDictItem@EXPORT',33),
(38,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptDictItem@VIEW_DETAIL',NULL,'详情',NULL,50,1,'button','EruptDictItem@VIEW_DETAIL',33),
(39,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptOnline','','在线用户',NULL,65,1,'table','EruptOnline',1),
(40,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptOnline@EXPORT',NULL,'导出',NULL,10,1,'button','EruptOnline@EXPORT',39),
(41,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptLoginLog','','登录日志',NULL,70,1,'table','EruptLoginLog',1),
(42,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptLoginLog@EXPORT',NULL,'导出',NULL,10,1,'button','EruptLoginLog@EXPORT',41),
(43,NULL,'2022-08-23 22:06:27',NULL,NULL,'EruptOperateLog','','操作日志',NULL,80,1,'table','EruptOperateLog',1),
(44,'erupt','2022-08-23 22:07:11','erupt','2022-08-23 22:07:11','3hJ1KwZe',NULL,'公司管理',NULL,90,1,'table','Companies',NULL),
(45,NULL,'2022-08-23 22:07:11',NULL,NULL,'qLOReeCU',NULL,'新增',NULL,10,1,'button','Companies@ADD',44),
(46,NULL,'2022-08-23 22:07:11',NULL,NULL,'d5h5Z6CE',NULL,'修改',NULL,20,1,'button','Companies@EDIT',44),
(47,NULL,'2022-08-23 22:07:11',NULL,NULL,'BSnN9N7i',NULL,'删除',NULL,30,1,'button','Companies@DELETE',44),
(48,NULL,'2022-08-23 22:07:11',NULL,NULL,'zuCiaZ9x',NULL,'详情',NULL,40,1,'button','Companies@VIEW_DETAIL',44),
(49,'erupt','2022-08-23 22:07:27','erupt','2022-08-23 22:07:27','P98OrdUt',NULL,'职位管理',NULL,NULL,1,'table','Positions',NULL),
(50,NULL,'2022-08-23 22:07:27',NULL,NULL,'0aY4TJUq',NULL,'新增',NULL,10,1,'button','Positions@ADD',49),
(51,NULL,'2022-08-23 22:07:27',NULL,NULL,'WQ2n8wQt',NULL,'修改',NULL,20,1,'button','Positions@EDIT',49),
(52,NULL,'2022-08-23 22:07:27',NULL,NULL,'QiTjmslm',NULL,'删除',NULL,30,1,'button','Positions@DELETE',49),
(53,NULL,'2022-08-23 22:07:27',NULL,NULL,'eVmBhX2L',NULL,'详情',NULL,40,1,'button','Positions@VIEW_DETAIL',49),
(54,'erupt','2022-08-23 22:07:39','erupt','2022-08-23 22:07:39','VgHGjMZZ',NULL,'角色管理',NULL,NULL,1,'table','Roles',NULL),
(55,NULL,'2022-08-23 22:07:39',NULL,NULL,'N3BPcDWm',NULL,'新增',NULL,10,1,'button','Roles@ADD',54),
(56,NULL,'2022-08-23 22:07:39',NULL,NULL,'VcqBeeRN',NULL,'修改',NULL,20,1,'button','Roles@EDIT',54),
(57,NULL,'2022-08-23 22:07:39',NULL,NULL,'GP2G6BTf',NULL,'删除',NULL,30,1,'button','Roles@DELETE',54),
(58,NULL,'2022-08-23 22:07:39',NULL,NULL,'8xZAoMhY',NULL,'详情',NULL,40,1,'button','Roles@VIEW_DETAIL',54),
(59,'erupt','2022-08-23 22:07:52','erupt','2022-08-23 22:07:52','B9HVC01p',NULL,'标签管理',NULL,NULL,1,'table','Tags',NULL),
(60,NULL,'2022-08-23 22:07:52',NULL,NULL,'cCfyBkfB',NULL,'新增',NULL,10,1,'button','Tags@ADD',59),
(61,NULL,'2022-08-23 22:07:52',NULL,NULL,'e31tP0fb',NULL,'修改',NULL,20,1,'button','Tags@EDIT',59),
(62,NULL,'2022-08-23 22:07:52',NULL,NULL,'fjtM9wwE',NULL,'删除',NULL,30,1,'button','Tags@DELETE',59),
(63,NULL,'2022-08-23 22:07:52',NULL,NULL,'W3WzA79i',NULL,'详情',NULL,40,1,'button','Tags@VIEW_DETAIL',59),
(64,'erupt','2022-08-23 22:08:08','erupt','2022-08-23 22:08:08','Z6g3k5AE',NULL,'用户管理',NULL,NULL,1,'table','User',NULL),
(65,NULL,'2022-08-23 22:08:08',NULL,NULL,'RzRlXJkh',NULL,'新增',NULL,10,1,'button','User@ADD',64),
(66,NULL,'2022-08-23 22:08:08',NULL,NULL,'YHXT5awU',NULL,'修改',NULL,20,1,'button','User@EDIT',64),
(67,NULL,'2022-08-23 22:08:08',NULL,NULL,'9QsZC4YL',NULL,'删除',NULL,30,1,'button','User@DELETE',64),
(68,NULL,'2022-08-23 22:08:08',NULL,NULL,'VNX659cs',NULL,'详情',NULL,40,1,'button','User@VIEW_DETAIL',64),
(69,'erupt','2022-08-23 22:08:23','erupt','2022-08-23 22:08:23','A4UOwOQg',NULL,'职位审核管理',NULL,NULL,1,'table','UserPosition',NULL),
(70,NULL,'2022-08-23 22:08:23',NULL,NULL,'9rfpPoeS',NULL,'新增',NULL,10,1,'button','UserPosition@ADD',69),
(71,NULL,'2022-08-23 22:08:23',NULL,NULL,'hXjzLaYw',NULL,'修改',NULL,20,1,'button','UserPosition@EDIT',69),
(72,NULL,'2022-08-23 22:08:23',NULL,NULL,'VF3hvB8v',NULL,'删除',NULL,30,1,'button','UserPosition@DELETE',69),
(73,NULL,'2022-08-23 22:08:23',NULL,NULL,'TyBBmODp',NULL,'详情',NULL,40,1,'button','UserPosition@VIEW_DETAIL',69);

/*Table structure for table `e_upms_operate_log` */

DROP TABLE IF EXISTS `e_upms_operate_log`;

CREATE TABLE `e_upms_operate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `api_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `error_info` longtext COLLATE utf8_unicode_ci,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operate_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `req_addr` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `req_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `req_param` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `total_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `e_upms_operate_log` */

insert  into `e_upms_operate_log`(`id`,`api_name`,`create_time`,`error_info`,`ip`,`operate_user`,`region`,`req_addr`,`req_method`,`req_param`,`status`,`total_time`) values 
(1,'新增 | 菜单管理','2022-08-23 22:07:11',NULL,'10.100.53.165','erupt','0|0|0|内网IP|内网IP','http://localhost:8001/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"公司管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Companies\",\"sort\":90}','',74),
(2,'新增 | 菜单管理','2022-08-23 22:07:24',NULL,'10.100.53.165','erupt','0|0|0|内网IP|内网IP','http://localhost:8001/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"职位管理\",\"type\":\"table\",\"value\":\"Positions\"}','',10),
(3,'新增 | 菜单管理','2022-08-23 22:07:27',NULL,'10.100.53.165','erupt','0|0|0|内网IP|内网IP','http://localhost:8001/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"职位管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Positions\"}','',37),
(4,'新增 | 菜单管理','2022-08-23 22:07:39',NULL,'10.100.53.165','erupt','0|0|0|内网IP|内网IP','http://localhost:8001/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"角色管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Roles\"}','',43),
(5,'新增 | 菜单管理','2022-08-23 22:07:52',NULL,'10.100.53.165','erupt','0|0|0|内网IP|内网IP','http://localhost:8001/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"标签管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Tags\"}','',34),
(6,'新增 | 菜单管理','2022-08-23 22:08:08',NULL,'10.100.53.165','erupt','0|0|0|内网IP|内网IP','http://localhost:8001/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"用户管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"User\"}','',34),
(7,'新增 | 菜单管理','2022-08-23 22:08:23',NULL,'10.100.53.165','erupt','0|0|0|内网IP|内网IP','http://localhost:8001/erupt-api/data/modify/EruptMenu','POST','{\"name\":\"职位审核管理\",\"status\":\"1\",\"type\":\"table\",\"value\":\"UserPosition\"}','',37);

/*Table structure for table `e_upms_org` */

DROP TABLE IF EXISTS `e_upms_org`;

CREATE TABLE `e_upms_org` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `parent_org_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKc2wj35ujq2m84uw59dx6wy3gj` (`code`),
  KEY `FKtj7222kjnkt7pv9kfn9g8ck4h` (`parent_org_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `e_upms_org` */

/*Table structure for table `e_upms_post` */

DROP TABLE IF EXISTS `e_upms_post`;

CREATE TABLE `e_upms_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKltq5h3n5cyyk5nxtjhg9lhidg` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `e_upms_post` */

/*Table structure for table `e_upms_role` */

DROP TABLE IF EXISTS `e_upms_role`;

CREATE TABLE `e_upms_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `create_user_id` bigint(20) DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKjgxkp7mr4183tcwosrbqpsl3a` (`code`),
  KEY `FKad39xpgtpmhq0fp5newnabv1g` (`create_user_id`),
  KEY `FKbghup2p4f1x9eokeygyg8p658` (`update_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `e_upms_role` */

/*Table structure for table `e_upms_role_menu` */

DROP TABLE IF EXISTS `e_upms_role_menu`;

CREATE TABLE `e_upms_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `FKr6bl403chgwjnb6jk0uqqd9x8` (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `e_upms_role_menu` */

/*Table structure for table `e_upms_user` */

DROP TABLE IF EXISTS `e_upms_user`;

CREATE TABLE `e_upms_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `account` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_admin` bit(1) DEFAULT NULL,
  `is_md5` bit(1) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_pwd_time` datetime DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `white_ip` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `erupt_org_id` bigint(20) DEFAULT NULL,
  `erupt_post_id` bigint(20) DEFAULT NULL,
  `create_user_id` bigint(20) DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  `erupt_menu_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK812t22yn0295dkkvx5gjgahax` (`account`),
  KEY `FK1re8jv3614mkk2wfxscvgvmnm` (`erupt_org_id`),
  KEY `FK53cice19aydjcuykpv847ocdv` (`erupt_post_id`),
  KEY `FKdvwfw4x66ahh1tavd69cnx4i0` (`create_user_id`),
  KEY `FKct3f9stm4eti10401f7rbh5ey` (`update_user_id`),
  KEY `FKga0jd7sahnn1tv14mq4dy5kba` (`erupt_menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `e_upms_user` */

insert  into `e_upms_user`(`id`,`name`,`create_time`,`update_time`,`account`,`email`,`is_admin`,`is_md5`,`password`,`phone`,`remark`,`reset_pwd_time`,`status`,`white_ip`,`erupt_org_id`,`erupt_post_id`,`create_user_id`,`update_user_id`,`erupt_menu_id`) values 
(1,'erupt','2022-08-23 22:06:27',NULL,'erupt',NULL,'','','610d44f73b7709169e8e06ca4ac5af8e',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `e_upms_user_role` */

DROP TABLE IF EXISTS `e_upms_user_role`;

CREATE TABLE `e_upms_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK3h4lekfh26f5f8b7by3ejges6` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `e_upms_user_role` */

/*Table structure for table `positions` */

DROP TABLE IF EXISTS `positions`;

CREATE TABLE `positions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `detail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fixed_salary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_salary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `min_salary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `positions` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `roles` */

/*Table structure for table `tags` */

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tags` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `birthday` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `des` longtext COLLATE utf8_unicode_ci,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `openid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` bigint(20) DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

/*Table structure for table `user_position` */

DROP TABLE IF EXISTS `user_position`;

CREATE TABLE `user_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `position_id` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_position` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
