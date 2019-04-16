/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : shipin

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 08/04/2019 10:38:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for android_version
-- ----------------------------
DROP TABLE IF EXISTS `android_version`;
CREATE TABLE `android_version`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'android强更表',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本名称',
  `version_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本号',
  `version_code` int(11) NOT NULL DEFAULT 0 COMMENT '版本编号',
  `channel` int(11) NOT NULL DEFAULT 0 COMMENT '渠道号',
  `force_update` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否强制更新；0：否；1：是',
  `force_versions` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '强制更新的版本，多选',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '包的地址',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `size` double UNSIGNED NULL DEFAULT NULL COMMENT '包的大小',
  `type` tinyint(4) NULL DEFAULT 1 COMMENT '类型',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'banner表',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` tinyint(2) NULL DEFAULT 1 COMMENT '1:视频播放页前',
  `cover_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '0:下架；1：上架',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for base_smscode
-- ----------------------------
DROP TABLE IF EXISTS `base_smscode`;
CREATE TABLE `base_smscode`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '手机验证码表',
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sms_code` int(10) NULL DEFAULT 0 COMMENT '验证码',
  `expire` datetime(0) NOT NULL COMMENT '过期时间',
  `smUuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for caches
-- ----------------------------
DROP TABLE IF EXISTS `caches`;
CREATE TABLE `caches`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '缓存表',
  `user_id` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `movie_id` int(11) NULL DEFAULT 0 COMMENT '影视id',
  `movie_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影视名称',
  `cover_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图',
  `video_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for channel
-- ----------------------------
DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道类型名称',
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '1：短信渠道',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for collections
-- ----------------------------
DROP TABLE IF EXISTS `collections`;
CREATE TABLE `collections`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏表',
  `user_id` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `movie_id` int(11) NULL DEFAULT 0 COMMENT '影视id',
  `movie_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影视名称',
  `cid` int(11) NULL DEFAULT 0 COMMENT '分类id',
  `cover_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图',
  `video_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下载地址',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '0：取消1：收藏',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '收藏日期',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coupon_categories
-- ----------------------------
DROP TABLE IF EXISTS `coupon_categories`;
CREATE TABLE `coupon_categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '卡券分类',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图片',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券表',
  `num` int(11) NULL DEFAULT 0 COMMENT '卡券数量',
  `need_score` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '需要积分',
  `period_type` tinyint(2) NULL DEFAULT 0 COMMENT '有效期类型:5:其他；1:当天；2:一周；3:一个月；4:不限',
  `name` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡券名称',
  `coupon_category_id` int(11) NULL DEFAULT 0 COMMENT '卡券i类型d',
  `days` int(11) NULL DEFAULT 0 COMMENT '多少天',
  `expire_date` date NULL DEFAULT NULL COMMENT '券过期时间',
  `status` tinyint(2) NULL DEFAULT 0 COMMENT '0:下架1:上架',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '插入时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for down_load_links
-- ----------------------------
DROP TABLE IF EXISTS `down_load_links`;
CREATE TABLE `down_load_links`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道名称',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文案描述',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for invitation_times
-- ----------------------------
DROP TABLE IF EXISTS `invitation_times`;
CREATE TABLE `invitation_times`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分邀请好友享次数统计表',
  `user_id` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `num` int(11) NULL DEFAULT 0 COMMENT '当天分享次数累计',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for invitations
-- ----------------------------
DROP TABLE IF EXISTS `invitations`;
CREATE TABLE `invitations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '邀请表',
  `owner_id` int(11) NULL DEFAULT 0 COMMENT '邀请人id',
  `user_id` int(11) NULL DEFAULT 0 COMMENT '被邀请人id',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jpush_config
-- ----------------------------
DROP TABLE IF EXISTS `jpush_config`;
CREATE TABLE `jpush_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '极光推送配置',
  `platform` tinyint(1) NULL DEFAULT 0 COMMENT '平台：1：安卓2：ios',
  `jpush_env` tinyint(1) NULL DEFAULT 0 COMMENT '1:测试：2：正式；3：不限',
  `appKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '极光key',
  `appSecret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '极光秘钥',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_record
