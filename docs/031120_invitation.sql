-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 03 nov. 2020 à 13:05
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
-- Structure de la table `t_employee_invitation`
--

DROP TABLE IF EXISTS `t_employee_invitation`;
CREATE TABLE IF NOT EXISTS `t_employee_invitation` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gender` enum('Mr','Ms','Mrs') COLLATE utf8_bin NOT NULL,
  `firstname` varchar(64) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(64) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `friend_firstname` varchar(64) COLLATE utf8_bin NOT NULL,
  `friend_lastname` varchar(64) COLLATE utf8_bin NOT NULL,
  `friend_email` varchar(255) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(16) COLLATE utf8_bin NOT NULL,
  `fax` varchar(16) COLLATE utf8_bin NOT NULL,
  `address1` varchar(255) COLLATE utf8_bin NOT NULL,
  `address2` varchar(255) COLLATE utf8_bin NOT NULL,
  `postcode` char(10) COLLATE utf8_bin NOT NULL,
  `city` varchar(128) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `state` varchar(20) COLLATE utf8_bin NOT NULL,
  `subject` varchar(255) COLLATE utf8_bin NOT NULL,
  `message` varchar(512) COLLATE utf8_bin NOT NULL,
  `employee_user_id` int(11) UNSIGNED DEFAULT NULL,
  `employer_user_id` int(11) UNSIGNED DEFAULT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `t_employee_invitation`
--

INSERT INTO `t_employee_invitation` (`id`, `gender`, `firstname`, `lastname`, `email`, `friend_firstname`, `friend_lastname`, `friend_email`, `phone`, `mobile`, `fax`, `address1`, `address2`, `postcode`, `city`, `country`, `state`, `subject`, `message`, `employee_user_id`, `employer_user_id`, `is_active`, `status`, `created_at`, `updated_at`) VALUES
(1, '', 'aaaaaa', 'aaaaaaaaaaaaaaaa', 'contact@ewebsolutions.fr', 'ccccccccccc', 'cccccccccccc', 'eweb@free.fr', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 'NO', 'ACTIVE', '2020-10-23 13:52:49', '2020-10-23 13:52:49'),
(2, '', 'aaaaaa', 'aaaaaaaaaaaaaaaa', 'contact@ewebsolutions.fr', 'ccccccccccc', 'cccccccccccc', 'eweb@free.fr', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 'NO', 'ACTIVE', '2020-10-23 13:53:23', '2020-10-23 13:53:23'),
(3, '', 'aaaaaa', 'aaaaaaaaaaaaaaaa', 'contact@ewebsolutions.fr', 'ccccccccccc', 'cccccccccccc', 'eweb@free.fr', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 'NO', 'ACTIVE', '2020-10-23 13:53:42', '2020-10-23 13:53:42');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_invitation`
--

DROP TABLE IF EXISTS `t_employer_invitation`;
CREATE TABLE IF NOT EXISTS `t_employer_invitation` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gender` enum('Mr','Ms','Mrs') COLLATE utf8_bin NOT NULL,
  `firstname` varchar(64) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(64) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `friend_firstname` varchar(64) COLLATE utf8_bin NOT NULL,
  `friend_lastname` varchar(64) COLLATE utf8_bin NOT NULL,
  `friend_email` varchar(255) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(16) COLLATE utf8_bin NOT NULL,
  `fax` varchar(16) COLLATE utf8_bin NOT NULL,
  `address1` varchar(255) COLLATE utf8_bin NOT NULL,
  `address2` varchar(255) COLLATE utf8_bin NOT NULL,
  `postcode` char(10) COLLATE utf8_bin NOT NULL,
  `city` varchar(128) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `state` varchar(20) COLLATE utf8_bin NOT NULL,
  `subject` varchar(255) COLLATE utf8_bin NOT NULL,
  `message` varchar(512) COLLATE utf8_bin NOT NULL,
  `employee_user_id` int(11) UNSIGNED DEFAULT NULL,
  `employer_user_id` int(11) UNSIGNED DEFAULT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `t_employer_invitation`
--

INSERT INTO `t_employer_invitation` (`id`, `gender`, `firstname`, `lastname`, `email`, `friend_firstname`, `friend_lastname`, `friend_email`, `phone`, `mobile`, `fax`, `address1`, `address2`, `postcode`, `city`, `country`, `state`, `subject`, `message`, `employee_user_id`, `employer_user_id`, `is_active`, `status`, `created_at`, `updated_at`) VALUES
(1, '', 'aaaaaaaaa', 'bbbbbbbbbb', 'contact@ewebsolutions.fr', 'eeeeeeeeeee', 'dddddddddd', 'toto@ewebsolutions.fr', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 'NO', 'ACTIVE', '2020-10-23 14:44:01', '2020-10-23 14:44:01'),
(2, '', 'aaaaa', 'ccccccc', 'contact@ewebsolutions.fr', 'dddddddd', 'eeeeeeee', 'eweb@free.fr', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 'NO', 'ACTIVE', '2020-10-23 14:45:08', '2020-10-23 14:45:08'),
(3, '', 'aaaaa', 'ccccccc', 'contact@ewebsolutions.fr', 'dddddddd', 'eeeeeeee', 'eweb@free.fr', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 'NO', 'ACTIVE', '2020-10-23 14:46:36', '2020-10-23 14:46:36'),
(4, '', 'eeeeee', 'eeeeeeeee', 'contact@ewebsolutions.fr', 'yyyyyyyy', 'ggggggggggg', 'eweb@ewebsolutiosn.fr', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 'NO', 'ACTIVE', '2020-10-23 14:48:05', '2020-10-23 14:48:05');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
