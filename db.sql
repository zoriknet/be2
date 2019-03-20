-- Adminer 4.7.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

#CREATE DATABASE IF NOT EXISTS `roi4cio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `roi4cio`;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1,	'Electronics',	NULL,	NULL),
(2,	'Toys',	NULL,	NULL),
(3,	'Machinery',	NULL,	NULL),
(4,	'Apparel',	NULL,	NULL);

DROP TABLE IF EXISTS `category_product`;
CREATE TABLE `category_product` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `category_product` (`id`, `category_id`, `product_id`) VALUES
(1,	3,	2),
(2,	4,	2),
(3,	1,	3),
(4,	3,	3),
(5,	2,	4),
(6,	3,	4),
(7,	2,	5),
(8,	1,	6),
(9,	2,	6),
(10,	3,	7),
(11,	2,	8),
(12,	4,	9);

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2019_03_18_075600_create_products_table',	1),
(4,	'2019_03_18_081734_create_categories_table',	2),
(5,	'2019_03_18_081932_create_category_product_table',	3);

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `products` (`id`, `title`, `price`, `created_at`, `updated_at`) VALUES
(1,	'God of War',	40.00,	'2019-03-18 08:59:51',	'2019-03-18 08:59:51'),
(2,	'Marvel',	55.00,	'2019-03-18 09:03:13',	'2019-03-18 09:03:13'),
(3,	'Odyssey',	123.00,	'2019-03-18 09:05:16',	'2019-03-18 09:05:16'),
(4,	'Hlam',	665.00,	'2019-03-18 09:05:40',	'2019-03-18 09:05:40'),
(5,	'Doom Duh',	325.00,	'2019-03-18 09:06:22',	'2019-03-18 09:06:22'),
(6,	'Sleep Sports Fitness',	424.00,	'2019-03-18 14:15:33',	'2019-03-18 14:15:33'),
(7,	'Gamaka',	54.00,	'2019-03-18 14:16:10',	'2019-03-18 14:16:10'),
(8,	'Leather Watch',	574.00,	'2019-03-18 14:17:28',	'2019-03-18 14:17:28'),
(9,	'Fitness Tracker',	74.00,	'2019-03-18 14:17:59',	'2019-03-18 14:17:59');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 2019-03-18 21:59:56
