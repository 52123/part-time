/*
 Navicat Premium Data Transfer

 Source Server         : part-time
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : part-time

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 20/02/2019 18:40:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for about_us
-- ----------------------------
DROP TABLE IF EXISTS `about_us`;
CREATE TABLE `about_us`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '地址',
  `mobile` varchar(32) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_url` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '轮播图图片',
  `p_id` int(11) NULL DEFAULT NULL COMMENT '兼职信息图片',
  `c_id` int(11) NULL DEFAULT NULL COMMENT '公司图片',
  `status` enum('0','1') CHARACTER SET utf8mb4  NULL DEFAULT '0' COMMENT '状态，0-在线，1-下线',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) NOT NULL COMMENT '兼职信息id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `company_id` int(11) NOT NULL COMMENT '公司id',
  `to_user` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '公司对用户的评价',
  `to_company` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '用户对公司的评价',
  `to_user_credit` int(4) NULL DEFAULT NULL COMMENT '公司对用户的打分',
  `to_company_credit` int(4) NULL DEFAULT NULL COMMENT '用户对公司的打分',
  `company_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '公司评价审核状态 0-未审核，1-审核通过，2-不通过',
  `user_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '用户评价审核状态 0-未审核， 1-审核通过 2-不通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '公司名称',
  `leading_official` varchar(16) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '相关负责人',
  `mobile` varchar(32) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '公司地址',
  `remark` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '备注',
  `credit` int(4) NOT NULL DEFAULT 60 COMMENT '信誉',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4  ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for p_info
-- ----------------------------
DROP TABLE IF EXISTS `p_info`;
CREATE TABLE `p_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NULL DEFAULT NULL COMMENT '所属公司',
  `p_name` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '名称',
  `job_content` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '工作内容',
  `detail_address` varchar(255) CHARACTER SET utf8mb4  NOT NULL COMMENT '兼职详细地址',
  `address` varchar(255) CHARACTER SET utf8mb4  NOT NULL COMMENT '区域地址',
  `work_date` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '工作日期',
  `long_term` enum('0','1') CHARACTER SET utf8mb4  NULL DEFAULT '0' COMMENT '长期兼职，0-不是，1-是',
  `salary` varchar(128) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '薪资',
  `discuss` enum('0','1') CHARACTER SET utf8mb4  NULL DEFAULT '0' COMMENT '面议， 0-不是，1-是',
  `requirement` text CHARACTER SET utf8mb4  NULL COMMENT '要求',
  `work_time` varbinary(255) NULL DEFAULT NULL COMMENT '工作时间',
  `remark` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '备注',
  `need_interview` enum('0','1') CHARACTER SET utf8mb4  NULL DEFAULT '0' COMMENT '需要面试，0-不需要，1-需要',
  `interview_time` datetime(0) NULL DEFAULT NULL COMMENT '面试时间',
  `interview_address` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '面试地点',
  `carter_and_bus` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '包餐/车',
  `contact` varchar(255) CHARACTER SET utf8mb4  NOT NULL COMMENT '联系人',
  `contact_way` varchar(255) CHARACTER SET utf8mb4  NOT NULL COMMENT '联系方式',
  `consult_group` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '咨询群二维码',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核，0-未审核，1-已通过，2-不通过，3-已过期',
  `need_people` int(11) NULL DEFAULT NULL COMMENT '需要人数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4  NOT NULL COMMENT '姓名',
  `age` int(4) NOT NULL COMMENT '年龄',
  `profession` tinyint(4) NOT NULL COMMENT '职业',
  `mobile` varchar(32) CHARACTER SET utf8mb4  NOT NULL COMMENT '手机',
  `introduce` text CHARACTER SET utf8mb4  NULL COMMENT '自我介绍',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(128) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '昵称',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4  NULL DEFAULT NULL COMMENT '头像',
  `gender` enum('0','1','2') CHARACTER SET utf8mb4  NULL DEFAULT '0' COMMENT '性别',
  `union_id` varchar(128) CHARACTER SET utf8mb4  NULL DEFAULT NULL,
  `credit` int(4) NULL DEFAULT 60 COMMENT '信誉',
  `category` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-用户，1-发布者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4  ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
