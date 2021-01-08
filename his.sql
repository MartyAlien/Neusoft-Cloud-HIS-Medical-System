/*
 Navicat Premium Data Transfer

 Source Server         : 本地连接
 Source Server Type    : MySQL
 Source Server Version : 50067
 Source Host           : localhost:3306
 Source Schema         : his

 Target Server Type    : MySQL
 Target Server Version : 50067
 File Encoding         : 65001

 Date: 08/01/2021 20:36:29
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for checkitem
-- ----------------------------
DROP TABLE IF EXISTS `checkitem`;
CREATE TABLE `checkitem`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` double(8, 2) NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  UNIQUE INDEX `uq_itemname` USING BTREE(`itemname`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of checkitem
-- ----------------------------
INSERT INTO `checkitem` VALUES (1, 'B超检查', 158.00);
INSERT INTO `checkitem` VALUES (2, 'CT检查', 880.00);
INSERT INTO `checkitem` VALUES (3, '核磁共振检查', 1200.00);

-- ----------------------------
-- Table structure for checkitemrecord
-- ----------------------------
DROP TABLE IF EXISTS `checkitemrecord`;
CREATE TABLE `checkitemrecord`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `cid` int(10) NOT NULL,
  `amount` int(2) NOT NULL,
  `paystatus` int(2) NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  INDEX `fk_checkitemrecord_ref_checkitem` USING BTREE(`cid`),
  INDEX `fk_checkitemrecord_ref_patient` USING BTREE(`pid`),
  CONSTRAINT `fk_checkitemrecord_ref_checkitem` FOREIGN KEY (`cid`) REFERENCES `checkitem` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_checkitemrecord_ref_patient` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 3072 kB; (`cid`) REFER `his/checkitem`(`id`); (`pid`) REFER `his/pa' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of checkitemrecord
-- ----------------------------

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `deptname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  UNIQUE INDEX `uq_deptname` USING BTREE(`deptname`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (5, '儿科');
INSERT INTO `dept` VALUES (4, '消化科');
INSERT INTO `dept` VALUES (3, '眼科');
INSERT INTO `dept` VALUES (2, '耳鼻喉科');
INSERT INTO `dept` VALUES (1, '骨科');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `dname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deptid` int(10) NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  UNIQUE INDEX `uq_dname` USING BTREE(`dname`),
  INDEX `fk_doctor_ref_dept` USING BTREE(`deptid`),
  CONSTRAINT `fk_doctor_ref_dept` FOREIGN KEY (`deptid`) REFERENCES `dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 3072 kB; (`deptid`) REFER `his/dept`(`id`)' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (1, '于鹏', 1);
INSERT INTO `doctor` VALUES (2, '沙首行', 1);
INSERT INTO `doctor` VALUES (3, '杨卫轩', 2);
INSERT INTO `doctor` VALUES (4, '孙英', 3);
INSERT INTO `doctor` VALUES (5, '李博文', 3);
INSERT INTO `doctor` VALUES (6, '郑飞雪', 4);
INSERT INTO `doctor` VALUES (7, '夏伟松', 4);
INSERT INTO `doctor` VALUES (8, '刘思光', 5);
INSERT INTO `doctor` VALUES (9, '姚望', 5);

-- ----------------------------
-- Table structure for inspectitem
-- ----------------------------
DROP TABLE IF EXISTS `inspectitem`;
CREATE TABLE `inspectitem`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inspectname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` double(8, 2) NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  UNIQUE INDEX `uq_inspectname` USING BTREE(`inspectname`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inspectitem
-- ----------------------------
INSERT INTO `inspectitem` VALUES (1, '验血', 64.00);
INSERT INTO `inspectitem` VALUES (2, '验尿', 15.80);
INSERT INTO `inspectitem` VALUES (3, '胸透', 23.60);
INSERT INTO `inspectitem` VALUES (4, '脑部X光', 24.00);
INSERT INTO `inspectitem` VALUES (5, '核磁共振', 100.60);
INSERT INTO `inspectitem` VALUES (6, '彩超', 10.00);
INSERT INTO `inspectitem` VALUES (7, 'B超', 20.00);
INSERT INTO `inspectitem` VALUES (8, '皮试', 2.00);
INSERT INTO `inspectitem` VALUES (9, '备皮', 10.00);
INSERT INTO `inspectitem` VALUES (10, '肛检', 42.50);

-- ----------------------------
-- Table structure for inspectitemrecord
-- ----------------------------
DROP TABLE IF EXISTS `inspectitemrecord`;
CREATE TABLE `inspectitemrecord`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `inspectid` int(10) NOT NULL,
  `amount` int(2) NOT NULL,
  `paystatus` int(2) NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  INDEX `fk_inspectitemrecord_ref_inspectitem` USING BTREE(`inspectid`),
  INDEX `fk_inspectitemrecord_ref_patient` USING BTREE(`pid`),
  CONSTRAINT `fk_inspectitemrecord_ref_inspectitem` FOREIGN KEY (`inspectid`) REFERENCES `inspectitem` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_inspectitemrecord_ref_patient` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 3072 kB; (`inspectid`) REFER `his/inspectitem`(`id`); (`pid`) REFER' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inspectitemrecord
-- ----------------------------
INSERT INTO `inspectitemrecord` VALUES (1, 666666, 5, 1, 1);
INSERT INTO `inspectitemrecord` VALUES (2, 666666, 4, 2, 1);
INSERT INTO `inspectitemrecord` VALUES (5, 666666, 6, 3, 1);
INSERT INTO `inspectitemrecord` VALUES (7, 430058066, 4, 2, 1);
INSERT INTO `inspectitemrecord` VALUES (8, 430058066, 6, 1, 1);
INSERT INTO `inspectitemrecord` VALUES (9, 365763537, 2, 1, 1);
INSERT INTO `inspectitemrecord` VALUES (10, 365763537, 1, 1, 1);
INSERT INTO `inspectitemrecord` VALUES (11, 365763537, 3, 2, 1);
INSERT INTO `inspectitemrecord` VALUES (12, 611051151, 1, 1, 1);
INSERT INTO `inspectitemrecord` VALUES (13, 611051151, 6, 1, 1);
INSERT INTO `inspectitemrecord` VALUES (14, 464368105, 2, 3, 1);
INSERT INTO `inspectitemrecord` VALUES (15, 464368105, 3, 2, 0);
INSERT INTO `inspectitemrecord` VALUES (16, 506066108, 6, 1, 1);
INSERT INTO `inspectitemrecord` VALUES (17, 506066108, 1, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (18, 506066108, 2, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (19, 506066108, 3, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (20, 506066108, 4, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (21, 506066108, 5, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (22, 866762881, 4, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (23, 866762881, 5, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (24, 866762881, 1, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (25, 519881801, 5, 3, 0);
INSERT INTO `inspectitemrecord` VALUES (26, 519881801, 2, 2, 1);
INSERT INTO `inspectitemrecord` VALUES (27, 582511656, 1, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (28, 582511656, 2, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (29, 86181100, 5, 1, 1);
INSERT INTO `inspectitemrecord` VALUES (30, 86181100, 6, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (31, 180666388, 1, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (32, 180666388, 2, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (33, 180666388, 3, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (34, 180666388, 4, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (35, 180666388, 5, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (36, 180666388, 6, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (37, 601618, 1, 1, 1);
INSERT INTO `inspectitemrecord` VALUES (38, 601618, 3, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (39, 611127110, 1, 1, 1);
INSERT INTO `inspectitemrecord` VALUES (40, 611127110, 2, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (41, 611127110, 4, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (42, 151202061, 10, 2, 0);
INSERT INTO `inspectitemrecord` VALUES (43, 196102016, 1, 1, 1);
INSERT INTO `inspectitemrecord` VALUES (44, 196102016, 2, 1, 1);
INSERT INTO `inspectitemrecord` VALUES (45, 196102016, 3, 1, 1);
INSERT INTO `inspectitemrecord` VALUES (46, 196102016, 4, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (47, 196102016, 5, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (48, 196102016, 6, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (49, 196102016, 7, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (50, 196102016, 8, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (51, 196102016, 9, 1, 0);
INSERT INTO `inspectitemrecord` VALUES (52, 196102016, 10, 1, 0);

-- ----------------------------
-- Table structure for level
-- ----------------------------
DROP TABLE IF EXISTS `level`;
CREATE TABLE `level`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `levelname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cost` int(5) NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  UNIQUE INDEX `uq_levelname` USING BTREE(`levelname`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of level
-- ----------------------------
INSERT INTO `level` VALUES (1, '普通号', 8);
INSERT INTO `level` VALUES (2, '专家号', 20);

-- ----------------------------
-- Table structure for medicalrecord
-- ----------------------------
DROP TABLE IF EXISTS `medicalrecord`;
CREATE TABLE `medicalrecord`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL COMMENT '患者病例',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '病例描述',
  `medicalhistory` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '既往历史',
  `familyhistory` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家族病史',
  `initialresult` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '初始结果',
  `result` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结果',
  `finalresult` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最终结果',
  `status` int(5) NOT NULL,
  `operator` int(10) NOT NULL,
  `operatedate` datetime NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  UNIQUE INDEX `fk_medicalrecord_ref_patient` USING BTREE(`pid`),
  INDEX `fk_medicalrecord_ref_user` USING BTREE(`operator`),
  CONSTRAINT `fk_medicalrecord_ref_patient` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_medicalrecord_ref_user` FOREIGN KEY (`operator`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 3072 kB; (`pid`) REFER `his/patient`(`pid`); (`operator`) REFER `hi' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of medicalrecord
-- ----------------------------
INSERT INTO `medicalrecord` VALUES (1, 666666, '脑子疼', '无', '无', '感冒', '季节性感冒', '季节性严重感冒', 1, 1, '2020-12-28 00:00:00');
INSERT INTO `medicalrecord` VALUES (18, 430058066, '脑瓜疼', '无', '无', '感冒', '脑部出现肿瘤', '脑癌初期', 1, 1, '2021-01-07 11:45:41');
INSERT INTO `medicalrecord` VALUES (19, 365763537, '拉肚子，腿软', '做过阑尾炎手术', '无', '腹泻', '无明显异常', '腹泻', 1, 1, '2021-01-07 17:15:39');
INSERT INTO `medicalrecord` VALUES (20, 611051151, '眼睛不舒服，发红', '无', '无', '细菌感染', '真菌引起的眼睛红肿', '红眼病', 1, 1, '2021-01-07 18:22:23');
INSERT INTO `medicalrecord` VALUES (21, 464368105, '1', '1', '1', '1', '2', '2', 1, 1, '2021-01-07 21:20:59');
INSERT INTO `medicalrecord` VALUES (22, 506066108, '2', '2', '2', '2', '3', '3', 1, 1, '2021-01-07 21:21:21');
INSERT INTO `medicalrecord` VALUES (23, 866762881, '1', '1', '1', '1', '2', '2', 1, 1, '2021-01-07 21:21:47');
INSERT INTO `medicalrecord` VALUES (24, 519881801, '2', '2', '2', '2', '2', '2', 1, 1, '2021-01-07 21:22:17');
INSERT INTO `medicalrecord` VALUES (25, 582511656, '2', '2', '2', '2', '2', '2', 1, 1, '2021-01-07 21:22:42');
INSERT INTO `medicalrecord` VALUES (26, 86181100, '2', '2', '2', '2', '2', '2', 1, 1, '2021-01-07 21:23:04');
INSERT INTO `medicalrecord` VALUES (27, 180666388, '2', '2', '2', '2', '2', '2', 1, 1, '2021-01-07 21:23:41');
INSERT INTO `medicalrecord` VALUES (28, 601618, '1', '1', '1', '1', '1', '1', 1, 1, '2021-01-07 21:27:07');
INSERT INTO `medicalrecord` VALUES (29, 611127110, '1', '11', '1', '1', '1', '1', 1, 1, '2021-01-07 21:32:41');
INSERT INTO `medicalrecord` VALUES (30, 151202061, '1', '1', '11', '1', '12', '12', 1, 1, '2021-01-08 16:06:36');
INSERT INTO `medicalrecord` VALUES (31, 196102016, '1', '1', '1', '1', '1', '1', 1, 1, '2021-01-08 16:08:25');

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient`  (
  `pid` int(10) NOT NULL,
  `pname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` int(5) NULL DEFAULT NULL,
  `birthday` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idcard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `levelid` int(10) NOT NULL,
  `deptid` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `createdate` date NOT NULL,
  `cost` int(5) NOT NULL,
  `pstatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(5) NOT NULL,
  `operator` int(10) NOT NULL,
  `operatedate` datetime NOT NULL,
  PRIMARY KEY USING BTREE (`pid`),
  UNIQUE INDEX `uq_idcard` USING BTREE(`idcard`),
  INDEX `fk_patient_ref_level` USING BTREE(`levelid`),
  INDEX `fk_patient_ref_dept` USING BTREE(`deptid`),
  INDEX `fk_patient_ref_doctor` USING BTREE(`doctorid`),
  INDEX `fk_patient_ref_user` USING BTREE(`operator`),
  CONSTRAINT `fk_patient_ref_dept` FOREIGN KEY (`deptid`) REFERENCES `dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_patient_ref_doctor` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_patient_ref_level` FOREIGN KEY (`levelid`) REFERENCES `level` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_patient_ref_user` FOREIGN KEY (`operator`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 3072 kB; (`deptid`) REFER `his/dept`(`id`); (`doctorid`) REFER `his' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES (601618, '刘浩存', '女', 20, NULL, '510110200010121852', '北京市', 2, 4, 7, '2021-01-08', 21, '0', 1, 1, '2021-01-07 21:26:24');
INSERT INTO `patient` VALUES (666666, '李白', '男', 20, NULL, '510902199911121662', '黑龙江', 1, 5, 8, '2020-12-21', 8, '0', 1, 1, '2020-12-21 16:20:00');
INSERT INTO `patient` VALUES (45025611, '小强', '男', 22, NULL, '510902200012201661', '河北省', 2, 2, 3, '2020-12-22', 21, '2', 1, 1, '2020-12-21 00:59:00');
INSERT INTO `patient` VALUES (86181100, '栗子', '女', 26, NULL, '262826199810101561', '黑龙江省', 1, 4, 7, '2020-12-25', 9, '0', 1, 1, '2020-12-25 09:35:55');
INSERT INTO `patient` VALUES (151202061, '特朗普', '男', 70, NULL, '510902192510201852', '美国白宫', 2, 4, 7, '2021-01-07', 21, '0', 1, 1, '2021-01-07 22:00:04');
INSERT INTO `patient` VALUES (180666388, '马化腾', '男', 46, NULL, '462262197604051258', '广东省', 2, 3, 5, '2020-12-26', 21, '0', 1, 1, '2020-12-25 08:37:55');
INSERT INTO `patient` VALUES (196102016, '谭亚军2', '男', 20, NULL, '510152199910101852', '四川省', 2, 2, 3, '2021-01-08', 20, '0', 1, 1, '2021-01-08 16:01:35');
INSERT INTO `patient` VALUES (365763537, '王芳', '女', 36, NULL, '332562198802011258', '广东省', 1, 4, 6, '2020-12-24', 8, '0', 1, 1, '2020-12-23 14:03:15');
INSERT INTO `patient` VALUES (430058066, '赵四', '男', 22, NULL, '510902200012201852', '河北省', 1, 2, 3, '2020-12-22', 9, '0', 1, 1, '2020-12-21 08:43:00');
INSERT INTO `patient` VALUES (464368105, '刘长勇', '男', 45, NULL, '233605197812062452', '黑龙江省', 2, 4, 7, '2020-12-23', 21, '0', 1, 1, '2020-12-22 18:24:57');
INSERT INTO `patient` VALUES (506066108, '范冰冰', '女', 40, NULL, '422302197610201454', '北京', 2, 4, 7, '2020-12-23', 21, '0', 1, 1, '2020-12-22 14:45:12');
INSERT INTO `patient` VALUES (519881801, '李小冉', '女', 22, NULL, '51090220001220185x', '甘肃省', 2, 2, 3, '2020-12-24', 21, '0', 1, 1, '2020-12-21 08:43:26');
INSERT INTO `patient` VALUES (582511656, '杨颖', '女', 34, NULL, '51090219721010185x', '非官方大哥', 1, 4, 6, '2020-12-24', 9, '0', 1, 1, '2020-12-22 14:28:53');
INSERT INTO `patient` VALUES (611051151, '腾格尔', '男', 60, NULL, '123502199804261321', '内蒙古包头市', 1, 3, 5, '2021-01-07', 9, '0', 1, 1, '2021-01-07 18:18:52');
INSERT INTO `patient` VALUES (611127110, '贾乃亮', '男', 38, NULL, '223512198212121852', '北京市海淀区', 2, 4, 6, '2021-01-08', 21, '0', 1, 1, '2021-01-07 21:32:16');
INSERT INTO `patient` VALUES (663111011, '小张', '女', 28, NULL, '510120199912201852', '四川省', 2, 2, 3, '2021-01-08', 20, '2', 1, 1, '2021-01-08 10:16:01');
INSERT INTO `patient` VALUES (692622126, '小李', '女', 28, NULL, '223223200001211162', '贵州省', 1, 2, 3, '2021-01-09', 9, '2', 1, 1, '2021-01-08 10:17:06');
INSERT INTO `patient` VALUES (866762881, '任我行', '男', 65, NULL, '23360219470606145x', '江苏省', 2, 3, 5, '2020-12-23', 20, '0', 1, 1, '2020-12-22 17:19:17');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userid` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY USING BTREE (`userid`),
  UNIQUE INDEX `uq_username` USING BTREE(`username`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '陈曦', '123456', '门诊管理员');
INSERT INTO `user` VALUES (2, '于鹏', '111111', '医生管理员');
INSERT INTO `user` VALUES (3, '沙首行', '666666', '医生管理员');
INSERT INTO `user` VALUES (4, '杨卫轩', '888888', '医生管理员');
INSERT INTO `user` VALUES (5, '孙英', '999999', '医生管理员');
INSERT INTO `user` VALUES (6, '李博文', '777777', '医生管理员');
INSERT INTO `user` VALUES (7, '郑飞雪', '666666', '医生管理员');
INSERT INTO `user` VALUES (8, '夏伟松', '333333', '医生管理员');
INSERT INTO `user` VALUES (9, '姚望', '888888', '医生管理员');
INSERT INTO `user` VALUES (10, '刘思光', '888888', '医生管理员');

SET FOREIGN_KEY_CHECKS = 1;
