#机房信息表
INSERT INTO tb_classroom(roomID,roomName,roomSize,roomType) VALUES(1,'一机房',40,0);
INSERT INTO tb_classroom(roomID,roomName,roomSize,roomType) VALUES(2,'二机房',30,0);
INSERT INTO tb_classroom(roomID,roomName,roomSize,roomType) VALUES(3,'三机房',30,0);
INSERT INTO tb_classroom(roomID,roomName,roomSize,roomType) VALUES(4,'四机房',30,0);
INSERT INTO tb_classroom(roomID,roomName,roomSize,roomType) VALUES(5,'五机房',30,0);
INSERT INTO tb_classroom(roomID,roomName,roomSize,roomType) VALUES(6'六机房',45,0);
INSERT INTO tb_classroom(roomID,roomName,roomSize,roomType) VALUES(7,'七机房',40,0);
INSERT INTO tb_classroom(roomID,roomName,roomSize,roomType) VALUES(8,'八机房',30,0);
INSERT INTO tb_classroom(roomID,roomName,roomSize,roomType) VALUES(9,'一教室',30,1);
INSERT INTO tb_classroom(roomID,roomName,roomSize,roomType) VALUES(10,'多媒体机房',52,2);
#机房类型表
INSERT INTO tb_classroomtype(roomType,classRoomTypeName) VALUES(0,'机房');
INSERT INTO tb_classroomtype(roomType,classRoomTypeName) VALUES(1,'教室');
INSERT INTO tb_classroomtype(roomType,classRoomTypeName) VALUES(2,'多媒体');
#课程表
INSERT INTO tb_course(courseID,courseName,coursePeriod)VALUES(1,'JAVA',6);
INSERT INTO tb_course(courseID,courseName,coursePeriod)VALUES(2,'UI',4);
#教员表
#1在职0离职
INSERT INTO tb_teacher(teacherID,teacherJobNumber,teacherName,teacherPwd,teacherInTime,dutiesID,teacherState)VALUES(1,1001,'文雯','123','2010-07-03',1,1);
INSERT INTO tb_teacher(teacherID,teacherJobNumber,teacherName,teacherPwd,teacherInTime,dutiesID,teacherState)VALUES(2,1002,'徐士甲','123','2010-06-03',0,1);
INSERT INTO tb_teacher(teacherID,teacherJobNumber,teacherName,teacherPwd,teacherInTime,dutiesID,teacherState)VALUES(3,1003,'吴志超','123','2010-08-03',0,1);
INSERT INTO tb_teacher(teacherID,teacherJobNumber,teacherName,teacherPwd,teacherInTime,dutiesID,teacherState)VALUES(4,1004,'罗纯','123','2010-01-03',1,1);
INSERT INTO tb_teacher(teacherID,teacherJobNumber,teacherName,teacherPwd,teacherInTime,dutiesID,teacherState)VALUES(5,1005,'丁鹏','123','2009-11-03',0,1);
INSERT INTO tb_teacher(teacherID,teacherJobNumber,teacherName,teacherPwd,teacherInTime,dutiesID,teacherState)VALUES(6,1006,'阮柳','123','2011-07-03',1,1);
INSERT INTO tb_teacher(teacherID,teacherJobNumber,teacherName,teacherPwd,teacherInTime,dutiesID,teacherState)VALUES(7,1007,'孙子荃','123','2006-05-03',0,1);
INSERT INTO tb_teacher(teacherID,teacherJobNumber,teacherName,teacherPwd,teacherInTime,dutiesID,teacherState)VALUES(8,1008,'朱大玲','123','2009-06-03',1,1);
INSERT INTO tb_teacher(teacherID,teacherJobNumber,teacherName,teacherPwd,teacherInTime,dutiesID,teacherState)VALUES(9,1009,'王建兵','123','2009-07-26',0,1);
INSERT INTO tb_teacher(teacherID,teacherJobNumber,teacherName,teacherPwd,teacherInTime,dutiesID,teacherState)VALUES(10,1010,'包俊文','123','2004-03-03',0,1);
INSERT INTO tb_teacher(teacherID,teacherJobNumber,teacherName,teacherPwd,teacherInTime,dutiesID,teacherState)VALUES(11,1011,'叶倩','123','2009-05-26',2,1);
INSERT INTO tb_teacher(teacherID,teacherJobNumber,teacherName,teacherPwd,teacherInTime,dutiesID,teacherState)VALUES(12,1012,'郑玮玮','123','2000-03-03',1,1);
INSERT INTO tb_teacher(teacherID,teacherJobNumber,teacherName,teacherPwd,teacherInTime,dutiesID,teacherState)VALUES(13,1010,'王芙蓉','123','2008-04-03',3,1);
#教员基本信息表
#0女1男
INSERT INTO tb_teacharinfo(teacherJobNumber,teacherPhone,teacherAge,teacherSex) VALUES(1001,'15415156561',21,0);
INSERT INTO tb_teacharinfo(teacherJobNumber,teacherPhone,teacherAge,teacherSex) VALUES(1002,'15855858556',21,1);
INSERT INTO tb_teacharinfo(teacherJobNumber,teacherPhone,teacherAge,teacherSex) VALUES(1003,'18008018200',21,1);
INSERT INTO tb_teacharinfo(teacherJobNumber,teacherPhone,teacherAge,teacherSex) VALUES(1004,'17816218890',23,1);
INSERT INTO tb_teacharinfo(teacherJobNumber,teacherPhone,teacherAge,teacherSex) VALUES(1005,'17926325699',23,0);
INSERT INTO tb_teacharinfo(teacherJobNumber,teacherPhone,teacherAge,teacherSex) VALUES(1006,'14663565699',23,1);
INSERT INTO tb_teacharinfo(teacherJobNumber,teacherPhone,teacherAge,teacherSex) VALUES(1007,'18665448662',26,0);
INSERT INTO tb_teacharinfo(teacherJobNumber,teacherPhone,teacherAge,teacherSex) VALUES(1008,'17265652335',21,1);
INSERT INTO tb_teacharinfo(teacherJobNumber,teacherPhone,teacherAge,teacherSex) VALUES(1009,'16664156226',23,1);
INSERT INTO tb_teacharinfo(teacherJobNumber,teacherPhone,teacherAge,teacherSex) VALUES(1010,'13231546647',21,1);
INSERT INTO tb_teacharinfo(teacherJobNumber,teacherPhone,teacherAge,teacherSex) VALUES(1011,'13555992665',28,0);
INSERT INTO tb_teacharinfo(teacherJobNumber,teacherPhone,teacherAge,teacherSex) VALUES(1012,'16666589555',29,0);
INSERT INTO tb_teacharinfo(teacherJobNumber,teacherPhone,teacherAge,teacherSex) VALUES(1013,'18955566423',21,0);

