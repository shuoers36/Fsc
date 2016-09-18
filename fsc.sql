/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50142
Source Host           : localhost:3306
Source Database       : fsc

Target Server Type    : MYSQL
Target Server Version : 50142
File Encoding         : 65001

Date: 2016-09-07 12:52:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `Activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `Class_id` int(11) DEFAULT NULL,
  `Activity_time` varchar(1024) DEFAULT NULL,
  `Activity_name` varchar(1024) DEFAULT NULL,
  `Activity_content` varchar(1024) DEFAULT NULL,
  `Photo_path` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=705 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('703', '1', '2016-09-07 09:29:35', '明天放假', '明天放假回家和就看见', 'http://localhost:8080/fsc/upload/a2cf28d2-268c-4620-a157-db2e4d78c52a.jpg');
INSERT INTO `activity` VALUES ('704', '1', '2016-09-07 09:29:52', '回家啦', '坐火车啦', 'http://localhost:8080/fsc/upload/7c4df061-882a-4048-b7da-c1733f63bacf.jpg');

-- ----------------------------
-- Table structure for `announcement`
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `Announcement_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_id` int(11) DEFAULT NULL,
  `Announcement_title` varchar(1024) DEFAULT NULL,
  `Announcement_content` varchar(1024) DEFAULT NULL,
  `Announcement_time` datetime DEFAULT NULL,
  PRIMARY KEY (`Announcement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES ('3', '2333', '明天放假', '大家玩好', '2016-09-07 10:42:38');
INSERT INTO `announcement` VALUES ('4', '2333', '明天所有人交10篇作文', '一篇800字以上', '2016-09-07 10:42:51');

-- ----------------------------
-- Table structure for `attendance`
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `Attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `Student_name` varchar(1024) DEFAULT NULL,
  `Attendance_content` varchar(1024) DEFAULT NULL,
  `Attendance_time` varchar(1024) DEFAULT NULL,
  `Student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Attendance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attendance
-- ----------------------------
INSERT INTO `attendance` VALUES ('1', '钱同学', 'active', '3', '4');
INSERT INTO `attendance` VALUES ('2', '钱同学', 'active', '1', '4');
INSERT INTO `attendance` VALUES ('3', '钱同学', 'active', '2', '4');
INSERT INTO `attendance` VALUES ('4', '钱同学', 'active', '4', '4');
INSERT INTO `attendance` VALUES ('5', '钱同学', 'active', '5', '4');
INSERT INTO `attendance` VALUES ('6', '钱同学', 'positive', '6', '4');
INSERT INTO `attendance` VALUES ('7', '钱同学', 'active', '7', '4');
INSERT INTO `attendance` VALUES ('8', '钱同学', 'positive', '8', '4');
INSERT INTO `attendance` VALUES ('9', '钱同学', 'positive', '9', '4');
INSERT INTO `attendance` VALUES ('10', '钱同学', 'active', '10', '4');
INSERT INTO `attendance` VALUES ('11', '钱同学', 'positive', '11', '4');
INSERT INTO `attendance` VALUES ('12', '钱同学', 'active', '12', '4');
INSERT INTO `attendance` VALUES ('13', '钱同学', 'positive', '13', '4');
INSERT INTO `attendance` VALUES ('14', '钱同学', 'active', '14', '4');
INSERT INTO `attendance` VALUES ('15', '钱同学', 'positive', '15', '4');
INSERT INTO `attendance` VALUES ('16', '钱同学', 'active', '16', '4');
INSERT INTO `attendance` VALUES ('17', '钱同学', 'active', '17', '4');
INSERT INTO `attendance` VALUES ('18', '钱同学', 'positive', '18', '4');
INSERT INTO `attendance` VALUES ('19', '钱同学', 'positive', '19', '4');
INSERT INTO `attendance` VALUES ('20', '钱同学', 'positive', '20', '4');
INSERT INTO `attendance` VALUES ('21', '钱同学', 'active', '21', '4');
INSERT INTO `attendance` VALUES ('22', '钱同学', 'active', '22', '4');
INSERT INTO `attendance` VALUES ('23', '钱同学', 'positive', '23', '4');
INSERT INTO `attendance` VALUES ('24', '钱同学', 'active', '24', '4');
INSERT INTO `attendance` VALUES ('25', '钱同学', 'active', '25', '4');
INSERT INTO `attendance` VALUES ('26', '钱同学', 'active', '26', '4');
INSERT INTO `attendance` VALUES ('27', '钱同学', 'active', '27', '4');
INSERT INTO `attendance` VALUES ('28', '钱同学', 'active', '28', '4');
INSERT INTO `attendance` VALUES ('29', '钱同学', 'active', '29', '4');
INSERT INTO `attendance` VALUES ('30', '钱同学', 'positive', '30', '4');

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `Class_id` int(11) NOT NULL,
  `Class_num` varchar(1024) DEFAULT NULL,
  `Class_location` varchar(1024) DEFAULT NULL,
  `Grade` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1313', '1', null, '1');
