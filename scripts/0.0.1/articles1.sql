/*
 Navicat Premium Data Transfer

 Source Server         : Orlynn
 Source Server Type    : MySQL
 Source Server Version : 50634
 Source Host           : 192.168.1.87
 Source Database       : esacos

 Target Server Type    : MySQL
 Target Server Version : 50634
 File Encoding         : utf-8

 Date: 12/25/2018 05:03:39 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `articles`
-- ----------------------------
DROP TABLE IF EXISTS `CONFIGURATION`;
CREATE TABLE `CONFIGURATION` (
  `KEY` varchar(45) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `articles`
-- ----------------------------
BEGIN;
INSERT INTO `articles` VALUES ('KIKKO', 'KIKKO PEN', '43', '32', 'KIKKO', '2018-12-19 04:53:11');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
