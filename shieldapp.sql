/*
 Navicat Premium Data Transfer

 Source Server         : LocalHost
 Source Server Type    : MySQL
 Source Server Version : 100428 (10.4.28-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : shieldapp

 Target Server Type    : MySQL
 Target Server Version : 100428 (10.4.28-MariaDB)
 File Encoding         : 65001

 Date: 26/09/2024 13:49:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `zip_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `addresses_order_id_foreign`(`order_id` ASC) USING BTREE,
  CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of addresses
-- ----------------------------

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `brands_slug_unique`(`slug` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brands
-- ----------------------------

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache
-- ----------------------------
INSERT INTO `cache` VALUES ('356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1727377300);
INSERT INTO `cache` VALUES ('356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1727377300;', 1727377300);
INSERT INTO `cache` VALUES ('a17961fa74e9275d529f489537f179c05d50c2f3', 'i:1;', 1727374909);
INSERT INTO `cache` VALUES ('a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1727374909;', 1727374909);
INSERT INTO `cache` VALUES ('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:162:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:10:\"view_brand\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:14:\"view_any_brand\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:12:\"create_brand\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:12:\"update_brand\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:13:\"restore_brand\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:17:\"restore_any_brand\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:15:\"replicate_brand\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:13:\"reorder_brand\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:12:\"delete_brand\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:16:\"delete_any_brand\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:18:\"force_delete_brand\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:22:\"force_delete_any_brand\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:20:\"view_cargoslaborales\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:24:\"view_any_cargoslaborales\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:22:\"create_cargoslaborales\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:22:\"update_cargoslaborales\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:23:\"restore_cargoslaborales\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:27:\"restore_any_cargoslaborales\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:25:\"replicate_cargoslaborales\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:23:\"reorder_cargoslaborales\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:22:\"delete_cargoslaborales\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:26:\"delete_any_cargoslaborales\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:28:\"force_delete_cargoslaborales\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:32:\"force_delete_any_cargoslaborales\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:13:\"view_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:17:\"view_any_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:15:\"create_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:15:\"update_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:16:\"restore_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:20:\"restore_any_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:18:\"replicate_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:16:\"reorder_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:15:\"delete_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:19:\"delete_any_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:21:\"force_delete_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:25:\"force_delete_any_category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:17:\"view_departamento\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:21:\"view_any_departamento\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:19:\"create_departamento\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:19:\"update_departamento\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:20:\"restore_departamento\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:24:\"restore_any_departamento\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:22:\"replicate_departamento\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:20:\"reorder_departamento\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:19:\"delete_departamento\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:23:\"delete_any_departamento\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:25:\"force_delete_departamento\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:29:\"force_delete_any_departamento\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:13:\"view_distrito\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:17:\"view_any_distrito\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:15:\"create_distrito\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:15:\"update_distrito\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:16:\"restore_distrito\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:20:\"restore_any_distrito\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:18:\"replicate_distrito\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:16:\"reorder_distrito\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:15:\"delete_distrito\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:19:\"delete_any_distrito\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:21:\"force_delete_distrito\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:25:\"force_delete_any_distrito\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:13:\"view_empleado\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:17:\"view_any_empleado\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:62;a:4:{s:1:\"a\";i:63;s:1:\"b\";s:15:\"create_empleado\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:63;a:4:{s:1:\"a\";i:64;s:1:\"b\";s:15:\"update_empleado\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:64;a:4:{s:1:\"a\";i:65;s:1:\"b\";s:16:\"restore_empleado\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:65;a:4:{s:1:\"a\";i:66;s:1:\"b\";s:20:\"restore_any_empleado\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:66;a:4:{s:1:\"a\";i:67;s:1:\"b\";s:18:\"replicate_empleado\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:67;a:4:{s:1:\"a\";i:68;s:1:\"b\";s:16:\"reorder_empleado\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:68;a:4:{s:1:\"a\";i:69;s:1:\"b\";s:15:\"delete_empleado\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:69;a:4:{s:1:\"a\";i:70;s:1:\"b\";s:19:\"delete_any_empleado\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:70;a:4:{s:1:\"a\";i:71;s:1:\"b\";s:21:\"force_delete_empleado\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:71;a:4:{s:1:\"a\";i:72;s:1:\"b\";s:25:\"force_delete_any_empleado\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:72;a:4:{s:1:\"a\";i:73;s:1:\"b\";s:12:\"view_empresa\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:73;a:4:{s:1:\"a\";i:74;s:1:\"b\";s:16:\"view_any_empresa\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:74;a:3:{s:1:\"a\";i:75;s:1:\"b\";s:14:\"create_empresa\";s:1:\"c\";s:3:\"web\";}i:75;a:4:{s:1:\"a\";i:76;s:1:\"b\";s:14:\"update_empresa\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:76;a:4:{s:1:\"a\";i:77;s:1:\"b\";s:15:\"restore_empresa\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:77;a:4:{s:1:\"a\";i:78;s:1:\"b\";s:19:\"restore_any_empresa\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:78;a:4:{s:1:\"a\";i:79;s:1:\"b\";s:17:\"replicate_empresa\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:79;a:4:{s:1:\"a\";i:80;s:1:\"b\";s:15:\"reorder_empresa\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:80;a:4:{s:1:\"a\";i:81;s:1:\"b\";s:14:\"delete_empresa\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:81;a:4:{s:1:\"a\";i:82;s:1:\"b\";s:18:\"delete_any_empresa\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:82;a:4:{s:1:\"a\";i:83;s:1:\"b\";s:20:\"force_delete_empresa\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:83;a:4:{s:1:\"a\";i:84;s:1:\"b\";s:24:\"force_delete_any_empresa\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:84;a:4:{s:1:\"a\";i:85;s:1:\"b\";s:10:\"view_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:85;a:4:{s:1:\"a\";i:86;s:1:\"b\";s:14:\"view_any_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:86;a:4:{s:1:\"a\";i:87;s:1:\"b\";s:12:\"create_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:87;a:4:{s:1:\"a\";i:88;s:1:\"b\";s:12:\"update_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:88;a:4:{s:1:\"a\";i:89;s:1:\"b\";s:13:\"restore_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:89;a:4:{s:1:\"a\";i:90;s:1:\"b\";s:17:\"restore_any_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:90;a:4:{s:1:\"a\";i:91;s:1:\"b\";s:15:\"replicate_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:91;a:4:{s:1:\"a\";i:92;s:1:\"b\";s:13:\"reorder_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:92;a:4:{s:1:\"a\";i:93;s:1:\"b\";s:12:\"delete_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:93;a:4:{s:1:\"a\";i:94;s:1:\"b\";s:16:\"delete_any_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:94;a:4:{s:1:\"a\";i:95;s:1:\"b\";s:18:\"force_delete_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:95;a:4:{s:1:\"a\";i:96;s:1:\"b\";s:22:\"force_delete_any_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:96;a:4:{s:1:\"a\";i:97;s:1:\"b\";s:12:\"view_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:97;a:4:{s:1:\"a\";i:98;s:1:\"b\";s:16:\"view_any_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:98;a:4:{s:1:\"a\";i:99;s:1:\"b\";s:14:\"create_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:99;a:4:{s:1:\"a\";i:100;s:1:\"b\";s:14:\"update_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:100;a:4:{s:1:\"a\";i:101;s:1:\"b\";s:15:\"restore_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:101;a:4:{s:1:\"a\";i:102;s:1:\"b\";s:19:\"restore_any_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:102;a:4:{s:1:\"a\";i:103;s:1:\"b\";s:17:\"replicate_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:103;a:4:{s:1:\"a\";i:104;s:1:\"b\";s:15:\"reorder_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:104;a:4:{s:1:\"a\";i:105;s:1:\"b\";s:14:\"delete_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:105;a:4:{s:1:\"a\";i:106;s:1:\"b\";s:18:\"delete_any_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:106;a:4:{s:1:\"a\";i:107;s:1:\"b\";s:20:\"force_delete_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:107;a:4:{s:1:\"a\";i:108;s:1:\"b\";s:24:\"force_delete_any_product\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:108;a:4:{s:1:\"a\";i:109;s:1:\"b\";s:16:\"view_profesiones\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:109;a:4:{s:1:\"a\";i:110;s:1:\"b\";s:20:\"view_any_profesiones\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:110;a:4:{s:1:\"a\";i:111;s:1:\"b\";s:18:\"create_profesiones\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:111;a:4:{s:1:\"a\";i:112;s:1:\"b\";s:18:\"update_profesiones\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:112;a:4:{s:1:\"a\";i:113;s:1:\"b\";s:19:\"restore_profesiones\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:113;a:4:{s:1:\"a\";i:114;s:1:\"b\";s:23:\"restore_any_profesiones\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:114;a:4:{s:1:\"a\";i:115;s:1:\"b\";s:21:\"replicate_profesiones\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:115;a:4:{s:1:\"a\";i:116;s:1:\"b\";s:19:\"reorder_profesiones\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:116;a:4:{s:1:\"a\";i:117;s:1:\"b\";s:18:\"delete_profesiones\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:117;a:4:{s:1:\"a\";i:118;s:1:\"b\";s:22:\"delete_any_profesiones\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:118;a:4:{s:1:\"a\";i:119;s:1:\"b\";s:24:\"force_delete_profesiones\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:119;a:4:{s:1:\"a\";i:120;s:1:\"b\";s:28:\"force_delete_any_profesiones\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:120;a:4:{s:1:\"a\";i:121;s:1:\"b\";s:9:\"view_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:121;a:4:{s:1:\"a\";i:122;s:1:\"b\";s:13:\"view_any_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:122;a:4:{s:1:\"a\";i:123;s:1:\"b\";s:11:\"create_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:123;a:4:{s:1:\"a\";i:124;s:1:\"b\";s:11:\"update_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:124;a:4:{s:1:\"a\";i:125;s:1:\"b\";s:11:\"delete_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:125;a:4:{s:1:\"a\";i:126;s:1:\"b\";s:15:\"delete_any_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:126;a:4:{s:1:\"a\";i:127;s:1:\"b\";s:9:\"view_ruta\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:127;a:4:{s:1:\"a\";i:128;s:1:\"b\";s:13:\"view_any_ruta\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:128;a:4:{s:1:\"a\";i:129;s:1:\"b\";s:11:\"create_ruta\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:129;a:4:{s:1:\"a\";i:130;s:1:\"b\";s:11:\"update_ruta\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:130;a:4:{s:1:\"a\";i:131;s:1:\"b\";s:12:\"restore_ruta\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:131;a:4:{s:1:\"a\";i:132;s:1:\"b\";s:16:\"restore_any_ruta\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:132;a:4:{s:1:\"a\";i:133;s:1:\"b\";s:14:\"replicate_ruta\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:133;a:4:{s:1:\"a\";i:134;s:1:\"b\";s:12:\"reorder_ruta\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:134;a:4:{s:1:\"a\";i:135;s:1:\"b\";s:11:\"delete_ruta\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:135;a:4:{s:1:\"a\";i:136;s:1:\"b\";s:15:\"delete_any_ruta\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:136;a:4:{s:1:\"a\";i:137;s:1:\"b\";s:17:\"force_delete_ruta\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:137;a:4:{s:1:\"a\";i:138;s:1:\"b\";s:21:\"force_delete_any_ruta\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:138;a:4:{s:1:\"a\";i:139;s:1:\"b\";s:15:\"view_transporte\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:139;a:4:{s:1:\"a\";i:140;s:1:\"b\";s:19:\"view_any_transporte\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:140;a:4:{s:1:\"a\";i:141;s:1:\"b\";s:17:\"create_transporte\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:141;a:4:{s:1:\"a\";i:142;s:1:\"b\";s:17:\"update_transporte\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:142;a:4:{s:1:\"a\";i:143;s:1:\"b\";s:18:\"restore_transporte\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:143;a:4:{s:1:\"a\";i:144;s:1:\"b\";s:22:\"restore_any_transporte\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:144;a:4:{s:1:\"a\";i:145;s:1:\"b\";s:20:\"replicate_transporte\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:145;a:4:{s:1:\"a\";i:146;s:1:\"b\";s:18:\"reorder_transporte\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:146;a:4:{s:1:\"a\";i:147;s:1:\"b\";s:17:\"delete_transporte\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:147;a:4:{s:1:\"a\";i:148;s:1:\"b\";s:21:\"delete_any_transporte\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:148;a:4:{s:1:\"a\";i:149;s:1:\"b\";s:23:\"force_delete_transporte\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:149;a:4:{s:1:\"a\";i:150;s:1:\"b\";s:27:\"force_delete_any_transporte\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:150;a:4:{s:1:\"a\";i:151;s:1:\"b\";s:9:\"view_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:151;a:4:{s:1:\"a\";i:152;s:1:\"b\";s:13:\"view_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:152;a:4:{s:1:\"a\";i:153;s:1:\"b\";s:11:\"create_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:153;a:4:{s:1:\"a\";i:154;s:1:\"b\";s:11:\"update_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:154;a:4:{s:1:\"a\";i:155;s:1:\"b\";s:12:\"restore_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:155;a:4:{s:1:\"a\";i:156;s:1:\"b\";s:16:\"restore_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:156;a:4:{s:1:\"a\";i:157;s:1:\"b\";s:14:\"replicate_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:157;a:4:{s:1:\"a\";i:158;s:1:\"b\";s:12:\"reorder_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:158;a:4:{s:1:\"a\";i:159;s:1:\"b\";s:11:\"delete_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:159;a:4:{s:1:\"a\";i:160;s:1:\"b\";s:15:\"delete_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:160;a:4:{s:1:\"a\";i:161;s:1:\"b\";s:17:\"force_delete_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:161;a:4:{s:1:\"a\";i:162;s:1:\"b\";s:21:\"force_delete_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}}s:5:\"roles\";a:2:{i:0;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:11:\"super_admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:10:\"Secretario\";s:1:\"c\";s:3:\"web\";}}}', 1727462924);

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache_locks
-- ----------------------------

-- ----------------------------
-- Table structure for cargos_laborales
-- ----------------------------
DROP TABLE IF EXISTS `cargos_laborales`;
CREATE TABLE `cargos_laborales`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cargos_laborales
-- ----------------------------
INSERT INTO `cargos_laborales` VALUES (1, 'Administrador', 'Encargado de supervisar todas las operaciones de la empresa', 1, '2024-09-26 16:27:36', '2024-09-26 16:38:45');
INSERT INTO `cargos_laborales` VALUES (2, 'Secretario', 'Control de la informaciones la empresa', 1, '2024-09-26 16:27:56', '2024-09-26 16:27:56');
INSERT INTO `cargos_laborales` VALUES (3, 'Motorista', 'Encargado de manejar con precaución las unidades de transporte', 1, '2024-09-26 16:28:22', '2024-09-26 16:28:22');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `categories_slug_unique`(`slug` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Transporte Colectivo', 'transporte-colectivo', '01J8QV9YSXTZA0A2FJGN9V4F4N.png', 1, '2024-09-26 19:00:42', '2024-09-26 19:00:42');

-- ----------------------------
-- Table structure for departamentos
-- ----------------------------
DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departamentos
-- ----------------------------
INSERT INTO `departamentos` VALUES (1, '00', 'Otros', 1, '2024-09-26 16:19:32', '2024-09-26 18:51:29');
INSERT INTO `departamentos` VALUES (2, '01', 'Ahuchapán', 1, '2024-09-26 16:19:38', '2024-09-26 18:52:05');
INSERT INTO `departamentos` VALUES (3, '02', 'Santa Ana', 1, '2024-09-26 16:19:49', '2024-09-26 18:52:18');
INSERT INTO `departamentos` VALUES (4, '03', 'Son Sonate', 1, '2024-09-26 18:50:22', '2024-09-26 18:52:31');
INSERT INTO `departamentos` VALUES (5, '04', 'Chalatenango', 1, '2024-09-26 18:50:28', '2024-09-26 18:52:45');
INSERT INTO `departamentos` VALUES (6, '05', 'La Libertad', 1, '2024-09-26 18:50:34', '2024-09-26 18:52:58');
INSERT INTO `departamentos` VALUES (7, '06', 'San Salvador', 1, '2024-09-26 18:53:05', '2024-09-26 18:53:17');

-- ----------------------------
-- Table structure for distritos
-- ----------------------------
DROP TABLE IF EXISTS `distritos`;
CREATE TABLE `distritos`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `departamento_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `distritos_departamento_foreign`(`departamento_id` ASC) USING BTREE,
  CONSTRAINT `distritos_departamento_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of distritos
-- ----------------------------
INSERT INTO `distritos` VALUES (1, '00', 'Otro', 1, '2024-09-26 16:22:22', '2024-09-26 18:54:52');
INSERT INTO `distritos` VALUES (2, '13', 'Ahuchapán Norte', 2, '2024-09-26 16:26:25', '2024-09-26 18:55:11');
INSERT INTO `distritos` VALUES (3, '14', 'Ahuchapán Centro', 2, '2024-09-26 16:26:51', '2024-09-26 18:55:35');
INSERT INTO `distritos` VALUES (4, '23', 'San Miguel', 3, '2024-09-26 16:27:00', '2024-09-26 16:27:00');
INSERT INTO `distritos` VALUES (5, '14', 'Mena', 1, '2024-09-26 18:54:21', '2024-09-26 18:54:21');
INSERT INTO `distritos` VALUES (6, '14', 'Mena', 1, '2024-09-26 18:54:26', '2024-09-26 18:54:26');
INSERT INTO `distritos` VALUES (7, '14', 'Mena', 1, '2024-09-26 18:54:31', '2024-09-26 18:54:31');
INSERT INTO `distritos` VALUES (8, '15', 'Ahuchapán Sur', 2, '2024-09-26 18:55:51', '2024-09-26 18:56:05');

-- ----------------------------
-- Table structure for empleados
-- ----------------------------
DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `birthdate` date NOT NULL,
  `gender` enum('M','F') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'M',
  `marital_status` enum('Soltero/a','Casado/a','Divorciado/a','Viudo/a') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Soltero/a',
  `marital_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `marital_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dui` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `afp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nrc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary_day` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary_month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contract` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contract_start` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contract_end` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vacation_start` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vacation_end` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary_xtra_hour_day` decimal(10, 2) NOT NULL,
  `salary_xtra_hour_night` decimal(10, 2) NOT NULL,
  `contract_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `departamento_id` bigint UNSIGNED NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `empresa_id` bigint UNSIGNED NOT NULL,
  `cargo_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `empleados_departamento_id_foreign`(`departamento_id` ASC) USING BTREE,
  INDEX `empleados_distrito_id_foreign`(`distrito_id` ASC) USING BTREE,
  INDEX `empleados_empresa_id_foreign`(`empresa_id` ASC) USING BTREE,
  INDEX `empleados_cargo_id_foreign`(`cargo_id` ASC) USING BTREE,
  CONSTRAINT `empleados_cargo_id_foreign` FOREIGN KEY (`cargo_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `empleados_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `empleados_distrito_id_foreign` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `empleados_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of empleados
-- ----------------------------

-- ----------------------------
-- Table structure for empresas
-- ----------------------------
DROP TABLE IF EXISTS `empresas`;
CREATE TABLE `empresas`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comercial_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nrc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `web` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `departamento_id` bigint UNSIGNED NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `empresas_departamento_id_foreign`(`departamento_id` ASC) USING BTREE,
  INDEX `empresas_distrito_id_foreign`(`distrito_id` ASC) USING BTREE,
  CONSTRAINT `empresas_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `empresas_distrito_id_foreign` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of empresas
-- ----------------------------
INSERT INTO `empresas` VALUES (1, 'Conexiones y más - Transporte Colectivo', 'Transporte Colectivo', 'Transporte colectivo', '232345-0', '1314-120587-101-4', '4103002776', 'ventas@conexionesymas.sv', 'conexionesymas.sv', '\"empresa\\/01J8QSRF1NKM9KXPTE3TPQJMBB.png\"', 1, 2, '7567 OLD STAGE RD GLEN BURNIE, MD 21061-3806', '2024-09-26 18:33:41', '2024-09-26 18:33:41');
INSERT INTO `empresas` VALUES (2, 'Conexiones y más - Nexion Travel', 'Viajes', 'Transporte colectivo', '232345-0', '1314-120587-101-4', '4103002776', 'ventas@conexionesymas.sv', 'conexionesymas.sv', '\"empresa\\/01J8QSRF1NKM9KXPTE3TPQJMBB.png\"', 1, 2, '7567 OLD STAGE RD GLEN BURNIE, MD 21061-3806', '2024-09-26 18:46:58', '2024-09-26 18:47:57');
INSERT INTO `empresas` VALUES (3, 'Conexiones y más - Importadora', 'Importaciones', 'Transporte colectivo', '232345-0', '1314-120587-101-4', '4103002776', 'ventas@conexionesymas.sv', 'conexionesymas.sv', '\"empresa\\/01J8QSRF1NKM9KXPTE3TPQJMBB.png\"', 1, 2, '7567 OLD STAGE RD GLEN BURNIE, MD 21061-3806', '2024-09-26 18:47:04', '2024-09-26 18:48:15');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cancelled_at` int NULL DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_batches
-- ----------------------------

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED NULL DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` VALUES (3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2024_09_19_041515_create_categories_table', 1);
INSERT INTO `migrations` VALUES (5, '2024_09_19_041559_create_brands_table', 1);
INSERT INTO `migrations` VALUES (6, '2024_09_19_041625_create_products_table', 1);
INSERT INTO `migrations` VALUES (7, '2024_09_19_041646_create_orders_table', 1);
INSERT INTO `migrations` VALUES (8, '2024_09_19_041703_create_order_items_table', 1);
INSERT INTO `migrations` VALUES (9, '2024_09_19_041726_create_addresses_table', 1);
INSERT INTO `migrations` VALUES (10, '2024_09_21_002810_create_vehicles_table', 1);
INSERT INTO `migrations` VALUES (11, '2024_09_23_204447_create_departamentos_table', 1);
INSERT INTO `migrations` VALUES (12, '2024_09_24_001708_create_distritos_table', 1);
INSERT INTO `migrations` VALUES (13, '2024_09_24_005927_create_profesiones_table', 1);
INSERT INTO `migrations` VALUES (14, '2024_09_24_011525_create_empresas_table', 1);
INSERT INTO `migrations` VALUES (15, '2024_09_24_024658_create_cargos_laborales_table', 1);
INSERT INTO `migrations` VALUES (16, '2024_09_24_032115_create_empleados_table', 1);
INSERT INTO `migrations` VALUES (17, '2024_09_24_171822_create_rutas_table', 1);
INSERT INTO `migrations` VALUES (18, '2024_09_24_172810_create_transportes_table', 1);
INSERT INTO `migrations` VALUES (19, '2024_09_26_150555_create_permission_tables', 1);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_id` ASC, `model_type` ASC) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id` ASC, `model_type` ASC) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 2);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 1);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 2);
INSERT INTO `model_has_roles` VALUES (3, 'App\\Models\\User', 3);

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL DEFAULT 1,
  `unit_amount` decimal(10, 2) NULL DEFAULT NULL,
  `total_amount` decimal(10, 2) NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_items_order_id_foreign`(`order_id` ASC) USING BTREE,
  INDEX `order_items_product_id_foreign`(`product_id` ASC) USING BTREE,
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `grand_total` decimal(10, 2) NULL DEFAULT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` enum('new','pending','processing','shipped','delivered','canceled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'USD',
  `shipping_amount` decimal(10, 2) NULL DEFAULT NULL,
  `shipping_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orders_user_id_foreign`(`user_id` ASC) USING BTREE,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permissions_name_guard_name_unique`(`name` ASC, `guard_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 163 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'view_brand', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (2, 'view_any_brand', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (3, 'create_brand', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (4, 'update_brand', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (5, 'restore_brand', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (6, 'restore_any_brand', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (7, 'replicate_brand', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (8, 'reorder_brand', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (9, 'delete_brand', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (10, 'delete_any_brand', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (11, 'force_delete_brand', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (12, 'force_delete_any_brand', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (13, 'view_cargoslaborales', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (14, 'view_any_cargoslaborales', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (15, 'create_cargoslaborales', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (16, 'update_cargoslaborales', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (17, 'restore_cargoslaborales', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (18, 'restore_any_cargoslaborales', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (19, 'replicate_cargoslaborales', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (20, 'reorder_cargoslaborales', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (21, 'delete_cargoslaborales', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (22, 'delete_any_cargoslaborales', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (23, 'force_delete_cargoslaborales', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (24, 'force_delete_any_cargoslaborales', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (25, 'view_category', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (26, 'view_any_category', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (27, 'create_category', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (28, 'update_category', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (29, 'restore_category', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (30, 'restore_any_category', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (31, 'replicate_category', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (32, 'reorder_category', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (33, 'delete_category', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (34, 'delete_any_category', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (35, 'force_delete_category', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (36, 'force_delete_any_category', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (37, 'view_departamento', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (38, 'view_any_departamento', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (39, 'create_departamento', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (40, 'update_departamento', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (41, 'restore_departamento', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (42, 'restore_any_departamento', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (43, 'replicate_departamento', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (44, 'reorder_departamento', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (45, 'delete_departamento', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (46, 'delete_any_departamento', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (47, 'force_delete_departamento', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (48, 'force_delete_any_departamento', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (49, 'view_distrito', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (50, 'view_any_distrito', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (51, 'create_distrito', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (52, 'update_distrito', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (53, 'restore_distrito', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (54, 'restore_any_distrito', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (55, 'replicate_distrito', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (56, 'reorder_distrito', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (57, 'delete_distrito', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (58, 'delete_any_distrito', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (59, 'force_delete_distrito', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (60, 'force_delete_any_distrito', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (61, 'view_empleado', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (62, 'view_any_empleado', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (63, 'create_empleado', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (64, 'update_empleado', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (65, 'restore_empleado', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (66, 'restore_any_empleado', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (67, 'replicate_empleado', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (68, 'reorder_empleado', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (69, 'delete_empleado', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (70, 'delete_any_empleado', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (71, 'force_delete_empleado', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (72, 'force_delete_any_empleado', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (73, 'view_empresa', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (74, 'view_any_empresa', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (75, 'create_empresa', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (76, 'update_empresa', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (77, 'restore_empresa', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (78, 'restore_any_empresa', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (79, 'replicate_empresa', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (80, 'reorder_empresa', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (81, 'delete_empresa', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (82, 'delete_any_empresa', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (83, 'force_delete_empresa', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (84, 'force_delete_any_empresa', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (85, 'view_order', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (86, 'view_any_order', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (87, 'create_order', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (88, 'update_order', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (89, 'restore_order', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (90, 'restore_any_order', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (91, 'replicate_order', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (92, 'reorder_order', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (93, 'delete_order', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (94, 'delete_any_order', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (95, 'force_delete_order', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (96, 'force_delete_any_order', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (97, 'view_product', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (98, 'view_any_product', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (99, 'create_product', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (100, 'update_product', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (101, 'restore_product', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (102, 'restore_any_product', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (103, 'replicate_product', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (104, 'reorder_product', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (105, 'delete_product', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (106, 'delete_any_product', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (107, 'force_delete_product', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (108, 'force_delete_any_product', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (109, 'view_profesiones', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (110, 'view_any_profesiones', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (111, 'create_profesiones', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (112, 'update_profesiones', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (113, 'restore_profesiones', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (114, 'restore_any_profesiones', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (115, 'replicate_profesiones', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (116, 'reorder_profesiones', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (117, 'delete_profesiones', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (118, 'delete_any_profesiones', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (119, 'force_delete_profesiones', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (120, 'force_delete_any_profesiones', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (121, 'view_role', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (122, 'view_any_role', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (123, 'create_role', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (124, 'update_role', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (125, 'delete_role', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (126, 'delete_any_role', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `permissions` VALUES (127, 'view_ruta', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (128, 'view_any_ruta', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (129, 'create_ruta', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (130, 'update_ruta', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (131, 'restore_ruta', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (132, 'restore_any_ruta', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (133, 'replicate_ruta', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (134, 'reorder_ruta', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (135, 'delete_ruta', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (136, 'delete_any_ruta', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (137, 'force_delete_ruta', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (138, 'force_delete_any_ruta', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (139, 'view_transporte', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (140, 'view_any_transporte', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (141, 'create_transporte', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (142, 'update_transporte', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (143, 'restore_transporte', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (144, 'restore_any_transporte', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (145, 'replicate_transporte', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (146, 'reorder_transporte', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (147, 'delete_transporte', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (148, 'delete_any_transporte', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (149, 'force_delete_transporte', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (150, 'force_delete_any_transporte', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (151, 'view_user', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (152, 'view_any_user', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (153, 'create_user', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (154, 'update_user', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (155, 'restore_user', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (156, 'restore_any_user', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (157, 'replicate_user', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (158, 'reorder_user', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (159, 'delete_user', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (160, 'delete_any_user', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (161, 'force_delete_user', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');
INSERT INTO `permissions` VALUES (162, 'force_delete_any_user', 'web', '2024-09-26 16:13:11', '2024-09-26 16:13:11');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint UNSIGNED NOT NULL,
  `brand_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `price` decimal(10, 2) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `in_stock` tinyint(1) NOT NULL DEFAULT 1,
  `on_sale` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `products_slug_unique`(`slug` ASC) USING BTREE,
  INDEX `products_category_id_foreign`(`category_id` ASC) USING BTREE,
  INDEX `products_brand_id_foreign`(`brand_id` ASC) USING BTREE,
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------

-- ----------------------------
-- Table structure for profesiones
-- ----------------------------
DROP TABLE IF EXISTS `profesiones`;
CREATE TABLE `profesiones`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profesiones
-- ----------------------------
INSERT INTO `profesiones` VALUES (1, 'Ing. Sistemas Informáticos', '2024-09-26 16:39:05', '2024-09-26 16:39:05');

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id` ASC) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO `role_has_permissions` VALUES (1, 2);
INSERT INTO `role_has_permissions` VALUES (1, 3);
INSERT INTO `role_has_permissions` VALUES (2, 2);
INSERT INTO `role_has_permissions` VALUES (3, 2);
INSERT INTO `role_has_permissions` VALUES (4, 2);
INSERT INTO `role_has_permissions` VALUES (5, 2);
INSERT INTO `role_has_permissions` VALUES (6, 2);
INSERT INTO `role_has_permissions` VALUES (7, 2);
INSERT INTO `role_has_permissions` VALUES (8, 2);
INSERT INTO `role_has_permissions` VALUES (9, 2);
INSERT INTO `role_has_permissions` VALUES (10, 2);
INSERT INTO `role_has_permissions` VALUES (11, 2);
INSERT INTO `role_has_permissions` VALUES (12, 2);
INSERT INTO `role_has_permissions` VALUES (13, 2);
INSERT INTO `role_has_permissions` VALUES (14, 2);
INSERT INTO `role_has_permissions` VALUES (14, 3);
INSERT INTO `role_has_permissions` VALUES (15, 2);
INSERT INTO `role_has_permissions` VALUES (15, 3);
INSERT INTO `role_has_permissions` VALUES (16, 2);
INSERT INTO `role_has_permissions` VALUES (16, 3);
INSERT INTO `role_has_permissions` VALUES (17, 2);
INSERT INTO `role_has_permissions` VALUES (18, 2);
INSERT INTO `role_has_permissions` VALUES (19, 2);
INSERT INTO `role_has_permissions` VALUES (20, 2);
INSERT INTO `role_has_permissions` VALUES (21, 2);
INSERT INTO `role_has_permissions` VALUES (21, 3);
INSERT INTO `role_has_permissions` VALUES (22, 2);
INSERT INTO `role_has_permissions` VALUES (23, 2);
INSERT INTO `role_has_permissions` VALUES (24, 2);
INSERT INTO `role_has_permissions` VALUES (25, 2);
INSERT INTO `role_has_permissions` VALUES (25, 3);
INSERT INTO `role_has_permissions` VALUES (26, 2);
INSERT INTO `role_has_permissions` VALUES (26, 3);
INSERT INTO `role_has_permissions` VALUES (27, 2);
INSERT INTO `role_has_permissions` VALUES (27, 3);
INSERT INTO `role_has_permissions` VALUES (28, 2);
INSERT INTO `role_has_permissions` VALUES (28, 3);
INSERT INTO `role_has_permissions` VALUES (29, 2);
INSERT INTO `role_has_permissions` VALUES (29, 3);
INSERT INTO `role_has_permissions` VALUES (30, 2);
INSERT INTO `role_has_permissions` VALUES (30, 3);
INSERT INTO `role_has_permissions` VALUES (31, 2);
INSERT INTO `role_has_permissions` VALUES (31, 3);
INSERT INTO `role_has_permissions` VALUES (32, 2);
INSERT INTO `role_has_permissions` VALUES (32, 3);
INSERT INTO `role_has_permissions` VALUES (33, 2);
INSERT INTO `role_has_permissions` VALUES (33, 3);
INSERT INTO `role_has_permissions` VALUES (34, 2);
INSERT INTO `role_has_permissions` VALUES (34, 3);
INSERT INTO `role_has_permissions` VALUES (35, 2);
INSERT INTO `role_has_permissions` VALUES (35, 3);
INSERT INTO `role_has_permissions` VALUES (36, 2);
INSERT INTO `role_has_permissions` VALUES (36, 3);
INSERT INTO `role_has_permissions` VALUES (37, 2);
INSERT INTO `role_has_permissions` VALUES (38, 2);
INSERT INTO `role_has_permissions` VALUES (39, 2);
INSERT INTO `role_has_permissions` VALUES (40, 2);
INSERT INTO `role_has_permissions` VALUES (41, 2);
INSERT INTO `role_has_permissions` VALUES (42, 2);
INSERT INTO `role_has_permissions` VALUES (43, 2);
INSERT INTO `role_has_permissions` VALUES (44, 2);
INSERT INTO `role_has_permissions` VALUES (45, 2);
INSERT INTO `role_has_permissions` VALUES (46, 2);
INSERT INTO `role_has_permissions` VALUES (47, 2);
INSERT INTO `role_has_permissions` VALUES (48, 2);
INSERT INTO `role_has_permissions` VALUES (49, 2);
INSERT INTO `role_has_permissions` VALUES (50, 2);
INSERT INTO `role_has_permissions` VALUES (51, 2);
INSERT INTO `role_has_permissions` VALUES (52, 2);
INSERT INTO `role_has_permissions` VALUES (53, 2);
INSERT INTO `role_has_permissions` VALUES (54, 2);
INSERT INTO `role_has_permissions` VALUES (55, 2);
INSERT INTO `role_has_permissions` VALUES (56, 2);
INSERT INTO `role_has_permissions` VALUES (57, 2);
INSERT INTO `role_has_permissions` VALUES (58, 2);
INSERT INTO `role_has_permissions` VALUES (59, 2);
INSERT INTO `role_has_permissions` VALUES (60, 2);
INSERT INTO `role_has_permissions` VALUES (61, 2);
INSERT INTO `role_has_permissions` VALUES (62, 2);
INSERT INTO `role_has_permissions` VALUES (63, 2);
INSERT INTO `role_has_permissions` VALUES (64, 2);
INSERT INTO `role_has_permissions` VALUES (65, 2);
INSERT INTO `role_has_permissions` VALUES (66, 2);
INSERT INTO `role_has_permissions` VALUES (67, 2);
INSERT INTO `role_has_permissions` VALUES (68, 2);
INSERT INTO `role_has_permissions` VALUES (69, 2);
INSERT INTO `role_has_permissions` VALUES (70, 2);
INSERT INTO `role_has_permissions` VALUES (71, 2);
INSERT INTO `role_has_permissions` VALUES (72, 2);
INSERT INTO `role_has_permissions` VALUES (73, 2);
INSERT INTO `role_has_permissions` VALUES (74, 2);
INSERT INTO `role_has_permissions` VALUES (76, 2);
INSERT INTO `role_has_permissions` VALUES (77, 2);
INSERT INTO `role_has_permissions` VALUES (78, 2);
INSERT INTO `role_has_permissions` VALUES (79, 2);
INSERT INTO `role_has_permissions` VALUES (80, 2);
INSERT INTO `role_has_permissions` VALUES (81, 2);
INSERT INTO `role_has_permissions` VALUES (82, 2);
INSERT INTO `role_has_permissions` VALUES (83, 2);
INSERT INTO `role_has_permissions` VALUES (84, 2);
INSERT INTO `role_has_permissions` VALUES (85, 2);
INSERT INTO `role_has_permissions` VALUES (86, 2);
INSERT INTO `role_has_permissions` VALUES (87, 2);
INSERT INTO `role_has_permissions` VALUES (88, 2);
INSERT INTO `role_has_permissions` VALUES (89, 2);
INSERT INTO `role_has_permissions` VALUES (90, 2);
INSERT INTO `role_has_permissions` VALUES (91, 2);
INSERT INTO `role_has_permissions` VALUES (92, 2);
INSERT INTO `role_has_permissions` VALUES (93, 2);
INSERT INTO `role_has_permissions` VALUES (94, 2);
INSERT INTO `role_has_permissions` VALUES (95, 2);
INSERT INTO `role_has_permissions` VALUES (96, 2);
INSERT INTO `role_has_permissions` VALUES (97, 2);
INSERT INTO `role_has_permissions` VALUES (98, 2);
INSERT INTO `role_has_permissions` VALUES (99, 2);
INSERT INTO `role_has_permissions` VALUES (100, 2);
INSERT INTO `role_has_permissions` VALUES (101, 2);
INSERT INTO `role_has_permissions` VALUES (102, 2);
INSERT INTO `role_has_permissions` VALUES (103, 2);
INSERT INTO `role_has_permissions` VALUES (104, 2);
INSERT INTO `role_has_permissions` VALUES (105, 2);
INSERT INTO `role_has_permissions` VALUES (106, 2);
INSERT INTO `role_has_permissions` VALUES (107, 2);
INSERT INTO `role_has_permissions` VALUES (108, 2);
INSERT INTO `role_has_permissions` VALUES (109, 2);
INSERT INTO `role_has_permissions` VALUES (110, 2);
INSERT INTO `role_has_permissions` VALUES (111, 2);
INSERT INTO `role_has_permissions` VALUES (112, 2);
INSERT INTO `role_has_permissions` VALUES (113, 2);
INSERT INTO `role_has_permissions` VALUES (114, 2);
INSERT INTO `role_has_permissions` VALUES (115, 2);
INSERT INTO `role_has_permissions` VALUES (116, 2);
INSERT INTO `role_has_permissions` VALUES (117, 2);
INSERT INTO `role_has_permissions` VALUES (118, 2);
INSERT INTO `role_has_permissions` VALUES (119, 2);
INSERT INTO `role_has_permissions` VALUES (120, 2);
INSERT INTO `role_has_permissions` VALUES (121, 2);
INSERT INTO `role_has_permissions` VALUES (122, 2);
INSERT INTO `role_has_permissions` VALUES (123, 2);
INSERT INTO `role_has_permissions` VALUES (124, 2);
INSERT INTO `role_has_permissions` VALUES (125, 2);
INSERT INTO `role_has_permissions` VALUES (126, 2);
INSERT INTO `role_has_permissions` VALUES (127, 2);
INSERT INTO `role_has_permissions` VALUES (128, 2);
INSERT INTO `role_has_permissions` VALUES (129, 2);
INSERT INTO `role_has_permissions` VALUES (130, 2);
INSERT INTO `role_has_permissions` VALUES (131, 2);
INSERT INTO `role_has_permissions` VALUES (132, 2);
INSERT INTO `role_has_permissions` VALUES (133, 2);
INSERT INTO `role_has_permissions` VALUES (134, 2);
INSERT INTO `role_has_permissions` VALUES (135, 2);
INSERT INTO `role_has_permissions` VALUES (136, 2);
INSERT INTO `role_has_permissions` VALUES (137, 2);
INSERT INTO `role_has_permissions` VALUES (138, 2);
INSERT INTO `role_has_permissions` VALUES (139, 2);
INSERT INTO `role_has_permissions` VALUES (140, 2);
INSERT INTO `role_has_permissions` VALUES (141, 2);
INSERT INTO `role_has_permissions` VALUES (142, 2);
INSERT INTO `role_has_permissions` VALUES (143, 2);
INSERT INTO `role_has_permissions` VALUES (144, 2);
INSERT INTO `role_has_permissions` VALUES (145, 2);
INSERT INTO `role_has_permissions` VALUES (146, 2);
INSERT INTO `role_has_permissions` VALUES (147, 2);
INSERT INTO `role_has_permissions` VALUES (148, 2);
INSERT INTO `role_has_permissions` VALUES (149, 2);
INSERT INTO `role_has_permissions` VALUES (150, 2);
INSERT INTO `role_has_permissions` VALUES (151, 2);
INSERT INTO `role_has_permissions` VALUES (152, 2);
INSERT INTO `role_has_permissions` VALUES (153, 2);
INSERT INTO `role_has_permissions` VALUES (154, 2);
INSERT INTO `role_has_permissions` VALUES (155, 2);
INSERT INTO `role_has_permissions` VALUES (156, 2);
INSERT INTO `role_has_permissions` VALUES (157, 2);
INSERT INTO `role_has_permissions` VALUES (158, 2);
INSERT INTO `role_has_permissions` VALUES (159, 2);
INSERT INTO `role_has_permissions` VALUES (160, 2);
INSERT INTO `role_has_permissions` VALUES (161, 2);
INSERT INTO `role_has_permissions` VALUES (162, 2);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_guard_name_unique`(`name` ASC, `guard_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'panel_user', 'web', '2024-09-26 16:12:37', '2024-09-26 16:12:37');
INSERT INTO `roles` VALUES (2, 'super_admin', 'web', '2024-09-26 16:13:10', '2024-09-26 16:13:10');
INSERT INTO `roles` VALUES (3, 'Secretario', 'web', '2024-09-26 16:29:19', '2024-09-26 16:29:19');

-- ----------------------------
-- Table structure for rutas
-- ----------------------------
DROP TABLE IF EXISTS `rutas`;
CREATE TABLE `rutas`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rutas
-- ----------------------------
INSERT INTO `rutas` VALUES (1, 'R-737', 'Chilanga-Gotera', 1, '2024-09-26 19:03:24', '2024-09-26 19:03:24');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id` ASC) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('S2lhx1QIYqqPMDfaeqGbTbzIaAkLoL6RMyWC35R5', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiTVQ4Wm45YW9SZ2F4eVhkTzBMQ09TQ3dlVWRYU0FHbmhNcVhEN3NDZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9zaGllbGQvcm9sZXMvMy9lZGl0Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJE9qTE82d29QMFVEWDdXcHpNbUZUNE80V0tiRi9SdGZKTzNmV0pnOEtpSVNMVFJFYUx5VktDIjtzOjg6ImZpbGFtZW50IjthOjA6e319', 1727372166);
INSERT INTO `sessions` VALUES ('WFqM6tGwVFDYyW2q31pUYOYnUiP7mWq3oxrFFHEU', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiVGZaSGw2aTJtcmJKSWdjVEJ1MTRzZEZ0RWxDUERjRktFdU1kTXJaRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9lbXBsZWFkb3MvY3JlYXRlIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJE9qTE82d29QMFVEWDdXcHpNbUZUNE80V0tiRi9SdGZKTzNmV0pnOEtpSVNMVFJFYUx5VktDIjtzOjg6ImZpbGFtZW50IjthOjA6e31zOjY6InRhYmxlcyI7YToxOntzOjI2OiJMaXN0RGVwYXJ0YW1lbnRvc19wZXJfcGFnZSI7czoxOiI1Ijt9fQ==', 1727380171);

-- ----------------------------
-- Table structure for transportes
-- ----------------------------
DROP TABLE IF EXISTS `transportes`;
CREATE TABLE `transportes`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruta_id` bigint UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transportes_ruta_id_foreign`(`ruta_id` ASC) USING BTREE,
  CONSTRAINT `transportes_ruta_id_foreign` FOREIGN KEY (`ruta_id`) REFERENCES `rutas` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transportes
-- ----------------------------
INSERT INTO `transportes` VALUES (1, 'P-12313', 'Bus que conduce de Gotera a chilanga', 1, 1, '2024-09-26 19:04:18', '2024-09-26 19:04:43');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin@admin.com', NULL, '$2y$12$OjLO6woP0UDX7WpzMmFT4O4WKbF/RtfJO3fWJg8KiISLTREaLyVKC', NULL, '2024-09-26 16:13:35', '2024-09-26 16:18:11');
INSERT INTO `users` VALUES (2, 'Secretario', 'secre@secre.com', NULL, '$2y$12$nOqT1ovu8mAuiD.aIkz2JuB0aMW./bfnOAcU1IdyibfUWoHkIM9Yi', NULL, '2024-09-26 16:29:44', '2024-09-26 17:20:48');
INSERT INTO `users` VALUES (3, 'prueba', 'prueba@prueba.com', NULL, '$2y$12$whui2rGbIUmNwXcmT/hpKuE9QuMK2X42FUcN8o.VCCSws7EyCt2pK', NULL, '2024-09-26 17:16:02', '2024-09-26 17:16:44');

-- ----------------------------
-- Table structure for vehicles
-- ----------------------------
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vehicles
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
