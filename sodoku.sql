/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50633
Source Host           : localhost:3306
Source Database       : sodoku

Target Server Type    : MYSQL
Target Server Version : 50633
File Encoding         : 65001

Date: 2020-05-06 09:37:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for rank
-- ----------------------------
DROP TABLE IF EXISTS `rank`;
CREATE TABLE `rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `second` int(11) NOT NULL,
  `difficulty` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rank
-- ----------------------------
INSERT INTO `rank` VALUES ('1', 'Tom', '180', 'primary');
INSERT INTO `rank` VALUES ('2', 'Lihua', '200', 'primary');
INSERT INTO `rank` VALUES ('3', 'Liming', '2000', 'primary');
INSERT INTO `rank` VALUES ('4', 'Peng Yiqun', '1000', 'primary');
INSERT INTO `rank` VALUES ('5', 'Marry', '2566', 'primary');
INSERT INTO `rank` VALUES ('6', 'Emerald', '10000', 'difficult');
INSERT INTO `rank` VALUES ('7', 'Neva', '25600', 'nightmare');
INSERT INTO `rank` VALUES ('8', 'Yolanda', '200555', 'primary');
INSERT INTO `rank` VALUES ('9', 'Gaurav Ravi', '2500', 'primary');
INSERT INTO `rank` VALUES ('10', 'Wangfang', '20', 'primary');
INSERT INTO `rank` VALUES ('14', 'liming', '95', 'primary');
INSERT INTO `rank` VALUES ('15', 'liming', '152', 'primary');
INSERT INTO `rank` VALUES ('16', 'Ravi', '71', 'primary');
INSERT INTO `rank` VALUES ('17', 'Yiqun Peng', '287', 'primary');
INSERT INTO `rank` VALUES ('18', 'Yiqun Peng', '216', 'primary');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'pengyiqun', '123456');
INSERT INTO `user` VALUES ('3', 'lihua', '123456');
INSERT INTO `user` VALUES ('4', 'xiaoming', '123456');
INSERT INTO `user` VALUES ('5', 'liming', '123456');
INSERT INTO `user` VALUES ('6', 'tom', '123456');
INSERT INTO `user` VALUES ('7', 'Ravi', '123456789');
INSERT INTO `user` VALUES ('8', 'Yiqun Peng', '123456789');
INSERT INTO `user` VALUES ('9', 'Raving', '123456');
