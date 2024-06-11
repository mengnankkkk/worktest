CREATE
DATABASE /*!32312 IF NOT EXISTS*/`my_bbs_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `my_bbs_db`;

/*Table structure for table `tb_bbs_post` */

DROP TABLE IF EXISTS `tb_bbs_post`;

CREATE TABLE `tb_bbs_post` (
                               `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '帖子主键id',
                               `publish_user_id` bigint NOT NULL COMMENT '发布者id',
                               `post_title` varchar(64) NOT NULL DEFAULT '' COMMENT '帖子标题',
                               `post_content` mediumtext NOT NULL COMMENT '帖子内容',
                               `post_category_id` int NOT NULL COMMENT '帖子分类id',
                               `post_category_name` varchar(50) NOT NULL COMMENT '帖子分类(冗余字段)',
                               `post_status` tinyint NOT NULL DEFAULT '1' COMMENT '0-未审核 1-审核通过 2-审核失败 (默认审核通过)',
                               `post_views` bigint NOT NULL DEFAULT '0' COMMENT '阅读量',
                               `post_comments` bigint NOT NULL DEFAULT '0' COMMENT '评论量',
                               `post_collects` bigint NOT NULL DEFAULT '0' COMMENT '收藏量',
                               `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
                               `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
                               PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_bbs_post` */
INSERT INTO `tb_bbs_post` (`publish_user_id`, `post_title`, `post_content`, `post_category_id`, `post_category_name`, `post_status`, `post_views`, `post_comments`, `post_collects`, `last_update_time`, `create_time`)
VALUES
    (3, '唐朝盛世', '唐朝的开创、文化繁荣和政治制度', 1, '中国历史', 1, 300, 80, 50, '2024-06-11 16:00:00', '2024-06-11 16:00:00'),
    (4, '宋朝的科技发展', '宋朝的科学技术、文学艺术和制度建设', 1, '中国历史', 1, 280, 60, 35, '2024-06-11 17:00:00', '2024-06-11 17:00:00');

DROP TABLE IF EXISTS `tb_bbs_user`;

CREATE TABLE `tb_bbs_user` (
                               `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户主键id',
                               `login_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登陆名称(默认为邮箱号码)',
                               `password_md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'MD5加密后的密码',
                               `nick_name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
                               `head_img_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '头像',
                               `gender` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '性别',
                               `location` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '居住地',
                               `introduce` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '个人简介',
                               `user_status` tinyint NOT NULL DEFAULT '0' COMMENT '用户状态 0=正常 1=禁言',
                               `role` tinyint NOT NULL DEFAULT '0' COMMENT '用户角色 0=普通用户 1=管理员',
                               `last_login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新登录时间',
                               `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
                               PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;



/*Data for the table `tb_bbs_user` */

INSERT INTO `tb_bbs_user` (`user_id`, `login_name`, `password_md5`, `nick_name`, `head_img_url`, `gender`, `location`, `introduce`, `user_status`, `last_login_time`, `create_time`)
VALUES
(4, 'coder15@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'coder15', '/images/avatar/default.png', '男', '上海', '努力奋斗，成就自我！', 0, '2024-06-11 16:33:20', '2024-06-11 14:49:38'),
(5, 'coder16@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'coder16', '/images/avatar/default.png', '女', '北京', '梦想驱动人生！', 0, '2024-06-11 16:21:57', '2024-06-11 15:57:48'),
(6, 'coder17@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'coder17', '/images/avatar/default.png', '未知', '深圳', '这个人很懒，什么都没留下~', 0, '2024-06-11 16:23:32', '2024-06-11 16:09:41');


/*Table structure for table `tb_post_category` */

DROP TABLE IF EXISTS `tb_post_category`;

CREATE TABLE `tb_post_category` (
                                    `category_id` int NOT NULL AUTO_INCREMENT COMMENT '分类表主键',
                                    `category_name` varchar(16) NOT NULL COMMENT '分类的名称',
                                    `category_rank` int NOT NULL DEFAULT '1' COMMENT '分类的排序值 被使用的越多数值越大',
                                    `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除 0=否 1=是',
                                    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_post_category` */

INSERT INTO `tb_post_category` (`category_id`, `category_name`, `category_rank`, `is_deleted`, `create_time`)
VALUES
    (1, '提问', 10, 0, '2024-06-11 14:47:38'),
    (2, '分享', 9, 0, '2024-06-11 14:47:38'),
    (3, '建议', 8, 0, '2024-06-11 14:47:38'),
    (4, '讨论', 7, 0, '2024-06-11 14:47:38'),
    (5, '动态', 6, 0, '2024-06-11 14:47:38'),
    (6, '其它', 5, 0, '2024-06-11 14:47:38');

/*Table structure for table `tb_post_collect_record` */

DROP TABLE IF EXISTS `tb_post_collect_record`;

CREATE TABLE `tb_post_collect_record` (
                                          `record_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                          `post_id` bigint NOT NULL DEFAULT '0' COMMENT '收藏帖子主键',
                                          `user_id` bigint NOT NULL DEFAULT '0' COMMENT '收藏者id',
                                          `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
                                          PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_post_collect_record` */

INSERT INTO `tb_post_collect_record` (`record_id`, `post_id`, `user_id`, `create_time`)
VALUES
    (1, 5, 4, '2021-08-10 16:10:07'),
    (2, 10, 4, '2021-08-10 16:15:44'),
    (3, 12, 4, '2021-08-10 16:17:13'),
    (4, 12, 3, '2021-08-10 16:18:11'),
    (5, 2, 3, '2021-08-10 16:23:02'),
    (6, 2, 2, '2021-08-10 16:34:41');


/*Table structure for table `tb_post_comment` */

DROP TABLE IF EXISTS `tb_post_comment`;

CREATE TABLE `tb_post_comment` (
                                   `comment_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                   `post_id` bigint NOT NULL DEFAULT '0' COMMENT '关联的帖子主键',
                                   `comment_user_id` bigint NOT NULL DEFAULT '0' COMMENT '评论者id',
                                   `comment_body` varchar(200) NOT NULL DEFAULT '' COMMENT '评论内容',
                                   `parent_comment_user_id` bigint NOT NULL DEFAULT '0' COMMENT '所回复的上一级评论的userId',
                                   `comment_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
                                   `is_deleted` tinyint DEFAULT '0' COMMENT '是否删除 0-未删除 1-已删除',
                                   PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `tb_post_comment` */

INSERT INTO `tb_post_comment` (`comment_id`, `post_id`, `comment_user_id`, `comment_body`, `parent_comment_user_id`, `comment_create_time`, `is_deleted`)
VALUES
    (10, 2, 3, '非常赞同！', 0, '2024-06-11 16:08:43', 0),
    (11, 8, 4, '这个话题很有趣！', 0, '2024-06-11 16:10:40', 0),
    (12, 12, 3, '支持支持！', 0, '2024-06-11 16:22:27', 0),
    (13, 2, 3, '没错！', 4, '2024-06-11 16:23:07', 1),
    (14, 2, 4, '同意同意！', 0, '2024-06-11 16:23:45', 1),
    (15, 2, 4, '学无止境', 0, '2024-06-11 16:23:55', 0),
    (16, 2, 4, '同感同感！', 4, '2024-06-11 16:24:14', 0),
    (17, 12, 2, '继续加油！', 0, '2024-06-11 16:34:02', 0),
    (18, 17, 2, '加油，一起前进！', 0, '2024-06-11 16:37:43', 0);
