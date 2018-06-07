/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : esdb

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2018-05-31 17:58:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_tb`
-- ----------------------------
DROP TABLE IF EXISTS `admin_tb`;
CREATE TABLE `admin_tb` (
  `userId` varchar(255) NOT NULL,
  `collegeName` varchar(255) DEFAULT NULL,
  `collegeRef` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `permission` int(11) NOT NULL,
  `psw` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_tb
-- ----------------------------

-- ----------------------------
-- Table structure for `college_tb`
-- ----------------------------
DROP TABLE IF EXISTS `college_tb`;
CREATE TABLE `college_tb` (
  `sid` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of college_tb
-- ----------------------------

-- ----------------------------
-- Table structure for `exam_tb`
-- ----------------------------
DROP TABLE IF EXISTS `exam_tb`;
CREATE TABLE `exam_tb` (
  `sid` int(11) NOT NULL,
  `createdTime` varchar(255) DEFAULT NULL,
  `fromTime` varchar(255) DEFAULT NULL,
  `subjectName` varchar(255) DEFAULT NULL,
  `subjectRef` int(11) NOT NULL,
  `toTime` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_tb
-- ----------------------------

-- ----------------------------
-- Table structure for `grade_tb`
-- ----------------------------
DROP TABLE IF EXISTS `grade_tb`;
CREATE TABLE `grade_tb` (
  `sid` int(11) NOT NULL,
  `paperRef` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `subjectName` varchar(255) DEFAULT NULL,
  `subjectRef` int(11) NOT NULL,
  `time` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade_tb
-- ----------------------------

-- ----------------------------
-- Table structure for `paper_tb`
-- ----------------------------
DROP TABLE IF EXISTS `paper_tb`;
CREATE TABLE `paper_tb` (
  `sid` int(11) NOT NULL,
  `examRef` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `subjectName` varchar(255) DEFAULT NULL,
  `subjectRef` int(11) NOT NULL,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper_tb
-- ----------------------------

-- ----------------------------
-- Table structure for `question_tb`
-- ----------------------------
DROP TABLE IF EXISTS `question_tb`;
CREATE TABLE `question_tb` (
  `sid` int(11) NOT NULL,
  `answerRef` int(11) NOT NULL,
  `choiceCount` int(11) NOT NULL,
  `paperRef` int(11) NOT NULL,
  `subjectRef` int(11) NOT NULL,
  `userId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question_tb
-- ----------------------------