-- ----------------------------
DROP TABLE IF EXISTS `log_record`;
CREATE TABLE `log_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户登录记录',
  `user_id` int(11) NULL DEFAULT NULL,
  `login_date` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '极光推送消息表',
  `user_id` int(11) NULL DEFAULT 0,
  `msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_read` tinyint(1) NULL DEFAULT 0 COMMENT '0：未读；1：已读',
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '1：签到；2：注册获取观影券',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role`  (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `permission_role_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `permission_role_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `permission_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` int(4) NOT NULL DEFAULT 1 COMMENT '?????????????',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reg_record
-- ----------------------------
DROP TABLE IF EXISTS `reg_record`;
CREATE TABLE `reg_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户注册记录',
  `user_id` int(11) NULL DEFAULT NULL,
  `register_date` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` bigint(6) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for retention_rate
-- ----------------------------
DROP TABLE IF EXISTS `retention_rate`;
CREATE TABLE `retention_rate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留存率配置表',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '1：显示0：隐藏',
  `day` int(11) NULL DEFAULT 0,
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '1：留存率2：留存数',
  `prefix` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'diff/rate前缀',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user`  (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `user_id`) USING BTREE,
  INDEX `role_user_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `role_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for score_histories
-- ----------------------------
DROP TABLE IF EXISTS `score_histories`;
CREATE TABLE `score_histories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分兑换历史记录\n',
  `user_id` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `description` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `score` int(11) NULL DEFAULT 0 COMMENT '积分变动值',
  `symbol` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '符号（+/-）',
  `type` tinyint(2) NULL DEFAULT 0 COMMENT '类型：1：签到；2：兑换下载券；3:兑换观影券；',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '插入时间',
  `updaetd_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for search_histories
-- ----------------------------
DROP TABLE IF EXISTS `search_histories`;
CREATE TABLE `search_histories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '搜索记录表',
  `user_id` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `movie_id` int(11) NULL DEFAULT 0 COMMENT '资源id',
  `movie_name` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `cid` int(11) NULL DEFAULT 0 COMMENT '分类id',
  `search_keyword` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '搜索关键字',
  `search_times` int(11) NULL DEFAULT 0 COMMENT '搜索次数',
  `search_play_times` int(11) NULL DEFAULT 0 COMMENT '搜索并播放次数',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for servers_allot
-- ----------------------------
DROP TABLE IF EXISTS `servers_allot`;
CREATE TABLE `servers_allot`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省份ID数组',
  `servers_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务器IP地址',
  `status` tinyint(2) NOT NULL COMMENT '1为正常，0为停用',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `region_id`(`region_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '服务器省份对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for servers_error
-- ----------------------------
DROP TABLE IF EXISTS `servers_error`;
CREATE TABLE `servers_error`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(4) NOT NULL COMMENT '错误代码',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报错的URL',
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `created_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '服务器错误表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for signs
-- ----------------------------
DROP TABLE IF EXISTS `signs`;
CREATE TABLE `signs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '签到表',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sms_config
-- ----------------------------
DROP TABLE IF EXISTS `sms_config`;
CREATE TABLE `sms_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '短信配置',
  `channel_id` int(11) NULL DEFAULT 0 COMMENT '频道id',
  `domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '域名',
  `type` tinyint(1) NULL DEFAULT 0 COMMENT '1：短信域名配置',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sms_log
-- ----------------------------
DROP TABLE IF EXISTS `sms_log`;
CREATE TABLE `sms_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '短信域名配置日志',
  `sms_config_id` int(11) NULL DEFAULT 0 COMMENT '短信域名id',
  `content` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '日期内容',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stat
-- ----------------------------
DROP TABLE IF EXISTS `stat`;
CREATE TABLE `stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'uv/pv表',
  `user_id` int(11) NULL DEFAULT NULL,
  `level_1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0' COMMENT '首页类型id',
  `level_2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0' COMMENT '二级页面id',
  `login_num` int(10) NULL DEFAULT 0 COMMENT '登录次数',
  `view_num` int(10) NULL DEFAULT 0 COMMENT '访问次数',
  `watch_num` int(10) NULL DEFAULT 0 COMMENT '观看影片次数',
  `type` tinyint(1) NULL DEFAULT 0 COMMENT '1:uv 2:pv',
  `movie_id` int(10) NULL DEFAULT NULL COMMENT '影视id',
  `channel_id` int(10) NULL DEFAULT 0 COMMENT '渠道id',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志',
  `user_id` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变动事件',
  `num` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT 0 COMMENT '0：系统；1：观影；2：下载；',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务表',
  `name` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `earn_score` int(11) NULL DEFAULT 0 COMMENT '获得积分',
  `daily_limit` int(11) NULL DEFAULT 0 COMMENT '每日上限',
  `instruction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '0：下架；1：上架',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '插入时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `invitation_code` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录令牌',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `property` tinyint(2) NULL DEFAULT 0 COMMENT '会员性质',
  `points` int(11) NULL DEFAULT 0 COMMENT '积分',
  `continuous_days` int(10) NULL DEFAULT 0 COMMENT '连续签到天数',
  `last_signin_time` int(10) NULL DEFAULT NULL COMMENT '最后一次签到时间',
  `watch_ticket_num` int(11) NULL DEFAULT 0 COMMENT '观影券数量',
  `download_num` int(11) NULL DEFAULT 0 COMMENT '下载券数量',
  `share_get_ticket_num` int(11) NULL DEFAULT 0 COMMENT '邀请成功获取的邀请成功获取的券(永久有效）',
  `watch_movie_time` int(11) NULL DEFAULT 0 COMMENT '观影次数',
  `avatar_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `is_continuous` tinyint(1) NULL DEFAULT 0 COMMENT '是否连续播放（0:否；1:是）',
  `is_mobile_network` tinyint(1) NULL DEFAULT 0 COMMENT '是否移动网络播放（0:否；1:是）',
  `is_default_resolution` tinyint(1) NULL DEFAULT 0 COMMENT '是否默认清晰度（0:否；1:是）',
  `share_num` int(11) NULL DEFAULT 0 COMMENT '分享次数',
  `invitation_num` int(11) NULL DEFAULT 0 COMMENT '邀请成功人数',
  `password` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `origin_password` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原始密码',
  `expire` datetime(0) NULL DEFAULT NULL COMMENT '验证码过期时间',
  `time_expire` datetime(0) NULL DEFAULT NULL COMMENT '验证码未过期时间',
  `sms_code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '验证码',
  `sex` tinyint(1) NULL DEFAULT 0 COMMENT '1:男；2:女',
  `age` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '年龄',
  `role` tinyint(2) NULL DEFAULT 1 COMMENT '1:普通用户；-9：管理员',
  `is_sign` tinyint(2) NULL DEFAULT 0 COMMENT '0:未签到；1:已签到',
  `is_login` tinyint(2) NULL DEFAULT 0 COMMENT '是否登录：0:未登录；1:已登录',
  `member_type` tinyint(2) NULL DEFAULT 1 COMMENT '会员性质：1:普通会员；2:超级会员',
  `is_invitation` tinyint(1) NULL DEFAULT 0 COMMENT '0：否；1：受邀',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_coupons
-- ----------------------------
DROP TABLE IF EXISTS `user_coupons`;
CREATE TABLE `user_coupons`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户优惠券表',
  `user_id` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `coupon_id` int(11) NULL DEFAULT 0 COMMENT '券id',
  `watch_history_id` int(11) NULL DEFAULT 0 COMMENT '观看影视历史id',
  `movie_id` int(11) NULL DEFAULT NULL COMMENT '资源id',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '是否被使用：0:否；1:是',
  `symbol` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '符号（+/-）',
  `num` int(11) NULL DEFAULT 0 COMMENT '券数量',
  `description` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `change_event` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变动事件',
  `type` tinyint(2) NULL DEFAULT NULL COMMENT '1:登陆领取；2:推荐好友赠送3:兑换观影券4:兑换下载券；5：变动记录',
  `coupon_type` tinyint(2) NULL DEFAULT 1 COMMENT '卡券类型',
  `expire_date` date NULL DEFAULT NULL COMMENT '券过期时间',
  `is_display` tinyint(1) NULL DEFAULT 0 COMMENT '登录有没有弹出过1:是；0:否',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_log
-- ----------------------------
DROP TABLE IF EXISTS `user_log`;
CREATE TABLE `user_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户操作记录表',
  `userid` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作描述',
  `ip` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45859 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `productids` varchar(4068) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '视频名称',
  `label_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '视频标签ID数组',
  `director_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '视频导演ID数组',
  `actor_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '视频主演ID数组',
  `type_id` int(11) NOT NULL DEFAULT 1 COMMENT '视频类型ID',
  `slide_id` int(11) NOT NULL DEFAULT 0 COMMENT '视频滑动类型ID',
  `total_num` int(11) NOT NULL DEFAULT 1 COMMENT '视频总集数',
  `part_num` int(11) NOT NULL DEFAULT 1 COMMENT '视频当前集数',
  `play_num` int(11) NOT NULL DEFAULT 0 COMMENT '视频播放次数',
  `cover_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '16:9视频封面url',
  `small_cover_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '3:4视频封面url',
  `grade` decimal(2, 1) NOT NULL DEFAULT 0.0 COMMENT '视频评分',
  `mins` int(4) NOT NULL DEFAULT 0 COMMENT '视频时长，以分钟计算',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '视频状态，1为正常，0为下架',
  `sort` int(11) NOT NULL DEFAULT 1 COMMENT '视频排序值，倒序排列',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for video_advert
-- ----------------------------
DROP TABLE IF EXISTS `video_advert`;
CREATE TABLE `video_advert`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` int(4) NOT NULL DEFAULT 1 COMMENT '1 banner',
  `video_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '广告所属频道ID',
  `adver_type` int(4) NOT NULL DEFAULT 1 COMMENT '1 图片  2 视频',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告源链接',
  `web_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '广告跳转连接',
  `video_id` int(11) NOT NULL DEFAULT 0 COMMENT '广告跳转视频的ID',
  `sort` int(4) NOT NULL DEFAULT 1 COMMENT '排序值',
  `platform` tinyint(2) NOT NULL DEFAULT 0 COMMENT '1为安卓  2为ios',
  `start` int(10) NOT NULL DEFAULT 0 COMMENT '开始时间',
  `end` int(10) NOT NULL DEFAULT 0 COMMENT '结束时间',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '1是启动  0是禁止',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'app广告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for video_intro
-- ----------------------------
DROP TABLE IF EXISTS `video_intro`;
CREATE TABLE `video_intro`  (
  `vid` int(11) NOT NULL COMMENT '视频ID',
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '视频介绍',
  PRIMARY KEY (`vid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '视频简介介绍' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for video_label
-- ----------------------------
DROP TABLE IF EXISTS `video_label`;
CREATE TABLE `video_label`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '分类的父级ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `cover_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图片',
  `type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '分类类别，1为category，2为area，3为year',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1为正常，0为不显示',
  `sort` int(11) NOT NULL DEFAULT 1 COMMENT '分类排序',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  FULLTEXT INDEX `name`(`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '视频分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for video_slide
-- ----------------------------
DROP TABLE IF EXISTS `video_slide`;
CREATE TABLE `video_slide`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型名称',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1为正常，0为不显示',
  `sort` int(11) NOT NULL DEFAULT 1 COMMENT '分类排序',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT INDEX `name`(`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '视频滑动类别' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for video_type
-- ----------------------------
DROP TABLE IF EXISTS `video_type`;
CREATE TABLE `video_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型名称',
  `cover_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型展示图片，有图片时在分类页面显示',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1为正常，0为不显示',
  `sort` int(11) NOT NULL DEFAULT 1 COMMENT '分类排序',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT INDEX `name`(`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '视频类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for video_url
-- ----------------------------
DROP TABLE IF EXISTS `video_url`;
CREATE TABLE `video_url`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(11) NOT NULL COMMENT '视频ID',
  `part_num` int(11) NOT NULL DEFAULT 1 COMMENT '视频集数',
  `resolution` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '720P' COMMENT '视频分辨率',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '视频URL',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `vid`(`vid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for watch_histories
-- ----------------------------
DROP TABLE IF EXISTS `watch_histories`;
CREATE TABLE `watch_histories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '观看历史记录',
  `user_id` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `movie_id` int(11) NULL DEFAULT 0 COMMENT '影片id',
  `movie_name` varchar(125) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影片名称',
  `movie_duration` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影片时长',
  `watch_movie_date` datetime(0) NULL DEFAULT NULL COMMENT '观影时间',
  `watch_movie_time` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '观看进度',
  `watch_movie_duration` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '观看时长',
  `watch_over_times` int(10) NULL DEFAULT 0 COMMENT '看完整场次数',
  `cover_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图',
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '1：观影时间；2：观影次数',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for worker
-- ----------------------------
DROP TABLE IF EXISTS `worker`;
CREATE TABLE `worker`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '演职人员名称',
  `avatar_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '演职人员头像',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT INDEX `name`(`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '视频导演列表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
