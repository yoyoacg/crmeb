/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : 127.0.0.1:3306
 Source Schema         : crmeb

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 24/05/2019 17:58:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for eb_article
-- ----------------------------
DROP TABLE IF EXISTS `eb_article`;
CREATE TABLE `eb_article`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章管理ID',
  `cid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '分类id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文章作者',
  `image_input` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章图片',
  `synopsis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文章简介',
  `share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文章分享标题',
  `share_synopsis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文章分享简介',
  `visit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '浏览次数',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '原文链接',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '状态',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员id',
  `mer_id` int(10) UNSIGNED DEFAULT 0 COMMENT '商户id',
  `is_hot` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否热门(小程序)',
  `is_banner` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否轮播图(小程序)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_article_category
-- ----------------------------
DROP TABLE IF EXISTS `eb_article_category`;
CREATE TABLE `eb_article_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章分类id',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '父级ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章分类标题',
  `intr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文章分类简介',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章分类图片',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '状态',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1删除0未删除',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `hidden` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_article_content
-- ----------------------------
DROP TABLE IF EXISTS `eb_article_content`;
CREATE TABLE `eb_article_content`  (
  `nid` int(10) UNSIGNED NOT NULL COMMENT '文章id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章内容',
  UNIQUE INDEX `nid`(`nid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_cache
-- ----------------------------
DROP TABLE IF EXISTS `eb_cache`;
CREATE TABLE `eb_cache`  (
  `key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '缓存数据',
  `add_time` int(10) DEFAULT NULL COMMENT '缓存时间',
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信缓存表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_express
-- ----------------------------
DROP TABLE IF EXISTS `eb_express`;
CREATE TABLE `eb_express`  (
  `id` mediumint(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '快递公司id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递公司简称',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递公司全称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `is_show` tinyint(1) NOT NULL COMMENT '是否显示',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  INDEX `is_show`(`is_show`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 426 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '快递公司表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_express
-- ----------------------------
INSERT INTO `eb_express` VALUES (1, 'LIMINWL', '利民物流', 1, 0);
INSERT INTO `eb_express` VALUES (2, 'XINTIAN', '鑫天顺物流', 1, 0);
INSERT INTO `eb_express` VALUES (3, 'henglu', '恒路物流', 1, 0);
INSERT INTO `eb_express` VALUES (4, 'klwl', '康力物流', 1, 0);
INSERT INTO `eb_express` VALUES (5, 'meiguo', '美国快递', 1, 0);
INSERT INTO `eb_express` VALUES (6, 'a2u', 'A2U速递', 1, 0);
INSERT INTO `eb_express` VALUES (7, 'benteng', '奔腾物流', 1, 0);
INSERT INTO `eb_express` VALUES (8, 'ahdf', '德方物流', 1, 0);
INSERT INTO `eb_express` VALUES (9, 'timedg', '万家通', 1, 0);
INSERT INTO `eb_express` VALUES (10, 'ztong', '智通物流', 1, 0);
INSERT INTO `eb_express` VALUES (11, 'xindan', '新蛋物流', 1, 0);
INSERT INTO `eb_express` VALUES (12, 'bgpyghx', '挂号信', 1, 0);
INSERT INTO `eb_express` VALUES (13, 'XFHONG', '鑫飞鸿物流快递', 1, 0);
INSERT INTO `eb_express` VALUES (14, 'ALP', '阿里物流', 1, 0);
INSERT INTO `eb_express` VALUES (15, 'BFWL', '滨发物流', 1, 0);
INSERT INTO `eb_express` VALUES (16, 'SJWL', '宋军物流', 1, 0);
INSERT INTO `eb_express` VALUES (17, 'SHUNFAWL', '顺发物流', 1, 0);
INSERT INTO `eb_express` VALUES (18, 'TIANHEWL', '天河物流', 1, 0);
INSERT INTO `eb_express` VALUES (19, 'YBWL', '邮联物流', 1, 0);
INSERT INTO `eb_express` VALUES (20, 'SWHY', '盛旺货运', 1, 0);
INSERT INTO `eb_express` VALUES (21, 'TSWL', '汤氏物流', 1, 0);
INSERT INTO `eb_express` VALUES (22, 'YUANYUANWL', '圆圆物流', 1, 0);
INSERT INTO `eb_express` VALUES (23, 'BALIANGWL', '八梁物流', 1, 0);
INSERT INTO `eb_express` VALUES (24, 'ZGWL', '振刚物流', 1, 0);
INSERT INTO `eb_express` VALUES (25, 'JIAYU', '佳宇物流', 1, 0);
INSERT INTO `eb_express` VALUES (26, 'SHHX', '昊昕物流', 1, 0);
INSERT INTO `eb_express` VALUES (27, 'ande', '安得物流', 1, 0);
INSERT INTO `eb_express` VALUES (28, 'ppbyb', '贝邮宝', 1, 0);
INSERT INTO `eb_express` VALUES (29, 'dida', '递达快递', 1, 0);
INSERT INTO `eb_express` VALUES (30, 'jppost', '日本邮政', 1, 0);
INSERT INTO `eb_express` VALUES (31, 'intmail', '中国邮政', 96, 0);
INSERT INTO `eb_express` VALUES (32, 'HENGCHENGWL', '恒诚物流', 1, 0);
INSERT INTO `eb_express` VALUES (33, 'HENGFENGWL', '恒丰物流', 1, 0);
INSERT INTO `eb_express` VALUES (34, 'gdems', '广东ems快递', 1, 0);
INSERT INTO `eb_express` VALUES (35, 'xlyt', '祥龙运通', 1, 0);
INSERT INTO `eb_express` VALUES (36, 'gjbg', '国际包裹', 1, 0);
INSERT INTO `eb_express` VALUES (37, 'uex', 'UEX', 1, 0);
INSERT INTO `eb_express` VALUES (38, 'singpost', '新加坡邮政', 1, 0);
INSERT INTO `eb_express` VALUES (39, 'guangdongyouzhengwuliu', '广东邮政', 1, 0);
INSERT INTO `eb_express` VALUES (40, 'bht', 'BHT', 1, 0);
INSERT INTO `eb_express` VALUES (41, 'cces', 'CCES快递', 1, 0);
INSERT INTO `eb_express` VALUES (42, 'cloudexpress', 'CE易欧通国际速递', 1, 0);
INSERT INTO `eb_express` VALUES (43, 'dasu', '达速物流', 1, 0);
INSERT INTO `eb_express` VALUES (44, 'pfcexpress', '皇家物流', 1, 0);
INSERT INTO `eb_express` VALUES (45, 'hjs', '猴急送', 1, 0);
INSERT INTO `eb_express` VALUES (46, 'huilian', '辉联物流', 1, 0);
INSERT INTO `eb_express` VALUES (47, 'huanqiu', '环球速运', 1, 0);
INSERT INTO `eb_express` VALUES (48, 'huada', '华达快运', 1, 0);
INSERT INTO `eb_express` VALUES (49, 'htwd', '华通务达物流', 1, 0);
INSERT INTO `eb_express` VALUES (50, 'hipito', '海派通', 1, 0);
INSERT INTO `eb_express` VALUES (51, 'hqtd', '环球通达', 1, 0);
INSERT INTO `eb_express` VALUES (52, 'airgtc', '航空快递', 1, 0);
INSERT INTO `eb_express` VALUES (53, 'haoyoukuai', '好又快物流', 1, 0);
INSERT INTO `eb_express` VALUES (54, 'hanrun', '韩润物流', 1, 0);
INSERT INTO `eb_express` VALUES (55, 'ccd', '河南次晨达', 1, 0);
INSERT INTO `eb_express` VALUES (56, 'hfwuxi', '和丰同城', 1, 0);
INSERT INTO `eb_express` VALUES (57, 'Sky', '荷兰', 1, 0);
INSERT INTO `eb_express` VALUES (58, 'hongxun', '鸿讯物流', 1, 0);
INSERT INTO `eb_express` VALUES (59, 'hongjie', '宏捷国际物流', 1, 0);
INSERT INTO `eb_express` VALUES (60, 'httx56', '汇通天下物流', 1, 0);
INSERT INTO `eb_express` VALUES (61, 'lqht', '恒通快递', 1, 0);
INSERT INTO `eb_express` VALUES (62, 'jinguangsudikuaijian', '京广速递快件', 1, 0);
INSERT INTO `eb_express` VALUES (63, 'junfengguoji', '骏丰国际速递', 1, 0);
INSERT INTO `eb_express` VALUES (64, 'jiajiatong56', '佳家通', 1, 0);
INSERT INTO `eb_express` VALUES (65, 'jrypex', '吉日优派', 1, 0);
INSERT INTO `eb_express` VALUES (66, 'jinchengwuliu', '锦程国际物流', 1, 0);
INSERT INTO `eb_express` VALUES (67, 'jgwl', '景光物流', 1, 0);
INSERT INTO `eb_express` VALUES (68, 'pzhjst', '急顺通', 1, 0);
INSERT INTO `eb_express` VALUES (69, 'ruexp', '捷网俄全通', 1, 0);
INSERT INTO `eb_express` VALUES (70, 'jmjss', '金马甲', 1, 0);
INSERT INTO `eb_express` VALUES (71, 'lanhu', '蓝弧快递', 1, 0);
INSERT INTO `eb_express` VALUES (72, 'ltexp', '乐天速递', 1, 0);
INSERT INTO `eb_express` VALUES (73, 'lutong', '鲁通快运', 1, 0);
INSERT INTO `eb_express` VALUES (74, 'ledii', '乐递供应链', 1, 0);
INSERT INTO `eb_express` VALUES (75, 'lundao', '论道国际物流', 1, 0);
INSERT INTO `eb_express` VALUES (76, 'mailikuaidi', '麦力快递', 1, 0);
INSERT INTO `eb_express` VALUES (77, 'mchy', '木春货运', 1, 0);
INSERT INTO `eb_express` VALUES (78, 'meiquick', '美快国际物流', 1, 0);
INSERT INTO `eb_express` VALUES (79, 'valueway', '美通快递', 1, 0);
INSERT INTO `eb_express` VALUES (80, 'nuoyaao', '偌亚奥国际', 1, 0);
INSERT INTO `eb_express` VALUES (81, 'euasia', '欧亚专线', 1, 0);
INSERT INTO `eb_express` VALUES (82, 'pca', '澳大利亚PCA快递', 1, 0);
INSERT INTO `eb_express` VALUES (83, 'pingandatengfei', '平安达腾飞', 1, 0);
INSERT INTO `eb_express` VALUES (84, 'pjbest', '品骏快递', 1, 0);
INSERT INTO `eb_express` VALUES (85, 'qbexpress', '秦邦快运', 1, 0);
INSERT INTO `eb_express` VALUES (86, 'quanxintong', '全信通快递', 1, 0);
INSERT INTO `eb_express` VALUES (87, 'quansutong', '全速通国际快递', 1, 0);
INSERT INTO `eb_express` VALUES (88, 'qinyuan', '秦远物流', 1, 0);
INSERT INTO `eb_express` VALUES (89, 'qichen', '启辰国际物流', 1, 0);
INSERT INTO `eb_express` VALUES (90, 'quansu', '全速快运', 1, 0);
INSERT INTO `eb_express` VALUES (91, 'qzx56', '全之鑫物流', 1, 0);
INSERT INTO `eb_express` VALUES (92, 'qskdyxgs', '千顺快递', 1, 0);
INSERT INTO `eb_express` VALUES (93, 'runhengfeng', '全时速运', 1, 0);
INSERT INTO `eb_express` VALUES (94, 'rytsd', '日益通速递', 1, 0);
INSERT INTO `eb_express` VALUES (95, 'ruidaex', '瑞达国际速递', 1, 0);
INSERT INTO `eb_express` VALUES (96, 'shiyun', '世运快递', 1, 0);
INSERT INTO `eb_express` VALUES (97, 'sfift', '十方通物流', 1, 0);
INSERT INTO `eb_express` VALUES (98, 'stkd', '顺通快递', 1, 0);
INSERT INTO `eb_express` VALUES (99, 'bgn', '布谷鸟快递', 1, 0);
INSERT INTO `eb_express` VALUES (100, 'jiahuier', '佳惠尔快递', 1, 0);
INSERT INTO `eb_express` VALUES (101, 'pingyou', '小包', 1, 0);
INSERT INTO `eb_express` VALUES (102, 'yumeijie', '誉美捷快递', 1, 0);
INSERT INTO `eb_express` VALUES (103, 'meilong', '美龙快递', 1, 0);
INSERT INTO `eb_express` VALUES (104, 'guangtong', '广通速递', 1, 0);
INSERT INTO `eb_express` VALUES (105, 'STARS', '星晨急便', 1, 0);
INSERT INTO `eb_express` VALUES (106, 'NANHANG', '中国南方航空股份有限公司', 1, 0);
INSERT INTO `eb_express` VALUES (107, 'lanbiao', '蓝镖快递', 1, 0);
INSERT INTO `eb_express` VALUES (109, 'baotongda', '宝通达物流', 1, 0);
INSERT INTO `eb_express` VALUES (110, 'dashun', '大顺物流', 1, 0);
INSERT INTO `eb_express` VALUES (111, 'dada', '大达物流', 1, 0);
INSERT INTO `eb_express` VALUES (112, 'fangfangda', '方方达物流', 1, 0);
INSERT INTO `eb_express` VALUES (113, 'hebeijianhua', '河北建华物流', 1, 0);
INSERT INTO `eb_express` VALUES (114, 'haolaiyun', '好来运快递', 1, 0);
INSERT INTO `eb_express` VALUES (115, 'jinyue', '晋越快递', 1, 0);
INSERT INTO `eb_express` VALUES (116, 'kuaitao', '快淘快递', 1, 0);
INSERT INTO `eb_express` VALUES (117, 'peixing', '陪行物流', 1, 0);
INSERT INTO `eb_express` VALUES (118, 'hkpost', '香港邮政', 1, 0);
INSERT INTO `eb_express` VALUES (119, 'ytfh', '一统飞鸿快递', 1, 0);
INSERT INTO `eb_express` VALUES (120, 'zhongxinda', '中信达快递', 1, 0);
INSERT INTO `eb_express` VALUES (121, 'zhongtian', '中天快运', 1, 0);
INSERT INTO `eb_express` VALUES (122, 'zuochuan', '佐川急便', 1, 0);
INSERT INTO `eb_express` VALUES (123, 'chengguang', '程光快递', 1, 0);
INSERT INTO `eb_express` VALUES (124, 'cszx', '城市之星', 1, 0);
INSERT INTO `eb_express` VALUES (125, 'chuanzhi', '传志快递', 1, 0);
INSERT INTO `eb_express` VALUES (126, 'feibao', '飞豹快递', 1, 0);
INSERT INTO `eb_express` VALUES (127, 'huiqiang', '汇强快递', 1, 0);
INSERT INTO `eb_express` VALUES (128, 'lejiedi', '乐捷递', 1, 0);
INSERT INTO `eb_express` VALUES (129, 'lijisong', '成都立即送快递', 1, 0);
INSERT INTO `eb_express` VALUES (130, 'minbang', '民邦速递', 1, 0);
INSERT INTO `eb_express` VALUES (131, 'ocs', 'OCS国际快递', 1, 0);
INSERT INTO `eb_express` VALUES (132, 'santai', '三态速递', 1, 0);
INSERT INTO `eb_express` VALUES (133, 'saiaodi', '赛澳递', 1, 0);
INSERT INTO `eb_express` VALUES (134, 'jingdong', '京东快递', 1, 0);
INSERT INTO `eb_express` VALUES (135, 'zengyi', '增益快递', 1, 0);
INSERT INTO `eb_express` VALUES (136, 'fanyu', '凡宇速递', 1, 0);
INSERT INTO `eb_express` VALUES (137, 'fengda', '丰达快递', 1, 0);
INSERT INTO `eb_express` VALUES (138, 'coe', '东方快递', 1, 0);
INSERT INTO `eb_express` VALUES (139, 'ees', '百福东方快递', 1, 0);
INSERT INTO `eb_express` VALUES (140, 'disifang', '递四方速递', 1, 0);
INSERT INTO `eb_express` VALUES (141, 'rufeng', '如风达快递', 1, 0);
INSERT INTO `eb_express` VALUES (142, 'changtong', '长通物流', 1, 0);
INSERT INTO `eb_express` VALUES (143, 'chengshi100', '城市100快递', 1, 0);
INSERT INTO `eb_express` VALUES (144, 'feibang', '飞邦物流', 1, 0);
INSERT INTO `eb_express` VALUES (145, 'haosheng', '昊盛物流', 1, 0);
INSERT INTO `eb_express` VALUES (146, 'yinsu', '音速速运', 1, 0);
INSERT INTO `eb_express` VALUES (147, 'kuanrong', '宽容物流', 1, 0);
INSERT INTO `eb_express` VALUES (148, 'tongcheng', '通成物流', 1, 0);
INSERT INTO `eb_express` VALUES (149, 'tonghe', '通和天下物流', 1, 0);
INSERT INTO `eb_express` VALUES (150, 'zhima', '芝麻开门', 1, 0);
INSERT INTO `eb_express` VALUES (151, 'ririshun', '日日顺物流', 1, 0);
INSERT INTO `eb_express` VALUES (152, 'anxun', '安迅物流', 1, 0);
INSERT INTO `eb_express` VALUES (153, 'baiqian', '百千诚国际物流', 1, 0);
INSERT INTO `eb_express` VALUES (154, 'chukouyi', '出口易', 1, 0);
INSERT INTO `eb_express` VALUES (155, 'diantong', '店通快递', 1, 0);
INSERT INTO `eb_express` VALUES (156, 'dajin', '大金物流', 1, 0);
INSERT INTO `eb_express` VALUES (157, 'feite', '飞特物流', 1, 0);
INSERT INTO `eb_express` VALUES (159, 'gnxb', '国内小包', 1, 0);
INSERT INTO `eb_express` VALUES (160, 'huacheng', '华诚物流', 1, 0);
INSERT INTO `eb_express` VALUES (161, 'huahan', '华翰物流', 1, 0);
INSERT INTO `eb_express` VALUES (162, 'hengyu', '恒宇运通', 1, 0);
INSERT INTO `eb_express` VALUES (163, 'huahang', '华航快递', 1, 0);
INSERT INTO `eb_express` VALUES (164, 'jiuyi', '久易快递', 1, 0);
INSERT INTO `eb_express` VALUES (165, 'jiete', '捷特快递', 1, 0);
INSERT INTO `eb_express` VALUES (166, 'jingshi', '京世物流', 1, 0);
INSERT INTO `eb_express` VALUES (167, 'kuayue', '跨越快递', 1, 0);
INSERT INTO `eb_express` VALUES (168, 'mengsu', '蒙速快递', 1, 0);
INSERT INTO `eb_express` VALUES (169, 'nanbei', '南北快递', 1, 0);
INSERT INTO `eb_express` VALUES (171, 'pinganda', '平安达快递', 1, 0);
INSERT INTO `eb_express` VALUES (172, 'ruifeng', '瑞丰速递', 1, 0);
INSERT INTO `eb_express` VALUES (173, 'rongqing', '荣庆物流', 1, 0);
INSERT INTO `eb_express` VALUES (174, 'suijia', '穗佳物流', 1, 0);
INSERT INTO `eb_express` VALUES (175, 'simai', '思迈快递', 1, 0);
INSERT INTO `eb_express` VALUES (176, 'suteng', '速腾快递', 1, 0);
INSERT INTO `eb_express` VALUES (177, 'shengbang', '晟邦物流', 1, 0);
INSERT INTO `eb_express` VALUES (178, 'suchengzhaipei', '速呈宅配', 1, 0);
INSERT INTO `eb_express` VALUES (179, 'wuhuan', '五环速递', 1, 0);
INSERT INTO `eb_express` VALUES (180, 'xingchengzhaipei', '星程宅配', 1, 0);
INSERT INTO `eb_express` VALUES (181, 'yinjie', '顺捷丰达', 1, 0);
INSERT INTO `eb_express` VALUES (183, 'yanwen', '燕文物流', 1, 0);
INSERT INTO `eb_express` VALUES (184, 'zongxing', '纵行物流', 1, 0);
INSERT INTO `eb_express` VALUES (185, 'aae', 'AAE快递', 1, 0);
INSERT INTO `eb_express` VALUES (186, 'dhl', 'DHL快递', 1, 0);
INSERT INTO `eb_express` VALUES (187, 'feihu', '飞狐快递', 1, 0);
INSERT INTO `eb_express` VALUES (188, 'shunfeng', '顺丰速运', 92, 1);
INSERT INTO `eb_express` VALUES (189, 'spring', '春风物流', 1, 0);
INSERT INTO `eb_express` VALUES (190, 'yidatong', '易达通快递', 1, 0);
INSERT INTO `eb_express` VALUES (191, 'PEWKEE', '彪记快递', 1, 0);
INSERT INTO `eb_express` VALUES (192, 'PHOENIXEXP', '凤凰快递', 1, 0);
INSERT INTO `eb_express` VALUES (193, 'CNGLS', 'GLS快递', 1, 0);
INSERT INTO `eb_express` VALUES (194, 'BHTEXP', '华慧快递', 1, 0);
INSERT INTO `eb_express` VALUES (195, 'B2B', '卡行天下', 1, 0);
INSERT INTO `eb_express` VALUES (196, 'PEISI', '配思货运', 1, 0);
INSERT INTO `eb_express` VALUES (197, 'SUNDAPOST', '上大物流', 1, 0);
INSERT INTO `eb_express` VALUES (198, 'SUYUE', '苏粤货运', 1, 0);
INSERT INTO `eb_express` VALUES (199, 'F5XM', '伍圆速递', 1, 0);
INSERT INTO `eb_express` VALUES (200, 'GZWENJIE', '文捷航空速递', 1, 0);
INSERT INTO `eb_express` VALUES (201, 'yuancheng', '远成物流', 1, 0);
INSERT INTO `eb_express` VALUES (202, 'dpex', 'DPEX快递', 1, 0);
INSERT INTO `eb_express` VALUES (203, 'anjie', '安捷快递', 1, 0);
INSERT INTO `eb_express` VALUES (204, 'jldt', '嘉里大通', 1, 0);
INSERT INTO `eb_express` VALUES (205, 'yousu', '优速快递', 1, 0);
INSERT INTO `eb_express` VALUES (206, 'wanbo', '万博快递', 1, 0);
INSERT INTO `eb_express` VALUES (207, 'sure', '速尔物流', 1, 0);
INSERT INTO `eb_express` VALUES (208, 'sutong', '速通物流', 1, 0);
INSERT INTO `eb_express` VALUES (209, 'JUNCHUANWL', '骏川物流', 1, 0);
INSERT INTO `eb_express` VALUES (210, 'guada', '冠达快递', 1, 0);
INSERT INTO `eb_express` VALUES (211, 'dsu', 'D速快递', 1, 0);
INSERT INTO `eb_express` VALUES (212, 'LONGSHENWL', '龙胜物流', 1, 0);
INSERT INTO `eb_express` VALUES (213, 'abc', '爱彼西快递', 1, 0);
INSERT INTO `eb_express` VALUES (214, 'eyoubao', 'E邮宝', 1, 0);
INSERT INTO `eb_express` VALUES (215, 'aol', 'AOL快递', 1, 0);
INSERT INTO `eb_express` VALUES (216, 'jixianda', '急先达物流', 1, 0);
INSERT INTO `eb_express` VALUES (217, 'haihong', '山东海红快递', 1, 0);
INSERT INTO `eb_express` VALUES (218, 'feiyang', '飞洋快递', 1, 0);
INSERT INTO `eb_express` VALUES (219, 'rpx', 'RPX保时达', 1, 0);
INSERT INTO `eb_express` VALUES (220, 'zhaijisong', '宅急送', 1, 0);
INSERT INTO `eb_express` VALUES (221, 'tiantian', '天天快递', 99, 0);
INSERT INTO `eb_express` VALUES (222, 'yunwuliu', '云物流', 1, 0);
INSERT INTO `eb_express` VALUES (223, 'jiuye', '九曳供应链', 1, 0);
INSERT INTO `eb_express` VALUES (224, 'bsky', '百世快运', 1, 0);
INSERT INTO `eb_express` VALUES (225, 'higo', '黑狗物流', 1, 0);
INSERT INTO `eb_express` VALUES (226, 'arke', '方舟速递', 1, 0);
INSERT INTO `eb_express` VALUES (227, 'zwsy', '中外速运', 1, 0);
INSERT INTO `eb_express` VALUES (228, 'jxy', '吉祥邮', 1, 0);
INSERT INTO `eb_express` VALUES (229, 'aramex', 'Aramex', 1, 0);
INSERT INTO `eb_express` VALUES (230, 'guotong', '国通快递', 1, 0);
INSERT INTO `eb_express` VALUES (231, 'jiayi', '佳怡物流', 1, 0);
INSERT INTO `eb_express` VALUES (232, 'longbang', '龙邦快运', 1, 0);
INSERT INTO `eb_express` VALUES (233, 'minhang', '民航快递', 1, 0);
INSERT INTO `eb_express` VALUES (234, 'quanyi', '全一快递', 1, 0);
INSERT INTO `eb_express` VALUES (235, 'quanchen', '全晨快递', 1, 0);
INSERT INTO `eb_express` VALUES (236, 'usps', 'USPS快递', 1, 0);
INSERT INTO `eb_express` VALUES (237, 'xinbang', '新邦物流', 1, 0);
INSERT INTO `eb_express` VALUES (238, 'yuanzhi', '元智捷诚快递', 1, 0);
INSERT INTO `eb_express` VALUES (239, 'zhongyou', '中邮物流', 1, 0);
INSERT INTO `eb_express` VALUES (240, 'yuxin', '宇鑫物流', 1, 0);
INSERT INTO `eb_express` VALUES (241, 'cnpex', '中环快递', 1, 0);
INSERT INTO `eb_express` VALUES (242, 'shengfeng', '盛丰物流', 1, 0);
INSERT INTO `eb_express` VALUES (243, 'yuantong', '圆通速递', 97, 1);
INSERT INTO `eb_express` VALUES (244, 'jiayunmei', '加运美物流', 1, 0);
INSERT INTO `eb_express` VALUES (245, 'ywfex', '源伟丰快递', 1, 0);
INSERT INTO `eb_express` VALUES (246, 'xinfeng', '信丰物流', 1, 0);
INSERT INTO `eb_express` VALUES (247, 'wanxiang', '万象物流', 1, 0);
INSERT INTO `eb_express` VALUES (248, 'menduimen', '门对门', 1, 0);
INSERT INTO `eb_express` VALUES (249, 'mingliang', '明亮物流', 1, 0);
INSERT INTO `eb_express` VALUES (250, 'fengxingtianxia', '风行天下', 1, 0);
INSERT INTO `eb_express` VALUES (251, 'gongsuda', '共速达物流', 1, 0);
INSERT INTO `eb_express` VALUES (252, 'zhongtong', '中通快递', 100, 1);
INSERT INTO `eb_express` VALUES (253, 'quanritong', '全日通快递', 1, 0);
INSERT INTO `eb_express` VALUES (254, 'ems', 'EMS', 1, 1);
INSERT INTO `eb_express` VALUES (255, 'wanjia', '万家物流', 1, 0);
INSERT INTO `eb_express` VALUES (256, 'yuntong', '运通快递', 1, 0);
INSERT INTO `eb_express` VALUES (257, 'feikuaida', '飞快达物流', 1, 0);
INSERT INTO `eb_express` VALUES (258, 'haimeng', '海盟速递', 1, 0);
INSERT INTO `eb_express` VALUES (259, 'zhongsukuaidi', '中速快件', 1, 0);
INSERT INTO `eb_express` VALUES (260, 'yuefeng', '越丰快递', 1, 0);
INSERT INTO `eb_express` VALUES (261, 'shenghui', '盛辉物流', 1, 0);
INSERT INTO `eb_express` VALUES (262, 'datian', '大田物流', 1, 0);
INSERT INTO `eb_express` VALUES (263, 'quanjitong', '全际通快递', 1, 0);
INSERT INTO `eb_express` VALUES (264, 'longlangkuaidi', '隆浪快递', 1, 0);
INSERT INTO `eb_express` VALUES (265, 'neweggozzo', '新蛋奥硕物流', 1, 0);
INSERT INTO `eb_express` VALUES (266, 'shentong', '申通快递', 95, 1);
INSERT INTO `eb_express` VALUES (267, 'haiwaihuanqiu', '海外环球', 1, 0);
INSERT INTO `eb_express` VALUES (268, 'yad', '源安达快递', 1, 0);
INSERT INTO `eb_express` VALUES (269, 'jindawuliu', '金大物流', 1, 0);
INSERT INTO `eb_express` VALUES (270, 'sevendays', '七天连锁', 1, 0);
INSERT INTO `eb_express` VALUES (271, 'tnt', 'TNT快递', 1, 0);
INSERT INTO `eb_express` VALUES (272, 'huayu', '天地华宇物流', 1, 0);
INSERT INTO `eb_express` VALUES (273, 'lianhaotong', '联昊通快递', 1, 0);
INSERT INTO `eb_express` VALUES (274, 'nengda', '港中能达快递', 1, 0);
INSERT INTO `eb_express` VALUES (275, 'LBWL', '联邦物流', 1, 0);
INSERT INTO `eb_express` VALUES (276, 'ontrac', 'onTrac', 1, 0);
INSERT INTO `eb_express` VALUES (277, 'feihang', '原飞航快递', 1, 0);
INSERT INTO `eb_express` VALUES (278, 'bangsongwuliu', '邦送物流', 1, 0);
INSERT INTO `eb_express` VALUES (279, 'huaxialong', '华夏龙物流', 1, 0);
INSERT INTO `eb_express` VALUES (280, 'ztwy', '中天万运快递', 1, 0);
INSERT INTO `eb_express` VALUES (281, 'fkd', '飞康达物流', 1, 0);
INSERT INTO `eb_express` VALUES (282, 'anxinda', '安信达快递', 1, 0);
INSERT INTO `eb_express` VALUES (283, 'quanfeng', '全峰快递', 1, 0);
INSERT INTO `eb_express` VALUES (284, 'shengan', '圣安物流', 1, 0);
INSERT INTO `eb_express` VALUES (285, 'jiaji', '佳吉物流', 1, 0);
INSERT INTO `eb_express` VALUES (286, 'yunda', '韵达快运', 94, 0);
INSERT INTO `eb_express` VALUES (287, 'ups', 'UPS快递', 1, 0);
INSERT INTO `eb_express` VALUES (288, 'debang', '德邦物流', 1, 0);
INSERT INTO `eb_express` VALUES (289, 'yafeng', '亚风速递', 1, 0);
INSERT INTO `eb_express` VALUES (290, 'kuaijie', '快捷速递', 98, 0);
INSERT INTO `eb_express` VALUES (291, 'huitong', '百世快递', 93, 0);
INSERT INTO `eb_express` VALUES (293, 'aolau', 'AOL澳通速递', 1, 0);
INSERT INTO `eb_express` VALUES (294, 'anneng', '安能物流', 1, 0);
INSERT INTO `eb_express` VALUES (295, 'auexpress', '澳邮中国快运', 1, 0);
INSERT INTO `eb_express` VALUES (296, 'exfresh', '安鲜达', 1, 0);
INSERT INTO `eb_express` VALUES (297, 'bcwelt', 'BCWELT', 1, 0);
INSERT INTO `eb_express` VALUES (298, 'youzhengguonei', '挂号信', 1, 0);
INSERT INTO `eb_express` VALUES (299, 'xiaohongmao', '北青小红帽', 1, 0);
INSERT INTO `eb_express` VALUES (300, 'lbbk', '宝凯物流', 1, 0);
INSERT INTO `eb_express` VALUES (301, 'byht', '博源恒通', 1, 0);
INSERT INTO `eb_express` VALUES (302, 'idada', '百成大达物流', 1, 0);
INSERT INTO `eb_express` VALUES (303, 'baitengwuliu', '百腾物流', 1, 0);
INSERT INTO `eb_express` VALUES (304, 'birdex', '笨鸟海淘', 1, 0);
INSERT INTO `eb_express` VALUES (305, 'bsht', '百事亨通', 1, 0);
INSERT INTO `eb_express` VALUES (306, 'dayang', '大洋物流快递', 1, 0);
INSERT INTO `eb_express` VALUES (307, 'dechuangwuliu', '德创物流', 1, 0);
INSERT INTO `eb_express` VALUES (308, 'donghanwl', '东瀚物流', 1, 0);
INSERT INTO `eb_express` VALUES (309, 'dfpost', '达方物流', 1, 0);
INSERT INTO `eb_express` VALUES (310, 'dongjun', '东骏快捷物流', 1, 0);
INSERT INTO `eb_express` VALUES (311, 'dindon', '叮咚澳洲转运', 1, 0);
INSERT INTO `eb_express` VALUES (312, 'dazhong', '大众佐川急便', 1, 0);
INSERT INTO `eb_express` VALUES (313, 'decnlh', '德中快递', 1, 0);
INSERT INTO `eb_express` VALUES (314, 'dekuncn', '德坤供应链', 1, 0);
INSERT INTO `eb_express` VALUES (315, 'eshunda', '俄顺达', 1, 0);
INSERT INTO `eb_express` VALUES (316, 'ewe', 'EWE全球快递', 1, 0);
INSERT INTO `eb_express` VALUES (317, 'fedexuk', 'FedEx英国', 1, 0);
INSERT INTO `eb_express` VALUES (318, 'fox', 'FOX国际速递', 1, 0);
INSERT INTO `eb_express` VALUES (319, 'rufengda', '凡客如风达', 1, 0);
INSERT INTO `eb_express` VALUES (320, 'fandaguoji', '颿达国际快递', 1, 0);
INSERT INTO `eb_express` VALUES (321, 'hnfy', '飞鹰物流', 1, 0);
INSERT INTO `eb_express` VALUES (322, 'flysman', '飞力士物流', 1, 0);
INSERT INTO `eb_express` VALUES (323, 'sccod', '丰程物流', 1, 0);
INSERT INTO `eb_express` VALUES (324, 'farlogistis', '泛远国际物流', 1, 0);
INSERT INTO `eb_express` VALUES (325, 'gsm', 'GSM', 1, 0);
INSERT INTO `eb_express` VALUES (326, 'gaticn', 'GATI快递', 1, 0);
INSERT INTO `eb_express` VALUES (327, 'gts', 'GTS快递', 1, 0);
INSERT INTO `eb_express` VALUES (328, 'gangkuai', '港快速递', 1, 0);
INSERT INTO `eb_express` VALUES (329, 'gtsd', '高铁速递', 1, 0);
INSERT INTO `eb_express` VALUES (330, 'tiandihuayu', '华宇物流', 1, 0);
INSERT INTO `eb_express` VALUES (331, 'huangmajia', '黄马甲快递', 1, 0);
INSERT INTO `eb_express` VALUES (332, 'ucs', '合众速递', 1, 0);
INSERT INTO `eb_express` VALUES (333, 'huoban', '伙伴物流', 1, 0);
INSERT INTO `eb_express` VALUES (334, 'nedahm', '红马速递', 1, 0);
INSERT INTO `eb_express` VALUES (335, 'huiwen', '汇文配送', 1, 0);
INSERT INTO `eb_express` VALUES (336, 'nmhuahe', '华赫物流', 1, 0);
INSERT INTO `eb_express` VALUES (337, 'hangyu', '航宇快递', 1, 0);
INSERT INTO `eb_express` VALUES (338, 'minsheng', '闽盛物流', 1, 0);
INSERT INTO `eb_express` VALUES (339, 'riyu', '日昱物流', 1, 0);
INSERT INTO `eb_express` VALUES (340, 'sxhongmajia', '山西红马甲', 1, 0);
INSERT INTO `eb_express` VALUES (341, 'syjiahuier', '沈阳佳惠尔', 1, 0);
INSERT INTO `eb_express` VALUES (342, 'shlindao', '上海林道货运', 1, 0);
INSERT INTO `eb_express` VALUES (343, 'shunjiefengda', '顺捷丰达', 1, 0);
INSERT INTO `eb_express` VALUES (344, 'subida', '速必达物流', 1, 0);
INSERT INTO `eb_express` VALUES (345, 'bphchina', '速方国际物流', 1, 0);
INSERT INTO `eb_express` VALUES (346, 'sendtochina', '速递中国', 1, 0);
INSERT INTO `eb_express` VALUES (347, 'suning', '苏宁快递', 1, 0);
INSERT INTO `eb_express` VALUES (348, 'sihaiet', '四海快递', 1, 0);
INSERT INTO `eb_express` VALUES (349, 'tianzong', '天纵物流', 1, 0);
INSERT INTO `eb_express` VALUES (350, 'chinatzx', '同舟行物流', 1, 0);
INSERT INTO `eb_express` VALUES (351, 'nntengda', '腾达速递', 1, 0);
INSERT INTO `eb_express` VALUES (352, 'sd138', '泰国138', 1, 0);
INSERT INTO `eb_express` VALUES (353, 'tongdaxing', '通达兴物流', 1, 0);
INSERT INTO `eb_express` VALUES (354, 'tlky', '天联快运', 1, 0);
INSERT INTO `eb_express` VALUES (355, 'youshuwuliu', 'UC优速快递', 1, 0);
INSERT INTO `eb_express` VALUES (356, 'ueq', 'UEQ快递', 1, 0);
INSERT INTO `eb_express` VALUES (357, 'weitepai', '微特派快递', 1, 0);
INSERT INTO `eb_express` VALUES (358, 'wtdchina', '威时沛运', 1, 0);
INSERT INTO `eb_express` VALUES (359, 'wzhaunyun', '微转运', 1, 0);
INSERT INTO `eb_express` VALUES (360, 'gswtkd', '万通快递', 1, 0);
INSERT INTO `eb_express` VALUES (361, 'wotu', '渥途国际速运', 1, 0);
INSERT INTO `eb_express` VALUES (362, 'xiyoute', '希优特快递', 1, 0);
INSERT INTO `eb_express` VALUES (363, 'xilaikd', '喜来快递', 1, 0);
INSERT INTO `eb_express` VALUES (364, 'xsrd', '鑫世锐达', 1, 0);
INSERT INTO `eb_express` VALUES (365, 'xtb', '鑫通宝物流', 1, 0);
INSERT INTO `eb_express` VALUES (366, 'xintianjie', '信天捷快递', 1, 0);
INSERT INTO `eb_express` VALUES (367, 'xaetc', '西安胜峰', 1, 0);
INSERT INTO `eb_express` VALUES (368, 'xianfeng', '先锋快递', 1, 0);
INSERT INTO `eb_express` VALUES (369, 'sunspeedy', '新速航', 1, 0);
INSERT INTO `eb_express` VALUES (370, 'xipost', '西邮寄', 1, 0);
INSERT INTO `eb_express` VALUES (371, 'sinatone', '信联通', 1, 0);
INSERT INTO `eb_express` VALUES (372, 'sunjex', '新杰物流', 1, 0);
INSERT INTO `eb_express` VALUES (373, 'yundaexus', '韵达美国件', 1, 0);
INSERT INTO `eb_express` VALUES (374, 'yxwl', '宇鑫物流', 1, 0);
INSERT INTO `eb_express` VALUES (375, 'yitongda', '易通达', 1, 0);
INSERT INTO `eb_express` VALUES (376, 'yiqiguojiwuliu', '一柒物流', 1, 0);
INSERT INTO `eb_express` VALUES (377, 'yilingsuyun', '亿领速运', 1, 0);
INSERT INTO `eb_express` VALUES (378, 'yujiawuliu', '煜嘉物流', 1, 0);
INSERT INTO `eb_express` VALUES (379, 'gml', '英脉物流', 1, 0);
INSERT INTO `eb_express` VALUES (380, 'leopard', '云豹国际货运', 1, 0);
INSERT INTO `eb_express` VALUES (381, 'czwlyn', '云南中诚', 1, 0);
INSERT INTO `eb_express` VALUES (382, 'sdyoupei', '优配速运', 1, 0);
INSERT INTO `eb_express` VALUES (383, 'yongchang', '永昌物流', 1, 0);
INSERT INTO `eb_express` VALUES (384, 'yufeng', '御风速运', 1, 0);
INSERT INTO `eb_express` VALUES (385, 'yamaxunwuliu', '亚马逊物流', 1, 0);
INSERT INTO `eb_express` VALUES (386, 'yousutongda', '优速通达', 1, 0);
INSERT INTO `eb_express` VALUES (387, 'yishunhang', '亿顺航', 1, 0);
INSERT INTO `eb_express` VALUES (388, 'yongwangda', '永旺达快递', 1, 0);
INSERT INTO `eb_express` VALUES (389, 'ecmscn', '易满客', 1, 0);
INSERT INTO `eb_express` VALUES (390, 'yingchao', '英超物流', 1, 0);
INSERT INTO `eb_express` VALUES (391, 'edlogistics', '益递物流', 1, 0);
INSERT INTO `eb_express` VALUES (392, 'yyexpress', '远洋国际', 1, 0);
INSERT INTO `eb_express` VALUES (393, 'onehcang', '一号仓', 1, 0);
INSERT INTO `eb_express` VALUES (394, 'ycgky', '远成快运', 1, 0);
INSERT INTO `eb_express` VALUES (395, 'lineone', '一号线', 1, 0);
INSERT INTO `eb_express` VALUES (396, 'ypsd', '壹品速递', 1, 0);
INSERT INTO `eb_express` VALUES (397, 'vipexpress', '鹰运国际速递', 1, 0);
INSERT INTO `eb_express` VALUES (398, 'el56', '易联通达物流', 1, 0);
INSERT INTO `eb_express` VALUES (399, 'yyqc56', '一运全成物流', 1, 0);
INSERT INTO `eb_express` VALUES (400, 'zhongtie', '中铁快运', 1, 0);
INSERT INTO `eb_express` VALUES (401, 'ZTKY', '中铁物流', 1, 0);
INSERT INTO `eb_express` VALUES (402, 'zzjh', '郑州建华快递', 1, 0);
INSERT INTO `eb_express` VALUES (403, 'zhongruisudi', '中睿速递', 1, 0);
INSERT INTO `eb_express` VALUES (404, 'zhongwaiyun', '中外运速递', 1, 0);
INSERT INTO `eb_express` VALUES (405, 'zengyisudi', '增益速递', 1, 0);
INSERT INTO `eb_express` VALUES (406, 'sujievip', '郑州速捷', 1, 0);
INSERT INTO `eb_express` VALUES (407, 'zhichengtongda', '至诚通达快递', 1, 0);
INSERT INTO `eb_express` VALUES (408, 'zhdwl', '众辉达物流', 1, 0);
INSERT INTO `eb_express` VALUES (409, 'kuachangwuliu', '直邮易', 1, 0);
INSERT INTO `eb_express` VALUES (410, 'topspeedex', '中运全速', 1, 0);
INSERT INTO `eb_express` VALUES (411, 'otobv', '中欧快运', 1, 0);
INSERT INTO `eb_express` VALUES (412, 'zsky123', '准实快运', 1, 0);
INSERT INTO `eb_express` VALUES (413, 'donghong', '东红物流', 1, 0);
INSERT INTO `eb_express` VALUES (414, 'kuaiyouda', '快优达速递', 1, 0);
INSERT INTO `eb_express` VALUES (415, 'balunzhi', '巴伦支快递', 1, 0);
INSERT INTO `eb_express` VALUES (416, 'hutongwuliu', '户通物流', 1, 0);
INSERT INTO `eb_express` VALUES (417, 'xianchenglian', '西安城联速递', 1, 0);
INSERT INTO `eb_express` VALUES (418, 'youbijia', '邮必佳', 1, 0);
INSERT INTO `eb_express` VALUES (419, 'feiyuan', '飞远物流', 1, 0);
INSERT INTO `eb_express` VALUES (420, 'chengji', '城际速递', 1, 0);
INSERT INTO `eb_express` VALUES (421, 'huaqi', '华企快运', 1, 0);
INSERT INTO `eb_express` VALUES (422, 'yibang', '一邦快递', 1, 0);
INSERT INTO `eb_express` VALUES (423, 'citylink', 'CityLink快递', 1, 0);
INSERT INTO `eb_express` VALUES (424, 'meixi', '美西快递', 1, 0);
INSERT INTO `eb_express` VALUES (425, 'acs', 'ACS', 1, 0);

-- ----------------------------
-- Table structure for eb_routine_access_token
-- ----------------------------
DROP TABLE IF EXISTS `eb_routine_access_token`;
CREATE TABLE `eb_routine_access_token`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '小程序access_token表ID',
  `access_token` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'openid',
  `stop_time` int(11) UNSIGNED NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小程序access_token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_routine_access_token
-- ----------------------------
INSERT INTO `eb_routine_access_token` VALUES (1, '17_JKzGTT6XULJfVJMw_uRU_tOXkNJBjhiez2bcKoE3iPdnsoJPW7Y9tH5xI-F-jZhCojrMZNblQh-yjz9YvhA-9usCffoJYtoqWxmINSMkVTaIQ6f8hnxUOjt4V2nsTwzDFRA4WMdCq_uxrS7ISGBeAIADRM', 1547624543);

-- ----------------------------
-- Table structure for eb_routine_form_id
-- ----------------------------
DROP TABLE IF EXISTS `eb_routine_form_id`;
CREATE TABLE `eb_routine_form_id`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表单ID表ID',
  `uid` int(11) DEFAULT 0 COMMENT '用户uid',
  `form_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单ID',
  `stop_time` int(11) UNSIGNED DEFAULT NULL COMMENT '表单ID失效时间',
  `status` tinyint(1) UNSIGNED DEFAULT 0 COMMENT '状态1 未使用 2不能使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单id表记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_routine_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `eb_routine_qrcode`;
CREATE TABLE `eb_routine_qrcode`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信二维码ID',
  `third_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二维码类型 spread(用户推广) product_spread(产品推广)',
  `third_id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `status` tinyint(1) UNSIGNED DEFAULT 1 COMMENT '状态 0不可用 1可用',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '添加时间',
  `page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '小程序页面路径带参数',
  `qrcode_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '小程序二维码路径',
  `url_time` int(11) UNSIGNED DEFAULT NULL COMMENT '二维码添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小程序二维码管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_routine_template
-- ----------------------------
DROP TABLE IF EXISTS `eb_routine_template`;
CREATE TABLE `eb_routine_template`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `tempkey` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板编号',
  `name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复内容',
  `tempid` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模板ID',
  `add_time` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tempkey`(`tempkey`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_routine_template
-- ----------------------------
INSERT INTO `eb_routine_template` VALUES (13, 'AT0007', '订单发货提醒', '订单号{{keyword1.DATA}}\n快递公司{{keyword2.DATA}}\n快递单号{{keyword3.DATA}}\n发货时间{{keyword4.DATA}}\n备注{{keyword5.DATA}}', 'XQlyO_b3QocHBOrC69bfOCaOJq5kdKXQcdQtCO11sA0', '1534469928', 1);
INSERT INTO `eb_routine_template` VALUES (14, 'AT0787', '退款成功通知', '订单号{{keyword1.DATA}}\n退款时间{{keyword2.DATA}}\n退款金额{{keyword3.DATA}}\n退款方式{{keyword4.DATA}}\n备注{{keyword5.DATA}}', 'gQi8X-wuOYAwdVRBXaJVwfAXQ0ngjMxYcYVS0GT1anI', '1534469993', 1);
INSERT INTO `eb_routine_template` VALUES (15, 'AT0009', '订单支付成功通知', '单号{{keyword1.DATA}}\n下单时间{{keyword2.DATA}}\n订单状态{{keyword3.DATA}}\n支付金额{{keyword4.DATA}}\n支付方式{{keyword5.DATA}}', 'x5Jw630Rp63T34kv0Q43RaeVKtk5OFKDNkwcrwMp9FM', '1534470043', 1);
INSERT INTO `eb_routine_template` VALUES (16, 'AT1173', '砍价成功通知', '商品名称{{keyword1.DATA}}\n砍价金额{{keyword2.DATA}}\n底价{{keyword3.DATA}}\n砍掉价格{{keyword4.DATA}}\n支付金额{{keyword5.DATA}}\n备注{{keyword6.DATA}}', 'FofE1ABYV1iXkNFIvEOUy4j5lInos20KCwIW6gyZ2nM', '1534470085', 1);
INSERT INTO `eb_routine_template` VALUES (17, 'AT0036', '退款通知', '订单编号{{keyword1.DATA}}\n退款原因{{keyword2.DATA}}\n退款时间{{keyword3.DATA}}\n退款金额{{keyword4.DATA}}\n退款方式{{keyword5.DATA}}', 'JhmCRYO7ahP6nbCb6oO-BPYz8lIP2u9xs-CkZ63Z4HI', '1534470134', 1);
INSERT INTO `eb_routine_template` VALUES (18, '19', 'AT0177', 'AT0177AT0177AT0177AT0177AT0177AT0177AT0177', 'AT0177', '1537015237', 1);

-- ----------------------------
-- Table structure for eb_store_bargain
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_bargain`;
CREATE TABLE `eb_store_bargain`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '砍价产品ID',
  `product_id` int(11) UNSIGNED NOT NULL COMMENT '关联产品ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '砍价活动名称',
  `image` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '砍价活动图片',
  `unit_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '单位名称',
  `stock` int(11) UNSIGNED DEFAULT NULL COMMENT '库存',
  `sales` int(11) UNSIGNED DEFAULT NULL COMMENT '销量',
  `images` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '砍价产品轮播图',
  `start_time` int(11) UNSIGNED NOT NULL COMMENT '砍价开启时间',
  `stop_time` int(11) UNSIGNED NOT NULL COMMENT '砍价结束时间',
  `store_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '砍价产品名称',
  `price` decimal(8, 2) UNSIGNED DEFAULT NULL COMMENT '砍价金额',
  `min_price` decimal(8, 2) UNSIGNED DEFAULT NULL COMMENT '砍价商品最低价',
  `num` int(11) UNSIGNED DEFAULT NULL COMMENT '每次购买的砍价产品数量',
  `bargain_max_price` decimal(8, 2) UNSIGNED DEFAULT NULL COMMENT '用户每次砍价的最大金额',
  `bargain_min_price` decimal(8, 2) UNSIGNED DEFAULT NULL COMMENT '用户每次砍价的最小金额',
  `bargain_num` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户每次砍价的次数',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '砍价状态 0(到砍价时间不自动开启)  1(到砍价时间自动开启时间)',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '砍价详情',
  `give_integral` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '反多少积分',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '砍价活动简介',
  `cost` decimal(8, 2) UNSIGNED DEFAULT NULL COMMENT '成本价',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_hot` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐0不推荐1推荐',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除 0未删除 1删除',
  `add_time` int(11) UNSIGNED DEFAULT NULL COMMENT '添加时间',
  `is_postage` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否包邮 0不包邮 1包邮',
  `postage` decimal(10, 2) UNSIGNED DEFAULT NULL COMMENT '邮费',
  `rule` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '砍价规则',
  `look` int(11) UNSIGNED DEFAULT 0 COMMENT '砍价产品浏览量',
  `share` int(11) UNSIGNED DEFAULT 0 COMMENT '砍价产品分享量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '砍价表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_bargain
-- ----------------------------
INSERT INTO `eb_store_bargain` VALUES (1, 1, '拼团购 无线吸尘器F8 玫瑰金礼盒版', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '件', 988, 12, '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', 1546272000, 1551283200, '无线吸尘器F8 玫瑰金礼盒版', 999.00, 10.00, 1, 50.00, 1.00, 1, 1, '', 1699.00, '无线吸尘器F8', 100.00, 1, 1, 0, 0, 1, 1.00, '', 8, 0);
INSERT INTO `eb_store_bargain` VALUES (2, 3, '加湿器 智能 白色', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '件', 999, 1, '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', 1546272000, 1551283200, '智米加湿器 白色 4L', 249.00, 1.00, 1, 10.00, 0.01, 1, 1, '', 249.00, '加湿器 智能 白色', 10.00, 0, 1, 0, 0, 1, 0.00, '', 0, 0);

-- ----------------------------
-- Table structure for eb_store_bargain_user
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_bargain_user`;
CREATE TABLE `eb_store_bargain_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户参与砍价表ID',
  `uid` int(11) UNSIGNED DEFAULT NULL COMMENT '用户ID',
  `bargain_id` int(11) UNSIGNED DEFAULT NULL COMMENT '砍价产品id',
  `bargain_price_min` decimal(8, 2) UNSIGNED DEFAULT NULL COMMENT '砍价的最低价',
  `bargain_price` decimal(8, 2) DEFAULT NULL COMMENT '砍价金额',
  `price` decimal(8, 2) UNSIGNED DEFAULT NULL COMMENT '砍掉的价格',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1参与中 2 活动结束参与失败 3活动结束参与成功',
  `add_time` int(11) UNSIGNED DEFAULT NULL COMMENT '参与时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户参与砍价表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for eb_store_bargain_user_help
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_bargain_user_help`;
CREATE TABLE `eb_store_bargain_user_help`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '砍价用户帮助表ID',
  `uid` int(11) UNSIGNED DEFAULT NULL COMMENT '帮助的用户id',
  `bargain_id` int(11) UNSIGNED DEFAULT NULL COMMENT '砍价产品ID',
  `bargain_user_id` int(11) UNSIGNED DEFAULT NULL COMMENT '用户参与砍价表id',
  `price` decimal(8, 2) UNSIGNED DEFAULT NULL COMMENT '帮助砍价多少金额',
  `add_time` int(11) UNSIGNED DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '砍价用户帮助表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for eb_store_cart
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_cart`;
CREATE TABLE `eb_store_cart`  (
  `id` bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '购物车表ID',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `product_attr_unique` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品属性',
  `cart_num` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品数量',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '添加时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = 未购买 1 = 已购买',
  `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `is_new` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为立即购买',
  `combination_id` int(11) UNSIGNED DEFAULT 0 COMMENT '拼团id',
  `seckill_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '秒杀产品ID',
  `bargain_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '砍价id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`uid`) USING BTREE,
  INDEX `goods_id`(`product_id`) USING BTREE,
  INDEX `uid`(`uid`, `is_pay`) USING BTREE,
  INDEX `uid_2`(`uid`, `is_del`) USING BTREE,
  INDEX `uid_3`(`uid`, `is_new`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_category
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_category`;
CREATE TABLE `eb_store_category`  (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类表ID',
  `pid` mediumint(11) NOT NULL COMMENT '父id',
  `cate_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `sort` mediumint(11) NOT NULL COMMENT '排序',
  `pic` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否推荐',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `is_base`(`is_show`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_category
-- ----------------------------
INSERT INTO `eb_store_category` VALUES (1, 0, '热门推荐', 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3db8b933d92.jpg', 1, 1547205038);
INSERT INTO `eb_store_category` VALUES (2, 1, '清洁工具', 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3db9de2b73a.jpg', 1, 1547205055);
INSERT INTO `eb_store_category` VALUES (3, 1, '生活电器', 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', 1, 1547550363);

-- ----------------------------
-- Table structure for eb_store_combination
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_combination`;
CREATE TABLE `eb_store_combination`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品id',
  `mer_id` int(10) UNSIGNED DEFAULT 0 COMMENT '商户id',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推荐图',
  `images` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动标题',
  `attr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '活动属性',
  `people` int(2) UNSIGNED NOT NULL COMMENT '参团人数',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '价格',
  `sort` int(10) UNSIGNED NOT NULL COMMENT '排序',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `stock` int(10) UNSIGNED NOT NULL COMMENT '库存',
  `add_time` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `is_host` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推荐',
  `is_show` tinyint(1) UNSIGNED NOT NULL COMMENT '产品状态',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `combination` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `mer_use` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '商户是否可用1可用0不可用',
  `is_postage` tinyint(1) UNSIGNED NOT NULL COMMENT '是否包邮1是0否',
  `postage` decimal(10, 2) UNSIGNED NOT NULL COMMENT '邮费',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '拼团内容',
  `start_time` int(11) UNSIGNED NOT NULL COMMENT '拼团开始时间',
  `stop_time` int(11) UNSIGNED NOT NULL COMMENT '拼团结束时间',
  `cost` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拼图产品成本',
  `browse` int(11) DEFAULT 0 COMMENT '浏览量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '拼团产品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_combination
-- ----------------------------
INSERT INTO `eb_store_combination` VALUES (1, 1, 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', '3人团 无线吸尘器F8 玫瑰金礼盒版', '', 3, '年货节活动价1699元，领取吸尘器优惠券再减50元，到手价仅1649元', 1.00, 0, 12, 988, '1547554180', 1, 1, 0, 1, 0, 1, 1.00, '', 1546272000, 1551283200, 0, 0);
INSERT INTO `eb_store_combination` VALUES (2, 3, 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', '智米加湿器 白色', '', 6, '智米加湿器 白色', 199.00, 0, 0, 999, '1547554327', 1, 1, 0, 1, 0, 1, 0.00, '', 1546272000, 1551283200, 0, 0);
INSERT INTO `eb_store_combination` VALUES (3, 2, 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', '智能马桶盖 AI版', '', 10, '智能马桶盖 AI版', 499.00, 0, 6, 994, '1547554596', 1, 1, 0, 1, 0, 1, 0.00, '', 1546272000, 1551283200, 0, 0);

-- ----------------------------
-- Table structure for eb_store_combination_attr
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_combination_attr`;
CREATE TABLE `eb_store_combination_attr`  (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `attr_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名',
  `attr_values` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  INDEX `store_id`(`product_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_combination_attr_result
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_combination_attr_result`;
CREATE TABLE `eb_store_combination_attr_result`  (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性参数',
  `change_time` int(10) UNSIGNED NOT NULL COMMENT '上次修改时间',
  UNIQUE INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_combination_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_combination_attr_value`;
CREATE TABLE `eb_store_combination_attr_value`  (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `suk` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) UNSIGNED NOT NULL COMMENT '属性对应的库存',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `price` decimal(8, 2) UNSIGNED NOT NULL COMMENT '属性金额',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片',
  `unique` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8, 2) UNSIGNED NOT NULL COMMENT '成本价',
  UNIQUE INDEX `unique`(`unique`, `suk`) USING BTREE,
  INDEX `store_id`(`product_id`, `suk`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_coupon
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_coupon`;
CREATE TABLE `eb_store_coupon`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '优惠券表ID',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券名称',
  `integral` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '兑换消耗积分值',
  `coupon_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '兑换的优惠券面值',
  `use_min_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低消费多少金额可用优惠券',
  `coupon_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '优惠券有效期限（单位：天）',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态（0：关闭，1：开启）',
  `add_time` int(11) UNSIGNED NOT NULL COMMENT '兑换项目添加时间',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `state`(`status`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `coupon_time`(`coupon_time`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_coupon_issue
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_coupon_issue`;
CREATE TABLE `eb_store_coupon_issue`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) DEFAULT NULL COMMENT '优惠券ID',
  `start_time` int(10) DEFAULT NULL COMMENT '优惠券领取开启时间',
  `end_time` int(10) DEFAULT NULL COMMENT '优惠券领取结束时间',
  `total_count` int(10) DEFAULT NULL COMMENT '优惠券领取数量',
  `remain_count` int(10) DEFAULT NULL COMMENT '优惠券剩余领取数量',
  `is_permanent` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否无限张数',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 正常 0 未开启 -1 已无效',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `add_time` int(10) DEFAULT NULL COMMENT '优惠券添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `start_time`(`start_time`, `end_time`) USING BTREE,
  INDEX `remain_count`(`remain_count`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券前台领取表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for eb_store_coupon_issue_user
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_coupon_issue_user`;
CREATE TABLE `eb_store_coupon_issue_user`  (
  `uid` int(10) DEFAULT NULL COMMENT '领取优惠券用户ID',
  `issue_coupon_id` int(10) DEFAULT NULL COMMENT '优惠券前台领取ID',
  `add_time` int(10) DEFAULT NULL COMMENT '领取时间',
  UNIQUE INDEX `uid`(`uid`, `issue_coupon_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券前台用户领取记录表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for eb_store_coupon_user
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_coupon_user`;
CREATE TABLE `eb_store_coupon_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券发放记录id',
  `cid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '兑换的项目id',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '优惠券所属用户',
  `coupon_title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券名称',
  `coupon_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '优惠券的面值',
  `use_min_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低消费多少金额可用优惠券',
  `add_time` int(11) UNSIGNED NOT NULL COMMENT '优惠券创建时间',
  `end_time` int(11) UNSIGNED NOT NULL COMMENT '优惠券结束时间',
  `use_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用时间',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'send' COMMENT '获取方式',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态（0：未使用，1：已使用, 2:已过期）',
  `is_fail` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `end_time`(`end_time`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_fail`(`is_fail`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券发放记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_order
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_order`;
CREATE TABLE `eb_store_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `uid` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `real_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `user_phone` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户电话',
  `user_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `cart_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '[]' COMMENT '购物车id',
  `total_num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单商品总数',
  `total_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '订单总价',
  `total_postage` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '邮费',
  `pay_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '实际支付金额',
  `pay_postage` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '支付邮费',
  `deduction_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '抵扣金额',
  `coupon_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '优惠券id',
  `coupon_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '优惠券金额',
  `paid` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付状态',
  `pay_time` int(11) UNSIGNED DEFAULT NULL COMMENT '支付时间',
  `pay_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式',
  `add_time` int(11) UNSIGNED NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '订单状态（-1 : 申请退款 -2 : 退货成功 0：待发货；1：待收货；2：已收货；3：待评价；-1：已退款）',
  `refund_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 未退款 1 申请中 2 已退款',
  `refund_reason_wap_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '退款图片',
  `refund_reason_wap_explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '退款用户说明',
  `refund_reason_time` int(11) UNSIGNED DEFAULT NULL COMMENT '退款时间',
  `refund_reason_wap` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '前台退款原因',
  `refund_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '不退款的理由',
  `refund_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '退款金额',
  `delivery_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '快递名称/送货人姓名',
  `delivery_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发货类型',
  `delivery_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '快递单号/手机号',
  `gain_integral` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '消费赚取积分',
  `use_integral` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '使用积分',
  `back_integral` decimal(8, 2) UNSIGNED DEFAULT NULL COMMENT '给用户退了多少积分',
  `mark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  `unique` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一id(md5加密)类似id',
  `remark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '管理员备注',
  `mer_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户ID',
  `is_mer_check` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `combination_id` int(11) UNSIGNED DEFAULT 0 COMMENT '拼团产品id0一般产品',
  `pink_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拼团id 0没有拼团',
  `cost` decimal(8, 2) UNSIGNED NOT NULL COMMENT '成本价',
  `seckill_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '秒杀产品ID',
  `bargain_id` int(11) UNSIGNED DEFAULT 0 COMMENT '砍价id',
  `is_channel` tinyint(1) UNSIGNED DEFAULT 0 COMMENT '支付渠道(0微信公众号1微信小程序)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id_2`(`order_id`, `uid`) USING BTREE,
  UNIQUE INDEX `unique`(`unique`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `pay_price`(`pay_price`) USING BTREE,
  INDEX `paid`(`paid`) USING BTREE,
  INDEX `pay_time`(`pay_time`) USING BTREE,
  INDEX `pay_type`(`pay_type`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE,
  INDEX `coupon_id`(`coupon_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_order_cart_info
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_order_cart_info`;
CREATE TABLE `eb_store_order_cart_info`  (
  `oid` int(11) UNSIGNED NOT NULL COMMENT '订单id',
  `cart_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购物车id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `cart_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买东西的详细信息',
  `unique` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一id',
  UNIQUE INDEX `oid`(`oid`, `unique`) USING BTREE,
  INDEX `cart_id`(`cart_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单购物详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_order_status
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_order_status`;
CREATE TABLE `eb_store_order_status`  (
  `oid` int(10) UNSIGNED NOT NULL COMMENT '订单id',
  `change_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型',
  `change_message` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作备注',
  `change_time` int(10) UNSIGNED NOT NULL COMMENT '操作时间',
  INDEX `oid`(`oid`) USING BTREE,
  INDEX `change_type`(`change_type`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单操作记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_pink
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_pink`;
CREATE TABLE `eb_store_pink`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单id 生成',
  `order_id_key` int(10) UNSIGNED NOT NULL COMMENT '订单id  数据库',
  `total_num` int(10) UNSIGNED NOT NULL COMMENT '购买商品个数',
  `total_price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '购买总金额',
  `cid` int(10) UNSIGNED NOT NULL COMMENT '拼团产品id',
  `pid` int(10) UNSIGNED NOT NULL COMMENT '产品id',
  `people` int(10) UNSIGNED NOT NULL COMMENT '拼图总人数',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '拼团产品单价',
  `add_time` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开始时间',
  `stop_time` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `k_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '团长id 0为团长',
  `is_tpl` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否发送模板消息0未发送1已发送',
  `is_refund` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否退款 0未退款 1已退款',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态1进行中2已完成3未完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '拼团表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_product
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product`;
CREATE TABLE `eb_store_product`  (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `mer_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户Id(0为总后台管理员创建,不为0的时候是商户后台创建)',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `slider_image` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
  `store_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `store_info` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品简介',
  `keyword` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `cate_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类id',
  `price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `vip_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '会员价格',
  `ot_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '市场价',
  `postage` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '邮费',
  `unit_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名',
  `sort` smallint(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `sales` mediumint(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `stock` mediumint(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '库存',
  `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态（0：未上架，1：上架）',
  `is_hot` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否热卖',
  `is_benefit` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否优惠',
  `is_best` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否精品',
  `is_new` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否新品',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品描述',
  `add_time` int(11) UNSIGNED NOT NULL COMMENT '添加时间',
  `is_postage` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否包邮',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  `mer_use` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户是否代理 0不可代理1可代理',
  `give_integral` decimal(8, 2) UNSIGNED NOT NULL COMMENT '获得积分',
  `cost` decimal(8, 2) UNSIGNED NOT NULL COMMENT '成本价',
  `is_seckill` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '秒杀状态 0 未开启 1已开启',
  `is_bargain` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '砍价状态 0未开启 1开启',
  `ficti` mediumint(11) DEFAULT 100 COMMENT '虚拟销量',
  `browse` int(11) DEFAULT 0 COMMENT '浏览量',
  `code_path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品二维码地址(用户小程序海报)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cate_id`(`cate_id`) USING BTREE,
  INDEX `is_hot`(`is_hot`) USING BTREE,
  INDEX `is_benefit`(`is_benefit`) USING BTREE,
  INDEX `is_best`(`is_best`) USING BTREE,
  INDEX `is_new`(`is_new`) USING BTREE,
  INDEX `toggle_on_sale, is_del`(`is_del`) USING BTREE,
  INDEX `price`(`price`) USING BTREE,
  INDEX `is_show`(`is_show`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `sales`(`sales`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `is_postage`(`is_postage`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_product
-- ----------------------------
INSERT INTO `eb_store_product` VALUES (1, 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', '无线吸尘器F8 玫瑰金礼盒版', '【年货节活动价1699元，领取吸尘器优惠券再减50元，到手价仅1649元】', '无线吸尘器', '2', 0.01, 0.00, 1699.00, 1.00, '件', 1, 17, 988, 1, 1, 0, 1, 1, '<p><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbb137d656.jpeg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbb229e820.jpeg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbb3b37f84.jpeg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbb513b06f.jpeg\"/></p>', 1547205504, 1, 0, 0, 1699.00, 100.00, 0, 0, 81, 0, '');
INSERT INTO `eb_store_product` VALUES (2, 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', '智能马桶盖 AI版', '智能马桶盖 AI版', '智能马桶', '3', 0.01, 0.00, 1999.00, 0.00, '件', 0, 7, 994, 1, 1, 1, 1, 1, '<p><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbce620415.jpeg\"/></p>', 1547516202, 1, 0, 0, 1999.00, 1500.00, 0, 0, 12, 0, '');
INSERT INTO `eb_store_product` VALUES (3, 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', '智米加湿器 白色', '智米加湿器 白色', '加湿器', '3', 249.00, 0.00, 299.00, 0.00, '件', 0, 0, 999, 1, 1, 1, 1, 1, '<p><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc1730a0c0.jpg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc182bccac.jpg\"/></p>', 1547551009, 1, 0, 0, 249.00, 10.00, 0, 0, 8, 0, '');
INSERT INTO `eb_store_product` VALUES (4, 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc23646fff.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc23646fff.jpg\"]', '互联网电热水器1A', '3000w双管速热，动态360L热水用量，双重漏电保护，智能APP操控', '电热水器', '3', 999.00, 0.00, 1599.00, 0.00, '件', 0, 1, 1099, 1, 1, 1, 1, 1, '<p><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc286862fd.jpg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc294a9a0a.jpg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc2ba18a77.jpg\"/></p>', 1547551346, 1, 0, 0, 999.00, 888.00, 0, 0, 10, 0, '');

-- ----------------------------
-- Table structure for eb_store_product_attr
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_attr`;
CREATE TABLE `eb_store_product_attr`  (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `attr_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名',
  `attr_values` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  INDEX `store_id`(`product_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_product_attr
-- ----------------------------
INSERT INTO `eb_store_product_attr` VALUES (1, '颜色', '黑色,白色,蓝色');
INSERT INTO `eb_store_product_attr` VALUES (2, '孔距', '30cm,40cm');
INSERT INTO `eb_store_product_attr` VALUES (3, '容量', '3L,4L');
INSERT INTO `eb_store_product_attr` VALUES (3, '颜色', '白色,黑色');

-- ----------------------------
-- Table structure for eb_store_product_attr_result
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_attr_result`;
CREATE TABLE `eb_store_product_attr_result`  (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性参数',
  `change_time` int(10) UNSIGNED NOT NULL COMMENT '上次修改时间',
  UNIQUE INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_product_attr_result
-- ----------------------------
INSERT INTO `eb_store_product_attr_result` VALUES (1, '{\"attr\":[{\"value\":\"\\u989c\\u8272\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"\\u9ed1\\u8272\",\"\\u767d\\u8272\",\"\\u84dd\\u8272\"]}],\"value\":[{\"detail\":{\"\\u989c\\u8272\":\"\\u9ed1\\u8272\"},\"cost\":\"100.00\",\"price\":\"0.01\",\"sales\":988,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u767d\\u8272\"},\"cost\":\"100.00\",\"price\":0.02,\"sales\":988,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u84dd\\u8272\"},\"cost\":\"100.00\",\"price\":0.03,\"sales\":988,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"check\":false}]}', 1547553666);
INSERT INTO `eb_store_product_attr_result` VALUES (2, '{\"attr\":[{\"value\":\"\\u5b54\\u8ddd\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"30cm\",\"40cm\"]}],\"value\":[{\"detail\":{\"\\u5b54\\u8ddd\":\"30cm\"},\"cost\":\"1500.00\",\"price\":\"0.01\",\"sales\":994,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"check\":false},{\"detail\":{\"\\u5b54\\u8ddd\":\"40cm\"},\"cost\":\"1500.00\",\"price\":888,\"sales\":994,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\",\"check\":false}]}', 1547553770);
INSERT INTO `eb_store_product_attr_result` VALUES (3, '{\"attr\":[{\"value\":\"\\u5bb9\\u91cf\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"3L\",\"4L\"]},{\"value\":\"\\u989c\\u8272\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"\\u767d\\u8272\",\"\\u9ed1\\u8272\"]}],\"value\":[{\"detail\":{\"\\u5bb9\\u91cf\":\"3L\",\"\\u989c\\u8272\":\"\\u767d\\u8272\"},\"cost\":\"10.00\",\"price\":248,\"sales\":999,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"check\":false},{\"detail\":{\"\\u5bb9\\u91cf\":\"3L\",\"\\u989c\\u8272\":\"\\u9ed1\\u8272\"},\"cost\":\"10.00\",\"price\":249,\"sales\":999,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\",\"check\":false},{\"detail\":{\"\\u5bb9\\u91cf\":\"4L\",\"\\u989c\\u8272\":\"\\u767d\\u8272\"},\"cost\":\"10.00\",\"price\":289,\"sales\":999,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"check\":false},{\"detail\":{\"\\u5bb9\\u91cf\":\"4L\",\"\\u989c\\u8272\":\"\\u9ed1\\u8272\"},\"cost\":\"10.00\",\"price\":299,\"sales\":999,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\",\"check\":false}]}', 1547553857);

-- ----------------------------
-- Table structure for eb_store_product_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_attr_value`;
CREATE TABLE `eb_store_product_attr_value`  (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `suk` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) UNSIGNED NOT NULL COMMENT '属性对应的库存',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `price` decimal(8, 2) UNSIGNED NOT NULL COMMENT '属性金额',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片',
  `unique` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8, 2) UNSIGNED NOT NULL COMMENT '成本价',
  UNIQUE INDEX `unique`(`unique`, `suk`) USING BTREE,
  INDEX `store_id`(`product_id`, `suk`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_product_attr_value
-- ----------------------------
INSERT INTO `eb_store_product_attr_value` VALUES (1, '黑色', 986, 2, 0.01, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '0e90eee8', 100.00);
INSERT INTO `eb_store_product_attr_value` VALUES (1, '白色', 986, 2, 0.02, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3db9de2b73a.jpg', 'c8cb03a2', 100.00);
INSERT INTO `eb_store_product_attr_value` VALUES (1, '蓝色', 987, 1, 0.03, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba4187461.jpg', 'f46393a9', 100.00);
INSERT INTO `eb_store_product_attr_value` VALUES (2, '40cm', 994, 0, 888.00, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc6a38fab.jpg', '19f1d772', 1500.00);
INSERT INTO `eb_store_product_attr_value` VALUES (2, '30cm', 993, 1, 0.01, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', 'bae75a3a', 1500.00);
INSERT INTO `eb_store_product_attr_value` VALUES (3, '3L,白色', 999, 0, 248.00, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', 'ab6067b3', 10.00);
INSERT INTO `eb_store_product_attr_value` VALUES (3, '3L,黑色', 999, 0, 249.00, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc15ba1972.jpg', 'afb4949f', 10.00);
INSERT INTO `eb_store_product_attr_value` VALUES (3, '4L,白色', 999, 0, 289.00, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '824485b3', 10.00);
INSERT INTO `eb_store_product_attr_value` VALUES (3, '4L,黑色', 999, 0, 299.00, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc15ba1972.jpg', 'c4b7ce93', 10.00);

-- ----------------------------
-- Table structure for eb_store_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_relation`;
CREATE TABLE `eb_store_product_relation`  (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型(收藏(collect）、点赞(like))',
  `category` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '某种类型的商品(普通商品、秒杀商品)',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '添加时间',
  UNIQUE INDEX `uid`(`uid`, `product_id`, `type`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `category`(`category`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品点赞和收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_product_reply
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_reply`;
CREATE TABLE `eb_store_product_reply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `oid` int(11) NOT NULL COMMENT '订单ID',
  `unique` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一id',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `reply_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'product' COMMENT '某种商品类型(普通商品、秒杀商品）',
  `product_score` tinyint(1) NOT NULL COMMENT '商品分数',
  `service_score` tinyint(1) NOT NULL COMMENT '服务分数',
  `comment` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `pics` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论图片',
  `add_time` int(11) NOT NULL COMMENT '评论时间',
  `merchant_reply_content` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '管理员回复内容',
  `merchant_reply_time` int(11) DEFAULT NULL COMMENT '管理员回复时间',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0未删除1已删除',
  `is_reply` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未回复1已回复',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id_2`(`oid`, `unique`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `parent_id`(`reply_type`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE,
  INDEX `product_score`(`product_score`) USING BTREE,
  INDEX `service_score`(`service_score`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_seckill
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_seckill`;
CREATE TABLE `eb_store_seckill`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品秒杀产品表id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品id',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推荐图',
  `images` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动标题',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '价格',
  `cost` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '成本',
  `ot_price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '原价',
  `give_integral` decimal(10, 2) UNSIGNED NOT NULL COMMENT '返多少积分',
  `sort` int(10) UNSIGNED NOT NULL COMMENT '排序',
  `stock` int(10) UNSIGNED NOT NULL COMMENT '库存',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `unit_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名',
  `postage` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '邮费',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `start_time` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开始时间',
  `stop_time` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结束时间',
  `add_time` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '产品状态',
  `is_postage` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否包邮',
  `is_hot` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '热门推荐',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除 0未删除1已删除',
  `num` int(11) UNSIGNED NOT NULL COMMENT '最多秒杀几个',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '显示',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `start_time`(`start_time`, `stop_time`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE,
  INDEX `is_hot`(`is_hot`) USING BTREE,
  INDEX `is_show`(`status`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `is_postage`(`is_postage`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品秒杀产品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_seckill
-- ----------------------------
INSERT INTO `eb_store_seckill` VALUES (1, 1, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', '手慢无 无线吸尘器F8 玫瑰金礼盒版', '【年货节活动价1699元，领取吸尘器优惠券再减50元，到手价仅1649元】', 1.00, 100.00, 599.00, 1699.00, 1, 987, 13, '件', 0.00, '', '1546272000', '1551283200', '1547554098', 1, 1, 1, 0, 1, 1);
INSERT INTO `eb_store_seckill` VALUES (2, 3, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', '智米加湿器 白色', '智米加湿器 白色', 99.00, 10.00, 249.00, 249.00, 0, 999, 1, '件', 0.00, '', '1546272000', '1551283200', '1547554239', 1, 1, 1, 0, 1, 1);
INSERT INTO `eb_store_seckill` VALUES (3, 2, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', '智能马桶盖 AI版 限时秒杀中', '智能马桶盖 AI版', 599.00, 1500.00, 1599.00, 1999.00, 0, 994, 6, '件', 0.00, '', '1546272000', '1551283200', '1547554561', 1, 1, 1, 0, 1, 1);

-- ----------------------------
-- Table structure for eb_store_seckill_attr
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_seckill_attr`;
CREATE TABLE `eb_store_seckill_attr`  (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `attr_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名',
  `attr_values` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  INDEX `store_id`(`product_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '秒杀商品属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_seckill_attr_result
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_seckill_attr_result`;
CREATE TABLE `eb_store_seckill_attr_result`  (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性参数',
  `change_time` int(10) UNSIGNED NOT NULL COMMENT '上次修改时间',
  UNIQUE INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '秒杀商品属性详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_seckill_attr_result
-- ----------------------------
INSERT INTO `eb_store_seckill_attr_result` VALUES (16, '{\"attr\":[{\"value\":\"\\u989c\\u8272\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"\\u9ed1\\u8272\",\"\\u767d\\u8272\"]},{\"value\":\"\\u5305\\u88c5\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"\\u5927\",\"\\u5c0f\",\"\\u4e2d\"]}],\"value\":[{\"detail\":{\"\\u989c\\u8272\":\"\\u9ed1\\u8272\",\"\\u5305\\u88c5\":\"\\u5927\"},\"price\":\"0.00\",\"sales\":888,\"pic\":\"\\/public\\/uploads\\/store\\/product\\/s_5abc58e8ad6db.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u9ed1\\u8272\",\"\\u5305\\u88c5\":\"\\u5c0f\"},\"price\":\"0.00\",\"sales\":888,\"pic\":\"\\/public\\/uploads\\/store\\/product\\/s_5abc58e8ad6db.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u9ed1\\u8272\",\"\\u5305\\u88c5\":\"\\u4e2d\"},\"price\":\"0.00\",\"sales\":888,\"pic\":\"\\/public\\/uploads\\/store\\/product\\/s_5abc58e8ad6db.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u767d\\u8272\",\"\\u5305\\u88c5\":\"\\u5927\"},\"price\":\"0.00\",\"sales\":888,\"pic\":\"\\/public\\/uploads\\/store\\/product\\/s_5abc58e8ad6db.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u767d\\u8272\",\"\\u5305\\u88c5\":\"\\u5c0f\"},\"price\":\"0.00\",\"sales\":888,\"pic\":\"\\/public\\/uploads\\/store\\/product\\/s_5abc58e8ad6db.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u767d\\u8272\",\"\\u5305\\u88c5\":\"\\u4e2d\"},\"price\":\"0.00\",\"sales\":888,\"pic\":\"\\/public\\/uploads\\/store\\/product\\/s_5abc58e8ad6db.jpg\",\"check\":false}]}', 1528271776);
INSERT INTO `eb_store_seckill_attr_result` VALUES (21, '{\"attr\":[{\"value\":\"\\u989c\\u8272\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"\\u767d\\u8272\",\"\\u9ed1\\u8272\"]}],\"value\":[{\"detail\":{\"\\u989c\\u8272\":\"\\u767d\\u8272\"},\"price\":\"10.00\",\"sales\":9,\"pic\":\"http:\\/\\/shop.crmeb.net\\/public\\/uploads\\/editor\\/20180601\\/5b10b2f5cd89b.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u9ed1\\u8272\"},\"price\":\"10.00\",\"sales\":9,\"pic\":\"http:\\/\\/shop.crmeb.net\\/public\\/uploads\\/editor\\/20180601\\/5b10b2f5cd89b.jpg\",\"check\":false}]}', 1530779190);
INSERT INTO `eb_store_seckill_attr_result` VALUES (24, '{\"attr\":[{\"value\":\"\\u989c\\u8272\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"\\u767d\\u8272\",\"\\u9ed1\\u8272\"]}],\"value\":[{\"detail\":{\"\\u989c\\u8272\":\"\\u767d\\u8272\"},\"price\":\"1.00\",\"sales\":99,\"pic\":\"\\/public\\/uploads\\/store\\/product\\/s_5ae6715187623.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u9ed1\\u8272\"},\"price\":\"1.00\",\"sales\":99,\"pic\":\"\\/public\\/uploads\\/store\\/product\\/s_5ae6715187623.jpg\",\"check\":false}]}', 1530890416);

-- ----------------------------
-- Table structure for eb_store_seckill_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_seckill_attr_value`;
CREATE TABLE `eb_store_seckill_attr_value`  (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `suk` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) UNSIGNED NOT NULL COMMENT '属性对应的库存',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `price` decimal(8, 2) UNSIGNED NOT NULL COMMENT '属性金额',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片',
  `unique` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8, 2) UNSIGNED NOT NULL COMMENT '成本价',
  UNIQUE INDEX `unique`(`unique`, `suk`) USING BTREE,
  INDEX `store_id`(`product_id`, `suk`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '秒杀商品属性值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_seckill_attr_value
-- ----------------------------
INSERT INTO `eb_store_seckill_attr_value` VALUES (16, '大,黑色', 888, 0, 0.00, '/public/uploads/store/product/s_5abc58e8ad6db.jpg', '57852e0e', 0.00);
INSERT INTO `eb_store_seckill_attr_value` VALUES (16, '小,黑色', 888, 0, 0.00, '/public/uploads/store/product/s_5abc58e8ad6db.jpg', '747eaf51', 0.00);
INSERT INTO `eb_store_seckill_attr_value` VALUES (16, '中,黑色', 888, 0, 0.00, '/public/uploads/store/product/s_5abc58e8ad6db.jpg', '12b77e62', 0.00);
INSERT INTO `eb_store_seckill_attr_value` VALUES (16, '大,白色', 888, 0, 0.00, '/public/uploads/store/product/s_5abc58e8ad6db.jpg', '187ad0ea', 0.00);
INSERT INTO `eb_store_seckill_attr_value` VALUES (16, '小,白色', 888, 0, 0.00, '/public/uploads/store/product/s_5abc58e8ad6db.jpg', '0ea13c0e', 0.00);
INSERT INTO `eb_store_seckill_attr_value` VALUES (16, '中,白色', 888, 0, 0.00, '/public/uploads/store/product/s_5abc58e8ad6db.jpg', 'a3421a2c', 0.00);
INSERT INTO `eb_store_seckill_attr_value` VALUES (21, '白色', 9, 0, 10.00, 'http://shop.crmeb.net/public/uploads/editor/20180601/5b10b2f5cd89b.jpg', 'e893b71b', 0.00);
INSERT INTO `eb_store_seckill_attr_value` VALUES (21, '黑色', 9, 0, 10.00, 'http://shop.crmeb.net/public/uploads/editor/20180601/5b10b2f5cd89b.jpg', '56cb2fe0', 0.00);
INSERT INTO `eb_store_seckill_attr_value` VALUES (24, '白色', 99, 0, 1.00, '/public/uploads/store/product/s_5ae6715187623.jpg', '48bf425d', 0.00);
INSERT INTO `eb_store_seckill_attr_value` VALUES (24, '黑色', 99, 0, 1.00, '/public/uploads/store/product/s_5ae6715187623.jpg', '147b853b', 0.00);

-- ----------------------------
-- Table structure for eb_store_service
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_service`;
CREATE TABLE `eb_store_service`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客服id',
  `mer_id` int(11) NOT NULL DEFAULT 0 COMMENT '商户id',
  `uid` int(11) NOT NULL COMMENT '客服uid',
  `avatar` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客服头像',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代理名称',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '0隐藏1显示',
  `notify` int(2) DEFAULT 0 COMMENT '订单通知1开启0关闭',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客服表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_service_log
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_service_log`;
CREATE TABLE `eb_store_service_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客服用户对话记录表ID',
  `mer_id` int(11) NOT NULL DEFAULT 0 COMMENT '商户id',
  `msn` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  `uid` int(11) NOT NULL COMMENT '发送人uid',
  `to_uid` int(11) NOT NULL COMMENT '接收人uid',
  `add_time` int(11) NOT NULL COMMENT '发送时间',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已读（0：否；1：是；）',
  `remind` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否提醒过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客服用户对话记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_visit
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_visit`;
CREATE TABLE `eb_store_visit`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL COMMENT '产品ID',
  `product_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品类型',
  `cate_id` int(11) DEFAULT NULL COMMENT '产品分类ID',
  `type` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品类型',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `count` int(11) DEFAULT NULL COMMENT '访问次数',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注描述',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品浏览分析表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_system_admin
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_admin`;
CREATE TABLE `eb_system_admin`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '后台管理员表ID',
  `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '后台管理员账号',
  `pwd` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '后台管理员密码',
  `real_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '后台管理员姓名',
  `roles` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '后台管理员权限(menus_id)',
  `last_ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '后台管理员最后一次登录ip',
  `last_time` int(10) UNSIGNED DEFAULT NULL COMMENT '后台管理员最后一次登录时间',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '后台管理员添加时间',
  `login_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录次数',
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '后台管理员级别',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '后台管理员状态 1有效0无效',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `business` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '商户标识 ，默认为0代表后台管理，非0代表商家标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account`(`account`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_admin
-- ----------------------------
INSERT INTO `eb_system_admin` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '1', '127.0.0.1', 1558664174, 1558599386, 0, 0, 1, 0, '0');
INSERT INTO `eb_system_admin` VALUES (8, 'test8', 'e10adc3949ba59abbe56e057f20f883e', '', '24', '127.0.0.1', 1558665010, 1558664957, 0, 1, 1, 0, '0');
INSERT INTO `eb_system_admin` VALUES (6, 'test6', 'e10adc3949ba59abbe56e057f20f883e', '', '24', '127.0.0.1', 1558663957, 1558663930, 0, 1, 1, 0, '0');
INSERT INTO `eb_system_admin` VALUES (7, 'test7', 'e10adc3949ba59abbe56e057f20f883e', '', '25', NULL, NULL, 1558664121, 0, 2, 1, 0, '0');
INSERT INTO `eb_system_admin` VALUES (9, 'test9', 'e10adc3949ba59abbe56e057f20f883e', '', '24', '127.0.0.1', 1558675053, 1558675002, 0, 1, 1, 0, '123456');

-- ----------------------------
-- Table structure for eb_system_attachment
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_attachment`;
CREATE TABLE `eb_system_attachment`  (
  `att_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件名称',
  `att_dir` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件路径',
  `satt_dir` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '压缩图片路径',
  `att_size` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件大小',
  `att_type` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件类型',
  `pid` int(10) NOT NULL COMMENT '分类ID0编辑器,1产品图片,2拼团图片,3砍价图片,4秒杀图片,5文章图片,6组合数据图',
  `time` int(11) NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`att_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_attachment
-- ----------------------------
INSERT INTO `eb_system_attachment` VALUES (12, '5c3db9de2b73a.jpg', '/public/uploads/attach/2019/01/15/5c3db9de2b73a.jpg', '/public/uploads/attach/2019/01/15/s_5c3db9de2b73a.jpg', '61866', 'image/jpeg', 1, 1547549150);
INSERT INTO `eb_system_attachment` VALUES (2, '5c387d18c37fa.jpg', '/public/uploads/editor/20190111/5c387d18c37fa.jpg', '/public/uploads/editor/20190111/s_5c387d18c37fa.jpg', '9274', 'image/jpeg', 0, 1547205912);
INSERT INTO `eb_system_attachment` VALUES (3, '5c387daf3ef63.jpg', '/public/uploads/editor/20190111/5c387daf3ef63.jpg', '/public/uploads/editor/20190111/s_5c387daf3ef63.jpg', '9274', 'image/jpeg', 0, 1547206063);
INSERT INTO `eb_system_attachment` VALUES (7, '5c3db14908923.jpg', '/public/uploads/attach/2019/01/15/5c3db14908923.jpg', '/public/uploads/attach/2019/01/15/s_5c3db14908923.jpg', '102671', 'image/jpeg', 3, 1547546953);
INSERT INTO `eb_system_attachment` VALUES (9, '5c3db5d483c7e.jpg', '/public/uploads/attach/2019/01/15/5c3db5d483c7e.jpg', '/public/uploads/attach/2019/01/15/s_5c3db5d483c7e.jpg', '41833', 'image/jpeg', 3, 1547548116);
INSERT INTO `eb_system_attachment` VALUES (11, '5c3db8b933d92.jpg', '/public/uploads/attach/2019/01/15/5c3db8b933d92.jpg', '/public/uploads/attach/2019/01/15/s_5c3db8b933d92.jpg', '31746', 'image/jpeg', 2, 1547548857);
INSERT INTO `eb_system_attachment` VALUES (13, '5c3dba1366885.jpg', '/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '/public/uploads/attach/2019/01/15/s_5c3dba1366885.jpg', '41951', 'image/jpeg', 1, 1547549203);
INSERT INTO `eb_system_attachment` VALUES (14, '5c3dba4187461.jpg', '/public/uploads/attach/2019/01/15/5c3dba4187461.jpg', '/public/uploads/attach/2019/01/15/s_5c3dba4187461.jpg', '76932', 'image/jpeg', 1, 1547549249);
INSERT INTO `eb_system_attachment` VALUES (15, '5c3dbb137d656.jpeg', '/public/uploads/editor/20190115/5c3dbb137d656.jpeg', '/public/uploads/editor/20190115/s_5c3dbb137d656.jpeg', '114386', 'image/jpeg', 0, 1547549459);
INSERT INTO `eb_system_attachment` VALUES (16, '5c3dbb229e820.jpeg', '/public/uploads/editor/20190115/5c3dbb229e820.jpeg', '/public/uploads/editor/20190115/s_5c3dbb229e820.jpeg', '143065', 'image/jpeg', 0, 1547549474);
INSERT INTO `eb_system_attachment` VALUES (17, '5c3dbb3b37f84.jpeg', '/public/uploads/editor/20190115/5c3dbb3b37f84.jpeg', '/public/uploads/editor/20190115/s_5c3dbb3b37f84.jpeg', '139850', 'image/jpeg', 0, 1547549499);
INSERT INTO `eb_system_attachment` VALUES (18, '5c3dbb513b06f.jpeg', '/public/uploads/editor/20190115/5c3dbb513b06f.jpeg', '/public/uploads/editor/20190115/s_5c3dbb513b06f.jpeg', '150123', 'image/jpeg', 0, 1547549521);
INSERT INTO `eb_system_attachment` VALUES (19, '5c3dbc27c69c7.jpg', '/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '/public/uploads/attach/2019/01/15/s_5c3dbc27c69c7.jpg', '33563', 'image/jpeg', 1, 1547549735);
INSERT INTO `eb_system_attachment` VALUES (20, '5c3dbc6a38fab.jpg', '/public/uploads/attach/2019/01/15/5c3dbc6a38fab.jpg', '/public/uploads/attach/2019/01/15/s_5c3dbc6a38fab.jpg', '48892', 'image/jpeg', 1, 1547549802);
INSERT INTO `eb_system_attachment` VALUES (21, '5c3dbce620415.jpeg', '/public/uploads/editor/20190115/5c3dbce620415.jpeg', '/public/uploads/editor/20190115/s_5c3dbce620415.jpeg', '132779', 'image/jpeg', 0, 1547549926);
INSERT INTO `eb_system_attachment` VALUES (22, '5c3dc0ef27068.jpg', '/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '/public/uploads/attach/2019/01/15/s_5c3dc0ef27068.jpg', '40991', 'image/jpeg', 1, 1547550959);
INSERT INTO `eb_system_attachment` VALUES (23, '5c3dc15ba1972.jpg', '/public/uploads/attach/2019/01/15/5c3dc15ba1972.jpg', '/public/uploads/attach/2019/01/15/s_5c3dc15ba1972.jpg', '37389', 'image/jpeg', 1, 1547551067);
INSERT INTO `eb_system_attachment` VALUES (24, '5c3dc1730a0c0.jpg', '/public/uploads/editor/20190115/5c3dc1730a0c0.jpg', '/public/uploads/editor/20190115/s_5c3dc1730a0c0.jpg', '113870', 'image/jpeg', 0, 1547551091);
INSERT INTO `eb_system_attachment` VALUES (25, '5c3dc182bccac.jpg', '/public/uploads/editor/20190115/5c3dc182bccac.jpg', '/public/uploads/editor/20190115/s_5c3dc182bccac.jpg', '145391', 'image/jpeg', 0, 1547551106);
INSERT INTO `eb_system_attachment` VALUES (26, '5c3dc23646fff.jpg', '/public/uploads/attach/2019/01/15/5c3dc23646fff.jpg', '/public/uploads/attach/2019/01/15/s_5c3dc23646fff.jpg', '39941', 'image/jpeg', 1, 1547551286);
INSERT INTO `eb_system_attachment` VALUES (27, '5c3dc286862fd.jpg', '/public/uploads/editor/20190115/5c3dc286862fd.jpg', '/public/uploads/editor/20190115/s_5c3dc286862fd.jpg', '81291', 'image/jpeg', 0, 1547551366);
INSERT INTO `eb_system_attachment` VALUES (28, '5c3dc294a9a0a.jpg', '/public/uploads/editor/20190115/5c3dc294a9a0a.jpg', '/public/uploads/editor/20190115/s_5c3dc294a9a0a.jpg', '104012', 'image/jpeg', 0, 1547551380);
INSERT INTO `eb_system_attachment` VALUES (29, '5c3dc2ba18a77.jpg', '/public/uploads/editor/20190115/5c3dc2ba18a77.jpg', '/public/uploads/editor/20190115/s_5c3dc2ba18a77.jpg', '127719', 'image/jpeg', 0, 1547551418);
INSERT INTO `eb_system_attachment` VALUES (31, '5c3dc7146add5.png', '/public/uploads/attach/2019/01/15/5c3dc7146add5.png', '/public/uploads/attach/2019/01/15/s_5c3dc7146add5.png', '3209', 'image/png', 2, 1547552532);
INSERT INTO `eb_system_attachment` VALUES (32, '5c3dc72335ee5.png', '/public/uploads/attach/2019/01/15/5c3dc72335ee5.png', '/public/uploads/attach/2019/01/15/s_5c3dc72335ee5.png', '3607', 'image/png', 2, 1547552547);
INSERT INTO `eb_system_attachment` VALUES (33, '5c3dc730dead2.png', '/public/uploads/attach/2019/01/15/5c3dc730dead2.png', '/public/uploads/attach/2019/01/15/s_5c3dc730dead2.png', '3729', 'image/png', 2, 1547552560);
INSERT INTO `eb_system_attachment` VALUES (34, '5c3dc73feecaf.png', '/public/uploads/attach/2019/01/15/5c3dc73feecaf.png', '/public/uploads/attach/2019/01/15/s_5c3dc73feecaf.png', '3351', 'image/png', 2, 1547552575);
INSERT INTO `eb_system_attachment` VALUES (35, '5c3dc74c1bd3f.png', '/public/uploads/attach/2019/01/15/5c3dc74c1bd3f.png', '/public/uploads/attach/2019/01/15/s_5c3dc74c1bd3f.png', '2847', 'image/png', 2, 1547552588);
INSERT INTO `eb_system_attachment` VALUES (36, '5c3dc7ee98a2e.png', '/public/uploads/attach/2019/01/15/5c3dc7ee98a2e.png', '/public/uploads/attach/2019/01/15/s_5c3dc7ee98a2e.png', '778', 'image/png', 2, 1547552750);
INSERT INTO `eb_system_attachment` VALUES (37, '5c3dc802814e5.png', '/public/uploads/attach/2019/01/15/5c3dc802814e5.png', '/public/uploads/attach/2019/01/15/s_5c3dc802814e5.png', '574', 'image/png', 2, 1547552770);
INSERT INTO `eb_system_attachment` VALUES (38, '5c3dc8232ac13.png', '/public/uploads/attach/2019/01/15/5c3dc8232ac13.png', '/public/uploads/attach/2019/01/15/s_5c3dc8232ac13.png', '1197', 'image/png', 2, 1547552803);
INSERT INTO `eb_system_attachment` VALUES (39, '5c3dc84ef1070.png', '/public/uploads/attach/2019/01/15/5c3dc84ef1070.png', '/public/uploads/attach/2019/01/15/s_5c3dc84ef1070.png', '1556', 'image/png', 2, 1547552846);
INSERT INTO `eb_system_attachment` VALUES (40, '5c3dc865bb257.png', '/public/uploads/attach/2019/01/15/5c3dc865bb257.png', '/public/uploads/attach/2019/01/15/s_5c3dc865bb257.png', '749', 'image/png', 2, 1547552869);
INSERT INTO `eb_system_attachment` VALUES (41, '5c3dc8a7205f0.png', '/public/uploads/attach/2019/01/15/5c3dc8a7205f0.png', '/public/uploads/attach/2019/01/15/s_5c3dc8a7205f0.png', '814', 'image/png', 2, 1547552935);
INSERT INTO `eb_system_attachment` VALUES (42, '5c3dc91cee6ed.png', '/public/uploads/attach/2019/01/15/5c3dc91cee6ed.png', '/public/uploads/attach/2019/01/15/s_5c3dc91cee6ed.png', '1100', 'image/png', 2, 1547553052);
INSERT INTO `eb_system_attachment` VALUES (43, '5c3dc93937a48.png', '/public/uploads/attach/2019/01/15/5c3dc93937a48.png', '/public/uploads/attach/2019/01/15/s_5c3dc93937a48.png', '917', 'image/png', 2, 1547553081);
INSERT INTO `eb_system_attachment` VALUES (44, '5c3dc95a1d134.png', '/public/uploads/attach/2019/01/15/5c3dc95a1d134.png', '/public/uploads/attach/2019/01/15/s_5c3dc95a1d134.png', '1200', 'image/png', 2, 1547553114);
INSERT INTO `eb_system_attachment` VALUES (45, '5c3dc97a19134.png', '/public/uploads/attach/2019/01/15/5c3dc97a19134.png', '/public/uploads/attach/2019/01/15/s_5c3dc97a19134.png', '1227', 'image/png', 2, 1547553146);

-- ----------------------------
-- Table structure for eb_system_attachment_category
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_attachment_category`;
CREATE TABLE `eb_system_attachment_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT 0 COMMENT '父级ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `enname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类目录',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_attachment_category
-- ----------------------------
INSERT INTO `eb_system_attachment_category` VALUES (1, 0, '产品图', '');
INSERT INTO `eb_system_attachment_category` VALUES (2, 0, '分类图片', '');
INSERT INTO `eb_system_attachment_category` VALUES (3, 0, '广告图', '');

-- ----------------------------
-- Table structure for eb_system_config
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_config`;
CREATE TABLE `eb_system_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型(文本框,单选按钮...)',
  `config_tab_id` int(10) UNSIGNED NOT NULL COMMENT '配置分类id',
  `parameter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '规则 单选框和多选框',
  `upload_type` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '上传文件格式1单图2多图3文件',
  `required` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '规则',
  `width` int(10) UNSIGNED DEFAULT NULL COMMENT '多行文本框的宽度',
  `high` int(10) UNSIGNED DEFAULT NULL COMMENT '多行文框的高度',
  `value` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '默认值',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置名称',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '配置简介',
  `sort` int(10) UNSIGNED NOT NULL COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '是否隐藏',
  `business` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '商户标识 ，默认为0代表后台管理，非0代表商家标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_config
-- ----------------------------
INSERT INTO `eb_system_config` VALUES (1, 'site_name', 'text', 1, '', 0, 'required:true', 100, 0, '\"CRMEB\\u5ba2\\u6e90\"', '网站名称', '网站名称', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (2, 'site_url', 'text', 1, '', 0, 'required:true,url:true', 100, 0, '\"http:\\/\\/datong.crmeb.net\"', '网站地址', '网站地址', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (3, 'site_logo', 'upload', 1, '', 1, '', 0, 0, '\"\"', '后台LOGO', '左上角logo,建议尺寸[170*50]', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (4, 'site_phone', 'text', 1, '', 0, '', 100, 0, '\"\"', '联系电话', '联系电话', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (5, 'seo_title', 'text', 1, '', 0, 'required:true', 100, 0, '\"crmeb\\u7535\\u5546\\u7cfb\\u7edf\"', 'SEO标题', 'SEO标题', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (6, 'site_email', 'text', 1, '', 0, 'email:true', 100, 0, '\"admin@xazbkj.com\"', '联系邮箱', '联系邮箱', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (7, 'site_qq', 'text', 1, '', 0, 'qq:true', 100, 0, '\"98718401\"', '联系QQ', '联系QQ', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (8, 'site_close', 'radio', 1, '0=>开启\n1=>PC端关闭\n2=>WAP端关闭(含微信)\n3=>全部关闭', 0, '', 0, 0, '\"0\"', '网站关闭', '网站后台、商家中心不受影响。关闭网站也可访问', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (9, 'close_system', 'radio', 1, '0=>开启\n1=>关闭', 0, '', 0, 0, '\"0\"', '关闭后台', '关闭后台', 0, 2, '0');
INSERT INTO `eb_system_config` VALUES (10, 'wechat_name', 'text', 2, '', 0, 'required:true', 100, 0, '\"CRMEB\"', '公众号名称', '公众号的名称', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (11, 'wechat_id', 'text', 2, '', 0, 'required:true', 100, 0, '\"CRMEB\"', '微信号', '微信号', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (12, 'wechat_sourceid', 'text', 2, '', 0, 'required:true', 100, 0, '\"gh_14a8ce47c62c\"', '公众号原始id', '公众号原始id', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (13, 'wechat_appid', 'text', 2, '', 0, 'required:true', 100, 0, '\"1\"', 'AppID', 'AppID', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (14, 'wechat_appsecret', 'text', 2, '', 0, 'required:true', 100, 0, '\"1\"', 'AppSecret', 'AppSecret', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (15, 'wechat_token', 'text', 2, '', 0, 'required:true', 100, 0, '\"cddd0415e95\"', '微信验证TOKEN', '微信验证TOKEN', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (16, 'wechat_encode', 'radio', 2, '0=>明文模式\n1=>兼容模式\n2=>安全模式', 0, '', 0, 0, '\"0\"', '消息加解密方式', '如需使用安全模式请在管理中心修改，仅限服务号和认证订阅号', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (17, 'wechat_encodingaeskey', 'text', 2, '', 0, 'required:true', 100, 0, '\"3baRoYY2HmeWyDt33Mz4CS3jB9WaotggE15qeCfsDhb\"', 'EncodingAESKey', '公众号消息加解密Key,在使用安全模式情况下要填写该值，请先在管理中心修改，然后填写该值，仅限服务号和认证订阅号', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (18, 'wechat_share_img', 'upload', 3, '', 1, '', 0, 0, '\"\"', '微信分享图片', '若填写此图片地址，则分享网页出去时会分享此图片。可有效防止分享图片变形', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (19, 'wechat_qrcode', 'upload', 2, '', 1, '', 0, 0, '\"\\/public\\/uploads\\/config\\/image\\/5c3d8f3405c48.jpg\"', '公众号二维码', '您的公众号二维码', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (20, 'wechat_type', 'radio', 2, '0=>服务号\n1=>订阅号', 0, '', 0, 0, '\"0\"', '公众号类型', '公众号的类型', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (21, 'wechat_share_title', 'text', 3, '', 0, 'required:true', 100, 0, '\"crmeb\\u5ba2\\u6e90\"', '微信分享标题', '微信分享标题', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (22, 'wechat_share_synopsis', 'textarea', 3, '', 0, '', 100, 5, '\"crmeb\\u5ba2\\u6e90crmeb\\u5ba2\\u6e90crmeb\\u5ba2\\u6e90\"', '微信分享简介', '微信分享简介', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (23, 'pay_weixin_appid', 'text', 4, '', 0, '', 100, 0, '\"1\"', 'Appid', '微信公众号身份的唯一标识。审核通过后，在微信发送的邮件中查看。', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (24, 'pay_weixin_appsecret', 'text', 4, '', 0, '', 100, 0, '\"1\"', 'Appsecret', 'JSAPI接口中获取openid，审核后在公众平台开启开发模式后可查看。', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (25, 'pay_weixin_mchid', 'text', 4, '', 0, '', 100, 0, '\"1\"', 'Mchid', '受理商ID，身份标识', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (26, 'pay_weixin_client_cert', 'upload', 4, '', 3, '', 0, 0, '\"\\/public\\/uploads\\/config\\/file\\/5c3d93fa89b6c.pem\"', '微信支付证书', '微信支付证书，在微信商家平台中可以下载！文件名一般为apiclient_cert.pem', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (27, 'pay_weixin_client_key', 'upload', 4, '', 3, '', 0, 0, '\"\\/public\\/uploads\\/config\\/file\\/5c3d93fe927a8.pem\"', '微信支付证书密钥', '微信支付证书密钥，在微信商家平台中可以下载！文件名一般为apiclient_key.pem', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (56, 'store_home_pink', 'upload', 5, '', 1, '', 0, 0, '\"\\/public\\/uploads\\/config\\/image\\/5c3dd2ffb2616.jpeg\"', '首页拼团广告图', '首页拼团广告图', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (28, 'pay_weixin_key', 'text', 4, '', 0, '', 100, 0, '\"1\"', 'Key', '商户支付密钥Key。审核通过后，在微信发送的邮件中查看。', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (29, 'pay_weixin_open', 'radio', 4, '1=>开启\n0=>关闭', 0, '', 0, 0, '\"1\"', '开启', '是否启用微信支付', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (31, 'store_postage', 'text', 10, '', 0, 'number:true,min:0', 100, 0, '\"0\"', '邮费基础价', '商品邮费基础价格,最终金额为(基础价 + 商品1邮费 + 商品2邮费)', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (32, 'store_free_postage', 'text', 5, '', 0, 'number:true,min:-1', 100, 0, '\"20\"', '满额包邮', '商城商品满多少金额即可包邮', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (33, 'offline_postage', 'radio', 10, '0=>不包邮\n1=>包邮', 0, '', 0, 0, '\"1\"', '线下支付是否包邮', '用户选择线下支付时是否包邮', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (34, 'integral_ratio', 'text', 11, '', 0, 'number:true', 100, 0, '\"0.01\"', '积分抵用比例', '积分抵用比例(1积分抵多少金额)', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (35, 'site_service_phone', 'text', 1, '', 0, '', 100, 0, '\"\"', '客服电话', '客服联系电话', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (44, 'store_user_min_recharge', 'text', 5, '', 0, 'required:true,number:true,min:0', 100, 0, '\"0.01\"', '用户最低充值金额', '用户单次最低充值金额', 0, 0, '0');
INSERT INTO `eb_system_config` VALUES (45, 'site_store_admin_uids', 'text', 5, '', 0, '', 100, 0, '\"4\"', '管理员用户ID', '管理员用户ID,用于接收商城订单提醒，到微信用户中查找编号，多个英文‘,’隔开', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (46, 'system_express_app_code', 'text', 10, '', 0, '', 100, 0, '\"16607367740edb563b0f39f0c4b71d\"', '快递查询密钥', '阿里云快递查询接口密钥购买地址：https://market.aliyun.com/products/56928004/cmapi021863.html', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (47, 'main_business', 'text', 2, '', 0, 'required:true', 100, 0, '\" IT\\u79d1\\u6280 \\u4e92\\u8054\\u7f51|\\u7535\\u5b50\\u5546\\u52a1\"', '微信模板消息_主营行业', '微信公众号模板消息中选择开通的主营行业', 0, 0, '0');
INSERT INTO `eb_system_config` VALUES (48, 'vice_business', 'text', 2, '', 0, 'required:true', 100, 0, '\"IT\\u79d1\\u6280 IT\\u8f6f\\u4ef6\\u4e0e\\u670d\\u52a1 \"', '微信模板消息_副营行业', '微信公众号模板消息中选择开通的副营行业', 0, 0, '0');
INSERT INTO `eb_system_config` VALUES (49, 'store_brokerage_ratio', 'text', 9, '', 0, 'required:true,min:0,max:100,number:true', 100, 0, '\"30\"', '一级返佣比例', '订单交易成功后给上级返佣的比例0 - 100,例:5 = 反订单金额的5%', 5, 1, '0');
INSERT INTO `eb_system_config` VALUES (50, 'wechat_first_sub_give_coupon', 'text', 12, '', 0, 'requred:true,digits:true,min:0', 100, 0, '\"\"', '首次关注赠送优惠券ID', '首次关注赠送优惠券ID,0为不赠送', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (51, 'store_give_con_min_price', 'text', 12, '', 0, 'requred:true,digits:true,min:0', 100, 0, '\"0.01\"', '消费满多少赠送优惠券', '消费满多少赠送优惠券,0为不赠送', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (52, 'store_order_give_coupon', 'text', 12, '', 0, 'requred:true,digits:true,min:0', 100, 0, '\"\"', '消费赠送优惠劵ID', '消费赠送优惠劵ID,0为不赠送', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (53, 'user_extract_min_price', 'text', 9, '', 0, 'required:true,number:true,min:0', 100, 0, '\"1000\"', '提现最低金额', '用户提现最低金额', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (54, 'sx_sign_min_int', 'text', 11, '', 0, 'required:true,number:true,min:0', 100, 0, '\"1\"', '签到奖励最低积分', '签到奖励最低积分', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (55, 'sx_sign_max_int', 'text', 11, '', 0, 'required:true,number:true,min:0', 100, 0, '\"5\"', '签到奖励最高积分', '签到奖励最高积分', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (57, 'about_us', 'upload', 1, '', 1, '', 0, 0, '\"\\/public\\/uploads\\/config\\/image\\/5c3d964265e9f.png\"', '关于我们', '系统的标识', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (61, 'api', 'text', 2, '', 0, '', 100, 0, '\"\\/wap\\/Wechat\\/serve\"', '接口地址', '微信接口例如：http://www.abc.com/wap/Wechat/serve', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (58, 'replenishment_num', 'text', 5, '', 0, 'required:true,number:true,min:0', 100, 0, '\"20\"', '待补货数量', '产品待补货数量低于多少时，提示补货', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (59, 'routine_appId', 'text', 7, '', 0, '', 100, 0, '\"1\"', 'appId', '小程序appID', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (60, 'routine_appsecret', 'text', 7, '', 0, '', 100, 0, '\"1\"', 'AppSecret', '小程序AppSecret', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (62, 'paydir', 'textarea', 4, '', 0, '', 100, 5, '\"\\/wap\\/my\\/\\r\\n\\/wap\\/my\\/order\\/uni\\/\\r\\n\\/wap\\/store\\/confirm_order\\/cartId\\/\"', '配置目录', '支付目录配置系统不调用提示作用', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (73, 'routine_logo', 'upload', 7, '', 1, '', 0, 0, '\"\\/public\\/uploads\\/config\\/image\\/5c3d98825aa8a.png\"', '小程序logo', '小程序logo', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (74, 'routine_name', 'text', 7, '', 0, '', 100, 0, '\"CRMEB\\u5ba2\\u6e90\"', '小程序名称', '小程序名称', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (76, 'routine_style', 'text', 7, '', 0, '', 100, 0, '\"#FFFFFF\"', '小程序风格', '小程序颜色', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (77, 'store_stock', 'text', 5, '', 0, '', 100, 0, '\"2\"', '警戒库存', '警戒库存提醒值', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (88, 'store_brokerage_statu', 'radio', 9, '1=>指定分销\n2=>人人分销', 0, '', 0, 0, '\"2\"', '分销模式', '人人分销默认每个人都可以分销，制定人分销后台制定人开启分销', 10, 1, '0');
INSERT INTO `eb_system_config` VALUES (85, 'stor_reason', 'textarea', 5, '', 0, '', 100, 8, '\"\\u6536\\u8d27\\u5730\\u5740\\u586b\\u9519\\u4e86\\r\\n\\u4e0e\\u63cf\\u8ff0\\u4e0d\\u7b26\\r\\n\\u4fe1\\u606f\\u586b\\u9519\\u4e86\\uff0c\\u91cd\\u65b0\\u62cd\\r\\n\\u6536\\u5230\\u5546\\u54c1\\u635f\\u574f\\u4e86\\r\\n\\u672a\\u6309\\u9884\\u5b9a\\u65f6\\u95f4\\u53d1\\u8d27\\r\\n\\u5176\\u5b83\\u539f\\u56e0\"', '退货理由', '配置退货理由，一行一个理由', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (87, 'store_brokerage_two', 'text', 9, '', 0, 'required:true,min:0,max:100,number:true', 100, 0, '\"10\"', '二级返佣比例', '订单交易成功后给上级返佣的比例0 - 100,例:5 = 反订单金额的5%', 4, 1, '0');
INSERT INTO `eb_system_config` VALUES (89, 'pay_routine_appid', 'text', 14, '', 0, 'required:true', 100, 0, '\"1\"', 'Appid', '小程序Appid', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (90, 'pay_routine_appsecret', 'text', 14, '', 0, 'required:true', 100, 0, '\"1\"', 'Appsecret', '小程序Appsecret', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (91, 'pay_routine_mchid', 'text', 14, '', 0, 'required:true', 100, 0, '\"1\"', 'Mchid', '商户号', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (92, 'pay_routine_key', 'text', 14, '', 0, 'required:true', 100, 0, '\"1\"', 'Key', '商户key', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (93, 'pay_routine_client_cert', 'upload', 14, '', 3, '', 0, 0, '\"\\/public\\/uploads\\/config\\/file\\/5c3d992951151.pem\"', '小程序支付证书', '小程序支付证书', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (94, 'pay_routine_client_key', 'upload', 14, '', 3, '', 0, 0, '\"\\/public\\/uploads\\/config\\/file\\/5c3d992d5785d.pem\"', '小程序支付证书密钥', '小程序支付证书密钥', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (99, 'user_extract_bank', 'textarea', 9, NULL, NULL, NULL, 100, 5, '中国农行\n中国建设银行\n工商银行', '提现银行卡', '提现银行卡，每个银行换行', 0, 1, '0');
INSERT INTO `eb_system_config` VALUES (98, 'wechat_avatar', 'upload', 2, '', 1, '', 0, 0, '\"\"', '公众号logo', '公众号logo', 0, 1, '0');

-- ----------------------------
-- Table structure for eb_system_config_tab
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_config_tab`;
CREATE TABLE `eb_system_config_tab`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置分类id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置分类名称',
  `eng_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置分类英文名称',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '配置分类状态',
  `info` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配置分类是否显示',
  `icon` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `type` int(2) DEFAULT 0 COMMENT '配置类型',
  `business` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '商户标识 ，默认为0代表后台管理，非0代表商家标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_config_tab
-- ----------------------------
INSERT INTO `eb_system_config_tab` VALUES (1, '基础配置', 'basics', 1, 0, 'cog', 0, '0');
INSERT INTO `eb_system_config_tab` VALUES (2, '公众号配置', 'wechat', 1, 0, 'weixin', 1, '0');
INSERT INTO `eb_system_config_tab` VALUES (3, '公众号分享配置', 'wechat_share', 1, 0, 'whatsapp', 1, '0');
INSERT INTO `eb_system_config_tab` VALUES (4, '公众号支付配置', 'pay', 1, 0, 'jpy', 1, '0');
INSERT INTO `eb_system_config_tab` VALUES (5, '商城配置', 'store', 1, 0, 'shopping-cart', 0, '0');
INSERT INTO `eb_system_config_tab` VALUES (7, '小程序配置', 'routine', 1, 0, 'weixin', 2, '0');
INSERT INTO `eb_system_config_tab` VALUES (9, '分销配置', 'fenxiao', 1, 0, 'sitemap', 3, '0');
INSERT INTO `eb_system_config_tab` VALUES (10, '物流配置', 'express', 1, 0, 'motorcycle', 0, '0');
INSERT INTO `eb_system_config_tab` VALUES (11, '积分配置', 'point', 1, 0, 'powerpoint-o', 3, '0');
INSERT INTO `eb_system_config_tab` VALUES (12, '优惠券配置', 'coupon', 1, 0, 'heartbeat', 3, '0');
INSERT INTO `eb_system_config_tab` VALUES (14, '小程序支付配置', 'routine_pay', 1, 0, '', 2, '0');

-- ----------------------------
-- Table structure for eb_system_file
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_file`;
CREATE TABLE `eb_system_file`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文件对比ID',
  `cthash` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件内容',
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文价名称',
  `atime` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上次访问时间',
  `mtime` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上次修改时间',
  `ctime` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上次改变时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2112 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件对比表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_file
-- ----------------------------
INSERT INTO `eb_system_file` VALUES (1, 'bf1abce220aa743527e99cecc98edd90', './application/admin/common.php', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (2, '37533ae1c30a4d1ebb1fc1aa097e980b', './application/admin/config.php', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (3, 'cbb69fa95050aa716fcddfe065de42cc', './application/admin/controller/AdminException.php', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (4, 'cc580cadcd7a5a5aeebb90bce611c337', './application/admin/controller/agent/AgentManage.php', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (5, '401f41730a2b6f80e3522636a13a436b', './application/admin/controller/article/Article.php', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (6, 'e74bfb2bb0038399dac07f995f6a496e', './application/admin/controller/article/ArticleCategory.php', '1556518586', '1553500992', '1556518586');
INSERT INTO `eb_system_file` VALUES (7, 'b252cbc200553ee5f20397aeea803155', './application/admin/controller/article/WechatNews.php', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (8, 'a40f9dd6028886b9f24be288bc5883e5', './application/admin/controller/AuthController.php', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (9, 'bd34f90159a78668c6d13b343170303c', './application/admin/controller/finance/Finance.php', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (10, '4bff8c12c602e4ef6d89a2f2a51f092a', './application/admin/controller/finance/UserExtract.php', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (11, 'd36ff5045161c9cb60bb884f513e1eb3', './application/admin/controller/finance/UserRecharge.php', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (12, '0e0edc1df6fd41b4e4af8b5ca4b8b1bf', './application/admin/controller/Index.php', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (13, '242e98bb49df47d21cb128cf08fca229', './application/admin/controller/Login.php', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (14, 'dd9f0f7846d90303639fec06699e884a', './application/admin/controller/order/combinationOrder.php', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (15, 'dae96c600c2b71532f383cd914ebb8f2', './application/admin/controller/order/StoreOrder.php', '1556518586', '1553491404', '1556518586');
INSERT INTO `eb_system_file` VALUES (16, 'e558f15160f09a8568aa6f319c1557fd', './application/admin/controller/record/Record.php', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (17, '599d7894214eafb6e87b5d870395403a', './application/admin/controller/record/StoreStatistics.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (18, 'c208e99dfcde1f0997463f3a69e849ff', './application/admin/controller/routine/RoutineTemplate.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (19, '2593e75597e1f64b0537f9a0dcb6b043', './application/admin/controller/server/ServerUpgrade.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (20, 'bdf85e2096c7cbc2a8f7ae719b6437ba', './application/admin/controller/server/UpgradeApi.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (21, 'f9feaf3c8bc1b293dc3978f7d2d42834', './application/admin/controller/setting/SystemAdmin.php', '1558677011', '1558677011', '1556518587');
INSERT INTO `eb_system_file` VALUES (22, 'a598909c395eef442cc7c870539707fa', './application/admin/controller/setting/SystemConfig.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (23, 'b4a52b5c3dc128948dfa8827233a58e3', './application/admin/controller/setting/SystemConfigTab.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (24, 'c90fa0d79dde8b9b5a719119bc792c30', './application/admin/controller/setting/SystemGroup.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (25, 'bd1f6d11888a36e15b4f310a1f356cf2', './application/admin/controller/setting/SystemGroupData.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (26, '6eb99ec15d19d8bf634bb0d5cef25177', './application/admin/controller/setting/SystemMenus.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (27, '780c8532d44b72c9f36f8bdbbeaffd17', './application/admin/controller/setting/SystemNotice.php', '1556518587', '1553500992', '1556518587');
INSERT INTO `eb_system_file` VALUES (28, '087e92f43671db89e4fb294ca69796f4', './application/admin/controller/setting/SystemRole.php', '1558678627', '1558678627', '1556518587');
INSERT INTO `eb_system_file` VALUES (29, '01ce6bdd4978462850d9b791e3968362', './application/admin/controller/store/StoreCategory.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (30, '61cfd4cc9f1266caf7b4d715f0feae1d', './application/admin/controller/store/StoreInfoMana.php', '1556518587', '1553500992', '1556518587');
INSERT INTO `eb_system_file` VALUES (31, '8d772d7ad83389a4574ffff23d0c08db', './application/admin/controller/store/StoreProduct.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (32, 'c0bbac9836540a2e9838a894fcef1c8b', './application/admin/controller/store/StoreProductReply.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (33, 'eca38bac1de3d6ab521ee8dd54690115', './application/admin/controller/system/Clear.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (34, 'f113bc9f1f889fc48fe6634e0fa79e0b', './application/admin/controller/system/Express.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (35, '2d49ed7fd432c8204a7be604feb94414', './application/admin/controller/system/SystemAttachment.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (36, 'd413b6ff4d821ce3d59af480a0a41e9a', './application/admin/controller/system/SystemClear.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (37, 'd1268d5b61df20fc90bee869009926d7', './application/admin/controller/system/SystemCleardata.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (38, '6f909a0c4602d57568aa1d2dfdbd1f82', './application/admin/controller/system/SystemDatabackup.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (39, '1cd504587c9f5f6a1feea2ddd2e7b7d1', './application/admin/controller/system/SystemFile.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (40, 'f737cdeef67de3facb6a7b7a1cbb9de7', './application/admin/controller/system/SystemLog.php', '1556518587', '1553500992', '1556518587');
INSERT INTO `eb_system_file` VALUES (41, '3e49239d448363b5b4cb725628e3e6b5', './application/admin/controller/system/SystemUpgradeclient.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (42, 'ef6ea0dc725109973d0a0f962a600e0b', './application/admin/controller/SystemBasic.php', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (43, '1cf6bdfced7c2f2f9ceacadd2cf02d48', './application/admin/controller/ump/StoreBargain.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (44, 'f7615c3c8f6aab70ff093c70d8f60db5', './application/admin/controller/ump/StoreCombination.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (45, 'ed3d07519d85eb0a919ee719f3531e7f', './application/admin/controller/ump/StoreCoupon.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (46, 'f82b8e96d92567b4de1d06ab83cf8ea9', './application/admin/controller/ump/StoreCouponIssue.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (47, '2790bc8b9459d9629be87a022fca934b', './application/admin/controller/ump/StoreCouponUser.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (48, 'cc31379a403523f231fe719306d0084a', './application/admin/controller/ump/StoreSeckill.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (49, 'df44d4497c75bb1ff5a10ac6e16af6cb', './application/admin/controller/ump/UserPoint.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (50, '34dd4fcce9d663a533cec474d8612371', './application/admin/controller/user/User.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (51, 'a8c4a9c315a52cfcba5c5fd3f3b6cc84', './application/admin/controller/user/UserLevel.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (52, '3ec3096e8a347d409116178721c26cc9', './application/admin/controller/user/UserNotice.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (53, '070a6af695ccec4c7b25aeaf3eb04539', './application/admin/controller/wechat/index.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (54, '6eedba963cf6b6236c5fa3457d691aca', './application/admin/controller/wechat/Menus.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (55, 'b8768effa3c32ea59ae5cf457079033a', './application/admin/controller/wechat/Reply.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (56, '7d32823966fa0e29351759ebe469f06a', './application/admin/controller/wechat/StoreService.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (57, 'f471fc3814d937e893d96fdeaca51671', './application/admin/controller/wechat/WechatMessage.php', '1556518587', '1553500992', '1556518587');
INSERT INTO `eb_system_file` VALUES (58, '5e9a2af7c5b17b0264a19bff8a7c653a', './application/admin/controller/wechat/WechatNewsCategory.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (59, 'fa38511df3fd7d9db092f38552cd2208', './application/admin/controller/wechat/WechatTemplate.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (60, '28915fe7691110adac243bf5c0bfb6e2', './application/admin/controller/wechat/WechatUser.php', '1556518587', '1553500992', '1556518587');
INSERT INTO `eb_system_file` VALUES (61, 'faa79702fcc5c103876d190be1c6b0b9', './application/admin/controller/widget/Images.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (62, 'ef77d67cd9a6c86ae70831547ea7734d', './application/admin/controller/widget/Widgets.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (63, '89eeed01453c8ba4ba1fae673c72f368', './application/admin/model/article/Article.php', '1556518587', '1553500992', '1556518587');
INSERT INTO `eb_system_file` VALUES (64, 'fa8cdf1cc2e81435f91d32d65064c7f6', './application/admin/model/article/ArticleCategory.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (65, '43d579782c3d606f9dd38355d1e1582d', './application/admin/model/finance/FinanceModel.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (66, '5e3840419ea24a4bc895a876ede8183b', './application/admin/model/order/StoreOrder.php', '1556518587', '1553186354', '1556518587');
INSERT INTO `eb_system_file` VALUES (67, '9383865b3f48005f9645bf1d5533df9f', './application/admin/model/order/StoreOrderCartInfo.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (68, '2a8a2541a34c3a9bd73f32f557c69f0e', './application/admin/model/order/StoreOrderStatus.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (69, 'c7832602a7a1251b0795e963baf2b52a', './application/admin/model/record/StoreStatistics.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (70, 'e4bf82f6d2f98b37e13560168ddac08a', './application/admin/model/record/StoreVisit.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (71, 'd9fda80e23e90211c7a0a3862a180126', './application/admin/model/routine/RoutineFormId.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (72, '06572b3ff9076967fb6a075bf018e2d3', './application/admin/model/routine/RoutineTemplate.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (73, 'd219c2e4ce22238217bac9a31c61ea1f', './application/admin/model/server/HttpsCode.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (74, '86418fbed7bc8084b4575ed834062bd8', './application/admin/model/server/ServerUpgradeLog.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (75, 'a25416015453547891437c820870b273', './application/admin/model/server/ServerVersion.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (76, 'f5e7e2a2460078ee2a52688320c3a7e7', './application/admin/model/server/ServerWeb.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (77, '55d83bebf736ef73517c7604ec7a6cab', './application/admin/model/server/Upgrade.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (78, '237f9936b2f3516ef8cf26832deddbff', './application/admin/model/store/StoreCategory.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (79, '3b15a9be433081f353577dfde36e5f0b', './application/admin/model/store/StoreCouponUser.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (80, '486a970538d66d8df5b672356fffab82', './application/admin/model/store/StoreProduct.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (81, '11d3de7f5a1871dcdced4ef11aa86f40', './application/admin/model/store/StoreProductAttr.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (82, '680ada3f10bcfab9950118b673c7392e', './application/admin/model/store/StoreProductAttrResult.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (83, '27f537286d81696b6f0ecea6ffb00de3', './application/admin/model/store/StoreProductAttrValue.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (84, '884acba55d0b1ebc5c30b5e67ae85e63', './application/admin/model/store/StoreProductRelation.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (85, '1b08247b3282627c987ac6f24723ef2a', './application/admin/model/store/StoreProductReply.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (86, '4af5b68c52c5ecfe8182484acec73623', './application/admin/model/store/StoreVisit.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (87, '4587b27ee0b7dd73d48eae980941dc67', './application/admin/model/system/Express.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (88, 'd48b76bf78f28a80d485734b73739640', './application/admin/model/system/SystemAdmin.php', '1558675701', '1558675701', '1556518587');
INSERT INTO `eb_system_file` VALUES (89, '38154caf111a56dbcb93340a88fb6d87', './application/admin/model/system/SystemAttachment.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (90, 'cb3f84fd85e53882dbe1eaab6b800a07', './application/admin/model/system/SystemAttachmentCategory.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (91, 'b689669ddcfb14997223aec73fe463be', './application/admin/model/system/SystemAttachmentType.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (92, '7ec01e8b675b8c736cb3a7da6c0bc7b9', './application/admin/model/system/SystemConfig.php', '1556518587', '1553500992', '1556518587');
INSERT INTO `eb_system_file` VALUES (93, '17b8689e4eae8e2c1007917c81ebb7a3', './application/admin/model/system/SystemConfigTab.php', '1556518587', '1553500992', '1556518587');
INSERT INTO `eb_system_file` VALUES (94, 'db8ef4253cff82a6edf762df2b4f1fa7', './application/admin/model/system/SystemFile.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (95, 'bd891dd9361e9726fa4861dd46b70a86', './application/admin/model/system/SystemGroup.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (96, '8fda6574c8d97af838d102ba9cadcb27', './application/admin/model/system/SystemGroupData.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (97, '316226ea9a9a5477aa5df5ff0d4fa7ef', './application/admin/model/system/SystemLog.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (98, '82168916c7c8a3284af8827f0050256b', './application/admin/model/system/SystemMenus.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (99, 'c8b1d7fc8519d04d18a73f35050b4f4a', './application/admin/model/system/SystemNotice.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (100, 'fc0fad8fe04d7b55676e8922e4014d05', './application/admin/model/system/SystemRole.php', '1558678845', '1558678845', '1556518587');
INSERT INTO `eb_system_file` VALUES (101, 'c83c1dbd58fe3451754378929d08a40a', './application/admin/model/ump/StoreBargain.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (102, 'b1b13feb11193f4ffa0f746dcc407940', './application/admin/model/ump/StoreBargainUser.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (103, 'd7e4fe0a6f8ad8994ac68c179fe2d314', './application/admin/model/ump/StoreBargainUserHelp.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (104, '4d22630523cbc56d90f43b5e8e2f6ade', './application/admin/model/ump/StoreCombination.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (105, '6a76c85dcf9b4f2d095a5740f3adf06e', './application/admin/model/ump/StoreCombinationAttr.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (106, 'dbc665a9b901a7e88552c0fdd2cc8db3', './application/admin/model/ump/StoreCombinationAttrResult.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (107, '96364cb04cbf2eb358c6739e6e596019', './application/admin/model/ump/StoreCombinationAttrValue.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (108, '1173ae016c762a611c6ca6ecc51703f5', './application/admin/model/ump/StoreCoupon.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (109, 'cd3e7ef93a3de2bd3b26b683cc1af2ae', './application/admin/model/ump/StoreCouponIssue.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (110, '6ffbb4218605c65b6284f864b48f198f', './application/admin/model/ump/StoreCouponIssueUser.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (111, '95d9a4775ec982e68680b45df2a0cca0', './application/admin/model/ump/StoreCouponUser.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (112, '8a56dc2ae2055a4bcaf62d97bdb3d551', './application/admin/model/ump/StorePink.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (113, '69671f9d0543c0756377d46b95282c08', './application/admin/model/ump/StoreSeckill.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (114, '2eb7a8a0a52ad43e298bf949b54f38ca', './application/admin/model/ump/StoreSeckillAttr.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (115, 'f183fc02bc7006b3bd4f6e5d94b71c7e', './application/admin/model/ump/StoreSeckillAttrResult.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (116, 'd34c1f65e1383fbbe54bb5063bdf55a3', './application/admin/model/ump/StoreSeckillAttrValue.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (117, '188d14b3110f563fa9019853749ab0dd', './application/admin/model/user/User.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (118, 'cddafb2ecbdc60e90af19a62e8e06b9e', './application/admin/model/user/UserAddress.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (119, '66f4eb93b3fa8d87a26b2b72a2414ab5', './application/admin/model/user/UserBill.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (120, 'b6d5f9fa4c49e6c9bc33668676cd7c6c', './application/admin/model/user/UserExtract.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (121, 'f513d78d003e981dd8a29473fcd58fd0', './application/admin/model/user/UserLevel.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (122, '9bf05e67eb1472f4f01d172d0daf16c9', './application/admin/model/user/UserNotice.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (123, '8a0305e608b5127fddbf085ee2a94bbc', './application/admin/model/user/UserNoticeSee.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (124, '3b8e6d86b4c9647b1069184115cada03', './application/admin/model/user/UserPoint.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (125, '484a06c0c011f8736c02cc43e464a898', './application/admin/model/user/UserRecharge.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (126, '95b7e284eb6a724b9d8f73f233cb6be7', './application/admin/model/wechat/StoreService.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (127, '35561d0c3b8fa5f3add2b50de08981c6', './application/admin/model/wechat/StoreServiceLog.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (128, '56020576e7e42cf7fbc3b4280315a79d', './application/admin/model/wechat/WechatMessage.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (129, 'cf81ec8ff1b3f489dc77511196216d86', './application/admin/model/wechat/WechatNews.php', '1556518587', '1553500992', '1556518587');
INSERT INTO `eb_system_file` VALUES (130, '6eb9a90ac0ccdb1c984c87334a04e3f9', './application/admin/model/wechat/WechatNewsCategory.php', '1556518587', '1553500992', '1556518587');
INSERT INTO `eb_system_file` VALUES (131, '326932a33f9806f02fbae16980a3e6c9', './application/admin/model/wechat/WechatQrcode.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (132, 'c0be65794efe991faf13f2e1db03c921', './application/admin/model/wechat/WechatReply.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (133, 'd9e48a600a43efa4d4b1cfc8498c378c', './application/admin/model/wechat/WechatTemplate.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (134, 'ddf21bb40581d1b6f71b44f6c043520f', './application/admin/model/wechat/WechatUser.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (135, '1c27a3268ca555ccf406eb9f7db5b266', './application/admin/readme.txt', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (136, 'b8a7a08d0bf739124158bb0638f2d4d2', './application/admin/view/agent/agent_manage/index.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (137, 'c32be0ba8f9eb4915d6e112382aa609a', './application/admin/view/agent/agent_manage/now_money.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (138, 'ad38fce5e32b63ad1726ef0681b83fd1', './application/admin/view/agent/agent_manage/stair.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (139, '99df5386d03203471ad8f7caf74d0a9f', './application/admin/view/article/article/create.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (140, '005bbf59453cb06f98dec29715813ddc', './application/admin/view/article/article/index.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (141, '3b441ca860f5f7995e632d61f9b667dd', './application/admin/view/article/article_category/index.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (142, 'dbc1bdaa008234fea511c170e9cb82ec', './application/admin/view/finance/finance/bill.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (143, 'e551554cbec3e8a86ee8ef99a080e145', './application/admin/view/finance/finance/bill1.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (144, '93ea925781aa7475f621b0b29a5cc16b', './application/admin/view/finance/finance/commission_list.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (145, 'd6edaacb9842aa799f872de75dc277ec', './application/admin/view/finance/finance/content_info.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (146, 'c6bc7c79ece93c4beedc631b2922eb62', './application/admin/view/finance/user_extract/index.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (147, '7119a7c5448edaf86b28ce064f8ec863', './application/admin/view/finance/user_recharge/index.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (148, '2393699c7b9ac166c10d55b12e4a2c99', './application/admin/view/index/index.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (149, 'c5bbb5fe269ec6b580280ebabcc1f000', './application/admin/view/index/main.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (150, 'e6ceace540487dab3d509a5c35ebc836', './application/admin/view/login/index.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (151, 'ce54fe8a23bc2f9713a60e18e709d7f5', './application/admin/view/order/store_order/express.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (152, '99120c8f9d5f058e5d7ca1dcb93a8d66', './application/admin/view/order/store_order/index.php', '1556518587', '1553491404', '1556518587');
INSERT INTO `eb_system_file` VALUES (153, '335a661d32750f2326e43d3a3bfd9fda', './application/admin/view/order/store_order/orderchart.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (154, '575f0608eb28770682b8f51c7a93506a', './application/admin/view/order/store_order/order_info.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (155, 'cb207c835af5a44835191162dadd76bc', './application/admin/view/order/store_order/order_status.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (156, 'cb207c835af5a44835191162dadd76bc', './application/admin/view/order/store_order_pink/order_status.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (157, '07ec16b45500174084f4d76f12549f8f', './application/admin/view/public/404.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (158, '31b2bf0f71bd922d85f101b726370dd3', './application/admin/view/public/500.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (159, 'ec2424c5928cf40d01e2ad2a987a753c', './application/admin/view/public/common_form.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (160, 'f25ade9b3e012a4879ce6c9ce93b4ba7', './application/admin/view/public/container.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (161, '55a236211c39474cfb16d494116302e0', './application/admin/view/public/edit_content.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (162, '9fcdb3fe97f57bdbb168ff2e11e45082', './application/admin/view/public/error.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (163, '88885232decc53c072c1722481e2f04e', './application/admin/view/public/exception.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (164, 'bde5624e8cc3f10d556cba62673638f9', './application/admin/view/public/form-builder.php', '1556518587', '1553911047', '1556518587');
INSERT INTO `eb_system_file` VALUES (165, 'd41d8cd98f00b204e9800998ecf8427e', './application/admin/view/public/frame_footer.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (166, '22bf361ce23b985eca18d3c2e5164729', './application/admin/view/public/frame_head.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (167, '94c0e2367b28cc6f912c2f1ddf3bcd0a', './application/admin/view/public/head.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (168, 'bca7f06aad9580512aa57822b1173c53', './application/admin/view/public/inner_footer.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (169, '29858562aed26e1be0bd196d9384dc09', './application/admin/view/public/inner_page.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (170, '4e806f620ceb747df90c462e52af7e9b', './application/admin/view/public/layui.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (171, 'b5dc127af353593ab33fa0025b7b7c12', './application/admin/view/public/notice.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (172, 'bf8c6d2b6877973936216ce500f3ba31', './application/admin/view/public/style.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (173, 'e0087940927b3cddce969014422941e0', './application/admin/view/public/success.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (174, '6b994e52b7a7d7f7fa284f92d377dd73', './application/admin/view/record/record/chart_bargain.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (175, '8fc2103bc7b8c4037866e55761eaa678', './application/admin/view/record/record/chart_cash.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (176, '891dfe2b75f8e143fa9fc6ab009c0b86', './application/admin/view/record/record/chart_combination.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (177, 'd5e3760e43d15554744761bcc478462e', './application/admin/view/record/record/chart_coupon.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (178, '212ac20d3cd33f33304b504788beeadb', './application/admin/view/record/record/chart_order.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (179, '726c315c667eaa324a1d526ee79056eb', './application/admin/view/record/record/chart_product.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (180, 'be3d80f98bfd04a0f30f24ebf9e53dc4', './application/admin/view/record/record/chart_rebate.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (181, '829bff761b7ed6a79407315ae345fe7f', './application/admin/view/record/record/chart_recharge.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (182, '7313033c77f0aca6c2376800c85ab02f', './application/admin/view/record/record/chart_score.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (183, '72c8a1034074285f328e8c05411df41d', './application/admin/view/record/record/chart_seckill.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (184, 'e631fdb7068a39b545cba81ebe9b7625', './application/admin/view/record/record/product_info.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (185, '2bef559a6556e291f41a5ac6d2e25871', './application/admin/view/record/record/ranking_commission.php', '1556518587', '1553171244', '1556518587');
INSERT INTO `eb_system_file` VALUES (186, 'd091167425ec8f446e4c5e8d912fa76d', './application/admin/view/record/record/ranking_point.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (187, 'ac191fb969cedb047c6c0d0206483ea9', './application/admin/view/record/record/ranking_saleslists.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (188, '36531f170adc49de395a3f5ca0459a9f', './application/admin/view/record/record/user_attr.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (189, 'be920a4e80a16088a85534e7df828e93', './application/admin/view/record/record/user_business_chart.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (190, 'dc03d4c90d2bda9a1e3abf14d292dff8', './application/admin/view/record/record/user_chart.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (191, '30476b8dd83b0f26555ed1fddf8f9f70', './application/admin/view/record/record/user_distribution_chart.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (192, 'f3d45ffe48a0393aaab2cc5d5301128a', './application/admin/view/record/store_statistics/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (193, '8cf0e501b57ce4d3763f686372243d62', './application/admin/view/routine/routine_template/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (194, '0287342132a9fab8610d45bb178cc840', './application/admin/view/server/server_upgrade/add_upgrade.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (195, 'fb9598e08c9a8269396d51fafd86ce14', './application/admin/view/server/server_upgrade/add_version.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (196, 'ea22ea76ec259312dba1760e9b30615b', './application/admin/view/server/server_upgrade/edit_version.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (197, 'e8b59866ba87eb4fe554dcdf38e97545', './application/admin/view/server/server_upgrade/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (198, '72281078fbcb57f0cd3123852d8288a6', './application/admin/view/server/server_upgrade/upgrade_log.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (199, '0c7dc6092d81916cbaca2cca51a21d01', './application/admin/view/server/server_upgrade/versionlist.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (200, 'd1ddc6f01a5d0f46326edb295de4b3a6', './application/admin/view/server/server_upgrade/weblist.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (201, '478db91e0899f14e80db7eb18536ea11', './application/admin/view/setting/system_admin/admin_info.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (202, '4c7d8112a736f846aeefa9e8322da0d7', './application/admin/view/setting/system_admin/create.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (203, '7548c98d4700cbb552143a6e1bdd6926', './application/admin/view/setting/system_admin/edit.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (204, '713c7f33614e0f2316e0a30d6a3b156a', './application/admin/view/setting/system_admin/index.php', '1558678155', '1558678155', '1556518588');
INSERT INTO `eb_system_file` VALUES (205, 'c51673f4a8da758a6eadc2e634a1c955', './application/admin/view/setting/system_config/create.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (206, 'c3af312da32b0732c47b0724223cec13', './application/admin/view/setting/system_config/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (207, '65582835773f802dae6c1e597c2d4a56', './application/admin/view/setting/system_config/index_alone.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (208, '0369972eb75cfc652b4101c12313754b', './application/admin/view/setting/system_config_tab/create.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (209, 'd51d0a337566e65e510ec76f1985bba8', './application/admin/view/setting/system_config_tab/create_base.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (210, '9191b529705ba8fc2b59aba994ae9a1c', './application/admin/view/setting/system_config_tab/edit.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (211, 'caa0cb64b79bb426b1940e57352e64a7', './application/admin/view/setting/system_config_tab/edit_cinfig.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (212, '5c8d163c80cbfe25d19e458163351c66', './application/admin/view/setting/system_config_tab/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (213, 'bff97c2dcc2f7c051b189a62d280b2a3', './application/admin/view/setting/system_config_tab/sonconfigtab.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (214, 'bd2ddf7402f962fc64b4f4d50f6a4590', './application/admin/view/setting/system_group/create.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (215, '87b88776414377c49dbbd7773f889ac2', './application/admin/view/setting/system_group/edit.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (216, 'a6b09e117e6b9a9f9c9b375f534d7f45', './application/admin/view/setting/system_group/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (217, '2b051c4c430b9bb8a0e2d7c9c4135767', './application/admin/view/setting/system_group_data/create.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (218, '2b051c4c430b9bb8a0e2d7c9c4135767', './application/admin/view/setting/system_group_data/edit.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (219, 'e3bf7bb6290a10cbcdea408cde9a001b', './application/admin/view/setting/system_group_data/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (220, '75b15c251272b8536859456d31544526', './application/admin/view/setting/system_menus/edit_content.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (221, '1ae66370398117dedde9c2fe5f37f352', './application/admin/view/setting/system_menus/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (222, 'e6217329a24f1c615b2f68cc53b74d75', './application/admin/view/setting/system_notice/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (223, 'ad977c490eea2422623d78facd0ed060', './application/admin/view/setting/system_notice/message.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (224, 'c1067200b7e9a027605673e02305676d', './application/admin/view/setting/system_role/create.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (225, '5571f7c404b0514343e1ee62b60c0ee0', './application/admin/view/setting/system_role/edit.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (226, '42ac5c415d2d28564adef4137ac6ca94', './application/admin/view/setting/system_role/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (227, 'a687f4c6321e306b2c322a8f11c9713f', './application/admin/view/store/store_category/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (228, '890761ff4b5f50da42c0ba83e018d5bb', './application/admin/view/store/store_product/attr.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (229, 'f694a5f28298a06b96221f4c28a13291', './application/admin/view/store/store_product/collect.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (230, '801714ea1129374064dd3aae13b70278', './application/admin/view/store/store_product/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (231, 'd4d34e81d754ac47a0d8b5ee11b4f419', './application/admin/view/store/store_product/like.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (232, 'dc778b7b492c77768ea10b65a714c586', './application/admin/view/store/store_product/statistics.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (233, '059dddaa48fbc75ac6d9ff40d7a9cc56', './application/admin/view/store/store_product_reply/index.php', '1556518588', '1553909793', '1556518588');
INSERT INTO `eb_system_file` VALUES (234, 'ffb1fac95b54df459bf7b8f7dabb3564', './application/admin/view/system/clear/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (235, 'adf36e3685ac3d441e61093c41d9fce8', './application/admin/view/system/express/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (236, 'e0fe24e8deec38919c95b434efcbe7c9', './application/admin/view/system/system_cleardata/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (237, '00ed53f4bc61e8b2ce3cae361d6e56c3', './application/admin/view/system/system_databackup/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (238, '29b1fd2e29b4710daec0c0bd4582935e', './application/admin/view/system/system_file/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (239, '616fbdf5a273787c527731ce32f2e081', './application/admin/view/system/system_file/opendir.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (240, '9fb41b2437a50e29a5c24964833ce5c3', './application/admin/view/system/system_file/openfile.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (241, '558c601eca7f38b9e62847d2359c1784', './application/admin/view/system/system_log/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (242, 'e6217329a24f1c615b2f68cc53b74d75', './application/admin/view/system/system_notice/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (243, 'ad977c490eea2422623d78facd0ed060', './application/admin/view/system/system_notice/message.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (244, '2a28bb8a76403f9db0129467a9962783', './application/admin/view/system/system_upgradeclient/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (245, '824976ce4c0a7b9de2a921822ee4c85d', './application/admin/view/ump/store_bargain/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (246, '857f3cce5849f255267c22bb7b4643a3', './application/admin/view/ump/store_combination/attr.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (247, 'c1fd7a64ad6e4db773da7d684c2a477b', './application/admin/view/ump/store_combination/combina_list.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (248, '57deb2d24b08767118f7055ce9e5afc3', './application/admin/view/ump/store_combination/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (249, '8ee1f0aabcf46eff9ba9b8eb45d29ec5', './application/admin/view/ump/store_combination/order_pink.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (250, 'f68c65a39197b4b381165bb859ab1eb7', './application/admin/view/ump/store_coupon/grant.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (251, '326b403897a90c2363efa8d228ea3c95', './application/admin/view/ump/store_coupon/grant_all.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (252, '160562499b41d72ad1feb4778c8c0ca2', './application/admin/view/ump/store_coupon/grant_group.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (253, '2d33d9f72543b59fa31264ac1d6de9b6', './application/admin/view/ump/store_coupon/grant_subscribe.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (254, '6941569fbe6819c135bf81af1eb142d9', './application/admin/view/ump/store_coupon/grant_tag.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (255, 'efb83bf16aa54d71e1c6b3d1811491c3', './application/admin/view/ump/store_coupon/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (256, '24b32bcf733e1d64ebf86fd1798f5cdc', './application/admin/view/ump/store_coupon_issue/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (257, '0830d6bfb0cc4feda498e08629c15e1b', './application/admin/view/ump/store_coupon_issue/issue_log.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (258, '42c130e43c3040ad128eb1321acf7a0d', './application/admin/view/ump/store_coupon_user/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (259, 'c0ec195e11f78fa31435c6d0a7591187', './application/admin/view/ump/store_seckill/attr.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (260, 'bc0cad91f0f8adc9a66a968dcba3340a', './application/admin/view/ump/store_seckill/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (261, '67f41cf65618eec35852e160ee741c6c', './application/admin/view/ump/user_point/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (262, 'be514bda44dea8668ef1b0e08248fadd', './application/admin/view/user/user/group.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (263, 'dc6b8f4fe5c5c0ac5bcebe127d583730', './application/admin/view/user/user/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (264, 'be514bda44dea8668ef1b0e08248fadd', './application/admin/view/user/user/rank.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (265, '950dfaa3562c4773848f9660a94f4e24', './application/admin/view/user/user/see.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (266, '831348633e7468dc43a97d188d98eceb', './application/admin/view/user/user/user_analysis.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (267, 'b7c5693d48842ab8f9d08893d4452cc1', './application/admin/view/user/user_level/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (268, 'ab5ed797c7ad2905b46f69927c7bd9fb', './application/admin/view/user/user_notice/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (269, '5fad0ce0e4750bdfe345c627b25445b7', './application/admin/view/user/user_notice/notice.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (270, '14e02db8f07fb05d10e9e556b2353e08', './application/admin/view/user/user_notice/user.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (271, '4b6b62710941e7736dc065add02614d7', './application/admin/view/user/user_notice/user_create.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (272, '84175fe8289d9cc09150fe83b0d1cfbf', './application/admin/view/wechat/menus/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (273, 'fe805360d6392a301c462036495cea21', './application/admin/view/wechat/reply/add_keyword.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (274, 'f07d48c6924ff548e2115192f120230f', './application/admin/view/wechat/reply/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (275, '27c2d630eb6568f099b97b805f4269f4', './application/admin/view/wechat/reply/keyword.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (276, 'a63e7c2404d74cd366f55ea3449873e0', './application/admin/view/wechat/store_service/chat_list.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (277, 'b8c1c68c6566c2ed8f1413441792e796', './application/admin/view/wechat/store_service/chat_user.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (278, '6e045a63a8eb9e408968da3bdc2bbbb7', './application/admin/view/wechat/store_service/create.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (279, '2b051c4c430b9bb8a0e2d7c9c4135767', './application/admin/view/wechat/store_service/edit.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (280, '1ad7cfcdbb56242f62bb62647b2812fd', './application/admin/view/wechat/store_service/index.html', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (281, '73ccb3cbc3e0b4b59038733bb8853ec1', './application/admin/view/wechat/store_service/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (282, '5d12c36c19e1d92e0837596f0341dec9', './application/admin/view/wechat/wechat_message/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (283, '95806bbb0fe4bb42c01d24764e3cf6f6', './application/admin/view/wechat/wechat_news_category/append.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (284, '57a345e5c9a627a7f197da6fdd9fd375', './application/admin/view/wechat/wechat_news_category/create.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (285, '9b4586d130ce3e42f010940f685dc50e', './application/admin/view/wechat/wechat_news_category/edit.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (286, 'a5c34e07a6d678cce531a8d8d0c687fa', './application/admin/view/wechat/wechat_news_category/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (287, 'dcf8075991e64b5453783ad59974c61e', './application/admin/view/wechat/wechat_news_category/select.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (288, '7631dd22d2340e43f4a6ea474c7b864a', './application/admin/view/wechat/wechat_news_category/send_news.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (289, 'a664c040a6de55725de41fd8d9f94ffb', './application/admin/view/wechat/wechat_template/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (290, '5fee9b280690bc7bb267bbc4342f01d4', './application/admin/view/wechat/wechat_user/group.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (291, 'f79cb4193212a8fc7f4dd9fe78df3278', './application/admin/view/wechat/wechat_user/index.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (292, 'c32be0ba8f9eb4915d6e112382aa609a', './application/admin/view/wechat/wechat_user/now_money.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (293, 'ad38fce5e32b63ad1726ef0681b83fd1', './application/admin/view/wechat/wechat_user/stair.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (294, '8df467607664a5f62ce00898f0460882', './application/admin/view/wechat/wechat_user/tag.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (295, '2ad670719b00780838d3f22608d68307', './application/admin/view/widget/icon.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (296, '93f3e31900c8fe8a3dcb31e0fc447ffd', './application/admin/view/widget/images.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (297, '4987ced6802e64460796c1ca2e14f7f9', './application/command.php', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (298, '2bcf30919f6814907f00ea3361fc0f8b', './application/common.php', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (299, '3a5937db555277e90330e404e1af2e49', './application/config.php', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (300, '1885572402e33d83f089d638f3814ec2', './application/database.php', '1556518586', '1558599386', '1556518586');
INSERT INTO `eb_system_file` VALUES (301, '53b3b66753001151a1fad1ec6337cf90', './application/route.php', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (302, '3401b7c8a6a8cdf89ff830f3ad49192e', './application/routine/common.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (303, '1e373120fdd3ba2a00454836a5a1e462', './application/routine/config.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (304, 'b41a37344c3305e7b95fd8056919f8f7', './application/routine/controller/AuthApi.php', '1556518588', '1553183172', '1556518588');
INSERT INTO `eb_system_file` VALUES (305, '5afd6f51d29c51b48ae8ca4e5ac12ce8', './application/routine/controller/AuthController.php', '1556518588', '1553183172', '1556518588');
INSERT INTO `eb_system_file` VALUES (306, '71e2cf160e6b65ce6c6894127ae68f5d', './application/routine/controller/Logins.php', '1556518588', '1553183172', '1556518588');
INSERT INTO `eb_system_file` VALUES (307, '8a3c48ad322c68255ba1aaba7286605e', './application/routine/controller/PublicApi.php', '1556518588', '1553183172', '1556518588');
INSERT INTO `eb_system_file` VALUES (308, 'c19f0c888e49017586587470d3e6e2e0', './application/routine/controller/Routine.php', '1556518588', '1553183172', '1556518588');
INSERT INTO `eb_system_file` VALUES (309, '6717e62ba2bb8c926c7636830ba58637', './application/routine/model/article/Article.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (310, 'a6a8cebca7c32a324dbda2b0c1feb86a', './application/routine/model/article/ArticleCategory.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (311, 'd1ff91044bde867b61cdbdd3ec66761a', './application/routine/model/routine/RoutineCode.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (312, '64d55a7422de5ad2cb4f8d6969602f0c', './application/routine/model/routine/RoutineFormId.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (313, 'f0815a30af98c501dbae7f7dadf74d68', './application/routine/model/routine/RoutineQrcode.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (314, '80778d7874e08da54b7fc3ba060b9512', './application/routine/model/routine/RoutineServer.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (315, 'de57b600ad014eb217f02d2cc272c757', './application/routine/model/routine/RoutineTemplate.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (316, '93147d5afa2e5cfc101e6968c5dd5647', './application/routine/model/routine/Token.php', '1556518588', '1551437756', '1556518588');
INSERT INTO `eb_system_file` VALUES (317, '64be3c9a17b55bf357feba302e9ac8b1', './application/routine/model/store/StoreBargain.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (318, '4c6c81acffda2eace5f28c030f5b1f0d', './application/routine/model/store/StoreBargainUser.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (319, '6b03dda16a49b93a9808229cb4901fb0', './application/routine/model/store/StoreBargainUserHelp.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (320, '4a9da34f796737cb6f0531f178a0fbdb', './application/routine/model/store/StoreCart.php', '1556518588', '1553183172', '1556518588');
INSERT INTO `eb_system_file` VALUES (321, '5ee49e1a91343bc2207643a8c8055e6b', './application/routine/model/store/StoreCategory.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (322, 'd0f4faa861598fde2d462e73e1e0711f', './application/routine/model/store/StoreCombination.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (323, 'c2ed7b8da6a649785764ed95c901a592', './application/routine/model/store/StoreCoupon.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (324, '182702511eed3f83bc318a5237080f2b', './application/routine/model/store/StoreCouponIssue.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (325, 'ceac59fcac88c94e88ad7f1a6165d9e4', './application/routine/model/store/StoreCouponIssueUser.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (326, 'ad51bc62ab07891496aae206a4d339c8', './application/routine/model/store/StoreCouponUser.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (327, '398ded07ad7c1c343733840b2be67dfe', './application/routine/model/store/StoreOrder.php', '1556518588', '1553178056', '1556518588');
INSERT INTO `eb_system_file` VALUES (328, 'a520074291a62ec8557b638fa11123fc', './application/routine/model/store/StoreOrderCartInfo.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (329, 'edad8bdc18e62d69160d681c13b184e9', './application/routine/model/store/StoreOrderStatus.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (330, 'a924ee0b71d5348f2a07303dbb8d6d9a', './application/routine/model/store/StorePink.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (331, '1e6cac45d3808c4a83f0106c517856cd', './application/routine/model/store/StoreProduct.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (332, '266cd406c502fef7572481e7f25f52fa', './application/routine/model/store/StoreProductAttr.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (333, '3d8c310944f42333c32c32ac0d0c943e', './application/routine/model/store/StoreProductRelation.php', '1556518588', '1553171244', '1556518588');
INSERT INTO `eb_system_file` VALUES (334, '83d6a59739c9d847c89759cb25b871af', './application/routine/model/store/StoreProductReply.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (335, '20b1dc724269703deda250f6b8b93b26', './application/routine/model/store/StoreSeckill.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (336, 'c9db0489fb401fb5f52a338c452b4eec', './application/routine/model/store/StoreService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (337, '241bffe8be92bef5d195bd160e36c16e', './application/routine/model/store/StoreServiceLog.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (338, 'd129df35e3b0f2ed19fff0f7e1e580f3', './application/routine/model/user/RoutineUser.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (339, '678751e86ea4e83179eb2b2fb1cb4674', './application/routine/model/user/User.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (340, 'dfd018f6c7c9f90de4d3d607ab7acfde', './application/routine/model/user/UserAddress.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (341, '8acb993698e5abc54838c9095d27df56', './application/routine/model/user/UserBill.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (342, 'c6e4c53c9f77371147f953471f47f449', './application/routine/model/user/UserExtract.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (343, '10311a3e5744847a6559281db8096d9b', './application/routine/model/user/UserNotice.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (344, '103244f3fda70790278d8cd5068a9a7c', './application/routine/model/user/UserRecharge.php', '1556518589', '1553178056', '1556518589');
INSERT INTO `eb_system_file` VALUES (345, '2767e5a2a885e105b6925309a2701d5a', './application/routine/model/user/UserSign.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (346, '49893c571071d6358d2c968e7177e4dd', './application/routine/model/user/WechatUser.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (347, 'da6ca537ba8a707b940fe20def28e44a', './application/tags.php', '1556518586', '1553171244', '1556518586');
INSERT INTO `eb_system_file` VALUES (348, '46c0eca82a78874faca8118da456b38d', './application/version.php', '1556518586', '1553171792', '1556518586');
INSERT INTO `eb_system_file` VALUES (349, '466c95004805a0330cc690fc4fe4e2e5', './application/wap/common.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (350, 'd7e2c9730c8dfe3cec8ede52d23b2e8c', './application/wap/config.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (351, '3032fad5db4a4bff54ac89c69ed3a701', './application/wap/controller/Article.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (352, 'bb8077d67170ca3697c7b6e61ca4d554', './application/wap/controller/AuthApi.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (353, '92055e134228017e3a67aa44230bc69d', './application/wap/controller/AuthController.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (354, 'e1d4f123d7fcdecba9a51698b6a7eb9b', './application/wap/controller/Index.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (355, '9d31fb7423e6abf0f5adac1ad0deaf58', './application/wap/controller/Login.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (356, '8cafef333cc96213024f2c110328d90c', './application/wap/controller/My.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (357, '6958e7b844eec5c536f81b9f578e9022', './application/wap/controller/PublicApi.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (358, '97297ac94dac6dbbfe627bbad227667c', './application/wap/controller/Service.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (359, 'a7e40f5a4f0d17bbee89a68bffb5e4f2', './application/wap/controller/Store.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (360, 'dcf84d53e75673e3b6bfd877a59e1ec4', './application/wap/controller/WapBasic.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (361, 'e81c2707b9fbedb9e2b8ebcb45fcb8b3', './application/wap/controller/WapException.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (362, '6e12dbd924952728a854fa5abb4c14ee', './application/wap/controller/Wechat.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (363, '5106a642f3ced5c1d88e782df24bb4a8', './application/wap/model/store/StoreBargain.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (364, '2c444ef031ffce1a16d1e5c3cb1c0125', './application/wap/model/store/StoreBargainUser.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (365, '127dd6ef215aa22cf61b61ac0c066dee', './application/wap/model/store/StoreBargainUserHelp.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (366, 'a35ccbb917fcd41e6bdca0bf0fe86413', './application/wap/model/store/StoreCart.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (367, 'f51ea797db8ccc34829f4e1b329d19fe', './application/wap/model/store/StoreCategory.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (368, '90872dce75cb73e305b08a05f2b43090', './application/wap/model/store/StoreCombination.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (369, '31ecb93228b02310df86be0d9cb556ac', './application/wap/model/store/StoreCoupon.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (370, 'b59ea754e15617e93dc769858e5c8477', './application/wap/model/store/StoreCouponIssue.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (371, 'f40ff7468d302846d508efcd552735fe', './application/wap/model/store/StoreCouponIssueUser.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (372, '803af0988d11b11953a2771b72cd5bb0', './application/wap/model/store/StoreCouponUser.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (373, '779c3a88624dbfe465cc6a1e9ee0cff8', './application/wap/model/store/StoreOrder.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (374, '7913f2b5f05a44a326c35f08c0b38a86', './application/wap/model/store/StoreOrderCartInfo.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (375, 'a959cc0d519a37fd8fbab5c724e69b0b', './application/wap/model/store/StoreOrderStatus.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (376, '4c31b51a67b2bd72200ab8568e209653', './application/wap/model/store/StorePink.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (377, 'fa4144248a5b5a635031491608fdf388', './application/wap/model/store/StoreProduct.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (378, '05af84854c9ffb9f8ed7780c87e40194', './application/wap/model/store/StoreProductAttr.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (379, '8008406d05cfa1f5e1dcdcf24c3dfb34', './application/wap/model/store/StoreProductRelation.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (380, '13b1f5f53c8d1989aa0e711705518d63', './application/wap/model/store/StoreProductReply.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (381, 'def8f7b5580a027ab604594c281e20f1', './application/wap/model/store/StoreSeckill.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (382, 'df8314d620e2cef46c4b708b61624c09', './application/wap/model/store/StoreService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (383, '8469dba3b7ea8f19eda13b877227b79e', './application/wap/model/store/StoreServiceLog.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (384, '62c6c7081023f32804d2ad20dbc71658', './application/wap/model/user/User.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (385, 'c94f8487058738679d21c7e7d3758a8a', './application/wap/model/user/UserAddress.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (386, '335d98c4054cee2e50d31c2e2623b113', './application/wap/model/user/UserBill.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (387, 'f50b65f8f485868c830470e0d4ec729b', './application/wap/model/user/UserExtract.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (388, '544744ef99b7cd0a5ece1c10c12b08d0', './application/wap/model/user/UserNotice.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (389, 'b0e49b13a3b0e99872d02958ca5ca5e7', './application/wap/model/user/UserRecharge.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (390, '6851ae662067dbf16fa4eabee000e7c5', './application/wap/model/user/UserSign.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (391, '0ad7ae8444af9cdb68f5a9d9cdaaa151', './application/wap/model/user/WechatUser.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (392, 'ed391e67486ef98d7392ef8f99055d86', './application/wap/model/wap/ArticleCategory.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (393, 'f62e33ce617557484c63912154669efb', './application/wap/view/first/article/index.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (394, '86351da04951adb02275e4289dcbadc4', './application/wap/view/first/article/visit.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (395, '31a60eca8ee05181e1317d6f93983bf3', './application/wap/view/first/index/about.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (396, '963a5facacea9b11a1fba40230e7a473', './application/wap/view/first/index/index.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (397, '5b68d396062fedd882debb260998a387', './application/wap/view/first/index/spread.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (398, '31c4b2464d31d429161da4b2266d3568', './application/wap/view/first/login/index.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (399, 'dd679b30ef2541ed85b963c5cfd5c334', './application/wap/view/first/my/address.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (400, '43499386ddc6d600b6c61265ec585814', './application/wap/view/first/my/balance.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (401, '66e033dac849c1749e6305c5cdb9b5db', './application/wap/view/first/my/collect.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (402, '96061ac6b3f69780fa9098fda668c308', './application/wap/view/first/my/commission.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (403, '82a164dfb116716f17b5b918a9d710ba', './application/wap/view/first/my/coupon.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (404, '602ea83b6066d6af604b6eae51fa9986', './application/wap/view/first/my/edit_address.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (405, '7df304d832d96c1098f02448cb6c94cc', './application/wap/view/first/my/express.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (406, '87d07538a6940a10ff16ebba81b0575c', './application/wap/view/first/my/extract.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (407, '306e23cc511322dbe161e22af3e3d812', './application/wap/view/first/my/index.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (408, 'ad0198e6952b3b3e00d7f210ce646288', './application/wap/view/first/my/integral.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (409, 'aebbfafb4004a8daa471f6b211ef98f7', './application/wap/view/first/my/notice.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (410, '62ad39ed3be6c2c3547cf1d58388fcea', './application/wap/view/first/my/order.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (411, '5eef5b4a105ab095eaec139ce591bc96', './application/wap/view/first/my/order_customer.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (412, 'd43e3e1cd9445b96b27b8bc6b4bc9212', './application/wap/view/first/my/order_list.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (413, '884eb68a3ca189eba25d57b987fb4214', './application/wap/view/first/my/order_pink.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (414, '4540fab54a25c7bc287d151e82c6ba6d', './application/wap/view/first/my/order_pink_after.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (415, '2b12a8225c3502babab588a19c6a3994', './application/wap/view/first/my/order_reply.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (416, '66f1af7a58efa5dce2597e4244f5ae2b', './application/wap/view/first/my/sign_in.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (417, '10657df1797844f4afa91166d73f1087', './application/wap/view/first/my/spread_list.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (418, 'c62c9636681b7c27eb3a81c529eabc50', './application/wap/view/first/my/user_cut.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (419, 'bf1624663ed88f0d0f1edbd5b290598b', './application/wap/view/first/my/user_pro.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (420, '3272d9f6eedc9b111788c08e51790b79', './application/wap/view/first/public/container.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (421, '28dcbe8de5219675102312ad153003ad', './application/wap/view/first/public/error.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (422, '489dc3209e361dfb15c6da365c46dbe3', './application/wap/view/first/public/foot.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (423, '5096149c69dd7d47efc1e33fce75b1c9', './application/wap/view/first/public/head.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (424, 'ff0c46bcd29c8886f3561d54b939b187', './application/wap/view/first/public/requirejs.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (425, '34286022649a5c7805b6de76d5d06910', './application/wap/view/first/public/right_nav.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (426, '42675e0f04a53fd6a8757653dccb287c', './application/wap/view/first/public/store_menu.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (427, 'bb4fcfa99bf956f33a90877fa310f089', './application/wap/view/first/public/style.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (428, '9c1cb0ecc21631054cca8e45b7d3ffbb', './application/wap/view/first/public/success.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (429, '78737ac30b1088486d212bace5b2e86a', './application/wap/view/first/service/server_ing.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (430, '6585778504e8ede299170c7140c330d2', './application/wap/view/first/service/service_ing.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (431, 'd46827270d0175b9c3bafdaec6277160', './application/wap/view/first/service/service_list.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (432, 'b9563fa9ee9ad34a9bf35c1402ca594e', './application/wap/view/first/service/service_new.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (433, '8f3bcad53cca380b15d90a14478de850', './application/wap/view/first/store/cart.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (434, '4aeded8eedfd39b1c6a1ac5926397d9b', './application/wap/view/first/store/category.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (435, '17d26ac4978ead04ae0d22f79f60a6a7', './application/wap/view/first/store/combination.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (436, '1066b07718453d1053a63d40c6f5be79', './application/wap/view/first/store/combination_detail.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (437, 'bd316049a33630efa446b58d0b3d9955', './application/wap/view/first/store/combination_order.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (438, '4fa0b38a8761eb573c7c24868eed807b', './application/wap/view/first/store/confirm_order.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (439, 'da22e3b696384869481c7c90cea62d64', './application/wap/view/first/store/cut_con.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (440, 'b33a96dbe08bd2c0df9da9ce946d6bdf', './application/wap/view/first/store/cut_list.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (441, 'c0477a92d041b72856db44653ef0b997', './application/wap/view/first/store/detail.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (442, '2e7de70ff024ddabe156287be9d05cd4', './application/wap/view/first/store/index.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (443, '457c6061f9c32a6c9d8155099f035a97', './application/wap/view/first/store/issue_coupon.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (444, 'a6d7d2cba2f43d482e4827722fc8f4b4', './application/wap/view/first/store/reply_list.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (445, 'cb327049d3a790814b4a7250852d810d', './application/wap/view/first/store/seckill_detail.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (446, 'ff013f812d415b2037a07e529db476c4', './application/wap/view/first/store/seckill_index.html', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (447, '9c2a786af4b1fcb8feda59de6b301617', './extend/Api/Express.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (448, '24a37e5eb821b1b313282c1668f2a87c', './extend/basic/ModelBasic.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (449, '7db3eae92da2c8da650dd2ff02fc46ea', './extend/behavior/admin/CronBehavior.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (450, 'b92ac696b6b4345bcde69f088ea4068d', './extend/behavior/admin/OrderBehavior.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (451, '7dbecc190b34dd64091407d46c453c96', './extend/behavior/admin/SystemBehavior.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (452, 'a284104cd8123cbe247a3d9b830c760f', './extend/behavior/order/OrderBehavior.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (453, '75c1a20284fc3521f9794e5acdffdd28', './extend/behavior/product/ProductBehavior.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (454, 'a695668cad6aed8d75d8c859043ead54', './extend/behavior/routine/StoreProductBehavior.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (455, '557f40785e486e33114e678bf9e64b1e', './extend/behavior/user/UserBehavior.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (456, 'e970e1cc75dca71a8c3f43ffb4be2363', './extend/behavior/wap/StoreProductBehavior.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (457, '5a735cbda80e165569830a7d998072d7', './extend/behavior/wap/WapBehavior.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (458, '7f4fe202e13fb6598d4646ce63cc3986', './extend/behavior/wechat/MaterialBehavior.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (459, 'bb66bb2b173b706db150ad5acf95d2bb', './extend/behavior/wechat/MessageBehavior.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (460, '5a57d8ce885ca9f306bfac50cdfbc827', './extend/behavior/wechat/PaymentBehavior.php', '1556518589', '1553174442', '1556518589');
INSERT INTO `eb_system_file` VALUES (461, '8858b28e0660f5b02e041afd88aff26e', './extend/behavior/wechat/QrcodeEventBehavior.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (462, '516457fcbd7afd994a6a8e22eceab9a5', './extend/behavior/wechat/UserBehavior.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (463, 'df5dc2ba1bb5ad014bfb6086179eaa5e', './extend/service/CacheService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (464, 'f31062636fca3a2a7a8d4732f6661fe8', './extend/service/cron/ManagesFrequencies.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (465, 'ba7a300d571e902f750eeb76455a8e7b', './extend/service/cron/Task.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (466, '678c41301f3fdb08157457ddee1ed938', './extend/service/ExportService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (467, '43166bdba1218c47b33f0ce45ef06fcd', './extend/service/FileService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (468, '9944fa040a5589ad45b54f02a66a0c1a', './extend/service/FormBuilder.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (469, 'b19e9707b9243893d93ce310de06a31f', './extend/service/GroupDataService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (470, '3e17941e4d3477ccc550fcdb0715262b', './extend/service/HookService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (471, 'b3de8a7a3914129935be454bad9bf61b', './extend/service/HttpService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (472, '7d5b481bc38aa01253f421d406a716d8', './extend/service/JsonService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (473, '33e73d151eff3cf8ad860ed4be1b656c', './extend/service/MiniProgramService.php', '1556518589', '1553178056', '1556518589');
INSERT INTO `eb_system_file` VALUES (474, 'e56917c9aa1c601e8a9aa8f528b85001', './extend/service/PHPExcelService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (475, 'f6bbd1ca47268063abfbcb04fbb38b75', './extend/service/PHPTreeService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (476, 'bc4a9520aecc904e1c877f1bbae4f897', './extend/service/ProgramTemplateService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (477, 'a496ef8510844d552695b6d1ad1aa8ce', './extend/service/QrcodeService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (478, 'd48a6ce70257741cc8c648104ef3edb0', './extend/service/RoutineTemplateService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (479, '87d23b25e2bb46193a0ae3c16a02d70d', './extend/service/SystemConfigService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (480, '02ecad7406eb90fca52c63ea0aa32e06', './extend/service/TokenService.php', '1556518589', '1551496234', '1556518589');
INSERT INTO `eb_system_file` VALUES (481, 'ab696a7c393746e259fc17d3eb4adae3', './extend/service/UpgradeService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (482, 'd3e2d3f17dfa80174877f2403e2adb49', './extend/service/UploadService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (483, 'b8be318a18b05c4a36ced2f495e4a3a6', './extend/service/UtilService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (484, '087b11f0ec1e25b13424bdc34254726e', './extend/service/WechatService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (485, 'd062d3ae267c4848e6e569fe73683098', './extend/service/WechatTemplateService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (486, 'e31c176b4a9d7bfcee48243fc7c6596a', './extend/service/WxpayService.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (487, '59cfcbc9a9ba5218a5cfbd50224d817c', './extend/service/WxpayServiceNotify.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (488, '518322553562def06262e9cbbb2785a8', './extend/traits/CurdControllerTrait.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (489, '3f83232968343d6ba38523934aa9ff2b', './extend/traits/ModelTrait.php', '1556518589', '1553171244', '1556518589');
INSERT INTO `eb_system_file` VALUES (490, 'e0c365f6cdfe1a6b46b27544d2345c4c', './public/install/auto.php', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (491, '02532020c5cf4a582cdb3be9a8c58d9c', './public/install/config.php', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (492, '8dbe1ff7a12a7457d46c871113aa56ac', './public/install/crmeb.sql', '1556518589', '1553246142', '1556518589');
INSERT INTO `eb_system_file` VALUES (493, '2fe219d961072bcc6c0b28e2e30d7505', './public/install/css/install.css', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (494, 'ed011ca573fc251207f75ae3b4264874', './public/install/images/install/bg.png', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (495, '4db9bb61aae1830c9df12178e841dff4', './public/install/images/install/btn.png', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (496, '225e0281ce53bc6f7dc0bf3e219919ef', './public/install/images/install/complete.png', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (497, 'af419c0ea3a875fdfb2fc30f25c10b24', './public/install/images/install/header.png', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (498, 'f92efe7ae29cebe990c0eff3a5e7fed6', './public/install/images/install/icon.png', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (499, '5e4f282420c37efe7632ac32b0455456', './public/install/images/install/icon_install.png', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (500, '9e96ae8c531f6ae36914ac6c69eb23db', './public/install/images/install/ignore.png', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (501, '05235af1889d21cd47ed3fbf8cced673', './public/install/images/install/loading.gif', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (502, '04a56605b3d296b86ac671355b5163c0', './public/install/images/install/logo.png', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (503, 'b066c981ba7a969ad363fdf7121e56f3', './public/install/images/install/pop_loading.gif', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (504, 'b29320148298f2e0e870c568d88d9f23', './public/install/images/install/step.png', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (505, '0e5c3e6ab0d1b334cbfc60dbc7f445ad', './public/install/images/install/tab.png', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (506, '2b040ff55fbf3902cab28e02e69f66d5', './public/install/images/install/tips_system.png', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (507, 'd3a8afd4a4a732b189cf1152d7cd82f5', './public/install/index.php', '1556518589', '1547629346', '1556518589');
INSERT INTO `eb_system_file` VALUES (508, '5e9be4c459afa8af1b00492ab00eb0bb', './public/install/index_sae.php', '1556518589', '1547629606', '1556518589');
INSERT INTO `eb_system_file` VALUES (509, 'd41d8cd98f00b204e9800998ecf8427e', './public/install/install.lock', '1558599388', '1558599388', '1558599388');
INSERT INTO `eb_system_file` VALUES (510, '9e1559e2cfefa340386fb4c0603b2b54', './public/install/js/ajaxForm.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (511, 'e1a1b01a12659ff6530a5b8f2dbb18f8', './public/install/js/jquery.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (512, 'a666f0d5a5dcf434c5e3854c9ca45557', './public/install/js/validate.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (513, 'c40432f74f236f6ed927800011531c04', './public/install/templates/footer.php', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (514, 'e5678601b8dfe736446eb4c181b34e5b', './public/install/templates/header.php', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (515, '9fc167ff7ae07e6e203f5a12e7fe498a', './public/install/templates/s2_sae.php', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (516, 'd4647ffa2bd7d4cc9820211b3da8d4c7', './public/install/templates/s3_sae.php', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (517, '6d4f3ba3100b4536d462bd143bedb230', './public/install/templates/step1.php', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (518, '5e2a56ffcb11cebcdb82a4e3737f7538', './public/install/templates/step2.php', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (519, '84516d03189984931567f9173e4de433', './public/install/templates/step3.php', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (520, '8303e268270720065b215dd7ac72af8b', './public/install/templates/step4.php', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (521, '19d09e6378648f40befdf2256844cece', './public/install/templates/step5.php', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (522, '57db4a2811f951ff841fb4f77220d95b', './public/static/css/animate.css', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (523, 'e3fddf7b1b142f4a3480b15000fc993e', './public/static/css/reset.css', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (524, '5104cc8f061e2aa79064dc15c8f545f6', './public/static/font/simsunb.ttf', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (525, '524e37e86d1add9491b552e36cb66fe3', './public/static/js/media.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (526, '8d9289aedbe96521f2f8123b9ea92068', './public/static/plug/axios.min.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (527, 'aee4e5aafca0f5c26c352c3d6e69b20a', './public/static/plug/basket.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (528, 'cf2786de75573240473e4e56cef443f8', './public/static/plug/better-scroll.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (529, 'e034abd50a709532545aa63aae481bf8', './public/static/plug/censorwords/CensorWords', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (530, 'eec074113b5a647d6458fe6d665bbf1a', './public/static/plug/city.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (531, '733a2a36978372bc90ecc3c4b6fc9f31', './public/static/plug/codemirror/.editorconfig', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (532, '544ff857f524a2c045c9c29818699e3d', './public/static/plug/codemirror/.gitattributes', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (533, 'a3020b004f55d28588caeaae33d49257', './public/static/plug/codemirror/.npmignore', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (534, '7285daa0c417159a95ec3efa6bbf5447', './public/static/plug/codemirror/.travis.yml', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (535, 'f2798285cd723a94866088997228accc', './public/static/plug/codemirror/addon/comment/comment.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (536, '0a12cad387a0dfd12c8c4dacca757d89', './public/static/plug/codemirror/addon/comment/continuecomment.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (537, 'c89dce10b44d2882a024e7befc2b63f5', './public/static/plug/codemirror/addon/dialog/dialog.css', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (538, '904554fefae1a2beb0eaad467018af7a', './public/static/plug/codemirror/addon/dialog/dialog.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (539, 'a8525e557b32a9ff330db311f444058b', './public/static/plug/codemirror/addon/display/autorefresh.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (540, '1a278e72b51528270f8ce9ec991929a1', './public/static/plug/codemirror/addon/display/fullscreen.css', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (541, '744a9a476b90075936f58ebb8b35ac85', './public/static/plug/codemirror/addon/display/fullscreen.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (542, '45aa4eb1759d95e5169397df11a0cd79', './public/static/plug/codemirror/addon/display/panel.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (543, '6beb24df305342edfd89beef0d0cdb5b', './public/static/plug/codemirror/addon/display/placeholder.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (544, '38aaf61e611edfe39883f46f89b0b91b', './public/static/plug/codemirror/addon/display/rulers.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (545, '6848096e6f57219ddd24e59a161f3e5d', './public/static/plug/codemirror/addon/edit/closebrackets.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (546, '58984b3d2c576527b8e379bd0e27a913', './public/static/plug/codemirror/addon/edit/closetag.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (547, '017f0b5ac312a4364f933ddad56f9a67', './public/static/plug/codemirror/addon/edit/continuelist.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (548, '042ca51700be14dad58d1bbff86f6fb2', './public/static/plug/codemirror/addon/edit/matchbrackets.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (549, 'd0c67185e94d3a096299b680c0fca7d6', './public/static/plug/codemirror/addon/edit/matchtags.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (550, '81d50700cee8c27e0e311de3650851bc', './public/static/plug/codemirror/addon/edit/trailingspace.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (551, '3de05ee171c9149b5b9c6d11fb9b3a2a', './public/static/plug/codemirror/addon/fold/brace-fold.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (552, '9b289797886789d2ce7f40e3f7408c9e', './public/static/plug/codemirror/addon/fold/comment-fold.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (553, '67922ad2e2c384c5455bfcacdec393d8', './public/static/plug/codemirror/addon/fold/foldcode.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (554, '38bb68770b6f7ebaa7adea770a68e0b1', './public/static/plug/codemirror/addon/fold/foldgutter.css', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (555, '5ecd1da75719305b19f3485afb336e61', './public/static/plug/codemirror/addon/fold/foldgutter.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (556, '5017f49481f30946bd4229a6d05d5fcc', './public/static/plug/codemirror/addon/fold/indent-fold.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (557, '6e3228db96bbadbb93c79922ecd88ce0', './public/static/plug/codemirror/addon/fold/markdown-fold.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (558, 'b88e73a8e7bdc8b032adfd5047dfe2c5', './public/static/plug/codemirror/addon/fold/xml-fold.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (559, '736f4c0aa67db12cf39097f3d1790c8b', './public/static/plug/codemirror/addon/hint/anyword-hint.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (560, '4958c441a7cdf2d39fa6c8bd4b340168', './public/static/plug/codemirror/addon/hint/css-hint.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (561, '320dfd7c5dc5d4a533546b9849c67a82', './public/static/plug/codemirror/addon/hint/html-hint.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (562, 'fe11e9d0e373480aa61af6ae86c04dc1', './public/static/plug/codemirror/addon/hint/javascript-hint.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (563, '49647712414ff96d5846de9736b5dbd3', './public/static/plug/codemirror/addon/hint/show-hint.css', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (564, 'a41afe5313058917305325448e7103e5', './public/static/plug/codemirror/addon/hint/show-hint.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (565, '3c959b2a76fb7308bef72f03509b5c27', './public/static/plug/codemirror/addon/hint/sql-hint.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (566, '966403b2e6b25b8b331b4bbdf80c2128', './public/static/plug/codemirror/addon/hint/xml-hint.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (567, '140f1a44841627e860cafd955e89f4e7', './public/static/plug/codemirror/addon/lint/coffeescript-lint.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (568, '6a6166008cb94a6d62e05dc2cab7fc16', './public/static/plug/codemirror/addon/lint/css-lint.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (569, '66b4a9fe2decb727352659f284b47979', './public/static/plug/codemirror/addon/lint/html-lint.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (570, '3db1c5d6629bde3e0a4a694c5cd94065', './public/static/plug/codemirror/addon/lint/javascript-lint.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (571, 'dcfd194ca63e175996aaea2b3a58b598', './public/static/plug/codemirror/addon/lint/json-lint.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (572, '80cbf240f7114fb23e506da29cced118', './public/static/plug/codemirror/addon/lint/lint.css', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (573, '16098bd4d5e62f123cbc4482622e1360', './public/static/plug/codemirror/addon/lint/lint.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (574, '84ee835b2141e1e516e2e0b280e88016', './public/static/plug/codemirror/addon/lint/yaml-lint.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (575, 'd4009e57cbbb2c969147cf233671ba42', './public/static/plug/codemirror/addon/merge/merge.css', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (576, 'a56330aaa4f2c6631da6b4a20f4984a5', './public/static/plug/codemirror/addon/merge/merge.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (577, 'f8291cb1ca96e29af58def213012655a', './public/static/plug/codemirror/addon/mode/loadmode.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (578, '37d00d46056f28be752e7a928cec95d2', './public/static/plug/codemirror/addon/mode/multiplex.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (579, '37963861dd6e41a530a6f84c2b17bdf7', './public/static/plug/codemirror/addon/mode/multiplex_test.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (580, 'fd12c2920c8e7c6fdeae351a058d995a', './public/static/plug/codemirror/addon/mode/overlay.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (581, 'eed15e8b955aaee880af0c819b38fa25', './public/static/plug/codemirror/addon/mode/simple.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (582, 'c8fb49ed714798e04bc3d0289b19efa4', './public/static/plug/codemirror/addon/runmode/colorize.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (583, 'aa4a42bca69b6f096a18cd51203afe6e', './public/static/plug/codemirror/addon/runmode/runmode-standalone.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (584, '2c0ddde09a9f1f8f5dc9d4f67f03d2f2', './public/static/plug/codemirror/addon/runmode/runmode.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (585, 'f3c8c9b85bbeecf3c873e52d3783f39b', './public/static/plug/codemirror/addon/runmode/runmode.node.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (586, 'cb2089f354bfc743441b8d59b8569f8f', './public/static/plug/codemirror/addon/scroll/annotatescrollbar.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (587, '92a24e9251be0dc620c11cb61919293f', './public/static/plug/codemirror/addon/scroll/scrollpastend.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (588, '0352ba51fd6a422fe6cc44925e33ad88', './public/static/plug/codemirror/addon/scroll/simplescrollbars.css', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (589, '13948e6ef35e3c3d2c65de096af58721', './public/static/plug/codemirror/addon/scroll/simplescrollbars.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (590, 'cf5f2c65e9c8e26841923b5e1a6bf611', './public/static/plug/codemirror/addon/search/jump-to-line.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (591, 'ace658d3aaf9d8ae9895ff97dd9eb5ca', './public/static/plug/codemirror/addon/search/match-highlighter.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (592, '00ea2770c568a848190bcf52e4241276', './public/static/plug/codemirror/addon/search/matchesonscrollbar.css', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (593, 'ab8776842d1b350422be6e1b42c8e556', './public/static/plug/codemirror/addon/search/matchesonscrollbar.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (594, 'e9998c0f1d576a8ee6a6b0e555fe1e00', './public/static/plug/codemirror/addon/search/search.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (595, 'fa73eef9cf913ee2d766c8501a582a0c', './public/static/plug/codemirror/addon/search/searchcursor.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (596, '30fc5d6c1847dc207bd0e38c0e97e789', './public/static/plug/codemirror/addon/selection/active-line.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (597, 'c0240b66ae29bda93e80be5e60c9ed8d', './public/static/plug/codemirror/addon/selection/mark-selection.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (598, 'ae80c5e4d54f8ccb07c6373e66f523a4', './public/static/plug/codemirror/addon/selection/selection-pointer.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (599, '4d57ced774b5f3fa9f00dfa398e74819', './public/static/plug/codemirror/addon/tern/tern.css', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (600, 'f6c76d9ec32faccbb8cf23b7a2f6f917', './public/static/plug/codemirror/addon/tern/tern.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (601, '6866b3b6f236f5ae8b89e15b5cf167e1', './public/static/plug/codemirror/addon/tern/worker.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (602, '359a2bb5a43f724a09f2adbbfe40dd86', './public/static/plug/codemirror/addon/wrap/hardwrap.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (603, 'bd1870d245c90a03e2c10d0a259ccc72', './public/static/plug/codemirror/AUTHORS', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (604, '56b0d674ed75017935dde2b6a5a88324', './public/static/plug/codemirror/bin/authors.sh', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (605, '49efb3a1478867dd56c341d5f64ad6b4', './public/static/plug/codemirror/bin/lint', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (606, '5af919f1fcc82328a93359a2123b9d16', './public/static/plug/codemirror/bin/release', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (607, '9c4c70a8000fbe8ae0b0d347ea57460d', './public/static/plug/codemirror/bin/source-highlight', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (608, '0d3f2b446e607ac5e525617b8b691396', './public/static/plug/codemirror/bin/upload-release.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (609, '478cc2fdb46cf369f3533b9abcb97b37', './public/static/plug/codemirror/CHANGELOG.md', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (610, '1d32dc87a4f60089d1cc3b2d4f66f006', './public/static/plug/codemirror/CONTRIBUTING.md', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (611, '6341a12dce640c1e6477af4ede57b1b7', './public/static/plug/codemirror/demo/activeline.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (612, 'b65966203280295504f44118592bdf00', './public/static/plug/codemirror/demo/anywordhint.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (613, '6563279179170a629861f5e6dd7d5148', './public/static/plug/codemirror/demo/bidi.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (614, '49da77e34d7ad6b8835927be141b4b53', './public/static/plug/codemirror/demo/btree.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (615, '8e59e28093d6809ff1cd101496070f93', './public/static/plug/codemirror/demo/buffers.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (616, '3c1ee93df60e35b5fc84a228c0ee0179', './public/static/plug/codemirror/demo/changemode.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (617, 'bac6a68371706678906121862c49acfd', './public/static/plug/codemirror/demo/closebrackets.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (618, '6dc8c9928afa0a53d37806318a30cd46', './public/static/plug/codemirror/demo/closetag.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (619, '10fee55e5b5bb5d8dfdbed9a4fa92af9', './public/static/plug/codemirror/demo/complete.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (620, '4107d3b11ccfb6550597d087f925de11', './public/static/plug/codemirror/demo/emacs.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (621, '49e28939284c47dcdbf30c8924a3edcd', './public/static/plug/codemirror/demo/folding.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (622, '423860421d3568c9fb5322eab3c8fd95', './public/static/plug/codemirror/demo/fullscreen.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (623, 'e267cbd61a44098d1c8ae95c04a3718b', './public/static/plug/codemirror/demo/hardwrap.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (624, '165a9aff1b8da84cc174949039000476', './public/static/plug/codemirror/demo/html5complete.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (625, 'fcc75405835169f3fb87703cd728b3d9', './public/static/plug/codemirror/demo/indentwrap.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (626, '118c2ee1abf46d2c3510f650396168c7', './public/static/plug/codemirror/demo/lint.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (627, 'fb979269e4bae0d85e38cae3f358c8d1', './public/static/plug/codemirror/demo/loadmode.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (628, '314a4e8c9f33d6a061dd8839f3803550', './public/static/plug/codemirror/demo/marker.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (629, '27188a2a2574bddc89ed0082cf11e683', './public/static/plug/codemirror/demo/markselection.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (630, '233396146d4c8571f7f12f8da6582bbe', './public/static/plug/codemirror/demo/matchhighlighter.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (631, '9ab4ee94a5a574a56ef8d6c32900492d', './public/static/plug/codemirror/demo/matchtags.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (632, 'd075182e4d03f07ece0a7a053db26be9', './public/static/plug/codemirror/demo/merge.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (633, '244a46398e55ba75f5889b858715937d', './public/static/plug/codemirror/demo/multiplex.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (634, '9454effa6788eaca1867d02335d63add', './public/static/plug/codemirror/demo/mustache.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (635, 'dbc19c876d2e8db5eb31cc4beec36525', './public/static/plug/codemirror/demo/panel.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (636, '2b624f3d885c074e4b2ee994ff5d6aae', './public/static/plug/codemirror/demo/placeholder.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (637, '4a4047a4225a771a16bb74f260cb768c', './public/static/plug/codemirror/demo/preview.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (638, 'c17bd02cf88e7fd857536645170a5017', './public/static/plug/codemirror/demo/requirejs.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (639, '19f18a8603b442bd0bf477ad550857d3', './public/static/plug/codemirror/demo/resize.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (640, '21a0fd30e1a13e42f522007ff6e61a32', './public/static/plug/codemirror/demo/rulers.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (641, '1579cc442fdbc48e0a94bc22b98bcb48', './public/static/plug/codemirror/demo/runmode.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (642, '14b0b1bdfcb732140c52ab48de43be32', './public/static/plug/codemirror/demo/search.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (643, '1e7d7d13c089e9b85176e9da3390ce2a', './public/static/plug/codemirror/demo/simplemode.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (644, 'c85ce58490c1f42d0d4245c8731a6a7e', './public/static/plug/codemirror/demo/simplescrollbars.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (645, '89954638de8ac75538e13ca89922487c', './public/static/plug/codemirror/demo/spanaffectswrapping_shim.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (646, '678bc984065fdabea5d23ebe9ba86f06', './public/static/plug/codemirror/demo/sublime.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (647, '3f40627425713c9ec2b098ed291d02a8', './public/static/plug/codemirror/demo/tern.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (648, '76a419ddfc356b7dd0cbec16a1680ced', './public/static/plug/codemirror/demo/theme.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (649, 'd079eaa7cc6d036bc2ed567479e34114', './public/static/plug/codemirror/demo/trailingspace.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (650, 'cc4acbbbfb0e202f44c847136a296422', './public/static/plug/codemirror/demo/variableheight.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (651, '599c0fe37fe86b7fad693fa1e1540b5d', './public/static/plug/codemirror/demo/vim.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (652, 'ca3933b31f0d9766229f8c24bbb61f79', './public/static/plug/codemirror/demo/visibletabs.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (653, '3e8caebe4984cd824cfa7aaf17571973', './public/static/plug/codemirror/demo/widget.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (654, 'b258ab24c2d299a9245ef857003589ff', './public/static/plug/codemirror/demo/xmlcomplete.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (655, 'f04e4f35c9fdb825daf1cffecd58b721', './public/static/plug/codemirror/doc/activebookmark.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (656, 'dca241da3455127b3932f0ec750f536c', './public/static/plug/codemirror/doc/docs.css', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (657, 'c795bfb11d5d9c26ffa5717ec58a1ed5', './public/static/plug/codemirror/doc/internals.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (658, 'f824dab41f1b8c60a38187f0dfa70d53', './public/static/plug/codemirror/doc/logo.png', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (659, 'be0559d72d6bfbce6c5d0f2a0649425e', './public/static/plug/codemirror/doc/logo.svg', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (660, '9b6903e5d08c62b3c1b88eb11824ca6d', './public/static/plug/codemirror/doc/manual.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (661, '7525a1e1a67b291b324cea33ec48b874', './public/static/plug/codemirror/doc/realworld.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (662, '3edfae292df41cf2e83607aedc2ec1ba', './public/static/plug/codemirror/doc/releases.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (663, 'eff9cb840f6a20e87008e8f98bb7bfdc', './public/static/plug/codemirror/doc/reporting.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (664, 'd8f1995ec6e43b10bee58d857759d67c', './public/static/plug/codemirror/doc/upgrade_v2.2.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (665, '3f53c21e5ec090395d45c25b06f0f206', './public/static/plug/codemirror/doc/upgrade_v3.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (666, '298d962d5596506f5b9aab6127eaf6fe', './public/static/plug/codemirror/doc/upgrade_v4.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (667, 'd1f5f5a1431fab99626bfdcc5f8f4229', './public/static/plug/codemirror/doc/yinyang.png', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (668, '96c45c87b5d1e6f6e4f9809d70494a75', './public/static/plug/codemirror/index.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (669, 'ce7e34c1f98879c1e45c12d7395c1dc8', './public/static/plug/codemirror/keymap/emacs.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (670, '7da7733bea6c792607d9cfee1b0ecfa9', './public/static/plug/codemirror/keymap/sublime.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (671, 'dd244663df54510a927480a04e90c5ad', './public/static/plug/codemirror/keymap/vim.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (672, '288352df06a67ee35003b0981da414ac', './public/static/plug/codemirror/lib/codemirror.css', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (673, 'a769a1bfaaaeaded9e47cb6330711d70', './public/static/plug/codemirror/lib/codemirror.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (674, '8554e1ee437cc3fb3cfee9ad4a11b8ab', './public/static/plug/codemirror/LICENSE', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (675, 'd7cbcce7ff7c5fff33a5e8a54ff7d47b', './public/static/plug/codemirror/mode/apl/apl.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (676, '4e9256e9c5c9d9e643ad5f056efdf2d2', './public/static/plug/codemirror/mode/apl/index.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (677, 'eb55333e89f85097bc8bcfa81c9ab964', './public/static/plug/codemirror/mode/asciiarmor/asciiarmor.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (678, '5af8b663d8a39d232f911c8c7a357c36', './public/static/plug/codemirror/mode/asciiarmor/index.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (679, '1dbd516b7e2442881eaa3a5623e12edd', './public/static/plug/codemirror/mode/asn.1/asn.1.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (680, '9b07d41c1353a20324a9ce99c24f7881', './public/static/plug/codemirror/mode/asn.1/index.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (681, 'd43e083b3de9db562530a7146eb671d4', './public/static/plug/codemirror/mode/asterisk/asterisk.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (682, 'ab8a2ee49c4aeb1000c8282762d28ee0', './public/static/plug/codemirror/mode/asterisk/index.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (683, '79a74e59c62be8da0bfa4363e206deca', './public/static/plug/codemirror/mode/brainfuck/brainfuck.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (684, 'df941d2229e452d1a936387e9fbe25b4', './public/static/plug/codemirror/mode/brainfuck/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (685, 'a846011fd030d3a6a39c9ec90c4fdd28', './public/static/plug/codemirror/mode/clike/clike.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (686, '19e303541c64e8979435fe355c85bdb6', './public/static/plug/codemirror/mode/clike/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (687, 'cc3825cb95908e83a64ae1494e4493f3', './public/static/plug/codemirror/mode/clike/scala.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (688, '782d362860a34e8a97a66d0962ed6e0d', './public/static/plug/codemirror/mode/clike/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (689, 'fb6c9ba4c1fee574640d06cd4747a0d2', './public/static/plug/codemirror/mode/clojure/clojure.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (690, '1dc90d8f12f82179578d15c89bb8f61a', './public/static/plug/codemirror/mode/clojure/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (691, 'b745c1fdca68cb0e607ec6727c3766c7', './public/static/plug/codemirror/mode/clojure/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (692, '57b16ee4ada3e31f53f201e868ece4a8', './public/static/plug/codemirror/mode/cmake/cmake.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (693, 'e6bf8c218afb857c275e8848d18b317a', './public/static/plug/codemirror/mode/cmake/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (694, '8c768a22236e0138045ed89799a93d61', './public/static/plug/codemirror/mode/cobol/cobol.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (695, 'e51c715931bb1c513fa2f17c10e94124', './public/static/plug/codemirror/mode/cobol/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (696, 'dfa749e618ff05efb6e50ae7883adfaf', './public/static/plug/codemirror/mode/coffeescript/coffeescript.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (697, '5ac1b4997c0b9c592c7a126300d36266', './public/static/plug/codemirror/mode/coffeescript/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (698, '748ed4c3f785fa4b87b04f0e0b3959d4', './public/static/plug/codemirror/mode/commonlisp/commonlisp.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (699, '03fe4f20e44833c393219be102efe5e1', './public/static/plug/codemirror/mode/commonlisp/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (700, 'cf4149518f2b93ed28cf6a828f6c9d1e', './public/static/plug/codemirror/mode/crystal/crystal.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (701, '8a959a82d1c1902a21828892c74a95b5', './public/static/plug/codemirror/mode/crystal/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (702, '917c028a5251c851fc8b6a26ce378465', './public/static/plug/codemirror/mode/css/css.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (703, '6abf83adb94ac71aae4a6ad3b9ca7b63', './public/static/plug/codemirror/mode/css/gss.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (704, '7f155ac871433e686811f1b7b7e50e20', './public/static/plug/codemirror/mode/css/gss_test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (705, 'b9f6b2c60c3768b60d05652551bd29a2', './public/static/plug/codemirror/mode/css/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (706, '29cc54a417c60932bd28cd624e68e6ee', './public/static/plug/codemirror/mode/css/less.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (707, '7e8722da6d3398157e2f4a59e1908724', './public/static/plug/codemirror/mode/css/less_test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (708, '96820136cb859f58ba7d8bb960041905', './public/static/plug/codemirror/mode/css/scss.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (709, 'd478330f8997324e05ba086885e33521', './public/static/plug/codemirror/mode/css/scss_test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (710, '858611370a3f4a9b5e6f828a0e6575a3', './public/static/plug/codemirror/mode/css/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (711, 'e654dbe937edd096bbdf5d3295f3c45b', './public/static/plug/codemirror/mode/cypher/cypher.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (712, '0615968ff8918e200658ec45c75ff1e5', './public/static/plug/codemirror/mode/cypher/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (713, 'fbd1ff92e8a173045e2d1765e6646bc3', './public/static/plug/codemirror/mode/cypher/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (714, '6c55c39bdda23bbdac0e474b5940ea4b', './public/static/plug/codemirror/mode/d/d.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (715, 'c5a1c6c19797268255e33ede88511ca0', './public/static/plug/codemirror/mode/d/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (716, 'dd29d1c65c916e4c2f38a82e323108d3', './public/static/plug/codemirror/mode/d/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (717, '73ca553fc5006adf6a5d6bb417f1e8e4', './public/static/plug/codemirror/mode/dart/dart.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (718, '448ba49a13e04b48e249fe045bffbdf2', './public/static/plug/codemirror/mode/dart/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (719, '4a24c3a0fab0170ad3b43801b5419700', './public/static/plug/codemirror/mode/diff/diff.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (720, 'b6d85f754f366e00acf30b3133b245fb', './public/static/plug/codemirror/mode/diff/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (721, '1f660d46bb1ddb833b87fd6189abb4f4', './public/static/plug/codemirror/mode/django/django.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (722, 'a8e05c1c569892f31b83c3364b4bec62', './public/static/plug/codemirror/mode/django/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (723, 'f760b649b086deb82110f93dd3eae166', './public/static/plug/codemirror/mode/dockerfile/dockerfile.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (724, 'b76d57d9841a58703d5d2310016cfbb4', './public/static/plug/codemirror/mode/dockerfile/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (725, '9299aa49db961cce058ace71b3236402', './public/static/plug/codemirror/mode/dockerfile/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (726, '32baa895a1df1fa2fc2eb3062f816b25', './public/static/plug/codemirror/mode/dtd/dtd.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (727, 'adaa96b0d7b96a412882b38c6833d4ff', './public/static/plug/codemirror/mode/dtd/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (728, '6426d9ef2266586cd2353edb64593bba', './public/static/plug/codemirror/mode/dylan/dylan.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (729, '96b387ab887577fe9b22f8cec9a760fe', './public/static/plug/codemirror/mode/dylan/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (730, 'ac590a4d493aac0a36326a2ce4ed3a4c', './public/static/plug/codemirror/mode/dylan/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (731, '9a347cbe64f009d62a3a0189fe209321', './public/static/plug/codemirror/mode/ebnf/ebnf.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (732, 'cef487170fa9203104607b93fe3bb80f', './public/static/plug/codemirror/mode/ebnf/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (733, 'c7abe57f6fd714f061681c5cce5c58d6', './public/static/plug/codemirror/mode/ecl/ecl.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (734, '9da2f081326b264397d3ac0cb0c8ed12', './public/static/plug/codemirror/mode/ecl/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (735, '7f937e01339a793003b83da8ec77be4f', './public/static/plug/codemirror/mode/eiffel/eiffel.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (736, '77e267007b9129cc81099261338bea29', './public/static/plug/codemirror/mode/eiffel/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (737, '62e0f22378987f26cd338f54659bce20', './public/static/plug/codemirror/mode/elm/elm.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (738, 'be9e3bc9fbc3406def9850600804e9e8', './public/static/plug/codemirror/mode/elm/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (739, '57dbbd56d4e6768927deee9a81fa3a4d', './public/static/plug/codemirror/mode/erlang/erlang.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (740, 'a21111d28eb6c1729073069293acf5ba', './public/static/plug/codemirror/mode/erlang/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (741, '6df263b9e9315008f7c0287af5cd457b', './public/static/plug/codemirror/mode/factor/factor.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (742, '48c5906ba741a502f31db3ff513661c5', './public/static/plug/codemirror/mode/factor/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (743, 'b5949770e3c1e433f5fad87c42095632', './public/static/plug/codemirror/mode/fcl/fcl.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (744, '54685dea3b613a7b8e8e24534dad12d7', './public/static/plug/codemirror/mode/fcl/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (745, '8510f1145a1b153c316f0606e1ad374c', './public/static/plug/codemirror/mode/forth/forth.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (746, '84daa9c353690724a9134211c2ab0c03', './public/static/plug/codemirror/mode/forth/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (747, 'a08f5fda6468965a4704248792f9c246', './public/static/plug/codemirror/mode/fortran/fortran.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (748, 'd2029c3ddeeea27320def8b2e653b913', './public/static/plug/codemirror/mode/fortran/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (749, 'be838d4517f34541abf4fab9ac093769', './public/static/plug/codemirror/mode/gas/gas.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (750, '9c056790d33cde27a0876da3c7dddd3f', './public/static/plug/codemirror/mode/gas/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (751, '11b5a43c797f117e29475c8d6e3afd98', './public/static/plug/codemirror/mode/gfm/gfm.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (752, 'f310a2e6785496c97831ac89ef66257e', './public/static/plug/codemirror/mode/gfm/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (753, 'f6567735f19262fc3c94848723b261cd', './public/static/plug/codemirror/mode/gfm/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (754, '9667b1bfd1fc9eca1301ecb53645836b', './public/static/plug/codemirror/mode/gherkin/gherkin.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (755, 'a925ae26d1e2109143e380483f521591', './public/static/plug/codemirror/mode/gherkin/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (756, 'e24980e5c7fc0bf42cc8036e0731aa1b', './public/static/plug/codemirror/mode/go/go.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (757, '077e6e2640ad00ebe4531ca05f5c5172', './public/static/plug/codemirror/mode/go/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (758, 'd580e158ca156e28c332eaf2c071862c', './public/static/plug/codemirror/mode/groovy/groovy.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (759, '1e0cc6008b8409142bd4098146b93fda', './public/static/plug/codemirror/mode/groovy/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (760, '9b60803a8156805884feea94a8a5060f', './public/static/plug/codemirror/mode/haml/haml.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (761, 'ea9f703271a18321fab1a59128894838', './public/static/plug/codemirror/mode/haml/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (762, '62a27f480e18436cc1356b17ea5f4b36', './public/static/plug/codemirror/mode/haml/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (763, 'bd9ed903773517027616a489fcde3a17', './public/static/plug/codemirror/mode/handlebars/handlebars.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (764, '4cff692710515eb50bd616d5bf1b7402', './public/static/plug/codemirror/mode/handlebars/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (765, '188e9cdc1e099ae35528b1bbc9517634', './public/static/plug/codemirror/mode/haskell/haskell.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (766, 'fd52a5709aa3056aa00f33669cf7d0af', './public/static/plug/codemirror/mode/haskell/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (767, 'f90fcf952ebbc37024825c0378cf781a', './public/static/plug/codemirror/mode/haskell-literate/haskell-literate.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (768, 'f279b09c73d466de4fdbca9165b03a50', './public/static/plug/codemirror/mode/haskell-literate/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (769, '5af7fe8db245e97ef2c6332da3927a0c', './public/static/plug/codemirror/mode/haxe/haxe.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (770, '8d72c160d26c1329557fb73d620c4329', './public/static/plug/codemirror/mode/haxe/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (771, '0b281dfc1e15f23234b991cf8f6da3a8', './public/static/plug/codemirror/mode/htmlembedded/htmlembedded.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (772, '1260cd7df0266e107a667c40a604577f', './public/static/plug/codemirror/mode/htmlembedded/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (773, '0442035997b7dadbfd59e7e58e215ef4', './public/static/plug/codemirror/mode/htmlmixed/htmlmixed.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (774, '88cb9c44b383b451cd8f21f3c1599f3d', './public/static/plug/codemirror/mode/htmlmixed/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (775, 'fdef58cb3d8f5b40c73cfb30e59a6446', './public/static/plug/codemirror/mode/http/http.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (776, 'be716f39ec337d5c791baf0aa830c78e', './public/static/plug/codemirror/mode/http/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (777, '0e032a46dd0e8933cc2c918541a204db', './public/static/plug/codemirror/mode/idl/idl.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (778, '8b6a5012f807fea14c540f00c8266e1c', './public/static/plug/codemirror/mode/idl/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (779, 'a8aa52b79528a7a74a71372b5bfb28d5', './public/static/plug/codemirror/mode/index.html', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (780, '738a8f40488ed1b0220ce9c25bb7598d', './public/static/plug/codemirror/mode/javascript/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (781, '4b4a87bc949fc5ba027d034e71e55d58', './public/static/plug/codemirror/mode/javascript/javascript.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (782, '0b53ee6443beae5ff95e8d19ff4c977c', './public/static/plug/codemirror/mode/javascript/json-ld.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (783, '5fb642c8fa6c151f477567eefa84cf16', './public/static/plug/codemirror/mode/javascript/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (784, '0e82eb26465b6c1c856af314eda84a72', './public/static/plug/codemirror/mode/javascript/typescript.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (785, '20d524a8e3ae3add39bc9100d8c72b52', './public/static/plug/codemirror/mode/jinja2/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (786, '1d38f201578ffd37b2937a6e0e961ffb', './public/static/plug/codemirror/mode/jinja2/jinja2.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (787, '420f62fb01fa3536b545bb8dc116b21d', './public/static/plug/codemirror/mode/jsx/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (788, '97314591d7c5941173402dd211f3e6a2', './public/static/plug/codemirror/mode/jsx/jsx.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (789, '551fd738e0d46be2b08084c11932a1f1', './public/static/plug/codemirror/mode/jsx/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (790, '0d704334586a2e6fa6890f1f075a01d1', './public/static/plug/codemirror/mode/julia/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (791, 'a54ac1eb7f884b31aaf2bc8a2cc503d6', './public/static/plug/codemirror/mode/julia/julia.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (792, 'e3759963a2bcebc51f3dfac602a67049', './public/static/plug/codemirror/mode/livescript/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (793, 'e54e2cfca3d3785fe4c620d2757ccf12', './public/static/plug/codemirror/mode/livescript/livescript.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (794, 'edbeea200fccc5e61e07ad8f816da349', './public/static/plug/codemirror/mode/lua/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (795, '980c154afbe4092fe696ceaf3a32dee3', './public/static/plug/codemirror/mode/lua/lua.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (796, '0bad346c6c9bb322eb3662d969193200', './public/static/plug/codemirror/mode/markdown/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (797, '282361afdc299cab95a94800489cd35f', './public/static/plug/codemirror/mode/markdown/markdown.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (798, '7fa8ba7986ada6e0fbecfff39427a803', './public/static/plug/codemirror/mode/markdown/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (799, '02a311eaabe522382b55c930240e990b', './public/static/plug/codemirror/mode/mathematica/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (800, '7b44360dfca0597516150633462bdadd', './public/static/plug/codemirror/mode/mathematica/mathematica.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (801, '6d5d0b4f7e0308e8242ed61610d193c7', './public/static/plug/codemirror/mode/mbox/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (802, 'ee9589d866520062650ca9783551911e', './public/static/plug/codemirror/mode/mbox/mbox.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (803, '9e55e1452ab43ce2e5f3401eb4a1b47a', './public/static/plug/codemirror/mode/meta.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (804, '0805ea3fd6df4db71dee941e43ef3df4', './public/static/plug/codemirror/mode/mirc/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (805, '4f3f6fe737a0a37a5c6bed2d113f372d', './public/static/plug/codemirror/mode/mirc/mirc.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (806, 'e418cac9ef3d5f38eac53678ae380616', './public/static/plug/codemirror/mode/mllike/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (807, 'a781c2896b17759df680731ab7d0e43e', './public/static/plug/codemirror/mode/mllike/mllike.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (808, '7835de8c677390e239899d3c8c0e5e9d', './public/static/plug/codemirror/mode/modelica/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (809, 'dc9743d99a853c4927d54ef9b753e553', './public/static/plug/codemirror/mode/modelica/modelica.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (810, 'de61582833d85ef9f15564c7f31110a4', './public/static/plug/codemirror/mode/mscgen/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (811, 'f94807bc5f8a679a20da03deaf28443e', './public/static/plug/codemirror/mode/mscgen/mscgen.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (812, 'd2e0ebdc0e6051b1cf8ef3214c6af9f1', './public/static/plug/codemirror/mode/mscgen/mscgen_test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (813, 'cdd5eef36181746a1318862cb75fda73', './public/static/plug/codemirror/mode/mscgen/msgenny_test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (814, '4b470176ceb34ea668f3bd4ec5544a04', './public/static/plug/codemirror/mode/mscgen/xu_test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (815, 'c33584d02e8cb14128230e4c0ab93584', './public/static/plug/codemirror/mode/mumps/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (816, '8a291acde78f45a5640053827ef537c3', './public/static/plug/codemirror/mode/mumps/mumps.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (817, '374c01f3152866b0666fd9c0043723a4', './public/static/plug/codemirror/mode/nginx/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (818, '56f0ced02c986ad95bd051d40d5acc9e', './public/static/plug/codemirror/mode/nginx/nginx.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (819, '137a0f3cb4a66939f5b3ee35388cf55b', './public/static/plug/codemirror/mode/nsis/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (820, 'e4613356835cd8494fbfda14c08b8e19', './public/static/plug/codemirror/mode/nsis/nsis.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (821, '0839d23d52af8135933c2b70b0214442', './public/static/plug/codemirror/mode/ntriples/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (822, '842f359573c053063bfddd1c980f3cac', './public/static/plug/codemirror/mode/ntriples/ntriples.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (823, '63306a1567c9225de7c4cf268697eb05', './public/static/plug/codemirror/mode/octave/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (824, '82b0af100cccf1e62f8f7e1a452b3342', './public/static/plug/codemirror/mode/octave/octave.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (825, '22010d4474541b387ec636dd70d53abc', './public/static/plug/codemirror/mode/oz/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (826, 'ccd05983aec26125b26e27ccdc4e3d88', './public/static/plug/codemirror/mode/oz/oz.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (827, '310478029935b507084a1759824fee1c', './public/static/plug/codemirror/mode/pascal/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (828, 'f143ba4eac1fe27e1b73f27e155aee7d', './public/static/plug/codemirror/mode/pascal/pascal.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (829, '5f78833bc08ed9486289da5bece69f4b', './public/static/plug/codemirror/mode/pegjs/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (830, 'b3f57b4ad23671542e12309167a12498', './public/static/plug/codemirror/mode/pegjs/pegjs.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (831, '7efd4058a40610b63203bc77e71d42aa', './public/static/plug/codemirror/mode/perl/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (832, '9eebf7fd91d1fbef7fa16c28ae7672b2', './public/static/plug/codemirror/mode/perl/perl.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (833, '867c98091e02548fd857b39bfaea6edb', './public/static/plug/codemirror/mode/php/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (834, 'bb0ae44712b25d1d37931be95aabf01f', './public/static/plug/codemirror/mode/php/php.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (835, 'ca8bfbf518ae49382b6ea5e84eb7d69c', './public/static/plug/codemirror/mode/php/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (836, '74ff6eb629a21bebe7dc1c731dd8a197', './public/static/plug/codemirror/mode/pig/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (837, 'f0594d1b74a14591ea748f60ca6b7625', './public/static/plug/codemirror/mode/pig/pig.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (838, '3a53aefffce3aaf4ecf2155b8dd86b5c', './public/static/plug/codemirror/mode/powershell/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (839, 'd9f23c4574271c8413e22da8d5b7e815', './public/static/plug/codemirror/mode/powershell/powershell.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (840, '024350513786930febf0ff5eed29ea32', './public/static/plug/codemirror/mode/powershell/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (841, 'afb9bda4dd0b8f7adb758cc23ffdd887', './public/static/plug/codemirror/mode/properties/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (842, '723d7fbb9ab346d9d35523cb5db79fa1', './public/static/plug/codemirror/mode/properties/properties.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (843, '6f8d7f58d2711261e09afe770a3d801b', './public/static/plug/codemirror/mode/protobuf/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (844, '3a2e8e8fd3b56e8496f55a746f0f415b', './public/static/plug/codemirror/mode/protobuf/protobuf.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (845, '59311846449011575d2738f1aca0b404', './public/static/plug/codemirror/mode/pug/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (846, '6fdc78af1d7634f533d2670fb78c217a', './public/static/plug/codemirror/mode/pug/pug.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (847, '9ece558a19dd602fc02ea283a4bd7ff4', './public/static/plug/codemirror/mode/puppet/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (848, 'f741fedbb8499c398318a1f73ee94dc4', './public/static/plug/codemirror/mode/puppet/puppet.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (849, '1e2a1688bc6ad982c095ccb7dd4e61d0', './public/static/plug/codemirror/mode/python/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (850, '9d55109ea8702227e11cbae8b0984aaa', './public/static/plug/codemirror/mode/python/python.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (851, 'def2963d27ff2a482bdd35d85db94c86', './public/static/plug/codemirror/mode/python/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (852, 'f11528f10bc0f90023bd64db2d208fc2', './public/static/plug/codemirror/mode/q/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (853, '3f7e78ee46fa43d774686489b39b77e0', './public/static/plug/codemirror/mode/q/q.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (854, 'febe588867c55d0f65b1cd061223202f', './public/static/plug/codemirror/mode/r/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (855, 'ef07fa9e5a25fb803ef0c3896b1c31d9', './public/static/plug/codemirror/mode/r/r.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (856, '8e483ec258683ce71ad20de852b877b9', './public/static/plug/codemirror/mode/rpm/changes/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (857, '6cffa8fc6cfeffb226ce09cf12215c4b', './public/static/plug/codemirror/mode/rpm/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (858, '9c0dcf987b2c4ab7f8c931c67a188728', './public/static/plug/codemirror/mode/rpm/rpm.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (859, '220220cedb7be0a5b05a062bd98d9392', './public/static/plug/codemirror/mode/rst/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (860, 'e4d9314592b730b63269d63e73494ce0', './public/static/plug/codemirror/mode/rst/rst.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (861, 'e494c812db049e941c35d17950280fe4', './public/static/plug/codemirror/mode/ruby/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (862, '773e193fd44c0860a20a9a096203f8ef', './public/static/plug/codemirror/mode/ruby/ruby.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (863, '400c20849487aa648d7fbaf9088184ca', './public/static/plug/codemirror/mode/ruby/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (864, '435fafa8ecb6687cad14a0c42f331742', './public/static/plug/codemirror/mode/rust/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (865, 'fe5ecd2b415d7208c3333d2c5c69a32b', './public/static/plug/codemirror/mode/rust/rust.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (866, '9b2f5021eb8db1a7c4cc6148e9f45588', './public/static/plug/codemirror/mode/rust/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (867, 'cafe2e6cf89decf2bb4c86b68cb55ff1', './public/static/plug/codemirror/mode/sas/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (868, '01780a15459ad3e6f2a1bcba739d1ebe', './public/static/plug/codemirror/mode/sas/sas.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (869, 'a054e850b2fb70ec7bb05b730fcf22ec', './public/static/plug/codemirror/mode/sass/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (870, 'e687fd02de7addd976943225035dcaf8', './public/static/plug/codemirror/mode/sass/sass.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (871, '22a496e75a436f1c82a6b3eec2da0bb7', './public/static/plug/codemirror/mode/sass/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (872, '51b43f81a870ebc161720807c4c18c6e', './public/static/plug/codemirror/mode/scheme/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (873, '4db6c7cb4521b0d05b29a26550452894', './public/static/plug/codemirror/mode/scheme/scheme.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (874, '6d24813dd04cfcb373ad3046bf527b71', './public/static/plug/codemirror/mode/shell/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (875, '3491c0f88da7d1c378f056524ecffb9f', './public/static/plug/codemirror/mode/shell/shell.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (876, 'e9fc2866961556c8ea99e44f00e37607', './public/static/plug/codemirror/mode/shell/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (877, '7525099453e788725b2afa2e8248aeef', './public/static/plug/codemirror/mode/sieve/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (878, '19dc1b488f4f4982d32d197bd42a9d18', './public/static/plug/codemirror/mode/sieve/sieve.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (879, 'd182b9103a075177cadca8f45ba83069', './public/static/plug/codemirror/mode/slim/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (880, '7f884377bdb85c39cf25c5ccc0a31cd0', './public/static/plug/codemirror/mode/slim/slim.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (881, 'b1070a72a7a750f8668ff306f4b3f6fd', './public/static/plug/codemirror/mode/slim/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (882, '37309623401edf494d678e7433278553', './public/static/plug/codemirror/mode/smalltalk/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (883, '07875194563e8daeed0f2e7eb45800c1', './public/static/plug/codemirror/mode/smalltalk/smalltalk.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (884, 'bb5c7628ea94449e3e765cbc9ab8ad13', './public/static/plug/codemirror/mode/smarty/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (885, '404ba44215b9b800a65c814b53c71c11', './public/static/plug/codemirror/mode/smarty/smarty.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (886, '77510b67339fca966efe5ad03e727dbf', './public/static/plug/codemirror/mode/solr/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (887, 'ed95af17d1b7404b6e84929dd0c1a051', './public/static/plug/codemirror/mode/solr/solr.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (888, '0482bcc8f700a46a7d8ac32eba2cefcd', './public/static/plug/codemirror/mode/soy/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (889, 'a46816c219a2dfa37f5aa35f0dda6c1c', './public/static/plug/codemirror/mode/soy/soy.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (890, 'c23f26f12e406e5caf0635cbc140658b', './public/static/plug/codemirror/mode/soy/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (891, '7551b1dc55ffbffa4425f2e45e0b67dc', './public/static/plug/codemirror/mode/sparql/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (892, 'b6c0cb25a18ba52360dee08352a1a858', './public/static/plug/codemirror/mode/sparql/sparql.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (893, '3c911e914a66ada5adf36ab3cf9206fb', './public/static/plug/codemirror/mode/spreadsheet/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (894, '004ce3c7a1a00df5b221fd47eb68d162', './public/static/plug/codemirror/mode/spreadsheet/spreadsheet.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (895, '1873610ed135a9853fa549d850e27e8c', './public/static/plug/codemirror/mode/sql/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (896, 'c3f5d7ddbe25e54e7754edf0543502d2', './public/static/plug/codemirror/mode/sql/sql.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (897, '3b9fe195d221724c7a1936458280d5e4', './public/static/plug/codemirror/mode/stex/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (898, 'd9e5974e900dcc713d1aaea0e7039512', './public/static/plug/codemirror/mode/stex/stex.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (899, '746ce9f2fe858502edebcaf4f81a8fb6', './public/static/plug/codemirror/mode/stex/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (900, 'a304db4e493ef3bc12bbb158d3f9f180', './public/static/plug/codemirror/mode/stylus/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (901, '29f014eacc49728573190018df40bec6', './public/static/plug/codemirror/mode/stylus/stylus.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (902, 'c2fa5476c35e167d78b4df54cba57bf6', './public/static/plug/codemirror/mode/swift/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (903, '24f312158f7e72a51a824188e39a9f80', './public/static/plug/codemirror/mode/swift/swift.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (904, 'cba778bcf0bd27900e3e64679c632a2f', './public/static/plug/codemirror/mode/swift/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (905, '739a59d51f267c2e7e1e4749d1887fa4', './public/static/plug/codemirror/mode/tcl/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (906, '3c1a4a2b142b8d80a04897951d560792', './public/static/plug/codemirror/mode/tcl/tcl.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (907, 'faf3998736f8f7ab247eaefd0c93c902', './public/static/plug/codemirror/mode/textile/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (908, '950a566cdfff93fcc106574572eb874a', './public/static/plug/codemirror/mode/textile/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (909, '9faee705f8f5d82df302109bbe43def9', './public/static/plug/codemirror/mode/textile/textile.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (910, '85961a30a1b1cc725dd7133b614f59f9', './public/static/plug/codemirror/mode/tiddlywiki/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (911, 'e745b2150c79295cfb93a210d34f2587', './public/static/plug/codemirror/mode/tiddlywiki/tiddlywiki.css', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (912, 'df4fbf5e5b60f40587e71b5a01572d3a', './public/static/plug/codemirror/mode/tiddlywiki/tiddlywiki.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (913, '5f462e6105ffe49881ae6e39882f6f11', './public/static/plug/codemirror/mode/tiki/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (914, 'fd660fbbcbd4927ccef28657446cc9f1', './public/static/plug/codemirror/mode/tiki/tiki.css', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (915, '4088a9d20b0d104414bbbf5f0423df7d', './public/static/plug/codemirror/mode/tiki/tiki.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (916, 'bbe1180c1881d45bb50a2523d489e827', './public/static/plug/codemirror/mode/toml/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (917, '0e07868dbada8579805ecc5cb559facf', './public/static/plug/codemirror/mode/toml/toml.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (918, 'f3826dd65bbce7d3a545b03abf86162a', './public/static/plug/codemirror/mode/tornado/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (919, 'bb1ba60fa4280201ed5b0cbfcc4d9c13', './public/static/plug/codemirror/mode/tornado/tornado.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (920, '2ee643a23137313e7b0d03eb46fe5a47', './public/static/plug/codemirror/mode/troff/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (921, '90b51117d5eb648ced4618970e25ece6', './public/static/plug/codemirror/mode/troff/troff.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (922, '4e2ef1199a603188821f9d31d7617471', './public/static/plug/codemirror/mode/ttcn/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (923, 'c9bd4f760a3eff8cda6aee1db1d13003', './public/static/plug/codemirror/mode/ttcn/ttcn.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (924, '69445415a456ffeaaeb534f9d7e3cf2c', './public/static/plug/codemirror/mode/ttcn-cfg/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (925, 'bb04f7a901457f04cf3ed7a8a0f87d65', './public/static/plug/codemirror/mode/ttcn-cfg/ttcn-cfg.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (926, 'e264db0825307d6f4799978a30c90111', './public/static/plug/codemirror/mode/turtle/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (927, '5e76936f993ecbbf4c3b0e26da739a4b', './public/static/plug/codemirror/mode/turtle/turtle.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (928, 'b4f1ce39e8e60eba6ac9171b846309a4', './public/static/plug/codemirror/mode/twig/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (929, '01afc25826dbe2ca75ff215e7c30710b', './public/static/plug/codemirror/mode/twig/twig.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (930, '2b30543ae169b6ce90b68bc1fb35571b', './public/static/plug/codemirror/mode/vb/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (931, 'cf51a1a5533752eb87a12f29444c0f21', './public/static/plug/codemirror/mode/vb/vb.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (932, '41c5663a6ac27b2e311d50e9b5c43ead', './public/static/plug/codemirror/mode/vbscript/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (933, '386b8258fafacf99f7ba40c268140a98', './public/static/plug/codemirror/mode/vbscript/vbscript.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (934, '5e31047f6807bf8c5c577672ed53014b', './public/static/plug/codemirror/mode/velocity/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (935, '21354dc111bfce4aac16c832a78eaf8f', './public/static/plug/codemirror/mode/velocity/velocity.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (936, '909e7d48e4a0c82e6489f970059b2175', './public/static/plug/codemirror/mode/verilog/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (937, '337b33d35d7310cb0ea8b898e532e360', './public/static/plug/codemirror/mode/verilog/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (938, '03c04a11813e663fcc6a8a3580f38979', './public/static/plug/codemirror/mode/verilog/verilog.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (939, '2556c4c3b93a9640728df0b6852c9e2d', './public/static/plug/codemirror/mode/vhdl/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (940, '7949a965bd92fd63af031dac7aedacf6', './public/static/plug/codemirror/mode/vhdl/vhdl.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (941, '9407ea4440bf7f0a3830e0276abbb303', './public/static/plug/codemirror/mode/vue/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (942, '4f1a255edf96df0cee91ac59c2df58f1', './public/static/plug/codemirror/mode/vue/vue.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (943, 'cb9f271a28106e8cecfd122f48792f06', './public/static/plug/codemirror/mode/webidl/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (944, '85598e1f9b5bf0ca8cb9dd40358ac09d', './public/static/plug/codemirror/mode/webidl/webidl.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (945, 'f1e52e123e10e94458a30d814be163a3', './public/static/plug/codemirror/mode/xml/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (946, 'dc77e42882c5232e4e61ca00bd7b1a70', './public/static/plug/codemirror/mode/xml/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (947, 'cae34fb93abc8b972c9fddbb7868c1d8', './public/static/plug/codemirror/mode/xml/xml.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (948, 'b6a8f261df8238e6f75a20aa013c648e', './public/static/plug/codemirror/mode/xquery/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (949, 'a5931923c9d3e1bb4b3c4ee8b2fce6ec', './public/static/plug/codemirror/mode/xquery/test.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (950, '8f78acc036709d56e548214d632b9e75', './public/static/plug/codemirror/mode/xquery/xquery.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (951, 'd44af300095ad363b49796ec9a0a5f95', './public/static/plug/codemirror/mode/yacas/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (952, '6c11cc682b8fcb21419469c3a906c6d6', './public/static/plug/codemirror/mode/yacas/yacas.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (953, '86199ef1457a9b7c44520517127d902e', './public/static/plug/codemirror/mode/yaml/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (954, '88957fd443499be4acad2317c8953a89', './public/static/plug/codemirror/mode/yaml/yaml.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (955, 'cf20e909e67724831be65c39fd40e3c8', './public/static/plug/codemirror/mode/yaml-frontmatter/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (956, '6096715e58f5aaab0093a497056f5ff8', './public/static/plug/codemirror/mode/yaml-frontmatter/yaml-frontmatter.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (957, '9cd201604baf558ecf35961db0564838', './public/static/plug/codemirror/mode/z80/index.html', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (958, '8d39d6f5922dcfc6bfbc5ffecf6a3963', './public/static/plug/codemirror/mode/z80/z80.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (959, '7c2d93ecaff026f3f09ed36292ff5b37', './public/static/plug/codemirror/package.json', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (960, 'f065036dd38be8c5f9e59f0fa21e06ab', './public/static/plug/codemirror/README.md', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (961, 'd7815be11a2d949adcbac94e2c38f10f', './public/static/plug/codemirror/rollup.config.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (962, '0d4d22de0bcdf7f7afd8131d4e59f130', './public/static/plug/codemirror/src/codemirror.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (963, '96823f4b50be64fcbfcc988b49bbd93f', './public/static/plug/codemirror/src/display/Display.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (964, '870322c0f347c703fe0c4f9650a8457a', './public/static/plug/codemirror/src/display/focus.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (965, '369b15237158db48d49f0ad305078fb8', './public/static/plug/codemirror/src/display/gutters.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (966, 'fc6f314859dad397c1f867ed5d73205f', './public/static/plug/codemirror/src/display/highlight_worker.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (967, '91fafcf4700b938215293d1293eb6c94', './public/static/plug/codemirror/src/display/line_numbers.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (968, 'ffc05060eaa3b3d89beeaaae86b0483a', './public/static/plug/codemirror/src/display/mode_state.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (969, '6cf19b52761a816ffddd4867ccd03e26', './public/static/plug/codemirror/src/display/operations.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (970, 'ccc039f5a6b8203781679d9d584d524c', './public/static/plug/codemirror/src/display/scrollbars.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (971, 'fddba16298f964d7d45197bbd28c7e6a', './public/static/plug/codemirror/src/display/scrolling.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (972, '9a9763e8e1572591267a0afd8cc5c4a8', './public/static/plug/codemirror/src/display/scroll_events.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (973, 'fb407d8d48da18ab3f1445cb4c1ed524', './public/static/plug/codemirror/src/display/selection.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (974, 'f7d925b25da9775b9b7761c073c43da0', './public/static/plug/codemirror/src/display/update_display.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (975, '6d53c67f7c2eec3aeee02ddb65071bd7', './public/static/plug/codemirror/src/display/update_line.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (976, '068004976130a9c0ac2453e055547e3e', './public/static/plug/codemirror/src/display/update_lines.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (977, 'a26525bd629440e84b02128d6eb323b4', './public/static/plug/codemirror/src/display/view_tracking.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (978, '401f224104fcb334c89aeb5b177a6c6f', './public/static/plug/codemirror/src/edit/CodeMirror.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (979, 'f7aa14eeba47a2e5906764f0a6a203b8', './public/static/plug/codemirror/src/edit/commands.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (980, '813d638d2d4693bd14f7b6490445a417', './public/static/plug/codemirror/src/edit/deleteNearSelection.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (981, 'e4f4a522ea30a44777729d5e50a4edc9', './public/static/plug/codemirror/src/edit/drop_events.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (982, '19f271daabe73e9b401658d7756258ec', './public/static/plug/codemirror/src/edit/fromTextArea.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (983, '5c092149ae9ec27cc98c3c7d547846f4', './public/static/plug/codemirror/src/edit/global_events.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (984, 'b3c43530eb5504458184289647f744a8', './public/static/plug/codemirror/src/edit/key_events.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (985, 'dfa5acb74b48161d442a6d83e1abbc03', './public/static/plug/codemirror/src/edit/legacy.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (986, '783f6b6cc684ace867c3a6d019d73c73', './public/static/plug/codemirror/src/edit/main.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (987, '5e8ec006a6e90eb3dbe17cfaa5fa8d2f', './public/static/plug/codemirror/src/edit/methods.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (988, '516e4e51b9f9b3d39fe19a56b853f331', './public/static/plug/codemirror/src/edit/mouse_events.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (989, 'eb0ba09aadbf5881f2c0d8d8517286f3', './public/static/plug/codemirror/src/edit/options.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (990, '4e9e033cb9daa0702d84b88dfcebae20', './public/static/plug/codemirror/src/edit/utils.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (991, 'c94e354d61d64b567f5103d0bc6129a3', './public/static/plug/codemirror/src/input/ContentEditableInput.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (992, '835649b199c40a992e89a61de3514147', './public/static/plug/codemirror/src/input/indent.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (993, '99aaff2df4aa7b7bbf46444748d6afff', './public/static/plug/codemirror/src/input/input.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (994, '29335feb9e270c4d5e11084ff49abe97', './public/static/plug/codemirror/src/input/keymap.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (995, '5698731a5f878d69fd07a557fc6aeae7', './public/static/plug/codemirror/src/input/keynames.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (996, '5d26c066e913aebe96ec81fe6f39a394', './public/static/plug/codemirror/src/input/movement.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (997, 'b90e1f8b7cea03420a34c165004927b8', './public/static/plug/codemirror/src/input/TextareaInput.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (998, '5297d8ee6b4aa86bf540a94261a48563', './public/static/plug/codemirror/src/line/highlight.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (999, '7b506eeae4f980437bf268d173da3570', './public/static/plug/codemirror/src/line/line_data.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1000, 'd1fc4bdcc5a93ac92f4c3c9cb34bd220', './public/static/plug/codemirror/src/line/pos.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1001, '72b6184ab657ca37a0d984dc73e7088c', './public/static/plug/codemirror/src/line/saw_special_spans.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1002, '656edfb4eb0f8d6a19caf7dd96bf55ef', './public/static/plug/codemirror/src/line/spans.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1003, '0f6f365b60c1688d8f0fcb8d57a9d9d4', './public/static/plug/codemirror/src/line/utils_line.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1004, 'a62cda289492f9c1d7c3d66b20a1b56f', './public/static/plug/codemirror/src/measurement/position_measurement.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1005, '675098b5f0aea0bf351a1b5762febfa6', './public/static/plug/codemirror/src/measurement/widgets.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1006, '6f8de09e0bdd108cf05341fbebf3e78b', './public/static/plug/codemirror/src/model/changes.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1007, 'c94346bbab58792973284ee98492c5f3', './public/static/plug/codemirror/src/model/change_measurement.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1008, '7dd1b45f75341b5a03a01f6607da69a4', './public/static/plug/codemirror/src/model/chunk.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1009, '69e859e3f87811f501309b6e85f789af', './public/static/plug/codemirror/src/model/Doc.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1010, 'd53ff2b4e0346705b37ecd018f256519', './public/static/plug/codemirror/src/model/document_data.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1011, 'fbcdc90789d48548716ba163d439ae00', './public/static/plug/codemirror/src/model/history.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1012, 'a77c7a3497ba0c0a98c18378d097453b', './public/static/plug/codemirror/src/model/line_widget.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1013, '31407a4067c0467786bca6b869e9f005', './public/static/plug/codemirror/src/model/mark_text.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1014, 'd0266c6af425ef17fa5249aff56a7d0d', './public/static/plug/codemirror/src/model/selection.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1015, 'e651e37a82ed7fa7390d166137fc4164', './public/static/plug/codemirror/src/model/selection_updates.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1016, 'bcf367e11e7fac26e7f1668e8f1d1968', './public/static/plug/codemirror/src/modes.js', '1556518590', '1547197830', '1556518590');
INSERT INTO `eb_system_file` VALUES (1017, '393097d394530c81b5c4ad56d6a3416d', './public/static/plug/codemirror/src/util/bidi.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1018, '01d85c943b1effe80baca7e75fec438b', './public/static/plug/codemirror/src/util/browser.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1019, 'd265013ffa414ac3aa48b689f1eede87', './public/static/plug/codemirror/src/util/dom.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1020, 'b700f1676589e7f88e59c943cc209156', './public/static/plug/codemirror/src/util/event.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1021, '3b63813f217d9351f7a1d90edf345310', './public/static/plug/codemirror/src/util/feature_detection.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1022, '9a75ab4a310ca594c193b03689c4cf7d', './public/static/plug/codemirror/src/util/misc.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1023, '72f0c675f45f87c9a45b5f5784212fa9', './public/static/plug/codemirror/src/util/operation_group.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1024, 'd187f08909bf9bb188d04c79f089c26a', './public/static/plug/codemirror/src/util/StringStream.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1025, 'b551ef595fcba951fd92ac209fdc2e85', './public/static/plug/codemirror/test/comment_test.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1026, '7fb9572a0a3b7bc6f0d22ddeadbc300a', './public/static/plug/codemirror/test/contenteditable_test.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1027, 'a6618ca505d05c0aa62cdb834487e4c4', './public/static/plug/codemirror/test/doc_test.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1028, '728736c8a8030b9475b18a6ac7d5323b', './public/static/plug/codemirror/test/driver.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1029, 'f935753d815473a2e08eba0610d8da23', './public/static/plug/codemirror/test/emacs_test.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1030, 'c62cee695231587419425a316340707d', './public/static/plug/codemirror/test/html-hint-test.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1031, '05b6641878b477d8941a248958e08077', './public/static/plug/codemirror/test/index.html', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1032, '17f7ba0bc629541e874943bad07d6c42', './public/static/plug/codemirror/test/lint.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1033, 'f13047c3db15f8e5891ab331d0fb6c69', './public/static/plug/codemirror/test/mode_test.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1034, '1f61da9edf84f7479484be44d24b9cf4', './public/static/plug/codemirror/test/mode_test.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1035, '5a2e039c0c6564d834f40fb1379de209', './public/static/plug/codemirror/test/multi_test.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1036, '9ef81c96901ef04a1025ea80e120bc74', './public/static/plug/codemirror/test/phantom_driver.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1037, 'a11775a7d403aab7a3e6b065f09b9cf9', './public/static/plug/codemirror/test/run.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1038, '45a7d3ef536f68eb0c6fc77f5423883f', './public/static/plug/codemirror/test/scroll_test.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1039, '8da6ba6b0cb66b299a793f52d97fff79', './public/static/plug/codemirror/test/search_test.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1040, '9abfc40d51d678bd7df8931970fb63d1', './public/static/plug/codemirror/test/sql-hint-test.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1041, 'ef080ff0b9bdd26436d9e503882c2719', './public/static/plug/codemirror/test/sublime_test.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1042, 'f5cb5c2e4a40f9663b9c32216f9fe928', './public/static/plug/codemirror/test/test.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1043, 'c7418f75e17f0c5a6f272dfd75531d50', './public/static/plug/codemirror/test/vim_test.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1044, '73c8f41583b4b71dbe1e5eac5c96f1a9', './public/static/plug/codemirror/theme/3024-day.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1045, '745180be9a932f24c6c0dd4ebdf5a0ed', './public/static/plug/codemirror/theme/3024-night.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1046, 'b58c93881a92a0991d427679181aa6b2', './public/static/plug/codemirror/theme/abcdef.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1047, '256f2dd130b80c6afaa40fddf700d12a', './public/static/plug/codemirror/theme/ambiance-mobile.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1048, '8996c0efee66bcc2fe2f52763b9da6e8', './public/static/plug/codemirror/theme/ambiance.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1049, '84b6347918411d58d7f9b65a7ee87f65', './public/static/plug/codemirror/theme/base16-dark.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1050, '037c7f3d16fe6d5ae2baa532e334172b', './public/static/plug/codemirror/theme/base16-light.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1051, 'cc414e4ec18bc89b3c79935b0e27fc20', './public/static/plug/codemirror/theme/bespin.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1052, 'cf9366960ff65c8101793bc64fe13e88', './public/static/plug/codemirror/theme/blackboard.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1053, '3428fab27f67b7795284457d84c3b1b9', './public/static/plug/codemirror/theme/cobalt.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1054, 'a4497729649571f95f2fbd660fc3e0f7', './public/static/plug/codemirror/theme/colorforth.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1055, '5a838ae3a0240003318c9e3735fdfae2', './public/static/plug/codemirror/theme/darcula.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1056, '41905bdb70daf702a6089a4b094e3e21', './public/static/plug/codemirror/theme/dracula.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1057, '8c1e7bcddd0ffe9049941a5983cca37f', './public/static/plug/codemirror/theme/duotone-dark.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1058, '8f5b2f0dfd4c6f38fd753b7d87954868', './public/static/plug/codemirror/theme/duotone-light.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1059, '1e58608d9e179397a43f51d8973f647f', './public/static/plug/codemirror/theme/eclipse.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1060, '0a4227e805a9d5f73a55dd248c1b052d', './public/static/plug/codemirror/theme/elegant.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1061, 'ff1cf820cb27d21dc9c5b65cab7c4a8c', './public/static/plug/codemirror/theme/erlang-dark.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1062, '2a76022ff4c347a04c566df8a3ffbd96', './public/static/plug/codemirror/theme/gruvbox-dark.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1063, 'b924ed31af30b1c68e5a01fc3c9b0553', './public/static/plug/codemirror/theme/hopscotch.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1064, '75c94576d53c64cc92cd84f4ca2db274', './public/static/plug/codemirror/theme/icecoder.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1065, 'ff87f4fad8fa110765f12d5af30aca66', './public/static/plug/codemirror/theme/idea.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1066, '7bb44bff5190c427de5ae750d6369633', './public/static/plug/codemirror/theme/isotope.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1067, 'f543dfb6b20dc603e71b75d25c4514b7', './public/static/plug/codemirror/theme/lesser-dark.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1068, 'f9b47b8807f6472cb292114e0e69edf5', './public/static/plug/codemirror/theme/liquibyte.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1069, 'e1d25281a0300914a8f3b2ee9f2a5b58', './public/static/plug/codemirror/theme/lucario.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1070, '32926db4839b70f03d55e5ec96618e36', './public/static/plug/codemirror/theme/material.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1071, '55ff4bdd8a92c3dcbfd5421c532b3059', './public/static/plug/codemirror/theme/mbo.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1072, '07c2ae05cb4ae14d5445b543aca4b789', './public/static/plug/codemirror/theme/mdn-like.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1073, '84c6bc0d66e8851675f425721bf2dfdb', './public/static/plug/codemirror/theme/midnight.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1074, '01f520b8bd3533f2ca06b6dc4a0886b7', './public/static/plug/codemirror/theme/monokai.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1075, '6b19894b9787c6791c250a95d0d4f8d6', './public/static/plug/codemirror/theme/neat.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1076, '2886072b53043c167e6f8765606c705c', './public/static/plug/codemirror/theme/neo.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1077, 'fb6733bae4b418acc71e54423a8cce6f', './public/static/plug/codemirror/theme/night.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1078, '677084b334831e83d67ff7413a83bd2e', './public/static/plug/codemirror/theme/oceanic-next.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1079, '808b67c4deffd479cd8e2709144d6878', './public/static/plug/codemirror/theme/panda-syntax.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1080, '3c24cee0dfac767713840b24e8359c99', './public/static/plug/codemirror/theme/paraiso-dark.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1081, 'e245bbfd22b4f61efe526ff13903f19e', './public/static/plug/codemirror/theme/paraiso-light.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1082, '4066167a1a40fdb6a2b80f56dc8060dd', './public/static/plug/codemirror/theme/pastel-on-dark.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1083, 'a5e7682d89da46244e5464d9572e24d8', './public/static/plug/codemirror/theme/railscasts.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1084, '7e608c21084c30b01de49c3e4eca05fc', './public/static/plug/codemirror/theme/rubyblue.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1085, '225db574f347785986fe6bff476ccc49', './public/static/plug/codemirror/theme/seti.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1086, '04f429186495a99c1d69e82b361a747c', './public/static/plug/codemirror/theme/shadowfox.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1087, '851ad806585c974aa204793b40b49f7f', './public/static/plug/codemirror/theme/solarized.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1088, '02ff81d8fbd29d5aa6f205452440da4c', './public/static/plug/codemirror/theme/ssms.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1089, '3cc8ba485ddf4f8b7128debab1c664d4', './public/static/plug/codemirror/theme/the-matrix.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1090, '777d36e1c5bbfeb3bf2ca8dd607eee93', './public/static/plug/codemirror/theme/tomorrow-night-bright.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1091, '5ceb5531fbe074d5190b55e8c725051e', './public/static/plug/codemirror/theme/tomorrow-night-eighties.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1092, '81cd4e786c819d0af356740e5024e453', './public/static/plug/codemirror/theme/ttcn.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1093, '4c9c1070a2d03127c217f39bcb5a9c33', './public/static/plug/codemirror/theme/twilight.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1094, 'b6955c049c6cc88810ff70b7eafcb604', './public/static/plug/codemirror/theme/vibrant-ink.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1095, '3de4363e29db5a4e58e8bb3e6d23fee8', './public/static/plug/codemirror/theme/xq-dark.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1096, '3d6e922075daca6b0f8cace5c4a441af', './public/static/plug/codemirror/theme/xq-light.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1097, 'ca86cdbcc6672dbc7ef69007c9a37fc1', './public/static/plug/codemirror/theme/yeti.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1098, '94ad50bf3d048ed92cc513cd901dc685', './public/static/plug/codemirror/theme/zenburn.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1099, 'd41d8cd98f00b204e9800998ecf8427e', './public/static/plug/copy.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (1100, '2fba2a36f4a0188d6ac539e97ac788c4', './public/static/plug/daterangepicker/daterangepicker.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1101, '17410722717c1e9395f02d0dd74c2590', './public/static/plug/daterangepicker/daterangepicker.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1102, '463463c56b7e47d14de8accee9e5c9ca', './public/static/plug/echarts/echarts.common.min.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1103, 'ad50f4a89649fef993f7a5c908436969', './public/static/plug/echarts/theme/macarons.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1104, 'ab48530ab6802e2ab6e4cb2de2298fbe', './public/static/plug/echarts/theme/westeros.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1105, 'c5873fa3b95636deac5ba3d97c08601f', './public/static/plug/echarts.common.min.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (1106, '37ea1aede8c5534441c9e6e1a6239332', './public/static/plug/form-create/form-create.min.js', '1556518591', '1553171244', '1556518591');
INSERT INTO `eb_system_file` VALUES (1107, '9a430848872245dbc2cd47f1c653dd60', './public/static/plug/form-create/province_city.js', '1556518591', '1553171244', '1556518591');
INSERT INTO `eb_system_file` VALUES (1108, '9313689a79d96022029600344442b94b', './public/static/plug/form-create/province_city_area.js', '1556518591', '1553171244', '1556518591');
INSERT INTO `eb_system_file` VALUES (1109, '6633336083c872f5eece0e65b4d2fb13', './public/static/plug/helper.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (1110, 'a3f43bab5ace67f3616f5ebfc66744dc', './public/static/plug/iscroll5.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (1111, '359a04c6af9d438c31908eef96e9a928', './public/static/plug/iview/dist/iview.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1112, '30173fd15782a5653e5c1b234521a959', './public/static/plug/iview/dist/iview.min.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1113, 'a4591f9285817b3096881112430e4505', './public/static/plug/iview/dist/locale/de-DE.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1114, '4333bc8adac238a5d020b396126bd42b', './public/static/plug/iview/dist/locale/en-US.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1115, '62c5469b2dc3d06e43775781fe345598', './public/static/plug/iview/dist/locale/es-ES.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1116, '7cd6a5caafff87f609ce78a076a44643', './public/static/plug/iview/dist/locale/fr-FR.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1117, 'c052220f96815a15b1f68c1fd4f7ee12', './public/static/plug/iview/dist/locale/id-ID.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1118, '5fad473ad29a2ca3005e81918eba4038', './public/static/plug/iview/dist/locale/ja-JP.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1119, 'a147e39fc3f1fcc10d8d7b0d949ae123', './public/static/plug/iview/dist/locale/ko-KR.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1120, '522aa18fb0e6fd7370aea1e2888d6a4b', './public/static/plug/iview/dist/locale/pt-BR.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1121, 'ced8fbbbc266a42b4f20a0a909be2491', './public/static/plug/iview/dist/locale/pt-PT.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1122, '31ec5dbdd426ce6bfebc21c4c8858016', './public/static/plug/iview/dist/locale/ru-RU.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1123, 'c10e6a171e98a3dac5f34f738c808a68', './public/static/plug/iview/dist/locale/sv-SE.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1124, 'f5ea82d56a1e757e17b25f0ab1bd407e', './public/static/plug/iview/dist/locale/tr-TR.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1125, '30c93bd10e9a17601a3120c633ce6e45', './public/static/plug/iview/dist/locale/vi-VN.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1126, 'c0de3c748f7b067d4a08289176c38761', './public/static/plug/iview/dist/locale/zh-CN.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1127, 'c8b21eba8334d31d063d2eeb8ccea94d', './public/static/plug/iview/dist/locale/zh-TW.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1128, '2c2ae068be3b089e0a5b59abb1831550', './public/static/plug/iview/dist/styles/fonts/ionicons.eot', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1129, '621bd386841f74e0053cb8e67f8a0604', './public/static/plug/iview/dist/styles/fonts/ionicons.svg', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1130, '24712f6c47821394fba7942fbb52c3b2', './public/static/plug/iview/dist/styles/fonts/ionicons.ttf', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1131, '05acfdb568b3df49ad31355b19495d4a', './public/static/plug/iview/dist/styles/fonts/ionicons.woff', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1132, '8ffbb5a88713c5d685d974a4fc839d40', './public/static/plug/iview/dist/styles/iview.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1133, 'f9c7afd05729f10f55b689f36bb20172', './public/static/plug/jquery/jquery.min.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1134, 'db0eb3e080078a53626d846636fad24b', './public/static/plug/jquery-1.10.2.min.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (1135, '3aa9b9ebda33033336cce574b6f148ed', './public/static/plug/jquery-1.4.1.min.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (1136, 'aaf50b98a6bae537c2105fd125aa7fbf', './public/static/plug/jquery-slide-up.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (1137, '8a010634d0be8abb8370dc2aa45e065c', './public/static/plug/jquery.downCount.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (1138, '5eed218554f21c8fcb6d0f53d75ec8b0', './public/static/plug/layer/layer-compiled.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1139, 'cd07461cfdea4bd644f0e0b0bfbf54a1', './public/static/plug/layer/layer-compiled.js.map', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1140, '6e80f0cff749c82653b9cdde9eeab937', './public/static/plug/layer/layer.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1141, '3859550db3293c2e669a440a80e081b3', './public/static/plug/layer/mobile/layer-compiled.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1142, 'f86c47baefd32fded3eea00b502e802f', './public/static/plug/layer/mobile/layer-compiled.js.map', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1143, '2028e407c22ee7a12b05a35ee9c71882', './public/static/plug/layer/mobile/layer.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1144, '633915e62d14a714594b95b974ee0836', './public/static/plug/layer/mobile/need/layer.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1145, 'ba81b24c06e2e0eac1e219405b33766b', './public/static/plug/layer/theme/default/icon-ext.png', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1146, '551539f873d9ebe0792b120a9867d399', './public/static/plug/layer/theme/default/icon.png', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1147, '3d2e0d91c5c0b96abb8dbdc2234aba77', './public/static/plug/layer/theme/default/layer.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1148, 'a72011ccdc2bcd23ba440f104c416193', './public/static/plug/layer/theme/default/loading-0.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1149, '1140bc5c7863f8e54a3c2b179e640758', './public/static/plug/layer/theme/default/loading-1.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1150, '50c5e3e79b276c92df6cc52caeb464f0', './public/static/plug/layer/theme/default/loading-2.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1151, '3222f666794d7971b9c1285d9136c917', './public/static/plug/layui/css/layui.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1152, '4d36f7edd74ad9b12f369b004c63e36c', './public/static/plug/layui/css/layui.mobile.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1153, '3b62b380cf60326cc793a52345a36ee3', './public/static/plug/layui/css/modules/code.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1154, '5fde8e6379c488af876ca12670b1fb96', './public/static/plug/layui/css/modules/laydate/default/laydate.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1155, 'ba81b24c06e2e0eac1e219405b33766b', './public/static/plug/layui/css/modules/layer/default/icon-ext.png', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1156, '551539f873d9ebe0792b120a9867d399', './public/static/plug/layui/css/modules/layer/default/icon.png', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1157, 'dabe9809ac717f267f4fc20bbab4e1d1', './public/static/plug/layui/css/modules/layer/default/layer.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1158, 'a72011ccdc2bcd23ba440f104c416193', './public/static/plug/layui/css/modules/layer/default/loading-0.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1159, '1140bc5c7863f8e54a3c2b179e640758', './public/static/plug/layui/css/modules/layer/default/loading-1.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1160, '50c5e3e79b276c92df6cc52caeb464f0', './public/static/plug/layui/css/modules/layer/default/loading-2.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1161, '0208023e7b4a46473764cc8a59eef107', './public/static/plug/layui/font/iconfont.eot', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1162, '5d06b4882837abc22aea91ea51d55b11', './public/static/plug/layui/font/iconfont.svg', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1163, 'd8583a8444b3b76b28c9c7436abc7cbe', './public/static/plug/layui/font/iconfont.ttf', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1164, 'e9caaa0617fa61c01f765960d10da0ef', './public/static/plug/layui/font/iconfont.woff', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1165, 'a06a2e3ed6da3796fbb731367d039a0a', './public/static/plug/layui/images/face/0.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1166, '913e2f3dd1962d2a80b4ae66ddddceb3', './public/static/plug/layui/images/face/1.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1167, '611117291370fea2ceac62c29e3895bd', './public/static/plug/layui/images/face/10.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1168, '199be3fbe9ed7e5191c8635e05bcc0e9', './public/static/plug/layui/images/face/11.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1169, '7621ac2727678687a5318762f580142e', './public/static/plug/layui/images/face/12.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1170, '8621f66098b5c352706832525ca98430', './public/static/plug/layui/images/face/13.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1171, 'c30514bf7d87214840be9409e0543aa9', './public/static/plug/layui/images/face/14.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1172, '485a20018f6fd278510c2953697ba65c', './public/static/plug/layui/images/face/15.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1173, '3d4ee858ebba0e46a7850e13185b7c9b', './public/static/plug/layui/images/face/16.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1174, '1e345b472299bbc72d854fea14377b19', './public/static/plug/layui/images/face/17.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1175, 'f81ed31a2829c0609354f25e1da62006', './public/static/plug/layui/images/face/18.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1176, 'fa7da45a4cf11818476a64b11972beba', './public/static/plug/layui/images/face/19.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1177, 'aec972de4da971327e4452c5b4b5fda1', './public/static/plug/layui/images/face/2.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1178, '435dbb7f69e76dbe51c64d0208478bd5', './public/static/plug/layui/images/face/20.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1179, '21ed3c01c99c75162cc7d5c09e557468', './public/static/plug/layui/images/face/21.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1180, '7873504cf41c6bf81dc385e7a63e06c2', './public/static/plug/layui/images/face/22.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1181, '84b3bd065735379c7ebf902bd356eb24', './public/static/plug/layui/images/face/23.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1182, '9044159f1635cce276f79f2750e44bab', './public/static/plug/layui/images/face/24.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1183, '55ff58341b23eb412186f8e89963f3ed', './public/static/plug/layui/images/face/25.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1184, '7e64a36433e1f756dafc74093e71c678', './public/static/plug/layui/images/face/26.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1185, '4e10558193648444470bb9a1dd7007da', './public/static/plug/layui/images/face/27.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1186, 'ed40b41d05a3020271be545a607d6d78', './public/static/plug/layui/images/face/28.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1187, '4fb6439d891b34c4936ae34a79725b59', './public/static/plug/layui/images/face/29.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1188, 'bf97be0b15ace15dedf22f266a5c429c', './public/static/plug/layui/images/face/3.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1189, '0b7ff8f1bbb91be880ef190767774c78', './public/static/plug/layui/images/face/30.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1190, 'dcc636d88b53e73852db566a4d9d2f20', './public/static/plug/layui/images/face/31.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1191, '8d9e9cc9b52ca46e854480fa4900158e', './public/static/plug/layui/images/face/32.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1192, '2f9e45312f49e02f32ce853db930295f', './public/static/plug/layui/images/face/33.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1193, 'f81a7f4f93f254d58c0e943a07d2cc0b', './public/static/plug/layui/images/face/34.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1194, 'cc8ff0383ce624c0721682aaa500b672', './public/static/plug/layui/images/face/35.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1195, '645be9a08ae4d8aac61e6b5fb47215e5', './public/static/plug/layui/images/face/36.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1196, '4c9e106e702751cb61861778269e2b26', './public/static/plug/layui/images/face/37.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1197, '15bd343617ec5ea02eedfdfe575c656c', './public/static/plug/layui/images/face/38.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1198, 'edfe69e1b1f20cfa8110d9e9d2536c68', './public/static/plug/layui/images/face/39.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1199, '4d2933c0445dc04bdaaad41f2b557137', './public/static/plug/layui/images/face/4.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1200, 'c94db1a006caf85ccb8a194335ce5621', './public/static/plug/layui/images/face/40.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1201, '55565f0156566feef1e329177f6d83f1', './public/static/plug/layui/images/face/41.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1202, 'f24d53dee3bd1050b26d6d7cd5bca68d', './public/static/plug/layui/images/face/42.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1203, '599c45d8a2832cc01617fb42091993df', './public/static/plug/layui/images/face/43.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1204, 'b0f285b595f10a1277774bf6844da76b', './public/static/plug/layui/images/face/44.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1205, 'd17783318c1587204b6155c2fa9986fe', './public/static/plug/layui/images/face/45.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1206, 'b72ecabbadc13888d4775ec53c9150f8', './public/static/plug/layui/images/face/46.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1207, '8ede6bd1d173ddeb6f3f4b241c8f3513', './public/static/plug/layui/images/face/47.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1208, '2a4c6936a09b0219d1c74f0167577b30', './public/static/plug/layui/images/face/48.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1209, '21069e4a6b8a4f6a0af40c87a168f321', './public/static/plug/layui/images/face/49.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1210, '8ae6b6ec8d2941a6adaee9555839e81c', './public/static/plug/layui/images/face/5.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1211, '96664d71d30c946747bcc651d085ed7a', './public/static/plug/layui/images/face/50.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1212, 'c6c1e6c64c16d3747e251200e014f219', './public/static/plug/layui/images/face/51.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1213, 'ff4d93b3615d5d975f0b6786670b702f', './public/static/plug/layui/images/face/52.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1214, 'bc06dab3c63c4e2300c5cd4524819370', './public/static/plug/layui/images/face/53.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1215, 'aff05197849e8c8f55b2d5fe56bb56f7', './public/static/plug/layui/images/face/54.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1216, 'd7bdca562fd0b53f816eedb23148e158', './public/static/plug/layui/images/face/55.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1217, '8c6f0b4cdd0fa9d68205bab3d8df29e4', './public/static/plug/layui/images/face/56.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1218, 'e37c81739515617cf5bc51232ad873b7', './public/static/plug/layui/images/face/57.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1219, '89d291439d6eae4b2db6746e589f6134', './public/static/plug/layui/images/face/58.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1220, '1cb4f698dd69602dd6f6eff121663a17', './public/static/plug/layui/images/face/59.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1221, '9946d6232e406ba2c10b60221c5b698b', './public/static/plug/layui/images/face/6.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1222, '71712fa565d89315b6ef2a45b3d581b5', './public/static/plug/layui/images/face/60.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1223, '4bde9630ca80c61063813274729af4ba', './public/static/plug/layui/images/face/61.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1224, 'c0ed0920ba0d752ad77aca762050b12d', './public/static/plug/layui/images/face/62.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1225, '907b3e81d16afb9df5ef023ede0eddf1', './public/static/plug/layui/images/face/63.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1226, '959bacfef9ac0d3bb275504623c62375', './public/static/plug/layui/images/face/64.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1227, 'a27ed9871926a8e37c522f6c1542df9a', './public/static/plug/layui/images/face/65.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1228, '02709c83458b72b0c73585297cc291f3', './public/static/plug/layui/images/face/66.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1229, 'ab1c7c7a43aa6f43963c7b0afc9ec787', './public/static/plug/layui/images/face/67.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1230, 'a1c8f21f98fc6eff21cb3e4d08baee2b', './public/static/plug/layui/images/face/68.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1231, '877ff95213ae5c45721761c540810053', './public/static/plug/layui/images/face/69.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1232, '3880bad4694b3ef38e2e58be68b875ef', './public/static/plug/layui/images/face/7.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1233, 'b7f69e6df691b1c885f541ec604c59df', './public/static/plug/layui/images/face/70.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1234, '55a42691f8560bf2fbfed7c19389e4cf', './public/static/plug/layui/images/face/71.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1235, '8bfcb8fe88a3b666b5460743fb2cdc49', './public/static/plug/layui/images/face/8.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1236, '92bf7127158347196c4f9aef0d0ab301', './public/static/plug/layui/images/face/9.gif', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1237, '45da6e46edbfa6288604e05c22bf9406', './public/static/plug/layui/lay/modules/carousel.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1238, '65b45869767bfbed76a25b4424d378e1', './public/static/plug/layui/lay/modules/code.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1239, '301b9e131e70811c457d88a800739968', './public/static/plug/layui/lay/modules/element.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1240, '4f068e98342bca6cb77e4b38312cb894', './public/static/plug/layui/lay/modules/flow.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1241, '308134b159ce17a4ab36e95b561a990f', './public/static/plug/layui/lay/modules/form.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1242, '498f00663ba1e50ec3c0bbc7dfaa158e', './public/static/plug/layui/lay/modules/jquery.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1243, '17e08ba8e6c11fd59b24a2602e37db92', './public/static/plug/layui/lay/modules/laydate.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1244, '5a2e2a2ea604929e398c808e4c90eb14', './public/static/plug/layui/lay/modules/layedit.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1245, '6061f8b40e704052a4178f02dbd8c14f', './public/static/plug/layui/lay/modules/layer.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1246, '67fcb69f6b5954f95b17e573434657c3', './public/static/plug/layui/lay/modules/laypage.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1247, '639f547f17eb0f74fd0b07300cd1f706', './public/static/plug/layui/lay/modules/laytpl.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1248, 'e7c702bfab06304c11757cde5fd28f82', './public/static/plug/layui/lay/modules/mobile.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1249, 'aeb2d183199127a5c67f8aa021376490', './public/static/plug/layui/lay/modules/rate.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1250, 'cdde0f249af8b9a61025b64ca6b9d1f8', './public/static/plug/layui/lay/modules/table.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1251, '37e35ee183b27dfb3f7ca19ccfa268a5', './public/static/plug/layui/lay/modules/tree.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1252, 'fa2065c8ed794061dcbb2597aa0ad69f', './public/static/plug/layui/lay/modules/upload.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1253, '9458090035e6c0a610c5f14f9f7de139', './public/static/plug/layui/lay/modules/util.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1254, 'd02ecf7a405252f656a5feabfd1389b1', './public/static/plug/layui/layui.all.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1255, 'e7788bf71c56e612371f07001a1c4cc4', './public/static/plug/layui/layui.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1256, 'cecba37226e43433959c784bdbd15579', './public/static/plug/lodash.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (1257, '2a1f285b602aa76ca45d0bf045ea0ea4', './public/static/plug/moment.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (1258, '9e3d8f3f64b99c8c036a7f9581a2f4e4', './public/static/plug/reg-verify.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (1259, 'f051459ded214178b064b37209d9398c', './public/static/plug/requirejs/bin/r.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1260, '4bead4b1b0a417582825231dbfe121b1', './public/static/plug/requirejs/package.json', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1261, 'b9c130e7f47765cadef3f4a80ad3b412', './public/static/plug/requirejs/README.md', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1262, '61f8c2e37f77a591e0672b7721d8c758', './public/static/plug/requirejs/require-basket-load-compiled.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1263, '134360260efaa95a5c79a6fe4723167b', './public/static/plug/requirejs/require-basket-load-compiled.js.map', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1264, '02a914ed35fb011193120b96ef31e77d', './public/static/plug/requirejs/require-basket-load.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1265, 'fa71c855757afa72f454060031db4159', './public/static/plug/requirejs/require-compiled.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1266, '55c17f69ae6c2d587a0e33dc0a3efcf4', './public/static/plug/requirejs/require-compiled.js.map', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1267, '5bea7d748bd7cc0ffadd553cfb7d7df0', './public/static/plug/requirejs/require-css.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1268, '354cf34e88ac81f464adc56d5b4b6647', './public/static/plug/requirejs/require.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1269, '7b9d65cd421b833d3711523179fef3ec', './public/static/plug/sweetalert2/sweetalert2.all.min.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1270, '8ba31474130566d0d42a0656b86d3c64', './public/static/plug/swiper/swiper-3.4.1.jquery.min.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1271, '0176bf1163b6f65f3c8cf11cd367e67c', './public/static/plug/swiper/swiper-3.4.1.min.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1272, '9571a2b9196123c124e88bf55a16ed90', './public/static/plug/swiper/swiper.jquery.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1273, '9e6119f9c349ed8fde1af51a819a8fa3', './public/static/plug/vant/vant.css', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1274, 'db1b2af72a0284157cec60fb01bb362f', './public/static/plug/vant/vant.min.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1275, 'a64ac1319064e7e88d336ce95f667d52', './public/static/plug/vue/dist/README.md', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1276, '55aa848bc74dde42637d7ae96f38ec01', './public/static/plug/vue/dist/vue.common.js', '1556518591', '1547197830', '1556518591');
INSERT INTO `eb_system_file` VALUES (1277, '7f7d01342623404fe6dadc6bea8a5d22', './public/static/plug/vue/dist/vue.esm.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1278, '037d997219804a79cea6540312fc8e0a', './public/static/plug/vue/dist/vue.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1279, '7e052e2850e70a8db1bd837e08ddda83', './public/static/plug/vue/dist/vue.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1280, '917f70e72ec5e171ea46987517925f1e', './public/static/plug/vue/dist/vue.runtime.common.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1281, '9eb63dbfb2badb381a3b6892b4da9f04', './public/static/plug/vue/dist/vue.runtime.esm.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1282, 'bd3852d9ff082206759b1d322eeccfe8', './public/static/plug/vue/dist/vue.runtime.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1283, '3901c2214f7cbdf0dc2c962e3cc1a5ad', './public/static/plug/vue/dist/vue.runtime.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1284, '6e4f3ef8152e174622be5ec910d4f249', './public/static/plug/wxApi.js', '1556518589', '1547197830', '1556518589');
INSERT INTO `eb_system_file` VALUES (1285, '58efd044759758ce13ead16ca41b3c62', './public/static/plug/ydui/cityselect.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1286, '5447db0969056561df63afafd475fe3a', './public/static/plug/ydui/province_city.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1287, 'efbd1c7a21cf71fa68fb2212e6c7424f', './public/static/plug/ydui/province_city_area.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1288, '3c0cc77ad7e2a96a87a276486ea80202', './public/static/plug/ydui/province_city_area2.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1289, '3cec33010d43dbcb051dd8da6ce03f7c', './public/static/plug/ydui/province_city_area_id.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1290, '358ae4a98630101b6ca9ffce3817a440', './public/static/plug/ydui/province_city_id.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1291, '5ff6a80730ca572d24352e6508f56040', './public/static/plug/ydui/ydui-px.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1292, 'a94db750a833f9c81d8075d57b8499b7', './public/static/plug/ydui/ydui.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1293, 'c96fe283052715ba4edc7b9eb896863a', './public/static/plug/ydui/ydui2.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1294, '5f8c4e2b0c2fc62d034d9b9ab3de9ceb', './public/system/css/layui-admin.css', '1556518592', '1553517240', '1556518592');
INSERT INTO `eb_system_file` VALUES (1295, '389336103c1ac9b5b6ca973ab5708c11', './public/system/css/main.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1296, '393d1040f9005a199b9cde2b5adca2f3', './public/system/frame/css/animate.min.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1297, '0647843fc410a3367afe7ef5344a897b', './public/system/frame/css/bootstrap.min.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1298, '8bf71864fdf1ac4b9133cfc112b1fbd8', './public/system/frame/css/demo/webuploader-demo.min.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1299, 'e2c72bfae2b4e3a016d1bfeb1774f989', './public/system/frame/css/font-awesome.min.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1300, 'ddc96c869583450ff45049968cef2c07', './public/system/frame/css/login.min.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1301, '5be57ee662d0aa4f1e300709700bc2b4', './public/system/frame/css/M663 1125q-11 -1 -15.5 -10.5t-8.5 -9.5q-5 -1 -5 5q0 12 19 15h10zM750 1111q-4 -1 -11.5 6.5t-17.5 4.5q03F7DC5A5A', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1302, '85efa900c0fc12fee15a5398deba06e8', './public/system/frame/css/patterns/header-profile-skin-1.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1303, 'bf471ec3d4085883e061ca35006e86e8', './public/system/frame/css/patterns/header-profile-skin-3.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1304, '2a634a94d5b175c41a71fac233a52f53', './public/system/frame/css/patterns/header-profile.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1305, 'ea2316224d45899c59bc285ba09dd920', './public/system/frame/css/patterns/shattered.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1306, '545ccf313793f6389ddbc8f5c083b661', './public/system/frame/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1307, 'bb00b8ef7102c035b361c1ec2f4e9dec', './public/system/frame/css/plugins/blueimp/css/blueimp-gallery.min.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1308, '90901890fbf9b379405f47a23313e63b', './public/system/frame/css/plugins/blueimp/img/error.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1309, '19ee6b7e6642d75d6144b0c8209c93d6', './public/system/frame/css/plugins/blueimp/img/error.svg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1310, '05992d3434d3589b38a3a5431842d38f', './public/system/frame/css/plugins/blueimp/img/loading.gif', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1311, 'a012413b54276e2eefd145c7aec60f93', './public/system/frame/css/plugins/blueimp/img/play-pause.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1312, '21dfa3149b274acb9c1819d342a6a169', './public/system/frame/css/plugins/blueimp/img/play-pause.svg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1313, '288308b2037f409d293916c7a3913f20', './public/system/frame/css/plugins/blueimp/img/video-play.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1314, '9b737958b1644b46b23904e53afcac50', './public/system/frame/css/plugins/blueimp/img/video-play.svg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1315, 'c45ed1e9b43d738b6fad917f1fc76ce2', './public/system/frame/css/plugins/bootstrap-table/bootstrap-table.min.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1316, '25b9acb1b504c95c6b95c33986b7317e', './public/system/frame/css/plugins/chosen/chosen-sprite.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1317, 'cb0d09c93b99c5cab6848147fdb3d7e4', './public/system/frame/css/plugins/chosen/chosen-sprite_402x.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1318, '88ebec8cd961f3559bce5faa8f9de79e', './public/system/frame/css/plugins/chosen/chosen.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1319, '0f36de6b99644f7418cb7606d3f4c28f', './public/system/frame/css/plugins/clockpicker/clockpicker.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1320, 'c65e357d96162daabe78bca2dbdce79c', './public/system/frame/css/plugins/codemirror/ambiance.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1321, 'e5c23905e29d3bfaac1e4d3601bb8b23', './public/system/frame/css/plugins/codemirror/codemirror.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1322, '66e14215edc7e6532f9d2709c0945c1d', './public/system/frame/css/plugins/colorpicker/css/bootstrap-colorpicker.min.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1323, '58fc83686953e32bce2b1e8d87438abc', './public/system/frame/css/plugins/colorpicker/img/bootstrap-colorpicker/alpha-horizontal.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1324, '10f4b956ec4d7e11c2b0c1cc11e18db1', './public/system/frame/css/plugins/colorpicker/img/bootstrap-colorpicker/alpha.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1325, 'df1e75c9de8c1b5b68f7144463afdb87', './public/system/frame/css/plugins/colorpicker/img/bootstrap-colorpicker/hue-horizontal.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1326, 'de10f7b98e37a57ee81149a71d2c6106', './public/system/frame/css/plugins/colorpicker/img/bootstrap-colorpicker/hue.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1327, '512a83ac26d1574e25d742fe81cf531b', './public/system/frame/css/plugins/colorpicker/img/bootstrap-colorpicker/saturation.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1328, 'dd835c75a131866a16470623a46e95bd', './public/system/frame/css/plugins/cropper/cropper.min.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1329, '371f99421c676859fba95267ad302398', './public/system/frame/css/plugins/datapicker/datepicker3.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1330, '52a229c8537ddc5b43f416599a142d95', './public/system/frame/css/plugins/dataTables/dataTables.bootstrap.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1331, 'f2f9e734fd10788522327d842386f625', './public/system/frame/css/plugins/dropzone/basic.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1332, '770cbf827f55a971a7b48c1b8f8d87fb', './public/system/frame/css/plugins/dropzone/dropzone.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1333, '91c343856c56695b45993db2e1575519', './public/system/frame/css/plugins/footable/fonts/footable.eot', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1334, 'bdeee9eb7c9bc5677154b01df270924c', './public/system/frame/css/plugins/footable/fonts/footable.svg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1335, '2256ee07c7a1a366e5bac1c3fcb8e216', './public/system/frame/css/plugins/footable/fonts/footable.ttf', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1336, '634513dc791352157f12cb0a5ed8782b', './public/system/frame/css/plugins/footable/fonts/footable.woff', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1337, '69d9cfa525284ae009eb9c797dc95cc1', './public/system/frame/css/plugins/footable/footable.core.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1338, 'cf11a9e74fe0c72c1ca76b43b64879e3', './public/system/frame/css/plugins/fullcalendar/fullcalendar.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1339, 'acf02ccc6bf59add6e0504f3d5ecba71', './public/system/frame/css/plugins/fullcalendar/fullcalendar.print.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1340, '608c9427568fb77370a7bd87121a8d7f', './public/system/frame/css/plugins/iCheck/custom.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1341, '3c4bf794e3e2af3e68d2f4bd77d0baa7', './public/system/frame/css/plugins/iCheck/green.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1342, 'a9949782f83fe749cf551b604619de9c', './public/system/frame/css/plugins/iCheck/green_402x.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1343, '1ddf746a85707231f84d947637efd63a', './public/system/frame/css/plugins/images/sort_asc.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1344, '873523781b369512e7d677adf2f0e083', './public/system/frame/css/plugins/images/sort_desc.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1345, 'b363c10c480daebf2e9fab3572dfe325', './public/system/frame/css/plugins/images/sprite-skin-flat.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1346, '7b51acacc1feb8be0580e8467a4d306b', './public/system/frame/css/plugins/images/spritemap.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1347, '99cc9360eb5c063ee46655fd014ce2d4', './public/system/frame/css/plugins/images/spritemap_402x.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1348, 'd71cae691ca0e97be4009049374124ae', './public/system/frame/css/plugins/ionRangeSlider/ion.rangeSlider.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1349, 'b10247b2df69e4cc3bc8875cabb9a841', './public/system/frame/css/plugins/ionRangeSlider/ion.rangeSlider.skinFlat.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1350, '59e265c06da0d7f4f617094d04a09645', './public/system/frame/css/plugins/jasny/jasny-bootstrap.min.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1351, '247693b356502a1f18b403f10e4bca24', './public/system/frame/css/plugins/jqgrid/ui.jqgrid.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1352, 'e86ef2ebbe960443d5dddcba6e398211', './public/system/frame/css/plugins/jsTree/32px.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1353, '1126cb51ec4bfcc2da03b55557e41d70', './public/system/frame/css/plugins/jsTree/style.min.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1354, '9ed4669f524bec38319be63a2ee4ba26', './public/system/frame/css/plugins/jsTree/throbber.gif', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1355, '47a53108e8f4ac2e8546d8efc0ed0feb', './public/system/frame/css/plugins/markdown/bootstrap-markdown.min.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1356, '7caa6ec91fdb768f000d1a767907bb04', './public/system/frame/css/plugins/morris/morris-0.4.3.min.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1357, '4328ebe7fd79202cd2bd372c87a3fb11', './public/system/frame/css/plugins/nouslider/jquery.nouislider.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1358, 'e6cdd0ccbc5a05d6e054d8ec34e9609b', './public/system/frame/css/plugins/plyr/plyr.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1359, 'd24055bb6d758127b71580008eebde97', './public/system/frame/css/plugins/plyr/sprite.svg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1360, '33cf9e835e3b7132ea1098edd85cd7bb', './public/system/frame/css/plugins/simditor/simditor.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1361, '66a5146a843f8e536a1da6af5db26b71', './public/system/frame/css/plugins/steps/jquery.steps.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1362, '01879eabf6ff8d70bad4710e91fe62a2', './public/system/frame/css/plugins/summernote/summernote-bs3.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1363, '49e7a2f972d7e021e814016f27a402ab', './public/system/frame/css/plugins/summernote/summernote.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1364, '89514cd05fbd68ec5886d590dcc6b185', './public/system/frame/css/plugins/sweetalert/sweetalert.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1365, '6a95ddda069c68ed5a334872b2f1dc9e', './public/system/frame/css/plugins/switchery/switchery.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1366, 'a5f668eafe77e4972d39595522e9a123', './public/system/frame/css/plugins/toastr/toastr.min.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1367, '165ce368904f08e18472ea35a1bb74be', './public/system/frame/css/plugins/treeview/bootstrap-treeview.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1368, 'ca70e29d4161ce4494199f2d088e98ca', './public/system/frame/css/plugins/webuploader/webuploader.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1369, '24b18a3f137a1809849ecbed51a0ec4e', './public/system/frame/css/style.min.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1370, '45c73723862c6fc5eb3d6961db2d71fb', './public/system/frame/fonts/fontawesome-webfont.eot', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1371, '193ccf5d770f27d23ed84561b96d6375', './public/system/frame/fonts/fontawesome-webfont.svg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1372, '7c87870ab40d63cfb8870c1f183f9939', './public/system/frame/fonts/fontawesome-webfont.ttf', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1373, 'dfb02f8f6d0cedc009ee5887cc68f1f3', './public/system/frame/fonts/fontawesome-webfont.woff', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1374, '4b5a84aaf1c9485e060c503a0ff8cadb', './public/system/frame/fonts/fontawesome-webfont.woff2', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1375, 'f4769f9bdb7466be65088239c12046d1', './public/system/frame/fonts/glyphicons-halflings-regular.eot', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1376, 'b55e9e3c1edc958b950e9c8cefeb7910', './public/system/frame/fonts/glyphicons-halflings-regular.svg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1377, 'e18bbf611f2a2e43afc071aa2f4e1512', './public/system/frame/fonts/glyphicons-halflings-regular.ttf', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1378, 'fa2772327f55d8198301fdb8bcfc8158', './public/system/frame/fonts/glyphicons-halflings-regular.woff', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1379, '448c34a56d699c29117adc64c43affeb', './public/system/frame/fonts/glyphicons-halflings-regular.woff2', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1380, '8f3abaa10b9a98880a0ba87a1744a255', './public/system/frame/img/1.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1381, '4990787de11666d9d94edbc718ddf071', './public/system/frame/img/a1.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1382, '9053bb860fb23722497df4bc2c25eaa3', './public/system/frame/img/a2.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1383, '9b6adf5c5f23ff87b3d9873809052831', './public/system/frame/img/a3.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1384, 'c7f148b2a45d68e1f2baba730dca2c78', './public/system/frame/img/a4.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1385, '4523359ec4ba32f807b1de8f213cf188', './public/system/frame/img/a5.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1386, 'c435098ccf06e4248d918f91ed0992c8', './public/system/frame/img/a6.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1387, 'bd835163b61fa2dd11579b2de70023fc', './public/system/frame/img/a7.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1388, 'cc608c637bec9117018cef0e4cc9c6dd', './public/system/frame/img/a8.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1389, '3c00f0f466522fbd0ef442917a71f55f', './public/system/frame/img/a9.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1390, '8ddad23ce6dcc70bf111b23ae022f10c', './public/system/frame/img/bg.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1391, '06773f8873a55483445586519da6aec5', './public/system/frame/img/iconfont-logo.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1392, 'c9ceb83c0a247ae47f54c3e1d3cb4bac', './public/system/frame/img/icons.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1393, '6326cd02ec7029ff4027da83ff09374f', './public/system/frame/img/index.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1394, '5112881784000c6cf6d81e5a8aa10f3c', './public/system/frame/img/index_4.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1395, '2da0807814ad64841cd597c4e8a653d1', './public/system/frame/img/loading-upload.gif', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1396, 'f6f30beb72f584e218bfec975eb1109d', './public/system/frame/img/locked.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1397, '31e21fdea575697a651cf4572562e398', './public/system/frame/img/login-background.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1398, 'f43a1ca7e9274d881d3b7ec00d102965', './public/system/frame/img/p1.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1399, 'b1d9bd8ff3834f780bc8aa565a73d306', './public/system/frame/img/p2.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1400, 'aa6af324962786fac1fcd19d856bbf3a', './public/system/frame/img/p3.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1401, '96660bd7d061e19f46a305390651f9e0', './public/system/frame/img/pay.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1402, 'dd5c23469d5041758ba1e774e91cce0f', './public/system/frame/img/profile.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1403, '38c934d558c5b12766781553c6279a32', './public/system/frame/img/profile_big.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1404, 'aec2294728d596978c9e016774171521', './public/system/frame/img/profile_small.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1405, '46732e763f50c337fecabcc42150d842', './public/system/frame/img/progress.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1406, '43c338754928ee7ed34b33b9e7c82dff', './public/system/frame/img/p_big1.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1407, '22508d7389277290584be5a09c16853e', './public/system/frame/img/p_big2.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1408, 'f9f491385463e7ffa95af8f8c17aea2a', './public/system/frame/img/p_big3.jpg', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1409, '8feae3652f626ba9ec74d14792de6b95', './public/system/frame/img/qr_code.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1410, 'b80425bbf53402d499d54c86ca365870', './public/system/frame/img/success.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1411, '681dfebf3a20ec9c580d8dc248eb6a6e', './public/system/frame/img/user.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1412, '61e4e8b958e12b2de6d125edadb99d38', './public/system/frame/img/wenku_logo.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1413, 'bb016859a3da8f4a2f167cc0957fc236', './public/system/frame/js/ajaxfileupload.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1414, '26412a9ee704fb23bb3d8cf69b353c29', './public/system/frame/js/bootstrap.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1415, '5f0d7d16252d8d902b2587ff321c2a9c', './public/system/frame/js/contabs.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1416, 'e04519104cf32b7d927d3e835235eac6', './public/system/frame/js/content.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1417, 'cac8652fc51ac0c89aaf66b007861acc', './public/system/frame/js/demo/bootstrap-table-demo.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1418, '012c5ec3fdd454b68e569ecf27d23549', './public/system/frame/js/demo/bootstrap_table_test.json', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1419, 'd74fcb8658be533529415c79de4ac691', './public/system/frame/js/demo/bootstrap_table_test2.json', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1420, '6f57fbda9b49eb5ecd083086144faa21', './public/system/frame/js/demo/echarts-demo.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1421, 'c5e303260bdc7acfa0429f99aeb8fb08', './public/system/frame/js/demo/flot-demo.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1422, '27ef6e2afbf91e8e060bbb51375586a0', './public/system/frame/js/demo/form-advanced-demo.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1423, 'b3724f3688dfbaa54d35b695911b1092', './public/system/frame/js/demo/form-validate-demo.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1424, '729baf3a49a79b2444f5370670f67c4d', './public/system/frame/js/demo/layer-demo.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1425, 'a67dd3114a7eb97a9b4e52a777352c60', './public/system/frame/js/demo/morris-demo.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1426, '580e9530777003bef2bc4e46ba56b222', './public/system/frame/js/demo/peity-demo.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1427, '6df496a99b938af8eb66abd66f439096', './public/system/frame/js/demo/photos.json', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1428, '4dc302d58fca0892de968ed922c81f07', './public/system/frame/js/demo/rickshaw-demo.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1429, '6d672fa92782537484ad3c445f07e067', './public/system/frame/js/demo/table_base.json', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1430, 'bbea5793b081a7348b62b60c43a56173', './public/system/frame/js/demo/treeview-demo.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1431, '47dad3d8f584774095b1a8fd3c0ba712', './public/system/frame/js/demo/webuploader-demo.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1432, '919c61afc0cddb0c26fd78a477c09088', './public/system/frame/js/hplus.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1433, 'e40ec2161fe7993196f23c8a07346306', './public/system/frame/js/jquery-2.1.1.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1434, 'd265fb1c3471e89602db44304eaa7f2a', './public/system/frame/js/jquery-ui-1.10.4.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1435, '6ae848a4a2b0f9aba906d6a136706fb8', './public/system/frame/js/jquery-ui.custom.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1436, 'f9c7afd05729f10f55b689f36bb20172', './public/system/frame/js/jquery.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1437, '6bac981949809f47d45723d827fda733', './public/system/frame/js/plugins/beautifyhtml/beautifyhtml.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1438, 'fdf76420adcd9e1d70ed1cf2a117acae', './public/system/frame/js/plugins/blueimp/jquery.blueimp-gallery.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1439, '1b8b2544030d53a6598f398fe0bb1299', './public/system/frame/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1440, '6ea8ea752d6ad4e93bb6f86f3eaf2e83', './public/system/frame/js/plugins/bootstrap-table/bootstrap-table.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1441, '6d06b83243a74ea85d9ed121e0ec901d', './public/system/frame/js/plugins/bootstrap-table/extensions/accent-neutralise/bootstrap-table-accent-neutralise.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1442, 'fbe59e9ab8e5acde666a34fc0c34973f', './public/system/frame/js/plugins/bootstrap-table/extensions/accent-neutralise/bootstrap-table-accent-neutralise.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1443, 'f3fdbbb637e4872c8f034ef0f1ff541e', './public/system/frame/js/plugins/bootstrap-table/extensions/angular/bootstrap-table-angular.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1444, '57c9bbef39cd0bc2cd60efda47a64074', './public/system/frame/js/plugins/bootstrap-table/extensions/angular/bootstrap-table-angular.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1445, '4ce17661b584e1170af5f753f1990661', './public/system/frame/js/plugins/bootstrap-table/extensions/cookie/bootstrap-table-cookie.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1446, '92f8919982fba18903c58a486b2a0b8c', './public/system/frame/js/plugins/bootstrap-table/extensions/cookie/bootstrap-table-cookie.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1447, '734dbd3e7ac174b39e85be73acf88032', './public/system/frame/js/plugins/bootstrap-table/extensions/editable/bootstrap-table-editable.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1448, '66ec82ccbf244c9f5f1b9f03bc602a17', './public/system/frame/js/plugins/bootstrap-table/extensions/editable/bootstrap-table-editable.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1449, '859ea0f9b6bc99adc1ca0f4f3f0e0d95', './public/system/frame/js/plugins/bootstrap-table/extensions/export/bootstrap-table-export.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1450, '3deda8b31d567502a0d3340577b7252f', './public/system/frame/js/plugins/bootstrap-table/extensions/export/bootstrap-table-export.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1451, 'bc505fa2780c9d0b2476df0981a84baf', './public/system/frame/js/plugins/bootstrap-table/extensions/filter/bootstrap-table-filter.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1452, '3e493ce1ae5a04dbb8972f8576c81994', './public/system/frame/js/plugins/bootstrap-table/extensions/filter/bootstrap-table-filter.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1453, '5a84bd00ef4db1463b016623a3ab789d', './public/system/frame/js/plugins/bootstrap-table/extensions/filter-control/bootstrap-table-filter-control.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1454, 'e62a0b761ffdeffdf8c9fb277065b441', './public/system/frame/js/plugins/bootstrap-table/extensions/filter-control/bootstrap-table-filter-control.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1455, '6e762a9b44a171e71695d0e67a148a2d', './public/system/frame/js/plugins/bootstrap-table/extensions/flat-json/bootstrap-table-flat-json.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1456, 'bfce47a991d1b251004aec02b723a283', './public/system/frame/js/plugins/bootstrap-table/extensions/flat-json/bootstrap-table-flat-json.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1457, '51bb99d3e39def05e2e48d8463ccfd34', './public/system/frame/js/plugins/bootstrap-table/extensions/group-by/bootstrap-table-group-by.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1458, '4b1e8cc357c5658ce74cc0a07547e65e', './public/system/frame/js/plugins/bootstrap-table/extensions/group-by/bootstrap-table-group-by.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1459, '6edc4faeda2b2845a5019dfebeda0e93', './public/system/frame/js/plugins/bootstrap-table/extensions/group-by/bootstrap-table-group-by.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1460, 'ad8e50e4f2735cce3cce4f6d23fee47b', './public/system/frame/js/plugins/bootstrap-table/extensions/group-by-v2/bootstrap-table-group-by.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1461, '0a552fb47e778ddb82edf86f2b21dc6d', './public/system/frame/js/plugins/bootstrap-table/extensions/group-by-v2/bootstrap-table-group-by.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1462, 'eea4fa106f718fc43b0bb8d18d19d26f', './public/system/frame/js/plugins/bootstrap-table/extensions/group-by-v2/bootstrap-table-group-by.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1463, '3589ad5db5d8732a3c09f6c640341c1a', './public/system/frame/js/plugins/bootstrap-table/extensions/key-events/bootstrap-table-key-events.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1464, 'b434b6e3b25ee6120165739359cd9da1', './public/system/frame/js/plugins/bootstrap-table/extensions/key-events/bootstrap-table-key-events.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1465, '258b3770ad6b3cc1a3b9d77bcd6b2470', './public/system/frame/js/plugins/bootstrap-table/extensions/mobile/bootstrap-table-mobile.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1466, '2a8acb8f24268434441c5f4cd4f32015', './public/system/frame/js/plugins/bootstrap-table/extensions/mobile/bootstrap-table-mobile.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1467, '0c7697213072698641798b481d480714', './public/system/frame/js/plugins/bootstrap-table/extensions/multiple-search/bootstrap-table-multiple-search.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1468, '8991a7aee75ceb61c4336d02c4196eb3', './public/system/frame/js/plugins/bootstrap-table/extensions/multiple-search/bootstrap-table-multiple-search.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1469, 'ec386a329d5cd7c39677192b61fb7b1a', './public/system/frame/js/plugins/bootstrap-table/extensions/multiple-sort/bootstrap-table-multiple-sort.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1470, 'eb864fc21ba084375661ecccc1f8d307', './public/system/frame/js/plugins/bootstrap-table/extensions/multiple-sort/bootstrap-table-multiple-sort.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1471, 'c71431e5248f80d3a3fd4726a12b85df', './public/system/frame/js/plugins/bootstrap-table/extensions/natural-sorting/bootstrap-table-natural-sorting.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1472, 'fa78f24b899919d08542b69e7dcb9092', './public/system/frame/js/plugins/bootstrap-table/extensions/natural-sorting/bootstrap-table-natural-sorting.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1473, '0e537d484b2a8ab11990e14a27518179', './public/system/frame/js/plugins/bootstrap-table/extensions/reorder-columns/bootstrap-table-reorder-columns.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1474, '32dcd5b0f0fa42eac7967407c804cd00', './public/system/frame/js/plugins/bootstrap-table/extensions/reorder-columns/bootstrap-table-reorder-columns.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1475, '8e7bfc5c9662ecb96c85ca3d66cce446', './public/system/frame/js/plugins/bootstrap-table/extensions/reorder-rows/bootstrap-table-reorder-rows.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1476, '1f488fa31b851137d5ad4d400b6f9b17', './public/system/frame/js/plugins/bootstrap-table/extensions/reorder-rows/bootstrap-table-reorder-rows.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1477, '2b88033f70c96c9b80c696de475477fd', './public/system/frame/js/plugins/bootstrap-table/extensions/reorder-rows/bootstrap-table-reorder-rows.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1478, '107794319ba0aca60b20a5033aac0e78', './public/system/frame/js/plugins/bootstrap-table/extensions/resizable/bootstrap-table-resizable.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1479, 'acf572ea346a65a8412e0906671e39d4', './public/system/frame/js/plugins/bootstrap-table/extensions/resizable/bootstrap-table-resizable.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1480, '120c3b82d69957c3ef26c9c040ae7909', './public/system/frame/js/plugins/bootstrap-table/extensions/sticky-header/bootstrap-table-sticky-header.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1481, '1930a042b88e3a036285e9c61873ff97', './public/system/frame/js/plugins/bootstrap-table/extensions/sticky-header/bootstrap-table-sticky-header.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1482, '7d3b52c0dcbd18cf1ec97781e4f7b327', './public/system/frame/js/plugins/bootstrap-table/extensions/sticky-header/bootstrap-table-sticky-header.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1483, '03e93b845d194472f07aef753ae98bd9', './public/system/frame/js/plugins/bootstrap-table/extensions/toolbar/bootstrap-table-toolbar.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1484, 'f87cad29b70e0b29688712a436296607', './public/system/frame/js/plugins/bootstrap-table/extensions/toolbar/bootstrap-table-toolbar.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1485, '7c1e886331ef94025129e9ae5d502294', './public/system/frame/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1486, '1a2edc99d8daa51d0479014018112bd5', './public/system/frame/js/plugins/chartJs/Chart.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1487, '48e92f631c7c0794c741e356abe3da74', './public/system/frame/js/plugins/chosen/chosen.jquery.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1488, '490f1015f398c3e71642ac82d0592b67', './public/system/frame/js/plugins/clockpicker/clockpicker.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1489, 'fb22a6e072bb774a7ec80a51f9b1124f', './public/system/frame/js/plugins/codemirror/codemirror.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1490, 'ade1bb7910f218552b3955e9e7c050d9', './public/system/frame/js/plugins/codemirror/mode/default.htm', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1491, '895325adfe7a31c30ff89cc5c8826ccd', './public/system/frame/js/plugins/codemirror/mode/javascript/default.htm', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1492, '7eca31d26ccac39492d326b7188505da', './public/system/frame/js/plugins/codemirror/mode/javascript/javascript.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1493, '00b58cadd3c32bba75167210f7ba849d', './public/system/frame/js/plugins/colorpicker/bootstrap-colorpicker.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1494, '8b45823bec0699d2cde8e9ca84e51a11', './public/system/frame/js/plugins/cropper/cropper.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1495, '818fdc785f97fa3feb063697bffb97de', './public/system/frame/js/plugins/datapicker/bootstrap-datepicker.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1496, '596bf800f9969586a117b1f70b8a5a4c', './public/system/frame/js/plugins/dataTables/dataTables.bootstrap.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1497, '342fc4d0d4ae048e6feeac804ef05f2c', './public/system/frame/js/plugins/dataTables/jquery.dataTables.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1498, '840a13f0080de1f702ca6426916d338b', './public/system/frame/js/plugins/diff_match_patch/diff_match_patch.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1499, 'f2c71e382b38dd45396ce91f96a89888', './public/system/frame/js/plugins/dropzone/dropzone.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1500, '70824a0e545011c32563c03f0761b70b', './public/system/frame/js/plugins/easypiechart/jquery.easypiechart.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1501, '1ecf36fa04eb5aa04becf05330961d26', './public/system/frame/js/plugins/echarts/echarts-all.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1502, '25da5cf0c6d6775df02a958162a5cac7', './public/system/frame/js/plugins/echarts/echarts-all.js.b', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1503, 'ee2f3a2ed3768d6be2ee9fab54cd53c2', './public/system/frame/js/plugins/echarts/echarts-all.js.b1', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1504, '325472601571f31e1bf00674c368d335', './public/system/frame/js/plugins/fancybox/blank.gif', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1505, '328cc0f6c78211485058d460e80f4fa8', './public/system/frame/js/plugins/fancybox/fancybox_loading.gif', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1506, 'f92938639fa894a0e8ded1c3368abe98', './public/system/frame/js/plugins/fancybox/fancybox_loading_402x.gif', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1507, '77aeaa52715b898b73c74d68c630330e', './public/system/frame/js/plugins/fancybox/fancybox_overlay.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1508, '783d4031fe50c3d83c960911e1fbc705', './public/system/frame/js/plugins/fancybox/fancybox_sprite.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1509, 'ed9970ce22242421e66ff150aa97fe5f', './public/system/frame/js/plugins/fancybox/fancybox_sprite_402x.png', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1510, '23f5ceb1f26f5497cbbc7f6f37b82fe9', './public/system/frame/js/plugins/fancybox/jquery.fancybox.css', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1511, 'ce0e799634e091e39ea6e49b12a95d14', './public/system/frame/js/plugins/fancybox/jquery.fancybox.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1512, 'f4e8016f2fc749c4a66373d5a3f8fffa', './public/system/frame/js/plugins/flot/curvedLines.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1513, '32e479a83d47391e87b4d3f4703f5561', './public/system/frame/js/plugins/flot/jquery.flot.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1514, 'a50fe06da186c171e81473ed62c6bb15', './public/system/frame/js/plugins/flot/jquery.flot.pie.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1515, '931b6c2c413c91e716faca2461fe95cc', './public/system/frame/js/plugins/flot/jquery.flot.resize.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1516, '204161f30a99defbf20fa10721ea45ea', './public/system/frame/js/plugins/flot/jquery.flot.spline.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1517, '022e8fd8f6b68a7c3f141a30e7eb9eaf', './public/system/frame/js/plugins/flot/jquery.flot.symbol.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1518, '56c29dd4e3c4961e76d71ddfb739d3c8', './public/system/frame/js/plugins/flot/jquery.flot.tooltip.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1519, '2855021f41f66d5c778338bbf896c742', './public/system/frame/js/plugins/footable/footable.all.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1520, 'e22ba0c348f15d3d102642c993f92d61', './public/system/frame/js/plugins/fullcalendar/fullcalendar.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1521, 'e78d3fcf0bf309416d930a40c74ee500', './public/system/frame/js/plugins/gritter/images/gritter-light.png', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1522, 'e6bf207bb4ab9d76d812353b9684e34e', './public/system/frame/js/plugins/gritter/images/gritter.png', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1523, 'df3e567d6f16d040326c7a0ea29a4f41', './public/system/frame/js/plugins/gritter/images/ie-spacer.gif', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1524, 'a119207c61dc56c06d21f85d5a4598dd', './public/system/frame/js/plugins/gritter/jquery.gritter.css', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1525, 'a4cf016eab71d5d71a162820bd751bf2', './public/system/frame/js/plugins/gritter/jquery.gritter.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1526, '65144d3f977f76227bc360430e50a929', './public/system/frame/js/plugins/iCheck/icheck.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1527, '732c0f827b48ea03c809c7dbfe67ff94', './public/system/frame/js/plugins/ionRangeSlider/ion.rangeSlider.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1528, '64d4b747381d6936ea815c249b440a03', './public/system/frame/js/plugins/jasny/jasny-bootstrap.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1529, '913a7f8d4882bfb3826ef01c7ea07732', './public/system/frame/js/plugins/jeditable/jquery.jeditable.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1530, 'f92dd5dda33454fc5bdd42769f7cede1', './public/system/frame/js/plugins/jqgrid/i18n/grid.locale-cn.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1531, '405914ccfceb685a15d0796c982e1915', './public/system/frame/js/plugins/jqgrid/jquery.jqGrid.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1532, 'd265fb1c3471e89602db44304eaa7f2a', './public/system/frame/js/plugins/jquery-ui/jquery-ui.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1533, 'e1c1f37c8eac50220c31a2571ac9916f', './public/system/frame/js/plugins/jsKnob/jquery.knob.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1534, '14e3eafa2631c7b68aaec169f729a2d8', './public/system/frame/js/plugins/jsTree/jstree.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1535, '3d987a6636af4f5c5c90cccfc68ceeb8', './public/system/frame/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1536, 'e23a59cb47d6e6467c75652a5d6385cf', './public/system/frame/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1537, '76f6f55f4c3464416b9561503af69dbb', './public/system/frame/js/plugins/layer/extend/layer.ext.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1538, '801692590a634436f2628f74c4aa57e8', './public/system/frame/js/plugins/layer/laydate/laydate.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1539, '70ed32c378eee8be85851d1be7c591ad', './public/system/frame/js/plugins/layer/laydate/need/laydate.css', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1540, '117d7e4b7e0fe6774616872b1b1edf33', './public/system/frame/js/plugins/layer/laydate/skins/default/icon.png', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1541, 'f52788bd231e60084217c081778f0994', './public/system/frame/js/plugins/layer/laydate/skins/default/laydate.css', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1542, 'b5994e8bb01ba245fc86fb5f3349c0d7', './public/system/frame/js/plugins/layer/layer.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1543, 'da9a9ebdaf89cb94c774f22318f95a0f', './public/system/frame/js/plugins/layer/layim/data/chatlog.json', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1544, '6620c0cc04b8252e138f0cb71edc141d', './public/system/frame/js/plugins/layer/layim/data/friend.json', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1545, '6ab361115031a49a706ba19d9fc5814d', './public/system/frame/js/plugins/layer/layim/data/group.json', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1546, 'f6c42901fc3b570fb9457a5433c5a7d7', './public/system/frame/js/plugins/layer/layim/data/groups.json', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1547, '12ffa9de2d261ee2ccadf559b89d4da9', './public/system/frame/js/plugins/layer/layim/layim.css', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1548, 'f86c8ff055152281bbbee371b7df8f60', './public/system/frame/js/plugins/layer/layim/layim.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1549, 'c06505e8e2ee6e8aa6e832588db32e6c', './public/system/frame/js/plugins/layer/layim/loading.gif', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1550, '664c833b08c3ccf81fe2f7edc4fa456e', './public/system/frame/js/plugins/layer/skin/layer.css', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1551, '9d6b1dd70f124df9c322eb9683d045a7', './public/system/frame/js/plugins/layer/skin/layer.ext.css', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1552, 'ebfcbd9139bac19c105506acf2842fd7', './public/system/frame/js/plugins/layer/skin/moon/style.css', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1553, 'a0d34da5fd1cee5902be897cd11c539b', './public/system/frame/js/plugins/markdown/bootstrap-markdown.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1554, 'e11228011d50b3f07e7284717cb376d8', './public/system/frame/js/plugins/markdown/bootstrap-markdown.zh.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1555, 'c6462d13efd635c23cefd8c8150b4d40', './public/system/frame/js/plugins/markdown/markdown.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1556, '50012c0493d4a62719e7074d7c09c9b8', './public/system/frame/js/plugins/markdown/to-markdown.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1557, '5267e527a800d64e4ea4c4bf615661c9', './public/system/frame/js/plugins/metisMenu/jquery.metisMenu.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1558, 'd995698f8d57da5bb3b17b209911be84', './public/system/frame/js/plugins/morris/morris.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1559, '29b50e25f419b20fe33240e6af9bd12b', './public/system/frame/js/plugins/morris/morris.js.b', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1560, 'ffd330bd214b7b0a8e14e613765b606e', './public/system/frame/js/plugins/morris/raphael-2.1.0.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1561, '3b5a0f7718f1890f57ff772e4a09b567', './public/system/frame/js/plugins/nestable/jquery.nestable.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1562, 'e42900b8af9a61da5be53e9eb9c5f6bc', './public/system/frame/js/plugins/nouslider/jquery.nouislider.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1563, 'e9f4e57a6184dfe2478260785e83015f', './public/system/frame/js/plugins/pace/pace.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1564, '3b33a2736848965593e3ed5e04206d48', './public/system/frame/js/plugins/peity/jquery.peity.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1565, '1b4a204e70dd613c46328cab2de89103', './public/system/frame/js/plugins/plyr/plyr.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1566, 'c973ed7c4369cd5e84af541c5548f74f', './public/system/frame/js/plugins/preetyTextDiff/jquery.pretty-text-diff.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1567, 'a19a47d8227e234c315fb0319803c1d9', './public/system/frame/js/plugins/prettyfile/bootstrap-prettyfile.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1568, '3d25ff8a5ea9bda1a7581a4cee0cef20', './public/system/frame/js/plugins/rickshaw/rickshaw.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1569, 'cbec063c32d61e84726c2843b1634026', './public/system/frame/js/plugins/rickshaw/vendor/d3.v3.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1570, 'e6c2f6b692e06fdc3abaaf79db055c4c', './public/system/frame/js/plugins/simditor/hotkeys.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1571, 'bf3823e7105998f268282a813362507c', './public/system/frame/js/plugins/simditor/module.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1572, 'ecc034a2f811eea394e7c202901569b9', './public/system/frame/js/plugins/simditor/simditor.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1573, '2464bb0e707726d95a7372c97fbdacf3', './public/system/frame/js/plugins/simditor/uploader.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1574, '300029d63e86f68c6b426e4e0ca9bcf8', './public/system/frame/js/plugins/slimscroll/jquery.slimscroll.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1575, '038d9f982a802e6b19ef246d092175dc', './public/system/frame/js/plugins/sparkline/jquery.sparkline.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1576, 'f08c3b5b9e12083ca35f9359733babd4', './public/system/frame/js/plugins/staps/jquery.steps.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1577, '35c1c4807033c980218374331755a8fa', './public/system/frame/js/plugins/suggest/bootstrap-suggest.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1578, '8fb1ea79bc5eee1328bf1ee39b514495', './public/system/frame/js/plugins/suggest/data.json', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1579, '0a0f46abd088a0f53c35588c7d229eb7', './public/system/frame/js/plugins/summernote/summernote-zh-CN.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1580, '14c47e48a89c1dde0c9511d6113d46a0', './public/system/frame/js/plugins/summernote/summernote.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1581, '1a797dfa4b866bee5173b86f726dc310', './public/system/frame/js/plugins/sweetalert/sweetalert.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1582, '762cbe606b83b4b2e2136eef79716028', './public/system/frame/js/plugins/switchery/switchery.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1583, 'fbfb0c81631e4e58fe947463d7d48d87', './public/system/frame/js/plugins/toastr/toastr.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1584, 'a068d565238e1d58fcf47b674a60e222', './public/system/frame/js/plugins/treeview/bootstrap-treeview.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1585, '72627ce0ff3d2c903f72befe45bf7ccf', './public/system/frame/js/plugins/validate/jquery.validate.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1586, 'bcff7273495787e551175e6bf433cfdf', './public/system/frame/js/plugins/validate/messages_zh.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1587, 'db46172e66d5600ef9a53644131167c9', './public/system/frame/js/plugins/webuploader/webuploader.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1588, '3cdc65ae49a0eeb2ec2b9aead627dab1', './public/system/frame/js/welcome.min.js', '1556518592', '1547197830', '1556518592');
INSERT INTO `eb_system_file` VALUES (1589, '204f4711f899c1aa766791daafc7a552', './public/system/frame/plugins/fullavatareditor/expressInstall.swf', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1590, 'e57b57a54fa35dbb5a228e00d6c1c16e', './public/system/frame/plugins/fullavatareditor/fullAvatarEditor.swf', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1591, '64839e3a297f985c09c342ff4a36aef1', './public/system/frame/plugins/fullavatareditor/scripts/demo.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1592, 'd9ca31ee1198e519a7425ac7edca24bf', './public/system/frame/plugins/fullavatareditor/scripts/fullAvatarEditor.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1593, 'd9ca31ee1198e519a7425ac7edca24bf', './public/system/frame/plugins/fullavatareditor/scripts/fullAvatarEditor.js.b', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1594, '6df60685d380a26bd8ca2671ec564390', './public/system/frame/plugins/fullavatareditor/scripts/jQuery.Cookie.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1595, '9274f7e22858c923505a96d173d42a04', './public/system/frame/plugins/fullavatareditor/scripts/swfobject.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1596, '9274f7e22858c923505a96d173d42a04', './public/system/frame/plugins/fullavatareditor/scripts/swfobject.js.b', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1597, '982fd962544bcab09f6c1d5ace746842', './public/system/frame/plugins/fullavatareditor/scripts/test.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1598, 'a7c10ef75327c9c51401b8acae1454bf', './public/system/images/001.jpg', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1599, 'c3e4db490cc2e3de60290ffefb3c4127', './public/system/images/admin_logo.png', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1600, '52ab56e129de8a26b97237146e1f19ad', './public/system/images/bg-logo.jpg', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1601, '4d5ad1ad526ac91ee497c2ccf5f5a7ba', './public/system/images/error.png', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1602, 'cfd4b538dc1d8b96a09310cab5fa44c9', './public/system/images/head.gif', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1603, '993d2fdda8e32a49c8696549a42b8262', './public/system/images/index.png', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1604, '0045fd55170554cbf71bf895cda72ff3', './public/system/images/logo.png', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1605, '544fc30e6b6e9d334d81dac6a47cd65b', './public/system/images/mobile_foot.png', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1606, '1c93128220dc4933a1698b5101140b07', './public/system/images/mobile_head.png', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1607, '60765cc824257d8e718fb08c66375107', './public/system/js/create.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1608, '33d37b39cb4edad2943dd9fb31733f19', './public/system/js/index.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1609, 'f52a9f435413be68a22e4bc1b842705a', './public/system/js/layuiList.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1610, 'ab66401d78013fb07912c7460c438411', './public/system/module/error/css/reset-2.0.css', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1611, '901fd7ec68940f7fe9d260adfa6b3a6b', './public/system/module/error/css/style.css', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1612, 'e573789ff03ad5b05e1f9a5bf2e48ca8', './public/system/module/error/images/01.jpg', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1613, 'cd64fd136d56db19dc6f5e0c279e6c56', './public/system/module/error/images/01.png', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1614, '3e9fb8ecd1a45951a971a95bc9a2c25f', './public/system/module/error/images/02.png', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1615, 'b762076fd5aaaceec3e9515f15d2c3e8', './public/system/module/error/images/03.png', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1616, '79d81eb10e31cb868dcfc1c320e90a0d', './public/system/module/error/images/04.png', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1617, '0c654a24811c8ce32f964b9a32efff86', './public/system/module/error/images/back-icon.png', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1618, '499506ace3f5de5b42f478122c49e92a', './public/system/module/error/images/failure-icon.png', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1619, 'afaf0c6951fc2290ec2e0d6a72f3d0fd', './public/system/module/error/images/refresh-iocn.png', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1620, '0e3458c75b0f32c7c733c1eb1236d58f', './public/system/module/exception/css/style.css', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1621, '8671869d7112ee5f5bdd69e8f9e5f9b4', './public/system/module/exception/images/errorPageBorder.png', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1622, 'e92a8b840286ecc78a6f31e4eb9c6017', './public/system/module/index/index.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1623, '885cb60cec7b8898e8a83906e01386c8', './public/system/module/login/flaotfont.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1624, 'be000d2fc003a66be315003da6ace53e', './public/system/module/login/index.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1625, '8eaf543ea91a9400e1d1d870039178f8', './public/system/module/login/ios-parallax.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1626, 'ab66401d78013fb07912c7460c438411', './public/system/module/success/css/reset-2.0.css', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1627, 'f62d65954ec04e247e1a4512c2c4a801', './public/system/module/success/images/success-icon.png', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1628, 'a03b020d23eb70f4b64b87d7a7bb91c7', './public/system/module/wechat/news/css/index.css', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1629, '35398d4c5e0dbcdda859a36d9a7401bf', './public/system/module/wechat/news/css/style.css', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1630, '6b00566e6a7a54df0b83fe8a1d8b9427', './public/system/module/wechat/news/images/image.png', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1631, '39cd4d354244df85bed84d0da61d0a96', './public/system/module/wechat/news_category/css/style.css', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1632, '05922b4441d7abd0c9b1499235f5f408', './public/system/module/widget/images.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1633, '9c7ebd0f3f2b72e1dbc39b532a23b7a2', './public/system/plug/form-create/form-create.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1634, '359a04c6af9d438c31908eef96e9a928', './public/system/plug/iview/dist/iview.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1635, '30173fd15782a5653e5c1b234521a959', './public/system/plug/iview/dist/iview.min.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1636, 'a4591f9285817b3096881112430e4505', './public/system/plug/iview/dist/locale/de-DE.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1637, '4333bc8adac238a5d020b396126bd42b', './public/system/plug/iview/dist/locale/en-US.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1638, '62c5469b2dc3d06e43775781fe345598', './public/system/plug/iview/dist/locale/es-ES.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1639, '7cd6a5caafff87f609ce78a076a44643', './public/system/plug/iview/dist/locale/fr-FR.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1640, 'c052220f96815a15b1f68c1fd4f7ee12', './public/system/plug/iview/dist/locale/id-ID.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1641, '5fad473ad29a2ca3005e81918eba4038', './public/system/plug/iview/dist/locale/ja-JP.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1642, 'a147e39fc3f1fcc10d8d7b0d949ae123', './public/system/plug/iview/dist/locale/ko-KR.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1643, '522aa18fb0e6fd7370aea1e2888d6a4b', './public/system/plug/iview/dist/locale/pt-BR.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1644, 'ced8fbbbc266a42b4f20a0a909be2491', './public/system/plug/iview/dist/locale/pt-PT.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1645, '31ec5dbdd426ce6bfebc21c4c8858016', './public/system/plug/iview/dist/locale/ru-RU.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1646, 'c10e6a171e98a3dac5f34f738c808a68', './public/system/plug/iview/dist/locale/sv-SE.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1647, 'f5ea82d56a1e757e17b25f0ab1bd407e', './public/system/plug/iview/dist/locale/tr-TR.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1648, '30c93bd10e9a17601a3120c633ce6e45', './public/system/plug/iview/dist/locale/vi-VN.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1649, 'c0de3c748f7b067d4a08289176c38761', './public/system/plug/iview/dist/locale/zh-CN.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1650, 'c8b21eba8334d31d063d2eeb8ccea94d', './public/system/plug/iview/dist/locale/zh-TW.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1651, '2c2ae068be3b089e0a5b59abb1831550', './public/system/plug/iview/dist/styles/fonts/ionicons.eot', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1652, '621bd386841f74e0053cb8e67f8a0604', './public/system/plug/iview/dist/styles/fonts/ionicons.svg', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1653, '24712f6c47821394fba7942fbb52c3b2', './public/system/plug/iview/dist/styles/fonts/ionicons.ttf', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1654, '05acfdb568b3df49ad31355b19495d4a', './public/system/plug/iview/dist/styles/fonts/ionicons.woff', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1655, '8ffbb5a88713c5d685d974a4fc839d40', './public/system/plug/iview/dist/styles/iview.css', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1656, 'f051459ded214178b064b37209d9398c', './public/system/plug/requirejs/bin/r.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1657, '4bead4b1b0a417582825231dbfe121b1', './public/system/plug/requirejs/package.json', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1658, 'b9c130e7f47765cadef3f4a80ad3b412', './public/system/plug/requirejs/README.md', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1659, 'e7199843dfd445bb66ec816e98a03214', './public/system/plug/requirejs/require.js', '1556518593', '1547197830', '1556518593');
INSERT INTO `eb_system_file` VALUES (1660, '2986171b3f9f5967e0faa144eaacd222', './public/system/plug/umeditor/dialogs/emotion/emotion.css', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1661, 'bbba1bb2a8e3845a4da9dfc37e9041d4', './public/system/plug/umeditor/dialogs/emotion/emotion.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1662, '629ccc774aed95b2c6bec91151f7292d', './public/system/plug/umeditor/dialogs/emotion/images/0.gif', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1663, '6ea3533c3b0adbe19467ebccd1a7afa1', './public/system/plug/umeditor/dialogs/emotion/images/bface.gif', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1664, '5d39be760e912b058a42fc59b3731bec', './public/system/plug/umeditor/dialogs/emotion/images/cface.gif', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1665, 'a4fc234a5ca005ba8845b36a09004738', './public/system/plug/umeditor/dialogs/emotion/images/fface.gif', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1666, '1085988d048e25ad630451eba57dc09d', './public/system/plug/umeditor/dialogs/emotion/images/jxface2.gif', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1667, '4869b022d6ba52d8c4312e9f40564efd', './public/system/plug/umeditor/dialogs/emotion/images/neweditor-tab-bg.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1668, '30e42f9792a388ea7b049ee8715ce8fa', './public/system/plug/umeditor/dialogs/emotion/images/tface.gif', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1669, '647a02b861c53e54d603db363aeec236', './public/system/plug/umeditor/dialogs/emotion/images/wface.gif', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1670, '43c43aada4dd1ec8bc352f092e39c7b0', './public/system/plug/umeditor/dialogs/emotion/images/yface.gif', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1671, 'b485ad9dca112e4cebe66de8923f59b2', './public/system/plug/umeditor/dialogs/formula/formula.css', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1672, 'a31a4f477981ae56e36b9337455355f1', './public/system/plug/umeditor/dialogs/formula/formula.html', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1673, 'a10cf46d604d95ceea7b27d4ca3bc1f5', './public/system/plug/umeditor/dialogs/formula/formula.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1674, 'f11cc42b343d3dd137b23e4ef9de76d9', './public/system/plug/umeditor/dialogs/formula/images/formula.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1675, '25f2465d1d9ec6b9c3d3d089b8bc7405', './public/system/plug/umeditor/dialogs/image/image.css', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1676, 'a6b5ceede5de10ccede5842caafbf445', './public/system/plug/umeditor/dialogs/image/image.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1677, '7b23a0c7d197e0c5557b714bd7161162', './public/system/plug/umeditor/dialogs/image/images/close.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1678, '58a9aef441d29f473da8266a5b44e389', './public/system/plug/umeditor/dialogs/image/images/upload1.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1679, '50745e5aea6a0dd22ac107dc0d8c2216', './public/system/plug/umeditor/dialogs/image/images/upload2.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1680, '18571dbbe29b49ba038ce1d24c88674e', './public/system/plug/umeditor/dialogs/link/link.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1681, '258c0588e53f292f3bac2f4eb4253d39', './public/system/plug/umeditor/dialogs/map/map.html', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1682, '007b2f0a48f50424adb9729eea38ade5', './public/system/plug/umeditor/dialogs/map/map.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1683, '13813ba01bf8267721a8a9d9ea56bf90', './public/system/plug/umeditor/dialogs/video/images/center_focus.jpg', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1684, 'e6f556abcbe48e0115995bcc106a8531', './public/system/plug/umeditor/dialogs/video/images/left_focus.jpg', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1685, '85b08393f830bcc62c1376252b807f81', './public/system/plug/umeditor/dialogs/video/images/none_focus.jpg', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1686, '17e1af76de01403df026af28cc4aecda', './public/system/plug/umeditor/dialogs/video/images/right_focus.jpg', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1687, '8ea7009849ed2eb55f6b2305e00d7350', './public/system/plug/umeditor/dialogs/video/video.css', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1688, '5c9d2e4f5d64f397b50715b7730268bf', './public/system/plug/umeditor/dialogs/video/video.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1689, '66cd701eef0e71bce692429f0ca90c22', './public/system/plug/umeditor/lang/en/en.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1690, '88e7d05b61025278ff1b1230cfd21aa5', './public/system/plug/umeditor/lang/en/images/addimage.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1691, '1eb887698a395ffb7f1a6175d05442af', './public/system/plug/umeditor/lang/en/images/alldeletebtnhoverskin.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1692, '6d7265b07429ceca1b03fce1e9266e14', './public/system/plug/umeditor/lang/en/images/alldeletebtnupskin.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1693, 'd3320c66e053049d1fed97de1422006b', './public/system/plug/umeditor/lang/en/images/background.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1694, 'dfa3aef5fe3087a5450753aa28529304', './public/system/plug/umeditor/lang/en/images/button.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1695, 'b512aa9fa0ee7783ff516f9f0828b060', './public/system/plug/umeditor/lang/en/images/copy.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1696, '4c5b9e9ad29724e8a1296059523d56f5', './public/system/plug/umeditor/lang/en/images/deletedisable.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1697, 'b012453148feba7207940356f0db91e2', './public/system/plug/umeditor/lang/en/images/deleteenable.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1698, '89afeb92719844076f19f20c03331226', './public/system/plug/umeditor/lang/en/images/imglabel.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1699, '3ad9255e6398f1694395b0e0c3d330a4', './public/system/plug/umeditor/lang/en/images/listbackground.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1700, '98b6c213a9b89b7959da7aeb7368c738', './public/system/plug/umeditor/lang/en/images/localimage.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1701, '2cd78f0b4eb01b8f00a44bfb029e3824', './public/system/plug/umeditor/lang/en/images/music.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1702, '6cae1397f4ae4f052293ca7a42fdf16c', './public/system/plug/umeditor/lang/en/images/rotateleftdisable.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1703, '9e6628c34db960d682a591bc24d4f557', './public/system/plug/umeditor/lang/en/images/rotateleftenable.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1704, '34206a03b2459da6ad36ff6ad2998fa0', './public/system/plug/umeditor/lang/en/images/rotaterightdisable.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1705, 'bfc1b0155bfe9e60373c6e7f131f2771', './public/system/plug/umeditor/lang/en/images/rotaterightenable.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1706, '9da36dab96ef97bf14115b4bd5169e78', './public/system/plug/umeditor/lang/en/images/upload.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1707, '40644255bb10f102763cbce4a3a2f7d9', './public/system/plug/umeditor/lang/zh-cn/images/copy.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1708, 'a4d92a42a41238e43e2874c2c31582f9', './public/system/plug/umeditor/lang/zh-cn/images/imglabel.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1709, 'c754e6ca1921cd639739499d3cf45875', './public/system/plug/umeditor/lang/zh-cn/images/localimage.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1710, '6d299069db6f24cf2ba1a90a64b49db7', './public/system/plug/umeditor/lang/zh-cn/images/music.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1711, 'e0a1a76441b4da770097e1af0a650b93', './public/system/plug/umeditor/lang/zh-cn/images/upload.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1712, '0536481fe18c84e2a393259bda2f381d', './public/system/plug/umeditor/lang/zh-cn/zh-cn.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1713, 'ae2992f67384cafed0bf8e42a9e4b75f', './public/system/plug/umeditor/php/getContent.php', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1714, '79b4687609be6e1f8c948f246c668a21', './public/system/plug/umeditor/php/imageUp.php', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1715, '5abd584d7a3167cc1c9c4ff23d350aeb', './public/system/plug/umeditor/php/Uploader.class.php', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1716, '0aad127afb5d3d45bc734158c83ad30c', './public/system/plug/umeditor/themes/default/css/umeditor.css', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1717, '4728fa5d5a548462b0df0cc3638fb02d', './public/system/plug/umeditor/themes/default/css/umeditor.min.css', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1718, '84941c498e2abb7988d343d9df530077', './public/system/plug/umeditor/themes/default/images/caret.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1719, '9b8e2f524d19c85e0026a33796182115', './public/system/plug/umeditor/themes/default/images/close.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1720, '5f8a63bf407967d5ac160c839d50aabe', './public/system/plug/umeditor/themes/default/images/icons.gif', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1721, 'c4f73e335fcc0b33db904909ae99475e', './public/system/plug/umeditor/themes/default/images/icons.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1722, '45c75be70f44e5712f166d22f0a2504e', './public/system/plug/umeditor/themes/default/images/ok.gif', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1723, 'fa743a8e18903aa44727fdda3dad4807', './public/system/plug/umeditor/themes/default/images/pop-bg.png', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1724, 'df3e567d6f16d040326c7a0ea29a4f41', './public/system/plug/umeditor/themes/default/images/spacer.gif', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1725, 'f857581368e75fcada43649be5de483b', './public/system/plug/umeditor/themes/default/images/videologo.gif', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1726, '628072e7212db1e8cdacb22b21752cda', './public/system/plug/umeditor/third-party/jquery.min.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1727, 'b1af7bbd3cea93a60bf68cf571ad6cab', './public/system/plug/umeditor/third-party/mathquill/font/stixgeneral-bundle/STIXFontLicense2010.txt', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1728, '3ead76b2082228a75edf84c00c5477c7', './public/system/plug/umeditor/third-party/mathquill/font/stixgeneral-bundle/stixgeneral-webfont.eot', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1729, '30f0f43b350904c1e58186674cf46306', './public/system/plug/umeditor/third-party/mathquill/font/stixgeneral-bundle/stixgeneral-webfont.svg', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1730, '2ca57df1ad9421422eebb36b03aceea9', './public/system/plug/umeditor/third-party/mathquill/font/stixgeneral-bundle/stixgeneral-webfont.ttf', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1731, '26e3c55cff231fcc0826b8cca003e7f9', './public/system/plug/umeditor/third-party/mathquill/font/stixgeneral-bundle/stixgeneral-webfont.woff', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1732, '827773c0af0c03b4c944c10f2534a405', './public/system/plug/umeditor/third-party/mathquill/font/stixgeneral-bundle/stixgeneralbol-webfont.eot', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1733, '39f79995d4f5c15cfa7d1e8a4ca0b122', './public/system/plug/umeditor/third-party/mathquill/font/stixgeneral-bundle/stixgeneralbol-webfont.svg', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1734, 'f8a321822630f4adfe89eef680b5e33f', './public/system/plug/umeditor/third-party/mathquill/font/stixgeneral-bundle/stixgeneralbol-webfont.ttf', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1735, 'ce70b34a2fd253deac2b7a294cd566c6', './public/system/plug/umeditor/third-party/mathquill/font/stixgeneral-bundle/stixgeneralbol-webfont.woff', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1736, '727a7fb84c1db602e74d8fb20714791c', './public/system/plug/umeditor/third-party/mathquill/font/stixgeneral-bundle/stixgeneralbolita-webfont.eot', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1737, '7bcbb2bf1e04b2458e0fbba8bb182f4e', './public/system/plug/umeditor/third-party/mathquill/font/stixgeneral-bundle/stixgeneralbolita-webfont.svg', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1738, 'a1f259dc8fd8263c926559da16c1d1ce', './public/system/plug/umeditor/third-party/mathquill/font/stixgeneral-bundle/stixgeneralbolita-webfont.ttf', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1739, 'dc8d21944741d366179418bb17515edb', './public/system/plug/umeditor/third-party/mathquill/font/stixgeneral-bundle/stixgeneralbolita-webfont.woff', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1740, '179645aaa47e148ec0ec78a89ae6c7a0', './public/system/plug/umeditor/third-party/mathquill/font/stixgeneral-bundle/stixgeneralitalic-webfont.eot', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1741, 'bc5dcd8fd5b0922f2d219c9640903929', './public/system/plug/umeditor/third-party/mathquill/font/stixgeneral-bundle/stixgeneralitalic-webfont.svg', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1742, 'edc5cda09ec11f6bb35a68993af422db', './public/system/plug/umeditor/third-party/mathquill/font/stixgeneral-bundle/stixgeneralitalic-webfont.ttf', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1743, 'aed55dccb65ef93aa9e2ae02e604d534', './public/system/plug/umeditor/third-party/mathquill/font/stixgeneral-bundle/stixgeneralitalic-webfont.woff', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1744, 'e4ae9ff7ac2476ae421fc4278e5d3806', './public/system/plug/umeditor/third-party/mathquill/font/Symbola.eot', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1745, '4621fcfd9def63c694914f7ec5add610', './public/system/plug/umeditor/third-party/mathquill/font/Symbola.otf', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1746, '20db57ba32a046dfea3c30519898b278', './public/system/plug/umeditor/third-party/mathquill/font/Symbola.svg', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1747, '52a6aac18ae26b6ecbd4f3a0d9579c9f', './public/system/plug/umeditor/third-party/mathquill/font/Symbola.ttf', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1748, '72981090d0240678c5d0a964fe29f082', './public/system/plug/umeditor/third-party/mathquill/font/Symbola.woff', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1749, 'c3deba51bd3bf360e8e79e368fb8571e', './public/system/plug/umeditor/third-party/mathquill/mathquill.css', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1750, 'a13a67d334416c042d5d4508b0044c1f', './public/system/plug/umeditor/third-party/mathquill/mathquill.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1751, 'aeddfdf8062e887e58ba144baa73ee95', './public/system/plug/umeditor/third-party/mathquill/mathquill.min.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1752, '63247d4e8047fc210dfa4e412d279bb7', './public/system/plug/umeditor/third-party/template.min.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1753, 'a49cc3e20ba5fba4400bd207f3388899', './public/system/plug/umeditor/umeditor.config.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1754, 'bb756f307a8166dfc34df1e77291d713', './public/system/plug/umeditor/umeditor.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1755, '1decfd5bb39b92078468e96255e5b2f2', './public/system/plug/umeditor/umeditor.min.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1756, 'e56d8571fcc081901ebc3eca11f6ac70', './public/system/plug/validate/jquery.validate.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1757, 'a64ac1319064e7e88d336ce95f667d52', './public/system/plug/vue/dist/README.md', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1758, '55aa848bc74dde42637d7ae96f38ec01', './public/system/plug/vue/dist/vue.common.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1759, '7f7d01342623404fe6dadc6bea8a5d22', './public/system/plug/vue/dist/vue.esm.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1760, '037d997219804a79cea6540312fc8e0a', './public/system/plug/vue/dist/vue.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1761, '7e052e2850e70a8db1bd837e08ddda83', './public/system/plug/vue/dist/vue.min.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1762, '917f70e72ec5e171ea46987517925f1e', './public/system/plug/vue/dist/vue.runtime.common.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1763, '9eb63dbfb2badb381a3b6892b4da9f04', './public/system/plug/vue/dist/vue.runtime.esm.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1764, 'bd3852d9ff082206759b1d322eeccfe8', './public/system/plug/vue/dist/vue.runtime.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1765, '3901c2214f7cbdf0dc2c962e3cc1a5ad', './public/system/plug/vue/dist/vue.runtime.min.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1766, '184fcd1d7a8bad538700f1cf22431d8b', './public/system/util/mpFrame-compiled.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1767, '3c099e7d67872eb1cbc506ef755b3e1d', './public/system/util/mpFrame.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1768, '7722f9723b073b00de840f7010bc71bd', './public/system/util/mpHelper.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1769, '7c42b19c9f160641428694f2c6eabf0d', './public/system/util/mpVueComponent.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1770, 'a696954c65b196751a086615938844aa', './public/system/util/mpVuePackage-compiled.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1771, 'eb72d949b566cd8c6e14fa6662d6c65a', './public/system/util/mpVuePackage.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1772, '15b4e7634a4fd7f871bafa4385916763', './public/wap/first/bargain/css/base.css', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1773, '8ec0ba966fa302986d9a05f829e6a3ca', './public/wap/first/bargain/css/FJL.picker.css', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1774, '106701d8d5454f65c8a846f81730c242', './public/wap/first/bargain/css/reset.css', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1775, '007eba4047ec5c0a505d99fe1f8d0492', './public/wap/first/bargain/css/style.css', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1776, '6af34d0737ad0ca608111771cf74cc79', './public/wap/first/bargain/css/swiper.min.css', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1777, 'e6ddc273d7f046acaa7312ae0690231b', './public/wap/first/bargain/font/iconfont.css', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1778, 'f08909a24ab3c14e05db4da649504732', './public/wap/first/bargain/font/iconfont.eot', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1779, 'e26414f42bc01fc7185cbbaa48dad984', './public/wap/first/bargain/font/iconfont.js', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1780, 'fd8e589117ba847e5b9493a4c1655ed0', './public/wap/first/bargain/font/iconfont.svg', '1556518594', '1547197830', '1556518594');
INSERT INTO `eb_system_file` VALUES (1781, 'c572afcc31e6977463c26ed66f6790f1', './public/wap/first/bargain/font/iconfont.ttf', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1782, '093a5f3ceb70ea9952d77014b0a50a61', './public/wap/first/bargain/font/iconfont.woff', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1783, '1a332b15dbd3791fff6ec3abad3a6692', './public/wap/first/bargain/images/count-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1784, 'd76763af8f166ccd2935545787aa43cb', './public/wap/first/bargain/images/cut-but-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1785, '701c108935205a98f5d3ea6382370036', './public/wap/first/bargain/images/cut-con-bg.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1786, '6f6b3f95e7e2d9cce01cc5ca7f87223a', './public/wap/first/bargain/images/cut-con-line.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1787, '04dbf174fccec162d1b9ff8a69218fc8', './public/wap/first/bargain/images/cut-con-line.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1788, 'd6945dbf690beb104aa803841cfc2741', './public/wap/first/bargain/images/cut-con-mask.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1789, '8f96d450cb3d2e31adaba69540a74d71', './public/wap/first/bargain/images/cut-con-title.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1790, '12c5a0cd61282e77c5cc77072780dfcc', './public/wap/first/bargain/images/cut-list-bg.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1791, 'cf2cb8811f231dcc5aa6c1c69abe82bf', './public/wap/first/bargain/images/member-binding-line.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1792, '2c42ffe56fb690e0251ccfbd2c199073', './public/wap/first/bargain/images/member-binding-line2.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1793, '30b640f20f49da4a46e49480cec5f583', './public/wap/first/bargain/images/new-page-banner.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1794, '3ed15c7e7e9bf3e625b0914183d8dc21', './public/wap/first/bargain/images/new-page-pic.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1795, '8cf2d95817f15e247b2f17af24719874', './public/wap/first/bargain/images/newtext.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1796, 'e2f2ae6f900fa95ebc88a45fb9218b28', './public/wap/first/bargain/images/order-list.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1797, '7b22ed142170d3a2e17a75bb3c123fdd', './public/wap/first/bargain/images/order-submission.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1798, '72e7a97aec80f65e21cf7483dad21ebb', './public/wap/first/bargain/images/owl_happy.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1799, '4719bed779ccab85f47ae0ef125465b4', './public/wap/first/bargain/images/promotion-bg.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1800, 'd71a119fae573ef125e9adb7b4911669', './public/wap/first/bargain/images/time-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1801, 'e2c54f7aac00cf865900089592ff4420', './public/wap/first/bargain/js/FJL.min.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1802, 'b4699fa2f3452754d3d6d059ef107cf5', './public/wap/first/bargain/js/FJL.picker.min.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1803, 'f20c4cecb1c88d476f9a698fd7a7ee06', './public/wap/first/bargain/js/jquery-2.1.4.min.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1804, '524e37e86d1add9491b552e36cb66fe3', './public/wap/first/bargain/js/media.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1805, 'c834bef6c94c1220bf1ebaf0b9a8f01e', './public/wap/first/bargain/js/media_750.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1806, 'fb13ef3e875ca3497ede35d3774be9d3', './public/wap/first/bargain/js/swiper.min.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1807, '31de704764d37447bb8e00917e3a0d63', './public/wap/first/crmeb/css/service.css', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1808, '1800888f86591709ea998a6bf74a6e99', './public/wap/first/crmeb/css/store_service.css', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1809, '46f5187c2e07d954bb2d38f0e75a0092', './public/wap/first/crmeb/css/style.css', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1810, '0cdc63e7f3f3d23a5fc991f8801af8df', './public/wap/first/crmeb/font/iconfont.css', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1811, '5fd881481a9a47ed96806d4cc8a5d5b4', './public/wap/first/crmeb/font/iconfont.eot', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1812, 'e3f4544486133798845e9654ef8b1577', './public/wap/first/crmeb/font/iconfont.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1813, 'edf7b178b729d8c4f2c4f520112cca9c', './public/wap/first/crmeb/font/iconfont.svg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1814, '10984d654728e3c7144ef544a4fb0397', './public/wap/first/crmeb/font/iconfont.ttf', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1815, '4ba1a9c4c7691bf3f14b0f02256e7484', './public/wap/first/crmeb/font/iconfont.woff', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1816, 'e68cc3a827cbf175c665cf3bd15c79c9', './public/wap/first/crmeb/images/001.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1817, '28a1bed4dbc4f8bcc217bf7a525b0ce6', './public/wap/first/crmeb/images/1.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1818, 'f2e366273a55e13fe0d18b9a007ce197', './public/wap/first/crmeb/images/address-icon01.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1819, '1a3a4920cb3ce8f8018736442f51b29a', './public/wap/first/crmeb/images/addto-pic.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1820, '3e5dfb3a15e34345827997b39659ecdf', './public/wap/first/crmeb/images/audit-status.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1821, '6272576897a2e42385ddbcf41435d938', './public/wap/first/crmeb/images/avatar.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1822, '0e20368c7f50169c38311a0ddc9e817d', './public/wap/first/crmeb/images/banner.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1823, '8894d224a04e2285b988a341fae46a0b', './public/wap/first/crmeb/images/banner1.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1824, '4092791ef0f38a65411cc481247282a7', './public/wap/first/crmeb/images/buy-cars.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1825, '5c3e5d084215b9c283427b909dfb8609', './public/wap/first/crmeb/images/camera-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1826, '9e768a5f5c096e3c95fd6787f4dcaf15', './public/wap/first/crmeb/images/chat_img.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1827, '41f1e97bbae0cf2ff2222e1f710c2666', './public/wap/first/crmeb/images/count.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1828, 'b59879038f7d61ea940b6bc5bf817b90', './public/wap/first/crmeb/images/crmeb-logo.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1829, '111be19d491055d9dbd45017ea992889', './public/wap/first/crmeb/images/delete-btn.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1830, '1bf9f56070a72e38a51d9556684ae23a', './public/wap/first/crmeb/images/delete-btn1.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1831, '63b5fcf4f27efa8f96c54c9668a1ac55', './public/wap/first/crmeb/images/delete-btn3.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1832, '8b79e87104b2bc529ace5fa42ce6d111', './public/wap/first/crmeb/images/discount-list-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1833, 'ab1c5a35b0dda53a6422fa24ff337d6e', './public/wap/first/crmeb/images/drug-01.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1834, '077aa3d917ec786367757480d1f7f494', './public/wap/first/crmeb/images/drug-02.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1835, '0f78f231136d94b164e2dea8a734b76b', './public/wap/first/crmeb/images/drug-03.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1836, 'e4ab1c82c74a6f9b928a9f4e0e1a23c4', './public/wap/first/crmeb/images/drug-04.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1837, 'fcc5f444cf865a9b540f57da82053bf3', './public/wap/first/crmeb/images/drug-05.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1838, 'dbeafa06020513e52c3b8693a25cfc8e', './public/wap/first/crmeb/images/drug-06.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1839, '87d00b582736f06be791b7de367848a3', './public/wap/first/crmeb/images/drug-07.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1840, 'f183876082b28a433e3596938c190efe', './public/wap/first/crmeb/images/drug-08.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1841, 'fecb52c315ec4a40e99492050c7888ab', './public/wap/first/crmeb/images/drug-09.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1842, '00b8bd7ec55dd8f730c53bfdc3b23c9f', './public/wap/first/crmeb/images/drug-10.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1843, '6469c80d241b03a9753700d92e40d192', './public/wap/first/crmeb/images/edit.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1844, '76e6275cf70ec0671145d96053fd0f87', './public/wap/first/crmeb/images/edit01.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1845, 'de4ef1237d0d70d5642ca9cf5a177a38', './public/wap/first/crmeb/images/empty_address.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1846, '7e13458f5f1315e033ec64f2820ea4eb', './public/wap/first/crmeb/images/empty_cart.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1847, 'b7ac406f273c4967acf85a27fc053da2', './public/wap/first/crmeb/images/empty_collect.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1848, 'c0b0ec9f63f8bb3afe50826def79e12e', './public/wap/first/crmeb/images/empty_coupon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1849, '0dc318734bc531b463957d3d9d74fbf2', './public/wap/first/crmeb/images/empty_detail.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1850, '7954c33a03c549ff14fc8a958457e2b0', './public/wap/first/crmeb/images/empty_integral.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1851, 'ea30fbf071eb5b41d3a8f31bc7a4f206', './public/wap/first/crmeb/images/empty_kefu.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1852, '23da22c2bfd6d05db040f32325a22af7', './public/wap/first/crmeb/images/empty_message.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1853, '55ad375b306ccd8089e69901d141be60', './public/wap/first/crmeb/images/empty_order.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1854, '2b12a8b52fe9544ea7c3156204117880', './public/wap/first/crmeb/images/empty_product.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1855, 'f8753eb5f8b143d5b376f7693c10ef35', './public/wap/first/crmeb/images/empty_reply.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1856, 'c0b0ec9f63f8bb3afe50826def79e12e', './public/wap/first/crmeb/images/empt_coupon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1857, '7fcd142493534480e8339d93df304f87', './public/wap/first/crmeb/images/enter.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1858, 'ea8090fa1516bf5cfdc797944fc2e57f', './public/wap/first/crmeb/images/enter01.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1859, 'dca456346a0426031bc37bffc405a71c', './public/wap/first/crmeb/images/enter2.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1860, '0e7883897649523b8eb26e0452e72e40', './public/wap/first/crmeb/images/enterprise-info.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1861, 'be8a3f7dd919cd4fb1a86d7df02273bd', './public/wap/first/crmeb/images/ewm-bar.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1862, 'd591419bc4865740bbd379b64f811c63', './public/wap/first/crmeb/images/exceptional-bg.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1863, 'a05942d96005875b9ead21fb4aec420d', './public/wap/first/crmeb/images/expired-img.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1864, '6cfd6f2169537900d7f0d3f037ddf746', './public/wap/first/crmeb/images/express_icon.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1865, '1a524b4706ce8ab3a17bd5cf6d1a8b60', './public/wap/first/crmeb/images/fail_collect.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1866, 'ae4e74bb129661a82930c8f081b1ad78', './public/wap/first/crmeb/images/gc-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1867, 'fd2188bc7e4518ec094492c915fb5f9d', './public/wap/first/crmeb/images/hot-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1868, '332475344b7c41e4356298b25d587b9a', './public/wap/first/crmeb/images/ico-select.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1869, 'bdc0b9349efb78155934618441e909be', './public/wap/first/crmeb/images/ico-select02.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1870, 'd444c68ad0b3aaeb84520ed84474049c', './public/wap/first/crmeb/images/icon-shandian.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1871, '778cc285b448a11610bc1aadc36e2bdd', './public/wap/first/crmeb/images/img_icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1872, '8d619244496a35e5588a991424b8066d', './public/wap/first/crmeb/images/index-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1873, 'c93d59fc82c5358f5ef729b0286382ef', './public/wap/first/crmeb/images/index-icon02.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1874, 'f04397b692a93e5ef91432206b8402c7', './public/wap/first/crmeb/images/index-icon03.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1875, 'f4a3e58f5c69894f7887b5d6412342f1', './public/wap/first/crmeb/images/integral-content-abg.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1876, 'aad03a33f18acfac56ce57443dae7ed6', './public/wap/first/crmeb/images/integral-content-bg.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1877, '3b3b6b95b2d2ff585e350d8e57ada0c1', './public/wap/first/crmeb/images/integral-content-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1878, '8b9aa6898f3ec02464d11cb837f583a3', './public/wap/first/crmeb/images/like-line-right.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1879, '702cb04ca0b64b5aa9086759990a1202', './public/wap/first/crmeb/images/like-line.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1880, '219ca75519f440b077b5008d528856f4', './public/wap/first/crmeb/images/line.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1881, '779c10d6e39a57f0f5e875b0d261adeb', './public/wap/first/crmeb/images/logistics-bg.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1882, '38438252add269e1077d5699a3988ab3', './public/wap/first/crmeb/images/logistics-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1883, '5e305dae2a31cf92498a26186f098b17', './public/wap/first/crmeb/images/model-close.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1884, '228ce8de0fd770e8fd35584b91913f40', './public/wap/first/crmeb/images/more-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1885, 'ba1d378801ce5ecb00bd6ee9632a83ef', './public/wap/first/crmeb/images/more.gif', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1886, 'c04e4b7c9f5f3418a96d9eada9421231', './public/wap/first/crmeb/images/nav-list001.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1887, '5b7bbdeafa7546566b15e25ad3ff0264', './public/wap/first/crmeb/images/nav-list002.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1888, '247a7fc750f6cda0a67a7579f2a4ff71', './public/wap/first/crmeb/images/nav-list003.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1889, '1f8d6ac88fae6292ada406e9918e5a03', './public/wap/first/crmeb/images/nav-list004.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1890, '19ebb3f416367e6d02e54013fa2e2b77', './public/wap/first/crmeb/images/nav-list005.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1891, 'f8ebd32657b38ed26e01f4d2d4791dd4', './public/wap/first/crmeb/images/nav-list006.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1892, 'e70be90df32ad161610212294b08c321', './public/wap/first/crmeb/images/nav-list007.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1893, 'd940da485aa636002f2e2cd5eb2455f8', './public/wap/first/crmeb/images/nav-list008.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1894, 'e0e1e1ae381a32ac48c046f1676f5679', './public/wap/first/crmeb/images/nav-list009.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1895, '9074d1772f07b4e32279a3d45aab88eb', './public/wap/first/crmeb/images/nav-list010.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1896, '7ae1a028c00c333e3c93dde1dcaeaabf', './public/wap/first/crmeb/images/phone-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1897, '49afb224e1387b63aa36feed01174050', './public/wap/first/crmeb/images/right-menu-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1898, '319253331b8e77011d93d0ec64458ced', './public/wap/first/crmeb/images/ruzhu-banner.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1899, '1f7e145e875524962f563188a325ff07', './public/wap/first/crmeb/images/ruzhu_banner.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1900, 'b7833c06f8c482976e7e83a826c22df9', './public/wap/first/crmeb/images/search-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1901, '4e95ffe4dd68f9600f3b4aa03b3ca83e', './public/wap/first/crmeb/images/search1.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1902, '7323539619e0d44c4bda4d25bbbac357', './public/wap/first/crmeb/images/select-add.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1903, '1faaaa65dac4c191a50a9066ff85a05c', './public/wap/first/crmeb/images/service-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1904, 'fa0bedf8fb77e64365dd411d81cde893', './public/wap/first/crmeb/images/share-info.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1905, '3b5e238761d7f4af194581ea211bea51', './public/wap/first/crmeb/images/star-empty.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1906, '4b2d954533dcf4fd875d0bcd58aaecab', './public/wap/first/crmeb/images/star-full.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1907, '3a1c0de40c5b7297b1677b5ce18485ec', './public/wap/first/crmeb/images/star-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1908, '0d921d59699caca425eba4f65f8fdfe2', './public/wap/first/crmeb/images/state-dqh.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1909, 'd3d0e30e040b02095569402de4b94032', './public/wap/first/crmeb/images/state-nfh.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1910, 'e1e5153db9a7bc54c46756b57286fe3b', './public/wap/first/crmeb/images/state-nobuy.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1911, '3b78c31b99d836465876435bbc63d659', './public/wap/first/crmeb/images/state-send.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1912, '19a7be0746683111480a438cc61f08e2', './public/wap/first/crmeb/images/state-sqtk.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1913, '6f5464feaa77fa830cd6fda1ce4dbab2', './public/wap/first/crmeb/images/state-ypj.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1914, '8b42487613b7f2157c3208e3337dd3fc', './public/wap/first/crmeb/images/state-ysh.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1915, 'db1c7430abf632bf2b922b64e4d2a645', './public/wap/first/crmeb/images/state-ytk.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1916, '80f508014f34d2220c63b9a78eaa2663', './public/wap/first/crmeb/images/storeservice/1.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1917, '1537430c5f47917aa0c95a800425885e', './public/wap/first/crmeb/images/storeservice/10.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1918, 'f0cf714bd8cb5ce4765788b9bbfec102', './public/wap/first/crmeb/images/storeservice/11.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1919, '6080aa7f002f495f7a1ee8efff90fb74', './public/wap/first/crmeb/images/storeservice/12.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1920, 'd8105b8b143e6a398f5c93e92fd556c7', './public/wap/first/crmeb/images/storeservice/13.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1921, '922a0500c4ebbf38113043acc4dbd546', './public/wap/first/crmeb/images/storeservice/14.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1922, '2c09d836b77d91ff82e441ced4830df7', './public/wap/first/crmeb/images/storeservice/15.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1923, '5f15154e3e8a92660c22d05ad591d4f6', './public/wap/first/crmeb/images/storeservice/16.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1924, '1977c2ba78c34d095a16d1eac150bbfc', './public/wap/first/crmeb/images/storeservice/17.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1925, '8a049701933acf5f973d247f42dcd03b', './public/wap/first/crmeb/images/storeservice/18.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1926, 'e07877d7ce4ff2241b5554ce81ac1268', './public/wap/first/crmeb/images/storeservice/19.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1927, '0ac0c03365a99534da5cc8e44c21258d', './public/wap/first/crmeb/images/storeservice/2.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1928, 'ce8566c247441b2819ae65bb5deeb670', './public/wap/first/crmeb/images/storeservice/20.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1929, 'b8f5fd58ca9536ac58f0ff76433d925a', './public/wap/first/crmeb/images/storeservice/21.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1930, '108a659b47331d0190214aec84f829c5', './public/wap/first/crmeb/images/storeservice/22.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1931, '870fdb248491dc271a3c6d13de948273', './public/wap/first/crmeb/images/storeservice/23.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1932, '37a792f5bcbe7074c8220ac0b71c4633', './public/wap/first/crmeb/images/storeservice/24.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1933, '3dd8ed544ffd11d46ddf02c1e8371570', './public/wap/first/crmeb/images/storeservice/25.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1934, '9e2695ccdd32b7345bfa2cd825a525f7', './public/wap/first/crmeb/images/storeservice/26.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1935, '16b309dcd2bf56d8cb154a6455337ce0', './public/wap/first/crmeb/images/storeservice/27.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1936, 'b14cb7fde60d868b8706056593c9428c', './public/wap/first/crmeb/images/storeservice/28.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1937, '4ed28c0b6228c45749e325e540363f5c', './public/wap/first/crmeb/images/storeservice/29.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1938, '71bcfcf4a059d935a6d7b9e84190a091', './public/wap/first/crmeb/images/storeservice/3.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1939, '090c3e596d9bbcc089a01394ce4a2a6c', './public/wap/first/crmeb/images/storeservice/30.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1940, 'c7c0f7c7cd156b809b7b33943b08433e', './public/wap/first/crmeb/images/storeservice/31.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1941, 'cf3811ee8cfcc83ccf835916182f1f0d', './public/wap/first/crmeb/images/storeservice/32.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1942, '30be00066787c2c6ebcb791a4decab1c', './public/wap/first/crmeb/images/storeservice/33.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1943, '180ffe87a0ac13fa924c5e7c7e70b6dd', './public/wap/first/crmeb/images/storeservice/34.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1944, 'da7c90ae577cb99e09ea9415956dd51a', './public/wap/first/crmeb/images/storeservice/35.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1945, '960ae580c47cc4ae9ca0af5281760a8a', './public/wap/first/crmeb/images/storeservice/36.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1946, 'b63e56b2f0aca1705a869c4da45c4036', './public/wap/first/crmeb/images/storeservice/37.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1947, '814101b72f9e1a7dab020cbf03da487e', './public/wap/first/crmeb/images/storeservice/38.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1948, '7964e582196572ce3551d9e5efc3314e', './public/wap/first/crmeb/images/storeservice/39.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1949, 'febb6ac4689648448f7723404d932698', './public/wap/first/crmeb/images/storeservice/4.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1950, 'c99ff75b73de0a80c499389dc30d4136', './public/wap/first/crmeb/images/storeservice/40.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1951, 'c965baf3c7b2791b9a74dc91085dc6df', './public/wap/first/crmeb/images/storeservice/41.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1952, '35ecba52545ace6090293dfe7a701a7f', './public/wap/first/crmeb/images/storeservice/42.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1953, '69ef787a723448dc74f70c4a17a3da7a', './public/wap/first/crmeb/images/storeservice/43.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1954, 'b3b8754526a57a456c9ed1be8bd02cc6', './public/wap/first/crmeb/images/storeservice/44.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1955, 'ff0c815d18f6046b4659a5fd0a121274', './public/wap/first/crmeb/images/storeservice/45.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1956, 'ef75495d03c4d637b742dfd1e68b964a', './public/wap/first/crmeb/images/storeservice/46.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1957, 'f0f2d734f49d24edf8be0bd09ded5c45', './public/wap/first/crmeb/images/storeservice/47.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1958, 'ea0b7dd15328b31ebd2a442c77fe8671', './public/wap/first/crmeb/images/storeservice/48.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1959, '8db347f9ed9c68e967ab96b0559e2566', './public/wap/first/crmeb/images/storeservice/49.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1960, '43f4d62af900377bd32b1f72887e38e6', './public/wap/first/crmeb/images/storeservice/5.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1961, '5be21292fd108d0221d8d6f46ec8ab37', './public/wap/first/crmeb/images/storeservice/50.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1962, '9f2850690f75a13b9c4677fcf0332465', './public/wap/first/crmeb/images/storeservice/51.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1963, 'ec6f9dffa2a82e851da3c50aa85df45b', './public/wap/first/crmeb/images/storeservice/52.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1964, 'b575b5b056dc819e6f7dbb0236170ded', './public/wap/first/crmeb/images/storeservice/53.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1965, '4acd2acf3532002a536103ce5e04ba14', './public/wap/first/crmeb/images/storeservice/6.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1966, '0c53c00e8cf37fa59f9503486fb57985', './public/wap/first/crmeb/images/storeservice/7.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1967, '36a64b4fd48ec067b113fe38087f3c81', './public/wap/first/crmeb/images/storeservice/8.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1968, '096d1fb6be32cf4629c067cd47fb3886', './public/wap/first/crmeb/images/storeservice/9.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1969, '485351bd59076b80fe0d12804a0b33b8', './public/wap/first/crmeb/images/thickness-wrapper-bg.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1970, '929f55c1dd295be126c77a1cf432a7ff', './public/wap/first/crmeb/images/time.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1971, 'a382c6d88168927cf59d0699531f21a2', './public/wap/first/crmeb/images/title-back.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1972, '8fe78f810fbb9317148396ca21787b3c', './public/wap/first/crmeb/images/user-address.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1973, '59499ea4992425edf8e8fb90e765f692', './public/wap/first/crmeb/images/user-balance-bg.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1974, '2920ecd024e1c81cf0852d5a65306fe5', './public/wap/first/crmeb/images/user-orders-list001.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1975, '6c927f8b9d5d01758853a4851043feba', './public/wap/first/crmeb/images/user-orders-list002.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1976, 'cb7c3e0df60c7bb6b128b239d3ffc3e4', './public/wap/first/crmeb/images/user-orders-list003.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1977, '130653ac1426444794c1768e836d6684', './public/wap/first/crmeb/images/user-orders-list004.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1978, 'e02cbc013861be0f079a23609dac9cf9', './public/wap/first/crmeb/images/user-orders-list005.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1979, '94839573b7f23d5d0e636026dc50d23b', './public/wap/first/crmeb/images/user-service01.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1980, 'be8858b75101518ce9af9914fb1417bc', './public/wap/first/crmeb/images/user-service02.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1981, '5c3642ab67d16731e37ffb7fbde1c02a', './public/wap/first/crmeb/images/user-service03.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1982, '35b8327a57ca3fb173693468a500abfe', './public/wap/first/crmeb/images/user-service04.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1983, 'd1f6c952b995dec76fc3c82703e12b37', './public/wap/first/crmeb/images/user-service05.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1984, '398033d11a496d73c82509d4eb9466d2', './public/wap/first/crmeb/images/user-service06.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1985, 'fee383307d877797ba4aa660027bbd00', './public/wap/first/crmeb/images/user-service07.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1986, '716b54653579b8239fb68b8a7ef61c6b', './public/wap/first/crmeb/images/user-service08.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1987, 'b808020f81c2d7eec34eb62e353fb416', './public/wap/first/crmeb/images/video-play.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1988, 'e67186e02404320e3b71421be6c01d24', './public/wap/first/crmeb/images/weixin02.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1989, 'fb4e7f517289f36b42c1629891623cc2', './public/wap/first/crmeb/images/wenhao.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1990, '6dadb31cdd0f9a6bef3dd413d158a2da', './public/wap/first/crmeb/images/xianxia02.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1991, '35316825d7c4dca4f1240e4b5c02c41a', './public/wap/first/crmeb/images/xin-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1992, '1640851ee7de444214548555dc50d4c6', './public/wap/first/crmeb/images/yiwen.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1993, '6820027e0030666538d8c29d61dd740b', './public/wap/first/crmeb/images/yue02.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1994, '9200c742b8d7ec1a796757e95fa1520c', './public/wap/first/crmeb/js/animation.json', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1995, '2aa3bf97cd455499c2117dfeb6458c8c', './public/wap/first/crmeb/js/base.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1996, 'f85be0f6523f37d7d16b8ac682c76cf7', './public/wap/first/crmeb/js/car-model.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1997, 'b495c90270253d49afaac9b65563efae', './public/wap/first/crmeb/js/common.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1998, '5790ead7ad3ba27397aedfa3d263b867', './public/wap/first/crmeb/js/jquery-1.11.2.min.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (1999, '8a010634d0be8abb8370dc2aa45e065c', './public/wap/first/crmeb/js/jquery.downCount.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2000, '61c5bc2c8be74181f095947a700733cb', './public/wap/first/crmeb/js/lottie.min.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2001, '524e37e86d1add9491b552e36cb66fe3', './public/wap/first/crmeb/js/media.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2002, '8ba31474130566d0d42a0656b86d3c64', './public/wap/first/crmeb/js/swiper-3.4.1.jquery.min.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2003, '68c20c7eed5ae2919667a4fcf0bd5cab', './public/wap/first/crmeb/module/cart.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2004, '21806dcf07b06f561e83981879e991d0', './public/wap/first/crmeb/module/refund-reason.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2005, '9e9c3925fe78b39f0f919a2478b08779', './public/wap/first/crmeb/module/store/scroll-load.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2006, 'd78b17fec2c20006b8a3ff421c6185b0', './public/wap/first/crmeb/module/store/seckill-card.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2007, 'd5c5aa3157f3bc133ef2433a027c876f', './public/wap/first/crmeb/module/store/shop-card.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2008, '46c2a876ed10e600ecaad801c32a308a', './public/wap/first/crmeb/module/store/use-address.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2009, '1ee2d126467e22543d36250b957af57b', './public/wap/first/crmeb/module/store/use-coupon.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2010, '9b94d8b1d7877ad245191adb8ebbd470', './public/wap/first/crmeb/module/store.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2011, '611bcada29dc1690bd362325e4e01484', './public/wap/first/crmeb/module/store_service/jquery.touchSwipe.min.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2012, 'cedfc2e0b18a63ab39383ee3c4b9dd15', './public/wap/first/crmeb/module/store_service/mobile.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2013, 'e8cdc98d1a718ec002f0ba18f2edac0c', './public/wap/first/crmeb/module/store_service/moment.min.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2014, '08ecb77133008a15f48e14f791e8fb4c', './public/wap/first/crmeb/module/store_service/msn.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2015, '3fd2f2e9ab37ba9e2b20d47fcd6ee39c', './public/wap/first/crmeb/module/store_service/unslider.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2016, 'c634cfcba59540ca6c76da534405dbc3', './public/wap/first/crmeb/picture/#U4fc3#U9500.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2017, '0e96ea4ff16da9aa5e58940828c7a379', './public/wap/first/crmeb/picture/#U4fe1#U5c01.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2018, '02a88b5b43a46bb5608eb1fbe5b88eae', './public/wap/first/crmeb/picture/#U62e8#U53f7.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2019, '9b98bd7f6e0793535307b72f17bd73b8', './public/wap/first/crmeb/picture/#U65b0#U54c1.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2020, '6d7afdc1aa43b4362a8c9c9878ba1ab4', './public/wap/first/crmeb/picture/#U70ed#U5356.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2021, '383a23e34d454e69aa70d2b1eeb8d5eb', './public/wap/first/crmeb/picture/001.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2022, '63f5de3a2cb695f34912de04a89bee41', './public/wap/first/crmeb/picture/001.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2023, '63811bc309c22e32ffe682c280344367', './public/wap/first/crmeb/picture/002.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2024, '51affd3bc1bc053e13943375b60a571a', './public/wap/first/crmeb/picture/003.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2025, '6e7f1aeee960e2d9bc80cfbf4914484a', './public/wap/first/crmeb/picture/004.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2026, 'd19d756e4efc4e9b5a4ceea5d7cf5eaf', './public/wap/first/crmeb/picture/avatar.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2027, '1686ec765986843a17c1a1f4b7318f15', './public/wap/first/crmeb/picture/drug-banner.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2028, '39d408a208ddb827b17e459da72e94b7', './public/wap/first/crmeb/picture/ewm.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2029, '17d766ecada9a0f414ef00fbdc8b1411', './public/wap/first/crmeb/picture/img.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2030, '17d766ecada9a0f414ef00fbdc8b1411', './public/wap/first/crmeb/picture/index-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2031, '71f6f7b3999a72d37bef15d1e5eb430d', './public/wap/first/crmeb/picture/test.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2032, 'cd00b8ef8c34316c6ccf8b995ae4accc', './public/wap/first/sx/css/reset.css', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2033, 'be4af37694eefca47673e41b86c2ced8', './public/wap/first/sx/css/style.css', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2034, '0176bf1163b6f65f3c8cf11cd367e67c', './public/wap/first/sx/css/swiper-3.4.1.min.css', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2035, '0cdc63e7f3f3d23a5fc991f8801af8df', './public/wap/first/sx/font/iconfont.css', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2036, '5fd881481a9a47ed96806d4cc8a5d5b4', './public/wap/first/sx/font/iconfont.eot', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2037, 'e3f4544486133798845e9654ef8b1577', './public/wap/first/sx/font/iconfont.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2038, 'edf7b178b729d8c4f2c4f520112cca9c', './public/wap/first/sx/font/iconfont.svg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2039, '10984d654728e3c7144ef544a4fb0397', './public/wap/first/sx/font/iconfont.ttf', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2040, '4ba1a9c4c7691bf3f14b0f02256e7484', './public/wap/first/sx/font/iconfont.woff', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2041, 'e68cc3a827cbf175c665cf3bd15c79c9', './public/wap/first/sx/images/001.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2042, '28a1bed4dbc4f8bcc217bf7a525b0ce6', './public/wap/first/sx/images/1.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2043, 'f2e366273a55e13fe0d18b9a007ce197', './public/wap/first/sx/images/address-icon01.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2044, '6272576897a2e42385ddbcf41435d938', './public/wap/first/sx/images/avatar.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2045, 'be642d609eec50f8f9e8ed2bc5197662', './public/wap/first/sx/images/banner1.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2046, 'd6e45de39d0bb105311abec5c0fe25ea', './public/wap/first/sx/images/close.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2047, 'e245f8e7aed16c4f6793f229b70c9482', './public/wap/first/sx/images/count-wrapper-bg.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2048, 'b7e1c35162a389b3716c84b55cb4bc8d', './public/wap/first/sx/images/details-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2049, 'c528b79c688684e10b058cab48fb8050', './public/wap/first/sx/images/dropdown.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2050, 'bf3e47117344c465c70fe454c80eef7e', './public/wap/first/sx/images/dropup.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2051, '6469c80d241b03a9753700d92e40d192', './public/wap/first/sx/images/edit.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2052, '7fcd142493534480e8339d93df304f87', './public/wap/first/sx/images/enter.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2053, 'b789a558388f783435a366f312378008', './public/wap/first/sx/images/fail.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2054, '4e04786e110aa382c4ee7ed2e7f927e7', './public/wap/first/sx/images/foot-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2055, 'ae4e74bb129661a82930c8f081b1ad78', './public/wap/first/sx/images/gc-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2056, 'fa5dda51a40bee121990d754d593bb73', './public/wap/first/sx/images/hot-banner.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2057, 'fd2188bc7e4518ec094492c915fb5f9d', './public/wap/first/sx/images/hot-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2058, '872aa687f375a400633d0dfe235207bb', './public/wap/first/sx/images/index-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2059, 'bb6f23a89a5dc82b8bf8b32ee88be905', './public/wap/first/sx/images/index-icon02.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2060, 'ecde49e514f8e94765b06f03a765c509', './public/wap/first/sx/images/index-nav01.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2061, 'd925630a86763dc96f181ff398150de0', './public/wap/first/sx/images/index-nav02.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2062, '4e8f2e75a7dda23ce879001a79631a1a', './public/wap/first/sx/images/index-nav03.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2063, '19532e9260bc164ae316776d06d719e4', './public/wap/first/sx/images/index-nav04.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2064, '779c10d6e39a57f0f5e875b0d261adeb', './public/wap/first/sx/images/logistics-bg.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2065, 'd81e58a72cebac3b4462afa380a9a816', './public/wap/first/sx/images/lv1.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2066, '5e305dae2a31cf92498a26186f098b17', './public/wap/first/sx/images/model-close.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2067, '228ce8de0fd770e8fd35584b91913f40', './public/wap/first/sx/images/more-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2068, '2175ce29a75052222243547341f7c6d9', './public/wap/first/sx/images/mtw-close.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2069, 'e0a7a5b525ec2955efe1cc8c8d1ff1a5', './public/wap/first/sx/images/nav-bg.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2070, '2f1ff83ce406537c73424a037ebe0dcf', './public/wap/first/sx/images/pro-banner.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2071, '5a07ddf08caf040064ae0e2967aaf24f', './public/wap/first/sx/images/product-banner.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2072, '69c5e2b5d7ebb3f1646f431f630b6faf', './public/wap/first/sx/images/pt-bg.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2073, 'b1ece6497e977b03be68b6c31466f2cd', './public/wap/first/sx/images/pt-error.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2074, '280976f0d7e008d2ebcb5fe9d2da54f9', './public/wap/first/sx/images/pt-success.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2075, '8d17f175fd00902023461e882dc923cb', './public/wap/first/sx/images/search-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2076, '7481ef58ed721cbbb7ee18fbf74d5380', './public/wap/first/sx/images/search-icon3.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2077, '13da7410c9d6ca50fd56d3e103ceb07c', './public/wap/first/sx/images/singin-title-bg.jpg', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2078, '67e46344d74a2c64de7113e9378c115f', './public/wap/first/sx/images/star-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2079, '0d921d59699caca425eba4f65f8fdfe2', './public/wap/first/sx/images/state-dqh.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2080, 'd3d0e30e040b02095569402de4b94032', './public/wap/first/sx/images/state-nfh.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2081, 'e1e5153db9a7bc54c46756b57286fe3b', './public/wap/first/sx/images/state-nobuy.png.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2082, '3b78c31b99d836465876435bbc63d659', './public/wap/first/sx/images/state-send.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2083, '19a7be0746683111480a438cc61f08e2', './public/wap/first/sx/images/state-sqtk.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2084, '6f5464feaa77fa830cd6fda1ce4dbab2', './public/wap/first/sx/images/state-ypj.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2085, '8b42487613b7f2157c3208e3337dd3fc', './public/wap/first/sx/images/state-ysh.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2086, 'db1c7430abf632bf2b922b64e4d2a645', './public/wap/first/sx/images/state-ytk.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2087, '2f180f0ccfeac8de49c26d6ff4555e33', './public/wap/first/sx/images/status-complete.gif', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2088, '79feef98255fcf8092e72ad8003f4d10', './public/wap/first/sx/images/status-drop.gif', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2089, '0efb9b070f66f6812f28223161a978a6', './public/wap/first/sx/images/status-received.gif', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2090, 'aa7ceb2b66db9251a03431536b161de3', './public/wap/first/sx/images/user-orders-list001.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2091, 'a07da7e3968646ea25b221c8a447627c', './public/wap/first/sx/images/user-orders-list002.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2092, '4111e361016559f17571ca7f2c7bcb71', './public/wap/first/sx/images/user-orders-list003.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2093, '1d3648f8c28cfd9d99e3b595279ee5d3', './public/wap/first/sx/images/user-orders-list004.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2094, '114153c26ab2f7057f8b358ad330974b', './public/wap/first/sx/images/user-orders-list005.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2095, '94839573b7f23d5d0e636026dc50d23b', './public/wap/first/sx/images/user-service01.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2096, 'be8858b75101518ce9af9914fb1417bc', './public/wap/first/sx/images/user-service02.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2097, '1cad69a59f5e9efc7dd65fd9d2db0e3e', './public/wap/first/sx/images/user-service03.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2098, 'bbecabe6a23274f8a9d7e282ae9c43ae', './public/wap/first/sx/images/user-service04.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2099, 'd1f6c952b995dec76fc3c82703e12b37', './public/wap/first/sx/images/user-service05.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2100, '398033d11a496d73c82509d4eb9466d2', './public/wap/first/sx/images/user-service06.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2101, 'fee383307d877797ba4aa660027bbd00', './public/wap/first/sx/images/user-service07.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2102, '716b54653579b8239fb68b8a7ef61c6b', './public/wap/first/sx/images/user-service08.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2103, '2a3899e911c47ba674269686277856fb', './public/wap/first/sx/images/user-singin-bg.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2104, 'a1f53eca545924cbf627a6ecfce1e3ea', './public/wap/first/sx/images/warn.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2105, 'fb4e7f517289f36b42c1629891623cc2', './public/wap/first/sx/images/wenhao.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2106, '35316825d7c4dca4f1240e4b5c02c41a', './public/wap/first/sx/images/xin-icon.png', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2107, 'a3f43bab5ace67f3616f5ebfc66744dc', './public/wap/first/sx/js/iscroll.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2108, '5790ead7ad3ba27397aedfa3d263b867', './public/wap/first/sx/js/jquery-1.11.2.min.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2109, '8a010634d0be8abb8370dc2aa45e065c', './public/wap/first/sx/js/jquery.downCount.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2110, '524e37e86d1add9491b552e36cb66fe3', './public/wap/first/sx/js/media.js', '1556518595', '1547197830', '1556518595');
INSERT INTO `eb_system_file` VALUES (2111, '8ba31474130566d0d42a0656b86d3c64', './public/wap/first/sx/js/swiper-3.4.1.jquery.min.js', '1556518595', '1547197830', '1556518595');

-- ----------------------------
-- Table structure for eb_system_group
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_group`;
CREATE TABLE `eb_system_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合数据ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据组名称',
  `info` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据提示',
  `config_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据字段',
  `fields` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '数据组字段以及类型（json数据）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `config_name`(`config_name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组合数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_group
-- ----------------------------
INSERT INTO `eb_system_group` VALUES (32, '个人中心菜单', '【公众号】', 'my_index_menu', '[{\"name\":\"\\u540d\\u79f0\",\"title\":\"name\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u56fe\\u6807\",\"title\":\"icon\",\"type\":\"upload\",\"param\":\"\"},{\"name\":\"\\u94fe\\u63a5\",\"title\":\"url\",\"type\":\"select\",\"param\":\"\\/wap\\/my\\/integral.html=>\\u6211\\u7684\\u79ef\\u5206\\n\\/wap\\/my\\/coupon.html=>\\u4f18\\u60e0\\u5238\\n\\/wap\\/my\\/collect.html=>\\u6536\\u85cf\\u5217\\u8868\\n\\/wap\\/my\\/address.html=>\\u5730\\u5740\\u7ba1\\u7406\\n\\/wap\\/my\\/balance.html=>\\u6211\\u7684\\u4f59\\u989d\\n\\/wap\\/service\\/service_new.html=>\\u804a\\u5929\\u8bb0\\u5f55\\n\\/wap\\/index\\/about.html=>\\u8054\\u7cfb\\u6211\\u4eec\\n\\/wap\\/my\\/user_pro.html=>\\u63a8\\u5e7f\\u4f63\\u91d1\"},{\"name\":\"\\u6d4b\\u8bd5\",\"title\":\"test\",\"type\":\"uploads\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (34, '商城首页banner', '【公众号】', 'store_home_banner', '[{\"name\":\"\\u6807\\u9898\",\"title\":\"title\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u94fe\\u63a5\",\"title\":\"url\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u56fe\\u7247\",\"title\":\"pic\",\"type\":\"upload\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (35, '首页分类按钮图标', '【公众号】', 'store_home_menus', '[{\"name\":\"\\u540d\\u79f0\",\"title\":\"name\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u94fe\\u63a5\",\"title\":\"url\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u56fe\\u6807\",\"title\":\"icon\",\"type\":\"upload\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (36, '首页滚动新闻', '【公众号】', 'store_home_roll_news', '[{\"name\":\"\\u6eda\\u52a8\\u6587\\u5b57\",\"title\":\"info\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u70b9\\u51fb\\u94fe\\u63a5\",\"title\":\"url\",\"type\":\"input\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (37, '拼团、秒杀、砍价顶部banner图', '小程序', 'routine_lovely', '[{\"name\":\"\\u56fe\\u7247\",\"title\":\"img\",\"type\":\"upload\",\"param\":\"\"},{\"name\":\"\\u63cf\\u8ff0\",\"title\":\"comment\",\"type\":\"input\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (38, '砍价列表页左上小图标', '小程序', 'bargain_banner', '[{\"name\":\"banner\",\"title\":\"banner\",\"type\":\"upload\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (47, '首页分类图标', '小程序', 'routine_home_menus', '[{\"name\":\"\\u5206\\u7c7b\\u540d\\u79f0\",\"title\":\"name\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u5206\\u7c7b\\u56fe\\u6807\",\"title\":\"pic\",\"type\":\"upload\",\"param\":\"\"},{\"name\":\"\\u8df3\\u8f6c\\u8def\\u5f84\",\"title\":\"url\",\"type\":\"select\",\"param\":\"\\/pages\\/index\\/index=>\\u5546\\u57ce\\u9996\\u9875\\n\\/pages\\/spread\\/spread=>\\u4e2a\\u4eba\\u63a8\\u5e7f\\n\\/pages\\/coupon-status\\/coupon-status=>\\u4f18\\u60e0\\u5238\\n\\/pages\\/user\\/user=>\\u4e2a\\u4eba\\u4e2d\\u5fc3\\n\\/pages\\/miao-list\\/miao-list=>\\u79d2\\u6740\\u5217\\u8868\\n\\/pages\\/pink-list\\/index=>\\u62fc\\u56e2\\u5217\\u8868\\u9875\\n\\/pages\\/cut-list\\/cut-list?id=123=>\\u780d\\u4ef7\\u5217\\u8868\\n\\/pages\\/productSort\\/productSort=>\\u5206\\u7c7b\\u9875\\u9762\\n\\/pages\\/address\\/address=>\\u5730\\u5740\\u5217\\u8868\\n\\/pages\\/cash\\/cash=>\\u63d0\\u73b0\\u9875\\u9762\\n\\/pages\\/extension\\/extension=>\\u63a8\\u5e7f\\u7edf\\u8ba1\\n\\/pages\\/main\\/main=>\\u8d26\\u6237\\u91d1\\u989d\\n\\/pages\\/collect\\/collect=>\\u6211\\u7684\\u6536\\u85cf\\n\\/pages\\/promotion-card\\/promotion-card=>\\u63a8\\u5e7f\\u4e8c\\u7ef4\\u7801\\u9875\\u9762\\n\\/pages\\/buycar\\/buycar=>\\u8d2d\\u7269\\u8f66\\u9875\\u9762\\n\\/pages\\/news-list\\/news-list=>\\u6d88\\u606f\\u5217\\u8868\\u9875\\n\\/pages\\/orders-list\\/orders-list=>\\u8ba2\\u5355\\u5217\\u8868\\u9875\\u9762\\n\\/pages\\/new-list\\/new-list=>\\u6587\\u7ae0\\u5217\\u8868\\u9875\"},{\"name\":\"\\u5e95\\u90e8\\u83dc\\u5355\",\"title\":\"show\",\"type\":\"radio\",\"param\":\"\\u662f=>\\u662f\\n\\u5426=>\\u5426\"}]');
INSERT INTO `eb_system_group` VALUES (48, '首页banner滚动图', '小程序', 'routine_home_banner', '[{\"name\":\"\\u6807\\u9898\",\"title\":\"name\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u94fe\\u63a5\",\"title\":\"url\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u56fe\\u7247\",\"title\":\"pic\",\"type\":\"upload\",\"param\":\"\"}]');

-- ----------------------------
-- Table structure for eb_system_group_data
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_group_data`;
CREATE TABLE `eb_system_group_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合数据详情ID',
  `gid` int(11) NOT NULL COMMENT '对应的数据组id',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据组对应的数据值（json数据）',
  `add_time` int(10) NOT NULL COMMENT '添加数据时间',
  `sort` int(11) NOT NULL COMMENT '数据排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态（1：开启；2：关闭；）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 113 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组合数据详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_group_data
-- ----------------------------
INSERT INTO `eb_system_group_data` VALUES (52, 32, '{\"name\":{\"type\":\"input\",\"value\":\"\\u6211\\u7684\\u79ef\\u5206\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc7ee98a2e.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/wap\\/my\\/integral.html\"}}', 1513846430, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (53, 32, '{\"name\":{\"type\":\"input\",\"value\":\"\\u4f18\\u60e0\\u5238\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc802814e5.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/wap\\/my\\/coupon.html\"}}', 1513846448, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (84, 34, '{\"title\":{\"type\":\"input\",\"value\":\"banner1\"},\"url\":{\"type\":\"input\",\"value\":\"#\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db14908923.jpg\"}}', 1522135667, 2, 1);
INSERT INTO `eb_system_group_data` VALUES (56, 32, '{\"name\":{\"type\":\"input\",\"value\":\"\\u5df2\\u6536\\u85cf\\u5546\\u54c1\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc91cee6ed.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/wap\\/my\\/collect.html\"}}', 1513846605, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (57, 32, '{\"name\":{\"type\":\"input\",\"value\":\"\\u5730\\u5740\\u7ba1\\u7406\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc93937a48.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/wap\\/my\\/address.html\"}}', 1513846618, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (87, 32, '{\"name\":{\"type\":\"input\",\"value\":\"\\u6211\\u7684\\u4f59\\u989d\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc865bb257.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/wap\\/my\\/balance.html\"}}', 1525330614, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (67, 32, '{\"name\":{\"type\":\"input\",\"value\":\"\\u804a\\u5929\\u8bb0\\u5f55\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc8a7205f0.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/wap\\/service\\/service_new.html\"}}', 1515570261, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (72, 35, '{\"name\":{\"type\":\"input\",\"value\":\"\\u780d\\u4ef7\"},\"url\":{\"type\":\"input\",\"value\":\"\\/wap\\/store\\/cut_list.html\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc72335ee5.png\"}}', 1515985426, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (73, 35, '{\"name\":{\"type\":\"input\",\"value\":\"\\u9886\\u5238\"},\"url\":{\"type\":\"input\",\"value\":\"\\/wap\\/store\\/issue_coupon.html\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc7146add5.png\"}}', 1515985435, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (74, 35, '{\"name\":{\"type\":\"input\",\"value\":\"\\u62fc\\u56e2\"},\"url\":{\"type\":\"input\",\"value\":\"\\/wap\\/store\\/combination.html\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc73feecaf.png\"}}', 1515985441, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (80, 36, '{\"info\":{\"type\":\"input\",\"value\":\"CRMEB\\u7535\\u5546\\u7cfb\\u7edf V 2.5 \\u5373\\u5c06\\u4e0a\\u7ebf\\uff01\"},\"url\":{\"type\":\"input\",\"value\":\"#\"}}', 1515985907, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (81, 36, '{\"info\":{\"type\":\"input\",\"value\":\"CRMEB\\u5546\\u57ce V 2.5 \\u5c0f\\u7a0b\\u5e8f\\u516c\\u4f17\\u53f7\\u6570\\u636e\\u540c\\u6b65\\uff01\"},\"url\":{\"type\":\"input\",\"value\":\"#\"}}', 1515985918, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (107, 37, '{\"img\":{\"type\":\"upload\",\"value\":\"http:\\/\\/shop.crmeb.net\\/public\\/uploads\\/8\\/20180817\\/5b768dfd6189a.jpg\"},\"comment\":{\"type\":\"input\",\"value\":\"\\u62fc\\u56e2\\u5217\\u8868\\u9876\\u90e8banner\"}}', 1534496260, 0, 1);
INSERT INTO `eb_system_group_data` VALUES (88, 37, '{\"img\":{\"type\":\"upload\",\"value\":\"http:\\/\\/shop.crmeb.net\\/public\\/uploads\\/editor\\/20180601\\/5b10b2b0969d7.jpg\"},\"comment\":{\"type\":\"input\",\"value\":\"\\u62fc\\u56e2\"}}', 1526699754, 10, 1);
INSERT INTO `eb_system_group_data` VALUES (89, 38, '{\"banner\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc730dead2.png\"}}', 1527153599, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (86, 32, '{\"name\":{\"type\":\"input\",\"value\":\"\\u8054\\u7cfb\\u5ba2\\u670d\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc84ef1070.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/wap\\/index\\/about.html\"}}', 1522310836, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (91, 37, '{\"img\":{\"type\":\"upload\",\"value\":\"http:\\/\\/shop.crmeb.net\\/public\\/uploads\\/editor\\/20180601\\/5b10b2deb5b20.jpg\"},\"comment\":{\"type\":\"input\",\"value\":\"\\u79d2\\u6740\\u5217\\u8868\\u9876\\u90e8baaner\"}}', 1528688012, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (92, 32, '{\"name\":{\"type\":\"input\",\"value\":\"\\u63a8\\u5e7f\\u4f63\\u91d1\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc95a1d134.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/wap\\/my\\/user_pro.html\"}}', 1530688244, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (99, 47, '{\"name\":{\"type\":\"input\",\"value\":\"\\u6536\\u85cf\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc7146add5.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/collect\\/collect\"},\"show\":{\"type\":\"radio\",\"value\":\"\\u662f\"}}', 1533721963, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (100, 47, '{\"name\":{\"type\":\"input\",\"value\":\"\\u780d\\u4ef7\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc72335ee5.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/cut-list\\/cut-list\"},\"show\":{\"type\":\"radio\",\"value\":\"\\u5426\"}}', 1533722009, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (101, 47, '{\"name\":{\"type\":\"input\",\"value\":\"\\u79d2\\u6740\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc730dead2.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/miao-list\\/miao-list\"},\"show\":{\"type\":\"radio\",\"value\":\"\\u5426\"}}', 1533722037, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (102, 47, '{\"name\":{\"type\":\"input\",\"value\":\"\\u62fc\\u56e2\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc73feecaf.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/pink-list\\/index\"},\"show\":{\"type\":\"radio\",\"value\":\"\\u5426\"}}', 1533722063, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (104, 48, '{\"name\":{\"type\":\"input\",\"value\":\"banenr2\"},\"url\":{\"type\":\"input\",\"value\":\"\\/pages\\/pink-list\\/index\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db14908923.jpg\"}}', 1533722286, 10, 1);
INSERT INTO `eb_system_group_data` VALUES (105, 47, '{\"name\":{\"type\":\"input\",\"value\":\"\\u8d44\\u8baf\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc74c1bd3f.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/new-list\\/new-list\"},\"show\":{\"type\":\"radio\",\"value\":\"\\u5426\"}}', 1533797064, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (106, 32, '{\"name\":{\"type\":\"input\",\"value\":\"\\u6211\\u7684\\u780d\\u4ef7\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc97a19134.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/wap\\/my\\/user_cut.html\"}}', 1533889033, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (108, 35, '{\"name\":{\"type\":\"input\",\"value\":\"\\u79d2\\u6740\"},\"url\":{\"type\":\"input\",\"value\":\"wap\\/store\\/seckill_index.html\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc730dead2.png\"}}', 1541054595, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (109, 35, '{\"name\":{\"type\":\"input\",\"value\":\"\\u7b7e\\u5230\"},\"url\":{\"type\":\"input\",\"value\":\"\\/wap\\/my\\/sign_in.html\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc74c1bd3f.png\"}}', 1541054641, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (110, 37, '{\"img\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/editor\\/20190111\\/5c387daf3ef63.jpg\"},\"comment\":{\"type\":\"input\",\"value\":\"\\u780d\\u4ef7\\u5217\\u8868\\u9876\\u90e8banner\"}}', 1547208439, 1, 1);

-- ----------------------------
-- Table structure for eb_system_log
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_log`;
CREATE TABLE `eb_system_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员操作记录ID',
  `admin_id` int(10) UNSIGNED NOT NULL COMMENT '管理员id',
  `admin_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员姓名',
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接',
  `page` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '行为',
  `method` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问类型',
  `ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录IP',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '操作时间',
  `merchant_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 336 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员操作记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_log
-- ----------------------------
INSERT INTO `eb_system_log` VALUES (1, 1, 'admin', 'admin/article.articlecategory/index/', '文章分类管理展示页', 'GET', '127.0.0.1', 'system', 1558599429, 0);
INSERT INTO `eb_system_log` VALUES (2, 1, 'admin', 'admin/article.article/index/', '文章管理', 'GET', '127.0.0.1', 'system', 1558599430, 0);
INSERT INTO `eb_system_log` VALUES (3, 1, 'admin', 'admin/setting.systemconfig/index/type/1/tab_id/2', '公众号接口配置', 'GET', '127.0.0.1', 'system', 1558599439, 0);
INSERT INTO `eb_system_log` VALUES (4, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/47', '数据列表', 'GET', '127.0.0.1', 'system', 1558599444, 0);
INSERT INTO `eb_system_log` VALUES (5, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/48', '数据列表', 'GET', '127.0.0.1', 'system', 1558599447, 0);
INSERT INTO `eb_system_log` VALUES (6, 1, 'admin', 'admin/setting.systemconfig/index_alone/type/2/tab_id/14', '小程序支付配置', 'GET', '127.0.0.1', 'system', 1558599449, 0);
INSERT INTO `eb_system_log` VALUES (7, 1, 'admin', 'admin/routine.routinetemplate/index/', '小程序模版消息列表页', 'GET', '127.0.0.1', 'system', 1558599451, 0);
INSERT INTO `eb_system_log` VALUES (8, 1, 'admin', 'admin/record.record/chart_product/', '产品统计', 'GET', '127.0.0.1', 'system', 1558599465, 0);
INSERT INTO `eb_system_log` VALUES (9, 1, 'admin', 'admin/record.record/get_echarts_product/', '未知', 'GET', '127.0.0.1', 'system', 1558599465, 0);
INSERT INTO `eb_system_log` VALUES (10, 1, 'admin', 'admin/record.record/get_echarts_maxlist/', '未知', 'GET', '127.0.0.1', 'system', 1558599466, 0);
INSERT INTO `eb_system_log` VALUES (11, 1, 'admin', 'admin/record.record/get_echarts_profity/', '未知', 'GET', '127.0.0.1', 'system', 1558599466, 0);
INSERT INTO `eb_system_log` VALUES (12, 1, 'admin', 'admin/record.record/getlacklist/', '未知', 'GET', '127.0.0.1', 'system', 1558599466, 0);
INSERT INTO `eb_system_log` VALUES (13, 1, 'admin', 'admin/record.record/getnegativelist/', '未知', 'GET', '127.0.0.1', 'system', 1558599466, 0);
INSERT INTO `eb_system_log` VALUES (14, 1, 'admin', 'admin/record.record/gettuiprieslist/', '未知', 'GET', '127.0.0.1', 'system', 1558599466, 0);
INSERT INTO `eb_system_log` VALUES (15, 1, 'admin', 'admin/record.record/chart_order/', '订单统计', 'GET', '127.0.0.1', 'system', 1558599467, 0);
INSERT INTO `eb_system_log` VALUES (16, 1, 'admin', 'admin/record.record/get_echarts_order/', '未知', 'GET', '127.0.0.1', 'system', 1558599468, 0);
INSERT INTO `eb_system_log` VALUES (17, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1558599481, 0);
INSERT INTO `eb_system_log` VALUES (18, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1558599482, 0);
INSERT INTO `eb_system_log` VALUES (19, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1558599488, 0);
INSERT INTO `eb_system_log` VALUES (20, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1558599488, 0);
INSERT INTO `eb_system_log` VALUES (21, 1, 'admin', 'admin/setting.systemnotice/index/', '后台通知', 'GET', '127.0.0.1', 'system', 1558599521, 0);
INSERT INTO `eb_system_log` VALUES (22, 1, 'admin', 'admin/setting.systemgroup/index/', '组合数据展示页', 'GET', '127.0.0.1', 'system', 1558599532, 0);
INSERT INTO `eb_system_log` VALUES (23, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/1', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558599536, 0);
INSERT INTO `eb_system_log` VALUES (24, 1, 'admin', 'admin/setting.systemconfigtab/index/', '配置分类展示页', 'GET', '127.0.0.1', 'system', 1558599540, 0);
INSERT INTO `eb_system_log` VALUES (25, 1, 'admin', 'admin/system.express/index/', '物流公司', 'GET', '127.0.0.1', 'system', 1558599545, 0);
INSERT INTO `eb_system_log` VALUES (26, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/5/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558599577, 0);
INSERT INTO `eb_system_log` VALUES (27, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/10/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558599582, 0);
INSERT INTO `eb_system_log` VALUES (28, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/5/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558599590, 0);
INSERT INTO `eb_system_log` VALUES (29, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/1/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558599592, 0);
INSERT INTO `eb_system_log` VALUES (30, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/5/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558599594, 0);
INSERT INTO `eb_system_log` VALUES (31, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/10/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558599595, 0);
INSERT INTO `eb_system_log` VALUES (32, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/5/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558599595, 0);
INSERT INTO `eb_system_log` VALUES (33, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/1/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558599596, 0);
INSERT INTO `eb_system_log` VALUES (34, 1, 'admin', 'admin/setting.systemconfigtab/edit/id/1', '编辑配置分类', 'GET', '127.0.0.1', 'system', 1558599604, 0);
INSERT INTO `eb_system_log` VALUES (35, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558599612, 0);
INSERT INTO `eb_system_log` VALUES (36, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558599618, 0);
INSERT INTO `eb_system_log` VALUES (37, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1558599622, 0);
INSERT INTO `eb_system_log` VALUES (38, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558599652, 0);
INSERT INTO `eb_system_log` VALUES (39, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558599665, 0);
INSERT INTO `eb_system_log` VALUES (40, 1, 'admin', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558599667, 0);
INSERT INTO `eb_system_log` VALUES (41, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1558599700, 0);
INSERT INTO `eb_system_log` VALUES (42, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1558599700, 0);
INSERT INTO `eb_system_log` VALUES (43, 1, 'admin', 'admin/setting.systemconfig/index/type/1/tab_id/2', '公众号接口配置', 'GET', '127.0.0.1', 'system', 1558599720, 0);
INSERT INTO `eb_system_log` VALUES (44, 1, 'admin', 'admin/wechat.wechattemplate/index/', '微信模版消息列表页', 'GET', '127.0.0.1', 'system', 1558599727, 0);
INSERT INTO `eb_system_log` VALUES (45, 1, 'admin', 'admin/wechat.menus/index/', '微信菜单展示页', 'GET', '127.0.0.1', 'system', 1558599730, 0);
INSERT INTO `eb_system_log` VALUES (46, 1, 'admin', 'admin/setting.systemconfig/index/type/1/tab_id/4', '公众号支付配置', 'GET', '127.0.0.1', 'system', 1558599731, 0);
INSERT INTO `eb_system_log` VALUES (47, 1, 'admin', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558599735, 0);
INSERT INTO `eb_system_log` VALUES (48, 1, 'admin', 'admin/setting.systemrole/create/', '添加身份', 'GET', '127.0.0.1', 'system', 1558599748, 0);
INSERT INTO `eb_system_log` VALUES (49, 1, 'admin', 'admin/setting.systemrole/save/', '提交添加身份', 'POST', '127.0.0.1', 'system', 1558599874, 0);
INSERT INTO `eb_system_log` VALUES (50, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558599882, 0);
INSERT INTO `eb_system_log` VALUES (51, 1, 'admin', 'admin/setting.systemconfigtab/index/', '配置分类展示页', 'GET', '127.0.0.1', 'system', 1558599884, 0);
INSERT INTO `eb_system_log` VALUES (52, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/1', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558599892, 0);
INSERT INTO `eb_system_log` VALUES (53, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/5/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558599916, 0);
INSERT INTO `eb_system_log` VALUES (54, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/10/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558599923, 0);
INSERT INTO `eb_system_log` VALUES (55, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/5/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558599924, 0);
INSERT INTO `eb_system_log` VALUES (56, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/1/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558599925, 0);
INSERT INTO `eb_system_log` VALUES (57, 1, 'admin', 'admin/setting.systemgroup/index/', '组合数据展示页', 'GET', '127.0.0.1', 'system', 1558599933, 0);
INSERT INTO `eb_system_log` VALUES (58, 1, 'admin', 'admin/setting.systemnotice/index/', '后台通知', 'GET', '127.0.0.1', 'system', 1558599942, 0);
INSERT INTO `eb_system_log` VALUES (59, 1, 'admin', 'admin/system.express/index/', '物流公司', 'GET', '127.0.0.1', 'system', 1558599965, 0);
INSERT INTO `eb_system_log` VALUES (60, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558599980, 0);
INSERT INTO `eb_system_log` VALUES (61, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1558599981, 0);
INSERT INTO `eb_system_log` VALUES (62, 1, 'admin', 'admin/record.record/chart_product/', '产品统计', 'GET', '127.0.0.1', 'system', 1558600028, 0);
INSERT INTO `eb_system_log` VALUES (63, 1, 'admin', 'admin/record.record/get_echarts_product/', '未知', 'GET', '127.0.0.1', 'system', 1558600028, 0);
INSERT INTO `eb_system_log` VALUES (64, 1, 'admin', 'admin/record.record/get_echarts_profity/', '未知', 'GET', '127.0.0.1', 'system', 1558600029, 0);
INSERT INTO `eb_system_log` VALUES (65, 1, 'admin', 'admin/record.record/get_echarts_maxlist/', '未知', 'GET', '127.0.0.1', 'system', 1558600029, 0);
INSERT INTO `eb_system_log` VALUES (66, 1, 'admin', 'admin/record.record/getnegativelist/', '未知', 'GET', '127.0.0.1', 'system', 1558600030, 0);
INSERT INTO `eb_system_log` VALUES (67, 1, 'admin', 'admin/record.record/chart_order/', '订单统计', 'GET', '127.0.0.1', 'system', 1558600030, 0);
INSERT INTO `eb_system_log` VALUES (68, 1, 'admin', 'admin/record.record/getlacklist/', '未知', 'GET', '127.0.0.1', 'system', 1558600030, 0);
INSERT INTO `eb_system_log` VALUES (69, 1, 'admin', 'admin/record.record/get_echarts_order/', '未知', 'GET', '127.0.0.1', 'system', 1558600030, 0);
INSERT INTO `eb_system_log` VALUES (70, 1, 'admin', 'admin/record.record/chart_score/', '积分统计', 'GET', '127.0.0.1', 'system', 1558600032, 0);
INSERT INTO `eb_system_log` VALUES (71, 1, 'admin', 'admin/record.record/getscorebadgelist/', '未知', 'GET', '127.0.0.1', 'system', 1558600033, 0);
INSERT INTO `eb_system_log` VALUES (72, 1, 'admin', 'admin/record.record/getscorecurve/', '未知', 'GET', '127.0.0.1', 'system', 1558600033, 0);
INSERT INTO `eb_system_log` VALUES (73, 1, 'admin', 'admin/record.record/chart_coupon/', '优惠券统计', 'GET', '127.0.0.1', 'system', 1558600033, 0);
INSERT INTO `eb_system_log` VALUES (74, 1, 'admin', 'admin/record.record/getconponcurve/', '未知', 'GET', '127.0.0.1', 'system', 1558600033, 0);
INSERT INTO `eb_system_log` VALUES (75, 1, 'admin', 'admin/record.record/getcouponbadgelist/', '未知', 'GET', '127.0.0.1', 'system', 1558600033, 0);
INSERT INTO `eb_system_log` VALUES (76, 1, 'admin', 'admin/finance.userextract/index/', '未知', 'GET', '127.0.0.1', 'system', 1558600040, 0);
INSERT INTO `eb_system_log` VALUES (77, 1, 'admin', 'admin/finance.userrecharge/index/', '充值记录', 'GET', '127.0.0.1', 'system', 1558600043, 0);
INSERT INTO `eb_system_log` VALUES (78, 1, 'admin', 'admin/finance.finance/bill/', '资金监控', 'GET', '127.0.0.1', 'system', 1558600043, 0);
INSERT INTO `eb_system_log` VALUES (79, 1, 'admin', 'admin/finance.finance/billlist/', '未知', 'GET', '127.0.0.1', 'system', 1558600043, 0);
INSERT INTO `eb_system_log` VALUES (80, 1, 'admin', 'admin/finance.finance/commission_list/', '佣金记录', 'GET', '127.0.0.1', 'system', 1558600045, 0);
INSERT INTO `eb_system_log` VALUES (81, 1, 'admin', 'admin/finance.finance/get_commission_list/', '未知', 'GET', '127.0.0.1', 'system', 1558600045, 0);
INSERT INTO `eb_system_log` VALUES (82, 1, 'admin', 'admin/user.user/index/', '会员列表页', 'GET', '127.0.0.1', 'system', 1558600055, 0);
INSERT INTO `eb_system_log` VALUES (83, 1, 'admin', 'admin/user.user/get_user_list/', '未知', 'GET', '127.0.0.1', 'system', 1558600055, 0);
INSERT INTO `eb_system_log` VALUES (84, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1558600057, 0);
INSERT INTO `eb_system_log` VALUES (85, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1558600057, 0);
INSERT INTO `eb_system_log` VALUES (86, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1558600057, 0);
INSERT INTO `eb_system_log` VALUES (87, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1558600061, 0);
INSERT INTO `eb_system_log` VALUES (88, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1558600061, 0);
INSERT INTO `eb_system_log` VALUES (89, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1558600062, 0);
INSERT INTO `eb_system_log` VALUES (90, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1558600062, 0);
INSERT INTO `eb_system_log` VALUES (91, 1, 'admin', 'admin/store.storecategory/create/', '添加产品分类', 'GET', '127.0.0.1', 'system', 1558600106, 0);
INSERT INTO `eb_system_log` VALUES (92, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1558600114, 0);
INSERT INTO `eb_system_log` VALUES (93, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1558600114, 0);
INSERT INTO `eb_system_log` VALUES (94, 1, 'admin', 'admin/store.storeproductreply/index/', '评论管理展示页', 'GET', '127.0.0.1', 'system', 1558600132, 0);
INSERT INTO `eb_system_log` VALUES (95, 1, 'admin', 'admin/user.usernotice/index/', '未知', 'GET', '127.0.0.1', 'system', 1558600154, 0);
INSERT INTO `eb_system_log` VALUES (96, 1, 'admin', 'admin/user.usernotice/index/', '未知', 'GET', '127.0.0.1', 'system', 1558600154, 0);
INSERT INTO `eb_system_log` VALUES (97, 1, 'admin', 'admin/user.usernotice/create/', '未知', 'GET', '127.0.0.1', 'system', 1558600156, 0);
INSERT INTO `eb_system_log` VALUES (98, 1, 'admin', 'admin/agent.agentmanage/index/', '分销管理列表页', 'GET', '127.0.0.1', 'system', 1558600162, 0);
INSERT INTO `eb_system_log` VALUES (99, 1, 'admin', 'admin/setting.systemconfig/index/type/3/tab_id/9', '分销配置', 'GET', '127.0.0.1', 'system', 1558600164, 0);
INSERT INTO `eb_system_log` VALUES (100, 1, 'admin', 'admin/ump.storecoupon/index/', '优惠券制作', 'GET', '127.0.0.1', 'system', 1558600201, 0);
INSERT INTO `eb_system_log` VALUES (101, 1, 'admin', 'admin/ump.storecouponissue/index/', '已发布管理', 'GET', '127.0.0.1', 'system', 1558600202, 0);
INSERT INTO `eb_system_log` VALUES (102, 1, 'admin', 'admin/ump.storecouponuser/index/', '会员领取记录', 'GET', '127.0.0.1', 'system', 1558600202, 0);
INSERT INTO `eb_system_log` VALUES (103, 1, 'admin', 'admin/setting.systemconfig/index/type/3/tab_id/12', '优惠券配置', 'GET', '127.0.0.1', 'system', 1558600203, 0);
INSERT INTO `eb_system_log` VALUES (104, 1, 'admin', 'admin/ump.storecoupon/create/', '未知', 'GET', '127.0.0.1', 'system', 1558600208, 0);
INSERT INTO `eb_system_log` VALUES (105, 1, 'admin', 'admin/ump.storebargain/index/', '砍价产品', 'GET', '127.0.0.1', 'system', 1558600220, 0);
INSERT INTO `eb_system_log` VALUES (106, 1, 'admin', 'admin/ump.storebargain/get_bargain_list/', '未知', 'GET', '127.0.0.1', 'system', 1558600221, 0);
INSERT INTO `eb_system_log` VALUES (107, 1, 'admin', 'admin/ump.storebargain/{{d.image}}/', '未知', 'GET', '127.0.0.1', 'system', 1558600221, 0);
INSERT INTO `eb_system_log` VALUES (108, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1558600268, 0);
INSERT INTO `eb_system_log` VALUES (109, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/5/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558600435, 0);
INSERT INTO `eb_system_log` VALUES (110, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1558600709, 0);
INSERT INTO `eb_system_log` VALUES (111, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1558600710, 0);
INSERT INTO `eb_system_log` VALUES (112, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1558600711, 0);
INSERT INTO `eb_system_log` VALUES (113, 1, 'admin', 'admin/store.storeproductreply/index/', '评论管理展示页', 'GET', '127.0.0.1', 'system', 1558600711, 0);
INSERT INTO `eb_system_log` VALUES (114, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558661370, 0);
INSERT INTO `eb_system_log` VALUES (115, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558661385, 0);
INSERT INTO `eb_system_log` VALUES (116, 1, 'admin', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558661387, 0);
INSERT INTO `eb_system_log` VALUES (117, 1, 'admin', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558661404, 0);
INSERT INTO `eb_system_log` VALUES (118, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558661404, 0);
INSERT INTO `eb_system_log` VALUES (119, 1, 'admin', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558661458, 0);
INSERT INTO `eb_system_log` VALUES (120, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558661549, 0);
INSERT INTO `eb_system_log` VALUES (121, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558661565, 0);
INSERT INTO `eb_system_log` VALUES (122, 1, 'admin', 'admin/system.systemcleardata/index/', '清除数据', 'GET', '127.0.0.1', 'system', 1558661911, 0);
INSERT INTO `eb_system_log` VALUES (123, 1, 'admin', 'admin/system.systemcleardata/index/', '清除数据', 'GET', '127.0.0.1', 'system', 1558661916, 0);
INSERT INTO `eb_system_log` VALUES (124, 1, 'admin', 'admin/system.clear/index/', '刷新缓存', 'GET', '127.0.0.1', 'system', 1558661926, 0);
INSERT INTO `eb_system_log` VALUES (125, 1, 'admin', 'admin/system.clear/delete_cache/', '未知', 'GET', '127.0.0.1', 'system', 1558661932, 0);
INSERT INTO `eb_system_log` VALUES (126, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558661946, 0);
INSERT INTO `eb_system_log` VALUES (127, 1, 'admin', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558661947, 0);
INSERT INTO `eb_system_log` VALUES (128, 1, 'admin', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558661953, 0);
INSERT INTO `eb_system_log` VALUES (129, 1, 'admin', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558661954, 0);
INSERT INTO `eb_system_log` VALUES (130, 1, 'admin', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558661963, 0);
INSERT INTO `eb_system_log` VALUES (131, 1, 'admin', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558661972, 0);
INSERT INTO `eb_system_log` VALUES (132, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558661972, 0);
INSERT INTO `eb_system_log` VALUES (133, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558663608, 0);
INSERT INTO `eb_system_log` VALUES (134, 1, 'admin', 'admin/setting.systemadmin/delete/id/2', '删除管理员', 'GET', '127.0.0.1', 'system', 1558663611, 0);
INSERT INTO `eb_system_log` VALUES (135, 1, 'admin', 'admin/setting.systemadmin/delete/id/3', '删除管理员', 'GET', '127.0.0.1', 'system', 1558663614, 0);
INSERT INTO `eb_system_log` VALUES (136, 1, 'admin', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558663615, 0);
INSERT INTO `eb_system_log` VALUES (137, 1, 'admin', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558663624, 0);
INSERT INTO `eb_system_log` VALUES (138, 1, 'admin', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558663626, 0);
INSERT INTO `eb_system_log` VALUES (139, 1, 'admin', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558663627, 0);
INSERT INTO `eb_system_log` VALUES (140, 1, 'admin', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558663632, 0);
INSERT INTO `eb_system_log` VALUES (141, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558663632, 0);
INSERT INTO `eb_system_log` VALUES (142, 1, 'admin', 'admin/system.systemcleardata/index/', '清除数据', 'GET', '127.0.0.1', 'system', 1558663641, 0);
INSERT INTO `eb_system_log` VALUES (143, 1, 'admin', 'admin/system.clear/index/', '刷新缓存', 'GET', '127.0.0.1', 'system', 1558663641, 0);
INSERT INTO `eb_system_log` VALUES (144, 1, 'admin', 'admin/system.clear/refresh_cache/', '未知', 'GET', '127.0.0.1', 'system', 1558663645, 0);
INSERT INTO `eb_system_log` VALUES (145, 1, 'admin', 'admin/system.clear/delete_cache/', '未知', 'GET', '127.0.0.1', 'system', 1558663650, 0);
INSERT INTO `eb_system_log` VALUES (146, 1, 'admin', 'admin/system.clear/delete_log/', '未知', 'GET', '127.0.0.1', 'system', 1558663652, 0);
INSERT INTO `eb_system_log` VALUES (147, 1, 'admin', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558663658, 0);
INSERT INTO `eb_system_log` VALUES (148, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558663667, 0);
INSERT INTO `eb_system_log` VALUES (149, 1, 'admin', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558663669, 0);
INSERT INTO `eb_system_log` VALUES (150, 1, 'admin', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558663681, 0);
INSERT INTO `eb_system_log` VALUES (151, 1, 'admin', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558663682, 0);
INSERT INTO `eb_system_log` VALUES (152, 1, 'admin', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558663685, 0);
INSERT INTO `eb_system_log` VALUES (153, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558663685, 0);
INSERT INTO `eb_system_log` VALUES (154, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558663732, 0);
INSERT INTO `eb_system_log` VALUES (155, 1, 'admin', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558663734, 0);
INSERT INTO `eb_system_log` VALUES (156, 1, 'admin', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558663748, 0);
INSERT INTO `eb_system_log` VALUES (157, 1, 'admin', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558663803, 0);
INSERT INTO `eb_system_log` VALUES (158, 1, 'admin', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558663863, 0);
INSERT INTO `eb_system_log` VALUES (159, 1, 'admin', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558663875, 0);
INSERT INTO `eb_system_log` VALUES (160, 1, 'admin', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558663930, 0);
INSERT INTO `eb_system_log` VALUES (161, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558663930, 0);
INSERT INTO `eb_system_log` VALUES (162, 1, 'admin', 'admin/setting.systemadmin/delete/id/4', '删除管理员', 'GET', '127.0.0.1', 'system', 1558663935, 0);
INSERT INTO `eb_system_log` VALUES (163, 1, 'admin', 'admin/setting.systemadmin/delete/id/5', '删除管理员', 'GET', '127.0.0.1', 'system', 1558663940, 0);
INSERT INTO `eb_system_log` VALUES (164, 6, 'test6', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558663963, 0);
INSERT INTO `eb_system_log` VALUES (165, 6, 'test6', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558663971, 0);
INSERT INTO `eb_system_log` VALUES (166, 6, 'test6', 'admin/setting.systemrole/create/', '添加身份', 'GET', '127.0.0.1', 'system', 1558663975, 0);
INSERT INTO `eb_system_log` VALUES (167, 6, 'test6', 'admin/setting.systemrole/save/', '提交添加身份', 'POST', '127.0.0.1', 'system', 1558663990, 0);
INSERT INTO `eb_system_log` VALUES (168, 6, 'test6', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558663997, 0);
INSERT INTO `eb_system_log` VALUES (169, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558664001, 0);
INSERT INTO `eb_system_log` VALUES (170, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558664008, 0);
INSERT INTO `eb_system_log` VALUES (171, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558664018, 0);
INSERT INTO `eb_system_log` VALUES (172, 6, 'test6', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558664036, 0);
INSERT INTO `eb_system_log` VALUES (173, 6, 'test6', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558664037, 0);
INSERT INTO `eb_system_log` VALUES (174, 6, 'test6', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1558664090, 0);
INSERT INTO `eb_system_log` VALUES (175, 6, 'test6', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558664105, 0);
INSERT INTO `eb_system_log` VALUES (176, 6, 'test6', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558664121, 0);
INSERT INTO `eb_system_log` VALUES (177, 6, 'test6', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558664121, 0);
INSERT INTO `eb_system_log` VALUES (178, 1, 'admin', 'admin/system.clear/index/', '刷新缓存', 'GET', '127.0.0.1', 'system', 1558664137, 0);
INSERT INTO `eb_system_log` VALUES (179, 1, 'admin', 'admin/system.clear/refresh_cache/', '未知', 'GET', '127.0.0.1', 'system', 1558664139, 0);
INSERT INTO `eb_system_log` VALUES (180, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558664145, 0);
INSERT INTO `eb_system_log` VALUES (181, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558664147, 0);
INSERT INTO `eb_system_log` VALUES (182, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558664155, 0);
INSERT INTO `eb_system_log` VALUES (183, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558664161, 0);
INSERT INTO `eb_system_log` VALUES (184, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558664179, 0);
INSERT INTO `eb_system_log` VALUES (185, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558664182, 0);
INSERT INTO `eb_system_log` VALUES (186, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558664374, 0);
INSERT INTO `eb_system_log` VALUES (187, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558664378, 0);
INSERT INTO `eb_system_log` VALUES (188, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558664492, 0);
INSERT INTO `eb_system_log` VALUES (189, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558664503, 0);
INSERT INTO `eb_system_log` VALUES (190, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558664808, 0);
INSERT INTO `eb_system_log` VALUES (191, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558664879, 0);
INSERT INTO `eb_system_log` VALUES (192, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558664940, 0);
INSERT INTO `eb_system_log` VALUES (193, 1, 'admin', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558664942, 0);
INSERT INTO `eb_system_log` VALUES (194, 1, 'admin', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558664957, 0);
INSERT INTO `eb_system_log` VALUES (195, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558664957, 0);
INSERT INTO `eb_system_log` VALUES (196, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558664967, 0);
INSERT INTO `eb_system_log` VALUES (197, 8, 'test8', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558665014, 0);
INSERT INTO `eb_system_log` VALUES (198, 8, 'test8', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558665016, 0);
INSERT INTO `eb_system_log` VALUES (199, 1, 'admin', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558666912, 0);
INSERT INTO `eb_system_log` VALUES (200, 1, 'admin', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558667067, 0);
INSERT INTO `eb_system_log` VALUES (201, 1, 'admin', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558668577, 0);
INSERT INTO `eb_system_log` VALUES (202, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558669165, 0);
INSERT INTO `eb_system_log` VALUES (203, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558669167, 0);
INSERT INTO `eb_system_log` VALUES (204, 1, 'admin', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558669169, 0);
INSERT INTO `eb_system_log` VALUES (205, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558674948, 0);
INSERT INTO `eb_system_log` VALUES (206, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558674950, 0);
INSERT INTO `eb_system_log` VALUES (207, 1, 'admin', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558674954, 0);
INSERT INTO `eb_system_log` VALUES (208, 1, 'admin', 'admin/setting.systemadmin/save/', '提交添加管理员', 'POST', '127.0.0.1', 'system', 1558675002, 0);
INSERT INTO `eb_system_log` VALUES (209, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558675002, 0);
INSERT INTO `eb_system_log` VALUES (210, 9, 'test9', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558675058, 0);
INSERT INTO `eb_system_log` VALUES (211, 9, 'test9', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558675063, 0);
INSERT INTO `eb_system_log` VALUES (212, 9, 'test9', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1558675077, 0);
INSERT INTO `eb_system_log` VALUES (213, 9, 'test9', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558675095, 0);
INSERT INTO `eb_system_log` VALUES (214, 9, 'test9', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558675146, 0);
INSERT INTO `eb_system_log` VALUES (215, 9, 'test9', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558675212, 0);
INSERT INTO `eb_system_log` VALUES (216, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558675266, 0);
INSERT INTO `eb_system_log` VALUES (217, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/1', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558675279, 0);
INSERT INTO `eb_system_log` VALUES (218, 1, 'admin', 'admin/setting.systemgroup/index/', '组合数据展示页', 'GET', '127.0.0.1', 'system', 1558675282, 0);
INSERT INTO `eb_system_log` VALUES (219, 1, 'admin', 'admin/setting.systemnotice/index/', '后台通知', 'GET', '127.0.0.1', 'system', 1558675288, 0);
INSERT INTO `eb_system_log` VALUES (220, 1, 'admin', 'admin/setting.systemnotice/index/', '后台通知', 'GET', '127.0.0.1', 'system', 1558675291, 0);
INSERT INTO `eb_system_log` VALUES (221, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/34', '数据列表', 'GET', '127.0.0.1', 'system', 1558675295, 0);
INSERT INTO `eb_system_log` VALUES (222, 1, 'admin', 'admin/setting.systemadmin/edit/id/9', '编辑管理员', 'GET', '127.0.0.1', 'system', 1558675305, 0);
INSERT INTO `eb_system_log` VALUES (223, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558675315, 0);
INSERT INTO `eb_system_log` VALUES (224, 1, 'admin', 'admin/setting.systemadmin/edit/id/9', '编辑管理员', 'GET', '127.0.0.1', 'system', 1558675330, 0);
INSERT INTO `eb_system_log` VALUES (225, 1, 'admin', 'admin/setting.systemadmin/edit/id/9', '编辑管理员', 'GET', '127.0.0.1', 'system', 1558675335, 0);
INSERT INTO `eb_system_log` VALUES (226, 1, 'admin', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558675340, 0);
INSERT INTO `eb_system_log` VALUES (227, 1, 'admin', 'admin/setting.systemadmin/edit/id/9', '编辑管理员', 'GET', '127.0.0.1', 'system', 1558675348, 0);
INSERT INTO `eb_system_log` VALUES (228, 1, 'admin', 'admin/setting.systemadmin/edit/id/9', '编辑管理员', 'GET', '127.0.0.1', 'system', 1558675449, 0);
INSERT INTO `eb_system_log` VALUES (229, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558675461, 0);
INSERT INTO `eb_system_log` VALUES (230, 1, 'admin', 'admin/setting.systemadmin/edit/id/9', '编辑管理员', 'GET', '127.0.0.1', 'system', 1558675464, 0);
INSERT INTO `eb_system_log` VALUES (231, 1, 'admin', 'admin/system.systemcleardata/index/', '清除数据', 'GET', '127.0.0.1', 'system', 1558675472, 0);
INSERT INTO `eb_system_log` VALUES (232, 1, 'admin', 'admin/system.clear/index/', '刷新缓存', 'GET', '127.0.0.1', 'system', 1558675473, 0);
INSERT INTO `eb_system_log` VALUES (233, 1, 'admin', 'admin/system.clear/refresh_cache/', '未知', 'GET', '127.0.0.1', 'system', 1558675476, 0);
INSERT INTO `eb_system_log` VALUES (234, 1, 'admin', 'admin/system.clear/delete_cache/', '未知', 'GET', '127.0.0.1', 'system', 1558675481, 0);
INSERT INTO `eb_system_log` VALUES (235, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558675487, 0);
INSERT INTO `eb_system_log` VALUES (236, 1, 'admin', 'admin/setting.systemadmin/edit/id/9', '编辑管理员', 'GET', '127.0.0.1', 'system', 1558675490, 0);
INSERT INTO `eb_system_log` VALUES (237, 1, 'admin', 'admin/setting.systemadmin/edit/id/6', '编辑管理员', 'GET', '127.0.0.1', 'system', 1558675494, 0);
INSERT INTO `eb_system_log` VALUES (238, 1, 'admin', 'admin/setting.systemadmin/edit/id/8', '编辑管理员', 'GET', '127.0.0.1', 'system', 1558675498, 0);
INSERT INTO `eb_system_log` VALUES (239, 1, 'admin', 'admin/setting.systemadmin/edit/id/9', '编辑管理员', 'GET', '127.0.0.1', 'system', 1558675504, 0);
INSERT INTO `eb_system_log` VALUES (240, 1, 'admin', 'admin/setting.systemadmin/edit/id/9', '编辑管理员', 'GET', '127.0.0.1', 'system', 1558675589, 0);
INSERT INTO `eb_system_log` VALUES (241, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558675598, 0);
INSERT INTO `eb_system_log` VALUES (242, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558675711, 0);
INSERT INTO `eb_system_log` VALUES (243, 9, 'test9', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558675733, 0);
INSERT INTO `eb_system_log` VALUES (244, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558677018, 0);
INSERT INTO `eb_system_log` VALUES (245, 1, 'admin', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558677829, 0);
INSERT INTO `eb_system_log` VALUES (246, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558677848, 0);
INSERT INTO `eb_system_log` VALUES (247, 1, 'admin', 'admin/setting.systemadmin/edit/id/8', '编辑管理员', 'GET', '127.0.0.1', 'system', 1558677852, 0);
INSERT INTO `eb_system_log` VALUES (248, 1, 'admin', 'admin/setting.systemadmin/update/id/8', '提交修改管理员', 'POST', '127.0.0.1', 'system', 1558677857, 0);
INSERT INTO `eb_system_log` VALUES (249, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558677857, 0);
INSERT INTO `eb_system_log` VALUES (250, 1, 'admin', 'admin/setting.systemadmin/edit/id/9', '编辑管理员', 'GET', '127.0.0.1', 'system', 1558677861, 0);
INSERT INTO `eb_system_log` VALUES (251, 1, 'admin', 'admin/setting.systemadmin/update/id/9', '提交修改管理员', 'POST', '127.0.0.1', 'system', 1558677863, 0);
INSERT INTO `eb_system_log` VALUES (252, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558677863, 0);
INSERT INTO `eb_system_log` VALUES (253, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558677873, 0);
INSERT INTO `eb_system_log` VALUES (254, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1558677879, 0);
INSERT INTO `eb_system_log` VALUES (255, 9, 'test9', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558677904, 0);
INSERT INTO `eb_system_log` VALUES (256, 9, 'test9', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558677905, 0);
INSERT INTO `eb_system_log` VALUES (257, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558678162, 0);
INSERT INTO `eb_system_log` VALUES (258, 9, 'test9', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558678176, 0);
INSERT INTO `eb_system_log` VALUES (259, 1, 'admin', 'admin/setting.systemconfigtab/index/', '配置分类展示页', 'GET', '127.0.0.1', 'system', 1558678190, 0);
INSERT INTO `eb_system_log` VALUES (260, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/1', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558678193, 0);
INSERT INTO `eb_system_log` VALUES (261, 1, 'admin', 'admin/setting.systemgroup/index/', '组合数据展示页', 'GET', '127.0.0.1', 'system', 1558678195, 0);
INSERT INTO `eb_system_log` VALUES (262, 1, 'admin', 'admin/setting.systemnotice/index/', '后台通知', 'GET', '127.0.0.1', 'system', 1558678196, 0);
INSERT INTO `eb_system_log` VALUES (263, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558678204, 0);
INSERT INTO `eb_system_log` VALUES (264, 9, 'test9', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558678483, 0);
INSERT INTO `eb_system_log` VALUES (265, 9, 'test9', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558678502, 0);
INSERT INTO `eb_system_log` VALUES (266, 9, 'test9', 'admin/setting.systemadmin/create/', '添加管理员', 'GET', '127.0.0.1', 'system', 1558678503, 0);
INSERT INTO `eb_system_log` VALUES (267, 9, 'test9', 'admin/setting.systemrole/create/', '添加身份', 'GET', '127.0.0.1', 'system', 1558678546, 0);
INSERT INTO `eb_system_log` VALUES (268, 9, 'test9', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558678633, 0);
INSERT INTO `eb_system_log` VALUES (269, 9, 'test9', 'admin/setting.systemrole/create/', '添加身份', 'GET', '127.0.0.1', 'system', 1558678634, 0);
INSERT INTO `eb_system_log` VALUES (270, 9, 'test9', 'admin/setting.systemrole/save/', '提交添加身份', 'POST', '127.0.0.1', 'system', 1558678650, 0);
INSERT INTO `eb_system_log` VALUES (271, 9, 'test9', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558678709, 0);
INSERT INTO `eb_system_log` VALUES (272, 9, 'test9', 'admin/setting.systemrole/edit/id/26', '修改身份', 'GET', '127.0.0.1', 'system', 1558678720, 0);
INSERT INTO `eb_system_log` VALUES (273, 9, 'test9', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1558678730, 0);
INSERT INTO `eb_system_log` VALUES (274, 9, 'test9', 'admin/setting.systemconfigtab/index/', '配置分类展示页', 'GET', '127.0.0.1', 'system', 1558678732, 0);
INSERT INTO `eb_system_log` VALUES (275, 9, 'test9', 'admin/setting.systemconfig/index/tab_id/1', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558678736, 0);
INSERT INTO `eb_system_log` VALUES (276, 9, 'test9', 'admin/setting.systemgroup/index/', '组合数据展示页', 'GET', '127.0.0.1', 'system', 1558678738, 0);
INSERT INTO `eb_system_log` VALUES (277, 9, 'test9', 'admin/setting.systemnotice/index/', '后台通知', 'GET', '127.0.0.1', 'system', 1558678739, 0);
INSERT INTO `eb_system_log` VALUES (278, 9, 'test9', 'admin/system.express/index/', '物流公司', 'GET', '127.0.0.1', 'system', 1558678742, 0);
INSERT INTO `eb_system_log` VALUES (279, 9, 'test9', 'admin/system.express/index/', '物流公司', 'GET', '127.0.0.1', 'system', 1558678746, 0);
INSERT INTO `eb_system_log` VALUES (280, 9, 'test9', 'admin/system.express/edit/id/20', '未知', 'GET', '127.0.0.1', 'system', 1558678748, 0);
INSERT INTO `eb_system_log` VALUES (281, 9, 'test9', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558678759, 0);
INSERT INTO `eb_system_log` VALUES (282, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558678771, 0);
INSERT INTO `eb_system_log` VALUES (283, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1558678855, 0);
INSERT INTO `eb_system_log` VALUES (284, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1558678861, 0);
INSERT INTO `eb_system_log` VALUES (285, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1558678875, 0);
INSERT INTO `eb_system_log` VALUES (286, 1, 'admin', 'admin/setting.systemconfigtab/index/', '配置分类展示页', 'GET', '127.0.0.1', 'system', 1558678886, 0);
INSERT INTO `eb_system_log` VALUES (287, 1, 'admin', 'admin/setting.systemconfig/index/type/1/tab_id/2', '公众号接口配置', 'GET', '127.0.0.1', 'system', 1558678889, 0);
INSERT INTO `eb_system_log` VALUES (288, 1, 'admin', 'admin/article.articlecategory/index/', '文章分类管理展示页', 'GET', '127.0.0.1', 'system', 1558678960, 0);
INSERT INTO `eb_system_log` VALUES (289, 1, 'admin', 'admin/article.article/index/', '文章管理', 'GET', '127.0.0.1', 'system', 1558678962, 0);
INSERT INTO `eb_system_log` VALUES (290, 1, 'admin', 'admin/system.systemlog/index/', '管理员操作记录展示页', 'GET', '127.0.0.1', 'system', 1558678965, 0);
INSERT INTO `eb_system_log` VALUES (291, 1, 'admin', 'admin/system.systemfile/index/', '文件管理展示页', 'GET', '127.0.0.1', 'system', 1558679004, 0);
INSERT INTO `eb_system_log` VALUES (292, 1, 'admin', 'admin/record.record/chart_product/', '产品统计', 'GET', '127.0.0.1', 'system', 1558679030, 0);
INSERT INTO `eb_system_log` VALUES (293, 1, 'admin', 'admin/record.record/get_echarts_product/', '未知', 'GET', '127.0.0.1', 'system', 1558679031, 0);
INSERT INTO `eb_system_log` VALUES (294, 1, 'admin', 'admin/record.record/chart_order/', '订单统计', 'GET', '127.0.0.1', 'system', 1558679031, 0);
INSERT INTO `eb_system_log` VALUES (295, 1, 'admin', 'admin/record.record/get_echarts_maxlist/', '未知', 'GET', '127.0.0.1', 'system', 1558679032, 0);
INSERT INTO `eb_system_log` VALUES (296, 1, 'admin', 'admin/record.record/get_echarts_order/', '未知', 'GET', '127.0.0.1', 'system', 1558679032, 0);
INSERT INTO `eb_system_log` VALUES (297, 1, 'admin', 'admin/record.record/get_echarts_profity/', '未知', 'GET', '127.0.0.1', 'system', 1558679032, 0);
INSERT INTO `eb_system_log` VALUES (298, 1, 'admin', 'admin/record.record/gettuiprieslist/', '未知', 'GET', '127.0.0.1', 'system', 1558679032, 0);
INSERT INTO `eb_system_log` VALUES (299, 1, 'admin', 'admin/system.express/index/', '物流公司', 'GET', '127.0.0.1', 'system', 1558679044, 0);
INSERT INTO `eb_system_log` VALUES (300, 1, 'admin', 'admin/setting.systemconfigtab/index/', '配置分类展示页', 'GET', '127.0.0.1', 'system', 1558679055, 0);
INSERT INTO `eb_system_log` VALUES (301, 1, 'admin', 'admin/setting.systemconfigtab/index/', '配置分类展示页', 'GET', '127.0.0.1', 'system', 1558679173, 0);
INSERT INTO `eb_system_log` VALUES (302, 1, 'admin', 'admin/setting.systemconfigtab/index/', '配置分类展示页', 'GET', '127.0.0.1', 'system', 1558679317, 0);
INSERT INTO `eb_system_log` VALUES (303, 1, 'admin', 'admin/setting.systemconfigtab/index/', '配置分类展示页', 'GET', '127.0.0.1', 'system', 1558679360, 0);
INSERT INTO `eb_system_log` VALUES (304, 9, 'test9', 'admin/setting.systemconfigtab/index/', '配置分类展示页', 'GET', '127.0.0.1', 'system', 1558679379, 0);
INSERT INTO `eb_system_log` VALUES (305, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/1', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558679396, 0);
INSERT INTO `eb_system_log` VALUES (306, 1, 'admin', 'admin/setting.systemgroup/index/', '组合数据展示页', 'GET', '127.0.0.1', 'system', 1558679399, 0);
INSERT INTO `eb_system_log` VALUES (307, 1, 'admin', 'admin/setting.systemnotice/index/', '后台通知', 'GET', '127.0.0.1', 'system', 1558679400, 0);
INSERT INTO `eb_system_log` VALUES (308, 9, 'test9', 'admin/setting.systemconfigtab/index/', '配置分类展示页', 'GET', '127.0.0.1', 'system', 1558679595, 0);
INSERT INTO `eb_system_log` VALUES (309, 1, 'admin', 'admin/setting.systemconfigtab/index/', '配置分类展示页', 'GET', '127.0.0.1', 'system', 1558679605, 0);
INSERT INTO `eb_system_log` VALUES (310, 1, 'admin', 'admin/setting.systemconfigtab/index/', '配置分类展示页', 'GET', '127.0.0.1', 'system', 1558679690, 0);
INSERT INTO `eb_system_log` VALUES (311, 1, 'admin', 'admin/setting.systemconfigtab/edit/id/10', '编辑配置分类', 'GET', '127.0.0.1', 'system', 1558679697, 0);
INSERT INTO `eb_system_log` VALUES (312, 1, 'admin', 'admin/setting.systemconfigtab/edit/id/11', '编辑配置分类', 'GET', '127.0.0.1', 'system', 1558679709, 0);
INSERT INTO `eb_system_log` VALUES (313, 1, 'admin', 'admin/setting.systemconfigtab/edit/id/14', '编辑配置分类', 'GET', '127.0.0.1', 'system', 1558679714, 0);
INSERT INTO `eb_system_log` VALUES (314, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/1', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558679729, 0);
INSERT INTO `eb_system_log` VALUES (315, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/5/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558679741, 0);
INSERT INTO `eb_system_log` VALUES (316, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/10/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558679742, 0);
INSERT INTO `eb_system_log` VALUES (317, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/5/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558679743, 0);
INSERT INTO `eb_system_log` VALUES (318, 1, 'admin', 'admin/setting.systemgroup/index/', '组合数据展示页', 'GET', '127.0.0.1', 'system', 1558679746, 0);
INSERT INTO `eb_system_log` VALUES (319, 1, 'admin', 'admin/setting.systemnotice/index/', '后台通知', 'GET', '127.0.0.1', 'system', 1558679749, 0);
INSERT INTO `eb_system_log` VALUES (320, 1, 'admin', 'admin/setting.systemconfigtab/edit/id/7', '编辑配置分类', 'GET', '127.0.0.1', 'system', 1558679757, 0);
INSERT INTO `eb_system_log` VALUES (321, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/35', '数据列表', 'GET', '127.0.0.1', 'system', 1558679771, 0);
INSERT INTO `eb_system_log` VALUES (322, 1, 'admin', 'admin/setting.systemnotice/index/', '后台通知', 'GET', '127.0.0.1', 'system', 1558679800, 0);
INSERT INTO `eb_system_log` VALUES (323, 1, 'admin', 'admin/setting.systemgroup/index/', '组合数据展示页', 'GET', '127.0.0.1', 'system', 1558679803, 0);
INSERT INTO `eb_system_log` VALUES (324, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/10/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558679815, 0);
INSERT INTO `eb_system_log` VALUES (325, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/1/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558679817, 0);
INSERT INTO `eb_system_log` VALUES (326, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/5/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558679818, 0);
INSERT INTO `eb_system_log` VALUES (327, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/10/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558679819, 0);
INSERT INTO `eb_system_log` VALUES (328, 9, 'test9', 'admin/setting.systemconfigtab/index/', '配置分类展示页', 'GET', '127.0.0.1', 'system', 1558679930, 0);
INSERT INTO `eb_system_log` VALUES (329, 9, 'test9', 'admin/setting.systemconfig/index/tab_id/1', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558679933, 0);
INSERT INTO `eb_system_log` VALUES (330, 9, 'test9', 'admin/setting.systemconfig/index/tab_id/1', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558679939, 0);
INSERT INTO `eb_system_log` VALUES (331, 9, 'test9', 'admin/setting.systemconfig/index/tab_id/5/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558680245, 0);
INSERT INTO `eb_system_log` VALUES (332, 9, 'test9', 'admin/setting.systemconfig/index/tab_id/10/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558680246, 0);
INSERT INTO `eb_system_log` VALUES (333, 9, 'test9', 'admin/setting.systemconfig/index/tab_id/5/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558680255, 0);
INSERT INTO `eb_system_log` VALUES (334, 9, 'test9', 'admin/setting.systemconfig/index/tab_id/1/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1558680276, 0);
INSERT INTO `eb_system_log` VALUES (335, 9, 'test9', 'admin/finance.userextract/index/', '未知', 'GET', '127.0.0.1', 'system', 1558680915, 0);

-- ----------------------------
-- Table structure for eb_system_menus
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_menus`;
CREATE TABLE `eb_system_menus`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `pid` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级id',
  `icon` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图标',
  `menu_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '按钮名',
  `module` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '模块名',
  `controller` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '控制器',
  `action` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '方法名',
  `params` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '[]' COMMENT '参数',
  `sort` tinyint(3) NOT NULL DEFAULT 1 COMMENT '排序',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `access` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '子管理员是否可用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `is_show`(`is_show`) USING BTREE,
  INDEX `access`(`access`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 456 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_menus
-- ----------------------------
INSERT INTO `eb_system_menus` VALUES (1, 289, '', '系统设置', 'admin', 'setting.systemConfig', 'index', '[]', 90, 1, 1);
INSERT INTO `eb_system_menus` VALUES (2, 153, '', '权限规则', 'admin', 'setting.systemMenus', 'index', '[]', 7, 1, 1);
INSERT INTO `eb_system_menus` VALUES (4, 153, '', '管理员列表', 'admin', 'setting.systemAdmin', 'index', '[]', 9, 1, 1);
INSERT INTO `eb_system_menus` VALUES (6, 1, '', '系统配置', 'admin', 'setting.systemConfig', 'index', '{\"tab_id\":\"1\"}', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (7, 1, '', '配置分类', 'admin', 'setting.systemConfigTab', 'index', '[]', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (8, 153, '', '身份管理', 'admin', 'setting.systemRole', 'index', '[]', 10, 1, 1);
INSERT INTO `eb_system_menus` VALUES (9, 1, '', '组合数据', 'admin', 'setting.systemGroup', 'index', '[]', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (11, 0, 'wechat', '公众号', 'admin', 'wechat', 'index', '[]', 91, 1, 1);
INSERT INTO `eb_system_menus` VALUES (12, 354, '', '微信关注回复', 'admin', 'wechat.reply', 'index', '{\"key\":\"subscribe\",\"title\":\"\\u7f16\\u8f91\\u65e0\\u914d\\u7f6e\\u9ed8\\u8ba4\\u56de\\u590d\"}', 86, 1, 1);
INSERT INTO `eb_system_menus` VALUES (17, 360, '', '微信菜单', 'admin', 'wechat.menus', 'index', '[]', 95, 1, 1);
INSERT INTO `eb_system_menus` VALUES (286, 0, 'paper-plane', '营销', 'admin', 'ump', 'index', '[]', 105, 1, 1);
INSERT INTO `eb_system_menus` VALUES (19, 11, '', '图文管理', 'admin', 'wechat.wechatNewsCategory', 'index', '[]', 60, 1, 1);
INSERT INTO `eb_system_menus` VALUES (21, 0, 'magic', '维护', 'admin', 'system', 'index', '[]', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (23, 0, 'laptop', '商品', 'admin', 'store', 'index', '[]', 110, 1, 1);
INSERT INTO `eb_system_menus` VALUES (24, 23, '', '商品管理', 'admin', 'store.storeProduct', 'index', '{\"type\":\"1\"}', 100, 1, 1);
INSERT INTO `eb_system_menus` VALUES (25, 23, '', '商品分类', 'admin', 'store.storeCategory', 'index', '[]', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (26, 285, '', '订单管理', 'admin', 'order.storeOrder', 'index', '[]', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (30, 354, '', '关键字回复', 'admin', 'wechat.reply', 'keyword', '[]', 85, 1, 1);
INSERT INTO `eb_system_menus` VALUES (31, 354, '', '无效关键词回复', 'admin', 'wechat.reply', 'index', '{\"key\":\"default\",\"title\":\"\\u7f16\\u8f91\\u65e0\\u6548\\u5173\\u952e\\u5b57\\u9ed8\\u8ba4\\u56de\\u590d\"}', 84, 1, 1);
INSERT INTO `eb_system_menus` VALUES (33, 284, '', '附加权限', 'admin', 'article.articleCategory', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (34, 33, '', '添加文章分类', 'admin', 'article.articleCategory', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (35, 33, '', '编辑文章分类', 'admin', 'article.articleCategory', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (36, 33, '', '删除文章分类', 'admin', 'article.articleCategory', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (37, 31, '', '附加权限', 'admin', 'wechat.reply', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (38, 283, '', '附加权限', 'admin', 'article.article', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (39, 38, '', '添加文章', 'admin', 'article. article', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (40, 38, '', '编辑文章', 'admin', 'article. article', 'add_new', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (41, 38, '', '删除文章', 'admin', 'article. article', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (42, 19, '', '附加权限', 'admin', 'wechat.wechatNewsCategory', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (43, 42, '', '添加图文消息', 'admin', 'wechat.wechatNewsCategory', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (44, 42, '', '编辑图文消息', 'admin', 'wechat.wechatNewsCategory', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (45, 42, '', '删除图文消息', 'admin', 'wechat.wechatNewsCategory', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (46, 7, '', '配置分类附加权限', 'admin', 'setting.systemConfigTab', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (47, 46, '', '添加配置分类', 'admin', 'setting.systemConfigTab', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (48, 46, '', '添加配置', 'admin', 'setting.systemConfig', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (49, 46, '', '编辑配置分类', 'admin', 'setting.systemConfigTab', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (50, 46, '', '删除配置分类', 'admin', 'setting.systemConfigTab', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (51, 46, '', '查看子字段', 'admin', 'system.systemConfigTab', 'sonConfigTab', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (52, 9, '', '组合数据附加权限', 'admin', 'setting.systemGroup', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (53, 52, '', '添加数据', 'admin', 'setting.systemGroupData', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (54, 52, '', '编辑数据', 'admin', 'setting.systemGroupData', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (55, 52, '', '删除数据', 'admin', 'setting.systemGroupData', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (56, 52, '', '数据列表', 'admin', 'setting.systemGroupData', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (57, 52, '', '添加数据组', 'admin', 'setting.systemGroup', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (58, 52, '', '删除数据组', 'admin', 'setting.systemGroup', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (59, 4, '', '管理员列表附加权限', 'admin', 'setting.systemAdmin', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (60, 59, '', '添加管理员', 'admin', 'setting.systemAdmin', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (61, 59, '', '编辑管理员', 'admin', 'setting.systemAdmin', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (62, 59, '', '删除管理员', 'admin', 'setting.systemAdmin', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (63, 8, '', '身份管理附加权限', 'admin', 'setting.systemRole', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (64, 63, '', '添加身份', 'admin', 'setting.systemRole', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (65, 63, '', '修改身份', 'admin', 'setting.systemRole', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (66, 63, '', '删除身份', 'admin', 'setting.systemRole', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (67, 8, '', '身份管理展示页', 'admin', 'setting.systemRole', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (68, 4, '', '管理员列表展示页', 'admin', 'setting.systemAdmin', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (69, 7, '', '配置分类展示页', 'admin', 'setting.systemConfigTab', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (70, 9, '', '组合数据展示页', 'admin', 'setting.systemGroup', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (71, 284, '', '文章分类管理展示页', 'admin', 'article.articleCategory', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (72, 283, '', '文章管理展示页', 'admin', 'article.article', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (73, 19, '', '图文消息展示页', 'admin', 'wechat.wechatNewsCategory', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (74, 2, '', '菜单管理附加权限', 'admin', 'setting.systemMenus', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (75, 74, '', '添加菜单', 'admin', 'setting.systemMenus', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (76, 74, '', '编辑菜单', 'admin', 'setting.systemMenus', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (77, 74, '', '删除菜单', 'admin', 'setting.systemMenus', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (78, 2, '', '菜单管理展示页', 'admin', 'setting.systemMenus', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (352, 148, '', '优惠券配置', 'admin', 'setting.systemConfig', 'index', '{\"type\":\"3\",\"tab_id\":\"12\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (80, 0, 'leanpub', '内容', 'admin', 'article', 'index', '[]', 90, 1, 1);
INSERT INTO `eb_system_menus` VALUES (82, 11, '', '微信用户管理', 'admin', 'user', 'list', '[]', 5, 1, 1);
INSERT INTO `eb_system_menus` VALUES (84, 82, '', '用户标签', 'admin', 'wechat.wechatUser', 'tag', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (89, 30, '', '关键字回复附加权限', 'admin', 'wechat.reply', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (90, 89, '', '添加关键字', 'admin', 'wechat.reply', 'add_keyword', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (91, 89, '', '修改关键字', 'admin', 'wechat.reply', 'info_keyword', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (92, 89, '', '删除关键字', 'admin', 'wechat.reply', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (93, 30, '', '关键字回复展示页', 'admin', 'wechat.reply', 'keyword', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (94, 31, '', '无效关键词回复展示页', 'admin', 'wechat.reply', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (95, 31, '', '无效关键词回复附加权限', 'admin', 'wechat.reply', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (96, 95, '', '无效关键词回复提交按钮', 'admin', 'wechat.reply', 'save', '{\"key\":\"default\",\"title\":\"编辑无效关键字默认回复\"}', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (97, 12, '', '微信关注回复展示页', 'admin', 'wechat.reply', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (98, 12, '', '微信关注回复附加权限', 'admin', 'wechat.reply', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (99, 98, '', '微信关注回复提交按钮', 'admin', 'wechat.reply', 'save', '{\"key\":\"subscribe\",\"title\":\"编辑无配置默认回复\"}', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (100, 74, '', '添加提交菜单', 'admin', 'setting.systemMenus', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (101, 74, '', '编辑提交菜单', 'admin', 'setting.systemMenus', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (102, 59, '', '提交添加管理员', 'admin', 'setting.systemAdmin', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (103, 59, '', '提交修改管理员', 'admin', 'setting.systemAdmin', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (104, 63, '', '提交添加身份', 'admin', 'setting.systemRole', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (105, 63, '', '提交修改身份', 'admin', 'setting.systemRole', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (106, 46, '', '提交添加配置分类', 'admin', 'setting.systemConfigTab', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (107, 46, '', '提交修改配置分类', 'admin', 'setting.systemConfigTab', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (108, 46, '', '提交添加配置列表', 'admin', 'setting.systemConfig', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (109, 52, '', '提交添加数据组', 'admin', 'setting.systemGroup', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (110, 52, '', '提交修改数据组', 'admin', 'setting.systemGroup', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (111, 52, '', '提交添加数据', 'admin', 'setting.systemGroupData', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (112, 52, '', '提交修改数据', 'admin', 'setting.systemGroupData', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (113, 33, '', '提交添加文章分类', 'admin', 'article.articleCategory', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (114, 33, '', '提交添加文章分类', 'admin', 'article.articleCategory', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (115, 42, '', '提交添加图文消息', 'admin', 'wechat.wechatNewsCategory', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (116, 42, '', '提交编辑图文消息', 'admin', 'wechat.wechatNewsCategory', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (117, 6, '', '配置列表附加权限', 'admin', 'setting.systemConfig', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (118, 6, '', '配置列表展示页', 'admin', 'setting.systemConfig', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (119, 117, '', '提交保存配置列表', 'admin', 'setting.systemConfig', 'save_basics', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (123, 89, '', '提交添加关键字', 'admin', 'wechat.reply', 'save_keyword', '{\"dis\":\"1\"}', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (124, 89, '', '提交修改关键字', 'admin', 'wechat.reply', 'save_keyword', '{\"dis\":\"2\"}', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (126, 17, '', '微信菜单展示页', 'admin', 'wechat.menus', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (127, 17, '', '微信菜单附加权限', 'admin', 'wechat.menus', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (128, 127, '', '提交微信菜单按钮', 'admin', 'wechat.menus', 'save', '{\"dis\":\"1\"}', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (129, 82, '', '用户行为纪录', 'admin', 'wechat.wechatMessage', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (130, 21, '', '系统日志', 'admin', 'system.systemLog', 'index', '[]', 5, 1, 1);
INSERT INTO `eb_system_menus` VALUES (131, 130, '', '管理员操作记录展示页', 'admin', 'system.systemLog', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (132, 129, '', '微信用户行为纪录展示页', 'admin', 'wechat.wechatMessage', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (133, 82, '', '微信用户', 'admin', 'wechat.wechatUser', 'index', '[]', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (134, 133, '', '微信用户展示页', 'admin', 'wechat.wechatUser', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (241, 273, '', '限时秒杀', 'admin', 'ump.storeSeckill', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (137, 135, '', '添加通知模板', 'admin', 'system.systemNotice', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (138, 135, '', '编辑通知模板', 'admin', 'system.systemNotice', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (139, 135, '', '删除辑通知模板', 'admin', 'system.systemNotice', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (140, 135, '', '提交编辑辑通知模板', 'admin', 'system.systemNotice', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (141, 135, '', '提交添加辑通知模板', 'admin', 'system.systemNotice', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (142, 25, '', '产品分类展示页', 'admin', 'store.storeCategory', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (143, 25, '', '产品分类附加权限', 'admin', 'store.storeCategory', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (144, 117, '', '获取配置列表上传文件的名称', 'admin', 'setting.systemConfig', 'getimagename', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (145, 117, '', '配置列表上传文件', 'admin', 'setting.systemConfig', 'view_upload', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (146, 24, '', '产品管理展示页', 'admin', 'store.storeProduct', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (147, 24, '', '产品管理附加权限', 'admin', 'store.storeProduct', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (148, 286, '', '优惠券', '', '', '', '[]', 10, 1, 1);
INSERT INTO `eb_system_menus` VALUES (149, 148, '', '优惠券制作', 'admin', 'ump.storeCoupon', 'index', '[]', 5, 1, 1);
INSERT INTO `eb_system_menus` VALUES (150, 148, '', '会员领取记录', 'admin', 'ump.storeCouponUser', 'index', '[]', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (151, 0, 'user', '会员', 'admin', 'user', 'index', '[]', 107, 1, 1);
INSERT INTO `eb_system_menus` VALUES (153, 289, '', '管理权限', 'admin', 'setting.systemAdmin', '', '[]', 100, 1, 1);
INSERT INTO `eb_system_menus` VALUES (155, 154, '', '商户产品展示页', 'admin', 'store.storeMerchant', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (156, 154, '', '商户产品附加权限', 'admin', 'store.storeMerchant', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (158, 157, '', '商户文章管理展示页', 'admin', 'wechat.wechatNews', 'merchantIndex', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (159, 157, '', '商户文章管理附加权限', 'admin', 'wechat.wechatNews', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (170, 290, '', '评论管理', 'admin', 'store.store_product_reply', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (173, 21, '', '文件校验', 'admin', 'system.systemFile', 'index', '[]', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (174, 360, '', '微信模板消息', 'admin', 'wechat.wechatTemplate', 'index', '[]', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (175, 11, '', '客服管理', 'admin', 'wechat.storeService', 'index', '[]', 70, 1, 1);
INSERT INTO `eb_system_menus` VALUES (176, 151, '', '站内通知', 'admin', 'user.user_notice', 'index', '[]', 8, 1, 1);
INSERT INTO `eb_system_menus` VALUES (177, 151, '', '会员管理', 'admin', 'user.user', 'index', '[]', 10, 1, 1);
INSERT INTO `eb_system_menus` VALUES (179, 307, '', '充值记录', 'admin', 'finance.userRecharge', 'index', '[]', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (190, 26, '', '订单管理展示页', 'admin', 'store.storeOrder', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (191, 26, '', '订单管理附加权限', 'admin', 'store.storeOrder', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (192, 191, '', '订单管理去发货', 'admin', 'store.storeOrder', 'deliver_goods', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (193, 191, '', '订单管理备注', 'admin', 'store.storeOrder', 'remark', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (194, 191, '', '订单管理去送货', 'admin', 'store.storeOrder', 'delivery', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (195, 191, '', '订单管理已收货', 'admin', 'store.storeOrder', 'take_delivery', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (196, 191, '', '订单管理退款', 'admin', 'store.storeOrder', 'refund_y', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (197, 191, '', '订单管理修改订单', 'admin', 'store.storeOrder', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (198, 191, '', '订单管理修改订单提交', 'admin', 'store.storeOrder', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (199, 191, '', '订单管理退积分', 'admin', 'store.storeOrder', 'integral_back', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (200, 191, '', '订单管理退积分提交', 'admin', 'store.storeOrder', 'updateIntegralBack', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (201, 191, '', '订单管理立即支付', 'admin', 'store.storeOrder', 'offline', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (202, 191, '', '订单管理退款原因', 'admin', 'store.storeOrder', 'refund_n', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (203, 191, '', '订单管理退款原因提交', 'admin', 'store.storeOrder', 'updateRefundN', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (204, 191, '', '订单管理修改配送信息', 'admin', 'store.storeOrder', 'distribution', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (205, 191, '', '订单管理修改配送信息提交', 'admin', 'store.storeOrder', 'updateDistribution', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (206, 191, '', '订单管理退款提交', 'admin', 'store.storeOrder', 'updateRefundY', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (207, 191, '', '订单管理去发货提交', 'admin', 'store.storeOrder', 'updateDeliveryGoods', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (208, 191, '', '订单管理去送货提交', 'admin', 'store.storeOrder', 'updateDelivery', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (209, 175, '', '客服管理展示页', 'admin', 'store.storeService', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (210, 175, '', '客服管理附加权限', 'admin', 'store.storeService', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (211, 210, '', '客服管理添加', 'admin', 'store.storeService', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (212, 210, '', '客服管理添加提交', 'admin', 'store.storeService', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (213, 210, '', '客服管理编辑', 'admin', 'store.storeService', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (214, 210, '', '客服管理编辑提交', 'admin', 'store.storeService', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (215, 210, '', '客服管理删除', 'admin', 'store.storeService', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (216, 179, '', '用户充值记录展示页', 'admin', 'user.userRecharge', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (217, 179, '', '用户充值记录附加权限', 'admin', 'user.userRecharge', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (218, 217, '', '用户充值记录退款', 'admin', 'user.userRecharge', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (219, 217, '', '用户充值记录退款提交', 'admin', 'user.userRecharge', 'updaterefundy', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (220, 180, '', '预售卡管理批量修改预售卡金额', 'admin', 'presell.presellCard', 'batch_price', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (221, 180, '', '预售卡管理批量修改预售卡金额提交', 'admin', 'presell.presellCard', 'savebatch', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (222, 210, '', '客服管理聊天记录查询', 'admin', 'store.storeService', 'chat_user', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (223, 210, '', '客服管理聊天记录查询详情', 'admin', 'store.storeService', 'chat_list', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (224, 170, '', '评论管理展示页', 'admin', 'store.storeProductReply', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (225, 170, '', '评论管理附加权限', 'admin', 'store.storeProductReply', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (226, 225, '', '评论管理回复评论', 'admin', 'store.storeProductReply', 'set_reply', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (227, 225, '', '评论管理修改回复评论', 'admin', 'store.storeProductReply', 'edit_reply', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (228, 225, '', '评论管理删除评论', 'admin', 'store.storeProductReply', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (229, 149, '', '优惠券管理展示页', 'admin', 'store.storeCoupon', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (230, 149, '', '优惠券管理附加权限', 'admin', 'store.storeCoupon', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (231, 230, '', '优惠券管理添加', 'admin', 'store.storeCoupon', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (232, 230, '', '优惠券管理添加提交', 'admin', 'store.storeCoupon', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (233, 230, '', '优惠券管理删除', 'admin', 'store.storeCoupon', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (234, 230, '', '优惠券管理立即失效', 'admin', 'store.storeCoupon', 'status', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (235, 148, '', '已发布管理', 'admin', 'ump.storeCouponIssue', 'index', '[]', 3, 1, 1);
INSERT INTO `eb_system_menus` VALUES (236, 82, '', '用户分组', 'admin', 'wechat.wechatUser', 'group', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (237, 21, '', '刷新缓存', 'admin', 'system.clear', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (238, 272, '', '拼团产品', 'admin', 'ump.storeCombination', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (239, 306, '', '提现申请', 'admin', 'finance.user_extract', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (351, 349, '', '积分日志', 'admin', 'ump.userPoint', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (244, 294, '', '财务报表', 'admin', 'record.storeStatistics', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (246, 295, '', '用户统计', 'admin', 'user.user', 'user_analysis', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (247, 153, '', '个人资料', 'admin', 'setting.systemAdmin', 'admininfo', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (248, 247, '', '个人资料附加权限', 'admin', 'setting.systemAdmin', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (249, 248, '', '个人资料提交保存', 'admin', 'system.systemAdmin', 'setAdminInfo', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (250, 247, '', '个人资料展示页', 'admin', 'setting.systemAdmin', 'admininfo', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (252, 21, '', '在线更新', 'admin', 'system.systemUpgradeclient', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (254, 271, '', '砍价产品', 'admin', 'ump.storeBargain', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (255, 1, '', '后台通知', 'admin', 'setting.systemNotice', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (256, 0, 'cloud', '服务器端', 'admin', 'upgrade', 'index', '[]', -100, 1, 1);
INSERT INTO `eb_system_menus` VALUES (261, 147, '', '编辑产品', 'admin', 'store.storeproduct', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (262, 147, '', '添加产品', 'admin', 'store.storeproduct', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (263, 147, '', '编辑产品详情', 'admin', 'store.storeproduct', 'edit_content', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (264, 147, '', '开启秒杀', 'admin', 'store.storeproduct', 'seckill', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (265, 147, '', '开启秒杀', 'admin', 'store.store_product', 'bargain', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (266, 147, '', '产品编辑属性', 'admin', 'store.storeproduct', 'attr', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (267, 360, '', '公众号接口配置', 'admin', 'setting.systemConfig', 'index', '{\"type\":\"1\",\"tab_id\":\"2\"}', 100, 1, 1);
INSERT INTO `eb_system_menus` VALUES (269, 0, 'cubes', '小程序', 'admin', 'routine', 'index', '[]', 92, 1, 1);
INSERT INTO `eb_system_menus` VALUES (270, 269, '', '小程序配置', 'admin', 'setting.systemConfig', 'index_alone', '{\"type\":\"2\",\"tab_id\":\"7\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (271, 286, '', '砍价管理', 'admin', '', '', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (272, 286, '', '拼团管理', 'admin', '', '', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (273, 286, '', '秒杀管理', 'admin', '', '', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (293, 288, '', '交易数据', 'admin', '', '', '[]', 100, 1, 1);
INSERT INTO `eb_system_menus` VALUES (276, 21, '', '附件管理', 'admin', 'widget.images', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (278, 21, '', '清除数据', 'admin', 'system.systemCleardata', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (363, 362, '', '上传图片', 'admin', 'widget.images', 'upload', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (364, 362, '', '删除图片', 'admin', 'widget.images', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (362, 276, '', '附加权限', 'admin', 'widget.images', '', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (285, 0, 'building-o', '订单', 'admin', 'order', 'index', '[]', 109, 1, 1);
INSERT INTO `eb_system_menus` VALUES (283, 80, '', '文章管理', 'admin', 'article.article', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (284, 80, '', '文章分类', 'admin', 'article.article_category', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (287, 0, 'money', '财务', 'admin', 'finance', 'index', '[]', 103, 1, 1);
INSERT INTO `eb_system_menus` VALUES (288, 0, 'line-chart', '数据', 'admin', 'record', 'index', '[]', 100, 1, 1);
INSERT INTO `eb_system_menus` VALUES (289, 0, 'gear', '设置', 'admin', 'setting', 'index', '[]', 90, 1, 1);
INSERT INTO `eb_system_menus` VALUES (290, 285, '', '售后服务', 'admin', '', '', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (353, 337, '', '分销配置', 'admin', 'setting.systemConfig', 'index', '{\"type\":\"3\",\"tab_id\":\"9\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (294, 288, '', '财务数据', 'admin', '', '', '[]', 80, 1, 1);
INSERT INTO `eb_system_menus` VALUES (295, 288, '', '会员数据', 'admin', '', '', '[]', 70, 1, 1);
INSERT INTO `eb_system_menus` VALUES (296, 288, '', '营销数据', 'admin', '', '', '[]', 90, 1, 1);
INSERT INTO `eb_system_menus` VALUES (297, 288, '', '排行榜', 'admin', '', '', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (300, 294, '', '提现统计', 'admin', 'record.record', 'chart_cash', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (301, 294, '', '充值统计', 'admin', 'record.record', 'chart_recharge', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (302, 294, '', '返佣统计', 'admin', 'record.record', 'chart_rebate', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (303, 295, '', '会员增长', 'admin', 'record.record', 'user_chart', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (304, 295, '', '会员业务', 'admin', 'record.record', 'user_business_chart', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (305, 295, '', '会员属性', 'admin', 'record.record', 'user_attr', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (306, 287, '', '财务操作', 'admin', '', '', '[]', 100, 1, 1);
INSERT INTO `eb_system_menus` VALUES (307, 287, '', '财务记录', 'admin', '', '', '[]', 50, 1, 1);
INSERT INTO `eb_system_menus` VALUES (308, 287, '', '佣金记录', 'admin', '', '', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (372, 269, '', '首页幻灯片', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"48\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (312, 307, '', '资金监控', 'admin', 'finance.finance', 'bill', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (313, 308, '', '佣金记录', 'admin', 'finance.finance', 'commission_list', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (314, 296, '', '积分统计', 'admin', 'record.record', 'chart_score', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (315, 296, '', '优惠券统计', 'admin', 'record.record', 'chart_coupon', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (316, 296, '', '拼团统计', 'admin', 'record.record', 'chart_combination', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (317, 296, '', '秒杀统计', 'admin', 'record.record', 'chart_seckill', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (318, 296, '', '砍价统计', 'admin', 'record.record', 'chart_bargain', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (319, 297, '', '产品销售排行', 'admin', 'record.record', 'ranking_saleslists', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (320, 297, '', '返佣排行', 'admin', 'record.record', 'ranking_commission', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (321, 297, '', '积分排行', 'admin', 'record.record', 'ranking_point', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (377, 21, '', '数据备份', 'admin', 'system.systemDatabackup', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (329, 285, '', '营销订单', 'admin', 'user', 'user', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (371, 337, '', '分销员管理', 'admin', 'agent.agentManage', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (354, 11, '', '自动回复', '', '', '', '[]', 80, 1, 1);
INSERT INTO `eb_system_menus` VALUES (333, 272, '', '拼团列表', 'admin', 'ump.storeCombination', 'combina_list', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (334, 329, '', '秒杀订单', 'admin', 'user', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (335, 329, '', '积分兑换', 'admin', 'user', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (337, 0, 'users', '分销', 'admin', 'agent', 'index', '[]', 106, 1, 1);
INSERT INTO `eb_system_menus` VALUES (349, 286, '', '积分', 'admin', 'userPoint', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (340, 293, '', '订单统计', 'admin', 'record.record', 'chart_order', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (341, 293, '', '产品统计', 'admin', 'record.record', 'chart_product', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (350, 349, '', '积分配置', 'admin', 'setting.systemConfig', 'index', '{\"type\":\"3\",\"tab_id\":\"11\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (355, 11, '', '页面设置', '', '', '', '[]', 90, 1, 1);
INSERT INTO `eb_system_menus` VALUES (356, 355, '', '个人中心菜单', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"32\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (357, 355, '', '商城首页banner', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"34\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (358, 355, '', '商城首页分类按钮', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"35\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (359, 355, '', '商城首页滚动新闻', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"36\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (360, 11, '', '公众号配置', '', '', '', '[]', 100, 1, 1);
INSERT INTO `eb_system_menus` VALUES (361, 360, '', '公众号支付配置', 'admin', 'setting.systemConfig', 'index', '{\"type\":\"1\",\"tab_id\":\"4\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (365, 362, '', '附件管理', 'admin', 'widget.images', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (366, 254, '', '其它权限管理', '', '', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (367, 366, '', '编辑砍价', 'admin', 'ump.storeBargain', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (368, 366, '', '砍价产品更新', 'admin', 'ump.storeBargain', 'update', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (369, 143, '', '添加产品分类', 'admin', 'store.storeCategory', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (370, 143, '', '编辑产品分类', 'admin', 'store.storeCategory', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (373, 269, '', '首页导航按钮', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"47\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (374, 295, '', '分销会员业务', 'admin', 'record.record', 'user_distribution_chart', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (375, 269, '', '小程序支付配置', 'admin', 'setting.systemConfig', 'index_alone', '{\"type\":\"2\",\"tab_id\":\"14\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (376, 269, '', '小程序模板消息', 'admin', 'routine.routineTemplate', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (378, 289, '', '物流公司', 'admin', 'system.express', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (379, 21, '', '文件管理', 'admin', 'system.systemFile', 'opendir', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (380, 379, '', '权限规则', 'admin', 'system.systemFile', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (381, 380, '', '打开文件', 'admin', 'system.systemFile', 'openfile', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (382, 380, '', '编辑文件', 'admin', 'system.systemFile', 'savefile', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (386, 362, '', '移动图片分类展示', 'admin', 'widget.images', 'moveimg', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (387, 362, '', '编辑分类', 'admin', 'widget.images', 'updatecate', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (388, 362, '', '添加分类', 'admin', 'widget.images', 'savecate', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (389, 362, '', '移动图片分类', 'admin', 'widget.images', 'moveimgcecate', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (390, 362, '', '编辑分类展示', 'admin', 'widget.images', 'editcate', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (393, 362, '', '添加分类展示', 'admin', 'widget.images', 'addcate', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (392, 362, '', '删除分类', 'admin', 'widget.images', 'deletecate', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (394, 191, '', '订单获取列表', 'admin', 'store.storeOrder', 'order_list', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (395, 82, '', '微信用户附加权限', 'admin', 'wechat.wechatUser', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (396, 395, '', '推送消息', 'admin', 'wechat.wechat_news_category', 'push', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (397, 395, '', '推送优惠券', 'admin', 'ump.storeCouponUser', 'grant', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (398, 177, '', '会员列表页', 'admin', 'user.user', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (399, 177, '', '会员附加权限', '', 'user.user', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (400, 399, '', '修改用户状态', '', 'user.user', 'set_status', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (401, 399, '', '编辑用户', 'admin', 'user.user', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (402, 399, '', '更新用户', 'admin', 'user.user', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (403, 399, '', '查看用户', 'admin', 'user.user', 'see', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (405, 399, '', '发优惠券', 'admin', 'ump.storeCouponUser', 'grant', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (406, 399, '', '推送图文', 'admin', 'wechat.wechatNewsCategory', 'push', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (407, 399, '', '发站内信', 'admin', 'user.userNotice', 'notice', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (408, 176, '', '站内通知附加权限', 'admin', 'user.user_notice', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (409, 408, '', '添加站内消息', 'admin', 'user.user_notice', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (410, 408, '', '编辑站内消息', 'admin', 'user.user_notice', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (411, 408, '', '发送站内消息', 'admin', 'user.user_notice', 'send', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (412, 408, '', '删除站内消息', 'admin', 'user.user_notice', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (413, 408, '', '指定用户发送', 'admin', 'user.user_notice', 'send_user', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (415, 371, '', '分销管理附加权限', 'admin', 'agent.agentManage', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (416, 174, '', '微信模版消息附加权限', 'admin', 'wechat.wechatTemplate', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (417, 416, '', '添加模版消息', 'admin', 'wechat.wechatTemplate', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (418, 416, '', '添加模版消息展示', 'admin', 'wechat.wechatTemplate', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (419, 416, '', '编辑模版消息展示', 'admin', 'wechat.wechatTemplate', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (420, 416, '', '更新模版消息展示', 'admin', 'wechat.wechatTemplate', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (421, 416, '', '删除模版消息展示', 'admin', 'wechat.wechatTemplate', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (422, 376, '', '小程序模版消息附加权限', 'admin', 'routine.routineTemplate', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (423, 422, '', '添加模版消息展示', 'admin', 'routine.routineTemplate', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (424, 422, '', '添加模版消息', 'admin', 'routine.routineTemplate', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (425, 422, '', '编辑模版消息展示', 'admin', 'routine.routineTemplate', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (426, 422, '', '编辑模版消息', 'admin', 'routine.routineTemplate', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (427, 422, '', '删除模版消息', 'admin', 'routine.routineTemplate', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (439, 377, '', '数据库备份附加权限', 'admin', 'system.systemDatabackup', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (440, 439, '', '查看表结构', 'admin', 'system.systemDatabackup', 'seetable', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (441, 439, '', '优化表', 'admin', 'system.systemDatabackup', 'optimize', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (442, 439, '', '修复表', 'admin', 'system.systemDatabackup', 'repair', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (443, 439, '', '备份表', 'admin', 'system.systemDatabackup', 'backup', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (444, 439, '', '删除备份', 'admin', 'system.systemDatabackup', 'delFile', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (445, 439, '', '恢复备份', 'admin', 'system.systemDatabackup', 'import', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (446, 439, '', '下载备份', 'admin', 'system.systemDatabackup', 'downloadFile', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (447, 377, '', '数据备份展示页', 'admin', 'system.systemDatabackup', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (448, 379, '', '文件管理展示页', 'admin', 'system.systemFile', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (449, 176, '', '站内通知', 'admin', 'user.user_notice', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (450, 371, '', '分销管理列表页', 'admin', 'agent.agentManage', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (451, 376, '', '小程序模版消息列表页', 'admin', 'routine.routineTemplate', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (452, 174, '', '微信模版消息列表页', 'admin', 'wechat.wechatTemplate', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (453, 276, '', '附件管理展示页', 'admin', 'widget.images', 'index', '[]', 0, 0, 1);

-- ----------------------------
-- Table structure for eb_system_notice
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_notice`;
CREATE TABLE `eb_system_notice`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '通知模板id',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知标题',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知类型',
  `icon` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图标',
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接',
  `table_title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知数据',
  `template` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知模板',
  `push_admin` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知管理员id',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type`(`type`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知模板表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_notice
-- ----------------------------
INSERT INTO `eb_system_notice` VALUES (5, '用户关注通知', 'user_sub', 'user-plus', '', '[{\"title\":\"openid\",\"key\":\"openid\"},{\"title\":\"\\u5fae\\u4fe1\\u6635\\u79f0\",\"key\":\"nickname\"},{\"title\":\"\\u5173\\u6ce8\\u4e8b\\u4ef6\",\"key\":\"add_time\"}]', '有%u个新用户关注了公众号', '1', 1);
INSERT INTO `eb_system_notice` VALUES (7, '新订单提醒', '订单提醒', 'building-o', '', '[{\"title\":\"\\u8ba2\\u5355\\u53f7\",\"key\":\"key1\"}]', '新订单提醒', '1', 1);
INSERT INTO `eb_system_notice` VALUES (9, '测试通知中 ', '测试', 'buysellads', '', '[{\"title\":\"\\u8ba2\\u5355\\u53f7\",\"key\":\"key1\"}]', '测试', '20', 1);

-- ----------------------------
-- Table structure for eb_system_notice_admin
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_notice_admin`;
CREATE TABLE `eb_system_notice_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '通知记录ID',
  `notice_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知类型',
  `admin_id` smallint(5) UNSIGNED NOT NULL COMMENT '通知的管理员',
  `link_id` int(10) UNSIGNED NOT NULL COMMENT '关联ID',
  `table_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知的数据',
  `is_click` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击次数',
  `is_visit` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '访问次数',
  `visit_time` int(11) NOT NULL COMMENT '访问时间',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '通知时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_id`(`admin_id`, `notice_type`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `is_visit`(`is_visit`) USING BTREE,
  INDEX `is_click`(`is_click`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_system_role
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_role`;
CREATE TABLE `eb_system_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '身份管理id',
  `role_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份管理名称',
  `rules` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份管理权限(menus_id)',
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `business` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '商户标识 ，默认为0代表后台管理，非0代表商家标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '身份管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_role
-- ----------------------------
INSERT INTO `eb_system_role` VALUES (1, '超级管理员', '23,24,147,266,265,264,263,262,261,146,25,142,143,369,370,285,26,191,394,208,207,206,205,204,203,202,201,200,199,198,197,196,195,194,193,192,190,329,334,335,290,170,225,228,227,226,224,151,177,399,402,403,405,406,407,401,400,398,176,408,413,412,411,409,410,449,337,353,371,415,450,286,148,149,230,234,233,232,231,229,235,150,352,271,254,366,367,368,272,238,333,273,241,349,351,350,287,306,239,307,179,216,217,218,219,312,308,313,288,293,340,341,296,318,317,316,315,314,294,302,244,301,300,295,303,304,305,246,374,297,321,320,319,269,372,270,373,375,376,422,423,424,425,426,427,451,11,360,267,17,127,128,126,174,416,417,418,419,420,421,452,361,355,359,358,356,357,354,12,97,98,99,30,93,89,92,91,90,124,123,31,95,96,94,37,175,210,215,214,213,212,211,223,222,209,19,73,42,116,115,45,44,43,82,133,134,395,396,397,84,236,129,132,289,378,153,8,67,63,105,104,66,65,64,4,68,59,103,102,62,61,60,2,78,74,77,76,75,101,100,247,250,248,249,1,6,118,117,119,145,144,7,46,108,107,106,50,49,48,47,51,69,9,70,52,112,111,110,109,58,57,56,55,54,53,255,80,283,72,38,41,40,39,284,71,33,114,113,36,35,34,21,173,252,237,278,130,131,377,447,439,445,446,444,443,440,441,442,276,362,364,363,365,390,393,392,389,388,386,387,453,379,448,380,381,382,0', 0, 1, '0');
INSERT INTO `eb_system_role` VALUES (24, '商家', '23,24,147,263,262,261,264,266,265,146,25,143,370,369,142,285,26,190,191,207,208,206,192,205,204,203,202,201,200,199,198,197,196,195,194,193,394,329,335,334,290,170,225,226,228,227,224,151,177,399,407,406,405,403,402,401,400,398,176,449,408,413,412,411,410,409,337,353,371,415,450,286,148,149,229,230,231,233,232,234,235,150,352,349,351,350,273,241,272,238,333,271,254,366,368,367,287,306,239,307,179,217,218,219,216,312,308,313,288,293,341,340,296,318,317,316,315,314,294,244,302,301,300,295,246,374,305,304,303,297,321,320,319,269,375,373,270,372,376,422,426,425,424,423,427,451,11,360,267,17,127,128,126,174,416,421,420,419,418,417,452,361,355,356,357,359,358,354,12,98,99,97,30,93,89,92,91,90,124,123,31,95,96,94,37,175,210,211,223,212,213,214,215,222,209,19,73,42,45,44,43,116,115,82,133,134,236,84,129,132,395,396,397,80,284,71,33,36,35,34,114,113,283,72,38,41,40,39,289,378,153,8,67,63,66,65,64,105,104,4,68,59,62,61,60,102,103,2,74,101,77,76,75,100,78,247,250,248,249,1,9,70,52,58,57,56,55,54,53,112,111,110,109,7,69,46,47,48,51,50,49,108,107,106,6,117,145,144,119,118,255,0', 1, 1, '0');
INSERT INTO `eb_system_role` VALUES (25, '员工', '23,24,147,263,265,266,264,261,262,146,25,142,143,370,369,151,177,399,407,406,405,403,402,401,400,398,176,408,413,412,411,410,409,449,0', 2, 1, '0');
INSERT INTO `eb_system_role` VALUES (26, '员工', '23,24,147,263,265,266,264,261,262,146,25,142,143,370,369,285,26,191,394,208,207,206,205,204,203,202,201,200,199,198,197,196,195,194,193,192,190,290,170,225,228,227,226,224,329,335,334,151,177,399,407,406,405,403,402,401,400,398,176,408,413,412,411,410,409,449,0', 2, 1, '123456');

-- ----------------------------
-- Table structure for eb_user
-- ----------------------------
DROP TABLE IF EXISTS `eb_user`;
CREATE TABLE `eb_user`  (
  `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `nickname` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `avatar` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户头像',
  `phone` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `add_time` int(11) UNSIGNED NOT NULL COMMENT '添加时间',
  `add_ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加ip',
  `last_time` int(11) UNSIGNED NOT NULL COMMENT '最后一次登录时间',
  `last_ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '最后一次登录ip',
  `now_money` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '用户余额',
  `integral` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户剩余积分',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1为正常，0为禁止',
  `level` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '等级',
  `spread_uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推广元id',
  `user_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户类型',
  `is_promoter` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为推广员',
  `pay_count` int(11) UNSIGNED DEFAULT 0 COMMENT '用户购买次数',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `account`(`account`) USING BTREE,
  INDEX `spreaduid`(`spread_uid`) USING BTREE,
  INDEX `level`(`level`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_promoter`(`is_promoter`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_address
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_address`;
CREATE TABLE `eb_user_address`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户地址id',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `real_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人所在省',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人所在市',
  `district` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人所在区',
  `detail` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人详细地址',
  `post_code` int(10) UNSIGNED NOT NULL COMMENT '邮编',
  `longitude` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '经度',
  `latitude` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '纬度',
  `is_default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否默认',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `is_default`(`is_default`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_bill
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_bill`;
CREATE TABLE `eb_user_bill`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户账单id',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户uid',
  `link_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '关联id',
  `pm` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 = 支出 1 = 获得',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账单标题',
  `category` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '明细种类',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '明细类型',
  `number` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '明细数字',
  `balance` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '剩余',
  `mark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = 带确定 1 = 有效 -1 = 无效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `openid`(`uid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `pm`(`pm`) USING BTREE,
  INDEX `type`(`category`, `type`, `link_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户账单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_enter
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_enter`;
CREATE TABLE `eb_user_enter`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商户申请ID',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户所在省',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户所在市',
  `district` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户所在区',
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户详细地址',
  `merchant_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户名称',
  `link_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `link_tel` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户电话',
  `charter` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户证书',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '添加时间',
  `apply_time` int(10) UNSIGNED NOT NULL COMMENT '审核时间',
  `success_time` int(11) NOT NULL COMMENT '通过时间',
  `fail_message` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '未通过原因',
  `fail_time` int(10) UNSIGNED NOT NULL COMMENT '未通过时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '-1 审核未通过 0未审核 1审核通过',
  `is_lock` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 = 开启 1= 关闭',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE,
  INDEX `province`(`province`, `city`, `district`) USING BTREE,
  INDEX `is_lock`(`is_lock`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商户申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_extract
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_extract`;
CREATE TABLE `eb_user_extract`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED DEFAULT NULL,
  `real_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `extract_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'bank' COMMENT 'bank = 银行卡 alipay = 支付宝wx=微信',
  `bank_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '银行卡',
  `bank_address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '开户地址',
  `alipay_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '支付宝账号',
  `extract_price` decimal(8, 2) UNSIGNED DEFAULT 0.00 COMMENT '提现金额',
  `mark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `balance` decimal(8, 2) UNSIGNED DEFAULT 0.00,
  `fail_msg` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '无效原因',
  `fail_time` int(10) UNSIGNED DEFAULT NULL,
  `add_time` int(10) UNSIGNED DEFAULT NULL COMMENT '添加时间',
  `status` tinyint(2) DEFAULT 0 COMMENT '-1 未通过 0 审核中 1 已提现',
  `wechat` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `extract_type`(`extract_type`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `openid`(`uid`) USING BTREE,
  INDEX `fail_time`(`fail_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户提现表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_group
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_group`;
CREATE TABLE `eb_user_group`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户分组名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_user_group
-- ----------------------------
INSERT INTO `eb_user_group` VALUES (1, '未分组');
INSERT INTO `eb_user_group` VALUES (2, '活跃用户');
INSERT INTO `eb_user_group` VALUES (3, '测试');

-- ----------------------------
-- Table structure for eb_user_notice
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_notice`;
CREATE TABLE `eb_user_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接收消息的用户id（类型：json数据）',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '消息通知类型（1：系统消息；2：用户通知）',
  `user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发送人',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知消息的标题信息',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知消息的内容',
  `add_time` int(11) NOT NULL COMMENT '通知消息发送的时间',
  `is_send` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否发送（0：未发送；1：已发送）',
  `send_time` int(11) NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_notice_see
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_notice_see`;
CREATE TABLE `eb_user_notice_see`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nid` int(11) NOT NULL COMMENT '查看的通知id',
  `uid` int(11) NOT NULL COMMENT '查看通知的用户id',
  `add_time` int(11) NOT NULL COMMENT '查看通知的时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户通知发送记录表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for eb_user_recharge
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_recharge`;
CREATE TABLE `eb_user_recharge`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL COMMENT '充值用户UID',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单号',
  `price` decimal(8, 2) DEFAULT NULL COMMENT '充值金额',
  `recharge_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '充值类型',
  `paid` tinyint(1) DEFAULT NULL COMMENT '是否充值',
  `pay_time` int(10) DEFAULT NULL COMMENT '充值支付时间',
  `add_time` int(12) DEFAULT NULL COMMENT '充值时间',
  `refund_price` decimal(10, 2) DEFAULT 0.00 COMMENT '退款金额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `recharge_type`(`recharge_type`) USING BTREE,
  INDEX `paid`(`paid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户充值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_wechat_media
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_media`;
CREATE TABLE `eb_wechat_media`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信视频音频id',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复类型',
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件路径',
  `media_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信服务器返回的id',
  `url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `temporary` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否永久或者临时 0永久1临时',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type`(`type`, `media_id`) USING BTREE,
  INDEX `type_2`(`type`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信回复表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_wechat_message
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_message`;
CREATE TABLE `eb_wechat_message`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户行为记录id',
  `openid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户openid',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型',
  `result` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作详细记录',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `openid`(`openid`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户行为记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_wechat_news_category
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_news_category`;
CREATE TABLE `eb_wechat_news_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '图文消息管理ID',
  `cate_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图文名称',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `new_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章id',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图文消息管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_wechat_news_category
-- ----------------------------
INSERT INTO `eb_wechat_news_category` VALUES (21, '11', 0, 1, '51,52,58,59,60,150', '1542379262');
INSERT INTO `eb_wechat_news_category` VALUES (29, '测试', 0, 1, '1', '1547206341');

-- ----------------------------
-- Table structure for eb_wechat_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_qrcode`;
CREATE TABLE `eb_wechat_qrcode`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信二维码ID',
  `third_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二维码类型',
  `third_id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `ticket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二维码参数',
  `expire_seconds` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二维码有效时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信访问url',
  `qrcode_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信二维码url',
  `scan` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '被扫的次数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `third_type`(`third_type`, `third_id`) USING BTREE,
  INDEX `ticket`(`ticket`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信二维码管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_wechat_reply
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_reply`;
CREATE TABLE `eb_wechat_reply`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信关键字回复id',
  `key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复类型',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复数据',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '0=不可用  1 =可用',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key`(`key`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `hide`(`hide`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信关键字回复表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_wechat_template
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_template`;
CREATE TABLE `eb_wechat_template`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `tempkey` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板编号',
  `name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复内容',
  `tempid` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '模板ID',
  `add_time` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tempkey`(`tempkey`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_wechat_template
-- ----------------------------
INSERT INTO `eb_wechat_template` VALUES (3, 'OPENTM200565259', '订单发货提醒', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n物流公司：{{keyword2.DATA}}\n物流单号：{{keyword3.DATA}}\n{{remark.DATA}}', 'RRsyuuWpCo81xCtfG-5qYnXXoeSQHY4mTVav0zzaZsM', '1515052638', 1);
INSERT INTO `eb_wechat_template` VALUES (4, 'OPENTM413386489', '订单收货通知', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n订单状态：{{keyword2.DATA}}\n收货时间：{{keyword3.DATA}}\n商品详情：{{keyword4.DATA}}\n{{remark.DATA}}', 'caAhoWioDb2A8Ew1bTr4GTe6mdsDoM4kjp9XV5BC8hg', '1515052765', 1);
INSERT INTO `eb_wechat_template` VALUES (5, 'OPENTM410119152', '退款进度通知', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n订单金额：{{keyword2.DATA}}\n下单时间：{{keyword3.DATA}}\n{{remark.DATA}}', '-WH6gUzezKnX9OTam9VrQEVyNWfr1bUhT6FRuBMotZw', '1515053049', 1);
INSERT INTO `eb_wechat_template` VALUES (6, 'OPENTM405847076', '帐户资金变动提醒', '{{first.DATA}}\n变动类型：{{keyword1.DATA}}\n变动时间：{{keyword2.DATA}}\n变动金额：{{keyword3.DATA}}\n{{remark.DATA}}', 'dTNjE5QY6FzXyH0jbXEkNeNTgFQeMxdvqZRvDBqgatE', '1515053127', 1);
INSERT INTO `eb_wechat_template` VALUES (7, 'OPENTM207707249', '订单发货提醒', '\n{{first.DATA}}\n商品明细：{{keyword1.DATA}}\n下单时间：{{keyword2.DATA}}\n配送地址：{{keyword3.DATA}}\n配送人：{{keyword4.DATA}}\n联系电话：{{keyword5.DATA}}\n{{remark.DATA}}', 'hC9PFuxOKq6u5kNZyl6VdHGgAuA6h5I3ztpuDk1ioAk', '1515053313', 1);
INSERT INTO `eb_wechat_template` VALUES (8, 'OPENTM408237350', '服务进度提醒', '{{first.DATA}}\n服务类型：{{keyword1.DATA}}\n服务状态：{{keyword2.DATA}}\n服务时间：{{keyword3.DATA}}\n{{remark.DATA}}', '6Q7lusUXhX7HKcevHlEvMDC2qMuF2Yxtq52VTFNoNwg', '1515483915', 1);
INSERT INTO `eb_wechat_template` VALUES (9, 'OPENTM204431262', '客服通知提醒', '{{first.DATA}}\n客户名称：{{keyword1.DATA}}\n客服类型：{{keyword2.DATA}}\n提醒内容：{{keyword3.DATA}}\n通知时间：{{keyword4.DATA}}\n{{remark.DATA}}', '6xvvsrYPGyTbYPPecVI1WihNpvWSAUsW1vBWGwL8Je0', '1515484354', 1);
INSERT INTO `eb_wechat_template` VALUES (10, 'OPENTM407456411', '拼团成功通知', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n团购商品：{{keyword2.DATA}}\n{{remark.DATA}}', '8EI_FJ-h1UbIBYSXEm5BnV345fQs9s1eiELwlMUnbhk', '1520063823', 1);
INSERT INTO `eb_wechat_template` VALUES (11, 'OPENTM401113750', '拼团失败通知', '{{first.DATA}}\n拼团商品：{{keyword1.DATA}}\n商品金额：{{keyword2.DATA}}\n退款金额：{{keyword3.DATA}}\n{{remark.DATA}}', 'BdO4l8H2p7OK8_f7Cx8DOqpE3D-mjDvjNdMeS05u2lI', '1520064059', 1);
INSERT INTO `eb_wechat_template` VALUES (12, 'OPENTM205213550', '订单生成通知', '{{first.DATA}}\n时间：{{keyword1.DATA}}\n商品名称：{{keyword2.DATA}}\n订单号：{{keyword3.DATA}}\n{{remark.DATA}}', 'EY3j42ql2S6TBz5yK14iVjZqh4OSDOParZ9F_6e-56Q', '1528966701', 1);
INSERT INTO `eb_wechat_template` VALUES (13, 'OPENTM207791277', '订单支付成功通知', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n支付金额：{{keyword2.DATA}}\n{{remark.DATA}}', 'UL7rLuzUIlYHNx5X_whUaAHWZWMmhZL35pUnJHgz8eI', '1528966759', 1);
INSERT INTO `eb_wechat_template` VALUES (16, '1111111111111111111111111111', '11', '11', '211', '1542189446', 1);

-- ----------------------------
-- Table structure for eb_wechat_user
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_user`;
CREATE TABLE `eb_wechat_user`  (
  `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信用户id',
  `unionid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段',
  `openid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户的标识，对当前公众号唯一',
  `routine_openid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '小程序唯一身份ID',
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户的昵称',
  `headimgurl` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户头像',
  `sex` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户所在城市',
  `language` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户所在省份',
  `country` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户所在国家',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注',
  `groupid` smallint(5) UNSIGNED DEFAULT 0 COMMENT '用户所在的分组ID（兼容旧的用户分组接口）',
  `tagid_list` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户被打上的标签ID列表',
  `subscribe` tinyint(3) UNSIGNED DEFAULT 1 COMMENT '用户是否订阅该公众号标识',
  `subscribe_time` int(10) UNSIGNED DEFAULT NULL COMMENT '关注公众号时间',
  `add_time` int(10) UNSIGNED DEFAULT NULL COMMENT '添加时间',
  `stair` int(11) UNSIGNED DEFAULT NULL COMMENT '一级推荐人',
  `second` int(11) UNSIGNED DEFAULT NULL COMMENT '二级推荐人',
  `order_stair` int(11) DEFAULT NULL COMMENT '一级推荐人订单',
  `order_second` int(11) UNSIGNED DEFAULT NULL COMMENT '二级推荐人订单',
  `now_money` decimal(8, 2) UNSIGNED DEFAULT NULL COMMENT '佣金',
  `session_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '小程序用户会话密匙',
  `user_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'wechat' COMMENT '用户类型',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `openid`(`openid`) USING BTREE,
  INDEX `groupid`(`groupid`) USING BTREE,
  INDEX `subscribe_time`(`subscribe_time`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `subscribe`(`subscribe`) USING BTREE,
  INDEX `unionid`(`unionid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信用户表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
