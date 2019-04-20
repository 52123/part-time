/*
 Navicat Premium Data Transfer

 Source Server         : part
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : part_time

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 20/04/2019 16:11:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for about_us
-- ----------------------------
DROP TABLE IF EXISTS `about_us`;
CREATE TABLE `about_us`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `mobile` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '轮播图图片',
  `p_id` int(11) NULL DEFAULT NULL COMMENT '兼职信息图片',
  `c_id` int(11) NULL DEFAULT NULL COMMENT '公司图片',
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态，0-在线，1-下线',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) NOT NULL COMMENT '兼职信息id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `company_id` int(11) NOT NULL COMMENT '公司id',
  `to_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司对用户的评价',
  `to_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户对公司的评价',
  `to_user_credit` int(4) NULL DEFAULT NULL COMMENT '公司对用户的打分',
  `to_company_credit` int(4) NULL DEFAULT NULL COMMENT '用户对公司的打分',
  `company_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '公司评价审核状态 0-未审核，1-审核通过，2-不通过',
  `user_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '用户评价审核状态 0-未审核， 1-审核通过 2-不通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `leading_official` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关负责人',
  `mobile` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司地址',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `credit` int(4) NOT NULL DEFAULT 60 COMMENT '信誉',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for entry_form
-- ----------------------------
DROP TABLE IF EXISTS `entry_form`;
CREATE TABLE `entry_form`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `p_id` int(11) NOT NULL COMMENT '兼职id',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '报名状态，0-已成功投递，1-已查看，2-录用，3-拒绝',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for p_info
-- ----------------------------
DROP TABLE IF EXISTS `p_info`;
CREATE TABLE `p_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NULL DEFAULT NULL COMMENT '所属公司',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `job_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作内容',
  `detail_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '兼职详细地址',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区域地址',
  `work_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作日期',
  `long_term` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '长期兼职，0-不是，1-是',
  `salary` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '薪资',
  `discuss` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '面议， 0-不是，1-是',
  `requirement` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '要求',
  `work_time` varbinary(255) NULL DEFAULT NULL COMMENT '工作时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `need_interview` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '需要面试，0-不需要，1-需要',
  `interview_time` datetime(0) NULL DEFAULT NULL COMMENT '面试时间',
  `interview_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '面试地点',
  `carter_and_bus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包餐/车',
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人',
  `contact_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系方式',
  `consult_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '咨询群二维码',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核，0-未审核，1-已通过，2-不通过，3-已过期',
  `need_people` int(11) NULL DEFAULT NULL COMMENT '需要人数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '截至日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_info
-- ----------------------------
INSERT INTO `p_info` VALUES (1, 1, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', '0', '120', '0', '大旗网大旗网的', NULL, NULL, '0', NULL, NULL, NULL, '1322222222', '微信', '的气味的', 1, 55, '2019-04-14 22:49:51', '私人', NULL);
INSERT INTO `p_info` VALUES (2, 2, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', '0', '120', '0', '大旗网大旗网的', NULL, NULL, '0', NULL, NULL, NULL, '1322222222', '微信', '的气味的', 1, 55, '2019-04-14 22:49:51', '私人', NULL);
INSERT INTO `p_info` VALUES (3, 3, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', '0', '120', '0', '大旗网大旗网的', NULL, NULL, '0', NULL, NULL, NULL, '1322222222', '微信', '的气味的', 1, 55, '2019-04-14 22:49:51', '私人', NULL);
INSERT INTO `p_info` VALUES (4, 4, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', '0', '120', '0', '大旗网大旗网的', NULL, NULL, '0', NULL, NULL, NULL, '1322222222', '微信', '的气味的', 1, 55, '2019-04-14 22:49:51', '私人', NULL);
INSERT INTO `p_info` VALUES (5, 5, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', '0', '120', '0', '大旗网大旗网的', NULL, NULL, '0', NULL, NULL, NULL, '1322222222', '微信', '的气味的', 1, 55, '2019-04-14 22:49:51', '私人', NULL);
INSERT INTO `p_info` VALUES (6, 6, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', '0', '120', '0', '大旗网大旗网的', NULL, NULL, '0', NULL, NULL, NULL, '1322222222', '微信', '的气味的', 1, 55, '2019-04-14 22:49:51', '私人', NULL);
INSERT INTO `p_info` VALUES (7, 7, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', '0', '120', '0', '大旗网大旗网的', NULL, NULL, '0', NULL, NULL, NULL, '1322222222', '微信', '的气味的', 1, 55, '2019-04-14 22:49:51', '私人', NULL);
INSERT INTO `p_info` VALUES (8, 8, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', '0', '120', '0', '大旗网大旗网的', NULL, NULL, '0', NULL, NULL, NULL, '1322222222', '微信', '的气味的', 1, 55, '2019-04-14 22:49:51', '私人', NULL);
INSERT INTO `p_info` VALUES (9, 9, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', '0', '120', '0', '大旗网大旗网的', NULL, NULL, '0', NULL, NULL, NULL, '1322222222', '微信', '的气味的', 1, 55, '2019-04-14 22:49:51', '私人', NULL);
INSERT INTO `p_info` VALUES (10, 10, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 禅城 狮山', '4', '0', '120', '0', '大旗网大旗网的', NULL, NULL, '0', NULL, NULL, NULL, '1322222222', '微信', '的气味的', 1, 55, '2019-04-14 22:49:51', '私人', NULL);

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `age` int(4) NOT NULL COMMENT '年龄',
  `profession` tinyint(4) NOT NULL COMMENT '职业',
  `mobile` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机',
  `introduce` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '自我介绍',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for swiper
-- ----------------------------
DROP TABLE IF EXISTS `swiper`;
CREATE TABLE `swiper`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '地址',
  `company_id` int(11) NULL DEFAULT NULL COMMENT '发布者id',
  `p_id` int(11) NULL DEFAULT NULL COMMENT '兼职id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `species` tinyint(4) NULL DEFAULT NULL COMMENT '类型，0-发布者，1-兼职信息，2-用户id',
  `type` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '轮播图类型',
  `valid` tinyint(4) NULL DEFAULT 0 COMMENT '是否有效，0-失效，1-有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of swiper
-- ----------------------------
INSERT INTO `swiper` VALUES (1, 'https://ossweb-img.qq.com/images/lol/web201310/skin/big39000.jpg', NULL, NULL, NULL, NULL, 'image', 1);
INSERT INTO `swiper` VALUES (2, 'https://ossweb-img.qq.com/images/lol/web201310/skin/big10001.jpg', NULL, NULL, NULL, NULL, 'image', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `open_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `gender` tinyint(4) NULL DEFAULT 0 COMMENT '性别',
  `union_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `credit` int(4) NULL DEFAULT 60 COMMENT '信誉',
  `category` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-用户，1-发布者',
  `province` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `session_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (4, 'b7ca5b273840791a89ae0466bf951e1a', 'ojUiA4sWFQhAd5YjqrPLjiAX0P4g', 'Live', 'https://wx.qlogo.cn/mmopen/vi_32/kAH6ZItDMBuUQUSAcSeHQ7zZXNqbBsibbqte8BYN9olDn9tpwLoTqWhKNNn0gV6YUPuMkoTRAaibUgS2qFAsMSYA/132', 1, NULL, 60, 0, 'Guangdong', 'Zhaoqing', '6eMngeJ0Zcty6zTtocuAhw==');

SET FOREIGN_KEY_CHECKS = 1;