#班级表
#0 UI班 1 JAVA班
INSERT INTO tb_class(classID,className,totalNum,beginYear,classType)VALUES(1,'dt49',30,'2017-4-3',1);
INSERT INTO tb_class(classID,className,totalNum,beginYear,classType)VALUES(2,'dt50',34,'2017-4-15',1);
INSERT INTO tb_class(classID,className,totalNum,beginYear,classType)VALUES(3,'dt51',24,'2017-4-20',1);
INSERT INTO tb_class(classID,className,totalNum,beginYear,classType)VALUES(4,'dt52',28,'2017-4-28',0);
INSERT INTO tb_class(classID,className,totalNum,beginYear,classType)VALUES(5,'dt53',39,'2017-5-3',1);
INSERT INTO tb_class(classID,className,totalNum,beginYear,classType)VALUES(6,'dt54',36,'2017-4-12',0);
INSERT INTO tb_class(classID,className,totalNum,beginYear,classType)VALUES(7,'dt55',44,'2017-5-15',1);
INSERT INTO tb_class(classID,className,totalNum,beginYear,classType)VALUES(8,'dt56',50,'2017-5-18',0);
INSERT INTO tb_class(classID,className,totalNum,beginYear,classType)VALUES(9,'dt57',34,'2017-6-6',1);
INSERT INTO tb_class(classID,className,totalNum,beginYear,classType)VALUES(10,'dt58',49,'2017-6-24',0);

#职位表
INSERT INTO tb_dutiesinfo(dutiesID,dutiesName)VALUES(1,'教员');
INSERT INTO tb_dutiesinfo(dutiesID,dutiesName)VALUES(2,'班主任');
INSERT INTO tb_dutiesinfo(dutiesID,dutiesName)VALUES(3,'排课老师');
INSERT INTO tb_dutiesinfo(dutiesID,dutiesName)VALUES(4,'校长');

