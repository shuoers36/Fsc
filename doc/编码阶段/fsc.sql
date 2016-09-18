/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50142
Source Host           : localhost:3306
Source Database       : fsc

Target Server Type    : MYSQL
Target Server Version : 50142
File Encoding         : 65001

Date: 2016-09-06 10:35:57
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
) ENGINE=InnoDB AUTO_INCREMENT=701 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('700', '3', '2016-09-04 13:15:12', 'sdads', 'adada', 'http://localhost:8080/fsc/upload/54e11276-851d-497b-b901-5c28e0ce455a.png');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of announcement
-- ----------------------------

-- ----------------------------
-- Table structure for `attendance`
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `Attendance_id` int(11) NOT NULL DEFAULT '0',
  `Student_name` varchar(1024) DEFAULT NULL,
  `Attendance_content` varchar(1024) DEFAULT NULL,
  `Attendance_time` datetime DEFAULT NULL,
  `Student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Attendance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attendance
-- ----------------------------

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

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `Comment_id` int(11) NOT NULL,
  `Teacher_name` varchar(1024) DEFAULT NULL,
  `Student_id` int(11) DEFAULT NULL,
  `Message_content` varchar(1024) DEFAULT NULL,
  `Message_time` datetime DEFAULT NULL,
  PRIMARY KEY (`Comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of homework
-- ----------------------------
INSERT INTO `homework` VALUES ('1', '语文', '3', '放假', '2016-09-27 12:31:47');
INSERT INTO `homework` VALUES ('2', '语文', '3', '真放假', '2016-09-29 12:32:05');
INSERT INTO `homework` VALUES ('3', '语文', '3', '不放假了', '2016-09-14 12:32:18');

-- ----------------------------
-- Table structure for `honor`
-- ----------------------------
DROP TABLE IF EXISTS `honor`;
CREATE TABLE `honor` (
  `Honor_id` int(11) NOT NULL,
  `Student_name` varchar(1024) DEFAULT NULL,
  `Honor_content` varchar(1024) DEFAULT NULL,
  `Honor_time` datetime DEFAULT NULL,
  PRIMARY KEY (`Honor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of honor
-- ----------------------------

-- ----------------------------
-- Table structure for `leader`
-- ----------------------------
DROP TABLE IF EXISTS `leader`;
CREATE TABLE `leader` (
  `Leader_id` int(11) NOT NULL,
  `Leader_name` varchar(1024) DEFAULT NULL,
  `Leader_password` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Leader_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leader
-- ----------------------------

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
  `Message_time` datetime NOT NULL,
  PRIMARY KEY (`Message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for `parent`
-- ----------------------------
DROP TABLE IF EXISTS `parent`;
CREATE TABLE `parent` (
  `Parent_id` int(11) NOT NULL,
  `Student_id` int(11) DEFAULT NULL,
  `Parent_name` varchar(1024) DEFAULT NULL,
  `Parent_password` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parent
-- ----------------------------

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
INSERT INTO `resource` VALUES ('5', '1.z', '1');
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
INSERT INTO `resource_role` VALUES ('2', '1', '2');
INSERT INTO `resource_role` VALUES ('3', '1', '3');
INSERT INTO `resource_role` VALUES ('4', '1', '4');
INSERT INTO `resource_role` VALUES ('6', '2', '4');
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

-- ----------------------------
-- Table structure for `score`
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `Score_id` int(11) NOT NULL,
  `Student_id` int(11) DEFAULT NULL,
  `Subject_name` varchar(1024) DEFAULT NULL,
  `Score` float DEFAULT NULL,
  `Score_time` datetime DEFAULT NULL,
  PRIMARY KEY (`Score_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score
-- ----------------------------

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `Student_id` int(11) NOT NULL,
  `Parent_id` int(11) DEFAULT NULL,
  `Class_id` int(11) DEFAULT NULL,
  `Student_sex` varchar(1024) DEFAULT NULL,
  `Student_name` varchar(1024) DEFAULT NULL,
  `Student_password` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', null, '1', null, '臧三', null);

-- ----------------------------
-- Table structure for `subject`
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `Subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `Teacher_id` int(11) DEFAULT NULL,
  `Subject_name` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('1', '1', '语文');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '111', '1', null, '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_name` varchar(1024) DEFAULT NULL,
  `User_password` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`User_id`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '111', '1111');
INSERT INTO `user` VALUES ('3', '3131313', '3');
INSERT INTO `user` VALUES ('14', '11', '111');
INSERT INTO `user` VALUES ('313', '1', '1');
INSERT INTO `user` VALUES ('314', 'root', '123');

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `User_Role_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_id` int(11) DEFAULT NULL,
  `Role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`User_Role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '314', '4');
INSERT INTO `user_role` VALUES ('2', '313', '1');