-- ----------------------------
-- Table structure for `selection_tb`
-- ----------------------------
DROP TABLE IF EXISTS `selection_tb`;
CREATE TABLE `selection_tb` (
  `sid` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `paperRef` int(11) NOT NULL,
  `questionRef` int(11) NOT NULL,
  `subjectRef` int(11) NOT NULL,
  `userId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of selection_tb
-- ----------------------------

-- ----------------------------
-- Table structure for `stu_tb`
-- ----------------------------
DROP TABLE IF EXISTS `stu_tb`;
CREATE TABLE `stu_tb` (
  `userId` varchar(255) NOT NULL,
  `collegeRef` varchar(255) DEFAULT NULL,
  `headImg` varchar(255) DEFAULT NULL,
  `idCard` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `psw` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_tb
-- ----------------------------
INSERT INTO `stu_tb` VALUES ('id_953', 'collegeRef_7', 'headImg_5', 'idCard_4', 'name_2', 'psw_1', 'sex_3', 'time_6');
INSERT INTO `stu_tb` VALUES ('key_21', 'collegeRef_7', 'headImg_5', 'idCard_4', 'name_2', 'psw_1', 'sex_3', 'time_6');
INSERT INTO `stu_tb` VALUES ('userId_104', 'collegeRef_323', 'headImg_817', 'idCard_339', 'name_323', 'psw_799', 'sex_582', 'time_374');
INSERT INTO `stu_tb` VALUES ('userId_125', 'collegeRef_402', 'headImg_417', 'idCard_252', 'name_59', 'psw_410', 'sex_575', 'time_508');
INSERT INTO `stu_tb` VALUES ('userId_177', 'collegeRef_764', 'headImg_138', 'idCard_82', 'name_884', 'psw_73', 'sex_395', 'time_544');
INSERT INTO `stu_tb` VALUES ('userId_188', 'collegeRef_437', 'headImg_246', 'idCard_548', 'name_780', 'psw_967', 'sex_683', 'time_132');
INSERT INTO `stu_tb` VALUES ('userId_228', 'collegeRef_470', 'headImg_379', 'idCard_621', 'name_562', 'psw_851', 'sex_704', 'time_350');
INSERT INTO `stu_tb` VALUES ('userId_237', 'collegeRef_775', 'headImg_101', 'idCard_522', 'name_301', 'psw_851', 'sex_805', 'time_416');
INSERT INTO `stu_tb` VALUES ('userId_279', 'collegeRef_30', 'headImg_16', 'idCard_55', 'name_126', 'psw_190', 'sex_903', 'time_903');
INSERT INTO `stu_tb` VALUES ('userId_341', 'collegeRef_892', 'headImg_444', 'idCard_202', 'name_369', 'psw_631', 'sex_887', 'time_402');
INSERT INTO `stu_tb` VALUES ('userId_352', 'collegeRef_382', 'headImg_634', 'idCard_759', 'name_951', 'psw_99', 'sex_971', 'time_366');
INSERT INTO `stu_tb` VALUES ('userId_471', 'collegeRef_352', 'headImg_460', 'idCard_640', 'name_363', 'psw_980', 'sex_553', 'time_843');
INSERT INTO `stu_tb` VALUES ('userId_474', 'collegeRef_582', 'headImg_89', 'idCard_934', 'name_926', 'psw_680', 'sex_17', 'time_109');
INSERT INTO `stu_tb` VALUES ('userId_509', 'collegeRef_462', 'headImg_394', 'idCard_240', 'name_865', 'psw_262', 'sex_930', 'time_411');
INSERT INTO `stu_tb` VALUES ('userId_53', 'collegeRef_416', 'headImg_192', 'idCard_419', 'name_926', 'psw_413', 'sex_681', 'time_164');
INSERT INTO `stu_tb` VALUES ('userId_547', 'collegeRef_780', 'headImg_140', 'idCard_601', 'name_896', 'psw_296', 'sex_550', 'time_484');
INSERT INTO `stu_tb` VALUES ('userId_576', 'collegeRef_733', 'headImg_541', 'idCard_683', 'name_473', 'psw_647', 'sex_230', 'time_817');
INSERT INTO `stu_tb` VALUES ('userId_61', 'collegeRef_545', 'headImg_563', 'idCard_215', 'name_197', 'psw_667', 'sex_601', 'time_780');
INSERT INTO `stu_tb` VALUES ('userId_625', 'collegeRef_627', 'headImg_239', 'idCard_222', 'name_94', 'psw_921', 'sex_609', 'time_570');
INSERT INTO `stu_tb` VALUES ('userId_640', 'collegeRef_668', 'headImg_832', 'idCard_892', 'name_272', 'psw_117', 'sex_829', 'time_776');
INSERT INTO `stu_tb` VALUES ('userId_736', 'collegeRef_845', 'headImg_338', 'idCard_933', 'name_513', 'psw_2', 'sex_957', 'time_62');
INSERT INTO `stu_tb` VALUES ('userId_74', 'collegeRef_885', 'headImg_183', 'idCard_813', 'name_722', 'psw_556', 'sex_174', 'time_915');
INSERT INTO `stu_tb` VALUES ('userId_769', 'collegeRef_268', 'headImg_221', 'idCard_221', 'name_721', 'psw_713', 'sex_936', 'time_412');
INSERT INTO `stu_tb` VALUES ('userId_8', 'collegeRef_484', 'headImg_654', 'idCard_899', 'name_516', 'psw_662', 'sex_955', 'time_34');
INSERT INTO `stu_tb` VALUES ('userId_826', 'collegeRef_931', 'headImg_115', 'idCard_247', 'name_718', 'psw_900', 'sex_704', 'time_174');
INSERT INTO `stu_tb` VALUES ('userId_829', 'collegeRef_450', 'headImg_31', 'idCard_893', 'name_734', 'psw_106', 'sex_162', 'time_557');
INSERT INTO `stu_tb` VALUES ('userId_840', 'collegeRef_813', 'headImg_250', 'idCard_774', 'name_474', 'psw_513', 'sex_424', 'time_825');
INSERT INTO `stu_tb` VALUES ('userId_882', 'collegeRef_844', 'headImg_477', 'idCard_110', 'name_684', 'psw_647', 'sex_940', 'time_982');
INSERT INTO `stu_tb` VALUES ('userId_933', 'collegeRef_324', 'headImg_992', 'idCard_375', 'name_460', 'psw_832', 'sex_833', 'time_888');
INSERT INTO `stu_tb` VALUES ('userId_94', 'collegeRef_464', 'headImg_798', 'idCard_230', 'name_867', 'psw_37', 'sex_311', 'time_449');
INSERT INTO `stu_tb` VALUES ('userId_941', 'collegeRef_184', 'headImg_325', 'idCard_610', 'name_247', 'psw_545', 'sex_39', 'time_531');
INSERT INTO `stu_tb` VALUES ('userId_980', 'collegeRef_444', 'headImg_764', 'idCard_686', 'name_360', 'psw_841', 'sex_604', 'time_750');

-- ----------------------------
-- Table structure for `subject_tb`
-- ----------------------------
DROP TABLE IF EXISTS `subject_tb`;
CREATE TABLE `subject_tb` (
  `sid` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject_tb
-- ----------------------------

-- ----------------------------
-- Table structure for `teacher_tb`
-- ----------------------------
DROP TABLE IF EXISTS `teacher_tb`;
CREATE TABLE `teacher_tb` (
  `userId` varchar(255) NOT NULL,
  `collegeRef` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `psw` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_tb
-- ----------------------------
