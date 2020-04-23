/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : metting

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 23/04/2020 16:15:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '面试室');
INSERT INTO `category` VALUES ('2', '董事会会议室');
INSERT INTO `category` VALUES ('3', '企业培训室');
INSERT INTO `category` VALUES ('4', '大型会议室');
INSERT INTO `category` VALUES ('CC3B83512A8E4054BBB1F3177FC0B4D9', '超大型会议室');

-- ----------------------------
-- Table structure for evaluate
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate`  (
  `uid` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bid` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Etext` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `Etime` char(0) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of evaluate
-- ----------------------------
INSERT INTO `evaluate` VALUES ('1', '123', '1', '很好', '');
INSERT INTO `evaluate` VALUES ('2', '456', '10', '好', NULL);

-- ----------------------------
-- Table structure for metting
-- ----------------------------
DROP TABLE IF EXISTS `metting`;
CREATE TABLE `metting`  (
  `bid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会议室的id',
  `bname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会议室的名称',
  `price` decimal(5, 1) NULL DEFAULT NULL COMMENT '价格',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拥有者',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `cid` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类编号',
  `Mtext` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `are` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '面积',
  `height` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '高度',
  `mlocal` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会议室的坐标',
  `maddress` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会议室的地址',
  `lizhu` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '立柱数',
  `people` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认数',
  `juchangshi` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `yanhuishi` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kezhuoshi` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课桌式会议室',
  `floor` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会议室的层数',
  `del` tinyint(1) NULL DEFAULT 1 COMMENT '判断是否删除次会议室',
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of metting
-- ----------------------------
INSERT INTO `metting` VALUES ('1', '星涯酒店', 300.0, 'qdmmy6', 'metting_img/d/d41001.jpg', '1', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '300', '3', '115.897408,28.689831', '江西省南昌市东湖区象山北路237', '4', '100', '100', '100', '100', '2', 1);
INSERT INTO `metting` VALUES ('10', '百悦年华酒店', 340.0, '123456', 'metting_img/x/x31001.jpg', '2', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '200', '3', '115.899241,28.676348', '江西省南昌市东湖区民巷4号', '4', '200', '200', '200', '200', '3', 1);
INSERT INTO `metting` VALUES ('11', '悦漫酒店', 354.0, 'qdmmy6', 'metting_img/x/x31002.jpg', '2', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '300', '3', '115.91886,28.678757', '江西省南昌市西湖区烟筒巷10号', '4', '300', '300', '300', '300', '4', 1);
INSERT INTO `metting` VALUES ('12', '海视山萌酒店', 380.0, 'qdmmy6', 'metting_img/x/x31003.jpg', '2', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '400', '3', '115.895432,28.680278', '江西省南昌市西湖区鄢家井巷18号', '4', '400', '400', '400', '400', '5', 1);
INSERT INTO `metting` VALUES ('13', '驿恋酒店', 387.0, 'qdmmy6', 'metting_img/x/x31004.jpg', '2', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '200', '3', '115.899959,28.680721', '江西省南昌市西湖区渊明南路92号', '4', '200', '200', '200', '200', '6', 1);
INSERT INTO `metting` VALUES ('14', '望海潮酒店', 387.0, 'qdmmy6', 'metting_img/x/x31005.jpg', '2', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '150', '3', '115.890904,28.680088', '江西省南昌市西湖区烟筒巷10号', '3', '150', '150', '150', '150', '7', 1);
INSERT INTO `metting` VALUES ('15', '桔子酒店', 345.0, 'qdmmy6', 'metting_img/x/x31006.jpg', '2', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '200', '3', '115.901325,28.697832', '江西省南昌市东湖区四纬路75号', '4', '200', '200', '200', '200', '8', 1);
INSERT INTO `metting` VALUES ('16', '澜公馆酒店', 345.0, 'qdmmy6', 'metting_img/x/x31007.jpg', '3', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '400', '3', '115.909374,28.69441', '江西省南昌市东湖区青山南路3号', '4', '400', '400', '400', '400', '9', 1);
INSERT INTO `metting` VALUES ('17', '缘梦居酒店', 387.0, 'qdmmy6', 'metting_img/x/x31008.jpg', '3', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '500', '3', '115.917638,28.693586', '江西省南昌市东湖区贤士一路35号-1栋', '3', '500', '500', '500', '500', '10', 1);
INSERT INTO `metting` VALUES ('18', '浪漫满屋酒店', 388.0, 'qdmmy6', 'metting_img/x/x31009.jpg', '3', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '200', '3', '115.917926,28.689721', '江西省南昌市东湖区福州路127号', '4', '200', '200', '200', '200', '11', 1);
INSERT INTO `metting` VALUES ('19', '五福大酒店', 473.0, 'qdmmy6', 'metting_img/x/x31010.jpg', '3', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '600', '3', '115.914332,28.706259', '江西省南昌市东湖区证券街', '3', '600', '600', '600', '600', '12', 1);
INSERT INTO `metting` VALUES ('2', '东临石酒店', 150.0, 'qdmmy6', 'metting_img/d/d41002.jpg', '1', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '300', '3', '115.908583,28.705943', '江西省南昌市东湖区沿江北大道1230号', '4', '300', '300', '300', '300', '11', 1);
INSERT INTO `metting` VALUES ('20', '静澜栈酒店', 473.0, 'qdmmy6', 'metting_img/x/x31011.jpg', '3', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '400', '3', '115.886305,28.681228', '江西省南昌市东湖区新洲路16号', '3', '400', '400', '400', '400', '10', 1);
INSERT INTO `metting` VALUES ('21', '凯莱大酒店', 437.0, 'qdmmy6', 'metting_img/x/x31012.jpg', '3', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '120', '3', '115.888102,28.676792', '江西省南昌市西湖区新洲路82号', '4', '120', '120', '120', '120', '9', 1);
INSERT INTO `metting` VALUES ('22', '悦客山庄酒店', 437.0, 'qdmmy6', 'metting_img/x/x31013.jpg', '3', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '160', '3', '115.895576,28.674066', '江西省南昌市西湖区蓼洲街1-3号', '3', '160', '160', '160', '160', '8', 1);
INSERT INTO `metting` VALUES ('23', '新雨亭酒店', 420.0, 'qdmmy6', 'metting_img/x/x31014.jpg', '4', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '170', '3', '115.900175,28.671594', '江西省南昌市西湖区石头街45号', '4', '170', '170', '170', '170', '7', 1);
INSERT INTO `metting` VALUES ('24', '漫水居酒店', 437.0, 'qdmmy6', 'metting_img/x/x31015.jpg', '4', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '200', '3', '115.908583,28.685665', '江西省南昌市东湖区G316(京珠线)', '3', '200', '200', '200', '200', '6', 1);
INSERT INTO `metting` VALUES ('3', '海尚石酒店', 175.6, 'qdmmy6', 'metting_img/d/d41003.jpg', '1', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '400', '3', '115.909086,28.682749', '江西省南昌市东湖区皇殿侧路39号', '4', '400', '400', '400', '400', '5', 1);
INSERT INTO `metting` VALUES ('4', '云顶酒店', 150.0, 'qdmmy6', 'metting_img/d/d41004.jpg', '1', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '500', '3', '115.906499,28.671721', '江西省南昌市西湖区永叔路161', '3', '500', '500', '500', '500', '4', 1);
INSERT INTO `metting` VALUES ('5', '碧岸酒店', 230.0, 'qdmmy6', 'metting_img/d/d41005.jpg', '1', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '700', '3', '115.908655,28.690164', '江西省南昌市东湖区八一大道110号', '4', '700', '700', '700', '700', '3', 1);
INSERT INTO `metting` VALUES ('6', '好再来大酒店', 120.0, 'qdmmy6', 'metting_img/d/d41006.jpg', '1', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '900', '3', '115.919363,28.69384', '江西省南昌市东湖区贤士一路52号-1栋', '3', '900', '900', '900', '900', '2', 1);
INSERT INTO `metting` VALUES ('7', '万豪酒店', 140.0, 'qdmmy6', 'metting_img/d/d41007.jpg', '1', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '600', '3', '115.918357,28.683193', '江西省南昌市东湖区省府北一路2号', '4', '600', '600', '600', '600', '1', 1);
INSERT INTO `metting` VALUES ('8', '凌海酒店', 310.0, 'qdmmy6', 'metting_img/d/d41008.jpg', '4', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '700', '3', '115.91886,28.678757', '江西省南昌市西湖区金盘路91号-4栋', '3', '700', '700', '700', '700', '2', 1);
INSERT INTO `metting` VALUES ('9', '铂尔曼度假酒店', 240.0, 'qdmmy6', 'metting_img/d/d41009.jpg', '4', '吉安国际酒店是集餐饮、旅业、会议、休闲娱乐为一体的吉安唯一涉外综合型商务酒店，酒店位于吉安县城庐陵大道庐陵广场旁', '200', '3', '115.899241,28.676348', '江西省南昌市西湖区南浦路10号', '4', '200', '200', '200', '200', '3', 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oidString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bidString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uidString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userNameString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userTeleString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userNeedString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userCategoryString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mettingTimeString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mettingRadioFroup1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mettingReserveNeedThing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderEmailString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderDateString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderPeopleString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderCompanynameString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderMoneyString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderElseString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scoreString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`oidString`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('03B795611A4B4A7DB18835918BBDF4FA', '1', '1', '123', '123', NULL, 'volvo', '', '不限', NULL, '', '2020-1-1', '', '', '', '', '1');
INSERT INTO `orders` VALUES ('1521CB8B1BE847A083B66570F2BA7AD3', '1', '1', '123', '123', NULL, 'volvo', '', '不限', NULL, '', 'null', '', '', '', '', '2');
INSERT INTO `orders` VALUES ('1B5317A8CAF342ACA71C517F3030B6F2', '1', '', '123', '123', NULL, 'volvo', '', '不限', NULL, '', '', '', '', '', '', '3');
INSERT INTO `orders` VALUES ('3E73A7422C81467E8B35430B5975B6BE', '1', '1', '123', '123', NULL, 'volvo', '', '不限', NULL, '', '', '', '', '', '', '4');
INSERT INTO `orders` VALUES ('411BE04EB28B42B689F3F1423F740B19', '1', '1', '123', '123', NULL, 'volvo', '', '不限', NULL, '', '', '', '', '', '', '3');
INSERT INTO `orders` VALUES ('891B64410C3E471B936F1661E51248EB', '1', '1', '123', '123', NULL, 'volvo', '', '不限', NULL, '', '', '', '', '', '', '4');
INSERT INTO `orders` VALUES ('8C9BA36A17394028B28FC18B6A673404', '1', '1', '123', '123', NULL, 'volvo', '', '不限', NULL, '', '', '', '', '', '', '5');
INSERT INTO `orders` VALUES ('A4259484796E4744BF74EB912ABBEAE1', '1', '1', '123', '123', NULL, 'volvo', '', '不限', NULL, '', '', '', '', '', '', NULL);
INSERT INTO `orders` VALUES ('AB927EC4A3D84674BC66E7BADDE74BA3', '1', '1', '123', '123', NULL, 'volvo', '', '不限', NULL, '', '', '', '', '', '', NULL);
INSERT INTO `orders` VALUES ('B5E1E78DBBB94C09BB085F3DEE0B3F3B', '1', '1', '123', '123', NULL, 'volvo', '', '不限', NULL, '', '', '', '', '', '', NULL);
INSERT INTO `orders` VALUES ('CABB0DD4BF08440F8E29D30C109D48C4', '1', '1', '123', '123', NULL, 'volvo', '', '不限', NULL, '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `Sid` int(11) NOT NULL AUTO_INCREMENT,
  `Bid` int(11) NULL DEFAULT NULL,
  `Uid` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`Sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10008 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES (10000, 1, '2', 1);
INSERT INTO `score` VALUES (10001, 1, '3', 4);
INSERT INTO `score` VALUES (10002, 1, '3', 1);
INSERT INTO `score` VALUES (10003, 3, '2', 4);
INSERT INTO `score` VALUES (10004, 4, '5', 1);
INSERT INTO `score` VALUES (10005, 4, '2', 5);
INSERT INTO `score` VALUES (10006, 4, '1', 3);
INSERT INTO `score` VALUES (10007, 4, '3', 4);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `Uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', '123', '123', '123456@126.com');
INSERT INTO `tb_user` VALUES ('2', '456', '456', NULL);
INSERT INTO `tb_user` VALUES ('2FDA54D539C744A5A651C36B4D8AB4FE', '753', '753', '123@qq.com');
INSERT INTO `tb_user` VALUES ('3', '789', '789', NULL);
INSERT INTO `tb_user` VALUES ('3A4F9FD9A89A438EAF5F864B49CB6C43', '753', '753', '123@qq.com');
INSERT INTO `tb_user` VALUES ('3FFE66D5775E42EE88AE73D31ED1823D', '753', '753', '123@qq.com');
INSERT INTO `tb_user` VALUES ('4', '123123', '123123', NULL);
INSERT INTO `tb_user` VALUES ('4B8B96A437554975BB779B837231E631', '753', '753', '123@qq.com');
INSERT INTO `tb_user` VALUES ('5', '456456', '456456', NULL);
INSERT INTO `tb_user` VALUES ('6', '789789', '789789', NULL);
INSERT INTO `tb_user` VALUES ('7', '147', '147', '');
INSERT INTO `tb_user` VALUES ('79B3FA4F64E9465481C3646045F0FBD7', '159', '159', '123@qq.com');
INSERT INTO `tb_user` VALUES ('A0F9F480D43A4F778A9007B156704022', '753', '753', '123@qq.com');
INSERT INTO `tb_user` VALUES ('C608ED14B6664DBE8AC0BD89F0E5CAF6', '753', '753', '123@qq.com');

SET FOREIGN_KEY_CHECKS = 1;
