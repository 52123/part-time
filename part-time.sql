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

 Date: 28/04/2019 12:11:11
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
  `qq` int(32) NULL DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of about_us
-- ----------------------------
INSERT INTO `about_us` VALUES (1, NULL, '13226795925', 644396066, 'pt-monkey@protonmail.com', '猴窝客');

-- ----------------------------
-- Table structure for auth
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学校名',
  `college` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学院',
  `student_id` int(64) NOT NULL COMMENT '学号',
  `grade` int(16) NOT NULL COMMENT '年级',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态，0-审核中，1-通过审核，2-拒绝',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth
-- ----------------------------
INSERT INTO `auth` VALUES (1, '佛山科学技术学院', '机电工程学院', 3232332, 15, '地都', 4, 2);

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
-- Table structure for classify
-- ----------------------------
DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类目',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classify
-- ----------------------------
INSERT INTO `classify` VALUES (1, '家教/辅导');
INSERT INTO `classify` VALUES (2, '促销/导购');
INSERT INTO `classify` VALUES (3, '传单派发');
INSERT INTO `classify` VALUES (4, '配送员');
INSERT INTO `classify` VALUES (5, '其它');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index`(`user_id`, `p_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (2, 4, 2);

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
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `p_id` int(11) NOT NULL COMMENT '兼职id',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '报名状态，0-已成功投递，1-已查看，2-待面试，3-录用，4-拒绝',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_p`(`p_id`, `user_id`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of entry_form
-- ----------------------------
INSERT INTO `entry_form` VALUES (4, 1, 0, 1);
INSERT INTO `entry_form` VALUES (4, 4, 0, 4);
INSERT INTO `entry_form` VALUES (4, 5, 0, 2);
INSERT INTO `entry_form` VALUES (4, 6, 0, 3);
INSERT INTO `entry_form` VALUES (4, 7, 0, 5);

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suggest` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contact` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES (1, 'dqwdwqd', NULL, NULL, 4);
INSERT INTO `feedback` VALUES (2, 'dqdqwd', NULL, NULL, 4);

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
  `long_term` tinyint(4) NULL DEFAULT 0 COMMENT '长期兼职，0-不是，1-是',
  `salary` int(11) NULL DEFAULT NULL COMMENT '薪资',
  `discuss` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '面议， 0-不是，1-是',
  `requirement` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '要求',
  `work_time` varbinary(255) NULL DEFAULT NULL COMMENT '工作时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `need_interview` tinyint(4) NULL DEFAULT 0 COMMENT '需要面试，0-不需要，1-需要',
  `interview_time` datetime(0) NULL DEFAULT NULL COMMENT '面试时间',
  `interview_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '面试地点',
  `carter_and_bus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '包餐/车',
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人',
  `contact_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系方式',
  `consult_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '咨询群二维码',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核，0-未审核，1-已通过，2-不通过，3-已过期',
  `need_people` int(11) NULL DEFAULT NULL COMMENT '需要人数',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '截至日期',
  `publish` tinyint(4) NULL DEFAULT 0 COMMENT '是否已发布，0-未发布，1-已发布，2-逻辑删除',
  `category_id` tinyint(4) NULL DEFAULT 5 COMMENT '分类id',
  `view` int(11) UNSIGNED NULL DEFAULT 1 COMMENT '浏览量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_info
-- ----------------------------
INSERT INTO `p_info` VALUES (1, 1, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 150, 0, '大旗网大旗网的', NULL, NULL, 0, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:08:41', '私人', NULL, 1, 1, 6);
INSERT INTO `p_info` VALUES (2, 2, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 1, 0, 0, '大旗网大旗网的', NULL, NULL, 1, '2019-04-24 00:56:01', 'asdasdsad', NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:08:43', '私人', NULL, 1, 2, 1);
INSERT INTO `p_info` VALUES (3, 3, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 0, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:08:44', '私人', NULL, 1, 3, 1);
INSERT INTO `p_info` VALUES (4, 4, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 0, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:08:46', '私人', NULL, 1, 4, 1);
INSERT INTO `p_info` VALUES (5, 5, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:08:48', '私人', NULL, 1, 1, 2);
INSERT INTO `p_info` VALUES (6, 6, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:08:49', '私人', NULL, 1, 1, 1);
INSERT INTO `p_info` VALUES (7, 7, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:08:52', '私人', NULL, 1, 2, 3);
INSERT INTO `p_info` VALUES (8, 8, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (9, 9, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (10, 10, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 禅城 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 2);
INSERT INTO `p_info` VALUES (11, 11, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 禅城 狮山', '4', 0, 110, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-28 04:24:45', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (12, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 禅城 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (13, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 禅城 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (14, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (15, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (16, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (17, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (18, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (19, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (20, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (21, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (22, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (23, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (24, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (25, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (26, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (27, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (28, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (29, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (30, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (31, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (32, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (33, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (34, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (35, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (36, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (37, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (38, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (39, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (40, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (41, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (42, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (43, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (44, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (45, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (46, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (47, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (48, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (49, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (50, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (51, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (52, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (53, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (54, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (55, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (56, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (57, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (58, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (59, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (60, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (61, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (62, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (63, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (64, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (65, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (66, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (67, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (68, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (69, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (70, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (71, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (72, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (73, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (74, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (75, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (76, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (77, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (78, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (79, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (80, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (81, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (82, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (83, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (84, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (85, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (86, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (87, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (88, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (89, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (90, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (91, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (92, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (93, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (94, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (95, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (96, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (97, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (98, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (99, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (100, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (101, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (102, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (103, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (104, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (105, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (106, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (107, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (108, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (109, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (110, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (111, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (112, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);
INSERT INTO `p_info` VALUES (113, 12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-25 22:07:53', '私人', NULL, 1, 5, 1);

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `age` int(4) NOT NULL COMMENT '年龄',
  `profession` tinyint(4) NULL DEFAULT NULL COMMENT '职业',
  `mobile` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机',
  `introduce` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '自我介绍',
  `birth_date` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '出生年月',
  `user_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resume
