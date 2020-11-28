-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 12 oct. 2020 à 15:42
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `t_customer_blog_activity`
--

INSERT INTO `t_customer_blog_activity` (`id`, `name`, `picture`, `icon`, `number_of_articles`, `lb`, `rb`, `level`, `is_active`, `state`, `created_at`, `updated_at`) VALUES
(22, '', '', '', 0, 1, 28, 0, 'NO', NULL, '2020-10-11 10:23:33', '2020-10-11 10:23:33'),
(27, '', '', '', 0, 14, 19, 1, 'YES', NULL, '2020-10-12 06:20:51', '2020-10-12 06:23:54'),
(28, '', '', '', 0, 2, 13, 1, 'YES', NULL, '2020-10-12 06:21:10', '2020-10-12 06:23:55'),
(31, '', '', '', 0, 17, 18, 2, 'YES', NULL, '2020-10-12 06:22:50', '2020-10-12 06:23:57'),
(32, '', '', '', 0, 15, 16, 2, 'YES', NULL, '2020-10-12 06:22:50', '2020-10-12 06:23:58'),
(33, '', '', '', 0, 7, 8, 2, 'YES', NULL, '2020-10-12 06:23:40', '2020-10-12 06:23:48'),
(34, '', '', '', 0, 5, 6, 2, 'YES', NULL, '2020-10-12 06:23:40', '2020-10-12 06:23:48'),
(35, '', '', '', 0, 3, 4, 2, 'YES', NULL, '2020-10-12 06:23:40', '2020-10-12 06:23:49');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `t_customer_blog_activity_i18n`
--

INSERT INTO `t_customer_blog_activity_i18n` (`id`, `activity_id`, `lang`, `title`, `url`, `meta_title`, `meta_description`, `meta_keywords`, `meta_robots`, `layout`, `template`, `content`, `is_active`, `start_at`, `expired_at`, `created_at`, `updated_at`) VALUES
(14, 27, 'en', 'Sale on graphex', 'Sale-on-graphex', 'Sale on graphex', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:20:51', '2020-10-12 06:20:51'),
(15, 28, 'en', 'Learn on graphex', 'Learn-on-graphex', 'Learn on graphex', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:21:10', '2020-10-12 06:21:10'),
(18, 31, 'en', 'Products', 'Products', 'Products', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:22:50', '2020-10-12 06:22:50'),
(19, 32, 'en', 'Services', 'Services', 'Services', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:22:50', '2020-10-12 06:22:50'),
(20, 33, 'en', 'Learn new Courses', 'Learn-new-Courses', 'Learn new Courses', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:23:40', '2020-10-12 06:23:40'),
(21, 34, 'en', 'Technology', 'Technology', 'Technology', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:23:40', '2020-10-12 06:23:40'),
(22, 35, 'en', 'Marketing', 'Marketing', 'Marketing', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:23:40', '2020-10-12 06:23:40');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `t_customer_blog_activity_menu`
--

INSERT INTO `t_customer_blog_activity_menu` (`id`, `name`, `lb`, `rb`, `level`, `icon`, `picture`, `awe`, `is_active`, `activity_id`, `state`, `created_at`, `updated_at`) VALUES
(1, '', 1, 2, 0, '', '', '', 'NO', NULL, 'ACTIVE', '2020-10-10 21:25:04', '2020-10-10 21:25:04');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
  `picture` varchar(24) COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL,
  `status` enum('ACTIVE','DELETE','UPLOAD') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `t_customer_blog_article`
--

INSERT INTO `t_customer_blog_article` (`id`, `reference`, `expired_at`, `started_at`, `picture`, `is_active`, `status`, `published_at`, `created_at`, `updated_at`) VALUES
(3, 'A2020101000003', NULL, NULL, '', 'YES', 'ACTIVE', '2020-10-11 00:00:00', '2020-10-10 13:27:59', '2020-10-10 13:30:09'),
(4, 'A2020101000004', NULL, NULL, '', 'YES', 'ACTIVE', '2020-10-11 00:00:00', '2020-10-10 16:01:23', '2020-10-10 16:01:27');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`article_id`,`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `t_customer_blog_article_i18n`
--

INSERT INTO `t_customer_blog_article_i18n` (`id`, `lang`, `url`, `meta_title`, `meta_description`, `meta_keyword`, `meta_robots`, `short_description`, `content`, `article_id`, `created_at`, `updated_at`) VALUES
(1, 'en', 'tttttttttttttttt', 'tttttttttttttttt', 'ttttttttttttttttttttttttt', 'ttttttttttttttttttttttttt', '', '', 'ttttttttttttttttttttttt', 3, '2020-10-10 14:27:59', '2020-10-10 14:30:07'),
(2, 'en', 'mon-premier-article', 'mon premier article', 'mon premier article', 'mon premier article', '', 'mon premier article description courte', 'mon premier article description courte ...................; 32768 characters', 4, '2020-10-10 17:01:23', '2020-10-10 17:01:23');

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
