/*
Navicat MySQL Data Transfer

Source Server         : Connector
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : hello_ssm

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2020-03-16 15:11:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `uid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `power` int(2) NOT NULL,
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'system', 'E10ADC3949BA59ABBE56E057F20F883E', '测试人员', '1111111111', '15011111111', '4', '系统测试员');
INSERT INTO `admins` VALUES ('2', 'wpc', 'E10ADC3949BA59ABBE56E057F20F883E', '小万', '1212', '15454546332', '3', '管理员');
INSERT INTO `admins` VALUES ('3', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', 'admin', '1213', '15555555555', '1', '管理员');
INSERT INTO `admins` VALUES ('4', 'visitor', 'C355297C697BFB9B69F23AA06C82A365', '游客', '1214', '18888888888', '1', '游客');
INSERT INTO `admins` VALUES ('5', 'lisi', 'E10ADC3949BA59ABBE56E057F20F883E', '李四', '1215', '17777777777', '1', '游客');
INSERT INTO `admins` VALUES ('6', 'wangwu', 'E10ADC3949BA59ABBE56E057F20F883E', '王五', '1216', '12222222222', '1', '管理员');
INSERT INTO `admins` VALUES ('7', 'zhaoliu', 'E10ADC3949BA59ABBE56E057F20F883E', '赵六', '1217', '16666666666', '1', '普通游客');
INSERT INTO `admins` VALUES ('16', 'student', '202CB962AC59075B964B07152D234B70', '学生', '1218', '15011111111', '0', '学生');
INSERT INTO `admins` VALUES ('17', 'teacher', 'E10ADC3949BA59ABBE56E057F20F883E', '教师', '1219', '15011111111', '1', '教师');
INSERT INTO `admins` VALUES ('20', 'xiaoli', 'E10ADC3949BA59ABBE56E057F20F883E', '小李', '1220', '15229365444', '2', '学生');
INSERT INTO `admins` VALUES ('21', 'xiaolili', 'E10ADC3949BA59ABBE56E057F20F883E', '小莉莉', '1221', '15866666665', '0', '学生');
INSERT INTO `admins` VALUES ('23', '001', 'E10ADC3949BA59ABBE56E057F20F883E', '001', '1223', '15011111111', '0', '001');
INSERT INTO `admins` VALUES ('24', '002', 'E10ADC3949BA59ABBE56E057F20F883E', '002', '1224', '15011111111', '0', '002');
INSERT INTO `admins` VALUES ('25', '003', 'E10ADC3949BA59ABBE56E057F20F883E', '003', '1225', '15011111111', '0', '003');
INSERT INTO `admins` VALUES ('26', '004', 'E10ADC3949BA59ABBE56E057F20F883E', '004', '1226', '15011111111', '0', '004');
INSERT INTO `admins` VALUES ('28', '006', 'E10ADC3949BA59ABBE56E057F20F883E', '006', '1227', '15011111111', '1', '006');

-- ----------------------------
-- Table structure for `dorms`
-- ----------------------------
DROP TABLE IF EXISTS `dorms`;
CREATE TABLE `dorms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dorm_id` varchar(30) NOT NULL,
  `dorm_intro` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dorm_rps` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dorm_leader` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dorms
-- ----------------------------
INSERT INTO `dorms` VALUES ('1', '西七B209', '年度最佳宿舍先锋', '年度活跃宿舍', 'Jack', '小张');
INSERT INTO `dorms` VALUES ('2', '西六A101', '好', '年度活跃宿舍', 'Jack', '小张');
INSERT INTO `dorms` VALUES ('3', '西六A102', '你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好', '无', 'Jack', '小李');
INSERT INTO `dorms` VALUES ('4', '西六A104', '11111111111111111111111111111111111111111111111111111111111111111111111111111111', '无', 'Jack', '小李');
INSERT INTO `dorms` VALUES ('5', '西七C120', '11221', '最佳学习宿舍', 'Jack', '小李');
INSERT INTO `dorms` VALUES ('6', '西六B105', 'hao', '无', 'Jack', '小李');

-- ----------------------------
-- Table structure for `students`
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `sex` varchar(5) NOT NULL,
  `sno` varchar(50) NOT NULL,
  `stu_class` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(20) NOT NULL,
  `place` varchar(50) NOT NULL,
  `dorm_id` varchar(30) NOT NULL,
  `teacher` varchar(30) NOT NULL,
  `status` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('2', '小张', '男', '1212122111211', '2017级软件工程1班', '158121212122', '河南省郑州市', '西七B209', '小李', '1');
INSERT INTO `students` VALUES ('3', '小陈', '男', '2017455487552', '2016级电信1班', '15846464545', '河南省郑州市', '西七A110', '小张', '1');
INSERT INTO `students` VALUES ('6', '学生', '男', '2017105145454544', '2017级软件工程1班', '15011111111', '河南省鹤壁市', '西七A209', '小李', '1');
INSERT INTO `students` VALUES ('7', '学生', '男', '201710511212121212', '2017级软件工程1班', '15011111111', '河南省鹤壁市', '西七B110', '小张', '1');
INSERT INTO `students` VALUES ('8', 'xaioxaio', '女', '201710555121', '2017级软件工程1班', '15011111111', '河南省鹤壁市', '西六A209', '小李', '1');
INSERT INTO `students` VALUES ('9', '12122', '女', '1212212122121', '2017级软件工程1班', '15011111111', '河南省鹤壁市', '西六A110', '小李', '1');
INSERT INTO `students` VALUES ('11', '学生', '男', '222222222', '2017级软件工程1班', '15011111111', '河南省鹤壁市', '西七A209', '小李', '1');
INSERT INTO `students` VALUES ('12', '学生', '男', '121212', '2017级软件工程1班', '15011111111', '河南省鹤壁市', '西六A209', '小李', '0');
INSERT INTO `students` VALUES ('13', '万培臣', '男', '1213', '2017级软件工程1班', '15011111111', '河南省鹤壁市', '西七B209', '小李', '1');
INSERT INTO `students` VALUES ('14', '万培臣', '男', '123321', '2017级软件工程1班', '15011111111', '河南省鹤壁市', '西六A209', '小王', '1');
INSERT INTO `students` VALUES ('15', '万培臣', '男', '1233654', '2017级软件工程1班', '15011111111', '河南省鹤壁市', '西六A209', '小李', '1');
INSERT INTO `students` VALUES ('16', '学生', '男', '454545454', '2017级软件工程1班', '15011111111', '河南省鹤壁市', '西六A209', '小飞', '0');
INSERT INTO `students` VALUES ('17', '万培', '男', '1', '2017级软件工程1班', '15011111111', '河南省鹤壁市', '西六A209', '小张', '1');
INSERT INTO `students` VALUES ('18', '万培臣', '男', '122', '2017级软件工程1班', '15011111111', '河南省鹤壁市', '西六A209', '小李', '1');
INSERT INTO `students` VALUES ('19', '万培臣', '男', '1212125', '2017级软件工程1班', '15011111111', '河南省鹤壁市', '西六A209', '小李', '0');
INSERT INTO `students` VALUES ('20', '万培臣', '男', '32546822', '2017级软件工程1班', '15011111111', '河南省鹤壁市', '西六A209', '小李', '1');
INSERT INTO `students` VALUES ('21', '万培臣', '男', '654', '2017级软件工程1班', '15011111111', '河南省鹤壁市', '西六B209', '小李', '1');
INSERT INTO `students` VALUES ('23', '万培臣', '男', '125644', '2017级软件工程1班', '15011111111', '河南省鹤壁市', '西六A209', '小李', '1');
INSERT INTO `students` VALUES ('25', 'xaioxaio', '男', '1214', '2017级软件工程1班', '15011111111', '河南省鹤壁市', '西七B209', '小李', '1');
INSERT INTO `students` VALUES ('26', 'xaioxaio', '男', '2017101212', '2017级软件工程1班', '15803920663', '河南省鹤壁市', '西六A102', '小李', '0');
INSERT INTO `students` VALUES ('27', '学生', '男', '15685', '2017级软件工程1班', '15803920663', '河南省鹤壁市', '西六A209', '小李', '1');

-- ----------------------------
-- Table structure for `visitors`
-- ----------------------------
DROP TABLE IF EXISTS `visitors`;
CREATE TABLE `visitors` (
  `id` varchar(60) NOT NULL,
  `name` varchar(30) NOT NULL,
  `sno` varchar(30) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `place` varchar(30) NOT NULL,
  `begin_date` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `end_date` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `visit_result` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visitors
-- ----------------------------
INSERT INTO `visitors` VALUES ('3bab098f1f264cea960228eac8133c18', '1号', '20171051512121211', '15011111111', '西七', '2020-02-19 11:19:22', '2020-02-19 11:19:47', '公事');
INSERT INTO `visitors` VALUES ('642e29f0455a42adbdda911051e8e913', '2号', '2017107878787878', '15011111111', '西七二楼', '2020-02-19 16:06:11', '2020-02-19 16:06:22', '公事');
INSERT INTO `visitors` VALUES ('7022426fafdc4f7c875483f635386ede', '3号', '201710545454545', '15011111111', '西七二楼', '2020-02-19 15:11:16', '2020-02-19 15:11:28', '公事');
INSERT INTO `visitors` VALUES ('e6c64dadc9df48689ac6774e093c9d4e', '4号', '2017155565456', '15011111111', '西七二楼', '2020-02-21 11:34:27', '2020-02-21 12:55:45', '公事');