-- ----------------------------
INSERT INTO `resume` VALUES (1, '地点', 14, NULL, '13444444444', '地区的气温的\n权威的权威的\n权威的亲委', '2004-01', 'b7ca5b273840791a89ae0466bf951e1a');

-- ----------------------------
-- Table structure for school
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school`  (
  `id` int(11) NOT NULL,
  `school` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学校名',
  `college` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grade` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES (1, '佛山科学技术学院', '机电工程学院|自动化学院|电子信息工程学院|数学与大数据学院|物理与光电工程学院|材料科学与能源工程学院|工业设计与陶瓷艺术学院|食品科学与工程学院|生命科学与工程学院|环境与化学工程学院|交通与土木建筑学院|口腔医学院|人文与教育学院|经济管理与法学院|马克思主义学院|继续教育学院|创业学院', '15|16|17|18');

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
  `auth` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-未认证，1-学生认证，2-企业认证',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (4, 'b7ca5b273840791a89ae0466bf951e1a', 'ojUiA4sWFQhAd5YjqrPLjiAX0P4g', 'Live', 'https://wx.qlogo.cn/mmopen/vi_32/kAH6ZItDMBuUQUSAcSeHQ7zZXNqbBsibbqte8BYN9olDn9tpwLoTqWhKNNn0gV6YUPuMkoTRAaibUgS2qFAsMSYA/132', 1, NULL, 60, 0, 'Guangdong', 'Zhaoqing', '6eMngeJ0Zcty6zTtocuAhw==', 0);

-- ----------------------------
-- Procedure structure for insertData
-- ----------------------------
DROP PROCEDURE IF EXISTS `insertData`;
delimiter ;;
CREATE PROCEDURE `insertData`()
begin
	declare i int default 0;
 while i < 100 do
	INSERT INTO `part_time`.`p_info`(`company_id`, `title`, `job_content`, `detail_address`, `address`, `work_date`, `long_term`, `salary`, `discuss`, `requirement`, `work_time`, `remark`, `need_interview`, `interview_time`, `interview_address`, `carter_and_bus`, `contact`, `contact_number`, `consult_group`, `status`, `need_people`, `create_time`, `company_name`, `expire_time`, `publish`) VALUES (12, ' 私人家教', '负责是啊是阿三啊', '大旗网大旗网大旗网的吾掂亲委', '佛山 南海 狮山', '4', 0, 120, 1, '大旗网大旗网的', NULL, NULL, 1, NULL, NULL, NULL, '小明', '1322222222', NULL, 1, 55, '2019-04-23 15:18:39', '私人', NULL, 1);
 set i = i + 1;
end while;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