#教员授课表
INSERT INTO tb_teacher_lessons(teacher_lessons_ID,classID,teacherID)VALUES(1,1,1);
INSERT INTO tb_teacher_lessons(teacher_lessons_ID,classID,teacherID)VALUES(2,1,2);
INSERT INTO tb_teacher_lessons(teacher_lessons_ID,classID,teacherID)VALUES(3,2,3);
INSERT INTO tb_teacher_lessons(teacher_lessons_ID,classID,teacherID)VALUES(4,2,4);
INSERT INTO tb_teacher_lessons(teacher_lessons_ID,classID,teacherID)VALUES(5,3,3);
INSERT INTO tb_teacher_lessons(teacher_lessons_ID,classID,teacherID)VALUES(6,3,6);
INSERT INTO tb_teacher_lessons(teacher_lessons_ID,classID,teacherID)VALUES(7,4,5);
INSERT INTO tb_teacher_lessons(teacher_lessons_ID,classID,teacherID)VALUES(8,4,8);
INSERT INTO tb_teacher_lessons(teacher_lessons_ID,classID,teacherID)VALUES(9,5,9);
INSERT INTO tb_teacher_lessons(teacher_lessons_ID,classID,teacherID)VALUES(10,5,4);
INSERT INTO tb_teacher_lessons(teacher_lessons_ID,classID,teacherID)VALUES(11,6,10);
INSERT INTO tb_teacher_lessons(teacher_lessons_ID,classID,teacherID)VALUES(12,6,1);

#意见表
INSERT INTO tb_suggestion(suggestionID,suggestionTitle,suggestionContent,releaseTime,teacherID)VALUES(1,'添课','需要明天上午给dt49加一节指导就业课',NOW(),1);
INSERT INTO tb_suggestion(suggestionID,suggestionTitle,suggestionContent,releaseTime,teacherID)VALUES(2,'换教室','需要明天上午上的java课换到二机房',NOW(),4);
INSERT INTO tb_suggestion(suggestionID,suggestionTitle,suggestionContent,releaseTime,teacherID)VALUES(3,'请假','需要明天下午给dt55上的课调到星期天上午',NOW(),5);

#节点表
INSERT INTO tb_classnode(nodeID,nodeName,nodeType)VALUES(1,'预科1',1);
INSERT INTO tb_classnode(nodeID,nodeName,nodeType)VALUES(2,'预科2',1);
INSERT INTO tb_classnode(nodeID,nodeName,nodeType)VALUES(3,'预科3',1);
INSERT INTO tb_classnode(nodeID,nodeName,nodeType)VALUES(4,'预科4',1);
INSERT INTO tb_classnode(nodeID,nodeName,nodeType)VALUES(5,'开学典礼',1);
INSERT INTO tb_classnode(nodeID,nodeName,nodeType)VALUES(6,'Java1',1);
INSERT INTO tb_classnode(nodeID,nodeName,nodeType)VALUES(7,'Java2',1);
INSERT INTO tb_classnode(nodeID,nodeName,nodeType)VALUES(8,'Java3',1);
INSERT INTO tb_classnode(nodeID,nodeName,nodeType)VALUES(9,'Java4',1);
INSERT INTO tb_classnode(nodeID,nodeName,nodeType)VALUES(10,'Java5',1);
INSERT INTO tb_classnode(nodeID,nodeName,nodeType)VALUES(11,'Java6',1);
INSERT INTO tb_classnode(nodeID,nodeName,nodeType)VALUES(12,'Java高级',1);
INSERT INTO tb_classnode(nodeID,nodeName,nodeType)VALUES(13,'web前端',1);
INSERT INTO tb_classnode(nodeID,nodeName,nodeType)VALUES(14,'Jsp1',1);
INSERT INTO tb_classnode(nodeID,nodeName,nodeType)VALUES(15,'Jsp2',1);
INSERT INTO tb_classnode(nodeID,nodeName,nodeType)VALUES(16,'毕业典礼',1);
INSERT INTO tb_classnode(nodeID,nodeName,nodeType)VALUES(17,'平面UI设计',2);
INSERT INTO tb_classnode(nodeID,nodeName,nodeType)VALUES(18,'网页UI设计',2);
INSERT INTO tb_classnode(nodeID,nodeName,nodeType)VALUES(19,'移动UI设计',2);
INSERT INTO tb_classnode(nodeID,nodeName,nodeType)VALUES(20,'毕业设计',2);