INSERT INTO `class` VALUES ('1314', '2', null, '2');
INSERT INTO `class` VALUES ('1315', '3', null, '2');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `Comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `Teacher_name` varchar(1024) DEFAULT NULL,
  `Student_id` int(11) DEFAULT NULL,
  `Message_content` varchar(1024) DEFAULT NULL,
  `Message_time` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('4', '赵老师', '4', '明天放假', '2016/09/07 09:24:29');

-- ----------------------------
-- Table structure for `hold`
-- ----------------------------
DROP TABLE IF EXISTS `hold`;
CREATE TABLE `hold` (
  `Class_id` int(11) NOT NULL,
  `Activity_id` int(11) NOT NULL,
  PRIMARY KEY (`Class_id`,`Activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hold
-- ----------------------------

-- ----------------------------
-- Table structure for `homework`
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework` (
  `Homework_id` int(11) NOT NULL AUTO_INCREMENT,
  `Subject_name` varchar(1024) DEFAULT NULL,
  `Class_id` int(11) DEFAULT NULL,
  `Homework_content` varchar(1024) DEFAULT NULL,
  `Homework_time` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Homework_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of homework
-- ----------------------------
INSERT INTO `homework` VALUES ('6', '语文', '1313', '明天不交作文', '2016-09-07 10:40:55');
INSERT INTO `homework` VALUES ('7', '语文', '1313', '不交作文是骗你们的，交10篇', '2016-09-07 10:41:10');
INSERT INTO `homework` VALUES ('8', '数学', '1313', '明天做100道选择题', '2016-09-07 10:46:36');

-- ----------------------------
-- Table structure for `honor`
-- ----------------------------
DROP TABLE IF EXISTS `honor`;
CREATE TABLE `honor` (
  `Honor_id` int(11) NOT NULL AUTO_INCREMENT,
  `Student_id` int(11) DEFAULT NULL,
  `Honor_content` varchar(1024) DEFAULT NULL,
  `Honor_time` datetime DEFAULT NULL,
  PRIMARY KEY (`Honor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of honor
-- ----------------------------
INSERT INTO `honor` VALUES ('1', '4', '获得一朵小红花', '2016-09-21 11:03:02');
INSERT INTO `honor` VALUES ('2', '4', '获得两朵小红花', '2016-08-31 11:03:21');

