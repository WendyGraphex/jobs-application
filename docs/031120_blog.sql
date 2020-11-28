-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 03 nov. 2020 à 13:01
-- Version du serveur :  5.7.28
-- Version de PHP :  5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `site_graphex`
--

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_blog_activity`
--
DELETE FROM `t_customer_blog_activity`;
DELETE FROM `t_customer_blog_activity_i18n`;
ALTER TABLE `t_customer_blog_activity_i18n` DROP FOREIGN KEY `customer_blog_activity_i18n_fk0` ;
ALTER TABLE `t_customer_blog_article_activity` DROP FOREIGN KEY `customer_blog_article_activity_fk0` ;
ALTER TABLE `t_customer_blog_article_activity` DROP FOREIGN KEY `customer_blog_article_activity_fk1` ;
ALTER TABLE `t_customer_blog_activity_menu_i18n` DROP FOREIGN KEY `customer_blog_activity_menu_fk0` ;
ALTER TABLE `t_customer_blog_article_i18n` DROP FOREIGN KEY   `customer_blog_article_i18n_fk0`;




DROP TABLE IF EXISTS `t_customer_blog_activity`;
CREATE TABLE IF NOT EXISTS `t_customer_blog_activity` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(48) COLLATE utf8_bin NOT NULL,
  `picture` varchar(64) COLLATE utf8_bin NOT NULL,
  `icon` varchar(64) COLLATE utf8_bin NOT NULL,
  `number_of_articles` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `lb` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `rb` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `level` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `is_active` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `state` enum('UPLOAD') COLLATE utf8_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `t_customer_blog_activity`
--


-- --------------------------------------------------------

--
-- Structure de la table `t_customer_blog_activity_i18n`
--

DROP TABLE IF EXISTS `t_customer_blog_activity_i18n`;
CREATE TABLE IF NOT EXISTS `t_customer_blog_activity_i18n` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) UNSIGNED NOT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `url` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_robots` varchar(30) COLLATE utf8_bin NOT NULL,
  `layout` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT 'default',
  `template` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT 'default',
  `content` text COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `start_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_blog_activity_i18n_fk0` (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


-- --------------------------------------------------------

--
-- Structure de la table `t_customer_blog_activity_menu`
--

DROP TABLE IF EXISTS `t_customer_blog_activity_menu`;
CREATE TABLE IF NOT EXISTS `t_customer_blog_activity_menu` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `lb` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `rb` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `icon` varchar(30) COLLATE utf8_bin NOT NULL,
  `picture` varchar(30) COLLATE utf8_bin NOT NULL,
  `awe` varchar(10) COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `activity_id` int(11) UNSIGNED DEFAULT NULL,
  `state` enum('UPLOAD','ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


-- --------------------------------------------------------

--
-- Structure de la table `t_customer_blog_activity_menu_i18n`
--

DROP TABLE IF EXISTS `t_customer_blog_activity_menu_i18n`;
CREATE TABLE IF NOT EXISTS `t_customer_blog_activity_menu_i18n` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `menu_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `icon` varchar(30) COLLATE utf8_bin NOT NULL,
  `picture` varchar(30) COLLATE utf8_bin NOT NULL,
  `target` enum('_blank','top','parent','') COLLATE utf8_bin NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `state` enum('UPLOAD','ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_blog_activity_menu_fk0` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `t_customer_blog_activity_menu_i18n`
--


-- --------------------------------------------------------


--
-- Structure de la table `t_customer_blog_article`
--

DROP TABLE IF EXISTS `t_customer_blog_article`;
CREATE TABLE IF NOT EXISTS `t_customer_blog_article` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reference` varchar(32) COLLATE utf8_bin DEFAULT '',
  `expired_at` date DEFAULT NULL,
  `started_at` date DEFAULT NULL,
  `author` varchar(64) COLLATE utf8_bin NOT NULL,
  `picture` varchar(24) COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL,
  `status` enum('ACTIVE','DELETE','UPLOAD') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `t_customer_blog_article`
--

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_blog_article_activity`
--

DROP TABLE IF EXISTS `t_customer_blog_article_activity`;
CREATE TABLE IF NOT EXISTS `t_customer_blog_article_activity` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `article_id` int(11) UNSIGNED DEFAULT NULL,
  `activity_id` int(11) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_blog_article_activity_fk0` (`article_id`),
  KEY `customer_blog_article_activity_fk1` (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `t_customer_blog_article_activity`

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_blog_article_i18n`
--

DROP TABLE IF EXISTS `t_customer_blog_article_i18n`;
CREATE TABLE IF NOT EXISTS `t_customer_blog_article_i18n` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `url` varchar(255) COLLATE utf8_bin DEFAULT '',
  `meta_title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `meta_description` varchar(512) COLLATE utf8_bin DEFAULT '',
  `meta_keyword` varchar(512) COLLATE utf8_bin NOT NULL,
  `meta_robots` varchar(64) COLLATE utf8_bin NOT NULL,
  `short_description` varchar(512) COLLATE utf8_bin DEFAULT '',
  `content` text COLLATE utf8_bin,
  `article_id` int(11) UNSIGNED DEFAULT NULL,
  `number_of_views` int(11) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`article_id`,`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `t_customer_blog_article_i18n`
--

 
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `t_customer_blog_activity_i18n`
--
ALTER TABLE `t_customer_blog_activity_i18n`
  ADD CONSTRAINT `customer_blog_activity_i18n_fk0` FOREIGN KEY (`activity_id`) REFERENCES `t_customer_blog_activity` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_customer_blog_activity_menu_i18n`
--
ALTER TABLE `t_customer_blog_activity_menu_i18n`
  ADD CONSTRAINT `customer_blog_activity_menu_fk0` FOREIGN KEY (`menu_id`) REFERENCES `t_customer_blog_activity_menu` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_customer_blog_article_activity`
--
ALTER TABLE `t_customer_blog_article_activity`
  ADD CONSTRAINT `customer_blog_article_activity_fk0` FOREIGN KEY (`article_id`) REFERENCES `t_customer_blog_article` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_blog_article_activity_fk1` FOREIGN KEY (`activity_id`) REFERENCES `t_customer_blog_activity` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_customer_blog_article_i18n`
--
ALTER TABLE `t_customer_blog_article_i18n`
  ADD CONSTRAINT `customer_blog_article_i18n_fk0` FOREIGN KEY (`article_id`) REFERENCES `t_customer_blog_article` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


INSERT INTO `t_customer_blog_activity` (`id`, `name`, `picture`, `icon`, `number_of_articles`, `lb`, `rb`, `level`, `is_active`, `state`, `created_at`, `updated_at`) VALUES
(22, '', '', '', 0, 1, 30, 0, 'NO', NULL, '2020-10-11 10:23:33', '2020-10-11 10:23:33'),
(27, '', '', '', 0, 16, 21, 1, 'YES', NULL, '2020-10-12 06:20:51', '2020-10-12 06:23:54'),
(28, '', '', '', 0, 4, 15, 1, 'YES', NULL, '2020-10-12 06:21:10', '2020-10-12 06:23:55'),
(31, '', '', '', 0, 19, 20, 2, 'YES', NULL, '2020-10-12 06:22:50', '2020-10-12 06:23:57'),
(32, '', '', '', 0, 17, 18, 2, 'YES', NULL, '2020-10-12 06:22:50', '2020-10-12 06:23:58'),
(33, '', '', '', 0, 9, 10, 2, 'YES', NULL, '2020-10-12 06:23:40', '2020-10-12 06:23:48'),
(34, '', '', '', 0, 7, 8, 2, 'YES', NULL, '2020-10-12 06:23:40', '2020-10-12 06:23:48'),
(35, '', '', '', 0, 5, 6, 2, 'YES', NULL, '2020-10-12 06:23:40', '2020-10-12 06:23:49'),
(36, 'success', '', '', 0, 2, 3, 1, 'YES', NULL, '2020-10-24 09:15:50', '2020-10-24 11:22:01');



 

INSERT INTO `t_customer_blog_activity_i18n` (`id`, `activity_id`, `lang`, `title`, `url`, `meta_title`, `meta_description`, `meta_keywords`, `meta_robots`, `layout`, `template`, `content`, `is_active`, `start_at`, `expired_at`, `created_at`, `updated_at`) VALUES
(14, 27, 'en', 'Sale on graphex', 'Sale-on-graphex', 'Sale on graphex', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:20:51', '2020-10-12 06:20:51'),
(15, 28, 'en', 'Learn on graphex', 'Learn-on-graphex', 'Learn on graphex', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:21:10', '2020-10-12 06:21:10'),
(18, 31, 'en', 'Products', 'Products', 'Products', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:22:50', '2020-10-12 06:22:50'),
(19, 32, 'en', 'Services', 'Services', 'Services', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:22:50', '2020-10-12 06:22:50'),
(20, 33, 'en', 'Learn new Courses', 'Learn-new-Courses', 'Learn new Courses', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:23:40', '2020-10-12 06:23:40'),
(21, 34, 'en', 'Technology', 'Technology', 'Technology', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:23:40', '2020-10-12 06:23:40'),
(22, 35, 'en', 'Marketing', 'Marketing', 'Marketing', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:23:40', '2020-10-12 06:23:40'),
(23, 36, 'en', 'Success Stories', 'success-stories', 'Success Stories', 'Success Stories', 'Success Stories', 'Success Stories', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-24 09:15:50', '2020-10-24 09:15:50');



INSERT INTO `t_customer_blog_activity_menu` (`id`, `name`, `lb`, `rb`, `level`, `icon`, `picture`, `awe`, `is_active`, `activity_id`, `state`, `created_at`, `updated_at`) VALUES
(9, 'root', 1, 18, 0, '', '', '', 'YES', NULL, 'ACTIVE', '2020-10-19 15:36:38', '2020-10-19 15:36:38'),
(10, 'top', 2, 17, 1, '', '', '', 'YES', NULL, 'ACTIVE', '2020-10-19 15:36:51', '2020-10-19 15:36:54'),
(11, 'Learn on graphex ', 9, 16, 2, '', '', '', 'YES', 28, 'ACTIVE', '2020-10-19 15:37:05', '2020-10-19 14:58:50'),
(12, 'Sale on graphex ', 3, 8, 2, '', '', '', 'YES', 27, 'ACTIVE', '2020-10-19 15:37:17', '2020-10-19 14:58:40'),
(13, 'Marketing ', 14, 15, 3, '', '', '', 'YES', 35, 'ACTIVE', '2020-10-19 15:37:37', '2020-10-19 15:00:03'),
(14, 'Technology ', 12, 13, 3, '', '', '', 'YES', 34, 'ACTIVE', '2020-10-19 15:37:49', '2020-10-19 14:59:47'),
(15, 'Learn new Courses', 10, 11, 3, '', '', '', 'YES', 33, 'ACTIVE', '2020-10-19 15:38:01', '2020-10-19 14:59:38'),
(16, 'Services ', 6, 7, 3, '', '', '', 'YES', 32, 'ACTIVE', '2020-10-19 15:38:36', '2020-10-19 14:59:22'),
(17, 'Products ', 4, 5, 3, '', '', '', 'YES', 31, 'ACTIVE', '2020-10-19 15:38:48', '2020-10-19 14:59:11');


INSERT INTO `t_customer_blog_activity_menu_i18n` (`id`, `lang`, `menu_id`, `icon`, `picture`, `target`, `title`, `state`, `created_at`, `updated_at`) VALUES
(8, 'en', 10, '', '', '', 'top', 'ACTIVE', '2020-10-19 15:36:51', '2020-10-19 15:36:51'),
(9, 'en', 11, '', '', '', 'Learn on graphex ', 'ACTIVE', '2020-10-19 15:37:05', '2020-10-19 15:37:05'),
(10, 'en', 12, '', '', '', 'Sale on graphex ', 'ACTIVE', '2020-10-19 15:37:17', '2020-10-19 15:37:17'),
(11, 'en', 13, '', '', '', 'Marketing ', 'ACTIVE', '2020-10-19 15:37:37', '2020-10-19 15:37:37'),
(12, 'en', 14, '', '', '', 'Technology ', 'ACTIVE', '2020-10-19 15:37:49', '2020-10-19 15:37:49'),
(13, 'en', 15, '', '', '', 'Learn new Courses', 'ACTIVE', '2020-10-19 15:38:01', '2020-10-19 15:38:01'),
(14, 'en', 16, '', '', '', 'Services ', 'ACTIVE', '2020-10-19 15:38:36', '2020-10-19 15:38:36'),
(15, 'en', 17, '', '', '', 'Products ', 'ACTIVE', '2020-10-19 15:38:48', '2020-10-19 15:38:48');