/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 100432
Source Host           : localhost:3306
Source Database       : node_homework_23

Target Server Type    : MYSQL
Target Server Version : 100432
File Encoding         : 65001

Date: 2024-04-19 16:42:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for passengers
-- ----------------------------
DROP TABLE IF EXISTS `passengers`;
CREATE TABLE `passengers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `trainId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trainId` (`trainId`),
  CONSTRAINT `passengers_ibfk_1` FOREIGN KEY (`trainId`) REFERENCES `trains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of passengers
-- ----------------------------
INSERT INTO `passengers` VALUES ('12', 'Ani', '+37491526835', '2024-04-18 19:47:45', '2024-04-18 19:47:45', '9');
INSERT INTO `passengers` VALUES ('13', 'Elen', '+37491526835', '2024-04-18 19:47:53', '2024-04-18 19:47:53', '7');
INSERT INTO `passengers` VALUES ('14', 'Davit', '+37491526835', '2024-04-18 19:48:00', '2024-04-18 19:48:00', '6');
INSERT INTO `passengers` VALUES ('15', 'Aram', '+37491526835', '2024-04-18 19:48:07', '2024-04-18 19:48:07', '7');
INSERT INTO `passengers` VALUES ('16', 'Arsen', '+37491526835', '2024-04-18 19:48:17', '2024-04-18 19:48:17', '8');
INSERT INTO `passengers` VALUES ('17', 'Sargis', '+37491526835', '2024-04-18 19:48:25', '2024-04-18 19:48:25', '9');
INSERT INTO `passengers` VALUES ('18', 'Gor', '(302) 414-8567', '2024-04-18 19:48:37', '2024-04-18 19:48:37', '9');
INSERT INTO `passengers` VALUES ('20', 'Diana', '+37491526835', '2024-04-18 19:49:00', '2024-04-18 19:49:00', '6');
INSERT INTO `passengers` VALUES ('23', 'Boris', '(302) 414-8567', '2024-04-18 19:49:24', '2024-04-18 19:49:24', '5');
INSERT INTO `passengers` VALUES ('24', 'Alex', '+37491526835', '2024-04-18 19:49:50', '2024-04-18 19:49:50', '4');
INSERT INTO `passengers` VALUES ('25', 'Aneta', '+37491526835', '2024-04-18 19:50:01', '2024-04-18 19:50:01', '4');
INSERT INTO `passengers` VALUES ('26', 'Alla', '+37491526835', '2024-04-18 19:50:08', '2024-04-18 19:50:08', '4');
INSERT INTO `passengers` VALUES ('28', 'Emma', '+37491526835', '2024-04-19 12:39:40', '2024-04-19 12:39:40', '5');
INSERT INTO `passengers` VALUES ('29', 'Gagik', '+37491526835', '2024-04-19 12:39:50', '2024-04-19 12:39:50', '5');
INSERT INTO `passengers` VALUES ('30', 'Davit', '+37491526835', '2024-04-19 12:40:02', '2024-04-19 12:40:02', '5');

-- ----------------------------
-- Table structure for trains
-- ----------------------------
DROP TABLE IF EXISTS `trains`;
CREATE TABLE `trains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `train_number` varchar(255) DEFAULT NULL,
  `passengers_count` int(11) DEFAULT NULL,
  `from_country` varchar(255) DEFAULT NULL,
  `to_country` varchar(255) DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `ticket_price` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `passengerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `passengerId` (`passengerId`),
  CONSTRAINT `trains_ibfk_1` FOREIGN KEY (`passengerId`) REFERENCES `passengers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of trains
-- ----------------------------
INSERT INTO `trains` VALUES ('3', 'ccc', '3', 'Como', 'Genoa', '2023/11/11', '1200', '2024-04-17 21:17:25', '2024-04-17 21:17:25', null);
INSERT INTO `trains` VALUES ('4', 'aaa', '4', 'Bologna', 'Siena', '2023/11/11', '1200', '2024-04-17 21:18:26', '2024-04-17 21:18:26', null);
INSERT INTO `trains` VALUES ('5', 'bbb', '4', 'Rome', 'Florence', '2023/11/11', '1300', '2024-04-17 21:18:43', '2024-04-17 21:18:43', null);
INSERT INTO `trains` VALUES ('6', 'ddd', '3', 'Venice', 'Rome', '2023/11/11', '1300', '2024-04-18 19:41:20', '2024-04-18 19:41:20', null);
INSERT INTO `trains` VALUES ('7', 'eee', '5', 'Florence', 'Rome', '2024/01/05', '2000', '2024-04-18 19:46:17', '2024-04-18 19:46:17', null);
INSERT INTO `trains` VALUES ('8', 'fff', '4', 'Siena', 'Milan', '2024/02/07', '800', '2024-04-18 19:47:02', '2024-04-18 19:47:02', null);
INSERT INTO `trains` VALUES ('9', 'ggg', '3', 'Rome', 'Milan', '2024/03/21', '1000', '2024-04-18 19:47:33', '2024-04-18 19:47:33', null);
INSERT INTO `trains` VALUES ('10', 'hhh', '3', 'Rome', 'Florence', '2023/11/11', '1000', '2024-04-19 12:35:43', '2024-04-19 12:35:43', null);
SET FOREIGN_KEY_CHECKS=1;