-- ----------------------------
-- Table structure for `leader`
-- ----------------------------
DROP TABLE IF EXISTS `leader`;
CREATE TABLE `leader` (
  `Leader_id` int(11) NOT NULL AUTO_INCREMENT,
  `Leader_name` varchar(1024) DEFAULT NULL,
  `Leader_password` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Leader_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leader
-- ----------------------------
INSERT INTO `leader` VALUES ('6', '王校长', '123');
INSERT INTO `leader` VALUES ('7', '李主任', '111');
INSERT INTO `leader` VALUES ('11', '石主任', '5432');
INSERT INTO `leader` VALUES ('13', '常主任', '1642');

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `Manager_id` int(11) NOT NULL,
  `Manager_password` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `Message_id` int(11) NOT NULL AUTO_INCREMENT,
  `Addresser_name` varchar(1024) NOT NULL,
  `Addressee_name` varchar(1024) NOT NULL,
  `Message_title` varchar(1024) DEFAULT NULL,
  `Message_content` varchar(1024) DEFAULT NULL,
  `Message_time` varchar(1024) NOT NULL,
  PRIMARY KEY (`Message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('3', '赵老师', 'root', '明天放假', '明天放假放假放假', '2016-09-07 09:15:10');
INSERT INTO `message` VALUES ('4', '赵老师', 'root', '回家', '明天回家回家回家\r\n', '2016-09-07 09:16:04');

-- ----------------------------
-- Table structure for `parent`
-- ----------------------------
DROP TABLE IF EXISTS `parent`;
CREATE TABLE `parent` (
  `Parent_id` int(11) NOT NULL AUTO_INCREMENT,
  `Student_id` int(11) DEFAULT NULL,
  `Parent_name` varchar(1024) DEFAULT NULL,
  `Parent_password` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parent
-- ----------------------------
INSERT INTO `parent` VALUES ('2', '5', '孙家长', '123');
INSERT INTO `parent` VALUES ('3', '4', '钱家长', '123');
INSERT INTO `parent` VALUES ('4', '4', '钱家长', '1242');
INSERT INTO `parent` VALUES ('5', '5', '孙家长', '8888');
INSERT INTO `parent` VALUES ('6', '6', '李家长', '5222');
INSERT INTO `parent` VALUES ('7', '7', '周家长', '666');
INSERT INTO `parent` VALUES ('8', '8', '吴家长', '22211');

-- ----------------------------
-- Table structure for `resource`
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `Resource_id` int(11) NOT NULL,
  `Resource_name` varchar(1024) DEFAULT NULL,
  `Parents` int(11) DEFAULT NULL,
  PRIMARY KEY (`Resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '1', null);
INSERT INTO `resource` VALUES ('2', '2', null);
INSERT INTO `resource` VALUES ('3', '3', null);
INSERT INTO `resource` VALUES ('4', '4', null);
INSERT INTO `resource` VALUES ('5', '5', '1');
INSERT INTO `resource` VALUES ('6', '1.s', '1');
INSERT INTO `resource` VALUES ('7', '1.g', '1');
INSERT INTO `resource` VALUES ('8', '1.c', '1');

-- ----------------------------
-- Table structure for `resource_role`
-- ----------------------------
DROP TABLE IF EXISTS `resource_role`;
CREATE TABLE `resource_role` (
  `Resource_Role_id` int(11) NOT NULL AUTO_INCREMENT,
  `Role_id` int(11) DEFAULT NULL,
  `Resource_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Resource_Role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource_role
-- ----------------------------
INSERT INTO `resource_role` VALUES ('1', '1', '1');
INSERT INTO `resource_role` VALUES ('2', '2', '2');
INSERT INTO `resource_role` VALUES ('3', '3', '3');
INSERT INTO `resource_role` VALUES ('4', '4', '4');
INSERT INTO `resource_role` VALUES ('6', '5', '5');
INSERT INTO `resource_role` VALUES ('7', '3', '4');
INSERT INTO `resource_role` VALUES ('8', '4', '1');
INSERT INTO `resource_role` VALUES ('9', '4', '2');
INSERT INTO `resource_role` VALUES ('10', '4', '3');
INSERT INTO `resource_role` VALUES ('11', '4', '4');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `Role_id` int(11) NOT NULL,
  `Role_name` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'teacher');
INSERT INTO `role` VALUES ('2', 'student');
INSERT INTO `role` VALUES ('3', 'parent');
INSERT INTO `role` VALUES ('4', 'manage');
INSERT INTO `role` VALUES ('5', 'leader');

-- ----------------------------
-- Table structure for `score`
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `Score_id` int(11) NOT NULL AUTO_INCREMENT,
  `Student_id` int(11) DEFAULT NULL,
  `Subject_name` varchar(1024) DEFAULT NULL,
  `Score` float DEFAULT NULL,
  `Score_time` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Score_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('1', '4', '语文', '88', '2016-09-07 10:48:57');
INSERT INTO `score` VALUES ('2', '4', '数学', '89', '2016-09-07 10:49:22');
INSERT INTO `score` VALUES ('3', '4', '英语', '99', '2016-09-20 10:49:33');
INSERT INTO `score` VALUES ('4', '4', '物理', '44', '2016-09-01 10:49:44');
INSERT INTO `score` VALUES ('5', '4', '计算机', '89', '2016-09-01 10:51:14');
INSERT INTO `score` VALUES ('6', '6', '计算机', '90', '2016-09-02 10:51:17');
INSERT INTO `score` VALUES ('7', '7', '计算机', '91', '2016-09-08 10:51:20');
INSERT INTO `score` VALUES ('8', '8', '计算机', '92', '2016-09-03 10:51:24');
INSERT INTO `score` VALUES ('9', '9', '计算机', '99', '2016-09-01 10:51:28');
INSERT INTO `score` VALUES ('10', '6', '语文', '78', '2016-09-02 10:51:52');
INSERT INTO `score` VALUES ('11', '7', '语文', '75', '2016-09-03 10:51:55');
INSERT INTO `score` VALUES ('12', '8', '语文', '89', '2016-09-07 10:52:05');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `Student_id` int(11) NOT NULL AUTO_INCREMENT,
  `Class_id` int(11) DEFAULT NULL,
  `Student_name` varchar(1024) DEFAULT NULL,
  `Student_password` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('4', '1313', '钱同学', '123');
INSERT INTO `student` VALUES ('5', '1313', '孙同学', '123');
INSERT INTO `student` VALUES ('6', '1313', '李同学', '123');
INSERT INTO `student` VALUES ('7', '1313', '周同学', '123');
INSERT INTO `student` VALUES ('8', '1313', '吴同学', '123');
INSERT INTO `student` VALUES ('9', '1313', '郑同学', '737');
INSERT INTO `student` VALUES ('10', '1314', '王同学', '121313');
INSERT INTO `student` VALUES ('11', '1314', '冯同学', '83838');
INSERT INTO `student` VALUES ('12', '1314', '陈同学', '5344');
INSERT INTO `student` VALUES ('13', '1314', '褚同学', '121213');
INSERT INTO `student` VALUES ('14', '1313', '魏同学', '123455');
INSERT INTO `student` VALUES ('15', '1313', '蒋同学', '6543');
INSERT INTO `student` VALUES ('16', '1314', '沈同学', '6666');
INSERT INTO `student` VALUES ('17', '1315', '韩同学', '56123');
INSERT INTO `student` VALUES ('18', '1315', '杨同学', '131315');
INSERT INTO `student` VALUES ('19', '1315', '朱同学', '888');
INSERT INTO `student` VALUES ('20', '1315', '秦同学', '1315');
INSERT INTO `student` VALUES ('21', '1315', '孔同学', '8888');
INSERT INTO `student` VALUES ('22', '1314', '曹同学', '13111');
INSERT INTO `student` VALUES ('23', '1313', '找同学', '111111');
INSERT INTO `student` VALUES ('24', '1314', '赵同学', '11111');
INSERT INTO `student` VALUES ('25', '1313', '哈哈同学', '88888');
INSERT INTO `student` VALUES ('26', '1313', '哈哈哈', '1121212');

-- ----------------------------
-- Table structure for `subject`
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `Subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `Teacher_id` int(11) DEFAULT NULL,
  `Subject_name` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('7', '7', '语文');
INSERT INTO `subject` VALUES ('8', '8', '数学');
INSERT INTO `subject` VALUES ('9', '9', '英语');
INSERT INTO `subject` VALUES ('10', '10', '政治');
INSERT INTO `subject` VALUES ('11', '11', '历史');
INSERT INTO `subject` VALUES ('12', '12', '地理');
INSERT INTO `subject` VALUES ('13', '13', '物理');
INSERT INTO `subject` VALUES ('14', '14', '化学');
INSERT INTO `subject` VALUES ('15', '15', '生物');
INSERT INTO `subject` VALUES ('16', '16', '数学');

-- ----------------------------
-- Table structure for `teach`
-- ----------------------------
DROP TABLE IF EXISTS `teach`;
CREATE TABLE `teach` (
  `Teacher_id` int(11) NOT NULL,
  `Class_id` int(11) NOT NULL,
  `Teach_content` varchar(1024) DEFAULT NULL,
  `Teach_time` datetime DEFAULT NULL,
  PRIMARY KEY (`Teacher_id`,`Class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teach
-- ----------------------------

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `Teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `Class_id` int(11) DEFAULT NULL,
  `Teacher_name` varchar(1024) DEFAULT NULL,
  `Teacher_phone` int(11) DEFAULT NULL,
  `Teacher_password` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('7', '1313', '赵老师', null, '123');
INSERT INTO `teacher` VALUES ('8', '1313', '朱老师', null, '123');
INSERT INTO `teacher` VALUES ('9', '1313', '秦老师', null, '123');
INSERT INTO `teacher` VALUES ('10', '1313', '有老师', null, '123');
INSERT INTO `teacher` VALUES ('11', '1314', '许老师', null, '123');
INSERT INTO `teacher` VALUES ('12', '1314', '何老师', null, '123');
INSERT INTO `teacher` VALUES ('13', '1313', '吕老师', null, '123');
INSERT INTO `teacher` VALUES ('14', '1314', '施老师', null, '123');
INSERT INTO `teacher` VALUES ('15', '1315', '张老师', null, '123');
INSERT INTO `teacher` VALUES ('16', '1315', '李老师', null, '123');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_name` varchar(1024) DEFAULT NULL,
  `User_password` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`User_id`)
) ENGINE=InnoDB AUTO_INCREMENT=437 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('315', 'root', '123');
INSERT INTO `user` VALUES ('384', '赵老师', '123');
INSERT INTO `user` VALUES ('385', '钱同学', '123');
INSERT INTO `user` VALUES ('386', '孙同学', '123');
INSERT INTO `user` VALUES ('387', '李同学', '123');
INSERT INTO `user` VALUES ('388', '周同学', '123');
INSERT INTO `user` VALUES ('389', '吴同学', '123');
INSERT INTO `user` VALUES ('390', '孙家长', '123');
INSERT INTO `user` VALUES ('391', '钱家长', '123');
INSERT INTO `user` VALUES ('392', '朱老师', '123');
INSERT INTO `user` VALUES ('393', '秦老师', '123');
INSERT INTO `user` VALUES ('394', '有老师', '123');
INSERT INTO `user` VALUES ('395', '许老师', '123');
INSERT INTO `user` VALUES ('396', '何老师', '123');
INSERT INTO `user` VALUES ('397', '吕老师', '123');
INSERT INTO `user` VALUES ('398', '施老师', '123');
INSERT INTO `user` VALUES ('399', '张老师', '123');
INSERT INTO `user` VALUES ('400', '李老师', '123');
INSERT INTO `user` VALUES ('401', '王校长', '123');
INSERT INTO `user` VALUES ('402', '李主任', '111');
INSERT INTO `user` VALUES ('406', '石主任', '5432');
INSERT INTO `user` VALUES ('408', '常主任', '1642');
INSERT INTO `user` VALUES ('414', '郑同学', '737');
INSERT INTO `user` VALUES ('415', '王同学', '121313');
INSERT INTO `user` VALUES ('416', '冯同学', '83838');
INSERT INTO `user` VALUES ('417', '陈同学', '5344');
INSERT INTO `user` VALUES ('418', '褚同学', '121213');
INSERT INTO `user` VALUES ('419', '魏同学', '123455');
INSERT INTO `user` VALUES ('420', '蒋同学', '6543');
INSERT INTO `user` VALUES ('421', '沈同学', '6666');
INSERT INTO `user` VALUES ('422', '韩同学', '56123');
INSERT INTO `user` VALUES ('423', '杨同学', '131315');
INSERT INTO `user` VALUES ('424', '朱同学', '888');
INSERT INTO `user` VALUES ('425', '秦同学', '1315');
INSERT INTO `user` VALUES ('426', '孔同学', '8888');
INSERT INTO `user` VALUES ('427', '曹同学', '13111');
INSERT INTO `user` VALUES ('428', '找同学', '111111');
INSERT INTO `user` VALUES ('429', '赵同学', '11111');
INSERT INTO `user` VALUES ('430', '哈哈同学', '88888');
INSERT INTO `user` VALUES ('431', '哈哈哈', '1121212');
INSERT INTO `user` VALUES ('432', '钱家长', '1242');
INSERT INTO `user` VALUES ('433', '孙家长', '8888');
INSERT INTO `user` VALUES ('434', '李家长', '5222');
INSERT INTO `user` VALUES ('435', '周家长', '666');
INSERT INTO `user` VALUES ('436', '吴家长', '22211');

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `User_Role_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_id` int(11) DEFAULT NULL,
  `Role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`User_Role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('3', '315', '4');
INSERT INTO `user_role` VALUES ('10', '335', '5');
INSERT INTO `user_role` VALUES ('11', '336', '5');
INSERT INTO `user_role` VALUES ('12', '337', '5');
INSERT INTO `user_role` VALUES ('13', '338', '2');
INSERT INTO `user_role` VALUES ('14', '340', '2');
INSERT INTO `user_role` VALUES ('16', '341', '1');
INSERT INTO `user_role` VALUES ('17', '342', '1');
INSERT INTO `user_role` VALUES ('21', '379', '1');
INSERT INTO `user_role` VALUES ('22', '380', '1');
INSERT INTO `user_role` VALUES ('24', '382', '3');
INSERT INTO `user_role` VALUES ('25', '383', '5');
INSERT INTO `user_role` VALUES ('26', '384', '1');
INSERT INTO `user_role` VALUES ('27', '385', '2');
INSERT INTO `user_role` VALUES ('28', '386', '2');
INSERT INTO `user_role` VALUES ('29', '387', '2');
INSERT INTO `user_role` VALUES ('30', '388', '2');
INSERT INTO `user_role` VALUES ('31', '389', '2');
INSERT INTO `user_role` VALUES ('32', '390', '3');
INSERT INTO `user_role` VALUES ('33', '391', '3');
INSERT INTO `user_role` VALUES ('34', '392', '1');
INSERT INTO `user_role` VALUES ('35', '393', '1');
INSERT INTO `user_role` VALUES ('36', '394', '1');
INSERT INTO `user_role` VALUES ('37', '395', '1');
INSERT INTO `user_role` VALUES ('38', '396', '1');
INSERT INTO `user_role` VALUES ('39', '397', '1');
INSERT INTO `user_role` VALUES ('40', '398', '1');
INSERT INTO `user_role` VALUES ('41', '399', '1');
INSERT INTO `user_role` VALUES ('42', '400', '1');
INSERT INTO `user_role` VALUES ('43', '401', '5');
INSERT INTO `user_role` VALUES ('44', '402', '5');
INSERT INTO `user_role` VALUES ('45', '403', '5');
INSERT INTO `user_role` VALUES ('46', '404', '5');
INSERT INTO `user_role` VALUES ('47', '405', '5');
INSERT INTO `user_role` VALUES ('48', '406', '5');
INSERT INTO `user_role` VALUES ('49', '407', '5');
INSERT INTO `user_role` VALUES ('50', '408', '5');
INSERT INTO `user_role` VALUES ('51', '409', '5');
INSERT INTO `user_role` VALUES ('52', '410', '5');
INSERT INTO `user_role` VALUES ('53', '411', '5');
INSERT INTO `user_role` VALUES ('54', '412', '5');
INSERT INTO `user_role` VALUES ('55', '413', '5');
INSERT INTO `user_role` VALUES ('56', '414', '2');
INSERT INTO `user_role` VALUES ('57', '415', '2');
INSERT INTO `user_role` VALUES ('58', '416', '2');
INSERT INTO `user_role` VALUES ('59', '417', '2');
INSERT INTO `user_role` VALUES ('60', '418', '2');
INSERT INTO `user_role` VALUES ('61', '419', '2');
INSERT INTO `user_role` VALUES ('62', '420', '2');
INSERT INTO `user_role` VALUES ('63', '421', '2');
INSERT INTO `user_role` VALUES ('64', '422', '2');
INSERT INTO `user_role` VALUES ('65', '423', '2');
INSERT INTO `user_role` VALUES ('66', '424', '2');
INSERT INTO `user_role` VALUES ('67', '425', '2');
INSERT INTO `user_role` VALUES ('68', '426', '2');
INSERT INTO `user_role` VALUES ('69', '427', '2');
INSERT INTO `user_role` VALUES ('70', '428', '2');
INSERT INTO `user_role` VALUES ('71', '429', '2');
INSERT INTO `user_role` VALUES ('72', '430', '2');
INSERT INTO `user_role` VALUES ('73', '431', '2');
INSERT INTO `user_role` VALUES ('74', '391', '3');
INSERT INTO `user_role` VALUES ('75', '390', '3');
INSERT INTO `user_role` VALUES ('76', '434', '3');
INSERT INTO `user_role` VALUES ('77', '435', '3');
INSERT INTO `user_role` VALUES ('78', '436', '3');
