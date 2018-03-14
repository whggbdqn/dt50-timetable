/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.1.30-community : Database - coursemanagement
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`coursemanagement` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `coursemanagement`;

/*Table structure for table `tb_class` */

DROP TABLE IF EXISTS `tb_class`;

CREATE TABLE `tb_class` (
  `classID` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级编号',
  `className` varchar(20) DEFAULT NULL COMMENT '班级名称',
  `totalNum` int(11) DEFAULT NULL COMMENT '班级总人数',
  `beginYear` date DEFAULT NULL COMMENT '开班时间',
  `classType` int(11) DEFAULT NULL COMMENT '班级类型',
  `state` int(11) DEFAULT '1' COMMENT '逻辑状态',
  PRIMARY KEY (`classID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `tb_class` */

insert  into `tb_class`(`classID`,`className`,`totalNum`,`beginYear`,`classType`,`state`) values (1,'dt49',31,'2017-04-01',1,0),(2,'dt50',34,'2017-04-15',1,1),(3,'dt51',24,'2017-04-20',1,1),(4,'dt52',28,'2017-04-28',2,1),(5,'dt53',39,'2017-05-03',1,1),(6,'dt54',36,'2017-04-12',1,1),(7,'dt55',44,'2017-05-15',1,1),(8,'dt56',30,NULL,1,1),(9,'dt57',34,'2017-06-06',1,1),(10,'dt58',49,'2017-06-24',2,1),(11,'dt59',29,'2018-01-12',1,1),(12,'dt60',30,'2018-01-02',2,1),(13,'dt61',39,'2017-12-07',1,1),(16,'dt63',30,'2017-04-17',1,0);

/*Table structure for table `tb_classnode` */

DROP TABLE IF EXISTS `tb_classnode`;

CREATE TABLE `tb_classnode` (
  `nodeID` int(11) NOT NULL AUTO_INCREMENT COMMENT '节点编号',
  `nodeName` varchar(50) DEFAULT NULL COMMENT '节点名称',
  `nodeType` int(11) DEFAULT NULL COMMENT '节点类型',
  PRIMARY KEY (`nodeID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `tb_classnode` */

insert  into `tb_classnode`(`nodeID`,`nodeName`,`nodeType`) values (1,'预科1',1),(2,'预科2',1),(3,'预科3',1),(4,'预科4',1),(5,'开学典礼',3),(6,'Java1',1),(7,'Java2',1),(8,'Java3',1),(9,'Java4',1),(10,'Java5',1),(11,'Java6',1),(12,'Java高级',1),(13,'web前端',1),(14,'Jsp1',1),(15,'Jsp2',1),(16,'毕业典礼',3),(17,'平面UI设计',2),(18,'网页UI设计',2),(19,'移动UI设计',2),(20,'毕业设计',2),(21,'沟通始于心',3),(22,'情绪与压力管理',3),(23,'看准求职目标',3),(24,'自习',3);

/*Table structure for table `tb_classroom` */

DROP TABLE IF EXISTS `tb_classroom`;

CREATE TABLE `tb_classroom` (
  `roomID` int(11) NOT NULL AUTO_INCREMENT COMMENT '机房编号',
  `roomName` varchar(20) DEFAULT NULL COMMENT '机房名称',
  `roomSize` int(11) DEFAULT NULL COMMENT '机房容纳人数',
  `roomType` int(11) DEFAULT NULL COMMENT '机房类型',
  PRIMARY KEY (`roomID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `tb_classroom` */

insert  into `tb_classroom`(`roomID`,`roomName`,`roomSize`,`roomType`) values (1,'一机房',40,0),(2,'二机房',30,0),(3,'三机房',30,0),(4,'四机房',30,0),(5,'五机房',40,0),(7,'七机房',40,0),(8,'八机房',30,0),(9,'一教室',38,1),(10,'多媒体机房',52,2);

/*Table structure for table `tb_classroomtype` */

DROP TABLE IF EXISTS `tb_classroomtype`;

CREATE TABLE `tb_classroomtype` (
  `roomType` int(11) DEFAULT NULL COMMENT '机房类型',
  `classRoomTypeName` varchar(50) DEFAULT NULL COMMENT '机房类型名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_classroomtype` */

insert  into `tb_classroomtype`(`roomType`,`classRoomTypeName`) values (0,'机房'),(1,'教室'),(2,'多媒体');

/*Table structure for table `tb_course` */

DROP TABLE IF EXISTS `tb_course`;

CREATE TABLE `tb_course` (
  `courseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程编号',
  `courseName` varchar(50) DEFAULT NULL COMMENT '课程名称',
  `coursePeriod` int(11) DEFAULT NULL COMMENT '课程周期',
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tb_course` */

insert  into `tb_course`(`courseID`,`courseName`,`coursePeriod`) values (1,'JAVA',6),(2,'UI',4),(3,'COT',6);

/*Table structure for table `tb_coursetable` */

DROP TABLE IF EXISTS `tb_coursetable`;

CREATE TABLE `tb_coursetable` (
  `scoreNum` int(5) NOT NULL AUTO_INCREMENT COMMENT '记录编号',
  `c_dateTime` varchar(30) DEFAULT NULL COMMENT '记录编号',
  `c_classromm` varchar(20) DEFAULT NULL COMMENT '教室',
  `c_morning1_class` varchar(20) DEFAULT NULL COMMENT '上午1班级',
  `c_morning1_teacher` varchar(20) DEFAULT NULL COMMENT '上午1老师',
  `c_morning1_course` varchar(20) DEFAULT NULL COMMENT '上午1课程',
  `c_morning2_class` varchar(20) DEFAULT NULL COMMENT '上午2班级',
  `c_morning2_teacher` varchar(20) DEFAULT NULL COMMENT '上午2老师',
  `c_morning2_course` varchar(20) DEFAULT NULL COMMENT '上午2课程',
  `c_afternoon1_class` varchar(20) DEFAULT NULL COMMENT '下午1班级',
  `c_afternoon1_teacher` varchar(20) DEFAULT NULL COMMENT '下午1老师',
  `c_afternoon1_course` varchar(20) DEFAULT NULL COMMENT '下午1课程',
  `c_afternoon2_class` varchar(20) DEFAULT NULL COMMENT '下午2班级',
  `c_afternoon2_teacher` varchar(20) DEFAULT NULL COMMENT '下午2老师',
  `c_afternoon2_course` varchar(20) DEFAULT NULL COMMENT '下午2课程',
  `c_evening_class` varchar(20) DEFAULT NULL COMMENT '晚上班级',
  `c_evening_teacher` varchar(20) DEFAULT NULL COMMENT '晚上老师',
  `c_evening_course` varchar(20) DEFAULT NULL COMMENT '晚上课程',
  `c_morning1_type` int(11) DEFAULT '1',
  `c_afternoon1_type` int(11) DEFAULT '2',
  `c_evening_type` int(11) DEFAULT '3',
  PRIMARY KEY (`scoreNum`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

/*Data for the table `tb_coursetable` */

insert  into `tb_coursetable`(`scoreNum`,`c_dateTime`,`c_classromm`,`c_morning1_class`,`c_morning1_teacher`,`c_morning1_course`,`c_morning2_class`,`c_morning2_teacher`,`c_morning2_course`,`c_afternoon1_class`,`c_afternoon1_teacher`,`c_afternoon1_course`,`c_afternoon2_class`,`c_afternoon2_teacher`,`c_afternoon2_course`,`c_evening_class`,`c_evening_teacher`,`c_evening_course`,`c_morning1_type`,`c_afternoon1_type`,`c_evening_type`) values (103,'02/01/2018','一机房','dt49','文雯','自习','dt49','文雯','自习','dt49','徐士甲','预科1','dt49','徐士甲','预科1','','','',1,2,3),(104,'02/01/2018','二机房','dt51','孙子荃','预科1','dt51','孙子荃','预科1','dt51','阮柳','自习','dt51','阮柳','自习','','','',1,2,3),(105,'02/01/2018','三机房','dt52','吴志超','毕业设计','dt52','吴志超','毕业设计','dt52','罗纯','自习','dt52','罗纯','自习','','','',1,2,3),(106,'02/01/2018','四机房','dt59','朱大玲','自习','dt59','朱大玲','自习','dt59','包俊文','预科1','dt59','包俊文','预科1','','','',1,2,3),(107,'02/01/2018','七机房','dt53','罗纯','自习','dt53','罗纯','自习','dt53','王建兵','预科4','dt53','王建兵','预科4','','','',1,2,3),(108,'02/02/2018','一机房','dt49','文雯','自习','dt49','文雯','自习','dt49','徐士甲','预科1','dt49','徐士甲','预科1','','','',1,2,3),(109,'02/02/2018','二机房','dt52','吴志超','平面UI设计','dt52','吴志超','平面UI设计','dt52','罗纯','自习','dt52','罗纯','自习','','','',1,2,3),(110,'02/02/2018','三机房','dt59','包俊文','预科4','dt59','包俊文','预科4','dt59','朱大玲','自习','dt59','朱大玲','自习','','','',1,2,3),(111,'02/02/2018','四机房','dt51','阮柳','自习','dt51','阮柳','自习','dt51','孙子荃','Java2','dt51','孙子荃','Java2','','','',1,2,3),(112,'02/03/2018','一机房','dt50','朱大玲','沟通始于心','dt50','朱大玲','沟通始于心','dt50','王建兵','Java1','dt50','王建兵','Java1','','','',1,2,3),(113,'02/03/2018','二机房','dt52','罗纯','沟通始于心','dt52','罗纯','沟通始于心','dt52','吴志超','移动UI设计','dt52','吴志超','移动UI设计','','','',1,2,3);

/*Table structure for table `tb_dutiesinfo` */

DROP TABLE IF EXISTS `tb_dutiesinfo`;

CREATE TABLE `tb_dutiesinfo` (
  `dutiesID` int(11) NOT NULL AUTO_INCREMENT COMMENT '职务编号',
  `dutiesName` varchar(20) DEFAULT NULL COMMENT '职务名称',
  PRIMARY KEY (`dutiesID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tb_dutiesinfo` */

insert  into `tb_dutiesinfo`(`dutiesID`,`dutiesName`) values (1,'教员'),(2,'班主任'),(3,'排课老师'),(4,'校长');

/*Table structure for table `tb_duty_menu` */

DROP TABLE IF EXISTS `tb_duty_menu`;

CREATE TABLE `tb_duty_menu` (
  `duty_menuID` int(11) DEFAULT NULL,
  `dutiesID` int(11) DEFAULT NULL,
  `menuID` decimal(11,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_duty_menu` */

insert  into `tb_duty_menu`(`duty_menuID`,`dutiesID`,`menuID`) values (1,1,'1'),(2,1,'5'),(3,1,'13'),(4,2,'1'),(5,2,'5'),(6,2,'13'),(7,3,'1'),(8,3,'2'),(9,3,'3'),(10,3,'4'),(11,3,'5'),(12,3,'6'),(13,3,'7'),(14,3,'8'),(15,3,'9'),(16,3,'10'),(17,3,'11'),(18,3,'12'),(19,3,'13'),(20,4,'2'),(21,4,'3'),(22,4,'4'),(23,4,'5'),(24,4,'6'),(25,4,'7'),(26,4,'8'),(27,4,'9'),(28,4,'10'),(29,4,'11'),(30,4,'13'),(31,1,'10'),(32,2,'10'),(33,4,'1'),(34,4,'14');

/*Table structure for table `tb_exceltable` */

DROP TABLE IF EXISTS `tb_exceltable`;

CREATE TABLE `tb_exceltable` (
  `exceltable_id` int(11) NOT NULL AUTO_INCREMENT,
  `exceltable_name` varchar(50) DEFAULT NULL,
  `exceltable_filepath` varchar(100) DEFAULT NULL,
  `exceltable_type` varchar(100) DEFAULT NULL,
  `exceltable_file` longblob,
  PRIMARY KEY (`exceltable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tb_exceltable` */

insert  into `tb_exceltable`(`exceltable_id`,`exceltable_name`,`exceltable_filepath`,`exceltable_type`,`exceltable_file`) values (1,'新课表','工作簿1.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','PK\0\0\0\0\0!\0��yk\0\0\r\0\0\0[Content_Types].xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���n�0���U�S�a�&\n��9nHc�%.�H�(6�~i\nhB��Q��}q�&��d+��-ٰ��tJ�yɾfo�#ː�U�8%�\0����f4�x�,f[,YM�8GYC#�plܩ\\h��0�^ȅ���t��RN��^�KC��:~�0Ȳ�.�e�Lxo���U�|K(bf��Z{��6�%�;��y�4A+Ȧ\"лh�\r�6�ǅŷs��H�KWUZ�rr��\n��5\05�Hk�mw���S0��l�=_>������[H2\'�Hx��v��ȵ�>)�ɸ�����|ľ��1NP���6;�Qi�I_��q��t;��@�˖K$�\\��dz�<]f�_\0\0\0��\0PK\0\0\0\0\0!\0^�e\0\0�\0\0\0_rels/.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���N�0��H�C���n ���]&��*`����Q�A��$�F��؟?��)��8��|h�*��r)�j6���|)W�R���`ϖ�<Q����j�L=�4���\\lP���=\0�Ѐ!cG6u*����58���<���COq0J�����<��yٛ��մg}��3+��H֐Y9��|l�5�D_STҰ~J�\0�\\��%�\'�\\N���0PD�A��y�O���r�刦��t���w�������c�<,���F�ɷ,>\0\0\0��\0PK\0\0\0\0\0!\0�>���\0\0\0�\0\0\Z\0xl/_rels/workbook.xml.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���J�0����nӮ\"\"��E��j}��L��m2㟾���ۅe���f���2���k�&�WP%�&��w\nޚ���[=�\n&$���W�4�K��H\"�xR��㣔d�����NҨ9��ɨ�Aw(7ey/���O��\n��ނh�����m�|\n�}D�g\"$�4��F�Y��.2#���5�9��鳔�Y]b��d��@��%�s�\"�ݚ0�tB��)���[����ȓ���\0\0��\0PK\0\0\0\0\0!\0#�Ǒ5\0\0�\0\0\0\0\0xl/workbook.xml�Q�N1�#�Q�4����J��J��6�nԼ��l��x�*�\'{��xl�G������t8(([9��ӏ���=%1	+�v8=A����j޺��tnOP�FN�����X5`D8+�F$�aǢ dl\0��lT��ei�0��pu�*xr���M�H\0-ڏ���Zi�����0���)�\"�g�HN�]�p�����0.Ɣ�?C��nڍ�6��$ǭ�ҵ���Ny�魒��tT܍��s��vM�6اk�.��~�E��f���Άx�..��a�0	K9�\n�o���*�.䇓�t4�/�+�\0\0��\0PK\0\0\0\0\0!\0}A�7\0\02\0\0\0\0\0xl/sharedStrings.xml�Q�j1��!�\Z��ٍK�D����;�3�ff��K���֟�?:-����\\2/�͛7�h�j�|�\\z}�\0�Xz\\������^+b��[G�\\���^_eD����늹\ZCE�Q/ր�,c\n��V����\n������w&8�Z�A���\Z�o\r��\Z6#o3�N��s\\L������9`g��hAC�]!��\0Aڀ��(8{/[�O�<���e�h��A��㶁�଒�:x�.d�6g��%�ۭ��YRˈ<)%E�xW˲��G��,��Ƿ������\0\0\0��\0PK\0\0\0\0\0!\0�&ϟ�\0\06\0\0\0\0\0xl/theme/theme1.xml�YMo7��X콑d�#2\"�>�&vDJ��]j�w� );�ɱ@��i�K��z(�H�^�_�6E��rW+R�j��!-b_$�����\r��r�aB�c�aiǯ]��N�4��wG��.���(\re)��s,���~p��\'��T젎K��T*\"�a$.���l�x�$|�Q%���&��U�6+	\"��(��&`w�O�w*�\Z(*�xNk\n!�K�w�hǇBv2���Q$$<��U��Wv�T�NaD�[�n��\n�� �n�9y4.\'����^�_�\\��[�f�Y��\0�Ҝ�鳱���5\n��?:|�Z�횅7�o�q�k��A���\Z~0�B-����\Z�^omu�^�r|s\rߪ���-�A1%�t\r]m4���Ֆ�	�Nx�Q��\n�KTCY]j�	K�ZK��\0P@�$I=9��P�]Dɘ�D�TӠ����P ֆԌ�8�dǿ�!�K��_����3��������>������G?�,��F������O���}���Wn�0����o�~��>Z2z���?�?}��������hl�G$�»�O�;,������񘿙�(FĲ@1�v����ޜ#���c;x�8H�xm���:��L��7��1F�w���ˈ�h�F������A��5w�Vj�����\\vclѼMQ*Q�S,=��M1v��>!V\\�H��`��\'�>\"ΐ���*���I /sAH���{�>��U�𱍄\r����S+���L���r�j���Er8灉�	��0e^?�B�lnqX��� ��yb#�$S��CĘ��i7FI��I\Z�؏�Jy��t����C�w�J7���V������&�e��\'3���5̬���a�2 �^\'$=S����v���ĹyV�z�?(�=4Koc��-�B�Wh��Л������J��`~����d��{B(�9ŇB��4�p\0��N_:qy�b��v2L`�\"���Ǚ���x�N�5_9�D�:^��\Z��ӷ��Yr����Y��f.��x�Q�ÍA��fky�*�k����.(�7!aLf��v�h-U���\Z�� �W�VX�,.+��T��\0jeV�������7�`FpmB�*Oy����|���L���R���e�ۊ�����v�L[$�r�I���&b�:��yh�i��˔Z�T(�X4Z����Es\rv��@SS)h�t��vJ&@Yǟ��>&ԎP\'[D#x�H�o��(Kƅ�!�ע��AB$�%I�W�/�@S�!�[m�%�Yy��A��$���L�1�\"��ϵ��T�_�,��=��oLg��k�j*�!����G3$�V��e��4�Bv�ׂ���qD����������10�k��\Z!)\Z�8R\r���Mˮ�s��u�6R�3Ds�3-UQ]ӭb��6�ˋ5y��\"��.��K���Z�rN(�����랣!Ԗ�Y��uV�]�ڽc��3���I��\\�]�[�#�����:?حV-M�Ji�Å�?\0������B�~?�DC}&)eC���\0\0��\0PK\0\0\0\0\0!\0��\0\0\0\0\0\r\0\0\0xl/styles.xml�T�n�0���$�NmCR\0� -\n$��%�@R�ܢ[��}�n���m\Z��ѣ(�\n24A�Hǻ�w����VptK�aJ&8:\n1�2W�U��]g�F�Y�$M�\Z|��|���jC�E\0!M�7�֋ 0��\nb�TM%XJ��p�U`jMIa�%��q��0�=�B�OD�4�(W�&��gv�aa$��E%�&k��ф�;���^�\\+�J{p�*K���Y΃y\0Hi\\*i\r�U#m��\0�\",n�� 3g��^il>�[�A� �sŕF*�u\ZI��?�������m�������r���9�\\&>�C������\0<�|@�+��n��XQ/_ok�%aB|v`��w��6\ZO�.`\Z��.`\"w�v5��4洴�R�j��V��]+k�}i\\0R)I8���F/\0��r~��}�\0�-�lD&�E�`�W۝Dz���C\Z�*)��^QmY�:�Ñ���%d0��������|F��S�� R�|��k��n��p?�8PT�A��uAnX|w���ئ�Z7�[&=S���\r�,�C�B7<�m{��}hbAK�p{�7&� ��k,p����*�A$� _�!�N\\��K�h��O��W��y6���l49���|�\\�����j���qx�y������=�0-�da8<P�\'�\'u�%xp��w�iCw$���?\0\0\0��\0PK\0\0\0\0\0!\0;D�)\0\0�\0\0\0\0\0xl/worksheets/sheet1.xml�V]s�0}ߙ���ਝVk�agv��9� �aI����\rhW���ι7\'7����<3N��Y�iЂ�������.4\r!q�ta�Qa�/?��y�\"RJ�\n�X����̶Ii���KZ\0��*�^��-ʊ�&��:N`��V�U�h�$a��99洐Z�����HY)Z���\"����X��� �g�o��i�d�;������&�����;�����H�l���9Gvd��r3���ݨh�0�l��r^��ѳ��\r���iF��1,�i(�����w0䀢�?P��Hv�+�es�V�O���\"��m�M�`_+#�	>frų�,����p���7~�RvH%��Y0^�2���TX\ZH�B��Gx��k�L�X�_�$���Z�R&G!y�DC\rU�܆�Y�P`�e�א�mI��H��mCr��$ȣ��m$�jzAC��%yWIӆmK�L/8�_�mK@z!/����?�e��z]�Ӓ\\}�F�.���X���gN\0�Qbu��D�����Է�1ԙ��?-��}�z&\r����[�1w����7Ğ��d�m��?Ğ�X0Ķ}l:�v},�0����\rq�_n���N�6�T:#�!��$�N�Q�k[���d�f���4Z���hǋ��?�`�h��vc��/��o�ū��3��T:_Ш�V��\\/��Zo�q]g:2�a�m>}nF��4\n���G.l5�J������_o�2�]2G}��.Uoo%�v_��W����\\X!��&��c����~���%�\\�1^wS��)�T��\n�{\"8����@uMu�0�\0\0��\0PK\0\0\0\0\0!\0��+j�\0\0�\0\0\0docProps/app.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���N�0��H�C�;uZZU�* ��Ԗ�q&��kG��<�^��Ҿ���m@�1�$*M������<�8[�lRC�ƻ�\r)K�i����b~u�%�˕�2�����ၘ_A@1�3V\"VcΣ.a��dGJ��J!�a�}Q\r^?��!��)�5��!?��Y�8�񻡹�\r_��o*�⼪��\n�����/0�\\k���EAt3Џ��F���[1���e�l�wq\r�Y�T���q\\�F�h�hm#�ܫ\rN�j�rHX��k��V�|��������\'���e�گ͉�*��M@�A�>�ܠ������_\0��-C����J\0����7��>d����_(�����bV�\09m{��⚶l2)�[B��|����~����ް7|�o�\0\0\0��\0PK\0\0\0\0\0!\0$�G\0\0Z\0\0\0docProps/core.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��QK�0���C�{�d�:BہʞV�Br��4$����i��}�1����s/ɖUG_`]��ф��hd��9z-W�E�s-y�h��Z�W�0L4�mc��\n\\H�1ar���0��؁�.	�Mc��i��p�ɷ�g��b�K�9�脔bD���{�jP���4�����*�gC�L���Gv:ŝ����}p�hl�6i�>F�O����_5�tw+�Ȥ`���-�ۻO\n��j��:�yS��?\\�Jg��@}�2\nIؐ������\n3B1���$w��!�܋�.�PP��� ��$)���f1!�E���7�\0\0\0��\0PK\0\0\0\0\0!\0�/*\0\0\0\0\0docProps/custom.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��OK�0��w��I#�֒v�v�xPp�^�t4H����)�y����xޗm?�f�4��iB ��^�S	�{����N��h�(�Ex����؋3V� ��о��l���g�:��X�d0Nu!���0H.Z�\'%t����F!{���+��_�7|i珇��u+��_����K��fM�f$Ct�7(%i��|�ȆZ�f�?� ��2�@w*�����~⡞������Ѿ��*J2\Z�$�0Y�d��_��o�����s�7\0\0\0��\0PK-\0\0\0\0\0\0!\0��yk\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0^�e\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0_rels/.relsPK-\0\0\0\0\0\0!\0�>���\0\0\0�\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0xl/_rels/workbook.xml.relsPK-\0\0\0\0\0\0!\0#�Ǒ5\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0xl/workbook.xmlPK-\0\0\0\0\0\0!\0}A�7\0\02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0p\n\0\0xl/sharedStrings.xmlPK-\0\0\0\0\0\0!\0�&ϟ�\0\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0xl/theme/theme1.xmlPK-\0\0\0\0\0\0!\0��\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0xl/styles.xmlPK-\0\0\0\0\0\0!\0;D�)\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0xl/worksheets/sheet1.xmlPK-\0\0\0\0\0\0!\0��+j�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0docProps/app.xmlPK-\0\0\0\0\0\0!\0$�G\0\0Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\Z\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0�/*\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0M\0\0docProps/custom.xmlPK\0\0\0\0\0\0�\0\0�\0\0\0\0');

/*Table structure for table `tb_info` */

DROP TABLE IF EXISTS `tb_info`;

CREATE TABLE `tb_info` (
  `ifId` int(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ifTitle` varchar(100) DEFAULT NULL COMMENT '标题',
  `ifContent` varchar(1000) DEFAULT NULL COMMENT '内容',
  `ifDate` date DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`ifId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tb_info` */

insert  into `tb_info`(`ifId`,`ifTitle`,`ifContent`,`ifDate`) values (1,'\"自媒体之星\"2017年度评选和年终兑奖开始了！','各位千硕小伙伴:感谢大家在\"自媒体之星\"活动中给予的关注和响应。\"自媒体之星\"2017年度评选和年终兑奖开始了！欢迎坚持发布自媒体的学员和老师前来报备参评和兑奖！本次兑奖是自去年9月1日\"自媒体之星\"活动发起以来的最后一次兑奖。所有符合兑奖要求，需要兑奖的老师或学员，均需在本次完成兑奖，过期不再兑换。本期\"自媒体之星\"活动在2018年将不再延续实施。校区有需要继续此活动的，可在校区范围内重新发起，自行组织实施。','2017-12-01'),(2,'2018年\"元旦\"放假通知','各位同学：根据国家相关法规并结合学校实际情况，学校特对元旦假期作如下决定:1.放假时间:2017年12月31日至2018年1月1日共两天。1月2日正式上课，所有学员必须在1月2日按课表准时到校，并在班主任处签到检阅课表。请全体学员根据放假时间做好自己的假日安排，注意出行安全！希望在节假日期间，各位同学注意安全。30号下午放学后请关好门窗及灯光设备。最后预祝大家有个愉快的假期！','2017-12-29'),(3,'关于征集2018年年会主持人及演出节目的通知','各位同仁：2018年春节将至，共同庆祝公司在2017年取得的丰硕收获以及展现公司内部“百花齐放，百家争鸣”的文化繁荣景象。公司决定在2018年2月7日举行《2018年新春年会》。希望大家集思广益，发扬团结一致的一贯作风，有特长的积极报名，有创意的及时提供!让我们一起参与，一起见证，一起感动，共同期待一场盛会。现就公司年会主持人及表演节目征集作如下通知，望悉知。','2018-01-26'),(4,'\"自媒体之星\"2017年度评选和年终兑奖开始了！','各位千硕小伙伴:感谢大家在\"自媒体之星\"活动中给予的关注和响应。\"自媒体之星\"2017年度评选和年终兑奖开始了！欢迎坚持发布自媒体的学员和老师前来报备参评和兑奖！本次兑奖是自去年9月1日\"自媒体之星\"活动发起以来的最后一次兑奖。所有符合兑奖要求，需要兑奖的老师或学员，均需在本次完成兑奖，过期不再兑换。本期\"自媒体之星\"活动在2018年将不再延续实施。校区有需要继续此活动的，可在校区范围内重新发起，自行组织实施。','2018-01-01'),(5,'2018年\"元旦\"放假通知','各位同学：根据国家相关法规并结合学校实际情况，学校特对元旦假期作如下决定:1.放假时间:2017年12月31日至2018年1月1日共两天。1月2日正式上课，所有学员必须在1月2日按课表准时到校，并在班主任处签到检阅课表。请全体学员根据放假时间做好自己的假日安排，注意出行安全！希望在节假日期间，各位同学注意安全。30号下午放学后请关好门窗及灯光设备。最后预祝大家有个愉快的假期！','2018-01-02'),(6,'关于征集2018年年会主持人及演出节目的通知','各位同仁：2018年春节将至，共同庆祝公司在2017年取得的丰硕收获以及展现公司内部“百花齐放，百家争鸣”的文化繁荣景象。公司决定在2018年2月7日举行《2018年新春年会》。希望大家集思广益，发扬团结一致的一贯作风，有特长的积极报名，有创意的及时提供!让我们一起参与，一起见证，一起感动，共同期待一场盛会。现就公司年会主持人及表演节目征集作如下通知，望悉知。','2018-01-03'),(7,'\"自媒体之星\"2017年度评选和年终兑奖开始了！','各位千硕小伙伴:感谢大家在\"自媒体之星\"活动中给予的关注和响应。\"自媒体之星\"2017年度评选和年终兑奖开始了！欢迎坚持发布自媒体的学员和老师前来报备参评和兑奖！本次兑奖是自去年9月1日\"自媒体之星\"活动发起以来的最后一次兑奖。所有符合兑奖要求，需要兑奖的老师或学员，均需在本次完成兑奖，过期不再兑换。本期\"自媒体之星\"活动在2018年将不再延续实施。校区有需要继续此活动的，可在校区范围内重新发起，自行组织实施。','2018-01-04'),(8,'关于征集2018年年会主持人及演出节目的通知','各位同仁：2018年春节将至，共同庆祝公司在2017年取得的丰硕收获以及展现公司内部“百花齐放，百家争鸣”的文化繁荣景象。公司决定在2018年2月7日举行《2018年新春年会》。希望大家集思广益，发扬团结一致的一贯作风，有特长的积极报名，有创意的及时提供!让我们一起参与，一起见证，一起感动，共同期待一场盛会。现就公司年会主持人及表演节目征集作如下通知，望悉知。','2018-01-05');

/*Table structure for table `tb_menu` */

DROP TABLE IF EXISTS `tb_menu`;

CREATE TABLE `tb_menu` (
  `menuID` int(11) DEFAULT NULL,
  `menuName` varchar(150) DEFAULT NULL,
  `menuParentId` int(11) DEFAULT NULL,
  `menuUrl` varchar(1500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_menu` */

insert  into `tb_menu`(`menuID`,`menuName`,`menuParentId`,`menuUrl`) values (1,'课程模块',0,NULL),(2,'教员模块',0,NULL),(3,'班级模块',0,NULL),(4,'教室模块',0,''),(5,'消息模块',0,NULL),(6,'课程管理',1,'localhost:8080/sortclass/getAllCcd.s'),(7,'教员管理',2,'localhost:8080/sortclass/showTeacher.jsp'),(8,'班级管理',3,'localhost:8080/sortclass/TbClassShow.jsp'),(9,'教室管理',4,'localhost:8080/sortclass/shwoTbClassroom.s'),(10,'意见管理',5,'localhost:8080/sortclass/TbSuggeston2.jsp'),(11,'预览教员',7,NULL),(12,'排课助手',1,'localhost:8080/sortclass/CourseHelper.jsp'),(13,'查看课表',1,'localhost:8080/sortclass/info.s'),(14,'授课管理',2,'localhost:8080/sortclass/Zclass.jsp');

/*Table structure for table `tb_suggestion` */

DROP TABLE IF EXISTS `tb_suggestion`;

CREATE TABLE `tb_suggestion` (
  `suggestionID` int(11) NOT NULL AUTO_INCREMENT COMMENT '意见编号',
  `suggestionTitle` varchar(50) DEFAULT NULL COMMENT '意见标题',
  `suggestionContent` varchar(200) DEFAULT NULL COMMENT '意见内容',
  `releaseTime` date DEFAULT NULL COMMENT '发布时间',
  `teacherID` int(11) DEFAULT NULL COMMENT '教员编号',
  PRIMARY KEY (`suggestionID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `tb_suggestion` */

insert  into `tb_suggestion`(`suggestionID`,`suggestionTitle`,`suggestionContent`,`releaseTime`,`teacherID`) values (6,'请假','1月30号下午给dt55上的课调到星期天上午','2018-01-31',1),(7,'添课','1月18号上午给dt49加一节指导就业课','2018-01-31',6),(8,'换教室','1月26号上午dt50班和dt49班换机房','2018-01-31',7),(9,'请假','1月24号下午给dt55上的课调到星期天上午','2018-01-31',3),(10,'添课','1月19号上午给dt49加一节指导就业课','2018-01-31',2),(11,'换教室','1月6号上午上的java课换到二机房','2018-01-31',4),(12,'请假','1月8号下午给dt55上的课调到星期天上午辅导辅导费',NULL,8),(13,'换教室','DT50想把一教室换位二教室','2018-02-01',9);

/*Table structure for table `tb_teacharinfo` */

DROP TABLE IF EXISTS `tb_teacharinfo`;

CREATE TABLE `tb_teacharinfo` (
  `teacherJobNumber` int(11) DEFAULT NULL COMMENT '教员工号',
  `teacherPhone` varchar(20) DEFAULT NULL COMMENT '教员电话',
  `teacherAge` int(11) DEFAULT NULL COMMENT '教员年龄',
  `teacherSex` int(11) DEFAULT NULL COMMENT '教员性别',
  `teacherPic` varchar(50) DEFAULT NULL COMMENT '教员头像'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_teacharinfo` */

insert  into `tb_teacharinfo`(`teacherJobNumber`,`teacherPhone`,`teacherAge`,`teacherSex`,`teacherPic`) values (1001,'15415156561',21,0,NULL),(1002,'15855858556',21,1,NULL),(1003,'18008018200',21,1,NULL),(1004,'17816218890',23,1,NULL),(1005,'17926325699',23,0,NULL),(1006,'14663565699',23,1,NULL),(1903,'17838384848',NULL,1,NULL),(1903,'17838384848',NULL,1,NULL),(1903,'17838384848',NULL,1,NULL),(1903,'17838384848',NULL,1,NULL),(1903,'17838384848',NULL,1,NULL),(1903,'17838384848',NULL,1,NULL),(1903,'17838384848',NULL,1,NULL),(1903,'17838384848',NULL,1,NULL),(1903,'17838384848',NULL,1,NULL),(1672,'18871753920',NULL,0,NULL),(3672,'18938273829',NULL,0,NULL),(1234,'18875693852',NULL,0,NULL),(1542,'18876596852',NULL,0,NULL);

/*Table structure for table `tb_teacher` */

DROP TABLE IF EXISTS `tb_teacher`;

CREATE TABLE `tb_teacher` (
  `teacherID` int(11) NOT NULL AUTO_INCREMENT,
  `teacherJobNumber` int(11) DEFAULT NULL,
  `teacherName` varchar(60) DEFAULT NULL,
  `teacherPwd` varchar(150) DEFAULT NULL,
  `teacherInTime` datetime DEFAULT NULL,
  `dutiesID` int(11) DEFAULT NULL,
  `teacherState` int(11) DEFAULT NULL,
  PRIMARY KEY (`teacherID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `tb_teacher` */

insert  into `tb_teacher`(`teacherID`,`teacherJobNumber`,`teacherName`,`teacherPwd`,`teacherInTime`,`dutiesID`,`teacherState`) values (1,1001,'文雯','1731f500c3d2c475cb5c6c3344108c6b','2010-07-03 00:00:00',2,1),(2,1002,'徐士甲','a26377de78a0450752a903e07b69176b','2010-06-03 00:00:00',1,1),(3,1003,'吴志超','bf155ac3bbbee1b51856eb5a4189ed75','2010-08-03 00:00:00',1,1),(4,1004,'罗纯','691aaa5c59a985243149cd13abc5a153','2010-01-03 00:00:00',2,1),(5,1005,'丁鹏','f17a90cac781d146946a326f9d43673c','2009-11-03 00:00:00',1,1),(6,1006,'阮柳','7c7f6f0df9add4d1f5a6b8d1e871d9f1','2011-07-03 00:00:00',2,1),(7,1007,'孙子荃','c6e4c47f5fe1e374c489ef1cae46035e','2006-05-03 00:00:00',1,1),(8,1008,'朱大玲','f7583ee89b50996bda7bfa483ee7f081','2009-06-03 00:00:00',2,1),(9,1009,'王建兵','b00efecfa317436173d3d5e920eb44b7','2009-07-26 00:00:00',1,1),(10,1010,'包俊文','621da713a0f786e0da78aaf091880a13','2004-03-03 00:00:00',1,1),(11,1011,'叶倩','a239766996dfb963d32504e7352dc956','2009-05-26 00:00:00',3,1),(12,1012,'陈冠男','7e29621920d1c97204e09dacc2a72543','2000-03-03 00:00:00',2,1),(13,1010,'王芙蓉','8313055c8bd339da6bb225d7c2e6c6ac','2008-04-03 00:00:00',4,1),(31,1542,'哈哈','107458e36ebe97dd7f2bdec774b5b47b','2018-01-31 00:00:00',1,1);

/*Table structure for table `tb_teacher_lessons` */

DROP TABLE IF EXISTS `tb_teacher_lessons`;

CREATE TABLE `tb_teacher_lessons` (
  `teacher_lessons_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '教员授课ID',
  `classID` int(11) DEFAULT NULL COMMENT '班级编号',
  `teacherID` int(11) DEFAULT NULL COMMENT '教员编号',
  PRIMARY KEY (`teacher_lessons_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `tb_teacher_lessons` */

insert  into `tb_teacher_lessons`(`teacher_lessons_ID`,`classID`,`teacherID`) values (1,1,1),(2,1,2),(3,2,8),(4,2,9),(5,3,7),(6,3,6),(7,4,3),(8,4,4),(9,5,9),(10,5,4),(11,6,10),(12,6,1),(13,7,3),(14,7,12),(15,8,1),(16,8,2),(17,9,4),(18,9,9),(19,10,7),(20,10,8),(21,11,8),(22,11,10),(23,12,7),(24,12,12);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
