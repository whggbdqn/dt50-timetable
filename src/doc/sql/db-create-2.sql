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
  PRIMARY KEY (`classID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `tb_class` */

insert  into `tb_class`(`classID`,`className`,`totalNum`,`beginYear`,`classType`) values (1,'dt49',30,'2017-04-03',1),(2,'dt50',34,'2017-04-15',1),(3,'dt51',24,'2017-04-20',1),(4,'dt52',28,'2017-04-28',0),(5,'dt53',39,'2017-05-03',1),(6,'dt54',36,'2017-04-12',0),(7,'dt55',44,'2017-05-15',1),(8,'dt56',50,'2017-05-18',0),(9,'dt57',34,'2017-06-06',1),(10,'dt58',49,'2017-06-24',0);

/*Table structure for table `tb_classnode` */

DROP TABLE IF EXISTS `tb_classnode`;

CREATE TABLE `tb_classnode` (
  `nodeID` int(11) NOT NULL AUTO_INCREMENT COMMENT '节点编号',
  `nodeName` varchar(50) DEFAULT NULL COMMENT '节点名称',
  `nodeType` int(11) DEFAULT NULL COMMENT '节点类型',
  PRIMARY KEY (`nodeID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `tb_classnode` */

insert  into `tb_classnode`(`nodeID`,`nodeName`,`nodeType`) values (1,'预科1',1),(2,'预科2',1),(3,'预科3',1),(4,'预科4',1),(5,'开学典礼',1),(6,'Java1',1),(7,'Java2',1),(8,'Java3',1),(9,'Java4',1),(10,'Java5',1),(11,'Java6',1),(12,'Java高级',1),(13,'web前端',1),(14,'Jsp1',1),(15,'Jsp2',1),(16,'毕业典礼',1),(17,'平面UI设计',2),(18,'网页UI设计',2),(19,'移动UI设计',2),(20,'毕业设计',2);

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

insert  into `tb_classroom`(`roomID`,`roomName`,`roomSize`,`roomType`) values (1,'一机房',40,0),(2,'二机房',30,0),(3,'三机房',30,0),(4,'四机房',30,0),(5,'五机房',30,0),(7,'七机房',40,0),(8,'八机房',30,0),(9,'一教室',30,1),(10,'多媒体机房',52,2);

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

insert  into `tb_course`(`courseID`,`courseName`,`coursePeriod`) values (1,'JAVA',6),(2,'UI',4);

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
  `duty_menuID` int(11) NOT NULL,
  `dutyID` int(11) DEFAULT NULL,
  `menuID` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`duty_menuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_duty_menu` */

/*Table structure for table `tb_menu` */

DROP TABLE IF EXISTS `tb_menu`;

CREATE TABLE `tb_menu` (
  `menuID` int(11) NOT NULL AUTO_INCREMENT,
  `menuName` varchar(50) DEFAULT NULL,
  `menuParentId` int(11) DEFAULT NULL,
  `menuUrl` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`menuID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `tb_menu` */

insert  into `tb_menu`(`menuID`,`menuName`,`menuParentId`,`menuUrl`) values (1,'课程模块',0,NULL),(2,'教员模块',0,NULL),(3,'班级模块',0,NULL),(4,'教室模块',0,NULL),(5,'消息模块',0,NULL);

/*Table structure for table `tb_suggestion` */

DROP TABLE IF EXISTS `tb_suggestion`;

CREATE TABLE `tb_suggestion` (
  `suggestionID` int(11) NOT NULL AUTO_INCREMENT COMMENT '意见编号',
  `suggestionTitle` varchar(50) DEFAULT NULL COMMENT '意见标题',
  `suggestionContent` varchar(200) DEFAULT NULL COMMENT '意见内容',
  `releaseTime` date DEFAULT NULL COMMENT '发布时间',
  `teacherID` int(11) DEFAULT NULL COMMENT '教员编号',
  PRIMARY KEY (`suggestionID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tb_suggestion` */

insert  into `tb_suggestion`(`suggestionID`,`suggestionTitle`,`suggestionContent`,`releaseTime`,`teacherID`) values (1,'添课','需要明天上午给dt49加一节指导就业课','2018-01-18',1),(2,'换教室','需要明天上午上的java课换到二机房','2018-01-18',4),(3,'请假','需要明天下午给dt55上的课调到星期天上午','2018-01-18',5);

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

insert  into `tb_teacharinfo`(`teacherJobNumber`,`teacherPhone`,`teacherAge`,`teacherSex`,`teacherPic`) values (1001,'15415156561',21,0,NULL),(1002,'15855858556',21,1,NULL),(1003,'18008018200',21,1,NULL),(1004,'17816218890',23,1,NULL),(1005,'17926325699',23,0,NULL),(1006,'14663565699',23,1,NULL),(1007,'18665448662',26,0,NULL),(1008,'17265652335',21,1,NULL),(1009,'16664156226',23,1,NULL),(1010,'13231546647',21,1,NULL),(1011,'13555992665',28,0,NULL),(1012,'16666589555',29,0,NULL),(1013,'18955566423',21,0,NULL);

/*Table structure for table `tb_teacher` */

DROP TABLE IF EXISTS `tb_teacher`;

CREATE TABLE `tb_teacher` (
  `teacherID` int(11) NOT NULL AUTO_INCREMENT COMMENT '教员编号',
  `teacherJobNumber` int(11) DEFAULT NULL COMMENT '教员工号',
  `teacherName` varchar(20) DEFAULT NULL COMMENT '教员名称',
  `teacherPwd` varchar(20) DEFAULT NULL COMMENT '教员密码',
  `teacherInTime` datetime DEFAULT NULL COMMENT '入职时间',
  `dutiesID` int(11) DEFAULT NULL COMMENT '职务',
  `teacherState` int(11) DEFAULT NULL COMMENT '教员状态',
  PRIMARY KEY (`teacherID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `tb_teacher` */

insert  into `tb_teacher`(`teacherID`,`teacherJobNumber`,`teacherName`,`teacherPwd`,`teacherInTime`,`dutiesID`,`teacherState`) values (1,1001,'文雯','123','2010-07-03 00:00:00',1,1),(2,1002,'徐士甲','123','2010-06-03 00:00:00',0,1),(3,1003,'吴志超','123','2010-08-03 00:00:00',0,1),(4,1004,'罗纯','123','2010-01-03 00:00:00',1,1),(5,1005,'丁鹏','123','2009-11-03 00:00:00',0,1),(6,1006,'阮柳','123','2011-07-03 00:00:00',1,1),(7,1007,'孙子荃','123','2006-05-03 00:00:00',0,1),(8,1008,'朱大玲','123','2009-06-03 00:00:00',1,1),(9,1009,'王建兵','123','2009-07-26 00:00:00',0,1),(10,1010,'包俊文','123','2004-03-03 00:00:00',0,1),(11,1011,'叶倩','123','2009-05-26 00:00:00',2,1),(12,1012,'郑玮玮','123','2000-03-03 00:00:00',1,1),(13,1010,'王芙蓉','123','2008-04-03 00:00:00',3,1);

/*Table structure for table `tb_teacher_lessons` */

DROP TABLE IF EXISTS `tb_teacher_lessons`;

CREATE TABLE `tb_teacher_lessons` (
  `teacher_lessons_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '教员授课ID',
  `classID` int(11) DEFAULT NULL COMMENT '班级编号',
  `teacherID` int(11) DEFAULT NULL COMMENT '教员编号',
  PRIMARY KEY (`teacher_lessons_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `tb_teacher_lessons` */

insert  into `tb_teacher_lessons`(`teacher_lessons_ID`,`classID`,`teacherID`) values (1,1,1),(2,1,2),(3,2,3),(4,2,4),(5,3,3),(6,3,6),(7,4,5),(8,4,8),(9,5,9),(10,5,4),(11,6,10),(12,6,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
