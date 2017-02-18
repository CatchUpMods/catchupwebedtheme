/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50631
 Source Host           : localhost
 Source Database       : webed_sedna_theme

 Target Server Type    : MySQL
 Target Server Version : 50631
 File Encoding         : utf-8

 Date: 02/18/2017 08:39:19 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `blog_tags`
-- ----------------------------
DROP TABLE IF EXISTS `blog_tags`;
CREATE TABLE `blog_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` enum('activated','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activated',
  `order` int(11) NOT NULL DEFAULT '0',
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_tags_slug_unique` (`slug`),
  KEY `blog_tags_created_by_foreign` (`created_by`),
  KEY `blog_tags_updated_by_foreign` (`updated_by`),
  CONSTRAINT `blog_tags_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `blog_tags_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `blog_tags`
-- ----------------------------
BEGIN;
INSERT INTO `blog_tags` VALUES ('1', 'Kinh tế', 'kinh-te', '', 'activated', '0', '1', '1', '2017-01-22 06:57:31', '2017-01-22 06:57:31'), ('2', 'Tâm sự', 'tam-su', '', 'activated', '0', '1', '1', '2017-01-22 07:18:15', '2017-01-22 07:18:15');
COMMIT;

-- ----------------------------
--  Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page_template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('activated','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activated',
  `order` int(11) NOT NULL DEFAULT '0',
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  KEY `categories_created_by_foreign` (`created_by`),
  KEY `categories_updated_by_foreign` (`updated_by`),
  CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `categories`
-- ----------------------------
BEGIN;
INSERT INTO `categories` VALUES ('1', null, 'Tin tức nông nghiệp', '', 'tin-tuc-nong-nghiep', '', '', '', '', 'activated', '2', '1', '1', '2017-01-20 16:26:45', '2017-01-20 19:01:48'), ('2', null, 'Tư vấn nông nghiệp', '', 'tu-van-nong-nghiep', '', '', '', '', 'activated', '1', '1', '1', '2017-01-20 16:27:18', '2017-01-20 19:01:36'), ('3', null, 'Chuyện nhà nông', '', 'chuyen-nha-nong', '', '', '', '', 'activated', '3', '1', '1', '2017-01-20 16:27:35', '2017-01-20 19:02:13'), ('4', null, 'Vật tư nông nghiệp', '', 'vat-tu-nong-nghiep', '', '', '', '', 'activated', '4', '1', '1', '2017-01-20 16:27:46', '2017-01-20 19:02:22'), ('5', null, 'Giá cả thị trường', '', 'gia-ca-thi-truong', '', '', '', '', 'activated', '5', '1', '1', '2017-01-20 16:28:01', '2017-01-20 19:02:28'), ('6', null, 'Thời tiết nông vụ', '', 'thoi-tiet-nong-vu', '', '', '', '', 'activated', '6', '1', '1', '2017-01-20 16:28:12', '2017-01-20 19:02:34'), ('7', '1', 'Việt Nam', '', 'tin-tuc-viet-nam', '', '', '', '', 'activated', '0', '1', '1', '2017-01-20 16:28:39', '2017-01-20 16:28:39'), ('8', '1', 'Thế giới', '', 'tin-tuc-the-gioi', '', '', '', '', 'activated', '0', '1', '1', '2017-01-20 16:29:07', '2017-01-20 16:29:07'), ('9', '1', 'Sự kiện', '', 'tin-tuc-su-kien', '', '', '', '', 'activated', '0', '1', '1', '2017-01-20 16:29:32', '2017-01-20 16:29:32'), ('10', '1', 'Sâu bệnh', '', 'tin-tuc-sau-benh', '', '', '', '', 'activated', '0', '1', '1', '2017-01-20 16:29:50', '2017-01-20 16:29:50'), ('11', '2', 'Chăn nuôi', '', 'tu-van-chan-nuoi', '', '', '', '', 'activated', '0', '1', '1', '2017-01-20 16:31:09', '2017-01-20 16:31:09'), ('12', '2', 'Trồng trọt', '', 'tu-van-trong-trot', '', '', '', '', 'activated', '0', '1', '1', '2017-01-20 16:31:30', '2017-01-20 16:31:30'), ('13', '2', 'Văn bản pháp quy', '', 'tu-van-van-ban-phap-quy', '', '', '', '', 'activated', '0', '1', '1', '2017-01-20 16:31:53', '2017-01-20 16:31:53'), ('14', '3', 'Nông dân làm giàu', '', 'chuyen-nha-nong-nong-dan-lam-giau', '', '', '', '', 'activated', '0', '1', '1', '2017-01-20 16:32:27', '2017-01-20 16:32:27'), ('15', '3', 'Nông thôn mới', '', 'chuyen-nha-nong-nong-thon-moi', '', '', '', '', 'activated', '0', '1', '1', '2017-01-20 16:32:51', '2017-01-20 16:32:51'), ('16', '4', 'Cây giống, con giống', '', 'vat-tu-nong-nghiep-cay-giong-con-giong', '', '', '', '', 'activated', '0', '1', '1', '2017-01-20 16:33:53', '2017-01-20 16:33:53'), ('17', '4', 'Máy nông nghiệp', '', 'vat-tu-nong-nghiep-may-nong-nghiep', '', '', '', '', 'activated', '0', '1', '1', '2017-01-20 16:34:10', '2017-01-20 16:34:10'), ('18', '4', 'Thuốc BVTV', '', 'vat-tu-nong-nghiep-thuoc-bvtv', '', '', '', '', 'activated', '0', '1', '1', '2017-01-20 16:34:43', '2017-01-20 16:34:43'), ('19', '5', 'Cà phê', '', 'gia-ca-thi-truong-ca-phe', '', '', '', '', 'activated', '0', '1', '1', '2017-01-20 16:35:20', '2017-01-20 16:35:20'), ('20', '5', 'Lúa gạo', '', 'gia-ca-thi-truong-lua-gao', '', '', '', '', 'activated', '0', '1', '1', '2017-01-20 16:35:35', '2017-01-20 16:35:35'), ('21', '5', 'Nông sản khác', '', 'gia-ca-thi-truong-nong-san-khac', '', '', '', '', 'activated', '0', '1', '1', '2017-01-20 16:35:58', '2017-01-20 16:35:58');
COMMIT;

-- ----------------------------
--  Table structure for `custom_fields`
-- ----------------------------
DROP TABLE IF EXISTS `custom_fields`;
CREATE TABLE `custom_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `use_for` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `use_for_id` int(10) unsigned NOT NULL,
  `field_item_id` int(10) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `custom_fields_field_item_id_foreign` (`field_item_id`),
  CONSTRAINT `custom_fields_field_item_id_foreign` FOREIGN KEY (`field_item_id`) REFERENCES `field_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `custom_fields`
-- ----------------------------
BEGIN;
INSERT INTO `custom_fields` VALUES ('1', 'WebEd\\Plugins\\Blocks\\Models\\Block', '1', '1', 'text', 'big_title', 'WebEd CMS'), ('2', 'WebEd\\Plugins\\Blocks\\Models\\Block', '1', '2', 'text', 'intro_text', 'Build with latest Laravel version. Very easy to start!'), ('3', 'WebEd\\Plugins\\Blocks\\Models\\Block', '1', '3', 'text', 'download_link', 'https://github.com/sgsoft-studio/webed'), ('5', 'WebEd\\Plugins\\Blocks\\Models\\Block', '2', '5', 'repeater', 'intro_boxes', '[[{\"field_item_id\":6,\"type\":\"text\",\"slug\":\"icon\",\"value\":\"&#xe033;\"},{\"field_item_id\":7,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Easily customized\"},{\"field_item_id\":8,\"type\":\"text\",\"slug\":\"intro_text\",\"value\":\"Easily customize WebEd to suit your start up, portfolio or product.\"}],[{\"field_item_id\":6,\"type\":\"text\",\"slug\":\"icon\",\"value\":\"&#xe030;\"},{\"field_item_id\":7,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Modular\"},{\"field_item_id\":8,\"type\":\"text\",\"slug\":\"intro_text\",\"value\":\"Wow, everything are plugins!\"}],[{\"field_item_id\":6,\"type\":\"text\",\"slug\":\"icon\",\"value\":\"&#xe046;\"},{\"field_item_id\":7,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Clean code\"},{\"field_item_id\":8,\"type\":\"text\",\"slug\":\"intro_text\",\"value\":\"Follow PSR-2 coding style\"}]]'), ('6', 'WebEd\\Plugins\\Blocks\\Models\\Block', '3', '9', 'text', 'big_title', 'WebEd will drive your product forward'), ('7', 'WebEd\\Plugins\\Blocks\\Models\\Block', '3', '10', 'text', 'big_intro_text', 'Present your product, start up, or portfolio in a beautifully modern way. Turn your visitors into clients.'), ('8', 'WebEd\\Plugins\\Blocks\\Models\\Block', '3', '11', 'repeater', 'feature_stacks', '[[{\"field_item_id\":12,\"type\":\"text\",\"slug\":\"icon\",\"value\":\"\\ue03e\"},{\"field_item_id\":13,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Universal & Responsive\"},{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"intro_text\",\"value\":\"WebEd is universal and will look smashing on any device.\"}],[{\"field_item_id\":12,\"type\":\"text\",\"slug\":\"icon\",\"value\":\"\\ue040\"},{\"field_item_id\":13,\"type\":\"text\",\"slug\":\"title\",\"value\":\"User Centric Design\"},{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"intro_text\",\"value\":\"WebEd takes advantage of common design patterns, allowing for a seamless experience for users of all levels.\"}],[{\"field_item_id\":12,\"type\":\"text\",\"slug\":\"icon\",\"value\":\"\\ue03c\"},{\"field_item_id\":13,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Clean reusable code\"},{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"intro_text\",\"value\":\"Download and re-use the WebEd open source code for any other project you like.\"}]]'), ('9', 'WebEd\\Base\\Pages\\Models\\Page', '1', '1', 'text', 'big_title', 'WebEd CMS'), ('10', 'WebEd\\Base\\Pages\\Models\\Page', '1', '2', 'text', 'intro_text', 'Build with latest Laravel version. Very easy to start!'), ('11', 'WebEd\\Base\\Pages\\Models\\Page', '1', '3', 'text', 'download_link', 'https://github.com/sgsoft-studio/webed'), ('12', 'WebEd\\Base\\Pages\\Models\\Page', '1', '5', 'repeater', 'intro_boxes', '[[{\"field_item_id\":6,\"type\":\"text\",\"slug\":\"icon\",\"value\":\"\\ue033\"},{\"field_item_id\":7,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Easily customized\"},{\"field_item_id\":8,\"type\":\"text\",\"slug\":\"intro_text\",\"value\":\"Easily customize WebEd to suit your start up, portfolio or product.\"}],[{\"field_item_id\":6,\"type\":\"text\",\"slug\":\"icon\",\"value\":\"\\ue030\"},{\"field_item_id\":7,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Modular\"},{\"field_item_id\":8,\"type\":\"text\",\"slug\":\"intro_text\",\"value\":\"Wow, everything are plugins!\"}],[{\"field_item_id\":6,\"type\":\"text\",\"slug\":\"icon\",\"value\":\"\\ue046\"},{\"field_item_id\":7,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Clean code\"},{\"field_item_id\":8,\"type\":\"text\",\"slug\":\"intro_text\",\"value\":\"Follow PSR-2 coding style\"}]]'), ('13', 'WebEd\\Base\\Pages\\Models\\Page', '1', '9', 'text', 'big_title', 'WebEd will drive your product forward'), ('14', 'WebEd\\Base\\Pages\\Models\\Page', '1', '10', 'text', 'big_intro_text', 'Present your product, start up, or portfolio in a beautifully modern way. Turn your visitors into clients.'), ('15', 'WebEd\\Base\\Pages\\Models\\Page', '1', '11', 'repeater', 'feature_stacks', '[[{\"field_item_id\":12,\"type\":\"text\",\"slug\":\"icon\",\"value\":\"\\ue03e\"},{\"field_item_id\":13,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Universal & Responsive\"},{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"intro_text\",\"value\":\"WebEd is universal and will look smashing on any device.\"}],[{\"field_item_id\":12,\"type\":\"text\",\"slug\":\"icon\",\"value\":\"\\ue040\"},{\"field_item_id\":13,\"type\":\"text\",\"slug\":\"title\",\"value\":\"User Centric Design\"},{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"intro_text\",\"value\":\"WebEd takes advantage of common design patterns, allowing for a seamless experience for users of all levels.\"}],[{\"field_item_id\":12,\"type\":\"text\",\"slug\":\"icon\",\"value\":\"\\ue03c\"},{\"field_item_id\":13,\"type\":\"text\",\"slug\":\"title\",\"value\":\"Clean reusable code\"},{\"field_item_id\":14,\"type\":\"text\",\"slug\":\"intro_text\",\"value\":\"Download and re-use the WebEd open source code for any other project you like.\"}]]'), ('16', 'WebEd\\Base\\Pages\\Models\\Page', '1', '15', 'wysiwyg', 'content', '<p>At error noster inciderint has, te animal copiosae usu. Ne vim admodum signiferumque, modo hendrerit at duo. Usu ad tacimates electram. Quem invidunt consetetur est ei, ei sit vidisse nusquam eloquentiam, persecuti assueverit signiferumque et mel. Vis oblique ancillae hendrerit cu. Vel atqui prodesset maiestatis cu. Ea veri alterum delenit sea?</p>\n\n<p>At error noster inciderint has, te animal copiosae usu. Ne vim admodum signiferumque, modo hendrerit at duo. Usu ad tacimates electram. Quem invidunt consetetur est ei, ei sit vidisse nusquam eloquentiam, persecuti assueverit signiferumque et mel. Vis oblique ancillae hendrerit cu. Vel atqui prodesset maiestatis cu. Ea veri alterum delenit sea?</p>\n'), ('17', 'WebEd\\Base\\Pages\\Models\\Page', '1', '16', 'text', 'big_title', 'H3 heading'), ('18', 'WebEd\\Base\\Pages\\Models\\Page', '1', '17', 'repeater', 'blog_intro_boxes', '[[{\"field_item_id\":18,\"type\":\"text\",\"slug\":\"title\",\"value\":\"H5 title\"},{\"field_item_id\":19,\"type\":\"text\",\"slug\":\"content\",\"value\":\"At error noster inciderint has, te animal copiosae usu. Ne vim admodum signiferumque, modo hendrerit at duo. Usu ad tacimates electram. Quem invidunt consetetur est ei, ei sit vidisse nusquam eloquentiam, persecuti assueverit signiferumque et mel. Vis oblique ancillae hendrerit cu. Vel atqui prodesset maiestatis cu. Ea veri alterum delenit sea?\"}],[{\"field_item_id\":18,\"type\":\"text\",\"slug\":\"title\",\"value\":\"H5 title\"},{\"field_item_id\":19,\"type\":\"text\",\"slug\":\"content\",\"value\":\"At error noster inciderint has, te animal copiosae usu. Ne vim admodum signiferumque, modo hendrerit at duo. Usu ad tacimates electram. Quem invidunt consetetur est ei, ei sit vidisse nusquam eloquentiam, persecuti assueverit signiferumque et mel. Vis oblique ancillae hendrerit cu. Vel atqui prodesset maiestatis cu. Ea veri alterum delenit sea?\"}]]'), ('19', 'WebEd\\Base\\Pages\\Models\\Page', '1', '20', 'repeater', 'testimonials', '[[{\"field_item_id\":21,\"type\":\"text\",\"slug\":\"name\",\"value\":\"Tedozi Manson\"},{\"field_item_id\":22,\"type\":\"text\",\"slug\":\"quote\",\"value\":\"At error noster inciderint has, te animal copiosae usu. Ne vim admodum signiferumque, modo hendrerit at duo.\"}],[{\"field_item_id\":21,\"type\":\"text\",\"slug\":\"name\",\"value\":\"Duy Phan\"},{\"field_item_id\":22,\"type\":\"text\",\"slug\":\"quote\",\"value\":\"At error noster inciderint has, te animal copiosae usu. Ne vim admodum signiferumque, modo hendrerit at duo.\"}],[{\"field_item_id\":21,\"type\":\"text\",\"slug\":\"name\",\"value\":\"Nghia Tran\"},{\"field_item_id\":22,\"type\":\"text\",\"slug\":\"quote\",\"value\":\"At error noster inciderint has, te animal copiosae usu. Ne vim admodum signiferumque, modo hendrerit at duo.\"}],[{\"field_item_id\":21,\"type\":\"text\",\"slug\":\"name\",\"value\":\"Hue Linh\"},{\"field_item_id\":22,\"type\":\"text\",\"slug\":\"quote\",\"value\":\"At error noster inciderint has, te animal copiosae usu. Ne vim admodum signiferumque, modo hendrerit at duo.\"}]]');
COMMIT;

-- ----------------------------
--  Table structure for `field_groups`
-- ----------------------------
DROP TABLE IF EXISTS `field_groups`;
CREATE TABLE `field_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rules` text COLLATE utf8_unicode_ci,
  `status` enum('activated','disabled') COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_groups_created_by_foreign` (`created_by`),
  KEY `field_groups_updated_by_foreign` (`updated_by`),
  CONSTRAINT `field_groups_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_groups_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `field_groups`
-- ----------------------------
BEGIN;
INSERT INTO `field_groups` VALUES ('1', 'Homepage CMS blocks - Hero', '[[{\"name\":\"page_template\",\"type\":\"==\",\"value\":\"Homepage\"}]]', 'activated', '0', '1', '1', '2017-01-19 14:46:40', '2017-01-19 16:57:47'), ('2', 'Homepage CMS blocks - Intro', '[[{\"name\":\"page_template\",\"type\":\"==\",\"value\":\"Homepage\"}]]', 'activated', '0', '1', '1', '2017-01-19 14:57:05', '2017-01-19 16:58:06'), ('3', 'Homepage CMS blocks - Features', '[[{\"name\":\"page_template\",\"type\":\"==\",\"value\":\"Homepage\"}]]', 'activated', '0', '1', '1', '2017-01-19 15:12:46', '2017-01-19 16:58:19'), ('4', 'Homepage CMS blocks - features extra', '[[{\"name\":\"page_template\",\"type\":\"==\",\"value\":\"Homepage\"}]]', 'activated', '0', '1', '1', '2017-01-19 17:04:04', '2017-01-19 17:04:04'), ('5', 'Homepage CMS blocks - Blog intro', '[[{\"name\":\"page_template\",\"type\":\"==\",\"value\":\"Homepage\"}]]', 'activated', '0', '1', '1', '2017-01-19 17:21:54', '2017-01-19 17:21:54'), ('6', 'Homepage CMS blocks - Testimonials', '[[{\"name\":\"page_template\",\"type\":\"==\",\"value\":\"Homepage\"}]]', 'activated', '0', '1', '1', '2017-01-19 17:33:33', '2017-01-19 17:33:33');
COMMIT;

-- ----------------------------
--  Table structure for `field_items`
-- ----------------------------
DROP TABLE IF EXISTS `field_items`;
CREATE TABLE `field_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_group_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  `options` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_items_field_group_id_parent_id_slug_unique` (`field_group_id`,`parent_id`,`slug`),
  KEY `field_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `field_items_field_group_id_foreign` FOREIGN KEY (`field_group_id`) REFERENCES `field_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `field_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `field_items`
-- ----------------------------
BEGIN;
INSERT INTO `field_items` VALUES ('1', '1', null, '1', 'Big title', 'big_title', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('2', '1', null, '2', 'Intro text', 'intro_text', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('3', '1', null, '3', 'Download link', 'download_link', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('5', '2', null, '1', 'Intro boxes', 'intro_boxes', 'repeater', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('6', '2', '5', '1', 'Icon', 'icon', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('7', '2', '5', '2', 'Title', 'title', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('8', '2', '5', '3', 'Intro text', 'intro_text', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('9', '3', null, '1', 'Big title', 'big_title', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('10', '3', null, '2', 'Big intro text', 'big_intro_text', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('11', '3', null, '3', 'Feature stacks', 'feature_stacks', 'repeater', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('12', '3', '11', '1', 'Icon', 'icon', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('13', '3', '11', '2', 'Title', 'title', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('14', '3', '11', '3', 'Intro text', 'intro_text', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('15', '4', null, '1', 'Content', 'content', 'wysiwyg', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":\"basic\",\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('16', '5', null, '1', 'Big title', 'big_title', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('17', '5', null, '2', 'Blog intro boxes', 'blog_intro_boxes', 'repeater', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('18', '5', '17', '1', 'Title', 'title', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('19', '5', '17', '2', 'Content', 'content', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('20', '6', null, '1', 'Testimonials', 'testimonials', 'repeater', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('21', '6', '20', '1', 'Name', 'name', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}'), ('22', '6', '20', '2', 'Quote', 'quote', 'text', null, '{\"defaultValue\":null,\"defaultValueTextarea\":null,\"placeholderText\":null,\"wysiwygToolbar\":null,\"selectChoices\":null,\"buttonLabel\":null,\"rows\":null}');
COMMIT;

-- ----------------------------
--  Table structure for `menu_nodes`
-- ----------------------------
DROP TABLE IF EXISTS `menu_nodes`;
CREATE TABLE `menu_nodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `related_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_font` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_foreign` (`menu_id`),
  KEY `menu_nodes_parent_id_foreign` (`parent_id`),
  CONSTRAINT `menu_nodes_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_nodes_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menu_nodes` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `menu_nodes`
-- ----------------------------
BEGIN;
INSERT INTO `menu_nodes` VALUES ('1', '1', null, null, 'custom-link', '#features', 'Features', '', '', '', '1', '2017-01-19 13:22:27', '2017-01-19 14:32:44'), ('2', '1', null, null, 'custom-link', '#assets', 'Assets', '', '', '', '2', '2017-01-19 13:22:27', '2017-01-19 14:32:44'), ('3', '1', null, null, 'custom-link', '#download', 'Download', '', '', '', '3', '2017-01-19 13:22:27', '2017-01-19 14:32:44'), ('4', '1', null, null, 'custom-link', '#top', 'Home', '', '', '', '0', '2017-01-19 14:32:44', '2017-01-19 14:32:44'), ('5', '2', null, '1', 'page', null, '', '', '', null, '0', '2017-01-20 01:54:57', '2017-01-20 01:54:57'), ('6', '2', null, null, 'custom-link', 'https://tympanus.net/codrops', 'Codrops', '', '', '_blank', '1', '2017-01-20 01:54:57', '2017-01-20 01:54:57');
COMMIT;

-- ----------------------------
--  Table structure for `menus`
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('activated','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activated',
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menus_created_by_foreign` (`created_by`),
  KEY `menus_updated_by_foreign` (`updated_by`),
  CONSTRAINT `menus_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `menus_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `menus`
-- ----------------------------
BEGIN;
INSERT INTO `menus` VALUES ('1', 'Top menu', 'top-menu', 'activated', '1', '1', '2017-01-19 13:22:27', '2017-01-19 13:22:27'), ('2', 'Footer menu', 'footer-menu', 'activated', '1', '1', '2017-01-20 01:54:57', '2017-01-20 01:54:57');
COMMIT;

-- ----------------------------
--  Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `migrations`
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES ('1', '2016_08_04_043730_create_users_table', '1'), ('2', '2016_08_04_043732_create_roles_table', '1'), ('3', '2016_08_04_043756_create_settings_table', '1'), ('4', '2016_11_07_102334_create_menus', '1'), ('5', '2016_11_27_120334_create_plugins_table', '1'), ('6', '2016_11_28_015813_create_pages_table', '1'), ('7', '2016_11_29_163613_create_theme_options_table', '1'), ('8', '2016_11_29_163713_add_field_installed_version_to_table_themes', '1'), ('9', '2016_12_07_121349_create_view_trackers_table', '1'), ('10', '2016_11_29_163613_create_themes_table', '2');
COMMIT;

-- ----------------------------
--  Table structure for `pages`
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page_template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('activated','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activated',
  `order` int(11) NOT NULL DEFAULT '0',
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`),
  KEY `pages_created_by_foreign` (`created_by`),
  KEY `pages_updated_by_foreign` (`updated_by`),
  CONSTRAINT `pages_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `pages_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `pages`
-- ----------------------------
BEGIN;
INSERT INTO `pages` VALUES ('1', 'Homepage', 'Homepage', 'homepage', '', '', '', '', 'activated', '0', '1', '1', '2017-01-19 13:04:31', '2017-01-19 16:53:06');
COMMIT;

-- ----------------------------
--  Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `permissions`
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `permissions`
-- ----------------------------
BEGIN;
INSERT INTO `permissions` VALUES ('1', 'View roles', 'view-roles', 'WebEd\\Base\\ACL'), ('2', 'Create roles', 'create-roles', 'WebEd\\Base\\ACL'), ('3', 'Edit roles', 'edit-roles', 'WebEd\\Base\\ACL'), ('4', 'Delete roles', 'delete-roles', 'WebEd\\Base\\ACL'), ('5', 'View permissions', 'view-permissions', 'WebEd\\Base\\ACL'), ('6', 'Assign roles', 'assign-roles', 'WebEd\\Base\\ACL'), ('7', 'Access to dashboard', 'access-dashboard', 'WebEd\\Base\\Core'), ('8', 'System commands', 'use-system-commands', 'WebEd\\Base\\Core'), ('9', 'View cache management page', 'view-cache', 'WebEd\\Base\\Caching'), ('10', 'Modify cache', 'modify-cache', 'WebEd\\Base\\Caching'), ('11', 'Clear cache', 'clear-cache', 'WebEd\\Base\\Caching'), ('12', 'View files', 'view-files', 'WebEd\\Base\\Elfinder'), ('13', 'Upload files', 'upload-files', 'WebEd\\Base\\Elfinder'), ('14', 'Edit files', 'edit-files', 'WebEd\\Base\\Elfinder'), ('15', 'Delete files', 'delete-files', 'WebEd\\Base\\Elfinder'), ('16', 'View menus', 'view-menus', 'WebEd\\Base\\Menu'), ('17', 'Delete menus', 'delete-menus', 'WebEd\\Base\\Menu'), ('18', 'Create menus', 'create-menus', 'WebEd\\Base\\Menu'), ('19', 'Edit menus', 'edit-menus', 'WebEd\\Base\\Menu'), ('20', 'Manage plugins', 'view-plugins', 'WebEd\\Base\\ModulesManagement'), ('21', 'View pages', 'view-pages', 'WebEd\\Base\\Pages'), ('22', 'Create pages', 'create-pages', 'WebEd\\Base\\Pages'), ('23', 'Edit pages', 'edit-pages', 'WebEd\\Base\\Pages'), ('24', 'Delete pages', 'delete-pages', 'WebEd\\Base\\Pages'), ('25', 'View settings page', 'view-settings', 'WebEd\\Base\\Settings'), ('26', 'Edit settings', 'edit-settings', 'WebEd\\Base\\Settings'), ('27', 'View themes', 'view-themes', 'WebEd\\Base\\ThemesManagement'), ('28', 'View users', 'view-users', 'WebEd\\Base\\Users'), ('29', 'Create users', 'create-users', 'WebEd\\Base\\Users'), ('30', 'Edit other users', 'edit-other-users', 'WebEd\\Base\\Users'), ('31', 'Delete users', 'delete-users', 'WebEd\\Base\\Users'), ('32', 'Delete users', 'force-delete-users', 'WebEd\\Base\\Users'), ('37', 'View custom fields', 'view-custom-fields', 'WebEd\\Plugins\\CustomFields'), ('38', 'Create field group', 'create-field-groups', 'WebEd\\Plugins\\CustomFields'), ('39', 'Edit field group', 'edit-field-groups', 'WebEd\\Plugins\\CustomFields'), ('40', 'Delete field group', 'delete-field-groups', 'WebEd\\Plugins\\CustomFields');
COMMIT;

-- ----------------------------
--  Table structure for `plugins`
-- ----------------------------
DROP TABLE IF EXISTS `plugins`;
CREATE TABLE `plugins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `installed_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `installed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `plugins`
-- ----------------------------
BEGIN;
INSERT INTO `plugins` VALUES ('1', 'webed-analytics', '1.0.3', '0', '1'), ('2', 'webed-backup', null, '0', '0'), ('3', 'webed-blocks', '1.0', '0', '0'), ('4', 'webed-blog', null, '0', '0'), ('5', 'webed-custom-fields', '2.0.6', '1', '1'), ('6', 'webed-dashboard-style-guide', null, '0', '0'), ('7', 'webed-ecommerce', null, '0', '0'), ('8', 'webed-ecommerce-coupons', null, '0', '0'), ('9', 'webed-ecommerce-customers', null, '0', '0'), ('10', 'webed-ecommerce-orders', null, '0', '0'), ('11', 'webed-ecommerce-product-attributes', null, '0', '0'), ('12', 'webed-ide', null, '0', '0'), ('13', 'webed-captcha', null, '0', '0'), ('14', 'webed-contact-form', null, '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `posts`
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page_template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('activated','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activated',
  `order` int(11) NOT NULL DEFAULT '0',
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_created_by_foreign` (`created_by`),
  KEY `posts_updated_by_foreign` (`updated_by`),
  CONSTRAINT `posts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `posts`
-- ----------------------------
BEGIN;
INSERT INTO `posts` VALUES ('1', 'Tuổi trẻ như một chú ngựa, không chịu chạy không rèn luyện thì mãi chỉ là ngựa thường chẳng bao giờ trở thành chiến mã', '', 'tuoi-tre-nhu-mot-chu-ngua-khong-chiu-chay-khong-ren-luyen-thi-mai-chi-la-ngua-thuong-chang-bao-gio-tro-thanh-chien-ma', 'Tuổi trẻ như một chú ngựa, không chịu chạy không rèn luyện thì mãi chỉ là ngựa thường chẳng bao giờ trở thành chiến mã', '<p>Tuổi trẻ như một ch&uacute; ngựa, kh&ocirc;ng chịu chạy kh&ocirc;ng r&egrave;n luyện th&igrave; m&atilde;i chỉ l&agrave; ngựa thường chẳng bao giờ trở th&agrave;nh chiến m&atilde;.&nbsp;​Tuổi trẻ như một ch&uacute; ngựa, kh&ocirc;ng chịu chạy kh&ocirc;ng r&egrave;n luyện th&igrave; m&atilde;i chỉ l&agrave; ngựa thường chẳng bao giờ trở th&agrave;nh chiến m&atilde;.&nbsp;​Tuổi trẻ như một ch&uacute; ngựa, kh&ocirc;ng chịu chạy kh&ocirc;ng r&egrave;n luyện th&igrave; m&atilde;i chỉ l&agrave; ngựa thường chẳng bao giờ trở th&agrave;nh chiến m&atilde;.</p>\r\n\r\n<p>​Tuổi trẻ như một ch&uacute; ngựa, kh&ocirc;ng chịu chạy kh&ocirc;ng r&egrave;n luyện th&igrave; m&atilde;i chỉ l&agrave; ngựa thường chẳng bao giờ trở th&agrave;nh chiến m&atilde;.&nbsp;​Tuổi trẻ như một ch&uacute; ngựa, kh&ocirc;ng chịu chạy kh&ocirc;ng r&egrave;n luyện th&igrave; m&atilde;i chỉ l&agrave; ngựa thường chẳng bao giờ trở th&agrave;nh chiến m&atilde;.&nbsp;​Tuổi trẻ như một ch&uacute; ngựa, kh&ocirc;ng chịu chạy kh&ocirc;ng r&egrave;n luyện th&igrave; m&atilde;i chỉ l&agrave; ngựa thường chẳng bao giờ trở th&agrave;nh chiến m&atilde;.</p>\r\n\r\n<p>​Tuổi trẻ như một ch&uacute; ngựa, kh&ocirc;ng chịu chạy kh&ocirc;ng r&egrave;n luyện th&igrave; m&atilde;i chỉ l&agrave; ngựa thường chẳng bao giờ trở th&agrave;nh chiến m&atilde;.&nbsp;​Tuổi trẻ như một ch&uacute; ngựa, kh&ocirc;ng chịu chạy kh&ocirc;ng r&egrave;n luyện th&igrave; m&atilde;i chỉ l&agrave; ngựa thường chẳng bao giờ trở th&agrave;nh chiến m&atilde;.&nbsp;​Tuổi trẻ như một ch&uacute; ngựa, kh&ocirc;ng chịu chạy kh&ocirc;ng r&egrave;n luyện th&igrave; m&atilde;i chỉ l&agrave; ngựa thường chẳng bao giờ trở th&agrave;nh chiến m&atilde;.</p>\r\n\r\n<p>​Tuổi trẻ như một ch&uacute; ngựa, kh&ocirc;ng chịu chạy kh&ocirc;ng r&egrave;n luyện th&igrave; m&atilde;i chỉ l&agrave; ngựa thường chẳng bao giờ trở th&agrave;nh chiến m&atilde;.&nbsp;​Tuổi trẻ như một ch&uacute; ngựa, kh&ocirc;ng chịu chạy kh&ocirc;ng r&egrave;n luyện th&igrave; m&atilde;i chỉ l&agrave; ngựa thường chẳng bao giờ trở th&agrave;nh chiến m&atilde;.&nbsp;​Tuổi trẻ như một ch&uacute; ngựa, kh&ocirc;ng chịu chạy kh&ocirc;ng r&egrave;n luyện th&igrave; m&atilde;i chỉ l&agrave; ngựa thường chẳng bao giờ trở th&agrave;nh chiến m&atilde;.</p>\r\n', 'http://cafebiz.cafebizcdn.vn/thumb_w/600/2017/big-thumb-8fcffef2922dd906e935abf238dd85ff-1484885728497-crop-1484885737483.jpg', '', 'activated', '0', '1', '1', '2017-01-20 18:15:28', '2017-01-20 19:18:43', '1'), ('2', 'Năm Đinh Dậu, thế giới sẽ ăn nhiều thịt gà hơn?', '', 'nam-dinh-dau-the-gioi-se-an-nhieu-thit-ga-hon', 'Bộ Nông nghiệp Hoa Kỳ vừa đưa ra một số dự đoán thị trường thịt năm 2017 của thế giới. Điều đặc biệt, sản lượng thịt lợn, thịt bò và gia cầm khả năng đều phá kỷ lục 2016.', '<p>Dự b&aacute;o sản lượng to&agrave;n cầu tăng 1%, l&ecirc;n mức kỷ lục 90.400.000 tấn, do thị trường mở rộng ở Hoa Kỳ, Brazil, Ấn Độ, EU b&ugrave; đắp nhiều hơn sự suy giảm đ&aacute;ng kể của Trung Quốc. Giao dịch thương mại thịt gia cầm sẽ tăng 5%, l&ecirc;n mức kỷ lục 11,4 triệu tấn. Xuất khẩu thịt gia cầm của Brazil sẽ tăng cao hơn, v&igrave; khả năng tiếp cận thị trường Trung Quốc.Sản xuất của Hoa Kỳ sẽ tăng 2% (l&ecirc;n 18,7 triệu tấn). Xuất khẩu sẽ tăng 5% (đến 3,1 triệu tấn). Trong khi hầu hết c&aacute;c nước đ&atilde; bỏ hạn chế do dịch c&uacute;m gia cầm li&ecirc;n quan chống Hoa Kỳ, Trung Quốc lại kh&ocirc;ng, l&agrave;m giảm tiềm năng xuất khẩu.</p>\r\n\r\n<p>Dự b&aacute;o sản lượng to&agrave;n cầu tăng 1%, l&ecirc;n mức kỷ lục 90.400.000 tấn, do thị trường mở rộng ở Hoa Kỳ, Brazil, Ấn Độ, EU b&ugrave; đắp nhiều hơn sự suy giảm đ&aacute;ng kể của Trung Quốc. Giao dịch thương mại thịt gia cầm sẽ tăng 5%, l&ecirc;n mức kỷ lục 11,4 triệu tấn. Xuất khẩu thịt gia cầm của Brazil sẽ tăng cao hơn, v&igrave; khả năng tiếp cận thị trường Trung Quốc.Sản xuất của Hoa Kỳ sẽ tăng 2% (l&ecirc;n 18,7 triệu tấn). Xuất khẩu sẽ tăng 5% (đến 3,1 triệu tấn). Trong khi hầu hết c&aacute;c nước đ&atilde; bỏ hạn chế do dịch c&uacute;m gia cầm li&ecirc;n quan chống Hoa Kỳ, Trung Quốc lại kh&ocirc;ng, l&agrave;m giảm tiềm năng xuất khẩu.</p>\r\n\r\n<p>Dự b&aacute;o sản lượng to&agrave;n cầu tăng 1%, l&ecirc;n mức kỷ lục 90.400.000 tấn, do thị trường mở rộng ở Hoa Kỳ, Brazil, Ấn Độ, EU b&ugrave; đắp nhiều hơn sự suy giảm đ&aacute;ng kể của Trung Quốc. Giao dịch thương mại thịt gia cầm sẽ tăng 5%, l&ecirc;n mức kỷ lục 11,4 triệu tấn. Xuất khẩu thịt gia cầm của Brazil sẽ tăng cao hơn, v&igrave; khả năng tiếp cận thị trường Trung Quốc.Sản xuất của Hoa Kỳ sẽ tăng 2% (l&ecirc;n 18,7 triệu tấn). Xuất khẩu sẽ tăng 5% (đến 3,1 triệu tấn). Trong khi hầu hết c&aacute;c nước đ&atilde; bỏ hạn chế do dịch c&uacute;m gia cầm li&ecirc;n quan chống Hoa Kỳ, Trung Quốc lại kh&ocirc;ng, l&agrave;m giảm tiềm năng xuất khẩu.</p>\r\n\r\n<p>Dự b&aacute;o sản lượng to&agrave;n cầu tăng 1%, l&ecirc;n mức kỷ lục 90.400.000 tấn, do thị trường mở rộng ở Hoa Kỳ, Brazil, Ấn Độ, EU b&ugrave; đắp nhiều hơn sự suy giảm đ&aacute;ng kể của Trung Quốc. Giao dịch thương mại thịt gia cầm sẽ tăng 5%, l&ecirc;n mức kỷ lục 11,4 triệu tấn. Xuất khẩu thịt gia cầm của Brazil sẽ tăng cao hơn, v&igrave; khả năng tiếp cận thị trường Trung Quốc.Sản xuất của Hoa Kỳ sẽ tăng 2% (l&ecirc;n 18,7 triệu tấn). Xuất khẩu sẽ tăng 5% (đến 3,1 triệu tấn). Trong khi hầu hết c&aacute;c nước đ&atilde; bỏ hạn chế do dịch c&uacute;m gia cầm li&ecirc;n quan chống Hoa Kỳ, Trung Quốc lại kh&ocirc;ng, l&agrave;m giảm tiềm năng xuất khẩu.</p>\r\n\r\n<p>Dự b&aacute;o sản lượng to&agrave;n cầu tăng 1%, l&ecirc;n mức kỷ lục 90.400.000 tấn, do thị trường mở rộng ở Hoa Kỳ, Brazil, Ấn Độ, EU b&ugrave; đắp nhiều hơn sự suy giảm đ&aacute;ng kể của Trung Quốc. Giao dịch thương mại thịt gia cầm sẽ tăng 5%, l&ecirc;n mức kỷ lục 11,4 triệu tấn. Xuất khẩu thịt gia cầm của Brazil sẽ tăng cao hơn, v&igrave; khả năng tiếp cận thị trường Trung Quốc.Sản xuất của Hoa Kỳ sẽ tăng 2% (l&ecirc;n 18,7 triệu tấn). Xuất khẩu sẽ tăng 5% (đến 3,1 triệu tấn). Trong khi hầu hết c&aacute;c nước đ&atilde; bỏ hạn chế do dịch c&uacute;m gia cầm li&ecirc;n quan chống Hoa Kỳ, Trung Quốc lại kh&ocirc;ng, l&agrave;m giảm tiềm năng xuất khẩu.</p>\r\n\r\n<p>Dự b&aacute;o sản lượng to&agrave;n cầu tăng 1%, l&ecirc;n mức kỷ lục 90.400.000 tấn, do thị trường mở rộng ở Hoa Kỳ, Brazil, Ấn Độ, EU b&ugrave; đắp nhiều hơn sự suy giảm đ&aacute;ng kể của Trung Quốc. Giao dịch thương mại thịt gia cầm sẽ tăng 5%, l&ecirc;n mức kỷ lục 11,4 triệu tấn. Xuất khẩu thịt gia cầm của Brazil sẽ tăng cao hơn, v&igrave; khả năng tiếp cận thị trường Trung Quốc.Sản xuất của Hoa Kỳ sẽ tăng 2% (l&ecirc;n 18,7 triệu tấn). Xuất khẩu sẽ tăng 5% (đến 3,1 triệu tấn). Trong khi hầu hết c&aacute;c nước đ&atilde; bỏ hạn chế do dịch c&uacute;m gia cầm li&ecirc;n quan chống Hoa Kỳ, Trung Quốc lại kh&ocirc;ng, l&agrave;m giảm tiềm năng xuất khẩu.</p>\r\n', 'http://cafebiz.cafebizcdn.vn/thumb_w/600/2017/anh-3-1484298611646-1484885283667-crop-1484885289586.jpg', '', 'activated', '0', '1', '1', '2017-01-20 18:26:49', '2017-01-20 18:26:49', '0'), ('3', 'Tài lộc, công việc của bạn ra sao trong năm Đinh Dậu?', '', 'tai-loc-cong-viec-cua-ban-ra-sao-trong-nam-dinh-dau', 'Đúng như những gì Cựu Thủ tướng huyền thoại của Anh, ông Winston Churchill đã từng nói: “Chúng ta xây dựng ngôi nhà của mình và chính nó sẽ cải thiện cuộc sống của bản thân chúng ta”, thuật phong thủy có lẽ sẽ vô cùng hữu ích nếu được áp dụng đúng chỗ, đúng cách trong cuộc sống.', '<p>Theo l&yacute; thuyết phong thủy, đảm bảo được vị tr&iacute; tốt l&agrave;nh trong sinh hoạt đời sống thường ng&agrave;y c&oacute; thể đem đến hoặc giữ g&igrave;n sự h&agrave;i h&ograve;a, sức khỏe cũng như t&agrave;i lộc của mọi người. Hiện rất nhiều kh&aacute;ch sạn, khu nghỉ dưỡng tại Hồng K&ocirc;ng &aacute;p dụng phong thủy v&agrave;o tất cả c&aacute;c quyết định kinh doanh quan trọng, nhất l&agrave; trong việc chọn địa điểm x&acirc;y dựng, thiết kế của c&ocirc;ng tr&igrave;nh để đảm bảo may mắn sẽ đến.</p>\r\n\r\n<p>Theo l&yacute; thuyết phong thủy, đảm bảo được vị tr&iacute; tốt l&agrave;nh trong sinh hoạt đời sống thường ng&agrave;y c&oacute; thể đem đến hoặc giữ g&igrave;n sự h&agrave;i h&ograve;a, sức khỏe cũng như t&agrave;i lộc của mọi người. Hiện rất nhiều kh&aacute;ch sạn, khu nghỉ dưỡng tại Hồng K&ocirc;ng &aacute;p dụng phong thủy v&agrave;o tất cả c&aacute;c quyết định kinh doanh quan trọng, nhất l&agrave; trong việc chọn địa điểm x&acirc;y dựng, thiết kế của c&ocirc;ng tr&igrave;nh để đảm bảo may mắn sẽ đến.</p>\r\n\r\n<p>Theo l&yacute; thuyết phong thủy, đảm bảo được vị tr&iacute; tốt l&agrave;nh trong sinh hoạt đời sống thường ng&agrave;y c&oacute; thể đem đến hoặc giữ g&igrave;n sự h&agrave;i h&ograve;a, sức khỏe cũng như t&agrave;i lộc của mọi người. Hiện rất nhiều kh&aacute;ch sạn, khu nghỉ dưỡng tại Hồng K&ocirc;ng &aacute;p dụng phong thủy v&agrave;o tất cả c&aacute;c quyết định kinh doanh quan trọng, nhất l&agrave; trong việc chọn địa điểm x&acirc;y dựng, thiết kế của c&ocirc;ng tr&igrave;nh để đảm bảo may mắn sẽ đến.</p>\r\n\r\n<p>Theo l&yacute; thuyết phong thủy, đảm bảo được vị tr&iacute; tốt l&agrave;nh trong sinh hoạt đời sống thường ng&agrave;y c&oacute; thể đem đến hoặc giữ g&igrave;n sự h&agrave;i h&ograve;a, sức khỏe cũng như t&agrave;i lộc của mọi người. Hiện rất nhiều kh&aacute;ch sạn, khu nghỉ dưỡng tại Hồng K&ocirc;ng &aacute;p dụng phong thủy v&agrave;o tất cả c&aacute;c quyết định kinh doanh quan trọng, nhất l&agrave; trong việc chọn địa điểm x&acirc;y dựng, thiết kế của c&ocirc;ng tr&igrave;nh để đảm bảo may mắn sẽ đến.</p>\r\n', 'http://cafebiz.cafebizcdn.vn/thumb_w/600/2017/chickens-web-1484873235496-42-102-754-1437-crop-1484873252644.jpg', '', 'activated', '0', '1', '1', '2017-01-20 18:34:36', '2017-01-20 18:34:36', '1'), ('4', 'Đừng ăn tối sau 19h nếu bạn không muốn nhận hậu quả', '', 'dung-an-toi-sau-19h-neu-ban-khong-muon-nhan-hau-qua', 'Ăn tối sau 7 giờ sẽ khiến cơ thể không có đủ thời gian xử lý thức ăn, làm tích trữ chất béo không lành mạnh dẫn đến tăng cân và béo phì.', '<p>Ăn tối sau 7 giờ sẽ khiến cơ thể kh&ocirc;ng c&oacute; đủ thời gian xử l&yacute; thức ăn, l&agrave;m t&iacute;ch trữ chất b&eacute;o kh&ocirc;ng l&agrave;nh mạnh dẫn đến tăng c&acirc;n v&agrave; b&eacute;o ph&igrave;.</p>\r\n\r\n<p>​Ăn tối sau 7 giờ sẽ khiến cơ thể kh&ocirc;ng c&oacute; đủ thời gian xử l&yacute; thức ăn, l&agrave;m t&iacute;ch trữ chất b&eacute;o kh&ocirc;ng l&agrave;nh mạnh dẫn đến tăng c&acirc;n v&agrave; b&eacute;o ph&igrave;.</p>\r\n\r\n<p>​Ăn tối sau 7 giờ sẽ khiến cơ thể kh&ocirc;ng c&oacute; đủ thời gian xử l&yacute; thức ăn, l&agrave;m t&iacute;ch trữ chất b&eacute;o kh&ocirc;ng l&agrave;nh mạnh dẫn đến tăng c&acirc;n v&agrave; b&eacute;o ph&igrave;.</p>\r\n\r\n<p>​Ăn tối sau 7 giờ sẽ khiến cơ thể kh&ocirc;ng c&oacute; đủ thời gian xử l&yacute; thức ăn, l&agrave;m t&iacute;ch trữ chất b&eacute;o kh&ocirc;ng l&agrave;nh mạnh dẫn đến tăng c&acirc;n v&agrave; b&eacute;o ph&igrave;.</p>\r\n\r\n<p>​Ăn tối sau 7 giờ sẽ khiến cơ thể kh&ocirc;ng c&oacute; đủ thời gian xử l&yacute; thức ăn, l&agrave;m t&iacute;ch trữ chất b&eacute;o kh&ocirc;ng l&agrave;nh mạnh dẫn đến tăng c&acirc;n v&agrave; b&eacute;o ph&igrave;.</p>\r\n', 'http://cafebiz.cafebizcdn.vn/thumb_w/600/2017/an-toi-shutterstock-pbei-1484711012842-60-0-902-1600-crop-1484711028179-1484916687429-crop-1484916744961.jpg', '', 'activated', '0', '1', '1', '2017-01-20 18:38:16', '2017-01-20 18:53:02', '1'), ('5', 'Trường đua lớn nhất VN của ông Dũng Lò Vôi sắp hoàn thiện', '', 'truong-dua-lon-nhat-vn-cua-ong-dung-lo-voi-sap-hoan-thien', 'Trường đua phức hợp gồm đua ngựa, đua xe tại khu du lịch Đại Nam của ông Huỳnh Uy Dũng sắp hoàn thiện, chuẩn bị tổ chức giải đua xe máy 390 cc vào dịp Tết 2017.', '<p>Trường đua phức hợp gồm đua ngựa, đua xe tại khu du lịch Đại Nam của &ocirc;ng Huỳnh Uy Dũng sắp ho&agrave;n thiện, chuẩn bị tổ chức giải đua xe m&aacute;y 390 cc v&agrave;o dịp Tết 2017.</p>\r\n\r\n<p>Trường đua phức hợp gồm đua ngựa, đua xe tại khu du lịch Đại Nam của &ocirc;ng Huỳnh Uy Dũng sắp ho&agrave;n thiện, chuẩn bị tổ chức giải đua xe m&aacute;y 390 cc v&agrave;o dịp Tết 2017.</p>\r\n\r\n<p>Trường đua phức hợp gồm đua ngựa, đua xe tại khu du lịch Đại Nam của &ocirc;ng Huỳnh Uy Dũng sắp ho&agrave;n thiện, chuẩn bị tổ chức giải đua xe m&aacute;y 390 cc v&agrave;o dịp Tết 2017.</p>\r\n\r\n<p>Trường đua phức hợp gồm đua ngựa, đua xe tại khu du lịch Đại Nam của &ocirc;ng Huỳnh Uy Dũng sắp ho&agrave;n thiện, chuẩn bị tổ chức giải đua xe m&aacute;y 390 cc v&agrave;o dịp Tết 2017.Trường đua phức hợp gồm đua ngựa, đua xe tại khu du lịch Đại Nam của &ocirc;ng Huỳnh Uy Dũng sắp ho&agrave;n thiện, chuẩn bị tổ chức giải đua xe m&aacute;y 390 cc v&agrave;o dịp Tết 2017.</p>\r\n\r\n<p>Trường đua phức hợp gồm đua ngựa, đua xe tại khu du lịch Đại Nam của &ocirc;ng Huỳnh Uy Dũng sắp ho&agrave;n thiện, chuẩn bị tổ chức giải đua xe m&aacute;y 390 cc v&agrave;o dịp Tết 2017.</p>\r\n', 'http://cafebiz.cafebizcdn.vn/zoom/650_320/2017/truong-dua-dai-nam-zing-1-1484919237196.jpg', '', 'activated', '0', '1', '1', '2017-01-20 18:39:59', '2017-01-20 18:40:45', '1'), ('6', 'Bí quyết ăn Tết vui vẻ dành cho người bận rộn', '', 'bi-quyet-an-tet-vui-ve-danh-cho-nguoi-ban-ron', 'Với dân công sở, thời gian về cuối năm thường eo hẹp, mà lại có vô khối thứ đổ lên đầu, làm sao để có thể cân bằng mọi thứ và tận hưởng một cái Tết đúng nghĩa?', '<p>Với d&acirc;n c&ocirc;ng sở, thời gian về cuối năm thường eo hẹp, m&agrave; lại c&oacute; v&ocirc; khối thứ đổ l&ecirc;n đầu, l&agrave;m sao để c&oacute; thể c&acirc;n bằng mọi thứ v&agrave; tận hưởng một c&aacute;i Tết đ&uacute;ng nghĩa?</p>\r\n\r\n<p>Với d&acirc;n c&ocirc;ng sở, thời gian về cuối năm thường eo hẹp, m&agrave; lại c&oacute; v&ocirc; khối thứ đổ l&ecirc;n đầu, l&agrave;m sao để c&oacute; thể c&acirc;n bằng mọi thứ v&agrave; tận hưởng một c&aacute;i Tết đ&uacute;ng nghĩa?</p>\r\n\r\n<p>Với d&acirc;n c&ocirc;ng sở, thời gian về cuối năm thường eo hẹp, m&agrave; lại c&oacute; v&ocirc; khối thứ đổ l&ecirc;n đầu, l&agrave;m sao để c&oacute; thể c&acirc;n bằng mọi thứ v&agrave; tận hưởng một c&aacute;i Tết đ&uacute;ng nghĩa?</p>\r\n\r\n<p>Với d&acirc;n c&ocirc;ng sở, thời gian về cuối năm thường eo hẹp, m&agrave; lại c&oacute; v&ocirc; khối thứ đổ l&ecirc;n đầu, l&agrave;m sao để c&oacute; thể c&acirc;n bằng mọi thứ v&agrave; tận hưởng một c&aacute;i Tết đ&uacute;ng nghĩa?</p>\r\n\r\n<p>Với d&acirc;n c&ocirc;ng sở, thời gian về cuối năm thường eo hẹp, m&agrave; lại c&oacute; v&ocirc; khối thứ đổ l&ecirc;n đầu, l&agrave;m sao để c&oacute; thể c&acirc;n bằng mọi thứ v&agrave; tận hưởng một c&aacute;i Tết đ&uacute;ng nghĩa?</p>\r\n\r\n<p>Với d&acirc;n c&ocirc;ng sở, thời gian về cuối năm thường eo hẹp, m&agrave; lại c&oacute; v&ocirc; khối thứ đổ l&ecirc;n đầu, l&agrave;m sao để c&oacute; thể c&acirc;n bằng mọi thứ v&agrave; tận hưởng một c&aacute;i Tết đ&uacute;ng nghĩa?</p>\r\n', 'http://cafebiz.cafebizcdn.vn/thumb_w/600/2017/img-2831-copy-252a8-1484897380037-crop-1484897397156-1484902315633-crop-1484902347132.jpg', '', 'activated', '0', '1', '1', '2017-01-20 18:42:24', '2017-01-20 18:42:24', '1'), ('7', 'Mức độ ô nhiễm ở Trung Quốc hiện được đặt trong tình trạng báo động đỏ - mức độ nghiêm trọng nhất hệ thống báo động nước này.', 'Video', 'muc-do-o-nhiem-o-trung-quoc-hien-duoc-dat-trong-tinh-trang-bao-dong-do-muc-do-nghiem-trong-nhat-he-thong-bao-dong-nuoc-nay', '', '<p>Mức độ &ocirc; nhiễm ở Trung Quốc hiện được đặt trong t&igrave;nh trạng b&aacute;o động đỏ - mức độ nghi&ecirc;m trọng nhất hệ thống b&aacute;o động nước n&agrave;y.</p>\r\n\r\n<p>Mức độ &ocirc; nhiễm ở Trung Quốc hiện được đặt trong t&igrave;nh trạng b&aacute;o động đỏ - mức độ nghi&ecirc;m trọng nhất hệ thống b&aacute;o động nước n&agrave;y.</p>\r\n\r\n<p>Mức độ &ocirc; nhiễm ở Trung Quốc hiện được đặt trong t&igrave;nh trạng b&aacute;o động đỏ - mức độ nghi&ecirc;m trọng nhất hệ thống b&aacute;o động nước n&agrave;y.&nbsp;Mức độ &ocirc; nhiễm ở Trung Quốc hiện được đặt trong t&igrave;nh trạng b&aacute;o động đỏ - mức độ nghi&ecirc;m trọng nhất hệ thống b&aacute;o động nước n&agrave;y.&nbsp;Mức độ &ocirc; nhiễm ở Trung Quốc hiện được đặt trong t&igrave;nh trạng b&aacute;o động đỏ - mức độ nghi&ecirc;m trọng nhất hệ thống b&aacute;o động nước n&agrave;y.&nbsp;Mức độ &ocirc; nhiễm ở Trung Quốc hiện được đặt trong t&igrave;nh trạng b&aacute;o động đỏ - mức độ nghi&ecirc;m trọng nhất hệ thống b&aacute;o động nước n&agrave;y.</p>\r\n\r\n<p>Mức độ &ocirc; nhiễm ở Trung Quốc hiện được đặt trong t&igrave;nh trạng b&aacute;o động đỏ - mức độ nghi&ecirc;m trọng nhất hệ thống b&aacute;o động nước n&agrave;y.&nbsp;Mức độ &ocirc; nhiễm ở Trung Quốc hiện được đặt trong t&igrave;nh trạng b&aacute;o động đỏ - mức độ nghi&ecirc;m trọng nhất hệ thống b&aacute;o động nước n&agrave;y.&nbsp;Mức độ &ocirc; nhiễm ở Trung Quốc hiện được đặt trong t&igrave;nh trạng b&aacute;o động đỏ - mức độ nghi&ecirc;m trọng nhất hệ thống b&aacute;o động nước n&agrave;y.&nbsp;Mức độ &ocirc; nhiễm ở Trung Quốc hiện được đặt trong t&igrave;nh trạng b&aacute;o động đỏ - mức độ nghi&ecirc;m trọng nhất hệ thống b&aacute;o động nước n&agrave;y.</p>\r\n\r\n<p>Mức độ &ocirc; nhiễm ở Trung Quốc hiện được đặt trong t&igrave;nh trạng b&aacute;o động đỏ - mức độ nghi&ecirc;m trọng nhất hệ thống b&aacute;o động nước n&agrave;y.&nbsp;Mức độ &ocirc; nhiễm ở Trung Quốc hiện được đặt trong t&igrave;nh trạng b&aacute;o động đỏ - mức độ nghi&ecirc;m trọng nhất hệ thống b&aacute;o động nước n&agrave;y.&nbsp;Mức độ &ocirc; nhiễm ở Trung Quốc hiện được đặt trong t&igrave;nh trạng b&aacute;o động đỏ - mức độ nghi&ecirc;m trọng nhất hệ thống b&aacute;o động nước n&agrave;y.&nbsp;Mức độ &ocirc; nhiễm ở Trung Quốc hiện được đặt trong t&igrave;nh trạng b&aacute;o động đỏ - mức độ nghi&ecirc;m trọng nhất hệ thống b&aacute;o động nước n&agrave;y.</p>\r\n\r\n<p>Mức độ &ocirc; nhiễm ở Trung Quốc hiện được đặt trong t&igrave;nh trạng b&aacute;o động đỏ - mức độ nghi&ecirc;m trọng nhất hệ thống b&aacute;o động nước n&agrave;y.&nbsp;Mức độ &ocirc; nhiễm ở Trung Quốc hiện được đặt trong t&igrave;nh trạng b&aacute;o động đỏ - mức độ nghi&ecirc;m trọng nhất hệ thống b&aacute;o động nước n&agrave;y.&nbsp;Mức độ &ocirc; nhiễm ở Trung Quốc hiện được đặt trong t&igrave;nh trạng b&aacute;o động đỏ - mức độ nghi&ecirc;m trọng nhất hệ thống b&aacute;o động nước n&agrave;y.&nbsp;Mức độ &ocirc; nhiễm ở Trung Quốc hiện được đặt trong t&igrave;nh trạng b&aacute;o động đỏ - mức độ nghi&ecirc;m trọng nhất hệ thống b&aacute;o động nước n&agrave;y.</p>\r\n', 'http://cafebiz.cafebizcdn.vn/thumb_w/600/2017/24gates-videosixteenbynine1050-1484884155208-1484894265537.jpg', '', 'activated', '0', '1', '1', '2017-01-21 08:16:01', '2017-01-21 08:25:21', '1');
COMMIT;

-- ----------------------------
--  Table structure for `posts_categories`
-- ----------------------------
DROP TABLE IF EXISTS `posts_categories`;
CREATE TABLE `posts_categories` (
  `post_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `posts_categories_post_id_category_id_unique` (`post_id`,`category_id`),
  KEY `posts_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `posts_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_categories_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `posts_categories`
-- ----------------------------
BEGIN;
INSERT INTO `posts_categories` VALUES ('1', '1'), ('2', '1'), ('3', '1'), ('5', '1'), ('1', '2'), ('2', '2'), ('4', '2'), ('5', '2'), ('1', '3'), ('2', '3'), ('3', '3'), ('4', '3'), ('5', '3'), ('1', '4'), ('2', '4'), ('3', '4'), ('4', '4'), ('1', '5'), ('2', '5'), ('3', '5'), ('4', '5'), ('5', '5'), ('1', '6'), ('3', '6'), ('4', '6'), ('5', '6'), ('1', '7'), ('6', '7'), ('1', '8'), ('2', '8'), ('7', '8'), ('1', '10'), ('5', '11'), ('5', '12'), ('5', '13'), ('4', '17'), ('5', '18');
COMMIT;

-- ----------------------------
--  Table structure for `posts_tags`
-- ----------------------------
DROP TABLE IF EXISTS `posts_tags`;
CREATE TABLE `posts_tags` (
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `posts_tags_post_id_tag_id_unique` (`post_id`,`tag_id`),
  KEY `posts_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `posts_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `blog_tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `posts_tags`
-- ----------------------------
BEGIN;
INSERT INTO `posts_tags` VALUES ('1', '1'), ('6', '1'), ('6', '2');
COMMIT;

-- ----------------------------
--  Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_foreign` (`created_by`),
  KEY `roles_updated_by_foreign` (`updated_by`),
  CONSTRAINT `roles_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `roles_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `roles`
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES ('1', 'Super Admin', 'super-admin', null, null, '2017-01-19 12:37:23', '2017-01-19 12:37:23');
COMMIT;

-- ----------------------------
--  Table structure for `roles_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `roles_permissions`;
CREATE TABLE `roles_permissions` (
  `role_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `roles_permissions_role_id_permission_id_unique` (`role_id`,`permission_id`),
  KEY `roles_permissions_permission_id_foreign` (`permission_id`),
  CONSTRAINT `roles_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `roles_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `settings`
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `option_value` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_option_key_unique` (`option_key`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `settings`
-- ----------------------------
BEGIN;
INSERT INTO `settings` VALUES ('1', 'default_homepage', '1', '2017-01-19 13:04:41', '2017-01-19 13:04:41'), ('2', 'site_title', '', '2017-01-19 13:04:41', '2017-01-19 13:04:41'), ('3', 'site_logo', '', '2017-01-19 13:04:41', '2017-01-19 13:04:41'), ('4', 'favicon', '', '2017-01-19 13:04:41', '2017-01-19 13:04:41'), ('5', 'show_admin_bar', '1', '2017-01-19 13:04:56', '2017-01-19 14:33:52'), ('6', 'construction_mode', '0', '2017-01-19 13:04:56', '2017-01-19 13:04:56');
COMMIT;

-- ----------------------------
--  Table structure for `theme_options`
-- ----------------------------
DROP TABLE IF EXISTS `theme_options`;
CREATE TABLE `theme_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme_id` int(10) unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `theme_options_theme_id_key_unique` (`theme_id`,`key`),
  CONSTRAINT `theme_options_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `themes`
-- ----------------------------
DROP TABLE IF EXISTS `themes`;
CREATE TABLE `themes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `installed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `installed_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `themes_alias_unique` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `themes`
-- ----------------------------
BEGIN;
INSERT INTO `themes` VALUES ('1', 'cosmetics', '0', '0', null), ('2', 'sedna', '1', '1', '1.0.1'), ('3', 'nongdanviet', '0', '0', null);
COMMIT;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activation_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` enum('male','female','other') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'male',
  `status` enum('activated','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activated',
  `birthday` datetime DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_activity_at` timestamp NULL DEFAULT NULL,
  `disabled_until` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_created_by_foreign` (`created_by`),
  KEY `users_updated_by_foreign` (`updated_by`),
  CONSTRAINT `users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', 'admin', 'admin@webed.com', '$2y$10$bdXhVPjR0u.tyzKfdC40NOgOGK5jdnUUkCmsMzDj5ptpBea4L74bC', 'Super Admin', 'Admin', '0', null, null, null, null, 'male', 'activated', null, null, 'yw2lIMJBpuKtZtqkanMIPUg8s521QXeOVS8uY5G2fVG1zfGqIVYnamvD5FOx', null, null, '2017-01-28 15:32:09', null, null, null, '2017-01-19 12:37:38', '2017-01-28 15:32:09');
COMMIT;

-- ----------------------------
--  Table structure for `users_roles`
-- ----------------------------
DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `users_roles_user_id_role_id_unique` (`user_id`,`role_id`),
  KEY `users_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `users_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `users_roles`
-- ----------------------------
BEGIN;
INSERT INTO `users_roles` VALUES ('1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `view_trackers`
-- ----------------------------
DROP TABLE IF EXISTS `view_trackers`;
CREATE TABLE `view_trackers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `count` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `view_trackers_entity_entity_id_unique` (`entity`,`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `view_trackers`
-- ----------------------------
BEGIN;
INSERT INTO `view_trackers` VALUES ('1', 'WebEd\\Base\\Pages\\Models\\Page', '1', '156');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
