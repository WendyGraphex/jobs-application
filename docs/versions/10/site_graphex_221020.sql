-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Jeu 22 Octobre 2020 à 12:56
-- Version du serveur: 5.5.62-0ubuntu0.14.04.1
-- Version de PHP: 5.5.9-1ubuntu4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `site_graphex`
--

-- --------------------------------------------------------

--
-- Structure de la table `i18n_language_codes`
--

CREATE TABLE IF NOT EXISTS `i18n_language_codes` (
  `code` varchar(2) DEFAULT NULL COMMENT 'ISO 639-1 Code',
  `lang` varchar(2) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  KEY `2letter` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `i18n_language_codes`
--

INSERT INTO `i18n_language_codes` (`code`, `lang`, `title`) VALUES
('aa', 'fr', 'afar'),
('ab', 'fr', 'abkhaze'),
('af', 'fr', 'afrikaans'),
('ak', 'fr', 'akan'),
('sq', 'fr', 'albanais'),
('am', 'fr', 'amharique'),
('ar', 'fr', 'arabe'),
('an', 'fr', 'aragonais'),
('hy', 'fr', 'arménien'),
('as', 'fr', 'assamais'),
('av', 'fr', 'avar'),
('ae', 'fr', 'avestique'),
('ay', 'fr', 'aymara'),
('az', 'fr', 'azéri'),
('ba', 'fr', 'bachkir'),
('bm', 'fr', 'bambara'),
('eu', 'fr', 'basque'),
('be', 'fr', 'biélorusse'),
('bn', 'fr', 'bengali'),
('bh', 'fr', 'bihari'),
('bi', 'fr', 'bichlamar'),
('bs', 'fr', 'bosniaque'),
('br', 'fr', 'breton'),
('bg', 'fr', 'bulgare'),
('my', 'fr', 'birman'),
('ca', 'fr', 'catalan; valencien'),
('ch', 'fr', 'chamorro'),
('ce', 'fr', 'tchétchène'),
('zh', 'fr', 'chinois'),
('cu', 'fr', 'slavon d''église; vieux slave; slavon liturgique; vieux bulgare'),
('cv', 'fr', 'tchouvache'),
('kw', 'fr', 'cornique'),
('co', 'fr', 'corse'),
('cr', 'fr', 'cree'),
('cs', 'fr', 'tchèque'),
('da', 'fr', 'danois'),
('dv', 'fr', 'maldivien'),
('nl', 'fr', 'néerlandais; flamand'),
('dz', 'fr', 'dzongkha'),
('en', 'fr', 'anglais'),
('eo', 'fr', 'espéranto'),
('et', 'fr', 'estonien'),
('ee', 'fr', 'éwé'),
('fo', 'fr', 'féroïen'),
('fj', 'fr', 'fidjien'),
('fi', 'fr', 'finnois'),
('fr', 'fr', 'français'),
('fy', 'fr', 'frison occidental'),
('ff', 'fr', 'peul'),
('ka', 'fr', 'géorgien'),
('de', 'fr', 'allemand'),
('gd', 'fr', 'gaélique; gaélique écossais'),
('ga', 'fr', 'irlandais'),
('gl', 'fr', 'galicien'),
('gv', 'fr', 'manx; mannois'),
('el', 'fr', 'grec moderne (après 1453)'),
('gn', 'fr', 'guarani'),
('gu', 'fr', 'goudjrati'),
('ht', 'fr', 'haïtien; créole haïtien'),
('ha', 'fr', 'haoussa'),
('he', 'fr', 'hébreu'),
('hz', 'fr', 'herero'),
('hi', 'fr', 'hindi'),
('ho', 'fr', 'hiri motu'),
('hr', 'fr', 'croate'),
('hu', 'fr', 'hongrois'),
('ig', 'fr', 'igbo'),
('is', 'fr', 'islandais'),
('io', 'fr', 'ido'),
('ii', 'fr', 'yi de Sichuan'),
('iu', 'fr', 'inuktitut'),
('ie', 'fr', 'interlingue'),
('ia', 'fr', 'interlingua (langue auxiliaire internationale)'),
('id', 'fr', 'indonésien'),
('ik', 'fr', 'inupiaq'),
('it', 'fr', 'italien'),
('jv', 'fr', 'javanais'),
('ja', 'fr', 'japonais'),
('kl', 'fr', 'groenlandais'),
('kn', 'fr', 'kannada'),
('ks', 'fr', 'kashmiri'),
('kr', 'fr', 'kanouri'),
('kk', 'fr', 'kazakh'),
('km', 'fr', 'khmer central'),
('ki', 'fr', 'kikuyu'),
('rw', 'fr', 'rwanda'),
('ky', 'fr', 'kirghiz'),
('kv', 'fr', 'kom'),
('kg', 'fr', 'kongo'),
('ko', 'fr', 'coréen'),
('kj', 'fr', 'kuanyama; kwanyama'),
('ku', 'fr', 'kurde'),
('lo', 'fr', 'lao'),
('la', 'fr', 'latin'),
('lv', 'fr', 'letton'),
('li', 'fr', 'limbourgeois'),
('ln', 'fr', 'lingala'),
('lt', 'fr', 'lituanien'),
('lb', 'fr', 'luxembourgeois'),
('lu', 'fr', 'luba-katanga'),
('lg', 'fr', 'ganda'),
('mk', 'fr', 'macédonien'),
('mh', 'fr', 'marshall'),
('ml', 'fr', 'malayalam'),
('mi', 'fr', 'maori'),
('mr', 'fr', 'marathe'),
('ms', 'fr', 'malais'),
('mg', 'fr', 'malgache'),
('mt', 'fr', 'maltais'),
('mn', 'fr', 'mongol'),
('na', 'fr', 'nauruan'),
('nv', 'fr', 'navaho'),
('nr', 'fr', 'ndébélé du Sud'),
('nd', 'fr', 'ndébélé du Nord'),
('ng', 'fr', 'ndonga'),
('ne', 'fr', 'népalais'),
('nn', 'fr', 'norvégien nynorsk; nynorsk, norvégien'),
('nb', 'fr', 'norvégien bokmål'),
('no', 'fr', 'norvégien'),
('ny', 'fr', 'chichewa; chewa; nyanja'),
('oc', 'fr', 'occitan (après 1500)'),
('oj', 'fr', 'ojibwa'),
('or', 'fr', 'oriya'),
('om', 'fr', 'galla'),
('os', 'fr', 'ossète'),
('pa', 'fr', 'pendjabi'),
('fa', 'fr', 'persan'),
('pi', 'fr', 'pali'),
('pl', 'fr', 'polonais'),
('pt', 'fr', 'portugais'),
('ps', 'fr', 'pachto'),
('qu', 'fr', 'quechua'),
('rm', 'fr', 'romanche'),
('ro', 'fr', 'roumain; moldave'),
('rn', 'fr', 'rundi'),
('ru', 'fr', 'russe'),
('sg', 'fr', 'sango'),
('sa', 'fr', 'sanskrit'),
('si', 'fr', 'singhalais'),
('sk', 'fr', 'slovaque'),
('sl', 'fr', 'slovène'),
('se', 'fr', 'sami du Nord'),
('sm', 'fr', 'samoan'),
('sn', 'fr', 'shona'),
('sd', 'fr', 'sindhi'),
('so', 'fr', 'somali'),
('st', 'fr', 'sotho du Sud'),
('es', 'fr', 'espagnol; castillan'),
('sc', 'fr', 'sarde'),
('sr', 'fr', 'serbe'),
('ss', 'fr', 'swati'),
('su', 'fr', 'soundanais'),
('sw', 'fr', 'swahili'),
('sv', 'fr', 'suédois'),
('ty', 'fr', 'tahitien'),
('ta', 'fr', 'tamoul'),
('tt', 'fr', 'tatar'),
('te', 'fr', 'télougou'),
('tg', 'fr', 'tadjik'),
('tl', 'fr', 'tagalog'),
('th', 'fr', 'thaï'),
('bo', 'fr', 'tibétain'),
('ti', 'fr', 'tigrigna'),
('to', 'fr', 'tongan (Îles Tonga)'),
('tn', 'fr', 'tswana'),
('ts', 'fr', 'tsonga'),
('tk', 'fr', 'turkmène'),
('tr', 'fr', 'turc'),
('tw', 'fr', 'twi'),
('ug', 'fr', 'ouïgour'),
('uk', 'fr', 'ukrainien'),
('ur', 'fr', 'ourdou'),
('uz', 'fr', 'ouszbek'),
('ve', 'fr', 'venda'),
('vi', 'fr', 'vietnamien'),
('vo', 'fr', 'volapük'),
('cy', 'fr', 'gallois'),
('wa', 'fr', 'wallon'),
('wo', 'fr', 'wolof'),
('xh', 'fr', 'xhosa'),
('yi', 'fr', 'yiddish'),
('yo', 'fr', 'yoruba'),
('za', 'fr', 'zhuang; chuang'),
('zu', 'fr', 'zoulou');

-- --------------------------------------------------------

--
-- Structure de la table `t_cart`
--

CREATE TABLE IF NOT EXISTS `t_cart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(10) COLLATE utf8_bin NOT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `company_id` int(11) unsigned DEFAULT NULL,
  `guest_id` int(11) unsigned DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `culture` varchar(5) COLLATE utf8_bin NOT NULL,
  `culture_preferred` varchar(5) COLLATE utf8_bin NOT NULL,
  `ip` varchar(16) COLLATE utf8_bin NOT NULL,
  `currency_id` int(11) unsigned NOT NULL,
  `message` text COLLATE utf8_bin NOT NULL,
  `secure` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `number_of_quotations` int(11) unsigned NOT NULL DEFAULT '0',
  `total_sale_price_with_tax` decimal(10,3) NOT NULL,
  `commission_without_tax` decimal(10,3) NOT NULL,
  `commission_rate_id` int(11) unsigned DEFAULT NULL,
  `commission_with_tax` decimal(10,3) NOT NULL,
  `global_sale_price_without_tax` decimal(10,3) NOT NULL,
  `global_sale_price_with_tax` decimal(10,3) NOT NULL,
  `total_sale_price_without_tax` decimal(10,3) NOT NULL,
  `tax_amount` decimal(10,3) NOT NULL,
  `taxes` varchar(128) COLLATE utf8_bin NOT NULL,
  `has_commission` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `state` enum('INPROGRESS','ORDERED','DELETED','SAVED') COLLATE utf8_bin NOT NULL DEFAULT 'INPROGRESS',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_fk0` (`currency_id`),
  KEY `cart_fk1` (`employer_user_id`),
  KEY `cart_fk2` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=77 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_cart_quotation`
--

CREATE TABLE IF NOT EXISTS `t_cart_quotation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `signature` varchar(64) COLLATE utf8_bin NOT NULL,
  `cart_id` int(11) unsigned NOT NULL,
  `quotation_id` int(11) unsigned NOT NULL,
  `project_id` int(11) unsigned DEFAULT NULL,
  `in_at` date DEFAULT NULL,
  `out_at` date DEFAULT NULL,
  `number_of_hours` int(11) unsigned NOT NULL DEFAULT '0',
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `comments` varchar(512) COLLATE utf8_bin DEFAULT '',
  `sale_price_with_tax` decimal(10,3) NOT NULL,
  `sale_price_without_tax` decimal(10,3) NOT NULL,
  `total_sale_price_with_tax` decimal(10,3) NOT NULL,
  `total_sale_price_without_tax` decimal(10,3) NOT NULL,
  `tax_id` int(11) unsigned DEFAULT NULL,
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_quotation_fk0` (`quotation_id`),
  KEY `cart_quotation_fk1` (`cart_id`),
  KEY `cart_quotation_fk2` (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=91 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_cart_quotation_commission`
--

CREATE TABLE IF NOT EXISTS `t_cart_quotation_commission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) unsigned NOT NULL,
  `cart_quotation_id` int(11) unsigned NOT NULL,
  `employer_user_id` int(11) unsigned NOT NULL,
  `company_id` int(11) unsigned NOT NULL,
  `cart_id` int(11) unsigned NOT NULL,
  `price_with_tax` int(11) unsigned NOT NULL,
  `price_without_tax` int(11) unsigned NOT NULL,
  `tax_id` int(11) unsigned NOT NULL,
  `text_id` int(11) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_quotation_commission_fk0` (`quotation_id`),
  KEY `cart_quotation_commission_fk1` (`cart_id`),
  KEY `cart_quotation_commission_fk2` (`cart_quotation_id`),
  KEY `cart_quotation_commission_fk3` (`employer_user_id`),
  KEY `cart_quotation_commission_fk4` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_country`
--

CREATE TABLE IF NOT EXISTS `t_country` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=194 ;

--
-- Contenu de la table `t_country`
--

INSERT INTO `t_country` (`id`, `code`) VALUES
(1, 'AD'),
(2, 'AE'),
(3, 'AF'),
(4, 'AG'),
(5, 'AL'),
(6, 'AM'),
(7, 'AO'),
(8, 'AR'),
(9, 'AT'),
(10, 'AU'),
(11, 'AZ'),
(12, 'BA'),
(13, 'BB'),
(14, 'BD'),
(15, 'BE'),
(16, 'BF'),
(17, 'BG'),
(18, 'BH'),
(19, 'BI'),
(20, 'BJ'),
(21, 'BN'),
(22, 'BO'),
(23, 'BR'),
(24, 'BS'),
(25, 'BT'),
(26, 'BW'),
(27, 'BY'),
(28, 'BZ'),
(29, 'CA'),
(30, 'CD'),
(31, 'CF'),
(32, 'CG'),
(33, 'CH'),
(34, 'CI'),
(35, 'CL'),
(36, 'CM'),
(37, 'CN'),
(38, 'CO'),
(39, 'CR'),
(40, 'CU'),
(41, 'CV'),
(42, 'CY'),
(43, 'CZ'),
(44, 'DE'),
(45, 'DJ'),
(46, 'DK'),
(47, 'DM'),
(48, 'DO'),
(49, 'DZ'),
(50, 'EC'),
(51, 'EE'),
(52, 'EG'),
(53, 'ER'),
(54, 'ES'),
(55, 'ET'),
(56, 'FI'),
(57, 'FJ'),
(58, 'FM'),
(59, 'FR'),
(60, 'GA'),
(61, 'GB'),
(62, 'GD'),
(63, 'GE'),
(64, 'GH'),
(65, 'GM'),
(66, 'GN'),
(67, 'GQ'),
(68, 'GR'),
(69, 'GT'),
(70, 'GW'),
(71, 'GY'),
(72, 'HN'),
(73, 'HR'),
(74, 'HT'),
(75, 'HU'),
(76, 'ID'),
(77, 'IE'),
(78, 'IL'),
(79, 'IN'),
(80, 'IQ'),
(81, 'IR'),
(82, 'IS'),
(83, 'IT'),
(84, 'JM'),
(85, 'JO'),
(86, 'JP'),
(87, 'KE'),
(88, 'KG'),
(89, 'KH'),
(90, 'KI'),
(91, 'KM'),
(92, 'KN'),
(93, 'KP'),
(94, 'KR'),
(95, 'KW'),
(96, 'KZ'),
(97, 'LA'),
(98, 'LB'),
(99, 'LC'),
(100, 'LI'),
(101, 'LK'),
(102, 'LR'),
(103, 'LS'),
(104, 'LT'),
(105, 'LU'),
(106, 'LV'),
(107, 'LY'),
(108, 'MA'),
(109, 'MC'),
(110, 'MD'),
(111, 'ME'),
(112, 'MG'),
(113, 'MH'),
(114, 'MK'),
(115, 'ML'),
(116, 'MM'),
(117, 'MN'),
(118, 'MR'),
(119, 'MT'),
(120, 'MU'),
(121, 'MV'),
(122, 'MW'),
(123, 'MX'),
(124, 'MY'),
(125, 'MZ'),
(126, 'NA'),
(127, 'NE'),
(128, 'NG'),
(129, 'NI'),
(130, 'NL'),
(131, 'NO'),
(132, 'NP'),
(133, 'NR'),
(134, 'NZ'),
(135, 'OM'),
(136, 'PA'),
(137, 'PE'),
(138, 'PG'),
(139, 'PH'),
(140, 'PK'),
(141, 'PL'),
(142, 'PT'),
(143, 'PW'),
(144, 'PY'),
(145, 'QA'),
(146, 'RO'),
(147, 'RS'),
(148, 'RU'),
(149, 'RW'),
(150, 'SA'),
(151, 'SB'),
(152, 'SC'),
(153, 'SD'),
(154, 'SE'),
(155, 'SG'),
(156, 'SI'),
(157, 'SK'),
(158, 'SL'),
(159, 'SM'),
(160, 'SN'),
(161, 'SO'),
(162, 'SR'),
(163, 'SS'),
(164, 'ST'),
(165, 'SV'),
(166, 'SY'),
(167, 'SZ'),
(168, 'TD'),
(169, 'TG'),
(170, 'TH'),
(171, 'TJ'),
(172, 'TL'),
(173, 'TM'),
(174, 'TN'),
(175, 'TO'),
(176, 'TR'),
(177, 'TT'),
(178, 'TV'),
(179, 'TZ'),
(180, 'UA'),
(181, 'UG'),
(182, 'US'),
(183, 'UY'),
(184, 'UZ'),
(185, 'VC'),
(186, 'VE'),
(187, 'VN'),
(188, 'VU'),
(189, 'WS'),
(190, 'YE'),
(191, 'ZA'),
(192, 'ZM'),
(193, 'ZW');

-- --------------------------------------------------------

--
-- Structure de la table `t_cron`
--

CREATE TABLE IF NOT EXISTS `t_cron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `task` varchar(255) COLLATE utf8_bin NOT NULL,
  `site` varchar(255) COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `period` varchar(255) COLLATE utf8_bin NOT NULL,
  `last_execution` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_abuse_type`
--

CREATE TABLE IF NOT EXISTS `t_customer_abuse_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- Contenu de la table `t_customer_abuse_type`
--

INSERT INTO `t_customer_abuse_type` (`id`, `name`, `icon`, `color`, `awe`, `position`, `created_at`, `updated_at`) VALUES
(1, '', '', '', '', 2, '2020-07-03 21:32:51', '2020-07-03 21:32:51'),
(2, '', '', '', '', 1, '2020-07-03 21:34:14', '2020-07-03 21:34:14'),
(3, '', '', '', '', 3, '2020-07-10 23:10:53', '2020-07-10 23:10:53'),
(4, '', '', '', '', 4, '2020-07-10 23:11:00', '2020-07-10 23:11:00'),
(5, '', '', '', '', 5, '2020-07-10 23:11:07', '2020-07-10 23:11:07'),
(6, '', '', '', '', 6, '2020-07-10 23:11:14', '2020-07-10 23:11:14'),
(7, '', '', '', '', 7, '2020-07-10 23:11:20', '2020-07-10 23:11:20');

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_abuse_type_i18n`
--

CREATE TABLE IF NOT EXISTS `t_customer_abuse_type_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `abuse_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`abuse_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- Contenu de la table `t_customer_abuse_type_i18n`
--

INSERT INTO `t_customer_abuse_type_i18n` (`id`, `lang`, `title`, `abuse_id`, `created_at`, `updated_at`) VALUES
(1, 'en', 'violence', 1, '2020-07-03 21:32:51', '2020-07-10 23:10:31'),
(2, 'en', 'invasion of privacy', 2, '2020-07-03 21:34:14', '2020-07-10 23:10:17'),
(3, 'en', 'defamation', 3, '2020-07-10 23:10:53', '2020-07-10 23:10:53'),
(4, 'en', 'pornography', 4, '2020-07-10 23:11:00', '2020-07-10 23:11:00'),
(5, 'en', 'incitement to racial hatred', 5, '2020-07-10 23:11:07', '2020-07-10 23:11:07'),
(6, 'en', 'revisionist character', 6, '2020-07-10 23:11:14', '2020-07-10 23:11:14'),
(7, 'en', 'others', 7, '2020-07-10 23:11:20', '2020-07-10 23:11:20');

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_academy_contact`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gender` enum('Mr','Ms','Mrs') COLLATE utf8_bin NOT NULL,
  `firstname` varchar(64) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(64) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
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
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_academy_course_i18n`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_course_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `url` varchar(255) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `short_description` varchar(512) COLLATE utf8_bin DEFAULT '',
  `content` text COLLATE utf8_bin,
  `reference` varchar(32) COLLATE utf8_bin DEFAULT '',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `teacher_user_id` int(11) unsigned DEFAULT NULL,
  `number_of_views` int(8) unsigned DEFAULT '0',
  `number_of_documents` int(8) unsigned DEFAULT '0',
  `ranking` int(11) unsigned DEFAULT '0',
  `is_validated` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `published_at` datetime DEFAULT NULL,
  `refused_at` datetime DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `state` enum('UPLOAD') COLLATE utf8_bin DEFAULT NULL,
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_academy_course_i18n_fk0` (`teacher_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_academy_level`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_customer_academy_level`
--

INSERT INTO `t_customer_academy_level` (`id`, `name`, `icon`, `color`, `awe`, `position`, `created_at`, `updated_at`) VALUES
(1, '', '', '', '', 1, '2020-08-05 21:45:32', '2020-08-05 21:45:32');

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_academy_level_i18n`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_level_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `level_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`level_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_customer_academy_level_i18n`
--

INSERT INTO `t_customer_academy_level_i18n` (`id`, `lang`, `title`, `level_id`, `created_at`, `updated_at`) VALUES
(1, 'en', 'test', 1, '2020-08-05 21:45:32', '2020-08-05 21:45:32');

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_academy_newsletter`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_newsletter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ip` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_customer_academy_newsletter`
--

INSERT INTO `t_customer_academy_newsletter` (`id`, `email`, `ip`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'contact@ewebsolutions.fr', '127.0.0.1', 'YES', '2020-09-10 19:36:17', '2020-09-10 19:36:17');

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_academy_software`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_software` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_academy_software_i18n`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_software_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `software_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`software_id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_academy_student_user`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_student_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(48) COLLATE utf8_bin DEFAULT '',
  `instagram_user` varchar(24) COLLATE utf8_bin DEFAULT '',
  `gender` enum('Mr','Ms','Mrs') COLLATE utf8_bin NOT NULL,
  `firstname` varchar(48) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(48) COLLATE utf8_bin NOT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(40) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(16) COLLATE utf8_bin NOT NULL,
  `fax` varchar(16) COLLATE utf8_bin NOT NULL,
  `web` varchar(255) COLLATE utf8_bin NOT NULL,
  `address1` varchar(255) COLLATE utf8_bin NOT NULL,
  `address2` varchar(255) COLLATE utf8_bin NOT NULL,
  `avatar` varchar(255) COLLATE utf8_bin NOT NULL,
  `postcode` char(10) COLLATE utf8_bin NOT NULL,
  `state` varchar(20) COLLATE utf8_bin NOT NULL,
  `city` varchar(128) COLLATE utf8_bin NOT NULL,
  `city_id` int(11) unsigned DEFAULT NULL,
  `country` varchar(3) COLLATE utf8_bin NOT NULL,
  `function_id` int(11) unsigned DEFAULT NULL,
  `function` varchar(40) COLLATE utf8_bin NOT NULL,
  `is_completed` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_validated` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL,
  `is_admin` enum('YES','NO') COLLATE utf8_bin NOT NULL,
  `is_locked` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `lastlogin` timestamp NULL DEFAULT NULL,
  `lastpassword` timestamp NULL DEFAULT NULL,
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_academy_student_user_u0` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_customer_academy_student_user`
--

INSERT INTO `t_customer_academy_student_user` (`id`, `username`, `instagram_user`, `gender`, `firstname`, `lastname`, `birthday`, `email`, `password`, `phone`, `mobile`, `fax`, `web`, `address1`, `address2`, `avatar`, `postcode`, `state`, `city`, `city_id`, `country`, `function_id`, `function`, `is_completed`, `is_validated`, `is_active`, `is_admin`, `is_locked`, `lastlogin`, `lastpassword`, `status`, `created_at`, `updated_at`) VALUES
(1, '', '', 'Mrs', 'student', 'student', NULL, 'student@free.fr', '202cb962ac59075b964b07152d234b70', '', '', '', '', '', '', '', '', '', '', NULL, 'EN', NULL, '', 'NO', 'YES', 'YES', 'YES', 'NO', '2020-08-04 15:24:18', '2020-08-01 22:13:25', 'ACTIVE', '2020-08-01 22:13:25', '2020-08-04 15:24:18');

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_academy_student_user_forgot_password`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_student_user_forgot_password` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `password` varchar(40) COLLATE utf8_bin NOT NULL,
  `key` varchar(40) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_academy_student_user_forgot_password_fk0` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_academy_student_user_remember`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_student_user_remember` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `key` varchar(40) COLLATE utf8_bin NOT NULL,
  `ip` varchar(36) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_academy_student_user_session`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_student_user_session` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `session` varchar(40) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `ip` varchar(50) COLLATE utf8_bin NOT NULL,
  `lat` decimal(20,13) DEFAULT NULL,
  `lng` decimal(20,13) DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `ended_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_academy_student_user_session_fk0` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Contenu de la table `t_customer_academy_student_user_session`
--

INSERT INTO `t_customer_academy_student_user_session` (`id`, `session`, `user_id`, `ip`, `lat`, `lng`, `started_at`, `ended_at`, `created_at`, `updated_at`) VALUES
(1, '0mj6opvdaje5fijjn56tfqmkh0', 1, '127.0.0.1', NULL, NULL, '2020-08-01 22:18:17', '2020-08-04 15:13:40', '2020-08-01 23:18:17', NULL),
(2, 'hm0hmb5kr3155vh3k92cjs1m11', 1, '127.0.0.1', NULL, NULL, '2020-08-04 15:24:18', '2020-08-04 15:29:15', '2020-08-04 16:24:18', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_academy_student_user_validation_token`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_student_user_validation_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `token` varchar(64) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `customer_academy_student_user_validation_token_fk0` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_customer_academy_student_user_validation_token`
--

INSERT INTO `t_customer_academy_student_user_validation_token` (`id`, `user_id`, `token`, `created_at`) VALUES
(1, 1, 'ed5e67a720df15747fa2542506031935b125b811', '2020-08-01 22:13:25');

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_academy_teacher_user`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_teacher_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(48) COLLATE utf8_bin DEFAULT '',
  `instagram_user` varchar(24) COLLATE utf8_bin DEFAULT '',
  `gender` enum('Mr','Ms','Mrs') COLLATE utf8_bin NOT NULL,
  `firstname` varchar(48) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(48) COLLATE utf8_bin NOT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(40) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(16) COLLATE utf8_bin NOT NULL,
  `fax` varchar(16) COLLATE utf8_bin NOT NULL,
  `web` varchar(255) COLLATE utf8_bin NOT NULL,
  `address1` varchar(255) COLLATE utf8_bin NOT NULL,
  `address2` varchar(255) COLLATE utf8_bin NOT NULL,
  `avatar` varchar(255) COLLATE utf8_bin NOT NULL,
  `postcode` char(10) COLLATE utf8_bin NOT NULL,
  `state` varchar(20) COLLATE utf8_bin NOT NULL,
  `city` varchar(128) COLLATE utf8_bin NOT NULL,
  `city_id` int(11) unsigned DEFAULT NULL,
  `country` varchar(3) COLLATE utf8_bin NOT NULL,
  `function_id` int(11) unsigned DEFAULT NULL,
  `function` varchar(40) COLLATE utf8_bin NOT NULL,
  `number_of_courses` int(11) unsigned DEFAULT '0',
  `is_completed` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_validated` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL,
  `is_locked` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `lastlogin` timestamp NULL DEFAULT NULL,
  `lastpassword` timestamp NULL DEFAULT NULL,
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_academy_teacher_user_u0` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_customer_academy_teacher_user`
--

INSERT INTO `t_customer_academy_teacher_user` (`id`, `username`, `instagram_user`, `gender`, `firstname`, `lastname`, `birthday`, `email`, `password`, `phone`, `mobile`, `fax`, `web`, `address1`, `address2`, `avatar`, `postcode`, `state`, `city`, `city_id`, `country`, `function_id`, `function`, `number_of_courses`, `is_completed`, `is_validated`, `is_active`, `is_locked`, `lastlogin`, `lastpassword`, `status`, `created_at`, `updated_at`) VALUES
(1, '', '', 'Mr', 'teacher', 'teacher', NULL, 'teacher@free.fr', '202cb962ac59075b964b07152d234b70', '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, '', 0, 'NO', 'YES', 'YES', 'NO', '2020-08-04 15:15:54', '2020-08-01 22:47:14', 'ACTIVE', '2020-08-01 22:47:14', '2020-08-04 15:15:54');

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_academy_teacher_user_forgot_password`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_teacher_user_forgot_password` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `password` varchar(40) COLLATE utf8_bin NOT NULL,
  `key` varchar(40) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_academy_teacher_user_forgot_password_fk0` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_academy_teacher_user_remember`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_teacher_user_remember` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `key` varchar(40) COLLATE utf8_bin NOT NULL,
  `ip` varchar(36) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_academy_teacher_user_session`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_teacher_user_session` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `session` varchar(40) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `ip` varchar(50) COLLATE utf8_bin NOT NULL,
  `lat` decimal(20,13) DEFAULT NULL,
  `lng` decimal(20,13) DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `ended_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_academy_teacher_user_session_fk0` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Contenu de la table `t_customer_academy_teacher_user_session`
--

INSERT INTO `t_customer_academy_teacher_user_session` (`id`, `session`, `user_id`, `ip`, `lat`, `lng`, `started_at`, `ended_at`, `created_at`, `updated_at`) VALUES
(1, '0mj6opvdaje5fijjn56tfqmkh0', 1, '127.0.0.1', NULL, NULL, '2020-08-01 22:47:52', '2020-08-02 22:44:47', '2020-08-01 23:47:52', NULL),
(2, 'hm0hmb5kr3155vh3k92cjs1m11', 1, '127.0.0.1', NULL, NULL, '2020-08-04 15:15:54', '2020-08-04 15:24:18', '2020-08-04 16:15:54', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_academy_teacher_user_validation_token`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_teacher_user_validation_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `token` varchar(64) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `customer_academy_teacher_user_validation_token_fk0` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_customer_academy_teacher_user_validation_token`
--

INSERT INTO `t_customer_academy_teacher_user_validation_token` (`id`, `user_id`, `token`, `created_at`) VALUES
(1, 1, 'b1ff5183b68ad2d5fbc0fabfaae057ee3336b892', '2020-08-01 22:47:14');

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_academy_topic`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_topic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=40 ;

--
-- Contenu de la table `t_customer_academy_topic`
--

INSERT INTO `t_customer_academy_topic` (`id`, `category_id`, `name`, `icon`, `color`, `awe`, `position`, `created_at`, `updated_at`) VALUES
(3, 4, '', '', '', '', 1, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(4, 4, '', '', '', '', 2, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(5, 4, '', '', '', '', 3, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(6, 4, '', '', '', '', 4, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(7, 4, '', '', '', '', 5, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(8, 4, '', '', '', '', 6, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(9, 4, '', '', '', '', 7, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(10, 4, '', '', '', '', 8, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(11, 4, '', '', '', '', 9, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(12, 4, '', '', '', '', 10, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(13, 4, '', '', '', '', 11, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(14, 4, '', '', '', '', 12, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(15, 3, '', '', '', '', 13, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(16, 3, '', '', '', '', 14, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(17, 3, '', '', '', '', 15, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(18, 3, '', '', '', '', 16, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(19, 3, '', '', '', '', 17, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(20, 3, '', '', '', '', 18, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(21, 3, '', '', '', '', 19, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(22, 3, '', '', '', '', 20, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(23, 3, '', '', '', '', 21, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(24, 3, '', '', '', '', 22, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(25, 3, '', '', '', '', 23, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(26, 3, '', '', '', '', 24, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(27, 3, '', '', '', '', 25, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(28, 3, '', '', '', '', 26, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(29, 5, '', '', '', '', 27, '2020-08-18 22:25:17', '2020-08-18 22:25:17'),
(30, 5, '', '', '', '', 28, '2020-08-18 22:25:17', '2020-08-18 22:25:17'),
(31, 5, '', '', '', '', 29, '2020-08-18 22:25:17', '2020-08-18 22:25:17'),
(32, 5, '', '', '', '', 30, '2020-08-18 22:25:17', '2020-08-18 22:25:17'),
(33, 5, '', '', '', '', 31, '2020-08-18 22:25:17', '2020-08-18 22:25:17'),
(34, 5, '', '', '', '', 32, '2020-08-18 22:25:17', '2020-08-18 22:25:17'),
(35, 5, '', '', '', '', 33, '2020-08-18 22:25:17', '2020-08-18 22:25:17'),
(36, 5, '', '', '', '', 34, '2020-08-18 22:25:17', '2020-08-18 22:25:17'),
(37, 5, '', '', '', '', 35, '2020-08-18 22:25:17', '2020-08-18 22:25:17'),
(38, 5, '', '', '', '', 36, '2020-08-18 22:25:17', '2020-08-18 22:25:17'),
(39, 5, '', '', '', '', 37, '2020-08-18 22:25:17', '2020-08-18 22:25:17');

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_academy_topic_i18n`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_topic_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `topic_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`topic_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=41 ;

--
-- Contenu de la table `t_customer_academy_topic_i18n`
--

INSERT INTO `t_customer_academy_topic_i18n` (`id`, `lang`, `title`, `topic_id`, `created_at`, `updated_at`) VALUES
(4, 'en', 'Photoshop', 3, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(5, 'en', 'Illustrator', 4, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(6, 'en', 'Drawing', 5, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(7, 'en', 'Logo Design', 6, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(8, 'en', 'InDesign', 7, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(9, 'en', 'Animation', 8, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(10, 'en', 'Character Animation', 9, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(11, 'en', '3D Animation', 10, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(12, 'en', 'Interior Design', 11, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(13, 'en', 'After Effects', 12, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(14, 'en', 'Web Design', 13, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(15, 'en', 'Adobe XD UI UX Design', 14, '2020-08-18 22:14:52', '2020-08-18 22:14:52'),
(16, 'en', 'Python', 15, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(17, 'en', 'Web Development', 16, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(18, 'en', 'Linux', 17, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(19, 'en', 'Java', 18, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(20, 'en', 'AWS Certification', 19, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(21, 'en', 'Oracle Certification', 20, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(22, 'en', 'Microsoft Certification', 21, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(23, 'en', 'Microsoft Azure', 22, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(24, 'en', 'Amazon AWS', 23, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(25, 'en', 'Blockchain', 24, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(26, 'en', 'WordPress', 25, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(27, 'en', 'Network Security', 26, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(28, 'en', 'SQL', 27, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(29, 'en', 'Excell', 28, '2020-08-18 22:21:49', '2020-08-18 22:21:49'),
(30, 'en', 'Portrait Photography', 29, '2020-08-18 22:25:17', '2020-08-18 22:25:17'),
(31, 'en', 'Landscape Photography', 30, '2020-08-18 22:25:17', '2020-08-18 22:25:17'),
(32, 'en', 'Photoshop', 31, '2020-08-18 22:25:17', '2020-08-18 22:25:17'),
(33, 'en', 'Adobe Lightroom', 32, '2020-08-18 22:25:17', '2020-08-18 22:25:17'),
(34, 'en', 'Affinity Photo', 33, '2020-08-18 22:25:17', '2020-08-18 22:25:17'),
(35, 'en', 'DSLR', 34, '2020-08-18 22:25:17', '2020-08-18 22:25:17'),
(36, 'en', 'Filmmaking', 35, '2020-08-18 22:25:17', '2020-08-18 22:25:17'),
(37, 'en', 'Videography', 36, '2020-08-18 22:25:17', '2020-08-18 22:25:17'),
(38, 'en', 'Final Cut Pro X', 37, '2020-08-18 22:25:17', '2020-08-18 22:25:17'),
(39, 'en', 'Video Editing', 38, '2020-08-18 22:25:17', '2020-08-18 22:25:17'),
(40, 'en', 'Color Grading', 39, '2020-08-18 22:25:17', '2020-08-18 22:25:17');

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_advert_comment`
--

CREATE TABLE IF NOT EXISTS `t_customer_advert_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sender` enum('EMPLOYEE','EMPLOYER') COLLATE utf8_bin NOT NULL,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `employee_advert_id` int(11) unsigned DEFAULT NULL,
  `employee_advert_lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `employer_advert_id` int(11) unsigned DEFAULT NULL,
  `employer_advert_lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `project_id` int(11) unsigned NOT NULL,
  `quotation_id` int(11) unsigned NOT NULL,
  `published_at` datetime DEFAULT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `customer_advert_comment_fk0` (`employer_user_id`),
  KEY `customer_advert_comment_fk1` (`employee_user_id`),
  KEY `customer_advert_comment_fk2` (`employee_advert_id`),
  KEY `customer_advert_comment_fk3` (`employer_advert_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=15 ;

--
-- Contenu de la table `t_customer_advert_comment`
--

INSERT INTO `t_customer_advert_comment` (`id`, `sender`, `employee_user_id`, `employer_user_id`, `employee_advert_id`, `employee_advert_lang`, `employer_advert_id`, `employer_advert_lang`, `project_id`, `quotation_id`, `published_at`, `is_active`, `created_at`, `updated_at`) VALUES
(6, 'EMPLOYER', 17, 9, 27, 'en', NULL, '', 34, 55, '2020-10-15 16:28:42', 'YES', '2020-10-15 15:28:01', '2020-10-15 15:28:42'),
(7, 'EMPLOYER', 17, 9, 27, 'en', NULL, '', 34, 55, '2020-10-15 16:28:39', 'YES', '2020-10-15 15:28:28', '2020-10-15 15:28:39'),
(8, 'EMPLOYER', 17, 9, NULL, '', 71, 'en', 33, 39, '2020-10-15 17:03:39', 'YES', '2020-10-15 15:29:13', '2020-10-15 16:03:39'),
(9, 'EMPLOYER', 17, 9, 27, 'en', NULL, '', 34, 55, '2020-10-15 16:37:35', 'YES', '2020-10-15 15:29:38', '2020-10-15 15:37:35'),
(10, 'EMPLOYER', 17, 9, NULL, '', 71, 'en', 33, 39, '2020-10-15 17:03:35', 'YES', '2020-10-15 15:29:53', '2020-10-15 16:03:35'),
(11, 'EMPLOYER', 17, 9, NULL, '', 71, 'en', 29, 32, '2020-10-15 17:03:32', 'YES', '2020-10-15 15:30:50', '2020-10-15 16:03:32'),
(12, 'EMPLOYER', 17, 9, NULL, '', 72, 'fr', 31, 34, NULL, 'NO', '2020-10-15 15:30:57', '2020-10-15 15:30:57'),
(13, 'EMPLOYEE', 17, 9, 27, 'en', NULL, '', 34, 55, '2020-10-15 17:26:56', 'YES', '2020-10-15 16:08:51', '2020-10-15 16:26:56'),
(14, 'EMPLOYEE', 17, 9, NULL, '', 71, 'en', 33, 39, '2020-10-15 17:26:31', 'YES', '2020-10-15 16:22:47', '2020-10-15 16:26:31');

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_advert_comment_i18n`
--

CREATE TABLE IF NOT EXISTS `t_customer_advert_comment_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `comment_id` int(11) unsigned DEFAULT NULL,
  `message` varchar(512) COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `customer_advert_comment_i18n_fk0` (`comment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=14 ;

--
-- Contenu de la table `t_customer_advert_comment_i18n`
--

INSERT INTO `t_customer_advert_comment_i18n` (`id`, `lang`, `comment_id`, `message`, `is_active`, `created_at`, `updated_at`) VALUES
(5, 'en', 6, 'dddddddddd', 'NO', '2020-10-15 15:28:01', '2020-10-15 15:28:01'),
(6, 'en', 7, '222222222222222222é', 'NO', '2020-10-15 15:28:28', '2020-10-15 15:28:28'),
(7, 'en', 8, '3333333333333', 'NO', '2020-10-15 15:29:13', '2020-10-15 15:29:13'),
(8, 'en', 9, 'tttttttttttttttttttttttttttt', 'NO', '2020-10-15 15:29:38', '2020-10-15 15:29:38'),
(9, 'en', 10, '4444444444444444444', 'NO', '2020-10-15 15:29:53', '2020-10-15 15:29:53'),
(10, 'en', 11, '66666666666666', 'NO', '2020-10-15 15:30:50', '2020-10-15 15:30:50'),
(11, 'en', 12, '9999999999999999', 'NO', '2020-10-15 15:30:57', '2020-10-15 15:30:57'),
(12, 'en', 13, 'zzzzzzzzzzzzzzzzzzzzz', 'NO', '2020-10-15 16:08:51', '2020-10-15 16:08:51'),
(13, 'en', 14, 'xxxxxxxxxxxxxxxxxxxxxxxxxxx', 'NO', '2020-10-15 16:22:47', '2020-10-15 16:22:47');

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_advert_search`
--

CREATE TABLE IF NOT EXISTS `t_customer_advert_search` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  `number_of_results` int(11) unsigned DEFAULT '0',
  `ip` varchar(16) COLLATE utf8_bin NOT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `culture` varchar(6) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `city` varchar(64) COLLATE utf8_bin NOT NULL,
  `query` varchar(64) COLLATE utf8_bin NOT NULL,
  `location` varchar(64) COLLATE utf8_bin NOT NULL,
  `type` enum('employee','employer') COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=25 ;

--
-- Contenu de la table `t_customer_advert_search`
--

INSERT INTO `t_customer_advert_search` (`id`, `employer_user_id`, `employee_user_id`, `category_id`, `number_of_results`, `ip`, `lang`, `culture`, `country`, `city`, `query`, `location`, `type`, `created_at`, `updated_at`) VALUES
(19, NULL, NULL, 5, 0, '190.102.71.136', 'en', 'en', '', '', 'Video', 'Haiti', 'employer', '2020-10-20 15:16:38', '2020-10-20 15:16:38'),
(20, NULL, NULL, 5, 0, '190.102.71.136', 'en', 'en', '', '', 'Video', 'Haiti', 'employer', '2020-10-20 15:16:38', '2020-10-20 15:16:38'),
(21, NULL, NULL, 5, 0, '190.102.71.136', 'en', 'en', '', '', 'Video', 'Haiti', 'employer', '2020-10-20 15:16:38', '2020-10-20 15:16:38'),
(22, NULL, NULL, 5, 0, '190.102.71.136', 'en', 'en', '', '', 'Video', 'Haiti', 'employer', '2020-10-20 15:16:39', '2020-10-20 15:16:39'),
(23, NULL, NULL, 5, 0, '190.102.71.136', 'en', 'en', '', '', 'Video', 'Haiti', 'employer', '2020-10-20 15:16:39', '2020-10-20 15:16:39'),
(24, NULL, NULL, NULL, 0, '76.231.25.71', 'en', 'en', '', '', 'seo', '', 'employer', '2020-10-21 01:37:47', '2020-10-21 01:37:47');

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_blog_activity`
--

CREATE TABLE IF NOT EXISTS `t_customer_blog_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(48) COLLATE utf8_bin NOT NULL,
  `picture` varchar(64) COLLATE utf8_bin NOT NULL,
  `icon` varchar(64) COLLATE utf8_bin NOT NULL,
  `number_of_articles` int(11) unsigned NOT NULL DEFAULT '0',
  `lb` int(11) unsigned NOT NULL DEFAULT '0',
  `rb` int(11) unsigned NOT NULL DEFAULT '0',
  `level` int(11) unsigned NOT NULL DEFAULT '0',
  `is_active` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `state` enum('UPLOAD') COLLATE utf8_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=36 ;

--
-- Contenu de la table `t_customer_blog_activity`
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

CREATE TABLE IF NOT EXISTS `t_customer_blog_activity_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) unsigned NOT NULL,
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
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `customer_blog_activity_i18n_fk0` (`activity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=23 ;

--
-- Contenu de la table `t_customer_blog_activity_i18n`
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

CREATE TABLE IF NOT EXISTS `t_customer_blog_activity_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `lb` int(11) unsigned NOT NULL DEFAULT '0',
  `rb` int(11) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `icon` varchar(30) COLLATE utf8_bin NOT NULL,
  `picture` varchar(30) COLLATE utf8_bin NOT NULL,
  `awe` varchar(10) COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `activity_id` int(11) unsigned DEFAULT NULL,
  `state` enum('UPLOAD','ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_customer_blog_activity_menu`
--

INSERT INTO `t_customer_blog_activity_menu` (`id`, `name`, `lb`, `rb`, `level`, `icon`, `picture`, `awe`, `is_active`, `activity_id`, `state`, `created_at`, `updated_at`) VALUES
(1, '', 1, 2, 0, '', '', '', 'NO', NULL, 'ACTIVE', '2020-10-10 21:25:04', '2020-10-10 21:25:04');

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_blog_activity_menu_i18n`
--

CREATE TABLE IF NOT EXISTS `t_customer_blog_activity_menu_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `menu_id` int(11) unsigned NOT NULL DEFAULT '0',
  `icon` varchar(30) COLLATE utf8_bin NOT NULL,
  `picture` varchar(30) COLLATE utf8_bin NOT NULL,
  `target` enum('_blank','top','parent','') COLLATE utf8_bin NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `state` enum('UPLOAD','ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_blog_activity_menu_fk0` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_blog_article`
--

CREATE TABLE IF NOT EXISTS `t_customer_blog_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Contenu de la table `t_customer_blog_article`
--

INSERT INTO `t_customer_blog_article` (`id`, `reference`, `expired_at`, `started_at`, `picture`, `is_active`, `status`, `published_at`, `created_at`, `updated_at`) VALUES
(3, 'A2020101000003', NULL, NULL, '', 'YES', 'ACTIVE', '2020-10-11 00:00:00', '2020-10-10 13:27:59', '2020-10-10 13:30:09'),
(4, 'A2020101000004', NULL, NULL, '', 'YES', 'ACTIVE', '2020-10-11 00:00:00', '2020-10-10 16:01:23', '2020-10-10 16:01:27');

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_blog_article_activity`
--

CREATE TABLE IF NOT EXISTS `t_customer_blog_article_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) unsigned DEFAULT NULL,
  `activity_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_blog_article_activity_fk0` (`article_id`),
  KEY `customer_blog_article_activity_fk1` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_blog_article_i18n`
--

CREATE TABLE IF NOT EXISTS `t_customer_blog_article_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `url` varchar(255) COLLATE utf8_bin DEFAULT '',
  `meta_title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `meta_description` varchar(512) COLLATE utf8_bin DEFAULT '',
  `meta_keyword` varchar(512) COLLATE utf8_bin NOT NULL,
  `meta_robots` varchar(64) COLLATE utf8_bin NOT NULL,
  `short_description` varchar(512) COLLATE utf8_bin DEFAULT '',
  `content` text COLLATE utf8_bin,
  `article_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`article_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Contenu de la table `t_customer_blog_article_i18n`
--

INSERT INTO `t_customer_blog_article_i18n` (`id`, `lang`, `url`, `meta_title`, `meta_description`, `meta_keyword`, `meta_robots`, `short_description`, `content`, `article_id`, `created_at`, `updated_at`) VALUES
(1, 'en', 'tttttttttttttttt', 'tttttttttttttttt', 'ttttttttttttttttttttttttt', 'ttttttttttttttttttttttttt', '', '', 'ttttttttttttttttttttttt', 3, '2020-10-10 14:27:59', '2020-10-10 14:30:07'),
(2, 'en', 'mon-premier-article', 'mon premier article', 'mon premier article', 'mon premier article', '', 'mon premier article description courte', 'mon premier article description courte ...................; 32768 characters', 4, '2020-10-10 17:01:23', '2020-10-10 17:01:23');

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_claim_type`
--

CREATE TABLE IF NOT EXISTS `t_customer_claim_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_claim_type_i18n`
--

CREATE TABLE IF NOT EXISTS `t_customer_claim_type_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `type_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`type_id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_contact`
--

CREATE TABLE IF NOT EXISTS `t_customer_contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gender` enum('Mr','Ms','Mrs') COLLATE utf8_bin NOT NULL,
  `firstname` varchar(64) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(64) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
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
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_contact_claim`
--

CREATE TABLE IF NOT EXISTS `t_customer_contact_claim` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(48) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(48) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(16) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_course_category`
--

CREATE TABLE IF NOT EXISTS `t_customer_course_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(48) COLLATE utf8_bin NOT NULL,
  `picture` varchar(64) COLLATE utf8_bin NOT NULL,
  `number_of_courses` int(11) unsigned NOT NULL DEFAULT '0',
  `number_of_views` int(11) unsigned NOT NULL DEFAULT '0',
  `lb` int(11) unsigned NOT NULL DEFAULT '0',
  `rb` int(11) unsigned NOT NULL DEFAULT '0',
  `level` int(11) unsigned NOT NULL DEFAULT '0',
  `is_active` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `state` enum('UPLOAD') COLLATE utf8_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

--
-- Contenu de la table `t_customer_course_category`
--

INSERT INTO `t_customer_course_category` (`id`, `name`, `picture`, `number_of_courses`, `number_of_views`, `lb`, `rb`, `level`, `is_active`, `state`, `created_at`, `updated_at`) VALUES
(1, '', '', 0, 0, 1, 18, 0, 'NO', NULL, '2020-07-30 17:05:07', '2020-07-30 17:05:07'),
(2, '', '', 0, 0, 16, 17, 1, 'YES', NULL, '2020-07-30 17:09:51', '2020-07-30 17:09:53'),
(3, '', '', 0, 0, 14, 15, 1, 'YES', NULL, '2020-08-04 16:54:46', '2020-08-04 16:54:49'),
(4, '', '', 0, 0, 12, 13, 1, 'YES', NULL, '2020-08-04 16:55:11', '2020-08-04 16:55:12'),
(5, '', '', 0, 0, 10, 11, 1, 'YES', NULL, '2020-08-04 16:55:35', '2020-08-04 16:55:37'),
(6, '', '', 0, 0, 8, 9, 1, 'YES', NULL, '2020-08-04 16:55:57', '2020-08-04 16:56:37'),
(7, '', '', 0, 0, 6, 7, 1, 'YES', NULL, '2020-08-04 16:56:21', '2020-08-04 16:56:36'),
(8, '', '', 0, 0, 4, 5, 1, 'YES', NULL, '2020-08-04 16:56:33', '2020-08-04 16:56:35'),
(9, '', '', 0, 0, 2, 3, 1, 'YES', NULL, '2020-09-11 08:20:29', '2020-09-11 08:20:31');

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_course_category_course`
--

CREATE TABLE IF NOT EXISTS `t_customer_course_category_course` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `course_i18n_id` int(11) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  `position` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `customer_course_category_course_fk0` (`course_i18n_id`),
  KEY `customer_course_category_course_fk1` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_course_category_i18n`
--

CREATE TABLE IF NOT EXISTS `t_customer_course_category_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL,
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
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `customer_course_category_i18n_fk0` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Contenu de la table `t_customer_course_category_i18n`
--

INSERT INTO `t_customer_course_category_i18n` (`id`, `category_id`, `lang`, `title`, `url`, `meta_title`, `meta_description`, `meta_keywords`, `meta_robots`, `layout`, `template`, `content`, `is_active`, `start_at`, `expired_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'en', 'Development', 'development', 'Development', 'Development', 'Development', '', 'default', 'default.tpl', 'test', 'NO', NULL, NULL, '2020-07-30 17:09:51', '2020-08-04 16:54:23'),
(2, 3, 'en', 'IT & Software', 'it-software', 'IT & Software', 'IT & Software', 'IT & Software', '', 'default', 'default.tpl', 'IT & Software', 'NO', NULL, NULL, '2020-08-04 16:54:46', '2020-08-04 16:54:46'),
(3, 4, 'en', 'Design', 'design', 'Design', 'Design', '', '', 'default', 'default.tpl', 'Design', 'NO', NULL, NULL, '2020-08-04 16:55:10', '2020-08-04 16:55:10'),
(4, 5, 'en', 'Photography', 'photography', 'Photography', 'Photography', 'Photography', '', 'default', 'default.tpl', 'Photography', 'NO', NULL, NULL, '2020-08-04 16:55:35', '2020-08-04 16:55:35'),
(5, 6, 'en', ' Videography', 'videography', ' Videography', ' Videography', ' Videography', '', 'default', 'default.tpl', ' Videography', 'NO', NULL, NULL, '2020-08-04 16:55:57', '2020-08-04 16:55:57'),
(6, 7, 'en', ' Marketing', 'marketing', ' Marketing', 'Marketing\n', '', '', 'default', 'default.tpl', 'Marketing', 'NO', NULL, NULL, '2020-08-04 16:56:21', '2020-08-04 16:56:21'),
(7, 8, 'en', 'Business ', 'business', 'Business ', 'Business ', 'Business ', '', 'default', 'default.tpl', 'Business ', 'NO', NULL, NULL, '2020-08-04 16:56:33', '2020-08-04 16:56:33'),
(8, 9, 'en', 'Data science', '/data-science', 'Data science', 'Data science', 'Data science', '', 'default', 'default.tpl', 'Data science', 'NO', NULL, NULL, '2020-09-11 08:20:29', '2020-09-11 08:20:29');

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_course_document`
--

CREATE TABLE IF NOT EXISTS `t_customer_course_document` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(128) COLLATE utf8_bin NOT NULL,
  `extension` varchar(10) COLLATE utf8_bin NOT NULL,
  `course_i18n_id` int(11) unsigned NOT NULL,
  `filesize` int(11) unsigned DEFAULT NULL,
  `is_public` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'Y',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_course_document_fk0` (`course_i18n_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_message`
--

CREATE TABLE IF NOT EXISTS `t_customer_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `sender` enum('EMPLOYEE','EMPLOYER','ADMIN') COLLATE utf8_bin DEFAULT NULL,
  `subject` varchar(128) COLLATE utf8_bin NOT NULL,
  `message` varchar(512) COLLATE utf8_bin NOT NULL,
  `number_of_files` int(8) unsigned NOT NULL DEFAULT '0',
  `employer_deleted_at` timestamp NULL DEFAULT NULL,
  `employee_deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `state` enum('SENT') COLLATE utf8_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `customer_messager_fk0` (`employee_user_id`),
  KEY `customer_messager_fk1` (`employer_user_id`),
  KEY `customer_messager_fk2` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=116 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_message_file`
--

CREATE TABLE IF NOT EXISTS `t_customer_message_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(128) COLLATE utf8_bin NOT NULL,
  `extension` varchar(10) COLLATE utf8_bin NOT NULL,
  `size` int(11) unsigned DEFAULT '0',
  `message_id` int(11) unsigned DEFAULT NULL,
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `customer_messager_file_fk0` (`message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=52 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_newsletter`
--

CREATE TABLE IF NOT EXISTS `t_customer_newsletter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ip` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_registration`
--

CREATE TABLE IF NOT EXISTS `t_customer_registration` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gender` enum('Mr','Ms','Mrs') COLLATE utf8_bin NOT NULL,
  `firstname` varchar(64) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(64) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
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
  `race` varchar(48) COLLATE utf8_bin NOT NULL,
  `has_experience` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `attending` varchar(48) COLLATE utf8_bin NOT NULL,
  `other_attending` varchar(64) COLLATE utf8_bin NOT NULL,
  `level` varchar(48) COLLATE utf8_bin NOT NULL,
  `other_level` varchar(64) COLLATE utf8_bin NOT NULL,
  `profession` varchar(64) COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=146 ;

--
-- Contenu de la table `t_customer_registration`
--

INSERT INTO `t_customer_registration` (`id`, `gender`, `firstname`, `lastname`, `email`, `phone`, `mobile`, `fax`, `address1`, `address2`, `postcode`, `city`, `country`, `state`, `subject`, `message`, `race`, `has_experience`, `attending`, `other_attending`, `level`, `other_level`, `profession`, `is_active`, `status`, `created_at`, `updated_at`) VALUES
(1, '', 'Wendy', 'Pierre', 'voxdeiministry@gmail.com', '5165149291', '', '', '', '', '', 'New York', 'US', 'New York', '', '', 'Black', 'YES', 'other', 'CEO', 'doctorate', '', 'Web Designer', 'NO', 'ACTIVE', '2020-09-27 22:34:09', '2020-09-27 22:34:09'),
(2, '', 'Weedina', 'lucien', 'Lucienweedina@gmail.com', '2033587014', '', '', '', '', '', 'Brentwood ', 'US', 'New York ', '', '', 'Black ', 'NO', 'employer', '', 'associate', '', '', 'NO', 'ACTIVE', '2020-09-27 23:17:04', '2020-09-27 23:17:04'),
(3, '', 'Weedina', 'lucien', 'Lucienweedina@gmail.com', '2033587014', '', '', '', '', '', 'Brentwood ', 'US', 'New York ', '', '', 'Black ', 'NO', 'employer', '', 'associate', '', '', 'NO', 'ACTIVE', '2020-09-27 23:17:05', '2020-09-27 23:17:05'),
(4, '', 'Eve', 'Baudin ', 'eveswishlist@gmail.com', '5164516643', '', '', '', '', '', 'Brentwood ', 'US', 'New York ', '', '', 'Mixed ', 'YES', 'business', '', 'bachelor', '', 'Nursing ', 'NO', 'ACTIVE', '2020-09-27 23:35:44', '2020-09-27 23:35:44'),
(5, '', 'Eve', 'Baudin ', 'eveswishlist@gmail.com', '5164516643', '', '', '', '', '', 'Brentwood ', 'US', 'New York ', '', '', 'Mixed ', 'YES', 'business', '', 'bachelor', '', 'Nursing ', 'NO', 'ACTIVE', '2020-09-27 23:35:46', '2020-09-27 23:35:46'),
(6, '', 'Eve', 'Baudin ', 'mbaudin83@gmail.com', '5164516643', '', '', '', '', '', 'Brentwood ', 'US', 'NY', '', '', 'Black', 'YES', 'business', '', 'bachelor', '', '', 'NO', 'ACTIVE', '2020-09-27 23:48:32', '2020-09-27 23:48:32'),
(7, '', 'Eve', 'Baudin ', 'mbaudin83@gmail.com', '5164516643', '', '', '', '', '', 'Brentwood ', 'US', 'NY', '', '', 'Black', 'YES', 'business', '', 'bachelor', '', '', 'NO', 'ACTIVE', '2020-09-27 23:48:34', '2020-09-27 23:48:34'),
(8, '', 'Faemy Lindsay ', 'Jean Mary', 'jeanmarylindsa@gmail.com', '+50944574874', '', '', '', '', '', 'Haïti ', 'CA', 'Port au prince ', '', '', 'Black ', 'YES', 'school', '', 'college', '', '', 'NO', 'ACTIVE', '2020-09-28 00:20:12', '2020-09-28 00:20:12'),
(9, '', 'Bertude', 'Jules', 'bertude30@gmail.com', '9739053227', '', '', '', '', '', 'West Orange ', 'US', 'New Jersey ', '', '', 'None ', 'NO', 'other', '', 'bachelor', '', '', 'NO', 'ACTIVE', '2020-09-28 01:30:32', '2020-09-28 01:30:32'),
(10, '', 'Jn Fritz Gérald ', 'Aguy', 'fegy12512@gmail.com', '47521059', '', '', '', '', '', 'Carrefour', 'HT', 'Ouest', '', '', 'Noire', 'YES', 'employee', '', 'bachelor', '', 'Theologien ', 'NO', 'ACTIVE', '2020-09-28 01:47:30', '2020-09-28 01:47:30'),
(11, '', 'Wends', 'Pierre', 'maestrocharly23@gmail.com', '66996919080', '', '', '', '', '', 'Sorriso', 'BR', 'Mato Grosso ', '', '', 'Haitien', 'YES', 'student', '', 'highschool', '', 'Youtuber ,formado em informática ', 'NO', 'ACTIVE', '2020-09-28 01:49:14', '2020-09-28 01:49:14'),
(12, '', 'Wends', 'Pierre', 'maestrocharly23@gmail.com', '66996919080', '', '', '', '', '', 'Sorriso', 'BR', 'Mato Grosso ', '', '', 'Haitien', 'YES', 'student', '', 'highschool', '', 'Youtuber ,formado em informática ', 'NO', 'ACTIVE', '2020-09-28 01:49:15', '2020-09-28 01:49:15'),
(13, '', 'Oluwatobi', 'Kareem', 'oluwatobikareem@gmail.com', '5163447233', '', '', '', '', '', 'Fremont', 'US', 'CA', '', '', 'Black', 'NO', 'employer', '', 'master', '', 'Developer', 'NO', 'ACTIVE', '2020-09-28 18:51:35', '2020-09-28 18:51:35'),
(14, '', 'Ephen', 'Augustin', 'aephene7@gmail.com', '+50949417045', '', '', '', '', '', 'Hinche', 'HT', 'Hinche', '', '', 'Black haitian', 'NO', 'entrepreneur', '', 'bachelor', '', '', 'NO', 'ACTIVE', '2020-09-28 22:21:31', '2020-09-28 22:21:31'),
(15, '', 'Carol', 'Yao', 'carolyao0709@gmail.com', '+8613581997556', '', '', '', '', '', 'Beijing', 'CN', 'Beijing', '', '', 'Beijing', 'YES', 'employee', '', 'college', '', 'Computer', 'NO', 'ACTIVE', '2020-09-29 06:17:22', '2020-09-29 06:17:22'),
(16, '', 'Jean', 'Perceval', 'percevalmastertech@gmail.com', '3054963138', '', '', '', '', '', 'Westpark', 'US', 'Fl', '', '', 'Blak', 'NO', 'other', '', 'highschool', '', 'Mechanic', 'NO', 'ACTIVE', '2020-09-29 12:31:18', '2020-09-29 12:31:18'),
(17, '', 'Bolu', 'Ipadeola ', 'Iphemi.bi@gmail.com', '5165035439', '', '', '', '', '', 'Indianapolis ', 'US', 'Indiana ', '', '', 'Black', 'NO', 'employee', '', 'master', '', 'Healthcare manager', 'NO', 'ACTIVE', '2020-09-29 13:26:03', '2020-09-29 13:26:03'),
(18, '', 'Bolu', 'Ipadeola ', 'Iphemi.bi@gmail.com', '5165035439', '', '', '', '', '', 'Indianapolis ', 'US', 'Indiana ', '', '', 'Black', 'NO', 'employee', '', 'master', '', 'Healthcare manager', 'NO', 'ACTIVE', '2020-09-29 13:26:06', '2020-09-29 13:26:06'),
(19, '', 'Alexandra ', 'Celestin ', 'Lcra111911@gmail.com', '7734909243', '', '', '', '', '', 'New York ', 'US', 'New York', '', '', 'Black ', 'NO', 'employee', '', 'bachelor', '', '', 'NO', 'ACTIVE', '2020-09-29 14:00:35', '2020-09-29 14:00:35'),
(20, '', 'Alexandra ', 'Celestin ', 'Lcra111911@gmail.com', '7734909243', '', '', '', '', '', 'New York ', 'US', 'New York', '', '', 'Black ', 'NO', 'employee', '', 'bachelor', '', '', 'NO', 'ACTIVE', '2020-09-29 14:00:37', '2020-09-29 14:00:37'),
(21, '', 'Lunique', 'Hilaire', 'luniquehilaire@gmail.com', '9542542802', '', '', '', '', '', 'Fort Lauderdale', 'US', 'Florida', '', '', 'Black', 'YES', 'other', '', 'other', '', 'Business management', 'NO', 'ACTIVE', '2020-09-29 14:00:43', '2020-09-29 14:00:43'),
(22, '', 'Lunique', 'Hilaire', 'luniquehilaire@gmail.com', '9542542802', '', '', '', '', '', 'Fort Lauderdale', 'US', 'Florida', '', '', 'Black', 'YES', 'other', '', 'other', '', 'Businesses Management', 'NO', 'ACTIVE', '2020-09-29 14:05:09', '2020-09-29 14:05:09'),
(23, '', 'Jean Marie Harold ', 'Clermont', 'haroldlove7@yahoo.fr', '50938405508', '', '', '', '', '', 'Port-au-Prince', 'HT', 'Port-au-prince', '', '', 'Black', 'NO', 'employee', '', 'bachelor', '', 'Admistrateur/Acteur', 'NO', 'ACTIVE', '2020-09-29 14:28:18', '2020-09-29 14:28:18'),
(24, '', 'Georgette ', 'Dickson', 'Geedixon513@aol.com', '3472182278', '', '', '', '', '', 'New York ', 'US', 'Ny ', '', '', 'Black ', 'NO', 'employee', '', 'master', '', 'Nurse practitioner ', 'NO', 'ACTIVE', '2020-09-30 16:41:42', '2020-09-30 16:41:42'),
(25, '', 'Georgette ', 'Dickson', 'Geedixon513@aol.com', '3472182278', '', '', '', '', '', 'New York ', 'US', 'Ny ', '', '', 'Black ', 'NO', 'employee', '', 'master', '', 'Nurse practitioner ', 'NO', 'ACTIVE', '2020-09-30 16:41:51', '2020-09-30 16:41:51'),
(26, '', 'Georgette ', 'Dickson', 'Geedixon513@aol.com', '3472182278', '', '', '', '', '', 'New York ', 'US', 'Ny ', '', '', 'Black ', 'NO', 'employee', '', 'master', '', 'Nurse practitioner ', 'NO', 'ACTIVE', '2020-09-30 16:41:52', '2020-09-30 16:41:52'),
(27, '', 'Georgette ', 'Dickson', 'Geedixon513@aol.com', '3472182278', '', '', '', '', '', 'New York ', 'US', 'Ny ', '', '', 'Black ', 'NO', 'employee', '', 'master', '', 'Nurse practitioner ', 'NO', 'ACTIVE', '2020-09-30 16:41:53', '2020-09-30 16:41:53'),
(28, '', 'Mumtaz', 'ahmad', 'drahmadny@yahoo.com', '9293489466', '', '', '', '', '', 'BROOKLYN', 'US', 'New York', '', '', 'Asian American', 'YES', 'employer', '', 'postdocs', '', 'Doctor and public health', 'NO', 'ACTIVE', '2020-09-30 21:26:57', '2020-09-30 21:26:57'),
(29, '', 'wed', 'Alteme', 'atemewedengeerjoelson@gmail.com', '+50947995580', '', '', '', '', '', 'Port-au-prince', 'HT', '', '', '', 'Haitien, noir', 'NO', 'school', '', 'master', '', 'computer engineer, Graphique designer, Web designer', 'NO', 'ACTIVE', '2020-09-30 22:16:15', '2020-09-30 22:16:15'),
(30, '', 'Claudy', 'Zephir', 'noiretjoli@gmail.com', '5162048170', '', '', '', '', '', 'Loma Linda', 'US', 'CA', '', '', 'Caribbean', 'YES', 'entrepreneur', '', 'doctorate', '', 'DPT ', 'NO', 'ACTIVE', '2020-09-30 22:59:22', '2020-09-30 22:59:22'),
(31, '', 'DANTIKA ', 'Blanchette', 'danticatblanchette@72gmail.com', '+50931210793', '', '', '', '', '', 'Haiti', 'HT', 'P-au-P', '', '', 'Haitienne', 'YES', 'other', '', 'other', '', 'Informatique bureautique ', 'NO', 'ACTIVE', '2020-09-30 23:57:40', '2020-09-30 23:57:40'),
(32, '', 'DANTIKA ', 'Blanchette', 'danticatblanchette@72gmail.com', '+50931210793', '', '', '', '', '', 'Haiti', 'HT', 'P-au-P', '', '', 'Haitienne', 'YES', 'other', '', 'other', '', 'Informatique bureautique ', 'NO', 'ACTIVE', '2020-09-30 23:57:41', '2020-09-30 23:57:41'),
(33, '', 'Shirley ', 'Gauthier ', 'Shirleygauthier25@yahoo.com', '5162630353', '', '', '', '', '', 'Rockville Centre', 'US', 'NY', '', '', 'Black', 'NO', 'employee', '', 'associate', '', 'Nurse', 'NO', 'ACTIVE', '2020-10-01 14:54:33', '2020-10-01 14:54:33'),
(34, '', 'Jean', 'Enase', 'Jeanenase22@gmail.com', '6463990996', '', '', '', '', '', 'Cambria Height', 'US', 'NY', '', '', 'Black ', 'NO', 'employee', '', 'associate', '', 'Nurse', 'NO', 'ACTIVE', '2020-10-01 15:07:01', '2020-10-01 15:07:01'),
(35, '', 'Khalid', 'Javed', 'chdrkhalid6@gmail.com', '03238456622', '', '', '', '', '', 'Lahore', 'PK', 'punjab', '', '', 'Punjabi ', 'YES', 'other', 'Medical / resident resident', 'doctorate', '', 'Medical', 'NO', 'ACTIVE', '2020-10-01 15:24:19', '2020-10-01 15:24:19'),
(36, '', 'Muhammad ', 'Rashid ', 'rashidniaz_ravian@yahoo.com', '00923008862518', '', '', '', '', '', 'Lahore', 'PK', 'Punjab', '', '', 'Asian', 'YES', 'business', '', 'doctorate', '', 'MEDICAL', 'NO', 'ACTIVE', '2020-10-01 17:47:25', '2020-10-01 17:47:25'),
(37, '', 'Bilal', 'Ashraf', 'Bilal_ashrafs@hotmail.com', '00923337613310', '', '', '', '', '', 'Multan', 'PK', '', '', '', 'Asian', 'NO', 'other', '', 'bachelor', '', 'Doctor', 'NO', 'ACTIVE', '2020-10-01 20:05:41', '2020-10-01 20:05:41'),
(38, '', 'Bernard ', 'Lucien ', 'Bernardlucien@gmail.com', '2038984762', '', '', '', '', '', 'Stamford ', 'US', 'Connecticut ', '', '', 'Black', 'NO', 'employer', '', 'college', '', '', 'NO', 'ACTIVE', '2020-10-01 23:46:49', '2020-10-01 23:46:49'),
(39, '', 'Bernard ', 'Lucien ', 'Bernardlucien@gmail.com', '2038984762', '', '', '', '', '', 'Stamford ', 'US', 'Connecticut ', '', '', 'Black', 'NO', 'employer', '', 'college', '', '', 'NO', 'ACTIVE', '2020-10-01 23:46:51', '2020-10-01 23:46:51'),
(40, '', 'Kerly', 'Paul ', 'paulkerly@yahoo.fr', '9044052605', '', '', '', '', '', 'Jacksonville ', 'US', 'Florida ', '', '', 'black ⚫ ', 'NO', 'employee', '', 'highschool', '', 'CPO', 'NO', 'ACTIVE', '2020-10-01 23:50:11', '2020-10-01 23:50:11'),
(41, '', 'Dr.M.Azhar', 'Riaz ', 'azharmoon@hotmail.com', '+923336376540', '', '', '', '', '', 'Sialkot', 'PK', 'Punjab', '', '', 'Muslim', 'NO', 'employee', '', 'doctorate', '', 'Anesthesialogist', 'NO', 'ACTIVE', '2020-10-02 05:06:30', '2020-10-02 05:06:30'),
(42, '', 'Michel', 'Markendy', 'michelmarckendy99@gmail.com', '+18296551337', '', '', '', '', '', 'Dominican republic', 'DO', 'Herera', '', '', 'Haitian', 'YES', 'school', '', 'college', '', 'Beatmaker,cineastre', 'NO', 'ACTIVE', '2020-10-02 05:08:07', '2020-10-02 05:08:07'),
(43, '', 'Michel', 'Markendy', 'michelmarckendy99@gmail.com', '+18296551337', '', '', '', '', '', 'Dominican republic', 'DO', 'Herera', '', '', 'Haitian', 'YES', 'school', '', 'college', '', 'Beatmaker,cineastre', 'NO', 'ACTIVE', '2020-10-02 05:08:08', '2020-10-02 05:08:08'),
(44, '', 'Michel', 'Markendy', 'michelmarckendy99@gmail.com', '+18296551337', '', '', '', '', '', 'Dominican republic', 'DO', 'Herera', '', '', 'Haitian', 'YES', 'school', '', 'college', '', 'Beatmaker,cineastre', 'NO', 'ACTIVE', '2020-10-02 05:08:09', '2020-10-02 05:08:09'),
(45, '', 'Michel', 'Markendy', 'michelmarckendy99@gmail.com', '+18296551337', '', '', '', '', '', 'Dominican republic', 'DO', 'Herera', '', '', 'Haitian', 'YES', 'school', '', 'college', '', 'Beatmaker,cineastre', 'NO', 'ACTIVE', '2020-10-02 05:08:10', '2020-10-02 05:08:10'),
(46, '', 'Michel', 'Markendy', 'michelmarckendy99@gmail.com', '+18296551337', '', '', '', '', '', 'Dominican republic', 'DO', 'Herera', '', '', 'Haitian', 'YES', 'school', '', 'college', '', 'Beatmaker,cineastre', 'NO', 'ACTIVE', '2020-10-02 05:08:12', '2020-10-02 05:08:12'),
(47, '', 'Michel', 'Markendy', 'michelmarckendy99@gmail.com', '+18296551337', '', '', '', '', '', 'Dominican republic', 'DO', 'Herera', '', '', 'Haitian', 'YES', 'school', '', 'college', '', 'Beatmaker,cineastre', 'NO', 'ACTIVE', '2020-10-02 05:08:13', '2020-10-02 05:08:13'),
(48, '', 'Michel', 'Markendy', 'michelmarckendy99@gmail.com', '+18296551337', '', '', '', '', '', 'Dominican republic', 'DO', 'Herera', '', '', 'Haitian', 'YES', 'school', '', 'college', '', 'Beatmaker,cineastre', 'NO', 'ACTIVE', '2020-10-02 05:08:14', '2020-10-02 05:08:14'),
(49, '', 'Michel', 'Markendy', 'michelmarckendy99@gmail.com', '+18296551337', '', '', '', '', '', 'Dominican republic', 'DO', 'Herera', '', '', 'Haitian', 'YES', 'school', '', 'college', '', 'Beatmaker,cineastre', 'NO', 'ACTIVE', '2020-10-02 05:08:15', '2020-10-02 05:08:15'),
(50, '', 'Michel', 'Markendy', 'michelmarckendy99@gmail.com', '+18296551337', '', '', '', '', '', 'Dominican republic', 'DO', 'Herera', '', '', 'Haitian', 'YES', 'school', '', 'college', '', 'Beatmaker,cineastre', 'NO', 'ACTIVE', '2020-10-02 05:08:16', '2020-10-02 05:08:16'),
(51, '', 'Michel', 'Markendy', 'michelmarckendy99@gmail.com', '+18296551337', '', '', '', '', '', 'Dominican republic', 'DO', 'Herera', '', '', 'Haitian', 'YES', 'school', '', 'college', '', 'Beatmaker,cineastre', 'NO', 'ACTIVE', '2020-10-02 05:08:17', '2020-10-02 05:08:17'),
(52, '', 'Ernesto', 'St Vil', 'Stvilernesto@gmail.com', '8094473080', '', '', '', '', '', 'Santiago', 'DO', 'Santiago', '', '', 'Black', 'YES', 'other', 'Unemployee', 'bachelor', '', 'Telematic engineer', 'NO', 'ACTIVE', '2020-10-02 05:18:29', '2020-10-02 05:18:29'),
(53, '', 'ROWE', 'Claudy', 'Claudyrowe18@gmail.com', '+509 48453429', '', '', '', '', '', 'Delmas', 'HT', '', '', '', '?', 'YES', 'student', '', 'college', '', 'Graphic designer ', 'NO', 'ACTIVE', '2020-10-02 13:50:16', '2020-10-02 13:50:16'),
(54, '', 'Natacha ', 'Germain', 'Ngermain78@yayoo.com', '3473192911', '', '', '', '', '', 'Central islip', 'US', 'New York ', '', '', 'Black ', 'NO', 'employee', '', 'highschool', '', 'Med-tech', 'NO', 'ACTIVE', '2020-10-02 16:47:31', '2020-10-02 16:47:31'),
(55, '', 'Natacha ', 'Germain', 'Ngermain78@yayoo.com', '3473192911', '', '', '', '', '', 'Central islip', 'US', 'New York ', '', '', 'Black ', 'NO', 'employee', '', 'highschool', '', 'Med-tech', 'NO', 'ACTIVE', '2020-10-02 16:47:34', '2020-10-02 16:47:34'),
(56, '', 'Natacha ', 'Germain', 'Ngermain78@yayoo.com', '3473192911', '', '', '', '', '', 'Central islip', 'US', 'New York ', '', '', 'Black ', 'NO', 'employee', '', 'highschool', '', 'Med-tech', 'NO', 'ACTIVE', '2020-10-02 16:47:35', '2020-10-02 16:47:35'),
(57, '', 'Jean-Junior Vedlet', 'Célestin', 'lewousdesign07@gmail.com', '+50936963882', '', '', '', '', '', 'Cap Haïtien', 'HT', '', '', '', 'Race Noire', 'NO', 'student', 'Ingénieur Civil, Graphic Design', 'college', '', 'Graphic Design/Ingénieur Civil', 'NO', 'ACTIVE', '2020-10-02 17:29:22', '2020-10-02 17:29:22'),
(58, '', 'Jean-Junior Vedlet', 'Célestin', 'lewousdesign07@gmail.com', '+50936963882', '', '', '', '', '', 'Cap Haïtien', 'HT', '', '', '', 'Race Noire', 'NO', 'student', 'Ingénieur Civil, Graphic Design', 'college', '', 'Graphic Design/Ingénieur Civil', 'NO', 'ACTIVE', '2020-10-02 17:29:23', '2020-10-02 17:29:23'),
(59, '', 'sssssssssss', 'sssssssssssss', 'super@yahoo.fr', '0205678956', '', '', '', '', '', 'russia', 'RU', '', '', '', 'ru', 'NO', 'school', '', 'college', '', 'ddddddddd', 'NO', 'ACTIVE', '2020-10-02 17:59:02', '2020-10-02 17:59:02'),
(60, '', 'Sandra', 'CASIMIR', 'casimirsandra156@gmail.com', '+50940775166', '', '', '', '', '', 'Carrefour', 'HT', 'Port-au-Prince', '', '', 'Black Haitian ', 'NO', 'school', '', 'college', '', 'Agronomy, Natural Resources and Environment', 'NO', 'ACTIVE', '2020-10-02 22:04:45', '2020-10-02 22:04:45'),
(61, '', 'Jovanie Alexandra', 'Jean Mary', 'jovaniealexandrajeanmary@gmail.com', '01150931043892', '', '', '', '', '', 'Port-au-prince', 'HT', 'Fontamara', '', '', 'Black', 'NO', 'student', '', 'highschool', '', 'no ', 'NO', 'ACTIVE', '2020-10-04 14:27:05', '2020-10-04 14:27:05'),
(62, '', 'Mervil', 'Jean Ronald', 'Jeanronald2@gmail.com', '50949055686', '', '', '', '', '', 'Haiti', 'FR', 'Grssier', '', '', 'Haïtien ', 'YES', 'business', '', 'college', '', 'Profrsseur', 'NO', 'ACTIVE', '2020-10-05 20:37:57', '2020-10-05 20:37:57'),
(63, '', 'Widmarck', 'Jean-Charles', 'wjcharles15@gmail.com', '829-390-5098', '', '', '', '', '', 'Boca Chica', 'DO', 'Santo Domingo', '', '', 'Black', 'NO', 'student', '', 'college', '', 'Customer Service Representative', 'NO', 'ACTIVE', '2020-10-05 20:43:34', '2020-10-05 20:43:34'),
(64, '', 'Silvert', 'Blanchard', 'silvertb4@gmail.com', '6318052120', '', '', '', '', '', 'Brooklyn', 'US', 'New York', '', '', 'Brown race', 'YES', 'entrepreneur', '', 'master', '', 'Realtor', 'NO', 'ACTIVE', '2020-10-06 08:33:51', '2020-10-06 08:33:51'),
(65, '', 'Pierre', 'Brice', 'briolspierre44@gmail.com', '+50936925534', '', '', '', '', '', 'petion-ville', 'HT', 'ouest', '', '', 'Black', 'YES', 'entrepreneur', '', 'college', '', 'journaliste-graphics-monteur-cameraman-photographerp', 'NO', 'ACTIVE', '2020-10-06 11:29:35', '2020-10-06 11:29:35'),
(66, '', 'Jean-Baptiste', 'Lovensky', 'thomasproduction250@gmail.com', '+50949298371', '', '', '', '', '', 'Haiti', 'HT', 'Thomassin l''Ouest', '', '', 'Designer', 'YES', 'business', 'Business owner', 'other', 'Other', 'Designer & Unlocker', 'NO', 'ACTIVE', '2020-10-06 17:34:11', '2020-10-06 17:34:11'),
(67, '', 'Lens', 'Wolph', 'Wolphciceron@gmail.com', '+5511950555971', '', '', '', '', '', 'São Paulo ', 'BR', 'São Paulo ', '', '', 'Black', 'NO', 'student', '', 'college', '', 'Student', 'NO', 'ACTIVE', '2020-10-06 19:10:48', '2020-10-06 19:10:48'),
(68, '', 'Faby', 'Louis', 'Louisfaby1@gmail.com', '47997812357', '', '', '', '', '', 'CONCÓRDIA ', 'BR', 'Santa catarina ', '', '', 'Negre', 'NO', 'other', '', 'highschool', '', '', 'NO', 'ACTIVE', '2020-10-07 19:09:57', '2020-10-07 19:09:57'),
(69, '', 'Fritzner', 'Honore', 'Honorefritzner@yahoo.com', '(786) 406-0899', '', '', '', '', '', 'Miami Shores', 'US', 'FL', '', '', 'Black', 'NO', 'student', '', 'college', '', 'Front office Supervisor ', 'NO', 'ACTIVE', '2020-10-07 19:17:01', '2020-10-07 19:17:01'),
(70, '', 'Shelly', 'Samuels', 'rnshelly74@gmail.com', '470-207-3323', '', '', '', '', '', 'Hobbs', 'US', 'New Mexico ', '', '', 'Caucasian', 'NO', 'employee', '', 'associate', '', 'Registered Nurse ', 'NO', 'ACTIVE', '2020-10-08 16:51:20', '2020-10-08 16:51:20'),
(71, '', 'Olege', 'Vital ', 'Vitalolege71@gmail.com', '5166678782', '', '', '', '', '', 'Hempstead ', 'US', 'New York ', '', '', 'Black', 'NO', 'employee', '', 'college', '', '', 'NO', 'ACTIVE', '2020-10-08 19:01:16', '2020-10-08 19:01:16'),
(72, '', 'Persona', 'Mathurin', 'mathurinpersona@hotmail.com', '9293876822', '', '', '', '', '', 'Brooklyn', 'US', 'NY', '', '', 'Black', 'NO', 'entrepreneur', '', 'college', '', 'Financial Controler', 'NO', 'ACTIVE', '2020-10-08 21:45:57', '2020-10-08 21:45:57'),
(73, '', 'Jasmine', 'Mergilles', 'jasminemergilles@gmail.com', '7186685174', '', '', '', '', '', 'Brooklyn', 'US', 'New York', '', '', 'Black', 'YES', 'business', '', 'college', '', 'District manager ', 'NO', 'ACTIVE', '2020-10-10 04:04:20', '2020-10-10 04:04:20'),
(74, '', 'Helberth ', 'Vargas', 'rocktelevisioncolombia@yahoo.com', '5165956349', '', '', '', '', '', 'Glen cove ', 'US', 'New York ', '', '', 'Latino', 'YES', 'business', '', 'associate', '', 'Video and Radio producer', 'NO', 'ACTIVE', '2020-10-11 19:37:16', '2020-10-11 19:37:16'),
(75, '', 'Jole', 'Wilmore', 'jolewilmore31@gmail.com', '44044916', '', '', '', '', '', 'Cap-haïtien ', 'HT', 'Nord', '', '', 'Haïtien ', 'NO', 'employee', '', 'bachelor', '', 'Informaticien ', 'NO', 'ACTIVE', '2020-10-12 01:15:41', '2020-10-12 01:15:41'),
(76, '', 'Jean Othniel Yonel Junior', 'Eloi', 'ejoyj83@gmail.com', '46904143', '', '', '', '', '', 'Haiti', 'HT', 'Croix-des-Bouquets', '', '', 'Noire', 'NO', 'employee', '', 'college', '', 'Manager', 'NO', 'ACTIVE', '2020-10-12 12:21:40', '2020-10-12 12:21:40'),
(77, '', 'Jean-Ronel', 'Dorvil', 'jnroro2000@yahoo.fr', '50933619454', '', '', '', '', '', 'Fort-Liberte', 'HT', 'Nord-est', '', '', 'Haitien', 'YES', 'entrepreneur', '', 'bachelor', '', 'Informaticien', 'NO', 'ACTIVE', '2020-10-12 17:03:39', '2020-10-12 17:03:39'),
(78, '', 'Lionel', 'Francois', 'Lionelfrancois77@yahoo.com', '509-49268624', '', '', '', '', '', 'Haïti ', 'US', 'Carrefour ', '', '', 'Haitian ', 'YES', 'entrepreneur', '', 'college', '', 'Entrepreneur ', 'NO', 'ACTIVE', '2020-10-13 03:43:58', '2020-10-13 03:43:58'),
(79, '', 'Schnaider', 'Derisier', 'derisierschnaider3@gmail.com', '33178881', '', '', '', '', '', 'Delmas', 'HT', 'Port au prince', '', '', 'Haiti', 'YES', 'school', '', 'bachelor', '', 'Graphiste design, videographer, photograve, cineastre, actor.', 'NO', 'ACTIVE', '2020-10-13 03:44:08', '2020-10-13 03:44:08'),
(80, '', 'Azar', 'Fransaint', 'fransaint98@gmail.com', '438-764-9534', '', '', '', '', '', 'Montreal', 'CA', 'Quebec', '', '', 'Black', 'NO', 'employer', '', 'college', '', 'Informatique', 'NO', 'ACTIVE', '2020-10-13 03:46:05', '2020-10-13 03:46:05'),
(81, '', 'Getro', 'Etienne', 'harmonyst61@gmail.com', '48988704336', '', '', '', '', '', 'BRACO DO NORTE', 'BR', 'santa catarina', '', '', 'haitienne', 'YES', 'employee', '', 'highschool', 'Rheto', 'Depannage d´ordinateur', 'NO', 'ACTIVE', '2020-10-13 03:52:12', '2020-10-13 03:52:12'),
(82, '', 'Ercen', 'Rodnez', 'Ercenrodnez2019@gmail.com', '4382269178', '', '', '', '', '', 'Montréal ', 'CA', 'Canada ', '', '', 'Haïtienne ', 'NO', 'employee', 'BELRON Canada ', 'highschool', '', 'Coach', 'NO', 'ACTIVE', '2020-10-13 03:52:56', '2020-10-13 03:52:56'),
(83, '', 'Eugene', 'Camelie', 'camelieeugene782@gmail.com', '+50942903260', '', '', '', '', '', 'Cap Haitian', 'HT', 'Nord', '', '', 'Haitian', 'YES', 'business', '', 'highschool', '', 'Businessman', 'NO', 'ACTIVE', '2020-10-13 04:05:19', '2020-10-13 04:05:19'),
(84, '', 'louis', 'Mykel', 'louismykel06@gmail.com', '50937948324', '', '', '', '', '', 'Saint marc haiti', 'HT', 'Saint marc', '', '', 'Haïtienne ', 'YES', 'other', '', 'other', '', 'Informaticiens Graphiste Photographe Editer video', 'NO', 'ACTIVE', '2020-10-13 04:08:10', '2020-10-13 04:08:10'),
(85, '', 'Eugene', 'Camelie', 'camelieeugene782@gmail.com', '+50942903260', '', '', '', '', '', 'Cap Haitian', 'HT', 'Nord', '', '', 'Haitian', 'YES', 'business', '', 'highschool', '', 'Businessman', 'NO', 'ACTIVE', '2020-10-13 04:09:06', '2020-10-13 04:09:06'),
(86, '', 'Fortune', 'Max Abraham', 'abbyfortune9@gmail.com', '+50934306271', '', '', '', '', '', 'Cayes', 'HT', 'Sud', '', '', 'Haïtien', 'NO', 'other', '', 'other', '', 'Graphiste and videography', 'NO', 'ACTIVE', '2020-10-13 04:09:47', '2020-10-13 04:09:47'),
(87, '', 'Carter', 'Joseph', 'Joscarter80@gmail.com', '509 3222 0409', '', '', '', '', '', 'Delmas', 'HT', 'Ouest', '', '', 'Haitien', 'YES', 'employee', '', 'highschool', '', 'Graphiste', 'NO', 'ACTIVE', '2020-10-13 04:15:02', '2020-10-13 04:15:02'),
(88, '', 'Hugueneau ', 'Fontus', 'hugueneauffontus@gmail.com', '50934018880', '', '', '', '', '', 'Grand Goave', 'HT', '', '', '', 'Haitian', 'YES', 'student', '', 'college', '', 'English Teacher', 'NO', 'ACTIVE', '2020-10-13 04:19:54', '2020-10-13 04:19:54'),
(89, '', 'Alex', 'Belizaire', 'texieiradasilvar@hotmail.com', '+18492259888', '', '', '', '', '', 'Saint-dominque', 'DO', 'Santiago de los caba', '', '', 'M', 'YES', 'employer', '', 'highschool', '', 'Electricite', 'NO', 'ACTIVE', '2020-10-13 04:32:12', '2020-10-13 04:32:12'),
(90, '', 'Ronaldson', 'Marcellus', 'ronoofficial@gmail.com', '+5900690840063', '', '', '', '', '', 'Abymes', 'GP', 'Guadeloupe', '', '', 'Haïtien ', 'YES', 'student', '', 'bachelor', '', 'Aucune ', 'NO', 'ACTIVE', '2020-10-13 04:33:48', '2020-10-13 04:33:48'),
(91, '', 'Louis', 'Junior', 'Juniorlouis871@gmail.com', '+56975456358', '', '', '', '', '', 'Chile', 'CL', 'Villarrica', '', '', 'Jun', 'YES', 'employer', 'Employer', 'college', 'College', 'Technicien an macaniquecauto', 'NO', 'ACTIVE', '2020-10-13 04:44:21', '2020-10-13 04:44:21'),
(92, '', 'Flamel', 'Castelant', 'flamel1478@gmail.com', '935031541', '', '', '', '', '', 'Metropolitana', 'CL', 'Santiago', '', '', 'Haitiano', 'NO', 'entrepreneur', 'Entrepreneur', 'bachelor', '', 'Informática', 'NO', 'ACTIVE', '2020-10-13 04:45:34', '2020-10-13 04:45:34'),
(93, '', 'Viguer ', 'Petit-homme ', 'richeanie@gmail.com', '+5545984326656', '', '', '', '', '', 'Toledo', 'BR', 'Paraná', '', '', 'Haïtien ', 'YES', 'employer', 'Employeur ', 'highschool', '', 'Animateur radio', 'NO', 'ACTIVE', '2020-10-13 10:00:48', '2020-10-13 10:00:48'),
(94, '', 'gabriel', 'fenel', 'fenelgaby@yahoo.com', '34520361', '', '', '', '', '', 'mirebalais', 'HT', 'cange', '', '', 'comptable', 'YES', 'employee', 'employe', 'master', 'licence', 'comptable et informaticien', 'NO', 'ACTIVE', '2020-10-13 10:36:59', '2020-10-13 10:36:59'),
(95, '', 'Ricardo', 'Senatus', 'senatuscarlo@gmail.com', '43213812', '', '', '', '', '', 'Delmas', 'HT', 'Port au Prince', '', '', 'African', 'YES', 'student', '', 'bachelor', '', 'Supply chain manager', 'NO', 'ACTIVE', '2020-10-13 11:44:57', '2020-10-13 11:44:57'),
(96, '', 'Jean Duckens', 'SANNON', 'sanonjeanduckens@gmail.com', '+50936391656', '', '', '', '', '', 'Port au Prince', 'HT', '', '', '', 'Black', 'NO', 'student', '', 'college', '', 'Informaticien', 'NO', 'ACTIVE', '2020-10-13 13:09:55', '2020-10-13 13:09:55'),
(97, '', 'adeline', 'lindor', 'adelinelindor@gmail.com', '7578943970', '', '', '', '', '', 'parksley', 'US', 'viginia', '', '', 'haiti', 'YES', 'employee', '', 'other', '', 'i''m a worker', 'NO', 'ACTIVE', '2020-10-13 14:10:47', '2020-10-13 14:10:47'),
(98, '', 'fenel', 'gabriel', 'fenelgaby@yahoo.com', '34520361', '', '', '', '', '', 'mirebalais', 'HT', 'cange', '', '', 'haitian', 'YES', 'employee', 'employe', 'master', 'masters degree', 'comptable et informaticien', 'NO', 'ACTIVE', '2020-10-13 14:11:01', '2020-10-13 14:11:01'),
(99, '', 'Adeline', 'Lindor', 'Adelinelindor@gmail.com', '7578943970', '', '', '', '', '', 'Parksley', 'US', 'Viginia', '', '', 'Haiti', 'YES', 'other', 'Employee', 'other', 'High school', 'Working ', 'NO', 'ACTIVE', '2020-10-13 14:20:37', '2020-10-13 14:20:37'),
(100, '', 'Laurie', 'Louis', 'lauriebee91@gmail.com', '6315759226', '', '', '', '', '', 'Deer Park', 'US', 'New York', '', '', 'Haitian', 'NO', 'employee', '', 'bachelor', '', 'Senior representative', 'NO', 'ACTIVE', '2020-10-13 14:26:41', '2020-10-13 14:26:41'),
(101, '', 'Samuel', 'Hilaire ', 'samuelhilaire62@gmail.com', '4376 0629 ', '', '', '', '', '', 'Delmas ', 'HT', 'Ouest', '', '', 'Haïtienne ', 'YES', 'employer', '', 'bachelor', '', 'Lawyer/Dentist ', 'NO', 'ACTIVE', '2020-10-13 15:41:48', '2020-10-13 15:41:48'),
(102, '', 'Fortune', 'jean fortin', 'Jeanfortinfortune@gmail.com', 'Cloteauf', '', '', '', '', '', ' port-au prince ', 'HT', 'america', '', '', 'Haïtien', 'NO', 'entrepreneur', 'Entrepreneur', 'highschool', 'High school', 'Plomberie', 'NO', 'ACTIVE', '2020-10-13 16:19:36', '2020-10-13 16:19:36'),
(103, '', 'Marie Rosemée', 'FRANÇOIS', 'francoismarierosemee@gmail.com', '36286156', '', '', '', '', '', 'Port au prince ', 'HT', '', '', '', 'Noire ', 'NO', 'student', '', 'college', '', 'Sciences informatiques', 'NO', 'ACTIVE', '2020-10-13 23:52:21', '2020-10-13 23:52:21'),
(104, '', 'Marie Fanie ', 'St Louis', 'mariefanie19733@gmail.com', '(509)33905811; 4', '', '', '', '', '', '55 Impasse Monoville, ', 'HT', 'Juvenat Petionville ', '', '', 'Black ', 'NO', 'entrepreneur', '', 'bachelor', '', 'Journalist ', 'NO', 'ACTIVE', '2020-10-14 03:35:00', '2020-10-14 03:35:00'),
(105, '', 'Mickelly', 'Exume ', 'myckebennett8@gmail.com', '01150931274925', '', '', '', '', '', 'Port-au-Prince ', 'HT', 'Petion-Ville', '', '', 'Black ', 'NO', 'entrepreneur', '', 'bachelor', '', 'Technicien en informatique / Electrotechnicien', 'NO', 'ACTIVE', '2020-10-14 03:53:45', '2020-10-14 03:53:45'),
(106, '', 'Solange ', 'Beauge', 'nadia11570@yahoo.com', '01150943434343', '', '', '', '', '', 'Port-au-Prince ', 'HT', 'Carrefour ', '', '', 'Black / Cuban', 'NO', 'entrepreneur', '', 'highschool', 'Technical school ', 'Baker', 'NO', 'ACTIVE', '2020-10-14 03:58:39', '2020-10-14 03:58:39'),
(107, '', 'Linnear', 'Williams', 'Linnearwilliams@gmail.com', '(347) 307-0453', '', '', '', '', '', 'Brooklyn', 'US', 'new York', '', '', 'African American', 'YES', 'employee', '', 'highschool', '', 'Event planner', 'NO', 'ACTIVE', '2020-10-14 11:06:09', '2020-10-14 11:06:09'),
(108, '', 'Peterson', 'Louissaint', 'louissaint.peterson1@gmail.com', '4386224262', '', '', '', '', '', 'Montreal', 'CA', 'Québec', '', '', 'chritian', 'NO', 'entrepreneur', '', 'highschool', '', 'informatique', 'NO', 'ACTIVE', '2020-10-14 12:07:45', '2020-10-14 12:07:45'),
(109, '', 'Kemisha', 'Cole', 'Kemishasmile@gmail.com', '9179420049', '', '', '', '', '', 'Hempstead', 'US', 'New York', '', '', 'African American ', 'YES', 'entrepreneur', '', 'associate', '', '', 'NO', 'ACTIVE', '2020-10-14 17:25:39', '2020-10-14 17:25:39'),
(110, '', 'Shelly', 'William', 'shellywilliam759@gmail.com', '(718) 431-3419', '', '', '', '', '', ' Bronx', 'US', 'NY', '', '', 'Guyanese', 'YES', 'other', '', 'associate', '', 'Patient care technician ', 'NO', 'ACTIVE', '2020-10-14 19:05:58', '2020-10-14 19:05:58'),
(111, '', 'Madline', 'Saint Marc', 'madline0804@yahoo.com', '(404) 496–1858', '', '', '', '', '', 'Douglasville', 'US', 'Ga', '', '', 'Black ', 'NO', 'entrepreneur', '', 'master', '', 'Administration ', 'NO', 'ACTIVE', '2020-10-14 21:04:02', '2020-10-14 21:04:02'),
(112, '', 'Vladimir', 'Andre', 'vladcimix@hotmail.com', '9292894226', '', '', '', '', '', 'Brooklyn', 'US', 'new york', '', '', 'black', 'YES', 'business', '', 'college', '', 'Informaticien/testeur', 'NO', 'ACTIVE', '2020-10-14 23:17:26', '2020-10-14 23:17:26'),
(113, '', 'Akinola', 'Boluwatife', 'akinolabolutife@gmail.com', '08133775913', '', '', '', '', '', 'Ibadan', 'NG', 'Oyo', '', '', 'Yoruba', 'YES', 'entrepreneur', '', 'bachelor', '', 'Sales man/Footballer', 'NO', 'ACTIVE', '2020-10-14 23:38:00', '2020-10-14 23:38:00'),
(114, '', 'rose daphna', 'chery', 'daphnachery16@gmail.com', '+5926914138', '', '', '', '', '', 'Georgetown', 'GY', '', '', '', 'haitian', 'YES', 'employee', '', 'college', '', 'cosmetology', 'NO', 'ACTIVE', '2020-10-15 01:53:25', '2020-10-15 01:53:25'),
(115, '', 'Jean', 'Remilus', 'Remilusjean@yahoo.com', 'Remilusjean@yaho', '', '', '', '', '', 'Nassau Bahamas ', 'US', 'Nassau Bahamas ', '', '', 'Haitien', 'YES', 'other', 'Barbershop ', 'college', 'Les normalien reunie ', 'Barber man', 'NO', 'ACTIVE', '2020-10-15 01:59:58', '2020-10-15 01:59:58'),
(116, '', 'Jacques', 'Joachim', 'jackydesigner509@gmail.com', '+509 3689 0249', '', '', '', '', '', 'Pétionville', 'HT', 'Port-au-Prince', '', '', 'Black', 'YES', 'business', '', 'associate', '', 'Graphic & Web Design', 'NO', 'ACTIVE', '2020-10-15 11:32:27', '2020-10-15 11:32:27'),
(117, '', 'Pierre', 'Marc Daniel', 'marcdanielpierre01@gmail.com', '+50944838704', '', '', '', '', '', 'Jérémie', 'HT', 'Grand Ans ', '', '', 'Christianisme ', 'YES', 'school', '', 'college', '', '', 'NO', 'ACTIVE', '2020-10-15 15:16:22', '2020-10-15 15:16:22'),
(118, '', 'Luny', 'Depre', 'godlyluna1217@gmail.com', '5168516584', '', '', '', '', '', 'Rosedale ', 'US', 'NY', '', '', 'Black ', 'NO', 'employee', '', 'associate', '', 'RN', 'NO', 'ACTIVE', '2020-10-15 17:56:47', '2020-10-15 17:56:47'),
(119, '', 'Sianna ', 'Leavy', 'Sianna_leavy@yahoo.com', '+1 (646) 232-889', '', '', '', '', '', 'New York', 'US', 'New York ', '', '', 'Black ', 'YES', 'student', '', 'bachelor', '', 'Freelancer', 'NO', 'ACTIVE', '2020-10-15 19:05:10', '2020-10-15 19:05:10'),
(120, '', 'Lauren', 'Compas', 'Laurenccompas@gmaill.com', '(516) 469-0823', '', '', '', '', '', 'Rosedale ', 'US', 'New York ', '', '', 'Black ', 'NO', 'student', '', 'bachelor', '', 'Nursing ', 'NO', 'ACTIVE', '2020-10-15 19:07:57', '2020-10-15 19:07:57'),
(121, '', 'Argentine ', 'Belfort ', 'abiguena15@gmail.com', '(631) 805-0886', '', '', '', '', '', 'Bayshore ', 'US', 'New. York', '', '', 'Black ', 'NO', 'entrepreneur', '', 'doctorate', '', 'Nurse Practitioner ', 'NO', 'ACTIVE', '2020-10-15 19:12:23', '2020-10-15 19:12:23'),
(122, '', 'Natacha ', 'Germain ', 'ngermain78@yahoo.com', '+1 (347) 319-291', '', '', '', '', '', 'Brentwood ', 'US', 'New York ', '', '', 'Black ', 'NO', 'employee', '', 'college', '', 'Healthcare ', 'NO', 'ACTIVE', '2020-10-15 19:48:44', '2020-10-15 19:48:44'),
(123, '', 'Nusla', 'Merlus', 'Nusla2718@gmail.com', '6314027839', '', '', '', '', '', 'Huntington ', 'US', 'New york', '', '', 'Black ', 'YES', 'other', '', 'bachelor', '', 'Finance', 'NO', 'ACTIVE', '2020-10-15 20:39:55', '2020-10-15 20:39:55'),
(124, '', 'Ralph', 'Champagne', 'rcfinancial75@gmail.com', '4043977983', '', '', '', '', '', 'Mcdonough', 'US', 'Ga', '', '', 'Haitian/ Black', 'NO', 'entrepreneur', '', 'college', 'Some College', 'Real Estate Investor', 'NO', 'ACTIVE', '2020-10-15 20:58:25', '2020-10-15 20:58:25'),
(125, '', 'Weskervens', 'Saint-julien', 'weskervenssaintjulien2000@gmail.com', '+1829-557-0703', '', '', '', '', '', 'Santo-Domingo', 'DO', 'Cancino Adentro', '', '', 'Home', 'YES', 'entrepreneur', '', 'other', '', 'Designer', 'NO', 'ACTIVE', '2020-10-15 22:14:23', '2020-10-15 22:14:23'),
(126, '', 'jacky', 'pierre', 'Darlinefrancois@gmail.com', '7729404877', '', '', '', '', '', 'indianapolis', 'US', 'Indiana', '', '', 'black africa', 'NO', 'employee', '', 'highschool', '', '', 'NO', 'ACTIVE', '2020-10-15 23:53:22', '2020-10-15 23:53:22'),
(127, '', 'Wilza', 'David ', 'Wilzadavid1982@gmail.com', '954 861 7215 ', '', '', '', '', '', 'Orlando ', 'US', 'Fl', '', '', 'Black ', 'NO', 'other', '', 'highschool', '', '', 'NO', 'ACTIVE', '2020-10-16 02:16:48', '2020-10-16 02:16:48'),
(128, '', 'Abdias', 'Beausejour', 'abdiasandone@gmail.com', '8093189076', '', '', '', '', '', 'Santo Domingo', 'DO', 'Santo Domingo Este', '', '', 'Black Haitian', 'YES', 'employee', '', 'bachelor', '', '', 'NO', 'ACTIVE', '2020-10-16 06:32:27', '2020-10-16 06:32:27'),
(129, '', 'Gina', 'Larochelle ', 'Gmidy35@gmail.com', '5164761142', '', '', '', '', '', 'Uniondale', 'CX', 'Ny', '', '', 'Haitian', 'NO', 'business', '', 'bachelor', '', 'Nursing', 'NO', 'ACTIVE', '2020-10-16 11:49:25', '2020-10-16 11:49:25'),
(130, '', 'Patrick', 'NORDELY', 'patricknordely0@gmail.com', '+50948406792', '', '', '', '', '', 'Port-au-Prince', 'HT', '', '', '', 'Clair', 'YES', 'entrepreneur', '', 'college', '', 'Sérigraphie(t-shirt designer)', 'NO', 'ACTIVE', '2020-10-16 14:13:08', '2020-10-16 14:13:08'),
(131, '', 'Bertrand', 'Lapointe', 'bertrandlapointe91@gmail.com', '9178488718', '', '', '', '', '', 'Jamaica', 'US', 'New York', '', '', 'Black African', 'NO', 'student', '', 'other', '', '', 'NO', 'ACTIVE', '2020-10-16 22:01:02', '2020-10-16 22:01:02'),
(132, '', 'Angella', 'Jacques', 'drangellajacques@gmail.com', '9543945238', '', '', '', '', '', 'North Lauderdale', 'US', 'FL', '', '', 'African American ', 'NO', 'employee', '', 'doctorate', '', 'Medical doctor ', 'NO', 'ACTIVE', '2020-10-17 02:13:57', '2020-10-17 02:13:57'),
(133, '', 'Shetza', 'Gedeon', 'shetzag@gmail.com', '5166032184', '', '', '', '', '', 'Boynton beach ', 'US', 'Florida', '', '', 'Black', 'NO', 'employee', '', 'associate', '', 'Medical assistant', 'NO', 'ACTIVE', '2020-10-17 02:42:44', '2020-10-17 02:42:44'),
(134, '', 'Nicola ', 'Celestin', 'n.houslin@gmail.com', '516-2902737', '', '', '', '', '', 'West Hempstead ', 'US', 'NY', '', '', 'Black ', 'NO', 'other', '', 'master', '', 'Nursing ', 'NO', 'ACTIVE', '2020-10-17 02:59:49', '2020-10-17 02:59:49'),
(135, '', 'RONALD', 'Toussaint', 'rtoussaint@dharcker.com', '5614630643', '', '', '', '', '', 'QUINCY', 'US', 'ma', '', '', 'QUINCY', 'YES', 'business', 'DHARCKER, LLC', 'bachelor', 'MANAGEMENT INFORMATION SYSTEMS', 'NETWORK ENGINEER', 'NO', 'ACTIVE', '2020-10-17 07:19:15', '2020-10-17 07:19:15'),
(136, '', ' Yams', 'Sheriff', 'yamssheriff@gmail.com', '+50938470411', '', '', '', '', '', 'Haiti', 'HT', 'Port au prince', '', '', 'Haitien', 'YES', 'entrepreneur', '', 'highschool', '', 'Informaticien/Etudiant en cybersecurity', 'NO', 'ACTIVE', '2020-10-17 10:14:41', '2020-10-17 10:14:41'),
(137, '', 'Helberth', 'Vargas', 'rocktelevisioncolombia@yahoo.com', '5165956349', '', '', '', '', '', 'Glen cove ', 'US', 'New York ', '', '', 'Latino', 'YES', 'business', '', 'associate', '', 'Video producer', 'NO', 'ACTIVE', '2020-10-17 12:51:47', '2020-10-17 12:51:47'),
(138, '', 'Ronel ', 'Paul ', 'petitcanada94@gmail.com', '33249396', '', '', '', '', '', 'Gonaives', 'HT', 'Pas aux États-Unis n', '', '', 'Haitien', 'YES', 'business', '', 'college', '', 'Publicitaire(VOIX-OFF)', 'NO', 'ACTIVE', '2020-10-17 15:31:54', '2020-10-17 15:31:54'),
(139, '', 'test', 'test', 'contact@ewebsolutions.fr', '0627107296', '', '', '', '', '', 'MARRAKECH', 'MA', '', '', '', '?', 'YES', 'employer', '', 'associate', '', 'engineer', 'NO', 'ACTIVE', '2020-10-17 16:38:18', '2020-10-17 16:38:18'),
(140, '', 'Jean Duckens', 'SANNON', 'sanonjeanduckens@gmail.com', '+50936391656', '', '', '', '', '', 'Port au Prince', 'HT', '', '', '', 'Black', 'NO', 'student', '', 'college', '', 'Computer scientist', 'NO', 'ACTIVE', '2020-10-17 23:15:51', '2020-10-17 23:15:51'),
(141, '', 'Lewis Ivens', 'Cerilia', 'lewis2cuteboy@gmail.com', '37962390', '', '', '', '', '', 'Port-au-prince', 'HT', '', '', '', 'Black', 'NO', 'school', '', 'college', '', 'Graphic Designer', 'NO', 'ACTIVE', '2020-10-17 23:37:27', '2020-10-17 23:37:27'),
(142, '', 'Jhana-Marie', 'Newkirk', 'itsallnunew@gmail.com', '9196007202', '', '', '', '', '', 'Cary', 'US', 'North Carolina', '', '', 'Black/Hispanic', 'YES', 'entrepreneur', '', 'master', '', 'Makeup Artist', 'NO', 'ACTIVE', '2020-10-17 23:43:05', '2020-10-17 23:43:05'),
(143, '', 'Arens', 'Alexis', 'Arenslaexis@yahoo.com', '9545128608', '', '', '', '', '', 'Coconut Creek ', 'US', 'Florida ', '', '', 'Black', 'YES', 'other', '', 'bachelor', '', 'Registered Respiratory Therapist, BAS IT', 'NO', 'ACTIVE', '2020-10-17 23:57:03', '2020-10-17 23:57:03'),
(144, '', 'Evelyn', 'Humphreys', 'ehu_hum@yahoo.com', '6465540055', '', '', '', '', '', 'New Yorl', 'US', 'New York', '', '', 'African American ', 'NO', 'other', '', 'master', '', 'Registrar', 'NO', 'ACTIVE', '2020-10-18 00:19:15', '2020-10-18 00:19:15'),
(145, '', 'Saint--louis ', 'Naomie vixcean ', 'Njienimie@yahoo.fr', '509 43392202', '', '', '', '', '', 'Port  au prince', 'HT', '', '', '', 'Black', 'YES', 'student', '', 'bachelor', '', 'Communicate relation public', 'NO', 'ACTIVE', '2020-10-18 12:17:23', '2020-10-18 12:17:23');

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_request`
--

CREATE TABLE IF NOT EXISTS `t_customer_request` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gender` enum('Mr','Ms','Mrs') COLLATE utf8_bin NOT NULL,
  `firstname` varchar(64) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(64) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(16) COLLATE utf8_bin NOT NULL,
  `fax` varchar(16) COLLATE utf8_bin NOT NULL,
  `adress1` varchar(255) COLLATE utf8_bin NOT NULL,
  `adress2` varchar(255) COLLATE utf8_bin NOT NULL,
  `avatar` varchar(64) COLLATE utf8_bin NOT NULL,
  `postcode` char(10) COLLATE utf8_bin NOT NULL,
  `city` varchar(128) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `state` varchar(20) COLLATE utf8_bin NOT NULL,
  `message` varchar(255) COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_customer_user_advert_i18n_notation`
--

CREATE TABLE IF NOT EXISTS `t_customer_user_advert_i18n_notation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sender` enum('EMPLOYEE','EMPLOYER') COLLATE utf8_bin NOT NULL,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `employer_criteria_id` int(11) unsigned DEFAULT NULL,
  `employee_criteria_id` int(11) unsigned DEFAULT NULL,
  `employee_advert_id` int(11) unsigned DEFAULT NULL,
  `employee_advert_lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `employer_advert_id` int(11) unsigned DEFAULT NULL,
  `employer_advert_lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `work_id` int(11) unsigned NOT NULL,
  `project_id` int(11) unsigned NOT NULL,
  `quotation_id` int(11) unsigned NOT NULL,
  `notation` int(11) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=200 ;

--
-- Contenu de la table `t_customer_user_advert_i18n_notation`
--

INSERT INTO `t_customer_user_advert_i18n_notation` (`id`, `sender`, `employee_user_id`, `employer_user_id`, `employer_criteria_id`, `employee_criteria_id`, `employee_advert_id`, `employee_advert_lang`, `employer_advert_id`, `employer_advert_lang`, `work_id`, `project_id`, `quotation_id`, `notation`, `created_at`, `updated_at`) VALUES
(189, 'EMPLOYER', 17, 9, NULL, 1, NULL, '', 71, 'en', 27, 33, 39, 6, '2020-10-13 12:22:44', '2020-10-13 12:22:44'),
(190, 'EMPLOYER', 17, 9, NULL, 8, NULL, '', 71, 'en', 27, 33, 39, 4, '2020-10-13 12:22:44', '2020-10-13 12:22:44'),
(191, 'EMPLOYER', 17, 9, NULL, 2, NULL, '', 71, 'en', 27, 33, 39, 6, '2020-10-13 12:22:44', '2020-10-13 12:22:44'),
(192, 'EMPLOYER', 17, 9, NULL, 7, NULL, '', 71, 'en', 27, 33, 39, 3, '2020-10-13 12:22:44', '2020-10-13 12:22:44'),
(193, 'EMPLOYEE', 17, 9, 1, NULL, NULL, '', 71, 'en', 27, 33, 39, 2, '2020-10-15 07:30:17', '2020-10-15 07:30:17'),
(194, 'EMPLOYEE', 17, 9, 2, NULL, NULL, '', 71, 'en', 27, 33, 39, 3, '2020-10-15 07:30:17', '2020-10-15 07:30:17'),
(195, 'EMPLOYEE', 17, 9, 3, NULL, NULL, '', 71, 'en', 27, 33, 39, 4, '2020-10-15 07:30:17', '2020-10-15 07:30:17'),
(196, 'EMPLOYEE', 17, 9, 4, NULL, NULL, '', 71, 'en', 27, 33, 39, 5, '2020-10-15 07:30:17', '2020-10-15 07:30:17'),
(197, 'EMPLOYEE', 17, 9, 17, NULL, NULL, '', 71, 'en', 27, 33, 39, 3, '2020-10-15 07:30:17', '2020-10-15 07:30:17'),
(198, 'EMPLOYEE', 17, 9, 18, NULL, NULL, '', 71, 'en', 27, 33, 39, 3, '2020-10-15 07:30:17', '2020-10-15 07:30:17'),
(199, 'EMPLOYEE', 17, 9, 19, NULL, NULL, '', 71, 'en', 27, 33, 39, 3, '2020-10-15 07:30:17', '2020-10-15 07:30:17');

-- --------------------------------------------------------

--
-- Structure de la table `t_emailer_spooler`
--

CREATE TABLE IF NOT EXISTS `t_emailer_spooler` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `from` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `to` varchar(512) COLLATE utf8_bin NOT NULL,
  `cc` varchar(512) COLLATE utf8_bin NOT NULL,
  `bcc` varchar(512) COLLATE utf8_bin NOT NULL,
  `subject` varchar(512) COLLATE utf8_bin NOT NULL,
  `body` mediumtext COLLATE utf8_bin NOT NULL,
  `is_sent` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `sent_at` timestamp NULL DEFAULT NULL,
  `state` enum('SENT','INPROGRESS') COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(16) COLLATE utf8_bin DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=208 ;

--
-- Contenu de la table `t_emailer_spooler`
--

INSERT INTO `t_emailer_spooler` (`id`, `site_id`, `from`, `to`, `cc`, `bcc`, `subject`, `body`, `is_sent`, `sent_at`, `state`, `status`, `created_at`, `updated_at`) VALUES
(149, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:05:17', '2020-10-10 07:05:17'),
(150, NULL, 'contact@graphex.net', 'muntaz@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:05:17', '2020-10-10 07:05:17'),
(151, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:05:17', '2020-10-10 07:05:17'),
(152, NULL, 'contact@graphex.net', 'muntaz@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:05:17', '2020-10-10 07:05:17'),
(153, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:05:17', '2020-10-10 07:05:17'),
(154, NULL, 'contact@graphex.net', 'muntaz@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:05:17', '2020-10-10 07:05:17'),
(155, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:05:17', '2020-10-10 07:05:17'),
(156, NULL, 'contact@graphex.net', 'muntaz@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:05:17', '2020-10-10 07:05:17'),
(157, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(158, NULL, 'contact@graphex.net', 'employee3@test.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(159, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(160, NULL, 'contact@graphex.net', 'employee3@test.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(161, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(162, NULL, 'contact@graphex.net', 'employee3@test.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(163, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(164, NULL, 'contact@graphex.net', 'employee@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(165, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(166, NULL, 'contact@graphex.net', 'employee@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(167, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(168, NULL, 'contact@graphex.net', 'employee3@test.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(169, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(170, NULL, 'contact@graphex.net', 'employee3@test.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(171, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(172, NULL, 'contact@graphex.net', 'employee@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(173, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(174, NULL, 'contact@graphex.net', 'employee@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(175, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(176, NULL, 'contact@graphex.net', 'employee3@test.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(177, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(178, NULL, 'contact@graphex.net', 'employee3@test.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(179, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(180, NULL, 'contact@graphex.net', 'employee3@test.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(181, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(182, NULL, 'contact@graphex.net', 'employee3@test.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(183, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(184, NULL, 'contact@graphex.net', 'employee3@test.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(185, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(186, NULL, 'contact@graphex.net', 'employee3@test.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(187, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(188, NULL, 'contact@graphex.net', 'employee3@test.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(189, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(190, NULL, 'contact@graphex.net', 'employee3@test.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(191, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(192, NULL, 'contact@graphex.net', 'employee3@test.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(193, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(194, NULL, 'contact@graphex.net', 'employee3@test.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(195, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(196, NULL, 'contact@graphex.net', 'employee3@test.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(197, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(198, NULL, 'contact@graphex.net', 'muntaz@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(199, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(200, NULL, 'contact@graphex.net', 'muntaz@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(201, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(202, NULL, 'contact@graphex.net', 'muntaz@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(203, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(204, NULL, 'contact@graphex.net', 'muntaz@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:07:24', '2020-10-10 07:07:24'),
(205, NULL, 'contact@graphex.net', 'employer3@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employer revival request info\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:09:10', '2020-10-10 07:09:10'),
(206, NULL, 'contact@graphex.net', 'muntaz@free.fr', '', '', 'Request revival', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n           Employee revival request\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphex.net</h3>\n        </div>\n                </body>\n</html>\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 07:09:10', '2020-10-10 07:09:10');
INSERT INTO `t_emailer_spooler` (`id`, `site_id`, `from`, `to`, `cc`, `bcc`, `subject`, `body`, `is_sent`, `sent_at`, `state`, `status`, `created_at`, `updated_at`) VALUES
(207, NULL, 'contact@graphextech.com', 'employee3@test.fr', '', '', 'Quotation has been paid', '<!DOCTYPE html >\n<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">\n	<head>\n		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n    <meta name="viewport" content="width=device-width" />		\n	</head>\n    <body>      \n                               \n        <div class="container email" style="font-size:16px;margin-left:100px;">\n          employee3<br><br>\n                        Q2020092900055 employer3\n              \n            --\n            <div class="">\n              <img title="Logo" class="logo" src="http://www.project55.net/web/nocache/data/site/company/6/Graphex.png" alt="Logo">              \n            </div>\n            <h3>www.graphextech.com</h3>\n        </div>\n                </body>\n</html>\n\n', 'NO', NULL, NULL, 'ACTIVE', '2020-10-10 17:14:01', '2020-10-10 17:14:01');

-- --------------------------------------------------------

--
-- Structure de la table `t_emailer_spooler_scheduler`
--

CREATE TABLE IF NOT EXISTS `t_emailer_spooler_scheduler` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number_of_emails` int(11) unsigned DEFAULT NULL,
  `has_error` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `error_code` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `number_of_emails_sent` int(11) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_emailer_spooler_scheduler_email_sent`
--

CREATE TABLE IF NOT EXISTS `t_emailer_spooler_scheduler_email_sent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email_id` int(11) unsigned NOT NULL DEFAULT '0',
  `scheduler_id` int(11) unsigned NOT NULL DEFAULT '0',
  `error_code` varchar(255) COLLATE utf8_bin NOT NULL,
  `is_sent` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `sent_at` timestamp NULL DEFAULT NULL,
  `has_error` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `emailer_spooler_email_sent_1` (`scheduler_id`),
  KEY `emailer_spooler_email_sent_2` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_advert`
--

CREATE TABLE IF NOT EXISTS `t_employee_advert` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(32) COLLATE utf8_bin DEFAULT '',
  `budget` decimal(8,2) NOT NULL DEFAULT '0.00',
  `employee_user_id` int(11) unsigned NOT NULL,
  `number_of_languages` int(8) unsigned DEFAULT '0',
  `number_of_categories` int(8) unsigned DEFAULT '0',
  `number_of_documents` int(8) unsigned DEFAULT '0',
  `committed_at` datetime DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `refused_at` datetime DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `position` int(11) unsigned DEFAULT '0',
  `state` enum('UPLOAD','DRAFT','REFUSED','COMMITTED','PUBLISHED') COLLATE utf8_bin NOT NULL DEFAULT 'DRAFT',
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_advert_fk1` (`employee_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=60 ;

--
-- Contenu de la table `t_employee_advert`
--

INSERT INTO `t_employee_advert` (`id`, `reference`, `budget`, `employee_user_id`, `number_of_languages`, `number_of_categories`, `number_of_documents`, `committed_at`, `published_at`, `refused_at`, `expired_at`, `position`, `state`, `status`, `created_at`, `updated_at`) VALUES
(25, '2020053100025', 190.00, 17, 1, 2, 0, '2020-06-03 14:38:40', '2020-06-08 23:59:53', NULL, NULL, 0, 'PUBLISHED', 'ACTIVE', '2020-05-31 01:14:23', '2020-06-08 23:59:53'),
(27, '2020060900027', 150.00, 17, 2, 2, 3, '2020-06-09 00:11:20', '2020-06-09 00:12:10', NULL, NULL, 0, 'PUBLISHED', 'ACTIVE', '2020-06-09 00:09:20', '2020-06-09 00:12:10'),
(28, '2020060900028', 160.00, 17, 1, 4, 1, '2020-06-09 23:17:41', '2020-06-09 23:18:06', NULL, NULL, 0, 'PUBLISHED', 'ACTIVE', '2020-06-09 23:17:20', '2020-06-09 23:18:06'),
(29, '', 0.00, 17, 0, 0, 4, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-06-11 09:20:25', '2020-06-11 09:30:45'),
(30, '2020061500030', 0.00, 17, 1, 0, 3, NULL, NULL, NULL, NULL, 0, 'DRAFT', 'ACTIVE', '2020-06-15 10:42:31', '2020-07-10 12:04:45'),
(31, '2020070831', 0.00, 17, 1, 1, 1, '2020-07-08 23:41:37', '2020-07-08 23:42:06', NULL, NULL, 0, 'PUBLISHED', 'ACTIVE', '2020-07-08 23:41:01', '2020-07-08 23:42:06'),
(32, '2020090832', 150.00, 17, 1, 2, 1, '2020-09-08 18:28:20', '2020-09-08 18:28:34', NULL, NULL, 0, 'PUBLISHED', 'ACTIVE', '2020-09-08 18:26:32', '2020-09-08 18:28:34'),
(33, '', 0.00, 17, 0, 0, 2, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-09-08 23:40:19', '2020-09-08 23:40:35'),
(34, '2020090934', 700.00, 17, 1, 0, 1, '2020-09-10 22:30:05', '2020-09-10 22:31:58', NULL, NULL, 0, 'PUBLISHED', 'ACTIVE', '2020-09-09 14:18:12', '2020-09-10 22:31:58'),
(45, '', 0.00, 32, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-10-07 07:40:40', '2020-10-07 07:40:40'),
(46, '', 0.00, 32, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-10-07 07:40:57', '2020-10-07 07:40:57'),
(47, '2020100747', 50.00, 32, 1, 1, 1, '2020-10-07 07:52:46', '2020-10-07 08:23:51', NULL, NULL, 0, 'PUBLISHED', 'ACTIVE', '2020-10-07 07:42:09', '2020-10-07 08:23:51'),
(48, '', 0.00, 33, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-10-07 08:02:23', '2020-10-07 08:02:23'),
(49, '2020100749', 50.00, 33, 1, 1, 2, '2020-10-07 08:08:13', '2020-10-07 08:23:47', NULL, NULL, 0, 'PUBLISHED', 'ACTIVE', '2020-10-07 08:07:33', '2020-10-07 08:23:47'),
(50, '', 0.00, 34, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-10-07 08:11:54', '2020-10-07 08:11:54'),
(51, '2020100751', 100.00, 34, 1, 1, 0, NULL, NULL, NULL, NULL, 0, 'DRAFT', 'ACTIVE', '2020-10-07 08:13:24', '2020-10-07 08:13:24'),
(52, '', 0.00, 35, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-10-07 08:14:46', '2020-10-07 08:14:46'),
(53, '', 0.00, 35, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-10-07 08:15:13', '2020-10-07 08:15:13'),
(54, '', 0.00, 35, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-10-07 08:17:03', '2020-10-07 08:17:04'),
(55, '', 0.00, 35, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-10-07 08:17:19', '2020-10-07 08:17:19'),
(56, '2020100756', 70.00, 35, 1, 1, 2, '2020-10-07 08:22:07', '2020-10-07 08:23:27', NULL, NULL, 0, 'PUBLISHED', 'ACTIVE', '2020-10-07 08:18:43', '2020-10-07 08:23:27'),
(57, '2020100757', 600.00, 17, 1, 1, 0, '2020-10-13 23:12:55', NULL, '2020-10-13 23:15:12', NULL, 0, 'REFUSED', 'ACTIVE', '2020-10-07 11:07:55', '2020-10-13 23:15:12'),
(58, '2020102058', 0.00, 43, 1, 0, 0, NULL, NULL, NULL, NULL, 0, 'DRAFT', 'ACTIVE', '2020-10-20 23:12:55', '2020-10-20 23:12:55'),
(59, '2020102059', 0.00, 44, 1, 0, 0, NULL, NULL, NULL, NULL, 0, 'DRAFT', 'ACTIVE', '2020-10-20 23:17:43', '2020-10-20 23:17:43');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_advert_category`
--

CREATE TABLE IF NOT EXISTS `t_employee_advert_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `advert_id` int(11) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_advert_category_fk0` (`advert_id`),
  KEY `employee_advert_category_fk1` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=25 ;

--
-- Contenu de la table `t_employee_advert_category`
--

INSERT INTO `t_employee_advert_category` (`id`, `advert_id`, `category_id`, `created_at`, `updated_at`) VALUES
(5, 25, 2, '2020-06-03 14:38:12', '2020-06-03 14:38:12'),
(6, 25, 4, '2020-06-03 14:38:12', '2020-06-03 14:38:12'),
(9, 27, 2, '2020-06-09 00:09:20', '2020-06-09 00:09:20'),
(10, 27, 4, '2020-06-09 00:09:20', '2020-06-09 00:09:20'),
(11, 28, 2, '2020-06-09 23:17:37', '2020-06-09 23:17:37'),
(12, 28, 4, '2020-06-09 23:17:37', '2020-06-09 23:17:37'),
(13, 28, 5, '2020-06-09 23:17:37', '2020-06-09 23:17:37'),
(14, 28, 6, '2020-06-09 23:17:37', '2020-06-09 23:17:37'),
(15, 28, 14, '2020-06-09 23:17:37', '2020-06-09 23:17:37'),
(16, 31, 2, '2020-07-08 23:41:01', '2020-07-08 23:41:01'),
(17, 27, 11, '2020-08-20 00:16:45', '2020-08-20 00:16:45'),
(18, 32, 2, '2020-09-08 18:27:46', '2020-09-08 18:27:46'),
(19, 32, 3, '2020-09-08 18:27:46', '2020-09-08 18:27:46'),
(20, 47, 3, '2020-10-07 07:42:09', '2020-10-07 07:42:09'),
(21, 49, 2, '2020-10-07 08:07:33', '2020-10-07 08:07:33'),
(22, 51, 6, '2020-10-07 08:13:24', '2020-10-07 08:13:24'),
(23, 56, 6, '2020-10-07 08:21:35', '2020-10-07 08:21:35'),
(24, 57, 2, '2020-10-13 23:11:37', '2020-10-13 23:11:37');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_advert_document`
--

CREATE TABLE IF NOT EXISTS `t_employee_advert_document` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(128) COLLATE utf8_bin NOT NULL,
  `extension` varchar(10) COLLATE utf8_bin NOT NULL,
  `advert_id` int(11) unsigned NOT NULL,
  `employee_user_id` int(11) unsigned NOT NULL,
  `filesize` int(11) unsigned DEFAULT NULL,
  `is_public` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'Y',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_advert_document_fk0` (`advert_id`),
  KEY `employee_advert_document_fk1` (`employee_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=31 ;

--
-- Contenu de la table `t_employee_advert_document`
--

INSERT INTO `t_employee_advert_document` (`id`, `file`, `extension`, `advert_id`, `employee_user_id`, `filesize`, `is_public`, `created_at`, `updated_at`) VALUES
(1, 'avatar-corretor-350x350.png', 'png', 27, 17, 87883, 'Y', '2020-06-08 23:10:59', '2020-06-08 23:10:59'),
(2, 'charte_graphic.pdf', 'pdf', 27, 17, 65498, 'N', '2020-06-08 23:11:03', '2020-06-08 23:11:03'),
(3, 'melle.jpg', 'jpg', 27, 17, 6989, 'Y', '2020-06-08 23:11:07', '2020-06-08 23:11:07'),
(4, 'melle.jpg', 'jpg', 28, 17, 6989, 'Y', '2020-06-09 22:17:20', '2020-06-09 22:17:20'),
(5, 'melle.jpg', 'jpg', 29, 17, 6989, 'Y', '2020-06-11 08:20:25', '2020-06-11 08:20:25'),
(6, 'logo1.jpg', 'jpg', 29, 17, 8370, 'Y', '2020-06-11 08:30:21', '2020-06-11 08:30:21'),
(7, 'user_84308.png', 'png', 29, 17, 2828, 'Y', '2020-06-11 08:30:45', '2020-06-11 08:30:45'),
(8, 'logo2.jpg', 'jpg', 29, 17, 37116, 'Y', '2020-06-11 08:30:45', '2020-06-11 08:30:45'),
(9, 'logo2.jpg', 'jpg', 30, 17, 37116, 'Y', '2020-06-15 09:42:31', '2020-06-15 09:42:31'),
(10, 'logo1.jpg', 'jpg', 30, 17, 8370, 'Y', '2020-06-15 09:45:12', '2020-06-15 09:45:12'),
(11, 'image17.jpeg', 'jpg', 31, 17, 61994, 'Y', '2020-07-08 22:41:24', '2020-07-08 22:41:24'),
(12, 'graphex1-categorie-A.pdf', 'pdf', 30, 17, 536933, 'Y', '2020-07-10 11:04:45', '2020-07-10 11:04:45'),
(13, '55bas_de_page-ZLASSISO.png', 'png', 32, 17, 18458, 'Y', '2020-09-08 17:26:32', '2020-09-08 17:26:32'),
(14, '55bas_de_page-ZLASSISO.png', 'png', 34, 17, 18458, 'N', '2020-09-09 13:18:12', '2020-09-09 13:18:57'),
(18, 'image1.jpeg', 'jpg', 45, 32, 72630, 'Y', '2020-10-07 06:40:40', '2020-10-07 06:40:40'),
(19, 'image1.jpeg', 'jpg', 46, 32, 72630, 'Y', '2020-10-07 06:40:57', '2020-10-07 06:40:57'),
(20, 'image1.jpeg', 'jpg', 47, 32, 72630, 'Y', '2020-10-07 06:52:13', '2020-10-07 06:52:13'),
(21, 'image3.jpeg', 'jpg', 48, 33, 80219, 'Y', '2020-10-07 07:02:23', '2020-10-07 07:02:23'),
(22, 'image2.jpeg', 'jpg', 49, 33, 65947, 'Y', '2020-10-07 07:07:47', '2020-10-07 07:07:47'),
(23, 'image3.jpeg', 'jpg', 49, 33, 80219, 'Y', '2020-10-07 07:07:48', '2020-10-07 07:07:48'),
(24, 'image5.jpeg', 'jpg', 50, 34, 75428, 'Y', '2020-10-07 07:11:54', '2020-10-07 07:11:54'),
(25, 'image7.jpeg', 'jpg', 52, 35, 283011, 'Y', '2020-10-07 07:14:46', '2020-10-07 07:14:46'),
(26, 'image7.jpeg', 'jpg', 53, 35, 283011, 'Y', '2020-10-07 07:15:13', '2020-10-07 07:15:13'),
(27, 'image7.jpeg', 'jpg', 54, 35, 283011, 'Y', '2020-10-07 07:17:03', '2020-10-07 07:17:03'),
(28, 'image7.jpeg', 'jpg', 55, 35, 283011, 'Y', '2020-10-07 07:17:19', '2020-10-07 07:17:19'),
(29, 'image7.jpeg', 'jpg', 56, 35, 283011, 'Y', '2020-10-07 07:18:43', '2020-10-07 07:18:43'),
(30, 'image8.jpeg', 'jpg', 56, 35, 73746, 'Y', '2020-10-07 07:21:51', '2020-10-07 07:21:51');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_advert_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employee_advert_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(32) COLLATE utf8_bin DEFAULT '',
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `url` varchar(255) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `short_description` varchar(512) COLLATE utf8_bin DEFAULT '',
  `content` text COLLATE utf8_bin,
  `advert_id` int(11) unsigned DEFAULT NULL,
  `is_validated` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `number_of_views` int(11) unsigned NOT NULL DEFAULT '0',
  `number_of_quotations` int(11) unsigned NOT NULL DEFAULT '0',
  `published_at` datetime DEFAULT NULL,
  `refused_at` datetime DEFAULT NULL,
  `revival_iteration` int(8) unsigned NOT NULL DEFAULT '0',
  `revival_at` datetime DEFAULT NULL,
  `state` enum('UPLOAD') COLLATE utf8_bin DEFAULT NULL,
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`advert_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=39 ;

--
-- Contenu de la table `t_employee_advert_i18n`
--

INSERT INTO `t_employee_advert_i18n` (`id`, `reference`, `lang`, `url`, `title`, `short_description`, `content`, `advert_id`, `is_validated`, `number_of_views`, `number_of_quotations`, `published_at`, `refused_at`, `revival_iteration`, `revival_at`, `state`, `status`, `created_at`, `updated_at`) VALUES
(20, '2020060900027/EN', 'en', 'my annonce', 'my annonce', 'my annonce', 'my annonce', 27, '', 79, 0, '2020-06-09 00:12:10', NULL, 0, NULL, NULL, 'ACTIVE', '2020-06-09 00:09:20', '2020-10-20 16:44:41'),
(24, '', 'en', '', '', '', '', 25, '', 123, 0, NULL, NULL, 0, NULL, NULL, 'ACTIVE', '2020-08-06 12:50:25', '2020-09-07 12:05:04'),
(25, '', 'en', '', '', '', '', 28, '', 1, 0, NULL, NULL, 0, NULL, NULL, 'ACTIVE', '2020-08-06 15:37:31', '2020-08-06 15:37:31'),
(26, '', 'en', '', '', '', '', 31, '', 15, 0, NULL, NULL, 0, NULL, NULL, 'ACTIVE', '2020-08-31 15:25:04', '2020-08-31 16:02:49'),
(28, '2020090832/EN', 'en', 'super logo', 'super logo', 'super logo', 'super logo', 32, '', 68, 0, '2020-09-08 18:28:34', NULL, 0, NULL, NULL, 'ACTIVE', '2020-09-08 18:27:46', '2020-10-20 17:13:05'),
(29, '2020090934/EN', 'en', 'TEST', 'TEST', 'TEST', 'TEST', 34, '', 2, 0, '2020-09-10 22:31:58', NULL, 0, NULL, NULL, 'ACTIVE', '2020-09-09 14:18:45', '2020-10-20 14:45:52'),
(32, '2020100747/EN', 'en', 'I can develop your football team logo.', 'I can develop your football team logo.', 'I can develop your football team logo.    ', '<span style="font-size:17.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#454545">I can develop your football team logo.&nbsp; &nbsp;&nbsp;</span></span></span>', 47, '', 3, 0, '2020-10-07 08:23:51', NULL, 0, NULL, NULL, 'ACTIVE', '2020-10-07 07:42:09', '2020-10-22 01:43:01'),
(33, '2020100749/EN', 'en', 'I can developa logo and business card for your restaurant  very cheap and good quality', 'I can developa logo and business card for your restaurant  very cheap and good quality', 'I can develop a logo and business card for your restaurant  very cheap and good quality', '<span style="font-size:17.5pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="color:#454545">I can develop a logo and business card for your restaurant &nbsp;very cheap and good quality</span></span></span>', 49, '', 2, 0, '2020-10-07 08:23:47', NULL, 0, NULL, NULL, 'ACTIVE', '2020-10-07 08:07:33', '2020-10-21 07:49:24'),
(34, '2020100751/EN', 'en', 'I will do a professional website and a blog for your business.', 'I will do a professional website and a blog for your business.', 'I will do a professional website and a blog for your business.', '<span style="font-size:17.5pt"><span style="background-color:white"><span style="font-family:&quot;.SFUIText&quot;,&quot;serif&quot;"><span style="color:#454545">I will do a professional website and a blog for your business.</span></span></span></span>', 51, '', 0, 0, NULL, NULL, 1, '2020-10-08 00:00:00', NULL, 'ACTIVE', '2020-10-07 08:13:24', '2020-10-07 08:13:24'),
(35, '2020100756/EN', 'en', 'I will do a professional website and a blog for your business.', 'I will do a professional website and a blog for your business.', 'I will do a professional website and a blog for your business.', '<span style="font-size:17.5pt"><span style="background-color:white"><span style="font-family:&quot;.SFUIText&quot;,&quot;serif&quot;"><span style="color:#454545">I will do a professional website and a blog for your business.</span></span></span></span>', 56, '', 4, 0, '2020-10-07 08:23:27', NULL, 0, NULL, NULL, 'ACTIVE', '2020-10-07 08:21:35', '2020-10-21 02:55:56'),
(36, '2020100757/EN', 'en', 'i-m-looking-for-a-flyer-designer-to-create-a-flyer-similar-to-that-for-me', 'I’m looking for a Flyer designer to create a flyer similar to that for me.', 'I’m looking for a Flyer designer to create a flyer similar to that for me.', 'I&rsquo;m looking for a Flyer designer to create a flyer similar to that for me.', 57, '', 0, 0, NULL, '2020-10-13 23:15:12', 1, '2020-10-08 00:00:00', NULL, 'ACTIVE', '2020-10-07 11:07:55', '2020-10-07 11:07:55'),
(37, '2020102058/EN', 'en', 'graphic-design', 'Graphic Design', 'I&#39;m Lewis. I&#39;m 25 years old. I&#39;m a computer Scientist. And also a Graphic Designer.', 'I&#39;m here to find some jobs', 58, '', 0, 0, NULL, NULL, 0, NULL, NULL, 'ACTIVE', '2020-10-20 23:12:55', '2020-10-20 23:12:55'),
(38, '2020102059/EN', 'en', 'graphic-design', 'Graphic Design', 'Nsjdjsjsj skss&nbsp;', 'Nnsnsnss&nbsp;', 59, '', 0, 0, NULL, NULL, 0, NULL, NULL, 'ACTIVE', '2020-10-20 23:17:43', '2020-10-20 23:17:43');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_advert_i18n_abuse`
--

CREATE TABLE IF NOT EXISTS `t_employee_advert_i18n_abuse` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(48) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(48) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `advert_i18n_id` int(11) unsigned DEFAULT NULL,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `type_id` int(11) unsigned DEFAULT NULL,
  `message` varchar(512) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `employee_advert_abuse_fk0` (`advert_i18n_id`),
  KEY `employee_advert_abuse_fk1` (`employee_user_id`),
  KEY `employee_advert_abuse_fk2` (`employer_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_advert_i18n_claim`
--

CREATE TABLE IF NOT EXISTS `t_employee_advert_i18n_claim` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(48) COLLATE utf8_bin DEFAULT '',
  `contact_id` int(11) unsigned NOT NULL,
  `type_id` int(11) unsigned DEFAULT NULL,
  `advert_i18n_id` int(11) unsigned NOT NULL,
  `description` text COLLATE utf8_bin,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_advert_i18n_claim_fk0` (`advert_i18n_id`),
  KEY `employee_advert_i18n_claim_fk1` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_advert_i18n_notation`
--

CREATE TABLE IF NOT EXISTS `t_employee_advert_i18n_notation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `employee_advert_id` int(11) unsigned DEFAULT NULL,
  `employee_advert_lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `employer_advert_id` int(11) unsigned DEFAULT NULL,
  `employer_advert_lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `work_id` int(11) unsigned NOT NULL,
  `notation` decimal(6,3) NOT NULL DEFAULT '0.000',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_advert_i18n_share`
--

CREATE TABLE IF NOT EXISTS `t_employee_advert_i18n_share` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(48) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(48) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `advert_i18n_id` int(11) unsigned DEFAULT NULL,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `message` varchar(512) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `employee_advert_share_fk0` (`advert_i18n_id`),
  KEY `employee_advert_share_fk1` (`employee_user_id`),
  KEY `employee_advert_share_fk2` (`employer_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_advert_popular`
--

CREATE TABLE IF NOT EXISTS `t_employee_advert_popular` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `advert_id` int(11) unsigned DEFAULT NULL,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `ip` varchar(16) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_advert_popular_fk0` (`advert_id`),
  KEY `employee_advert_popular_fk1` (`employer_user_id`),
  KEY `employee_advert_popular_fk2` (`employee_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=324 ;

--
-- Contenu de la table `t_employee_advert_popular`
--

INSERT INTO `t_employee_advert_popular` (`id`, `advert_id`, `employee_user_id`, `employer_user_id`, `lang`, `country`, `ip`, `created_at`, `updated_at`) VALUES
(312, 34, NULL, NULL, 'en', 'en', '66.249.65.207', '2020-10-18 20:13:36', '2020-10-18 20:13:36'),
(313, 32, NULL, NULL, 'en', 'en', '66.249.65.207', '2020-10-18 20:13:44', '2020-10-18 20:13:44'),
(314, 47, NULL, NULL, 'en', 'en', '66.249.65.207', '2020-10-18 20:14:06', '2020-10-18 20:14:06'),
(315, 56, NULL, NULL, 'en', 'en', '66.249.65.203', '2020-10-18 20:14:18', '2020-10-18 20:14:18'),
(316, 49, NULL, NULL, 'en', 'en', '66.249.65.205', '2020-10-18 20:14:31', '2020-10-18 20:14:31'),
(317, 34, NULL, NULL, 'en', 'en', '66.249.69.61', '2020-10-20 14:45:52', '2020-10-20 14:45:52'),
(318, 27, NULL, NULL, 'en', 'en', '66.249.69.59', '2020-10-20 16:44:41', '2020-10-20 16:44:41'),
(319, 32, NULL, NULL, 'en', 'en', '66.249.69.61', '2020-10-20 17:13:05', '2020-10-20 17:13:05'),
(320, 47, NULL, NULL, 'en', 'en', '66.249.66.88', '2020-10-20 22:59:16', '2020-10-20 22:59:16'),
(321, 56, NULL, NULL, 'en', 'en', '66.249.66.86', '2020-10-21 02:55:56', '2020-10-21 02:55:56'),
(322, 49, NULL, NULL, 'en', 'en', '66.249.66.87', '2020-10-21 07:49:24', '2020-10-21 07:49:24'),
(323, 47, NULL, NULL, 'en', 'en', '66.249.64.153', '2020-10-22 01:43:01', '2020-10-22 01:43:01');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_category`
--

CREATE TABLE IF NOT EXISTS `t_employee_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_category_fk0` (`employee_user_id`),
  KEY `employee_category_fk1` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Contenu de la table `t_employee_category`
--

INSERT INTO `t_employee_category` (`id`, `employee_user_id`, `category_id`, `created_at`, `updated_at`) VALUES
(6, 32, 3, '2020-10-07 07:35:44', '2020-10-07 07:35:44');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_category_popular`
--

CREATE TABLE IF NOT EXISTS `t_employee_category_popular` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `ip` varchar(16) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_category_popular_fk0` (`employee_user_id`),
  KEY `employee_category_popular_fk1` (`category_id`),
  KEY `employee_category_popular_fk2` (`employer_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=181 ;

--
-- Contenu de la table `t_employee_category_popular`
--

INSERT INTO `t_employee_category_popular` (`id`, `employee_user_id`, `employer_user_id`, `category_id`, `lang`, `country`, `ip`, `created_at`, `updated_at`) VALUES
(161, NULL, NULL, 28, 'en', 'en', '66.249.69.57', '2020-10-20 14:17:04', '2020-10-20 14:17:04'),
(162, NULL, NULL, 113, 'en', 'en', '66.249.69.57', '2020-10-20 14:20:43', '2020-10-20 14:20:43'),
(163, NULL, NULL, 112, 'en', 'en', '66.249.69.57', '2020-10-20 14:20:49', '2020-10-20 14:20:49'),
(164, NULL, NULL, 111, 'en', 'en', '66.249.69.59', '2020-10-20 14:21:02', '2020-10-20 14:21:02'),
(165, NULL, NULL, 115, 'en', 'en', '66.249.69.57', '2020-10-20 14:23:06', '2020-10-20 14:23:06'),
(166, NULL, NULL, 109, 'en', 'en', '66.249.69.57', '2020-10-20 14:25:31', '2020-10-20 14:25:31'),
(167, NULL, NULL, 118, 'en', 'en', '66.249.69.57', '2020-10-20 14:25:40', '2020-10-20 14:25:40'),
(168, NULL, NULL, 119, 'en', 'en', '66.249.69.57', '2020-10-20 14:25:52', '2020-10-20 14:25:52'),
(169, NULL, NULL, 110, 'en', 'en', '66.249.69.57', '2020-10-20 14:29:55', '2020-10-20 14:29:55'),
(170, NULL, NULL, 120, 'en', 'en', '66.249.69.57', '2020-10-20 14:35:24', '2020-10-20 14:35:24'),
(171, NULL, NULL, 114, 'en', 'en', '66.249.69.57', '2020-10-20 14:36:04', '2020-10-20 14:36:04'),
(172, NULL, NULL, 117, 'en', 'en', '66.249.69.57', '2020-10-20 14:37:41', '2020-10-20 14:37:41'),
(173, NULL, NULL, 29, 'en', 'en', '66.249.69.61', '2020-10-20 15:10:00', '2020-10-20 15:10:00'),
(174, NULL, NULL, 2, 'en', 'en', '66.249.69.61', '2020-10-20 15:28:56', '2020-10-20 15:28:56'),
(175, NULL, NULL, 4, 'en', 'en', '66.249.69.61', '2020-10-20 15:47:52', '2020-10-20 15:47:52'),
(176, NULL, NULL, 5, 'en', 'en', '66.249.69.59', '2020-10-20 16:25:44', '2020-10-20 16:25:44'),
(177, NULL, NULL, 6, 'en', 'en', '66.249.69.61', '2020-10-20 17:22:32', '2020-10-20 17:22:32'),
(178, NULL, NULL, 98, 'en', 'en', '66.249.69.57', '2020-10-20 17:41:28', '2020-10-20 17:41:28'),
(179, NULL, NULL, 7, 'en', 'en', '66.249.69.61', '2020-10-20 18:00:24', '2020-10-20 18:00:24'),
(180, NULL, NULL, 76, 'en', 'en', '66.249.66.88', '2020-10-21 01:48:45', '2020-10-21 01:48:45');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_contact`
--

CREATE TABLE IF NOT EXISTS `t_employee_contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gender` enum('Mr','Ms','Mrs') COLLATE utf8_bin NOT NULL,
  `firstname` varchar(64) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(64) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(16) COLLATE utf8_bin NOT NULL,
  `fax` varchar(16) COLLATE utf8_bin NOT NULL,
  `address1` varchar(255) COLLATE utf8_bin NOT NULL,
  `address2` varchar(255) COLLATE utf8_bin NOT NULL,
  `postcode` char(10) COLLATE utf8_bin NOT NULL,
  `city` varchar(128) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `state` varchar(20) COLLATE utf8_bin NOT NULL,
  `message` varchar(512) COLLATE utf8_bin NOT NULL,
  `subject` varchar(255) COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Contenu de la table `t_employee_contact`
--

INSERT INTO `t_employee_contact` (`id`, `gender`, `firstname`, `lastname`, `email`, `phone`, `mobile`, `fax`, `address1`, `address2`, `postcode`, `city`, `country`, `state`, `message`, `subject`, `is_active`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mrs', 'ddd', 'dd', 'dd@free.fr', 'ddd', '', '', '', '', '', '', '', '', 'ddddhhhhhhhhhhhhhhhhhh', 'ddd', 'NO', 'ACTIVE', '2020-09-19 13:31:32', '2020-09-19 13:31:32'),
(2, 'Mrs', 'ddd', 'dd', 'dd@free.fr', 'ddd', '', '', '', '', '', '', '', '', 'ddddhhhhhhhhhhhhhhhhhh', 'ddd', 'NO', 'ACTIVE', '2020-09-19 13:32:17', '2020-09-19 13:32:17'),
(3, 'Mrs', 'ddd', 'dd', 'dd@free.fr', 'ddd', '', '', '', '', '', '', '', '', 'ddddhhhhhhhhhhhhhhhhhh', 'ddd', 'NO', 'ACTIVE', '2020-09-19 13:35:11', '2020-09-19 13:35:11'),
(4, 'Mrs', 'ddd', 'dd', 'dd@free.fr', 'ddd', '', '', '', '', '', '', '', '', 'ddddhhhhhhhhhhhhhhhhhh', 'ddd', 'NO', 'ACTIVE', '2020-09-19 13:37:02', '2020-09-19 13:37:02'),
(5, 'Mrs', 'ddd', 'dd', 'dd@free.fr', 'ddd', '', '', '', '', '', '', '', '', 'ddddhhhhhhhhhhhhhhhhhh', 'ddd', 'NO', 'ACTIVE', '2020-09-19 13:40:03', '2020-09-19 13:40:03');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_content`
--

CREATE TABLE IF NOT EXISTS `t_employee_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employee_user_id` int(11) unsigned NOT NULL,
  `name` varchar(15) COLLATE utf8_bin NOT NULL,
  `picture` varchar(24) COLLATE utf8_bin NOT NULL,
  `url` varchar(255) COLLATE utf8_bin NOT NULL,
  `template` varchar(64) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `employee_content_fk0` (`employee_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Contenu de la table `t_employee_content`
--

INSERT INTO `t_employee_content` (`id`, `employee_user_id`, `name`, `picture`, `url`, `template`, `created_at`, `updated_at`) VALUES
(5, 17, '', '', '', 'default.tpl', '2020-06-04 22:35:58', '2020-06-04 22:35:58');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_content_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employee_content_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(11) unsigned NOT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_robots` varchar(30) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `employee_content_i18n_fk0` (`content_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `t_employee_content_i18n`
--

INSERT INTO `t_employee_content_i18n` (`id`, `content_id`, `lang`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `meta_robots`, `created_at`, `updated_at`) VALUES
(1, 5, 'fr', 'je suis le meilleure', 'je suis le meilleure', 'je suis le meilleure', '', '', '2020-06-04 22:35:56', '2020-06-04 22:35:56'),
(2, 5, 'en', 'I''m a best', 'I''m a best', 'I''m a best', '', '', '2020-06-04 22:35:56', '2020-06-04 22:35:56'),
(3, 5, 'es', '', '', '', '', '', '2020-06-04 22:35:56', '2020-06-04 22:35:56');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_criteria_notation`
--

CREATE TABLE IF NOT EXISTS `t_employee_criteria_notation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `criteria_id` int(11) unsigned DEFAULT NULL,
  `notation` decimal(6,3) NOT NULL DEFAULT '0.000',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_experience`
--

CREATE TABLE IF NOT EXISTS `t_employee_experience` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Contenu de la table `t_employee_experience`
--

INSERT INTO `t_employee_experience` (`id`, `name`, `icon`, `color`, `awe`, `position`, `created_at`, `updated_at`) VALUES
(1, '', '', '', '', 2, '2020-06-03 19:57:37', '2020-06-03 19:57:37'),
(2, '', '', '', '', 3, '2020-06-03 20:02:58', '2020-06-03 20:02:58'),
(3, '', '', '', '', 1, '2020-07-03 18:05:35', '2020-07-03 18:05:35'),
(4, '', '', '', '', 4, '2020-07-03 18:06:01', '2020-07-03 18:06:01'),
(5, '', '', '', '', 5, '2020-07-03 18:06:10', '2020-07-03 18:06:10'),
(6, '', '', '', '', 6, '2020-07-03 18:06:17', '2020-07-03 18:06:17');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_experience_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employee_experience_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `experience_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`experience_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=13 ;

--
-- Contenu de la table `t_employee_experience_i18n`
--

INSERT INTO `t_employee_experience_i18n` (`id`, `lang`, `title`, `experience_id`, `created_at`, `updated_at`) VALUES
(1, 'en', '1- 2 years', 1, '2020-06-03 19:57:37', '2020-07-03 18:05:45'),
(2, 'en', '3 - 5 years', 2, '2020-06-03 20:02:58', '2020-07-03 18:05:53'),
(3, 'en', 'No experience', 3, '2020-07-03 18:05:35', '2020-07-03 18:05:35'),
(4, 'en', '6 - 10 years', 4, '2020-07-03 18:06:01', '2020-07-03 18:06:01'),
(5, 'en', '11 - 15 years', 5, '2020-07-03 18:06:10', '2020-07-03 18:06:10'),
(6, 'en', '16- and up', 6, '2020-07-03 18:06:17', '2020-07-03 18:06:17'),
(7, 'fr', 'Aucune expérience', 3, '2020-07-03 18:07:08', '2020-07-03 18:07:08'),
(8, 'fr', '1 - 2 ans', 1, '2020-07-03 18:07:25', '2020-07-03 18:07:25'),
(9, 'fr', '3 - 5 ans', 2, '2020-07-03 18:07:33', '2020-07-03 18:07:33'),
(10, 'fr', '6 - 10 ans', 4, '2020-07-03 18:07:41', '2020-07-03 18:07:41'),
(11, 'fr', '11 - 15 ans', 5, '2020-07-03 18:07:50', '2020-07-03 18:07:50'),
(12, 'fr', '16 et plus', 6, '2020-07-03 18:08:05', '2020-07-03 18:08:05');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_favourite`
--

CREATE TABLE IF NOT EXISTS `t_employee_favourite` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `employee_id` int(11) unsigned DEFAULT NULL,
  `employer_id` int(11) unsigned DEFAULT NULL,
  `employer_advert_id` int(11) unsigned DEFAULT NULL,
  `employee_advert_id` int(11) unsigned DEFAULT NULL,
  `employer_advert_lang` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `employee_advert_lang` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=12 ;

--
-- Contenu de la table `t_employee_favourite`
--

INSERT INTO `t_employee_favourite` (`id`, `employee_user_id`, `employer_user_id`, `employee_id`, `employer_id`, `employer_advert_id`, `employee_advert_id`, `employer_advert_lang`, `employee_advert_lang`, `created_at`, `updated_at`) VALUES
(3, 17, NULL, NULL, 9, NULL, NULL, '', '', '2020-09-02 16:17:21', '2020-09-02 16:17:21'),
(9, 17, NULL, NULL, NULL, 71, NULL, 'en', '', '2020-09-02 16:36:39', '2020-09-02 16:36:39'),
(11, 17, NULL, 17, NULL, NULL, NULL, '', '', '2020-09-02 17:38:52', '2020-09-02 17:38:52');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_forgot_password`
--

CREATE TABLE IF NOT EXISTS `t_employee_forgot_password` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `password` varchar(40) COLLATE utf8_bin NOT NULL,
  `key` varchar(40) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_forgot_password_fk0` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_function`
--

CREATE TABLE IF NOT EXISTS `t_employee_function` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_employee_function`
--

INSERT INTO `t_employee_function` (`id`, `name`, `icon`, `color`, `awe`, `position`, `created_at`, `updated_at`) VALUES
(1, '', '', '', '', 1, '2020-05-17 02:17:16', '2020-05-17 02:17:16');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_function_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employee_function_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `function_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`function_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Contenu de la table `t_employee_function_i18n`
--

INSERT INTO `t_employee_function_i18n` (`id`, `lang`, `title`, `function_id`, `created_at`, `updated_at`) VALUES
(1, 'fr', 'TEST1', 1, '2020-05-17 02:17:16', '2020-05-17 02:17:16'),
(2, 'en', 'Graphist senior', 1, '2020-08-09 00:45:23', '2020-08-09 00:45:23');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_gallery`
--

CREATE TABLE IF NOT EXISTS `t_employee_gallery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `tpl` varchar(15) COLLATE utf8_bin NOT NULL,
  `number_of_items` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_employee_gallery`
--

INSERT INTO `t_employee_gallery` (`id`, `name`, `is_active`, `tpl`, `number_of_items`, `created_at`, `updated_at`) VALUES
(1, 'TEST', 'YES', '', 1, '2020-05-13 01:20:00', '2020-05-20 02:00:35');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_gallery_employee`
--

CREATE TABLE IF NOT EXISTS `t_employee_gallery_employee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) unsigned NOT NULL,
  `employee_user_id` int(11) unsigned NOT NULL,
  `position` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `employee_gallery_employee_fk0` (`gallery_id`),
  KEY `employee_gallery_employee_fk1` (`employee_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=34 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_gallery_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employee_gallery_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `gallery_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `employee_gallery_i18n_fk0` (`gallery_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_employee_gallery_i18n`
--

INSERT INTO `t_employee_gallery_i18n` (`id`, `lang`, `title`, `gallery_id`, `created_at`, `updated_at`) VALUES
(1, 'fr', 'TEST', 1, '2020-05-13 01:20:00', '2020-05-13 01:20:00');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_graduate_diploma`
--

CREATE TABLE IF NOT EXISTS `t_employee_graduate_diploma` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `position` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Contenu de la table `t_employee_graduate_diploma`
--

INSERT INTO `t_employee_graduate_diploma` (`id`, `name`, `position`, `created_at`, `updated_at`) VALUES
(1, '', 1, '2020-06-06 23:54:53', '2020-06-06 23:54:53'),
(2, '', 2, '2020-06-07 17:42:57', '2020-06-07 17:42:57');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_graduate_diploma_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employee_graduate_diploma_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `graduate_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`graduate_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `t_employee_graduate_diploma_i18n`
--

INSERT INTO `t_employee_graduate_diploma_i18n` (`id`, `lang`, `title`, `graduate_id`, `created_at`, `updated_at`) VALUES
(1, 'en', 'test', 1, '2020-06-06 23:54:53', '2020-06-06 23:54:53'),
(2, 'fr', 'DIPLOMA1', 1, '2020-06-07 17:41:16', '2020-06-07 17:41:16'),
(3, 'fr', 'DIPLOMA2', 2, '2020-06-07 17:42:57', '2020-06-07 17:42:57');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_language`
--

CREATE TABLE IF NOT EXISTS `t_employee_language` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_employee_language`
--

INSERT INTO `t_employee_language` (`id`, `name`, `icon`, `color`, `awe`, `position`, `created_at`, `updated_at`) VALUES
(1, '', '', '', '', 1, '2020-06-06 15:27:07', '2020-06-06 15:27:07');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_language_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employee_language_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `language_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`language_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_employee_language_i18n`
--

INSERT INTO `t_employee_language_i18n` (`id`, `lang`, `title`, `language_id`, `created_at`, `updated_at`) VALUES
(1, 'en', 'test', 1, '2020-06-06 15:27:07', '2020-06-06 15:27:07');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_language_level`
--

CREATE TABLE IF NOT EXISTS `t_employee_language_level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Contenu de la table `t_employee_language_level`
--

INSERT INTO `t_employee_language_level` (`id`, `name`, `position`, `created_at`, `updated_at`) VALUES
(2, '', 1, '2020-06-06 23:44:42', '2020-06-06 23:44:42');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_language_level_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employee_language_level_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `level_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`level_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `t_employee_language_level_i18n`
--

INSERT INTO `t_employee_language_level_i18n` (`id`, `lang`, `title`, `level_id`, `created_at`, `updated_at`) VALUES
(2, 'en', 'test', 2, '2020-06-06 23:44:42', '2020-06-06 23:44:42'),
(3, 'fr', 'Native language', 2, '2020-06-07 00:53:56', '2020-06-07 00:53:56');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_notation_category`
--

CREATE TABLE IF NOT EXISTS `t_employee_notation_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `t_employee_notation_category`
--

INSERT INTO `t_employee_notation_category` (`id`, `name`, `icon`, `color`, `awe`, `position`, `created_at`, `updated_at`) VALUES
(1, '', '', '', '', 1, '2020-07-30 10:12:15', '2020-07-30 10:12:15'),
(2, '', '', '', '', 2, '2020-07-30 10:20:51', '2020-07-30 10:20:51'),
(3, '', '', '', '', 3, '2020-07-30 10:20:51', '2020-07-30 10:20:51');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_notation_category_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employee_notation_category_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `category_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`category_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `t_employee_notation_category_i18n`
--

INSERT INTO `t_employee_notation_category_i18n` (`id`, `lang`, `title`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'en', 'c1', 1, '2020-07-30 10:12:15', '2020-09-04 08:55:57'),
(2, 'en', 'c2', 2, '2020-07-30 10:20:51', '2020-09-04 08:56:03'),
(3, 'en', 'c3', 3, '2020-07-30 10:20:51', '2020-09-04 08:56:08');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_notation_criteria`
--

CREATE TABLE IF NOT EXISTS `t_employee_notation_criteria` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `max` int(11) unsigned NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_notation_criteria_fk1` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Contenu de la table `t_employee_notation_criteria`
--

INSERT INTO `t_employee_notation_criteria` (`id`, `category_id`, `name`, `icon`, `color`, `awe`, `max`, `position`, `created_at`, `updated_at`) VALUES
(1, 1, '', '', '', '', 10, 2, '2020-07-30 11:35:53', '2020-09-04 08:56:32'),
(2, 2, '', '', '', '', 10, 3, '2020-07-30 11:39:29', '2020-09-04 08:56:50'),
(7, 2, '', '', '', '', 10, 4, '2020-07-30 15:22:02', '2020-09-04 08:57:02'),
(8, 1, '', '', '', '', 10, 1, '2020-07-30 15:23:51', '2020-09-04 08:56:23');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_notation_criteria_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employee_notation_criteria_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `criteria_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`criteria_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Contenu de la table `t_employee_notation_criteria_i18n`
--

INSERT INTO `t_employee_notation_criteria_i18n` (`id`, `lang`, `title`, `criteria_id`, `created_at`, `updated_at`) VALUES
(1, 'en', 'c1e-2', 1, '2020-07-30 11:35:53', '2020-09-04 08:56:32'),
(2, 'en', 'c2e-1', 2, '2020-07-30 11:39:29', '2020-09-04 08:56:44'),
(7, 'en', 'c2e-2', 7, '2020-07-30 15:22:02', '2020-09-04 08:57:02'),
(8, 'en', 'c1e-1', 8, '2020-07-30 15:23:51', '2020-09-04 08:56:23');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_portfolio_document`
--

CREATE TABLE IF NOT EXISTS `t_employee_portfolio_document` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(32) COLLATE utf8_bin NOT NULL,
  `extension` varchar(10) COLLATE utf8_bin NOT NULL,
  `filesize` int(11) unsigned DEFAULT NULL,
  `employee_user_id` int(11) unsigned NOT NULL,
  `position` int(11) unsigned NOT NULL,
  `is_public` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'Y',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `employee_portfolio_document_fk0` (`employee_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=39 ;

--
-- Contenu de la table `t_employee_portfolio_document`
--

INSERT INTO `t_employee_portfolio_document` (`id`, `file`, `extension`, `filesize`, `employee_user_id`, `position`, `is_public`, `is_active`, `created_at`, `updated_at`) VALUES
(28, 'charte_graphic.pdf', 'pdf', 65498, 17, 5, 'N', 'YES', '2020-06-26 00:26:47', '2020-07-01 22:18:14'),
(30, 'user_84308.png', 'png', 2828, 17, 3, 'Y', 'YES', '2020-06-26 00:27:27', '2020-07-01 00:30:09'),
(31, 'logo2.jpg', 'jpg', 37116, 17, 4, 'Y', 'YES', '2020-06-26 00:28:54', '2020-07-01 00:30:22'),
(32, 'avatar-corretor-350x350.png', 'png', 87883, 17, 7, 'N', 'YES', '2020-06-26 00:30:56', '2020-06-27 09:51:25'),
(33, 'Writing&Translation.png', 'png', 116164, 17, 9, 'Y', 'YES', '2020-06-26 00:31:19', '2020-06-27 09:51:18'),
(34, 'logo2.jpg', 'jpg', 37116, 17, 1, 'Y', 'YES', '2020-06-26 00:49:28', '2020-07-08 13:43:03'),
(35, 'user_84308.png', 'png', 2828, 17, 6, 'Y', 'YES', '2020-06-26 00:50:17', '2020-06-27 09:51:12'),
(36, 'list.pptx', 'pptx', 0, 17, 8, 'Y', 'YES', '2020-06-26 00:51:38', '2020-06-27 01:00:14'),
(38, 'charte_graphic.pptx', 'pptx', 73316, 17, 2, 'N', 'YES', '2020-06-26 01:04:26', '2020-07-06 20:24:05');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_portfolio_document_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employee_portfolio_document_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` int(11) unsigned NOT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `title` varchar(128) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_portfolio_document_i18n_fk0` (`document_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_employee_portfolio_document_i18n`
--

INSERT INTO `t_employee_portfolio_document_i18n` (`id`, `document_id`, `lang`, `title`, `created_at`, `updated_at`) VALUES
(1, 38, 'en', 'tototootototootfffffffffffffffffffffffffffffffffffff', '2020-09-02 08:25:16', '2020-09-02 09:25:16');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_remember`
--

CREATE TABLE IF NOT EXISTS `t_employee_remember` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `key` varchar(40) COLLATE utf8_bin NOT NULL,
  `ip` varchar(50) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `employee_remember_fk1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_session`
--

CREATE TABLE IF NOT EXISTS `t_employee_session` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `session` varchar(40) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `ip` varchar(50) COLLATE utf8_bin NOT NULL,
  `lat` decimal(20,13) DEFAULT NULL,
  `lng` decimal(20,13) DEFAULT NULL,
  `started_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ended_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `employee_session_fk1` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Contenu de la table `t_employee_session`
--

INSERT INTO `t_employee_session` (`id`, `session`, `user_id`, `ip`, `lat`, `lng`, `started_at`, `ended_at`) VALUES
(2, 'hcb8h10if6jsnadu6rdkcqsae3', 37, '152.0.194.106', NULL, NULL, '2020-10-18 20:40:25', '2020-10-18 20:40:25'),
(3, 'dlprt6gg0htuh6qpqkp3sqm022', 37, '152.0.194.106', NULL, NULL, '2020-10-19 00:20:25', '2020-10-19 00:20:25'),
(4, 'te00bfvro9f06s4e6egv2uqlk0', 42, '71.125.3.143', NULL, NULL, '2020-10-21 04:51:02', '2020-10-21 04:51:02'),
(5, '32sa7273n8ddgm217vesc7iho5', 45, '179.53.29.159', NULL, NULL, '2020-10-21 18:31:18', '2020-10-21 18:31:18');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_skill`
--

CREATE TABLE IF NOT EXISTS `t_employee_skill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `picture` varchar(24) COLLATE utf8_bin NOT NULL,
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=50 ;

--
-- Contenu de la table `t_employee_skill`
--

INSERT INTO `t_employee_skill` (`id`, `name`, `icon`, `picture`, `color`, `awe`, `position`, `created_at`, `updated_at`) VALUES
(1, '', '', '', '', '', 1, '2020-06-06 17:46:57', '2020-06-06 17:46:57'),
(10, '', 'icon.png', 'picture.jpg', '', '', 2, '2020-07-28 20:08:23', '2020-09-07 22:28:12'),
(11, '', 'icon.png', 'picture.jpg', '', '', 3, '2020-07-28 20:08:23', '2020-09-07 21:33:30'),
(12, '', 'icon.png', 'picture.jpg', '', '', 4, '2020-07-28 20:08:23', '2020-09-07 22:17:18'),
(13, '', 'icon.png', 'picture.jpg', '', '', 5, '2020-07-28 20:08:23', '2020-09-07 22:17:35'),
(14, '', 'icon.png', 'picture.jpg', '', '', 6, '2020-07-28 20:08:23', '2020-09-07 22:17:54'),
(15, '', 'icon.png', 'picture.jpg', '', '', 7, '2020-07-28 20:08:23', '2020-10-13 22:40:49'),
(16, '', 'icon.png', 'picture.jpg', '', '', 8, '2020-07-28 20:08:23', '2020-09-07 22:31:05'),
(17, '', 'icon.png', 'picture.jpg', '', '', 9, '2020-07-28 20:08:23', '2020-09-07 22:19:24'),
(18, '', 'icon.png', 'picture.jpg', '', '', 10, '2020-07-28 20:08:23', '2020-09-07 22:19:42'),
(19, '', 'icon.png', 'picture.jpg', '', '', 11, '2020-07-28 20:08:23', '2020-09-07 22:19:59'),
(20, '', 'icon.png', 'picture.jpg', '', '', 12, '2020-07-28 20:08:23', '2020-09-07 22:20:14'),
(21, '', 'icon.png', 'picture.jpg', '', '', 13, '2020-07-28 20:08:23', '2020-10-13 22:50:56'),
(22, '', 'icon.png', 'picture.jpg', '', '', 14, '2020-07-28 20:08:23', '2020-09-07 21:31:53'),
(23, '', 'icon.png', 'picture.jpg', '', '', 15, '2020-07-28 20:08:23', '2020-09-07 22:23:14'),
(24, '', 'icon.png', 'picture.jpg', '', '', 16, '2020-07-28 20:08:23', '2020-10-13 22:49:47'),
(25, '', 'icon.png', 'picture.jpg', '', '', 17, '2020-07-28 20:08:23', '2020-09-07 21:30:23'),
(26, '', 'icon.png', 'picture.jpg', '', '', 18, '2020-07-28 20:08:23', '2020-10-16 13:07:40'),
(27, '', 'icon.png', 'picture.jpg', '', '', 19, '2020-07-28 20:08:23', '2020-10-16 13:06:39'),
(28, '', 'icon.png', 'picture.jpg', '', '', 20, '2020-07-28 20:08:23', '2020-10-16 13:06:55'),
(29, '', 'icon.png', 'picture.jpg', '', '', 21, '2020-07-28 20:08:23', '2020-10-16 13:07:07'),
(30, '', 'icon.png', 'picture.jpg', '', '', 22, '2020-07-28 20:08:23', '2020-09-07 22:25:26'),
(31, '', 'icon.png', 'picture.jpg', '', '', 23, '2020-07-28 20:08:23', '2020-09-07 22:25:53'),
(32, '', 'icon.png', 'picture.jpg', '', '', 24, '2020-07-28 20:08:23', '2020-09-07 22:26:46'),
(33, '', 'icon.png', 'picture.jpg', '', '', 25, '2020-07-28 20:08:23', '2020-10-13 22:42:41'),
(34, '', 'icon.png', 'picture.jpg', '', '', 26, '2020-07-28 20:08:23', '2020-10-13 22:42:56'),
(35, '', 'icon.png', 'picture.jpg', '', '', 27, '2020-07-28 20:08:23', '2020-09-07 22:29:57'),
(36, '', 'icon.png', 'picture.jpg', '', '', 28, '2020-07-28 20:08:23', '2020-09-07 22:29:09'),
(37, '', 'icon.png', 'picture.jpg', '', '', 29, '2020-07-28 20:08:23', '2020-10-14 16:17:41'),
(38, '', 'icon.png', 'picture.jpg', '', '', 30, '2020-07-28 20:08:23', '2020-09-07 21:30:37'),
(39, '', 'icon.png', 'picture.jpg', '', '', 31, '2020-07-28 20:08:23', '2020-10-13 22:52:35'),
(40, '', 'icon.png', 'picture.jpg', '', '', 32, '2020-07-28 20:08:23', '2020-09-07 21:30:52'),
(41, '', 'icon.png', 'picture.jpg', '', '', 33, '2020-07-28 20:08:23', '2020-10-13 22:43:37'),
(42, '', 'icon.png', 'picture.jpg', '', '', 34, '2020-07-28 20:08:23', '2020-09-07 22:26:17'),
(43, '', 'icon.png', 'picture.jpg', '', '', 35, '2020-07-28 20:08:23', '2020-09-07 22:26:35'),
(44, '', 'icon.png', 'picture.jpg', '', '', 36, '2020-07-28 20:08:23', '2020-09-07 22:27:03'),
(45, '', 'icon.png', 'picture.jpg', '', '', 37, '2020-07-28 20:08:23', '2020-09-07 22:27:26'),
(46, '', 'icon.png', 'picture.jpg', '', '', 38, '2020-07-28 20:08:23', '2020-09-02 17:41:40'),
(47, '', 'icon.png', 'picture.jpg', '', '', 39, '2020-07-28 20:08:23', '2020-10-16 13:07:23'),
(49, '', 'icon.png', 'picture.jpg', '', '', 40, '2020-07-28 20:08:23', '2020-09-07 22:24:10');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_skill_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employee_skill_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `meta_description` varchar(512) COLLATE utf8_bin DEFAULT '',
  `meta_keyword` varchar(512) COLLATE utf8_bin DEFAULT '',
  `content` text COLLATE utf8_bin,
  `skill_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`skill_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=51 ;

--
-- Contenu de la table `t_employee_skill_i18n`
--

INSERT INTO `t_employee_skill_i18n` (`id`, `lang`, `title`, `meta_description`, `meta_keyword`, `content`, `skill_id`, `created_at`, `updated_at`) VALUES
(1, 'en', 'General Category', '', '', NULL, 1, '2020-06-06 17:46:57', '2020-07-28 18:08:34'),
(2, 'fr', 'Général', '', '', NULL, 1, '2020-06-07 19:00:02', '2020-06-07 19:00:02'),
(11, 'en', 'Graphic Design', 'Is the means of visual communication and problem-solving with the aid of typography, photography, iconography and illustration. ', 'Graphic design', '<div style="text-align:justify">Is the means of visual communication and problem-solving with the aid of typography, photography, iconography and illustration.<br />\r\n<br />\r\n<strong>Graphic designers</strong> construct and merge symbols and or characters, text and images to produce visual representations of concepts or ideas and messages. Why should you hire a Graphic Designer for your business needs? Merely to establish a professional image for your business, and to promote its growth is the utmost reason to hire a graphic designer. <strong>Designers</strong> express meticulously the language of color and imagery; <strong>graphic designers</strong> utilize their expertise to carefully relay messages to your focus audience and generate a brand your customers can trust. They also build graphic notions using computer software or handcrafted design to convey ideas that stimulate, inform, and attract consumers. They create the complete blue print and production design for applications such as advertisements, brochures, magazines, and reports.If you on the market for a Graphic Designer, you are in the right place! We have thousands of experts with in-depth knowledge to satisfy your needs. Please choose one of our experts below.</div>\r\n', 10, '2020-07-28 20:08:23', '2020-10-13 19:25:54'),
(12, 'en', 'Adobe Illustrator', 'Adobe Illustrator vector-based design and drawing program', 'Adobe Illustrator vector-based design and drawing program', '<div style="text-align:justify">Is a specialized vector-based design and drawing program,it is used as part of a greater design system, Adobe Illustrator grants the formation of everything from single design elements to entire compositions; Designers use it to make posters, symbols, logos, patterns, icon and industry standard design applications that allow the captivation of your inspired vision with shapes, colors, effects, and typography. It works on desktop and mobile devices, to swiftly produce beautiful designs that can be applied anywhere on prints, webs, apps, videos, animations, and more. You are one click away from the solution you are looking for. Choose one of our experts below.</div>\r\n', 11, '2020-07-28 20:08:23', '2020-10-13 19:27:10'),
(13, 'en', 'Brochure Design', 'Brochure Design , Brochures are marketing documents, created for the purpose of advertising', 'Brochures are marketing documents, created for the purpose of advertising', 'Brochures are marketing documents, created for the purpose of advertising, which can be folded into a template, pamphlet, or leaflet. They are mostly utilized to launch and or reintroduce a company, organization, or products, to bring awareness of available services and benefits to potential customers or members of the public.By simply browsing to our thousands of designers&rsquo; portfolio, you will find your solution right here.', 12, '2020-07-28 20:08:23', '2020-10-13 19:27:56'),
(14, 'en', 'Flyer Design', 'A flyer is a type of paper or electronic advertisement meant for widespread distribution', 'A flyer is a type of paper or electronic advertisement meant for widespread distribution', '<div style="text-align:justify">A flyer is a type of paper or electronic advertisement meant for widespread distribution,usually displayed or distributed in a public place, handed out to individuals or sent through the mail;it also can be allocated via emails, social media platforms and text messaging. In the past decade, flyer assortment was from inexpensive photocopied leaflets to expensive, glossy, full-color circulars., your flyer design solution is right here! Select one of our many designers&rsquo; portfolio below.</div>\r\n', 13, '2020-07-28 20:08:23', '2020-10-13 19:28:49'),
(15, 'en', 'Business Card Design', 'A Business card is the basic marketing tool for an entrepreneur', 'A Business card is the basic marketing tool for an entrepreneur', '<div style="text-align:justify">A Business card is the basic marketing tool for an entrepreneur to establish initial client or potential client contact with his or her Business, it contains the name, contact info, and brand logo;the color, language formulation and texture of the Businesscardis conducive to its ability to convey the company&rsquo;s image to prospective customers.<br />\r\n<br />\r\nWhen creating your Business card, ensure that your card is crafted to impress your potential clients on initial contact, you may seek theservice of a professional designer or use a do-it-yourself Businesscardsoftware, though, it is wise to hire a professional to secure a top-notch product that will make a lasting impression on clientele. Remember<br />\r\n<br />\r\nYour Business Card is acrucialtool of your branding and should act as a visual extension of your brand design so by simply browsing from our thousands of designers&rsquo; portfolio, you will find your solution right here!</div>\r\n', 14, '2020-07-28 20:08:23', '2020-10-13 19:30:23'),
(16, 'en', 'Illustration', 'The definition of an illustration is a portrait, a sketching, the act of forming a sketch', 'The definition of an illustration is a portrait, a sketching, the act of forming a sketch', '<div style="text-align:justify">The definition of an illustration is a portrait, a sketching, the act of forming a sketch, and or is an example applied to describe or demonstrate something; it usually complements a magazine article.An illustrator generates two-dimensional images for diverse clients, and industries including fashion design, children&#39;s books, magazines, medical manuals, web sites, technical designs and advertising. Illustrators are always producing and storing ideas, using their illustrating skills, they know the nuances of presenting your Business in an aesthetically pleasing manner.Their end goal is to resolve your creative questions and bring your ideas to manifestation. These programs use mathematic equations and geometric primitives (points, lines, and shapes) to create art that is clean, camera ready, and can be scaled infinitely, without any loss of quality or fidelity. please select from our pool of qualified Illustrators below.</div>\r\n', 15, '2020-07-28 20:08:23', '2020-10-13 19:31:22'),
(17, 'en', 'Adobe Photoshop', 'Adobe Photoshop is a software that is widely utilized to modify, create and edit images, graphic designs and digital arts', 'Adobe Photoshop is a software that is widely utilized to modify, create and edit images, graphic designs and digital arts', '<div style="text-align:justify">Adobe Photoshop is a software that is widely utilized to modify, create and edit images, graphic designs and digital arts; it is the most efficient way to create logos, and design websites,digital or scanned illustrations can be edited to be used online or in-print.it is a quick proficient tool that can alleviate frustration out of web design,and photo editing. Adobe Photoshop is a vital tool for designers, web developers, graphic artists, photographers, and creative professionals to render professionally tailored work. Please select one of our experts in Adobe Photoshop below to help for your Business&rsquo;s facelift.</div>\r\n', 16, '2020-07-28 20:08:23', '2020-10-13 19:32:25'),
(18, 'en', 'Brand Consulting', 'Brand consultants offer evaluation, resolutions, and general marketing expertise for Businesses', 'Brand consultants offer evaluation, resolutions, and general marketing expertise for Businesses', 'Brand consultants offer evaluation, resolutions, and general marketing expertise for Businesses to be successful at selling their products; Also known as brand strategists, they can convert small Business into a powerhouse using market analysis, content marketing, website audit, keyword research and video services. As your company&#39;s &ldquo;persona&rdquo; shifts, a Brand consultant is ideally placed to be of service to offer their recommendations and creative ideas to guide venture to the next level. They usually work for management consulting firms, advertising agencies and interact with a client Business brand managers or marketing executives. Please choose one of our talented Brand consultants below to help with your Business needs.', 17, '2020-07-28 20:08:23', '2020-10-13 19:32:59'),
(19, 'en', 'Adobe InDesign', 'Adobe InDesign is a desktop publishing and formatting software application generated by Adobe Systems', 'Adobe InDesign is a desktop publishing and formatting software application generated by Adobe Systems', '<div style="text-align:justify">Adobe InDesign is a desktop publishing and formatting software application generated by Adobe Systems; It can be used to produce master pieces such as posters, pamphlets, brochures, magazines, newspapers, presentations, books, e-books, portfolio, and interior design presentations.Ideally Adobe In Designis the right tool/software for Interior Designers;InDesign empowers the user with accuracy of typography, layout and pictures facilitating you to generate high quality printed or online documents. Projects created using InDesign can be disclosed in both digital and print formats. AdobeInDesign CC is available for use on either Mac OS or Windows.You are one click away from the solution you are looking for! Choose one of our experts below.</div>\r\n', 18, '2020-07-28 20:08:23', '2020-10-13 22:37:37'),
(20, 'en', 'Logo Design', 'Logo design is all about establishing the picture-perfect brand mark for a Business.', 'Logo design is all about establishing the picture-perfect brand mark for a Business.', '<div style="text-align:justify">Logo design is all about establishing the picture-perfect brand mark for a Business. Logo designers are skilled graphic designers who produce exclusive, and custom brand imagery for clients, and orBusinesses who seek their services; Building your brand is onethe most crucial steps needed to showcase your Business, despite its size. When you opt to appoint a logodesigner from Graphex, you then choose to work with the best on the Freelance Market, you will be exposed to Freelancers that are highly skilled and dedicated to your branding success.Please choose one of our experts in Logo Design below.</div>\r\n', 19, '2020-07-28 20:08:23', '2020-10-13 19:34:56'),
(21, 'en', 'Print Design', 'Print design, a subcategory of graphic design, is a method of visual interaction used to communicate information ', 'Print design, a subcategory of graphic design, is a method of visual interaction used to communicate information ', '<div style="text-align:justify">Print design, a subcategory of graphic design, is a method of visual interaction used to communicate information to an audience via purposeful aesthetic designimprinted on a tangible surface,intended to be printed on paper. The right designer will work with your budget and will aid in prioritizing your needs in the first year of Business, and necessary contemplation as your Business evolves. Print designersenvision and create materials for printing purposes, such as brochures, display pieces, and mailers. Print designers join forces with innovative and advertising teams to generate new material designs according to clients and Businesses for promotional needs.Please choose one of our experts in Print Design below for your promotional need.</div>\r\n', 20, '2020-07-28 20:08:23', '2020-10-13 19:35:45'),
(22, 'en', 'Vector Illustration', 'Vector artwork is art made up of vector graphics,these graphics are points, lines, curves and shapes founded on mathematical formulas', 'Vector artwork is art made up of vector graphics,these graphics are points, lines, curves and shapes founded on mathematical formulas', 'Vector artwork is art made up of vector graphics,these graphics are points, lines, curves and shapes founded on mathematical formulas,any art made with vecto rillustration software like Adobe Illustrator is considered vector art; Vector art is created with the use of vector illustration software programs, such as Adobe Illustrator or Corel Draw. The intent is to produce art that is clean, camera ready, and can be scaled infinitely, without any loss of quality or fidelity. Select one of our Expert below for further assistance!', 21, '2020-07-28 20:08:23', '2020-10-13 20:00:37'),
(23, 'en', 'T-Shirt Design', 'A printed T-shirt or graphic T-shirt is a T-shirt displaying a design, image or lettering on it,printing is done with textile or laser printing', 'A printed T-shirt or graphic T-shirt is a T-shirt displaying a design, image or lettering on it,printing is done with textile or laser printing', '<div style="text-align:justify">A printed T-shirt or graphic T-shirt is a T-shirt displaying a design, image or lettering on it,printing is done with textile or laser printing.T-shirt designer The right t-shirt designers can blossom your apparel ideas in a path that impacts the market; Doing a freelance t-shirt design job,or project implies you are an autonomous artist who creates logos, and concepts for t-shirts. You build prototypes on design software, work on apparel and logo designs, aid with brand uniqueness, and connect with the client to understand their vision.Please Hire one of our talented T-shirt designers now.</div>\r\n', 22, '2020-07-28 20:08:23', '2020-10-13 19:36:51'),
(24, 'en', 'Typography', 'It is the design and look of printed matter, the ability or process of arranging type or managing data and its printing', 'It is the design and look of printed matter, the ability or process of arranging type or managing data and its printing', '<div style="text-align:justify">It is the design and look of printed matter, the ability or process of arranging type or managing data and its printing;Typography is all about tweaking the wording contained in the design while producing powerful content. It delivers alluring presence, and conserves the appealing value of your content,it is necessary to set the overall tone of your web site and guarantees a terrific user experience.<br />\r\nTypographers are experts who construct or fashion style for online, and print magazines, journals and or publications. At times they&rsquo;re described as desktop publishers and layout artists. They work extensive hours to meet necessary deadlines.</div>\r\n', 23, '2020-07-28 20:08:23', '2020-10-13 19:37:41'),
(25, 'en', 'Web Programing', 'Is the action of composing essential source code to build a website, it describes as writing the HTML pages', 'Is the action of composing essential source code to build a website, it describes as writing the HTML pages', '<div style="text-align:justify">Is the action of composing essential source code to build a website, it describes as writing the HTML pages,web server managing is coded in Java, PHP, Perl and other languages;Look Into JavaScript, Java, PHP, Perl, Web authoring software and application server. Web programmers are known as web developers, or web engineers, they make applications on the web; Their work facilitates non-design aspects of web expansion, which involves encrypting and markup writing, Coding means to program the software itself, and markup refers to coordinating and configuring content. The role is responsible for creating, coding and modifying websites, from its design to functionality,encompassing a client&#39;s specifications. Strive to produce visually enticing sites that showcase user-friendly layout and clear navigation.Don&rsquo;t hesitate to contact one of our top Web programmers and start creating and or revamping the perfect website for your business.</div>\r\n', 24, '2020-07-28 20:08:23', '2020-10-13 19:38:34'),
(26, 'en', 'Database', 'A well-defined set of data held in a computer, particularly one that is available in numerous ways', 'A well-defined set of data held in a computer, particularly one that is available in numerous ways', 'A well-defined set of data held in a computer, particularly one that is available in numerous ways;one of the main benefits that a DBA will bring to your business is an emphasis on best methods,a knowledgeable DBA will know the right settings, and structures that your database needs, giving you a greater performance than you would otherwise get from install-it-and-forget-it settings. Database administrators (DBAs) use specialized software to store and organize data. The role may include capacity planning, installation, configuration, database design, migration, performance monitoring, security, troubleshooting, as well as support and data recovery.Make the right decision by hiring one of Database Experts today!', 25, '2020-07-28 20:08:23', '2020-10-13 19:39:16'),
(27, 'en', 'Business Plan', 'A written document which outline a Business''s future objectives and strategies for success', 'A written document which outline a Business''s future objectives and strategies for success', '<div style="text-align:justify">A written document which outline a Business&#39;s future objectives and strategies for success; upon hiring a professional writer to outline your Businessplan, he/shewillacquire about your brand, review your previous plan if any, and will help your Business to detectyour pros and cons, and will aidin overcoming your current challenges. Business planner is accountable for establishing strategic objectives and defining a viable pathto attain those objectives; and ensuring operations and performance management. Choose one of our Businessplannersbelowto outline a bright future for your Business!</div>\r\n', 26, '2020-07-28 20:08:23', '2020-10-13 19:39:58'),
(28, 'en', 'Grant Writing', 'Grant writing is the method of seeking for funding via written submission of a proposal for eligibility;', 'Grant writing is the method of seeking for funding via written submission of a proposal for eligibility;', '<div style="text-align:justify">Grant writing is the method of seeking for funding via written submission of a proposal for eligibility; they are usuallyofferedthrough organization such as a government department, corporation, foundation or trust.Grant writers do research, outline, and present proposals that assist Business or individuals receive grant funding;to be qualified for funding, aBusiness or individual must have a purpose that aligns with a grant&#39;s specifications, Grant writers typically work for nonprofit or charitable organizations.Grants are a great resource of income for nonprofits and charities, but the process of researching, writing, and pursuing it is lengthy; If you are unable to allocate time for the process.So, hire one of our Grantwriters who will work seamlessly with you and your teamto get qualified and well needed funds!</div>\r\n', 27, '2020-07-28 20:08:23', '2020-10-13 19:41:21'),
(29, 'en', 'Proposal Writing', 'A Proposal is a document that proposes a resolution to a crisis, or a frequent incur problem, or is an intervention in response to a necessity', 'A Proposal is a document that proposes a resolution to a crisis, or a frequent incur problem, or is an intervention in response to a necessity', '<div style="text-align:justify">A Proposal is a document that proposes a resolution to a crisis, or a frequent incur problem, or is an intervention in response to a necessity;this form also known as a topic proposal. Project proposals are documents that tell shareholders why your project ideas should be fulfilled;reading about your ideas in a well-written document should persuade share holders to support them. Proposal writers work for Businesses to produce documents intended to outline intentions and convince expected readers; yours is awaiting from our pool below!</div>\r\n', 28, '2020-07-28 20:08:23', '2020-10-13 19:42:23'),
(30, 'en', 'Policy Writing', 'A policy is a formal proclamation of rules, a set of regulations that facilitate decision-making, activities, and conduct in a Business and or organization', 'A policy is a formal proclamation of rules, a set of regulations that facilitate decision-making, activities, and conduct in a Business and or organization', '<div style="text-align:justify">A policy is a formal proclamation of rules, a set of regulations that facilitate decision-making, activities, and conduct in a Business and or organization. Policies provide consistency and continuity. Policies are comprised of written records that is readily available to everyone, lessening the potential for controversy and or misunderstanding. Policies and procedures are essential to the operation of a Business. Policies are crucial for they address relevant matters, such as what constitutes suitable behavior by employees etc.Applying policies and procedures during decision-making promote consistent in decisions-making by employers. A policy writer&#39;s job is to make sure employees understand their employer&#39;s rules and regulations;they must account for any policy changes and address them in the Business employees&rsquo; manual. Policy writers are key players that can be hired by browsing through Portfolios below!</div>\r\n', 29, '2020-07-28 20:08:23', '2020-10-13 19:43:03'),
(31, 'en', 'Project Management', '', '', NULL, 30, '2020-07-28 20:08:23', '2020-07-28 20:08:23'),
(32, 'en', 'Marketing Research', 'Market research is the process of deciding the sustainability of a new service or product through direct market research with potential customers', 'Market research is the process of deciding the sustainability of a new service or product through direct market research with potential customers', '<div style="text-align:justify">Market research is the process of deciding the sustainability of a new service or product through direct market research with potential customers. Marketing research is needed on a continual basis if you want to stay on track with the latest market trends and increase a competitive advantage in the Business market.Market research analysts gather and analyze data on consumers and competitors; they research market conditions to assess potential sales of a product or service, they also aid Businesses to understand the consumers&rsquo; want,identify potential consumers, and price analysis. Choose one of our Market research analysts below to increase your sales!</div>\r\n', 31, '2020-07-28 20:08:23', '2020-10-13 19:43:47'),
(33, 'en', 'Branding Services', 'Is a marketing strategy where a Business generates a name, symbol or design that is easily recognizable as belonging to the said Business', 'Is a marketing strategy where a Business generates a name, symbol or design that is easily recognizable as belonging to the said Business', '<div style="text-align:justify">Is a marketing strategy where a Business generates a name, symbol or design that is easily recognizable as belonging to the said Business,there are many avenues used to develop a brandas well as advertising, customer service, promotional merchandise, reputation, and logo. Consumer Market Recognition: Building awareness is often the first communication goal for a Business, benefits of branding services are: Demand Stimulation, Trade Negotiation Power, and Flexibility; Itis considered the &ldquo;voice of the consumer&rdquo; in the creative process. It entailstargeted messages needed to reach consumers appropriately with the right message. Our Experts in Branding Services effectively know how to reach your target clientele, choose of their portfolio below for hire!</div>\r\n', 32, '2020-07-28 20:08:23', '2020-10-13 19:44:26'),
(34, 'en', 'Legal Consulting', 'A legal consultant is a person who consults with client or department heads to identify need or problem', 'A legal consultant is a person who consults with client or department heads to identify need or problem', '<div style="text-align:justify">A legal consultant is a person who consults with client or department heads to identify need or problem. The consultant researches, studies,evaluates, and analyzes data to advise on or recommend solutions, utilizing knowledge of theory, principles, or technology of specific discipline or field of specialization.legal consultant is beneficial to especially start-ups Business that unable to retain a full-time lawyer in their current process.Hiring a Business consultant means committing to a large investment of time and money; Hiring at the right timecan return significant benefits for your Business&rsquo;s revenue, reputation, and long-term growth. Don&rsquo;t Hesitate to select one of our experts below!</div>\r\n', 33, '2020-07-28 20:08:23', '2020-10-13 19:44:54'),
(35, 'en', 'Financial Consulting', 'A financial consultant is basically the same as a financial advisor', 'A financial consultant is basically the same as a financial advisor', 'A financial consultant is basically the same as a financial advisor. They often offer numerous services with their financial guidance gearing on the client&#39;s specific needs and goals. They also offer investment services to individuals and or Businesses, they assist in developing a plan to invest, save and reach your objectives; they give guidance that include taxes, investments and insurance decisions-making. You are one click away from the Financial Consultant that you are looking for; Choose one of our experts below!', 34, '2020-07-28 20:08:23', '2020-10-13 19:45:30'),
(36, 'en', 'Business Consulting', 'A business consultant is a professional who provides professional or expert advice', 'A business consultant is a professional who provides professional or expert advice', '<div style="text-align:justify">A business consultant is a professional who provides professional or expert advice in a particular area such as security (electronic or physical), management, accountancy, law, human resources, marketing (and public relations), finance, engineering, science, digital transformation; they&rsquo;re elaborate in the planning, implementation and education of Businesses. To successfully be at the top it is imperative to seek an outsider&rsquo;s Perspective, that is when a hiring Business Consultant is advantageous, especially management does not always detect existing problems within a Business. They motivate employees to Reach Goals, bring about in new Business Skills, Save Time, Money and Stress. Please select the best Experts in the field below to help empower your team and enhance your Business presence!</div>\r\n', 35, '2020-07-28 20:08:23', '2020-10-13 19:40:35'),
(37, 'en', 'Virtual Assistant', 'A virtual assistant is an independent contractor, and or Freelancer who provides administrative services to clients', 'A virtual assistant is an independent contractor, and or Freelancer who provides administrative services to clients', '<div style="text-align:justify">A virtual assistant is an independent contractor, and or Freelancer who provides administrative services to clients while operating virtual remotely with access to essential planning documents like shared calendars; Typical tasks of virtual assistant comprise of scheduling appointments, making phone calls, making travel arrangements, and managing email accounts. To efficiently allow you the freedom to concentration essential Business cores. Select one of our Business-friendly Virtual assistants today to free up your much-needed time!</div>\r\n', 36, '2020-07-28 20:08:23', '2020-10-13 20:01:21'),
(38, 'en', 'Digital Marketing', 'Digital marketing is the utilization of the Internet, mobile devices, social media, search engines, and other channels', 'Digital marketing is the utilization of the Internet, mobile devices, social media, search engines, and other channels', '<div style="text-align:justify">Digital marketing is the utilization of the Internet, mobile devices, social media, search engines, and other channels to connect with consumers;when youhire a digitalmarketer on Graphex, you will have the undivided attention ofa well-qualified expert. A digital marketing manager oversees the marketing teamand gives support in several areas of your Business marketing needsby Identifyingand testing new digital platforms and tools. Utilizing web analytics tools to monitor site traffic andoptimizing marketing campaigns, such as email marketing, social media and digital advertising.Please consult one of our experts listed in respective portfolios now to get much-needed results!</div>\r\n', 37, '2020-07-28 20:08:23', '2020-10-13 20:02:09'),
(39, 'en', 'Facebook Marketing', 'Facebook marketing is a platform that offers a variation of vastly targeted paid advertisements', 'Facebook marketing is a platform that offers a variation of vastly targeted paid advertisements', '<div style="text-align:justify">Facebook marketing is a platform that offers a variation of vastly targeted paid advertisements, and organic posts where Businesses are permitted theforward-facing of products and services to the massive audience; Facebook is a cost-effective marketing strategy. It allows the sharing of your Business info to the world and enables communication to existing and potential customers, it affords customer support, promote brand awareness and positive word-of-mouth. Facebook can enhance traffic to your website withtargeted advertisement. Facebookmarketing refers to generatingand aggressively using a Facebook page as a communications channel to maintain contact with and attract customers. Facebook accommodates the creation of individual profiles or business pages for companies, organizations, or any group attempting to develop a fan base.Select one of our Business-friendly Social Media Marketers today to aggressively enhance traffic to your site!</div>\r\n', 38, '2020-07-28 20:08:23', '2020-10-13 19:56:09'),
(40, 'en', 'Content Marketing Strategy', 'Content marketing is a tactical marketing method fixated on generating and distributing valuable, relevant, and consistent content ', 'Content marketing is a tactical marketing method fixated on generating and distributing valuable, relevant, and consistent content ', '<div style="text-align:justify">Content marketing is a tactical marketing method fixated on generating and distributing valuable, relevant, and consistent content to charm and retain a clearly defined audience in the purpose of driving of profitable customer action; content marketing helps increase conversions allowing the connection and education of your customers, it enables your customers to make an educated purchasing decision.Select one of our Expert below for further assistance with marketing needs!</div>\r\n', 39, '2020-07-28 20:08:23', '2020-10-13 19:57:05'),
(41, 'en', 'Google Ads', 'Google Ads is a platform utilized to promote your business', 'Google Ads is a platform utilized to promote your business', '<div style="text-align:justify">Google Ads is a platform utilized to promote your business, it raises awareness of products and services of a Business and increase traffic to your website which enables conversions;GoogleAds accounts are managed online, you can generate and alter your ad campaign at your convenience, such as your ad text, settings, and budget.Levelling with Google Ads gives you the ability to show your ads to reach people with specific interests. The Google Ads platform runs on pay-per-click (PPC) advertising, i.e. you must pay every time a visitor clicks your ad.Select one of our Business-friendly Social Media Marketers today to aggressively enhance traffic to your site!</div>\r\n', 40, '2020-07-28 20:08:23', '2020-10-13 19:57:48'),
(42, 'en', 'Social Media Marketing', 'Social media marketing is the application of social media platforms to connect with your audience to promote brand awareness, increase sales, and foster incoming traffic', 'Social media marketing is the application of social media platforms to connect with your audience to promote brand awareness, increase sales, and foster incoming traffic', '<div style="text-align:justify">Social media marketing is the application of social media platforms to connect with your audience to promote brand awareness, increase sales, and foster incoming traffic; Social media is one of the most cost-efficient digital marketing methods used to syndicate content and increase your business&#39; visibility. Hiring a social media manager can provide long-term success for your growing small or well establish business. Having a professional in this area will do more than just guarantee an active social media presence. So, go ahead and pick one the best in the field from available portfolios below!</div>\r\n', 41, '2020-07-28 20:08:23', '2020-10-13 19:58:27'),
(43, 'en', 'Email Marketing Search', 'Email marketing is a component of internet marketing, which includes online marketing, social media, blogs,newsletters with updates on the Business', 'Email marketing is a component of internet marketing, which includes online marketing, social media, blogs,newsletters with updates on the Business', '<div style="text-align:justify">Email marketing is a component of internet marketing, which includes online marketing, social media, blogs,newsletters with updates on the Business, promotions of sales and or exclusive deals for subscribers. In comparison Email marketing is budget friendly versus mainstream marketing channels. It has the capacity to reach a global and engaged audience, distributes targeted messages, enables traffic into conversions, it&rsquo;s easy to measure, share and initiate.Select one of our Business-friendly Email Marketers today to aggressively convert traffic into revenues!</div>\r\n', 42, '2020-07-28 20:08:23', '2020-10-13 19:58:55'),
(44, 'en', 'Engine Marketing', 'Search engine marketing (SEM) is a digital marketing approach that increases your business'' website visibility in online search engine results pages known as (SERPs)', 'Search engine marketing (SEM) is a digital marketing approach that increases your business'' website visibility in online search engine results pages known as (SERPs)', '<div style="text-align:justify">Search engine marketing (SEM) is a digital marketing approach that increases your business&#39; website visibility in online search engine results pages known as (SERPs);it&rsquo;s also known as paid search or pay per click (PPC). SEM (and SEO) not only helps to generate qualified traffic to your websites but can increase brand awareness too. The higher your product or service ranks in search engines, the more likely consumers traffic increase on your website, and it enables your likability among consumers with preference to your recommendations. Select one our top-notch Engine marketers now to put your Business on the map!</div>\r\n', 43, '2020-07-28 20:08:23', '2020-10-13 19:59:46'),
(45, 'en', 'Web Designer', 'Web design is the method of constructing websites. It entails several different aspects, including webpage layout, content production, and graphic design', 'Web design is the method of constructing websites. It entails several different aspects, including webpage layout, content production, and graphic design', '<div style="text-align:justify">Web design is the method of constructing websites. It entails several different aspects, including webpage layout, content production, and graphic design;while the terms web design and webdevelopment are often utilized mutually, web design is technically a subset of the broader category of web development. It is a web designer&#39;s responsibility to create the overall look and feel of a website, using images, HTML, CSS, and JavaScript to do so. Designers are typically innovative in natureand have anaptitude for selecting aesthetically pleasing color palettes.So go on to our many Web Designers portfolios to select the best match for your Business needs today!</div>\r\n', 44, '2020-07-28 20:08:23', '2020-10-14 16:21:05'),
(46, 'en', 'UX Designer', 'User experience (UX) design is the methoddesign teams use to generate products that provide significant and relevant experiences to users', 'User experience (UX) design is the methoddesign teams use to generate products that provide significant and relevant experiences to users', '<div style="text-align:justify">User experience (UX) design is the methoddesign teams use to generate products that provide significant and relevant experiences to users. This involves the design of the entire process of obtaining and incorporating the product, including aspects of branding, design, usability and function;UX iscrucial because it aimsat fulfilling the user&#39;s needs. It seeks to provide positive experiences that keep users loyal to the product or brand. Moreover, a significantuserexperiencelets you to identify customers journeys on your website that are most favorable to business success. A UX designers conduct user research, design, write UX copy, confirm/test with user and sell/present the design solution to the business. It is the UXdesigner&#39;s role to advocate for the users&rsquo; needs while evaluating the business goals.Do not hesitate to contact one of our top Ux Designer to enhance your customers experience today!</div>\r\n', 45, '2020-07-28 20:08:23', '2020-10-14 16:22:10'),
(47, 'en', 'UI Designer', 'User interface (UI) design is the method designers use to develop interfaces in software or electronic devices, focusing on looks or style', 'User interface (UI) design is the method designers use to develop interfaces in software or electronic devices, focusing on looks or style', '<div style="text-align:justify">User interface (UI) design is the method designers use to develop interfaces in software or electronic devices, focusing on looks or style. Designers aim to create interfaces which are user friendly and satisfying. UI design refers to graphical user interfaces and other forms, e.g., voice-controlled interfaces. User Interface Design isessentialto sustain your customer base. It creates fewer obstacles, enhances user engagement, perfects functionality and nurture a strong link between your customers and your website. user experience designer is generally a jack of all trades in the design process centered on users. The rolefocuses on producing the successful user experience through researching, feedback, analyzing, testing, and best practices. Please browse our UI Designers portfolios below for perfect match!</div>\r\n', 46, '2020-07-28 20:08:23', '2020-10-14 16:22:33'),
(48, 'en', 'Copywriter', 'A person who composes the text in the purpose of products advertisements, or publicity material and/or educate and engage consumers.', 'A person who composes the text in the purpose of products advertisements, or publicity material and/or educate and engage consumers.', '<div style="text-align:justify">A person who composes the text in the purpose of products advertisements, or publicity material and/or educate and engage consumers. They engage consumers on websites, blog posts, product descriptions, email blasts, banner advertising, newsletters, white papers, PSAs, social media platforms, including Twitter and Instagram, and other. Choose one of our experts below for Hire!</div>\r\n', 47, '2020-07-28 20:08:23', '2020-10-13 19:45:57'),
(50, 'en', 'Blockchain', '', '', NULL, 49, '2020-07-28 20:08:23', '2020-07-28 20:08:23');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_study_level`
--

CREATE TABLE IF NOT EXISTS `t_employee_study_level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Contenu de la table `t_employee_study_level`
--

INSERT INTO `t_employee_study_level` (`id`, `name`, `icon`, `color`, `awe`, `position`, `created_at`, `updated_at`) VALUES
(1, '', '', '', '', 1, '2020-06-03 21:28:10', '2020-06-03 21:28:10'),
(2, '', '', '', '', 3, '2020-06-03 21:28:34', '2020-06-03 21:28:34'),
(3, '', '', '', '', 2, '2020-06-03 21:28:44', '2020-06-03 21:28:44'),
(4, '', '', '', '', 4, '2020-07-03 18:14:33', '2020-07-03 18:14:33'),
(5, '', '', '', '', 5, '2020-07-03 18:14:39', '2020-07-03 18:14:39'),
(6, '', '', '', '', 6, '2020-07-03 18:14:45', '2020-07-03 18:14:45'),
(7, '', '', '', '', 7, '2020-07-03 18:14:51', '2020-07-03 18:14:51'),
(8, '', '', '', '', 8, '2020-07-03 18:14:56', '2020-07-03 18:14:56');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_study_level_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employee_study_level_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `level_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`level_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=17 ;

--
-- Contenu de la table `t_employee_study_level_i18n`
--

INSERT INTO `t_employee_study_level_i18n` (`id`, `lang`, `title`, `level_id`, `created_at`, `updated_at`) VALUES
(1, 'en', 'Elementary School', 1, '2020-06-03 21:28:10', '2020-07-03 18:14:13'),
(2, 'en', 'Some College', 2, '2020-06-03 21:28:34', '2020-07-03 18:14:26'),
(3, 'en', 'High School', 3, '2020-06-03 21:28:44', '2020-07-03 18:14:19'),
(4, 'en', 'Certificate', 4, '2020-07-03 18:14:33', '2020-07-03 18:14:33'),
(5, 'en', 'College', 5, '2020-07-03 18:14:39', '2020-07-03 18:14:39'),
(6, 'en', 'Licence', 6, '2020-07-03 18:14:45', '2020-07-03 18:14:45'),
(7, 'en', 'Graduate School', 7, '2020-07-03 18:14:51', '2020-07-03 18:14:51'),
(8, 'en', 'Doctorate Degree', 8, '2020-07-03 18:14:56', '2020-07-03 18:14:56'),
(9, 'fr', 'École primaire', 1, '2020-07-03 18:15:19', '2020-07-03 18:15:19'),
(10, 'fr', 'École secondaire', 3, '2020-07-03 18:15:25', '2020-07-03 18:15:25'),
(11, 'fr', 'Collège', 2, '2020-07-03 18:15:34', '2020-07-03 18:15:34'),
(12, 'fr', 'Certificat', 4, '2020-07-03 18:15:39', '2020-07-03 18:15:39'),
(13, 'fr', 'Baccalauréat ', 5, '2020-07-03 18:15:48', '2020-07-03 18:15:48'),
(14, 'fr', 'Doctorat', 8, '2020-07-03 18:16:15', '2020-07-03 18:16:15'),
(15, 'fr', 'Master', 7, '2020-07-03 18:16:23', '2020-07-03 18:16:23'),
(16, 'fr', 'Licence', 6, '2020-07-03 18:16:30', '2020-07-03 18:16:30');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_user`
--

CREATE TABLE IF NOT EXISTS `t_employee_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(48) COLLATE utf8_bin DEFAULT '',
  `creator_id` int(11) unsigned DEFAULT NULL,
  `function_id` int(11) unsigned DEFAULT NULL,
  `experience_id` int(11) unsigned DEFAULT NULL,
  `level_id` int(11) unsigned DEFAULT NULL,
  `default_language` varchar(2) COLLATE utf8_bin DEFAULT '',
  `username` varchar(48) COLLATE utf8_bin DEFAULT '',
  `instagram_user` varchar(24) COLLATE utf8_bin DEFAULT '',
  `gender` enum('Mr','Ms','Mrs') COLLATE utf8_bin NOT NULL,
  `firstname` varchar(48) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(48) COLLATE utf8_bin NOT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(40) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(16) COLLATE utf8_bin NOT NULL,
  `fax` varchar(16) COLLATE utf8_bin NOT NULL,
  `web` varchar(255) COLLATE utf8_bin NOT NULL,
  `address1` varchar(255) COLLATE utf8_bin NOT NULL,
  `address2` varchar(255) COLLATE utf8_bin NOT NULL,
  `avatar` varchar(255) COLLATE utf8_bin NOT NULL,
  `postcode` char(10) COLLATE utf8_bin NOT NULL,
  `state` varchar(20) COLLATE utf8_bin NOT NULL,
  `city` varchar(128) COLLATE utf8_bin NOT NULL,
  `country` varchar(128) COLLATE utf8_bin NOT NULL,
  `number_of_adverts` int(11) unsigned NOT NULL DEFAULT '0',
  `number_of_quotations` int(11) unsigned NOT NULL DEFAULT '0',
  `number_of_views` int(11) unsigned NOT NULL DEFAULT '0',
  `last_delivery` int(11) unsigned DEFAULT '0',
  `number_of_works_inprogress` int(11) unsigned DEFAULT '0',
  `number_of_works` int(11) unsigned DEFAULT '0',
  `average_response_time` int(11) unsigned DEFAULT '0',
  `average_notation` int(8) unsigned DEFAULT NULL,
  `number_of_notations` int(11) unsigned NOT NULL DEFAULT '0',
  `is_online` enum('Y','N') COLLATE utf8_bin DEFAULT 'N',
  `max_advert_category` int(5) unsigned DEFAULT NULL,
  `ranking` int(11) unsigned DEFAULT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL,
  `is_locked` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_validated` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_completed` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_activated` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=46 ;

--
-- Contenu de la table `t_employee_user`
--

INSERT INTO `t_employee_user` (`id`, `url`, `creator_id`, `function_id`, `experience_id`, `level_id`, `default_language`, `username`, `instagram_user`, `gender`, `firstname`, `lastname`, `birthday`, `email`, `password`, `phone`, `mobile`, `fax`, `web`, `address1`, `address2`, `avatar`, `postcode`, `state`, `city`, `country`, `number_of_adverts`, `number_of_quotations`, `number_of_views`, `last_delivery`, `number_of_works_inprogress`, `number_of_works`, `average_response_time`, `average_notation`, `number_of_notations`, `is_online`, `max_advert_category`, `ranking`, `is_active`, `is_locked`, `is_validated`, `is_completed`, `is_activated`, `status`, `created_at`, `updated_at`) VALUES
(17, 'employee3', NULL, 1, 4, 5, 'en', 'employee3', '', 'Mr', 'employee3', 'employee3', '0000-00-00', 'employee3@test.fr', '202cb962ac59075b964b07152d234b70', '', '0627107296', '', '', '', '', 'avatar.jpg', '40000', 'FLORIDA', 'MARRAKECH', 'MA', 7, 29, 290, 0, 0, 0, 1530, 40, 1, 'Y', NULL, NULL, 'YES', 'NO', 'NO', 'YES', 'NO', 'ACTIVE', '2020-05-30 22:59:29', '2020-10-20 15:13:05'),
(32, 'muntaz', NULL, NULL, NULL, NULL, 'en', 'muntaz', '', 'Mr', 'muntaz', 'muntaz', NULL, 'muntaz@free.fr', '202cb962ac59075b964b07152d234b70', '', '0627107296', '', '', 'aaaaa', '', '', '40000', '', 'ny', 'EN', 0, 0, 3, 0, 0, 0, 0, NULL, 0, 'N', NULL, 0, 'YES', 'YES', 'YES', 'YES', 'NO', 'ACTIVE', '2020-10-07 06:33:22', '2020-10-21 23:43:01'),
(33, 'james1', NULL, NULL, NULL, NULL, 'en', 'james1', '', 'Mr', 'James', 'James', NULL, 'james@free.fr', '202cb962ac59075b964b07152d234b70', '', '0627107296', '', '', 'aaaa', '', '', '40000', '', 'marrakech', 'EN', 1, 0, 2, 0, 0, 0, 0, NULL, 0, 'N', NULL, 0, 'YES', 'NO', 'YES', 'YES', 'NO', 'ACTIVE', '2020-10-07 06:55:07', '2020-10-21 05:49:24'),
(34, 'ashmad', NULL, NULL, NULL, NULL, 'en', 'ashmad', '', 'Mr', 'Ashmad', 'Ashmad', NULL, 'ashmad@free.fr', '202cb962ac59075b964b07152d234b70', '', '0627107296', '', '', 'aaaaaaaaaa', '', '', '40000', 'CALIFORNIA', 'SAN FRANCISCO', 'US', 1, 0, 0, 0, 0, 0, 0, NULL, 0, 'N', NULL, 0, 'YES', 'NO', 'YES', 'YES', 'NO', 'ACTIVE', '2020-10-07 07:09:17', '2020-10-07 07:13:26'),
(35, 'lovely', NULL, NULL, NULL, NULL, 'en', 'lovely', '', 'Mrs', 'Lovely', 'Lovely', NULL, 'lovely@free.fr', '202cb962ac59075b964b07152d234b70', '', '0627107296', '', '', 'aaaa', '', '', '20000', '', 'LONDON', 'EN', 1, 0, 4, 0, 0, 0, 0, NULL, 0, 'N', NULL, 0, 'YES', 'NO', 'YES', 'YES', 'NO', 'ACTIVE', '2020-10-07 07:13:51', '2020-10-21 00:55:56'),
(37, '', NULL, NULL, NULL, NULL, '', '', '', 'Mr', 'Abdias', 'Beausejour', NULL, 'abdiasandone@gmail.com', 'a5a73d274422000f10846958209d6221', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, NULL, 0, 'N', NULL, 0, 'YES', 'YES', 'YES', 'NO', 'NO', 'ACTIVE', '2020-10-18 15:28:45', '2020-10-19 00:20:25'),
(39, 'ewebsolutionskech', NULL, NULL, NULL, NULL, '', 'ewebsolutionskech', '', 'Mr', '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, NULL, 0, 'N', NULL, 0, 'YES', 'NO', 'NO', 'NO', 'NO', 'ACTIVE', '2020-10-19 16:32:04', '2020-10-19 16:32:04'),
(42, '', NULL, NULL, NULL, NULL, '', '', '', 'Mr', 'Vox', 'Dei', NULL, 'voxdeiministry@gmail.com', 'aa43ca4087142cdef2f10336d0d2ba17', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, NULL, 0, 'N', NULL, 0, 'YES', 'YES', 'YES', 'NO', 'NO', 'ACTIVE', '2020-10-20 19:29:40', '2020-10-21 04:51:02'),
(43, 'lewisivens', NULL, NULL, NULL, NULL, '', 'Lewis Ivens', '', 'Mr', 'Ing', 'Lewis', NULL, 'lewis2cuteboy@gmail.com', '67e612d8fd629377aabd0348a83c0eb1', '', '', '', '', '', '', 'avatar.jpg', '', '', '', '', 1, 0, 0, 0, 0, 0, 0, NULL, 0, 'N', NULL, 0, 'YES', 'NO', 'NO', 'NO', 'NO', 'ACTIVE', '2020-10-20 21:10:58', '2020-10-20 21:16:39'),
(44, 'inglewis', NULL, NULL, NULL, NULL, '', 'Ing Lewis', '', 'Mr', 'Grafika', 'Design', NULL, 'grafikadesign509@gmail.com', '', '', '', '', '', '', '', 'avatar.png', '', '', '', '', 1, 0, 0, 0, 0, 0, 0, NULL, 0, 'N', NULL, 0, 'YES', 'NO', 'NO', 'NO', 'NO', 'ACTIVE', '2020-10-20 21:15:48', '2020-10-20 21:17:46'),
(45, '', NULL, NULL, NULL, NULL, '', '', '', 'Mr', 'Chadrak', 'Bernadin', NULL, '', '', '', '', '', '', '', '', 'avatar.jpg', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, NULL, 0, 'N', NULL, 0, 'YES', 'NO', 'NO', 'NO', 'NO', 'ACTIVE', '2020-10-21 18:30:55', '2020-10-21 18:30:56');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_user_graduate_diploma`
--

CREATE TABLE IF NOT EXISTS `t_employee_user_graduate_diploma` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(11) unsigned DEFAULT NULL,
  `graduate_id` int(11) unsigned DEFAULT NULL,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `position` int(11) NOT NULL,
  `country` varchar(2) COLLATE utf8_bin DEFAULT '',
  `year` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_user_graduate_diploma_fk0` (`graduate_id`),
  KEY `employee_user_graduate_diploma_fk1` (`employee_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=45 ;

--
-- Contenu de la table `t_employee_user_graduate_diploma`
--

INSERT INTO `t_employee_user_graduate_diploma` (`id`, `city_id`, `graduate_id`, `employee_user_id`, `position`, `country`, `year`, `created_at`, `updated_at`) VALUES
(43, 0, 1, 17, 1, 'DE', 2000, '2020-09-09 22:25:51', '2020-09-09 22:25:51'),
(44, 0, 1, 17, 2, 'DK', 1998, '2020-09-09 22:25:51', '2020-09-09 22:25:51');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_user_graduate_diploma_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employee_user_graduate_diploma_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `diploma` varchar(255) COLLATE utf8_bin DEFAULT '',
  `location` varchar(255) COLLATE utf8_bin DEFAULT '',
  `city` varchar(255) COLLATE utf8_bin DEFAULT '',
  `user_graduate_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`user_graduate_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=42 ;

--
-- Contenu de la table `t_employee_user_graduate_diploma_i18n`
--

INSERT INTO `t_employee_user_graduate_diploma_i18n` (`id`, `lang`, `diploma`, `location`, `city`, `user_graduate_id`, `created_at`, `updated_at`) VALUES
(40, 'en', 'eeeeeeeee', 'yyyyyyyy', 'hhhhhhh', 43, '2020-09-09 22:25:51', '2020-09-09 22:25:51'),
(41, 'en', 'ffffffffffff', 'zzzzzzzz', 'ggggggg', 44, '2020-09-09 22:25:51', '2020-09-09 22:25:51');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_user_language`
--

CREATE TABLE IF NOT EXISTS `t_employee_user_language` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level_id` int(11) unsigned DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_user_language_fk0` (`level_id`),
  KEY `employee_user_language_fk1` (`employee_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=98 ;

--
-- Contenu de la table `t_employee_user_language`
--

INSERT INTO `t_employee_user_language` (`id`, `level_id`, `lang`, `employee_user_id`, `position`, `created_at`, `updated_at`) VALUES
(96, 2, 'fr', 17, 1, '2020-09-09 22:25:51', '2020-09-09 22:25:51'),
(97, 2, 'en', 17, 2, '2020-09-09 22:25:51', '2020-09-09 22:25:51');

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_user_popular`
--

CREATE TABLE IF NOT EXISTS `t_employee_user_popular` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `ip` varchar(16) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_user_popular_fk0` (`employee_user_id`),
  KEY `employee_user_popular_fk1` (`employer_user_id`),
  KEY `employee_user_popular_fk2` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=222 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_user_skill`
--

CREATE TABLE IF NOT EXISTS `t_employee_user_skill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `skill_id` int(11) unsigned DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `position` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_user_skill_fk0` (`skill_id`),
  KEY `employee_user_skill_fk1` (`employee_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=57 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_user_skill_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employee_user_skill_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `value` varchar(255) COLLATE utf8_bin DEFAULT '',
  `skill_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`skill_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=65 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_validation_token`
--

CREATE TABLE IF NOT EXISTS `t_employee_validation_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `token` varchar(64) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `employee_validation_token_fk0` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_work`
--

CREATE TABLE IF NOT EXISTS `t_employee_work` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(24) NOT NULL,
  `name` varchar(256) NOT NULL,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `iteration` int(8) NOT NULL DEFAULT '0',
  `number_of_payments` int(8) unsigned NOT NULL,
  `number_of_hours` int(11) unsigned NOT NULL,
  `duration` int(11) unsigned NOT NULL,
  `description` text NOT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `quotation_id` int(11) unsigned DEFAULT NULL,
  `order_id` int(11) unsigned DEFAULT NULL,
  `project_id` int(11) unsigned DEFAULT NULL,
  `state_id` int(11) unsigned DEFAULT NULL,
  `total_price_without_tax` decimal(10,3) DEFAULT '0.000',
  `total_price_with_tax` decimal(10,3) DEFAULT '0.000',
  `total_paid_without_tax` decimal(10,3) DEFAULT '0.000',
  `total_paid_with_tax` decimal(10,3) DEFAULT '0.000',
  `total_unpaid_without_tax` decimal(10,3) DEFAULT '0.000',
  `total_unpaid_with_tax` decimal(10,3) DEFAULT '0.000',
  `total_required_without_tax` decimal(10,3) DEFAULT '0.000',
  `total_required_with_tax` decimal(10,3) DEFAULT '0.000',
  `is_accepted` enum('NO','YES') NOT NULL DEFAULT 'NO',
  `is_completed` enum('NO','YES') NOT NULL DEFAULT 'NO',
  `batch` int(11) unsigned DEFAULT NULL,
  `state` enum('INPROGRESS','HOLD','PAID','CLOSE') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_work_fk0` (`employee_user_id`),
  KEY `employee_work_fk1` (`employer_user_id`),
  KEY `employee_work_fk2` (`quotation_id`),
  KEY `employee_work_fk3` (`project_id`),
  KEY `employee_work_fk4` (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employee_work_payment_request`
--

CREATE TABLE IF NOT EXISTS `t_employee_work_payment_request` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `requested_at` datetime DEFAULT NULL,
  `reference` varchar(24) NOT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `work_id` int(11) unsigned DEFAULT NULL,
  `quotation_id` int(11) unsigned DEFAULT NULL,
  `project_id` int(11) unsigned DEFAULT NULL,
  `payment_id` int(11) unsigned DEFAULT NULL,
  `iteration` int(8) unsigned NOT NULL DEFAULT '0',
  `total_price_without_tax` decimal(10,3) DEFAULT '0.000',
  `total_price_with_tax` decimal(10,3) DEFAULT '0.000',
  `sms_sent_at` datetime DEFAULT NULL,
  `email_sent_at` datetime DEFAULT NULL,
  `accepted_at` datetime DEFAULT NULL,
  `refused_at` datetime DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmed_by` int(11) DEFAULT NULL,
  `is_active_email_send` enum('NO','YES') NOT NULL DEFAULT 'NO',
  `status` enum('PLANNED','ACTIVE','REFUSED','ACCEPTED','INPROGRESS','PAID','DELETED') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'PLANNED',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_work_payment_request_fk0` (`employee_user_id`),
  KEY `employee_work_payment_request_fk1` (`employer_user_id`),
  KEY `employee_work_payment_request_fk2` (`work_id`),
  KEY `employee_work_payment_request_fk3` (`quotation_id`),
  KEY `employee_work_payment_request_fk4` (`payment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=926 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_activity`
--

CREATE TABLE IF NOT EXISTS `t_employer_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=28 ;

--
-- Contenu de la table `t_employer_activity`
--

INSERT INTO `t_employer_activity` (`id`, `name`, `icon`, `color`, `awe`, `position`, `created_at`, `updated_at`) VALUES
(2, '', '', '', '', 1, '2020-06-12 15:06:13', '2020-06-12 15:06:13'),
(3, '', '', '', '', 2, '2020-07-03 18:19:36', '2020-07-03 18:19:36'),
(4, '', '', '', '', 3, '2020-07-03 18:19:44', '2020-07-03 18:19:44'),
(5, '', '', '', '', 4, '2020-07-03 18:19:51', '2020-07-03 18:19:51'),
(6, '', '', '', '', 5, '2020-07-03 18:19:59', '2020-07-03 18:19:59'),
(7, '', '', '', '', 6, '2020-07-03 18:20:05', '2020-07-03 18:20:05'),
(8, '', '', '', '', 7, '2020-07-03 18:20:12', '2020-07-03 18:20:12'),
(9, '', '', '', '', 8, '2020-07-03 18:20:17', '2020-07-03 18:20:17'),
(10, '', '', '', '', 9, '2020-07-03 18:21:13', '2020-07-03 18:21:13'),
(11, '', '', '', '', 10, '2020-07-03 18:21:20', '2020-07-03 18:21:20'),
(12, '', '', '', '', 11, '2020-07-03 18:21:28', '2020-07-03 18:21:28'),
(13, '', '', '', '', 12, '2020-07-03 18:21:34', '2020-07-03 18:21:34'),
(14, '', '', '', '', 13, '2020-07-03 18:21:46', '2020-07-03 18:21:46'),
(15, '', '', '', '', 14, '2020-07-03 18:21:53', '2020-07-03 18:21:53'),
(16, '', '', '', '', 15, '2020-07-03 18:22:03', '2020-07-03 18:22:03'),
(17, '', '', '', '', 16, '2020-07-03 18:22:11', '2020-07-03 18:22:11'),
(18, '', '', '', '', 17, '2020-07-03 18:22:17', '2020-07-03 18:22:17'),
(19, '', '', '', '', 18, '2020-07-03 18:22:22', '2020-07-03 18:22:22'),
(20, '', '', '', '', 19, '2020-07-03 18:22:32', '2020-07-03 18:22:32'),
(21, '', '', '', '', 20, '2020-07-03 18:22:45', '2020-07-03 18:22:45'),
(22, '', '', '', '', 21, '2020-07-03 18:22:51', '2020-07-03 18:22:51'),
(23, '', '', '', '', 22, '2020-07-03 18:22:58', '2020-07-03 18:22:58'),
(24, '', '', '', '', 23, '2020-07-03 18:23:04', '2020-07-03 18:23:04'),
(25, '', '', '', '', 24, '2020-07-03 18:23:11', '2020-07-03 18:23:11'),
(26, '', '', '', '', 25, '2020-07-03 18:23:23', '2020-07-03 18:23:23'),
(27, '', '', '', '', 26, '2020-07-03 18:23:31', '2020-07-03 18:23:31');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_activity_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employer_activity_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `activity_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`activity_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=29 ;

--
-- Contenu de la table `t_employer_activity_i18n`
--

INSERT INTO `t_employer_activity_i18n` (`id`, `lang`, `title`, `activity_id`, `created_at`, `updated_at`) VALUES
(2, 'fr', 'test', 2, '2020-06-12 15:06:13', '2020-06-12 15:06:13'),
(3, 'en', 'Internet industry', 2, '2020-07-03 18:19:26', '2020-07-03 18:19:26'),
(4, 'en', 'Electric and gas utilities', 3, '2020-07-03 18:19:36', '2020-07-03 18:19:36'),
(5, 'en', 'Computer industry', 4, '2020-07-03 18:19:44', '2020-07-03 18:19:44'),
(6, 'en', 'Movie industry', 5, '2020-07-03 18:19:51', '2020-07-03 18:19:51'),
(7, 'en', 'Telephone industry', 6, '2020-07-03 18:19:59', '2020-07-03 18:19:59'),
(8, 'en', 'Restaurant industry', 7, '2020-07-03 18:20:05', '2020-07-03 18:20:05'),
(9, 'en', 'Sports industry', 8, '2020-07-03 18:20:12', '2020-07-03 18:20:12'),
(10, 'en', 'Farming and agriculture', 9, '2020-07-03 18:20:17', '2020-07-03 18:20:17'),
(11, 'en', 'Retail industry', 10, '2020-07-03 18:21:13', '2020-07-03 18:21:13'),
(12, 'en', 'Television and radio industry', 11, '2020-07-03 18:21:20', '2020-07-03 18:21:20'),
(13, 'en', 'Legal field', 12, '2020-07-03 18:21:28', '2020-07-03 18:21:28'),
(14, 'en', 'Grocery industry', 13, '2020-07-03 18:21:34', '2020-07-03 18:21:34'),
(15, 'en', 'Health care industry', 14, '2020-07-03 18:21:46', '2020-07-03 18:21:46'),
(16, 'en', 'Education', 15, '2020-07-03 18:21:53', '2020-07-03 18:21:53'),
(17, 'en', 'Religion', 16, '2020-07-03 18:22:03', '2020-07-03 18:22:03'),
(18, 'en', 'Pharmaceutical', 17, '2020-07-03 18:22:11', '2020-07-03 18:22:11'),
(19, 'en', 'Politics', 18, '2020-07-03 18:22:17', '2020-07-03 18:22:17'),
(20, 'en', 'Non-profit Organization', 19, '2020-07-03 18:22:22', '2020-07-03 18:22:22'),
(21, 'en', 'Entertainment Industry', 20, '2020-07-03 18:22:32', '2020-07-03 18:22:32'),
(22, 'en', 'Accounting', 21, '2020-07-03 18:22:45', '2020-07-03 18:22:45'),
(23, 'en', 'Banking', 22, '2020-07-03 18:22:51', '2020-07-03 18:22:51'),
(24, 'en', 'Real estate industry', 23, '2020-07-03 18:22:58', '2020-07-03 18:22:58'),
(25, 'en', 'Federal government', 24, '2020-07-03 18:23:04', '2020-07-03 18:23:04'),
(26, 'en', 'Travel industry', 25, '2020-07-03 18:23:11', '2020-07-03 18:23:11'),
(27, 'en', 'Publishing industry', 26, '2020-07-03 18:23:23', '2020-07-03 18:23:23'),
(28, 'en', 'Advertising and public relations industry', 27, '2020-07-03 18:23:31', '2020-07-03 18:23:31');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_advert`
--

CREATE TABLE IF NOT EXISTS `t_employer_advert` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(32) COLLATE utf8_bin DEFAULT '',
  `budget` decimal(8,2) NOT NULL DEFAULT '0.00',
  `employer_user_id` int(11) unsigned NOT NULL,
  `number_of_languages` int(8) unsigned NOT NULL DEFAULT '0',
  `number_of_categories` int(8) unsigned DEFAULT '0',
  `number_of_documents` int(8) unsigned DEFAULT '0',
  `committed_at` datetime DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `refused_at` datetime DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `position` int(11) unsigned DEFAULT '0',
  `state` enum('UPLOAD','DRAFT','REFUSED','COMMITTED','PUBLISHED') COLLATE utf8_bin NOT NULL DEFAULT 'DRAFT',
  `status` enum('ACTIVE','DELETE','CLOSE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_advert_fk1` (`employer_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=112 ;

--
-- Contenu de la table `t_employer_advert`
--

INSERT INTO `t_employer_advert` (`id`, `reference`, `budget`, `employer_user_id`, `number_of_languages`, `number_of_categories`, `number_of_documents`, `committed_at`, `published_at`, `refused_at`, `expired_at`, `position`, `state`, `status`, `created_at`, `updated_at`) VALUES
(71, '2020060500071', 150.00, 9, 1, 1, 6, '2020-06-05 20:37:30', '2020-06-05 20:37:42', NULL, NULL, 0, 'PUBLISHED', 'ACTIVE', '2020-06-05 19:39:05', '2020-06-05 20:37:42'),
(72, '2020060500072', 250.00, 9, 2, 2, 3, '2020-06-05 22:02:56', '2020-06-05 22:03:07', NULL, NULL, 0, 'PUBLISHED', 'ACTIVE', '2020-06-05 22:01:49', '2020-06-05 22:03:07'),
(73, '2020060500073', 180.00, 9, 2, 0, 1, '2020-06-05 22:07:10', '2020-06-05 22:07:21', NULL, NULL, 0, 'PUBLISHED', 'ACTIVE', '2020-06-05 22:06:11', '2020-06-05 22:07:21'),
(74, '', 0.00, 9, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-06-10 22:38:14', '2020-06-10 22:38:14'),
(75, '2020061200075', 0.00, 9, 1, 0, 3, NULL, NULL, NULL, NULL, 0, 'DRAFT', 'ACTIVE', '2020-06-12 09:46:11', '2020-07-09 14:21:31'),
(76, '', 0.00, 9, 0, 0, 3, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-06-15 21:09:13', '2020-06-15 21:15:05'),
(77, '', 0.00, 9, 0, 0, 3, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-06-15 21:15:55', '2020-06-15 21:18:17'),
(78, '', 0.00, 9, 0, 0, 2, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-06-15 21:21:12', '2020-06-15 21:21:21'),
(79, '', 0.00, 9, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-07-09 13:52:24', '2020-07-09 13:52:24'),
(80, '2020070900080', 0.00, 9, 1, 1, 2, NULL, NULL, NULL, NULL, 0, 'DRAFT', 'ACTIVE', '2020-07-09 13:53:06', '2020-07-09 14:20:21'),
(81, '2020070900081', 0.00, 9, 1, 1, 0, NULL, NULL, NULL, NULL, 0, 'DRAFT', 'ACTIVE', '2020-07-09 13:53:11', '2020-07-10 18:18:58'),
(82, '', 0.00, 9, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-07-09 14:12:20', '2020-07-09 14:12:25'),
(83, '', 0.00, 9, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-09-08 17:57:18', '2020-09-08 17:59:48'),
(84, '2020090800084', 688.00, 9, 1, 2, 1, '2020-09-08 18:02:34', '2020-09-08 18:03:22', NULL, NULL, 0, 'PUBLISHED', 'ACTIVE', '2020-09-08 18:01:14', '2020-09-08 18:03:22'),
(85, '', 0.00, 9, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-09-08 23:41:12', '2020-09-08 23:43:37'),
(86, '', 0.00, 9, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-09-08 23:43:43', '2020-09-08 23:43:49'),
(87, '', 0.00, 9, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-09-08 23:45:53', '2020-09-08 23:46:55'),
(88, '2020090800088', 1500.00, 9, 1, 0, 1, '2020-10-05 15:45:50', NULL, NULL, NULL, 0, 'COMMITTED', 'ACTIVE', '2020-09-08 23:46:58', '2020-10-05 15:45:50'),
(105, '2020100700105', 50.00, 42, 1, 1, 2, '2020-10-07 08:28:23', '2020-10-07 08:40:23', NULL, NULL, 0, 'PUBLISHED', 'ACTIVE', '2020-10-07 08:27:16', '2020-10-07 08:40:23'),
(107, '2020100700107', 60.00, 43, 1, 1, 1, '2020-10-07 08:34:14', '2020-10-07 08:40:18', NULL, NULL, 0, 'PUBLISHED', 'ACTIVE', '2020-10-07 08:31:16', '2020-10-07 08:40:18'),
(109, '2020100700109', 50.00, 44, 1, 0, 2, '2020-10-07 08:39:16', '2020-10-07 08:40:14', NULL, NULL, 0, 'PUBLISHED', 'ACTIVE', '2020-10-07 08:38:01', '2020-10-07 08:40:14'),
(110, '', 0.00, 9, 0, 0, 2, NULL, NULL, NULL, NULL, 0, 'UPLOAD', 'ACTIVE', '2020-10-15 09:59:51', '2020-10-15 10:00:13');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_advert_category`
--

CREATE TABLE IF NOT EXISTS `t_employer_advert_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `advert_id` int(11) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_advert_category_fk0` (`advert_id`),
  KEY `employer_advert_category_fk1` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=31 ;

--
-- Contenu de la table `t_employer_advert_category`
--

INSERT INTO `t_employer_advert_category` (`id`, `advert_id`, `category_id`, `created_at`, `updated_at`) VALUES
(20, 71, 2, '2020-06-05 19:39:05', '2020-06-05 19:39:05'),
(21, 72, 2, '2020-06-05 22:02:45', '2020-06-05 22:02:45'),
(22, 72, 4, '2020-06-05 22:02:45', '2020-06-05 22:02:45'),
(23, 80, 2, '2020-07-09 13:53:06', '2020-07-09 13:53:06'),
(24, 81, 2, '2020-07-09 13:53:11', '2020-07-09 13:53:11'),
(25, 84, 30, '2020-09-08 18:01:36', '2020-09-08 18:01:36'),
(26, 84, 36, '2020-09-08 18:01:36', '2020-09-08 18:01:36'),
(29, 105, 2, '2020-10-07 08:27:27', '2020-10-07 08:27:27'),
(30, 107, 14, '2020-10-07 08:33:59', '2020-10-07 08:33:59');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_advert_document`
--

CREATE TABLE IF NOT EXISTS `t_employer_advert_document` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(128) COLLATE utf8_bin NOT NULL,
  `extension` varchar(10) COLLATE utf8_bin NOT NULL,
  `advert_id` int(11) unsigned NOT NULL,
  `employer_user_id` int(11) unsigned NOT NULL,
  `filesize` int(11) unsigned DEFAULT NULL,
  `is_public` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'Y',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_advert_document_fk0` (`advert_id`),
  KEY `employer_advert_document_fk1` (`employer_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=86 ;

--
-- Contenu de la table `t_employer_advert_document`
--

INSERT INTO `t_employer_advert_document` (`id`, `file`, `extension`, `advert_id`, `employer_user_id`, `filesize`, `is_public`, `created_at`, `updated_at`) VALUES
(18, 'images.png', 'png', 71, 9, 4986, 'Y', '2020-06-05 19:29:56', '2020-06-05 19:29:56'),
(19, 'images.png', 'png', 71, 9, 4839, 'Y', '2020-06-05 19:30:28', '2020-06-05 19:30:28'),
(22, 'images.png', 'png', 72, 9, 4839, 'Y', '2020-06-05 21:01:49', '2020-06-05 21:01:49'),
(23, 'images.png', 'png', 72, 9, 5308, 'Y', '2020-06-05 21:02:19', '2020-06-05 21:02:19'),
(24, 'images.png', 'png', 72, 9, 4239, 'Y', '2020-06-05 21:02:37', '2020-06-05 21:02:37'),
(25, 'images.jpg', 'jpg', 73, 9, 14447, 'Y', '2020-06-05 21:06:11', '2020-06-05 21:06:11'),
(26, 'user_84308.png', 'png', 74, 9, 2828, 'Y', '2020-06-10 21:38:14', '2020-06-10 21:38:14'),
(27, 'logo2.jpg', 'jpg', 75, 9, 37116, 'Y', '2020-06-12 08:46:11', '2020-06-17 22:56:16'),
(28, 'avatar-corretor-350x350.png', 'png', 76, 9, 87883, 'Y', '2020-06-15 20:09:13', '2020-06-15 20:09:13'),
(30, 'logo1.jpg', 'jpg', 76, 9, 8370, 'N', '2020-06-15 20:15:05', '2020-06-15 20:15:09'),
(31, 'avatar-corretor-350x350.png', 'png', 77, 9, 87883, 'N', '2020-06-15 20:15:55', '2020-06-15 20:15:59'),
(32, 'melle.jpg', 'jpg', 77, 9, 6989, 'N', '2020-06-15 20:16:07', '2020-06-15 20:16:13'),
(33, 'logo1.jpg', 'jpg', 77, 9, 8370, 'N', '2020-06-15 20:18:17', '2020-06-15 20:18:24'),
(34, 'avatar-corretor-350x350.png', 'png', 78, 9, 87883, 'N', '2020-06-15 20:21:12', '2020-06-15 20:21:14'),
(35, 'melle.jpg', 'jpg', 78, 9, 6989, 'Y', '2020-06-15 20:21:21', '2020-06-15 20:21:21'),
(36, 'logo1.jpg', 'jpg', 75, 9, 8370, 'N', '2020-06-16 08:06:28', '2020-06-16 08:06:31'),
(37, 'avatar-corretor-350x350.png', 'png', 79, 9, 87883, 'Y', '2020-07-09 12:52:24', '2020-07-09 12:52:24'),
(48, 'icon_test.jpg', 'jpg', 80, 9, 378226, 'Y', '2020-07-09 13:08:57', '2020-07-09 13:08:57'),
(55, 'daviddijanni Logo Design Fiverr.png', 'png', 81, 9, 133208, 'Y', '2020-07-09 13:16:45', '2020-07-09 13:16:45'),
(56, 'daviddijanni Logo Design Fiverr.png', 'png', 81, 9, 133208, 'Y', '2020-07-09 13:18:01', '2020-07-09 13:18:01'),
(57, 'tahersky Logo Design Social Media Design Fiverr.png', 'png', 81, 9, 908670, 'Y', '2020-07-09 13:19:39', '2020-07-09 13:19:39'),
(58, '1b234c09-097a-4011-8a1d-418a6a11b40b.jpg', 'jpg', 80, 9, 43781, 'Y', '2020-07-09 13:20:21', '2020-07-09 13:20:21'),
(59, 'icon_test.jpg', 'jpg', 75, 9, 378226, 'Y', '2020-07-09 13:21:31', '2020-07-09 13:21:31'),
(60, 'logo1.jpg', 'jpg', 81, 9, 8370, 'Y', '2020-07-10 17:11:28', '2020-07-10 17:11:28'),
(62, 'avec image PreviewModeltous.pdf', 'pdf', 84, 9, 882566, 'Y', '2020-09-08 17:01:14', '2020-09-08 17:01:26'),
(66, '55bas_de_page-ZLASSISO.png', 'png', 88, 9, 18458, 'Y', '2020-09-08 22:46:58', '2020-09-08 22:46:58'),
(77, 'image22.jpeg', 'jpg', 105, 42, 162500, 'Y', '2020-10-07 07:27:16', '2020-10-07 07:27:16'),
(79, 'image23.jpeg', 'jpg', 105, 42, 92515, 'Y', '2020-10-07 07:27:49', '2020-10-07 07:27:49'),
(80, 'image25.jpeg', 'jpg', 107, 43, 81905, 'Y', '2020-10-07 07:31:16', '2020-10-07 07:31:16'),
(81, 'image24.jpg', 'jpg', 107, 43, 142202, 'Y', '2020-10-07 07:31:16', '2020-10-07 07:31:16'),
(82, 'image27.jpeg', 'jpg', 109, 44, 149701, 'Y', '2020-10-07 07:38:01', '2020-10-07 07:38:01'),
(83, 'image26.jpg', 'jpg', 109, 44, 98919, 'Y', '2020-10-07 07:38:02', '2020-10-07 07:38:02'),
(84, '2020_CC_GOHELPMI.pdf', 'pdf', 110, 9, 348573, 'Y', '2020-10-15 08:59:51', '2020-10-15 08:59:51'),
(85, '2020_CC_GOHELPMI.pdf', 'pdf', 110, 9, 348573, 'Y', '2020-10-15 09:00:13', '2020-10-15 09:00:13');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_advert_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employer_advert_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(32) COLLATE utf8_bin DEFAULT '',
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `url` varchar(255) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `short_description` varchar(512) COLLATE utf8_bin DEFAULT '',
  `content` text COLLATE utf8_bin,
  `advert_id` int(11) unsigned DEFAULT NULL,
  `is_validated` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `number_of_views` int(11) unsigned NOT NULL DEFAULT '0',
  `number_of_quotations` int(11) unsigned NOT NULL DEFAULT '0',
  `published_at` datetime DEFAULT NULL,
  `refused_at` datetime DEFAULT NULL,
  `revival_iteration` int(8) unsigned NOT NULL DEFAULT '0',
  `revival_at` datetime DEFAULT NULL,
  `state` enum('UPLOAD') COLLATE utf8_bin DEFAULT NULL,
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unique` (`advert_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=64 ;

--
-- Contenu de la table `t_employer_advert_i18n`
--

INSERT INTO `t_employer_advert_i18n` (`id`, `reference`, `lang`, `url`, `title`, `short_description`, `content`, `advert_id`, `is_validated`, `number_of_views`, `number_of_quotations`, `published_at`, `refused_at`, `revival_iteration`, `revival_at`, `state`, `status`, `created_at`, `updated_at`) VALUES
(42, '2020060500071/EN', 'en', 'job1', 'job1', 'job1 job1job1j ob1job1job1 job1job1job1j ob1job 1job1job1job1job1job1job 1job1job1jo b1job1jo b1job1job1job1job1job1job1job1job1job1job1job1job1jo b1job1', 'job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1job1', 71, 'NO', 95, 3, '2020-06-05 20:37:42', NULL, 0, NULL, NULL, 'ACTIVE', '2020-06-05 19:39:05', '2020-10-21 05:10:26'),
(44, '2020060500072/EN', 'en', 'job2', 'job2', 'en  job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2', 'en  job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2 job2', 72, 'NO', 86, 2, '2020-06-05 22:03:07', NULL, 0, NULL, NULL, 'ACTIVE', '2020-06-05 22:02:45', '2020-10-21 20:29:07'),
(46, '2020060500073/EN', 'en', 'en-job3-job3', 'en  job3 job3', 'en  job3 job3', 'en  job3 job3', 73, 'NO', 9, 0, '2020-06-05 22:07:21', NULL, 0, NULL, NULL, 'ACTIVE', '2020-06-05 22:06:23', '2020-10-20 17:03:36'),
(52, '2020090800084/EN', 'en', 'project-graphex', 'project graphex', 'project graphex', 'project graphex', 84, 'NO', 5, 0, '2020-09-08 18:03:22', NULL, 0, NULL, NULL, 'ACTIVE', '2020-09-08 18:01:36', '2020-10-21 23:25:52'),
(53, '2020090800088/EN', 'en', 'aaaaaaaaaaaaaa', 'aaaaaaaaaaaaaa', 'aaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaa', 88, 'NO', 0, 0, NULL, NULL, 0, NULL, NULL, 'ACTIVE', '2020-09-08 23:53:38', '2020-09-08 23:53:38'),
(60, '2020100700105/EN', 'en', 'i’m-looking-for-a-graphic-designer-to-reproduce-a-logo-similar-to-that-for-me.', 'I’m looking for a Graphic designer to reproduce a logo similar to that for me.', 'I’m looking for a Graphic designer to reproduce a logo similar to that for me.', '<span style="font-size:17.5pt"><span style="background-color:white"><span style="font-family:&quot;.SFUIText&quot;,&quot;serif&quot;"><span style="color:#454545">I&rsquo;m looking for a Graphic designer to reproduce a logo similar to that for me.</span></span></span></span>', 105, 'NO', 2, 0, '2020-10-07 08:40:23', NULL, 0, NULL, NULL, 'ACTIVE', '2020-10-07 08:27:27', '2020-10-20 02:33:02'),
(61, '2020100700107/EN', 'en', 'i’m-looking-for-a-flyer-designer-to-create-a-flyer-similar-to-that-for-me.', 'I’m looking for a Flyer designer to create a flyer similar to that for me.', 'I’m looking for a Flyer designer to create a flyer similar to that for me.', '<span style="font-size:17.5pt"><span style="background-color:white"><span style="font-family:&quot;.SFUIText&quot;,&quot;serif&quot;"><span style="color:#454545">I&rsquo;m looking for a Flyer designer to create a flyer similar to that for me.</span></span></span></span>', 107, 'NO', 7, 0, '2020-10-07 08:40:18', NULL, 0, NULL, NULL, 'ACTIVE', '2020-10-07 08:33:59', '2020-10-21 02:18:05'),
(62, '2020100700109/EN', 'en', 'i’m-looking-for-someone-that-can-help-me-recreate-that-flyer-for-our-event-that-is-coming-in-december-24th,-2020.', 'I’m looking for someone that can help me recreate that flyer for our event that is coming in December 24th, 2020.', 'I’m looking for someone that can help me recreate that flyer for our event that is coming in December 24th, 2020.', '<span style="font-size:17.5pt"><span style="background-color:white"><span style="font-family:&quot;.SFUIText&quot;,&quot;serif&quot;"><span style="color:#454545">I&rsquo;m looking for someone that can help me recreate that flyer for our event that is coming in December 24th, 2020.</span></span></span></span>', 109, 'NO', 2, 0, '2020-10-07 08:40:14', NULL, 0, NULL, NULL, 'ACTIVE', '2020-10-07 08:39:11', '2020-10-21 06:14:44');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_advert_i18n_abuse`
--

CREATE TABLE IF NOT EXISTS `t_employer_advert_i18n_abuse` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(48) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(48) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `advert_i18n_id` int(11) unsigned DEFAULT NULL,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `type_id` int(11) unsigned DEFAULT NULL,
  `message` varchar(512) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `employer_advert_abuse_fk0` (`advert_i18n_id`),
  KEY `employer_advert_abuse_fk1` (`employee_user_id`),
  KEY `employer_advert_abuse_fk2` (`employer_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=16 ;

--
-- Contenu de la table `t_employer_advert_i18n_abuse`
--

INSERT INTO `t_employer_advert_i18n_abuse` (`id`, `firstname`, `lastname`, `email`, `advert_i18n_id`, `employee_user_id`, `employer_user_id`, `type_id`, `message`, `created_at`) VALUES
(4, 'zzzzzzzz', 'zzzzzzzzzz', 'contact@ewbesolutions.fr', 42, NULL, 9, 2, 'eeeeeeeeeeeeeeee', '2020-07-10 23:53:37'),
(5, 'gggg', 'gggg', 'contact@ewebsolutions.fr', 42, NULL, 9, NULL, 'gggg', '2020-10-07 21:50:38'),
(6, 'gggg', 'gggg', 'contact@ewebsolutions.fr', 42, NULL, 9, NULL, 'gggg', '2020-10-07 21:50:57'),
(7, 'gggg', 'gggg', 'contact@ewebsolutions.fr', 42, NULL, 9, NULL, 'gggg', '2020-10-07 21:52:53'),
(8, 'gggg', 'gggg', 'contact@ewebsolutions.fr', 42, NULL, 9, NULL, 'gggg', '2020-10-07 21:53:53'),
(9, 'gggg', 'gggg', 'contact@ewebsolutions.fr', 42, NULL, 9, NULL, 'gggg', '2020-10-07 21:54:30'),
(10, 'gggg', 'gggg', 'contact@ewebsolutions.fr', 42, NULL, 9, NULL, 'gggg', '2020-10-07 21:55:01'),
(11, 'gggg', 'gggg', 'contact@ewebsolutions.fr', 42, NULL, 9, NULL, 'gggg', '2020-10-07 21:56:18'),
(12, 'gggg', 'gggg', 'contact@ewebsolutions.fr', 42, NULL, 9, NULL, 'gggg', '2020-10-07 21:56:27'),
(13, 'gggg', 'gggg', 'contact@ewebsolutions.fr', 42, NULL, 9, NULL, 'gggg', '2020-10-07 21:58:59'),
(14, 'gggg', 'gggg', 'contact@ewebsolutions.fr', 42, NULL, 9, NULL, 'gggg', '2020-10-07 21:59:41'),
(15, 'gggg', 'gggg', 'contact@ewebsolutions.fr', 42, NULL, 9, NULL, 'gggg', '2020-10-07 22:00:33');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_advert_i18n_claim`
--

CREATE TABLE IF NOT EXISTS `t_employer_advert_i18n_claim` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(48) COLLATE utf8_bin DEFAULT '',
  `contact_id` int(11) unsigned NOT NULL,
  `type_id` int(11) unsigned DEFAULT NULL,
  `advert_i18n_id` int(11) unsigned NOT NULL,
  `description` text COLLATE utf8_bin,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_advert_i18n_notation`
--

CREATE TABLE IF NOT EXISTS `t_employer_advert_i18n_notation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `employee_advert_id` int(11) unsigned DEFAULT NULL,
  `employee_advert_lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `employer_advert_id` int(11) unsigned DEFAULT NULL,
  `employer_advert_lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `work_id` int(11) unsigned NOT NULL,
  `notation` decimal(6,3) NOT NULL DEFAULT '0.000',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_advert_i18n_share`
--

CREATE TABLE IF NOT EXISTS `t_employer_advert_i18n_share` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(48) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(48) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `advert_i18n_id` int(11) unsigned DEFAULT NULL,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `message` varchar(512) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `employer_advert_share_fk0` (`advert_i18n_id`),
  KEY `employer_advert_share_fk1` (`employee_user_id`),
  KEY `employer_advert_share_fk2` (`employer_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_advert_popular`
--

CREATE TABLE IF NOT EXISTS `t_employer_advert_popular` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `advert_id` int(11) unsigned DEFAULT NULL,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `ip` varchar(16) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_advert_popular_fk0` (`advert_id`),
  KEY `employer_advert_popular_fk1` (`employer_user_id`),
  KEY `employer_advert_popular_fk2` (`employee_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=304 ;

--
-- Contenu de la table `t_employer_advert_popular`
--

INSERT INTO `t_employer_advert_popular` (`id`, `advert_id`, `employee_user_id`, `employer_user_id`, `lang`, `country`, `ip`, `created_at`, `updated_at`) VALUES
(2, 72, NULL, 9, 'en', 'en', '127.0.0.1', '2020-06-12 09:43:21', '2020-06-12 09:43:21'),
(25, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-06-22 09:10:02', '2020-06-22 09:10:02'),
(129, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-08-31 20:08:56', '2020-08-31 20:08:56'),
(190, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-02 16:39:18', '2020-09-02 16:39:18'),
(191, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-02 16:41:41', '2020-09-02 16:41:41'),
(192, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-02 16:45:12', '2020-09-02 16:45:12'),
(193, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-02 16:46:38', '2020-09-02 16:46:38'),
(194, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-02 16:46:45', '2020-09-02 16:46:45'),
(197, 72, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-02 18:11:58', '2020-09-02 18:11:58'),
(198, 72, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-02 18:21:44', '2020-09-02 18:21:44'),
(199, 72, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-02 19:02:03', '2020-09-02 19:02:03'),
(200, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-02 21:15:30', '2020-09-02 21:15:30'),
(215, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 10:33:59', '2020-09-04 10:33:59'),
(216, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 10:59:15', '2020-09-04 10:59:15'),
(217, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 11:00:58', '2020-09-04 11:00:58'),
(218, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 11:03:13', '2020-09-04 11:03:13'),
(219, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 11:03:26', '2020-09-04 11:03:26'),
(220, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 11:04:29', '2020-09-04 11:04:29'),
(221, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 11:11:25', '2020-09-04 11:11:25'),
(222, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 11:13:28', '2020-09-04 11:13:28'),
(223, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 11:26:20', '2020-09-04 11:26:20'),
(224, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 11:26:25', '2020-09-04 11:26:25'),
(225, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 11:27:15', '2020-09-04 11:27:15'),
(226, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 11:28:09', '2020-09-04 11:28:09'),
(227, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 14:28:21', '2020-09-04 14:28:21'),
(228, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 14:32:16', '2020-09-04 14:32:16'),
(229, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 14:33:34', '2020-09-04 14:33:34'),
(230, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 14:33:50', '2020-09-04 14:33:50'),
(231, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 14:33:59', '2020-09-04 14:33:59'),
(232, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 14:36:09', '2020-09-04 14:36:09'),
(242, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 15:51:18', '2020-09-04 15:51:18'),
(243, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 17:36:14', '2020-09-04 17:36:14'),
(244, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-04 17:37:47', '2020-09-04 17:37:47'),
(254, 72, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-05 10:51:23', '2020-09-05 10:51:23'),
(255, 72, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-05 11:07:30', '2020-09-05 11:07:30'),
(257, 72, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-07 10:31:08', '2020-09-07 10:31:08'),
(261, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-10 22:16:01', '2020-09-10 22:16:01'),
(264, 72, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-24 23:07:31', '2020-09-24 23:07:31'),
(266, 72, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-25 10:05:28', '2020-09-25 10:05:28'),
(267, 72, NULL, 9, 'en', 'en', '127.0.0.1', '2020-09-25 10:11:51', '2020-09-25 10:11:51'),
(268, 107, NULL, 9, 'en', 'en', '127.0.0.1', '2020-10-07 10:46:45', '2020-10-07 10:46:45'),
(269, 107, NULL, 9, 'en', 'en', '127.0.0.1', '2020-10-07 10:49:02', '2020-10-07 10:49:02'),
(270, 107, NULL, 9, 'en', 'en', '127.0.0.1', '2020-10-07 10:49:56', '2020-10-07 10:49:56'),
(271, 107, NULL, 9, 'en', 'en', '127.0.0.1', '2020-10-07 10:50:21', '2020-10-07 10:50:21'),
(272, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-10-12 19:53:49', '2020-10-12 19:53:49'),
(273, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-10-12 23:10:40', '2020-10-12 23:10:40'),
(274, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-10-13 07:22:30', '2020-10-13 07:22:30'),
(275, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-10-13 07:24:28', '2020-10-13 07:24:28'),
(276, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-10-13 07:25:32', '2020-10-13 07:25:32'),
(277, 71, NULL, 9, 'en', 'en', '127.0.0.1', '2020-10-13 07:27:56', '2020-10-13 07:27:56');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_budget_unit`
--

CREATE TABLE IF NOT EXISTS `t_employer_budget_unit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_budget_unit_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employer_budget_unit_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `unit_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`unit_id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_category`
--

CREATE TABLE IF NOT EXISTS `t_employer_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_category_fk0` (`employer_user_id`),
  KEY `employer_category_fk1` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_category_popular`
--

CREATE TABLE IF NOT EXISTS `t_employer_category_popular` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `ip` varchar(16) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_category_popular_fk0` (`employee_user_id`),
  KEY `employer_category_popular_fk1` (`category_id`),
  KEY `employer_category_popular_fk2` (`employer_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=279 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_city_gallery`
--

CREATE TABLE IF NOT EXISTS `t_employer_city_gallery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) COLLATE utf8_bin NOT NULL,
  `tpl` varchar(15) COLLATE utf8_bin NOT NULL,
  `number_of_items` int(11) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_employer_city_gallery`
--

INSERT INTO `t_employer_city_gallery` (`id`, `name`, `tpl`, `number_of_items`, `created_at`, `updated_at`) VALUES
(1, 'test', '', 0, '2019-12-08 21:33:49', '2019-12-08 21:33:49');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_city_gallery_city`
--

CREATE TABLE IF NOT EXISTS `t_employer_city_gallery_city` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) unsigned NOT NULL,
  `city_id` int(11) unsigned NOT NULL,
  `is_small` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `position` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_city_gallery_city_fk0` (`gallery_id`),
  KEY `employer_city_gallery_city_fk1` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_city_gallery_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employer_city_gallery_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `gallery_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_city_gallery_i18n_fk0` (`gallery_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_employer_city_gallery_i18n`
--

INSERT INTO `t_employer_city_gallery_i18n` (`id`, `lang`, `title`, `gallery_id`, `created_at`, `updated_at`) VALUES
(1, 'fr', 'test', 1, '2019-12-08 21:33:49', '2019-12-08 21:33:49');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_company`
--

CREATE TABLE IF NOT EXISTS `t_employer_company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(48) COLLATE utf8_bin DEFAULT '',
  `name` varchar(18) COLLATE utf8_bin NOT NULL,
  `commercial` varchar(20) COLLATE utf8_bin NOT NULL,
  `registration` varchar(64) COLLATE utf8_bin DEFAULT '',
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `web` varchar(255) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(16) COLLATE utf8_bin NOT NULL,
  `number_of_adverts` int(11) unsigned NOT NULL DEFAULT '0',
  `number_of_users` int(11) unsigned NOT NULL DEFAULT '0',
  `number_of_quotations` int(11) unsigned NOT NULL DEFAULT '0',
  `number_of_views` int(11) unsigned NOT NULL DEFAULT '0',
  `last_delivery` int(11) unsigned DEFAULT '0',
  `number_of_works_inprogress` int(11) unsigned DEFAULT '0',
  `number_of_works` int(11) unsigned DEFAULT '0',
  `average_response_time` int(11) unsigned DEFAULT '0',
  `average_notation` int(8) unsigned DEFAULT NULL,
  `number_of_notations` int(11) unsigned NOT NULL DEFAULT '0',
  `activity_id` int(11) unsigned DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `fax` varchar(16) COLLATE utf8_bin NOT NULL,
  `address1` varchar(255) COLLATE utf8_bin NOT NULL,
  `address2` varchar(255) COLLATE utf8_bin NOT NULL,
  `logo` varchar(20) COLLATE utf8_bin NOT NULL,
  `picture` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `postcode` char(10) COLLATE utf8_bin NOT NULL,
  `city` varchar(128) COLLATE utf8_bin NOT NULL,
  `city_id` int(11) unsigned DEFAULT NULL,
  `country` varchar(128) COLLATE utf8_bin NOT NULL,
  `state` varchar(20) COLLATE utf8_bin NOT NULL,
  `coordinates` varchar(24) COLLATE utf8_bin NOT NULL,
  `lat` decimal(20,13) NOT NULL DEFAULT '0.0000000000000',
  `lng` decimal(20,13) NOT NULL DEFAULT '0.0000000000000',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL,
  `is_validated` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_completed` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_activated` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_configured` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_company_fk0` (`city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Contenu de la table `t_employer_company`
--

INSERT INTO `t_employer_company` (`id`, `url`, `name`, `commercial`, `registration`, `email`, `web`, `mobile`, `number_of_adverts`, `number_of_users`, `number_of_quotations`, `number_of_views`, `last_delivery`, `number_of_works_inprogress`, `number_of_works`, `average_response_time`, `average_notation`, `number_of_notations`, `activity_id`, `phone`, `fax`, `address1`, `address2`, `logo`, `picture`, `postcode`, `city`, `city_id`, `country`, `state`, `coordinates`, `lat`, `lng`, `is_active`, `is_validated`, `is_completed`, `is_activated`, `is_configured`, `status`, `created_at`, `updated_at`) VALUES
(1, 'company1', 'Company1', '', '', '', '', '', 60, 6, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, '0620145678', '', 'aaaaaaaaaaa', '', 'logo.jpg', 'picture.jpg', '75000', 'PARIS', NULL, 'FR', '', '', 0.0000000000000, 0.0000000000000, 'YES', 'YES', 'YES', 'NO', 'NO', 'ACTIVE', '2020-01-09 12:20:47', '2020-06-06 01:28:36'),
(2, 'ewebsolutionskech', 'ewebsolutionskech', '', '', '', '', '', 10, 2, 0, 0, 0, 0, 0, 0, NULL, 0, 2, '0627107296', '', 'WWWWWWWWWWWWWWW', '', 'logo.jpg', 'picture.jpg', '40000', 'MARRAKECH', NULL, 'MA', 'FLORIDA', '', 0.0000000000000, 0.0000000000000, 'YES', 'YES', 'YES', 'NO', 'NO', 'ACTIVE', '2020-05-30 00:26:09', '2020-09-08 22:56:42');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_company_content`
--

CREATE TABLE IF NOT EXISTS `t_employer_company_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) unsigned NOT NULL,
  `name` varchar(15) COLLATE utf8_bin NOT NULL,
  `picture` varchar(24) COLLATE utf8_bin NOT NULL,
  `url` varchar(255) COLLATE utf8_bin NOT NULL,
  `template` varchar(64) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `employer_company_content_fk0` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Contenu de la table `t_employer_company_content`
--

INSERT INTO `t_employer_company_content` (`id`, `company_id`, `name`, `picture`, `url`, `template`, `created_at`, `updated_at`) VALUES
(4, 1, '', '', '', 'default.tpl', '2020-06-04 21:33:27', '2020-06-04 21:33:27'),
(5, 2, '', '', '', 'default.tpl', '2020-08-09 23:42:53', '2020-08-09 23:42:53');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_company_content_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employer_company_content_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(11) unsigned NOT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_robots` varchar(30) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `employer_company_content_i18n_fk0` (`content_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- Contenu de la table `t_employer_company_content_i18n`
--

INSERT INTO `t_employer_company_content_i18n` (`id`, `content_id`, `lang`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `meta_robots`, `created_at`, `updated_at`) VALUES
(4, 4, 'fr', '', 'aaaaaaaaaaa', '', '', '', '2020-06-04 22:09:01', '2020-06-04 22:09:01'),
(5, 4, 'en', '', 'hhhhhhhhhh', '', '', '', '2020-06-04 22:09:01', '2020-06-04 22:12:07'),
(6, 4, 'es', '', '', '', '', '', '2020-06-04 22:09:01', '2020-06-04 22:09:01'),
(7, 5, 'en', 'Hello, My name is Fred apart from photography and music I like designing and founder of mount design. Mount design is a team of professional and enthusiastic designer who believes that every business needs a brand identity to grow and develop their busine', 'best company of the world', 'best company of the world', '', '', '2020-08-09 23:42:36', '2020-08-09 23:42:36');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_company_popular`
--

CREATE TABLE IF NOT EXISTS `t_employer_company_popular` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `company_id` int(11) unsigned DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `ip` varchar(16) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_company_popular_fk0` (`employee_user_id`),
  KEY `employer_company_popular_fk1` (`company_id`),
  KEY `employer_company_popular_fk2` (`employer_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=82 ;

--
-- Contenu de la table `t_employer_company_popular`
--

INSERT INTO `t_employer_company_popular` (`id`, `employee_user_id`, `employer_user_id`, `company_id`, `lang`, `country`, `ip`, `created_at`, `updated_at`) VALUES
(1, NULL, 9, 2, 'fr', 'fr', '127.0.0.1', '2020-06-08 00:14:15', '2020-06-08 00:14:15'),
(2, NULL, 9, 2, 'fr', 'fr', '127.0.0.1', '2020-06-08 00:18:46', '2020-06-08 00:18:46'),
(3, 17, NULL, 1, 'fr', 'fr', '127.0.0.1', '2020-06-08 22:45:55', '2020-06-08 22:45:55'),
(4, 17, NULL, 1, 'fr', 'fr', '127.0.0.1', '2020-06-10 08:56:35', '2020-06-10 08:56:35'),
(7, NULL, 9, 1, 'en', 'en', '127.0.0.1', '2020-06-12 09:54:42', '2020-06-12 09:54:42'),
(8, NULL, NULL, 1, 'en', 'en', '127.0.0.1', '2020-06-12 15:45:46', '2020-06-12 15:45:46'),
(9, NULL, NULL, 1, 'fr', 'fr', '127.0.0.1', '2020-06-12 15:45:54', '2020-06-12 15:45:54'),
(10, 17, NULL, 1, 'en', 'en', '127.0.0.1', '2020-06-15 22:40:17', '2020-06-15 22:40:17'),
(11, NULL, 9, 2, 'en', 'en', '127.0.0.1', '2020-06-22 09:10:52', '2020-06-22 09:10:52'),
(12, 17, NULL, 1, 'en', 'en', '127.0.0.1', '2020-06-24 21:42:09', '2020-06-24 21:42:09'),
(13, 17, NULL, 2, 'en', 'en', '127.0.0.1', '2020-06-25 10:48:34', '2020-06-25 10:48:34'),
(14, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-09 13:34:53', '2020-08-09 13:34:53'),
(15, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:07:12', '2020-08-10 00:07:12'),
(16, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:09:16', '2020-08-10 00:09:16'),
(17, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:09:43', '2020-08-10 00:09:43'),
(18, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:10:37', '2020-08-10 00:10:37'),
(19, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:11:21', '2020-08-10 00:11:21'),
(20, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:11:51', '2020-08-10 00:11:51'),
(21, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:13:06', '2020-08-10 00:13:06'),
(22, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:15:32', '2020-08-10 00:15:32'),
(23, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:28:43', '2020-08-10 00:28:43'),
(24, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:29:29', '2020-08-10 00:29:29'),
(25, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:30:00', '2020-08-10 00:30:00'),
(26, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:31:09', '2020-08-10 00:31:09'),
(27, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:31:52', '2020-08-10 00:31:52'),
(28, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:32:22', '2020-08-10 00:32:22'),
(29, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:40:58', '2020-08-10 00:40:58'),
(30, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:41:41', '2020-08-10 00:41:41'),
(31, NULL, 9, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:42:56', '2020-08-10 00:42:56'),
(32, NULL, 9, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:43:01', '2020-08-10 00:43:01'),
(33, NULL, 9, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:43:46', '2020-08-10 00:43:46'),
(34, NULL, 9, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:49:01', '2020-08-10 00:49:01'),
(35, NULL, 9, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:49:47', '2020-08-10 00:49:47'),
(36, NULL, 9, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:50:07', '2020-08-10 00:50:07'),
(37, NULL, 9, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:50:47', '2020-08-10 00:50:47'),
(38, NULL, 9, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:51:07', '2020-08-10 00:51:07'),
(39, NULL, 9, 2, 'en', 'en', '127.0.0.1', '2020-08-10 00:51:30', '2020-08-10 00:51:30'),
(40, NULL, 9, 2, 'en', 'en', '127.0.0.1', '2020-08-10 09:16:39', '2020-08-10 09:16:39'),
(41, NULL, 9, 2, 'en', 'en', '127.0.0.1', '2020-08-11 09:22:54', '2020-08-11 09:22:54'),
(42, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-12 23:00:25', '2020-08-12 23:00:25'),
(43, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-17 10:54:55', '2020-08-17 10:54:55'),
(44, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 00:00:22', '2020-08-19 00:00:22'),
(45, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 00:03:28', '2020-08-19 00:03:28'),
(46, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 00:03:39', '2020-08-19 00:03:39'),
(47, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 00:04:59', '2020-08-19 00:04:59'),
(48, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 00:06:38', '2020-08-19 00:06:38'),
(49, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 00:08:29', '2020-08-19 00:08:29'),
(50, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 13:11:55', '2020-08-19 13:11:55'),
(51, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 13:31:51', '2020-08-19 13:31:51'),
(52, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 13:40:05', '2020-08-19 13:40:05'),
(53, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 13:40:29', '2020-08-19 13:40:29'),
(54, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 13:40:50', '2020-08-19 13:40:50'),
(55, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 13:41:51', '2020-08-19 13:41:51'),
(56, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 13:42:43', '2020-08-19 13:42:43'),
(57, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 13:43:10', '2020-08-19 13:43:10'),
(58, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 13:45:50', '2020-08-19 13:45:50'),
(59, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 13:46:08', '2020-08-19 13:46:08'),
(60, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 15:58:09', '2020-08-19 15:58:09'),
(61, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 16:00:14', '2020-08-19 16:00:14'),
(62, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 16:01:12', '2020-08-19 16:01:12'),
(63, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 16:02:06', '2020-08-19 16:02:06'),
(64, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 16:03:24', '2020-08-19 16:03:24'),
(65, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 16:04:10', '2020-08-19 16:04:10'),
(66, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 16:04:34', '2020-08-19 16:04:34'),
(67, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 16:15:27', '2020-08-19 16:15:27'),
(68, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 16:15:52', '2020-08-19 16:15:52'),
(69, NULL, NULL, 1, 'en', 'en', '127.0.0.1', '2020-08-19 22:46:08', '2020-08-19 22:46:08'),
(70, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 22:47:02', '2020-08-19 22:47:02'),
(71, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 22:48:29', '2020-08-19 22:48:29'),
(72, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-19 22:54:52', '2020-08-19 22:54:52'),
(73, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-24 09:27:51', '2020-08-24 09:27:51'),
(74, NULL, 9, 2, 'en', 'en', '127.0.0.1', '2020-08-25 09:38:16', '2020-08-25 09:38:16'),
(75, NULL, 9, 2, 'en', 'en', '127.0.0.1', '2020-08-25 09:38:35', '2020-08-25 09:38:35'),
(76, NULL, NULL, 2, 'en', 'en', '127.0.0.1', '2020-08-25 18:19:28', '2020-08-25 18:19:28'),
(77, NULL, 9, 2, 'en', 'en', '127.0.0.1', '2020-09-10 22:16:24', '2020-09-10 22:16:24'),
(78, NULL, NULL, 1, 'en', 'en', '66.249.65.203', '2020-10-18 20:14:08', '2020-10-18 20:14:08'),
(79, NULL, NULL, 2, 'en', 'en', '66.249.65.205', '2020-10-18 20:14:51', '2020-10-18 20:14:51'),
(80, NULL, NULL, 2, 'en', 'en', '107.77.225.229', '2020-10-20 16:11:24', '2020-10-20 16:11:24'),
(81, NULL, NULL, 2, 'en', 'en', '66.249.66.87', '2020-10-20 23:37:09', '2020-10-20 23:37:09');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_contact`
--

CREATE TABLE IF NOT EXISTS `t_employer_contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gender` enum('Mr','Ms','Mrs') COLLATE utf8_bin NOT NULL,
  `firstname` varchar(64) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(64) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(16) COLLATE utf8_bin NOT NULL,
  `fax` varchar(16) COLLATE utf8_bin NOT NULL,
  `address1` varchar(255) COLLATE utf8_bin NOT NULL,
  `address2` varchar(255) COLLATE utf8_bin NOT NULL,
  `postcode` char(10) COLLATE utf8_bin NOT NULL,
  `city` varchar(128) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `state` varchar(20) COLLATE utf8_bin NOT NULL,
  `message` varchar(512) COLLATE utf8_bin NOT NULL,
  `subject` varchar(255) COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Contenu de la table `t_employer_contact`
--

INSERT INTO `t_employer_contact` (`id`, `gender`, `firstname`, `lastname`, `email`, `phone`, `mobile`, `fax`, `address1`, `address2`, `postcode`, `city`, `country`, `state`, `message`, `subject`, `is_active`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mrs', 'aaaaaaaa', 'aaaaaaaaaaa', 'free@free.fr', '', '', '', '', '', '', '', '', '', 'aaaaaattttttttttttttttttttttttttttttttttttttttttttttttttt', 'aaaaaaaaaa', 'NO', 'ACTIVE', '2020-08-05 18:14:29', '2020-08-05 18:14:29'),
(2, 'Mrs', 'eeeeee', 'eeeeeee', 'er@free.fr', '0627107296', '', '', '', '', '', '', '', '', 'ddddddddddddrrrrrrrrrrrrr', 'ddddddddd', 'NO', 'ACTIVE', '2020-09-19 14:10:51', '2020-09-19 14:10:51'),
(3, 'Mrs', 'eeeeee', 'eeeeeee', 'er@free.fr', '0627107296', '', '', '', '', '', '', '', '', 'ddddddddddddrrrrrrrrrrrrr', 'ddddddddd', 'NO', 'ACTIVE', '2020-09-19 14:11:56', '2020-09-19 14:11:56'),
(4, 'Mrs', 'eeeeee', 'eeeeeee', 'er@free.fr', '0627107296', '', '', '', '', '', '', '', '', 'ddddddddddddrrrrrrrrrrrrr', 'ddddddddd', 'NO', 'ACTIVE', '2020-09-19 14:12:25', '2020-09-19 14:12:25'),
(5, 'Mrs', 'eeeeee', 'eeeeeee', 'er@free.fr', '0627107296', '', '', '', '', '', '', '', '', 'ddddddddddddrrrrrrrrrrrrr', 'ddddddddd', 'NO', 'ACTIVE', '2020-09-19 14:13:15', '2020-09-19 14:13:15'),
(6, 'Mrs', 'eeeeee', 'eeeeeee', 'er@free.fr', '0627107296', '', '', '', '', '', '', '', '', 'ddddddddddddrrrrrrrrrrrrr', 'ddddddddd', 'NO', 'ACTIVE', '2020-09-19 14:13:38', '2020-09-19 14:13:38'),
(7, 'Mrs', 'eeeeee', 'eeeeeee', 'er@free.fr', '0627107296', '', '', '', '', '', '', '', '', 'ddddddddddddrrrrrrrrrrrrr', 'ddddddddd', 'NO', 'ACTIVE', '2020-09-19 14:14:34', '2020-09-19 14:14:34'),
(8, 'Mrs', 'eeeeee', 'eeeeeee', 'er@free.fr', '0627107296', '', '', '', '', '', '', '', '', 'ddddddddddddrrrrrrrrrrrrr', 'ddddddddd', 'NO', 'ACTIVE', '2020-09-19 14:15:30', '2020-09-19 14:15:30');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_content`
--

CREATE TABLE IF NOT EXISTS `t_employer_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employer_user_id` int(11) unsigned NOT NULL,
  `name` varchar(15) COLLATE utf8_bin NOT NULL,
  `picture` varchar(24) COLLATE utf8_bin NOT NULL,
  `url` varchar(255) COLLATE utf8_bin NOT NULL,
  `template` varchar(64) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `employer_content_fk0` (`employer_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `t_employer_content`
--

INSERT INTO `t_employer_content` (`id`, `employer_user_id`, `name`, `picture`, `url`, `template`, `created_at`, `updated_at`) VALUES
(3, 9, '', '', '', 'default.tpl', '2020-07-28 23:38:47', '2020-07-28 23:38:47');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_content_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employer_content_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(11) unsigned NOT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_robots` varchar(30) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `employer_content_i18n_fk0` (`content_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Contenu de la table `t_employer_content_i18n`
--

INSERT INTO `t_employer_content_i18n` (`id`, `content_id`, `lang`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `meta_robots`, `created_at`, `updated_at`) VALUES
(7, 3, 'en', 'Hello, My name is Fred apart from photography and music I like designing and founder of mount design.Mount design is a team of professional and enthusiastic designer who believes that every business needs a brand identity to grow and develop their busines', 'je suis le meilleur', 'je suis le meilleur', '', '', '2020-07-28 23:38:31', '2020-08-08 10:05:38'),
(8, 3, 'es', '', '', '', '', '', '2020-07-28 23:38:31', '2020-07-28 23:38:31');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_contract_type`
--

CREATE TABLE IF NOT EXISTS `t_employer_contract_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_employer_contract_type`
--

INSERT INTO `t_employer_contract_type` (`id`, `name`, `icon`, `color`, `awe`, `position`, `created_at`, `updated_at`) VALUES
(1, '', '', '', '', 1, '2020-01-05 11:42:01', '2020-01-05 11:42:01');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_contract_type_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employer_contract_type_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `type_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`type_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_employer_contract_type_i18n`
--

INSERT INTO `t_employer_contract_type_i18n` (`id`, `lang`, `title`, `type_id`, `created_at`, `updated_at`) VALUES
(1, 'fr', 'TYPE1', 1, '2020-01-05 11:42:01', '2020-01-05 11:42:01');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_criteria_notation`
--

CREATE TABLE IF NOT EXISTS `t_employer_criteria_notation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `criteria_id` int(11) unsigned DEFAULT NULL,
  `notation` decimal(6,3) NOT NULL DEFAULT '0.000',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_favourite`
--

CREATE TABLE IF NOT EXISTS `t_employer_favourite` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `employee_id` int(11) unsigned DEFAULT NULL,
  `employer_id` int(11) unsigned DEFAULT NULL,
  `employer_advert_id` int(11) unsigned DEFAULT NULL,
  `employee_advert_id` int(11) unsigned DEFAULT NULL,
  `employer_advert_lang` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `employee_advert_lang` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Contenu de la table `t_employer_favourite`
--

INSERT INTO `t_employer_favourite` (`id`, `employee_user_id`, `employer_user_id`, `employee_id`, `employer_id`, `employer_advert_id`, `employee_advert_id`, `employer_advert_lang`, `employee_advert_lang`, `created_at`, `updated_at`) VALUES
(2, NULL, 9, NULL, 9, NULL, NULL, '', '', '2020-09-02 16:19:25', '2020-09-02 16:19:25'),
(3, NULL, 9, 17, NULL, NULL, NULL, '', '', '2020-09-02 16:24:01', '2020-09-02 16:24:01'),
(7, NULL, 9, NULL, NULL, NULL, 25, '', 'fr', '2020-09-02 18:30:08', '2020-09-02 18:30:08'),
(8, NULL, 9, NULL, NULL, 71, NULL, 'en', '', '2020-09-02 21:15:50', '2020-09-02 21:15:50');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_function`
--

CREATE TABLE IF NOT EXISTS `t_employer_function` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `t_employer_function`
--

INSERT INTO `t_employer_function` (`id`, `name`, `icon`, `color`, `awe`, `position`, `created_at`, `updated_at`) VALUES
(1, '', '', '', '', 1, '2020-01-05 11:38:52', '2020-01-05 11:38:52'),
(3, '', '', '', '', 2, '2020-08-08 22:59:26', '2020-08-08 22:59:26');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_function_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employer_function_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `function_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`function_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Contenu de la table `t_employer_function_i18n`
--

INSERT INTO `t_employer_function_i18n` (`id`, `lang`, `title`, `function_id`, `created_at`, `updated_at`) VALUES
(1, 'fr', 'test', 1, '2020-01-05 11:38:52', '2020-01-05 11:38:52'),
(2, 'en', 'Director', 1, '2020-08-08 22:49:11', '2020-08-08 22:49:11'),
(4, 'en', 'Project manager', 3, '2020-08-08 22:59:26', '2020-08-08 22:59:26');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_gallery`
--

CREATE TABLE IF NOT EXISTS `t_employer_gallery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `tpl` varchar(15) COLLATE utf8_bin NOT NULL,
  `number_of_items` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_employer_gallery`
--

INSERT INTO `t_employer_gallery` (`id`, `name`, `is_active`, `tpl`, `number_of_items`, `created_at`, `updated_at`) VALUES
(1, 'TEST', 'YES', '', 1, '2019-12-07 23:47:49', '2020-05-20 01:45:55');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_gallery_company`
--

CREATE TABLE IF NOT EXISTS `t_employer_gallery_company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) unsigned NOT NULL,
  `employer_id` int(11) unsigned NOT NULL,
  `position` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_gallery_company_fk0` (`gallery_id`),
  KEY `employer_gallery_company_fk1` (`employer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `t_employer_gallery_company`
--

INSERT INTO `t_employer_gallery_company` (`id`, `gallery_id`, `employer_id`, `position`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_gallery_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employer_gallery_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `gallery_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_gallery_i18n_fk0` (`gallery_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_employer_gallery_i18n`
--

INSERT INTO `t_employer_gallery_i18n` (`id`, `lang`, `title`, `gallery_id`, `created_at`, `updated_at`) VALUES
(1, 'fr', 'TEST', 1, '2019-12-07 23:47:49', '2019-12-07 23:47:49');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_language`
--

CREATE TABLE IF NOT EXISTS `t_employer_language` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_language_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employer_language_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `language_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`language_id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_language_level`
--

CREATE TABLE IF NOT EXISTS `t_employer_language_level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_employer_language_level`
--

INSERT INTO `t_employer_language_level` (`id`, `name`, `icon`, `color`, `awe`, `position`, `created_at`, `updated_at`) VALUES
(1, '', '', '', '', 1, '2020-06-06 19:40:38', '2020-06-06 19:40:38');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_language_level_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employer_language_level_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `level_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`level_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Contenu de la table `t_employer_language_level_i18n`
--

INSERT INTO `t_employer_language_level_i18n` (`id`, `lang`, `title`, `level_id`, `created_at`, `updated_at`) VALUES
(1, 'fr', 'test', 1, '2020-06-06 19:40:38', '2020-06-06 19:40:38'),
(2, 'en', 'native', 1, '2020-08-08 23:03:35', '2020-08-08 23:03:35');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_level`
--

CREATE TABLE IF NOT EXISTS `t_employer_level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_level_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employer_level_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `level_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`level_id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_notation_category`
--

CREATE TABLE IF NOT EXISTS `t_employer_notation_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `t_employer_notation_category`
--

INSERT INTO `t_employer_notation_category` (`id`, `name`, `icon`, `color`, `awe`, `position`, `created_at`, `updated_at`) VALUES
(1, '', '', '', '', 1, '2020-07-30 11:39:48', '2020-07-30 11:39:48'),
(2, '', '', '', '', 2, '2020-07-30 11:39:57', '2020-07-30 11:39:57'),
(3, '', '', '', '', 3, '2020-07-30 11:39:57', '2020-07-30 11:39:57');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_notation_category_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employer_notation_category_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `category_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`category_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `t_employer_notation_category_i18n`
--

INSERT INTO `t_employer_notation_category_i18n` (`id`, `lang`, `title`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'en', 'cat1', 1, '2020-07-30 11:39:48', '2020-09-03 21:22:41'),
(2, 'en', 'cat2', 2, '2020-07-30 11:39:57', '2020-09-03 21:22:46'),
(3, 'en', 'cat3', 3, '2020-07-30 11:39:57', '2020-09-03 21:22:52');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_notation_criteria`
--

CREATE TABLE IF NOT EXISTS `t_employer_notation_criteria` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `max` int(11) unsigned NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_notation_criteria_fk1` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=20 ;

--
-- Contenu de la table `t_employer_notation_criteria`
--

INSERT INTO `t_employer_notation_criteria` (`id`, `category_id`, `name`, `icon`, `color`, `awe`, `max`, `position`, `created_at`, `updated_at`) VALUES
(1, 1, '', '', '', '', 10, 1, '2020-07-30 11:43:33', '2020-09-03 21:23:13'),
(2, 1, '', '', '', '', 10, 2, '2020-07-30 11:43:42', '2020-09-03 21:23:40'),
(3, 2, '', '', '', '', 10, 3, '2020-09-03 21:34:35', '2020-09-03 21:34:35'),
(4, 2, '', '', '', '', 10, 4, '2020-09-03 21:35:18', '2020-09-03 21:35:18'),
(17, 3, '', '', '', '', 10, 5, '2020-09-03 21:44:05', '2020-09-03 21:44:05'),
(18, 3, '', '', '', '', 10, 6, '2020-09-03 21:44:05', '2020-09-03 21:44:05'),
(19, 3, '', '', '', '', 10, 7, '2020-09-03 21:44:29', '2020-09-03 21:44:29');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_notation_criteria_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employer_notation_criteria_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `criteria_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`criteria_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=20 ;

--
-- Contenu de la table `t_employer_notation_criteria_i18n`
--

INSERT INTO `t_employer_notation_criteria_i18n` (`id`, `lang`, `title`, `criteria_id`, `created_at`, `updated_at`) VALUES
(1, 'en', 'c1-1', 1, '2020-07-30 11:43:33', '2020-09-03 21:23:13'),
(2, 'en', 'c1-2', 2, '2020-07-30 11:43:42', '2020-09-03 21:23:34'),
(3, 'en', 'c2-1', 3, '2020-09-03 21:34:35', '2020-09-03 21:34:35'),
(4, 'en', 'c2-2', 4, '2020-09-03 21:35:18', '2020-09-03 21:35:18'),
(17, 'en', 'c3-1', 17, '2020-09-03 21:44:05', '2020-09-03 21:44:13'),
(18, 'en', 'c3-3', 18, '2020-09-03 21:44:05', '2020-09-03 21:44:05'),
(19, 'en', 'c3-2', 19, '2020-09-03 21:44:29', '2020-09-03 21:44:29');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_project`
--

CREATE TABLE IF NOT EXISTS `t_employer_project` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(32) COLLATE utf8_bin DEFAULT '',
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `budget` decimal(8,2) NOT NULL DEFAULT '0.00',
  `employer_user_id` int(11) unsigned NOT NULL,
  `number_of_languages` int(8) unsigned DEFAULT '0',
  `number_of_documents` int(8) unsigned DEFAULT '0',
  `number_of_shares` int(8) unsigned DEFAULT '0',
  `position` int(11) unsigned DEFAULT '0',
  `is_active` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'YES',
  `state` enum('UPLOAD') COLLATE utf8_bin DEFAULT NULL,
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_project_fk1` (`employer_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Contenu de la table `t_employer_project`
--

INSERT INTO `t_employer_project` (`id`, `reference`, `name`, `budget`, `employer_user_id`, `number_of_languages`, `number_of_documents`, `number_of_shares`, `position`, `is_active`, `state`, `status`, `created_at`, `updated_at`) VALUES
(1, '', '', 0.00, 9, 0, 1, 0, 0, 'YES', 'UPLOAD', 'ACTIVE', '2020-06-11 15:41:07', '2020-06-11 15:41:07'),
(2, '', '', 0.00, 9, 0, 1, 0, 0, 'YES', 'UPLOAD', 'ACTIVE', '2020-06-11 15:45:03', '2020-06-11 15:45:03'),
(3, '', '', 0.00, 9, 0, 0, 0, 0, 'YES', 'UPLOAD', 'ACTIVE', '2020-06-11 15:46:13', '2020-06-11 15:48:05'),
(5, '2020061100005', 'project3', 3000.00, 9, 1, 2, 0, 0, 'YES', '', 'ACTIVE', '2020-06-11 15:49:05', '2020-09-29 13:19:19'),
(6, '2020061300006', 'project4', 1500.00, 9, 1, 2, 0, 0, 'YES', '', 'ACTIVE', '2020-06-13 00:48:53', '2020-09-29 12:26:19');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_project_document`
--

CREATE TABLE IF NOT EXISTS `t_employer_project_document` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(128) COLLATE utf8_bin NOT NULL,
  `extension` varchar(10) COLLATE utf8_bin NOT NULL,
  `project_id` int(11) unsigned NOT NULL,
  `employer_user_id` int(11) unsigned NOT NULL,
  `filesize` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_project_document_fk0` (`project_id`),
  KEY `employer_project_document_fk1` (`employer_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Contenu de la table `t_employer_project_document`
--

INSERT INTO `t_employer_project_document` (`id`, `file`, `extension`, `project_id`, `employer_user_id`, `filesize`, `created_at`, `updated_at`) VALUES
(1, 'logo2.jpg', 'jpg', 1, 9, 37116, '2020-06-11 14:41:07', '2020-06-11 14:41:07'),
(2, 'logo2.jpg', 'jpg', 2, 9, 37116, '2020-06-11 14:45:03', '2020-06-11 14:45:03'),
(4, 'Graphex Inauguration Form.pdf', 'pdf', 6, 9, 943803, '2020-09-29 11:26:19', '2020-09-29 11:26:19'),
(5, 'Graphex Mission Page final.pdf', 'pdf', 6, 9, 3582808, '2020-09-29 11:26:19', '2020-09-29 11:26:19'),
(7, 'Graphex Inauguration Form.pdf', 'pdf', 5, 9, 943803, '2020-09-29 11:30:23', '2020-09-29 11:30:23'),
(8, 'Graphex welcome Message5.png', 'png', 5, 9, 4375836, '2020-09-29 12:09:17', '2020-09-29 12:09:17');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_project_i18n`
--

CREATE TABLE IF NOT EXISTS `t_employer_project_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(32) COLLATE utf8_bin DEFAULT '',
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `url` varchar(255) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `short_description` varchar(512) COLLATE utf8_bin DEFAULT '',
  `content` text COLLATE utf8_bin,
  `project_id` int(11) unsigned DEFAULT NULL,
  `state` enum('UPLOAD') COLLATE utf8_bin DEFAULT NULL,
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`project_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `t_employer_project_i18n`
--

INSERT INTO `t_employer_project_i18n` (`id`, `reference`, `lang`, `url`, `title`, `short_description`, `content`, `project_id`, `state`, `status`, `created_at`, `updated_at`) VALUES
(1, '2020061100005/EN', 'en', 'cv xvcxvx', 'cv xvcxvx', 'vxxbvx', 'xvbvcbcv', 5, '', 'ACTIVE', '2020-06-11 15:49:05', '2020-06-11 15:49:05'),
(3, '2020061300006/EN', 'en', 'dddddddddd', 'dddddddddd', 'dddddddddddddddd', 'dddddddddddd', 6, '', 'ACTIVE', '2020-06-11 15:49:05', '2020-06-11 15:49:05');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_quotation_project_request`
--

CREATE TABLE IF NOT EXISTS `t_employer_quotation_project_request` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `advert_id` int(11) unsigned DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `quotation_id` int(11) unsigned DEFAULT NULL,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `project_id` int(11) unsigned DEFAULT NULL,
  `request_id` int(11) unsigned DEFAULT NULL,
  `quoted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_quotation_project_request_fk0` (`employee_user_id`),
  KEY `employer_quotation_project_request_fk1` (`employer_user_id`),
  KEY `employer_quotation_project_request_fk2` (`request_id`),
  KEY `employer_quotation_project_request_fk3` (`project_id`),
  KEY `employer_quotation_project_request_fk4` (`quotation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=33 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_quotation_request`
--

CREATE TABLE IF NOT EXISTS `t_employer_quotation_request` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(24) COLLATE utf8_bin NOT NULL,
  `advert_id` int(11) unsigned DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `quotation_id` int(11) unsigned DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `number_of_projects` int(8) unsigned DEFAULT '0',
  `number_of_quotations` int(8) unsigned DEFAULT '0',
  `quoted_at` datetime DEFAULT NULL,
  `revival_iteration` int(8) unsigned NOT NULL,
  `revival_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_quotation_request_fk0` (`employee_user_id`),
  KEY `employer_quotation_request_fk1` (`employer_user_id`),
  KEY `employer_quotation_request_fk2` (`advert_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=59 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_user`
--

CREATE TABLE IF NOT EXISTS `t_employer_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(48) COLLATE utf8_bin DEFAULT '',
  `username` varchar(48) COLLATE utf8_bin DEFAULT '',
  `instagram_user` varchar(24) COLLATE utf8_bin DEFAULT '',
  `company_id` int(11) unsigned DEFAULT NULL,
  `creator_id` int(11) unsigned DEFAULT NULL,
  `default_language` varchar(2) COLLATE utf8_bin DEFAULT '',
  `gender` enum('Mr','Ms','Mrs') COLLATE utf8_bin NOT NULL,
  `firstname` varchar(48) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(48) COLLATE utf8_bin NOT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(40) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(16) COLLATE utf8_bin NOT NULL,
  `fax` varchar(16) COLLATE utf8_bin NOT NULL,
  `web` varchar(255) COLLATE utf8_bin NOT NULL,
  `address1` varchar(255) COLLATE utf8_bin NOT NULL,
  `address2` varchar(255) COLLATE utf8_bin NOT NULL,
  `avatar` varchar(255) COLLATE utf8_bin NOT NULL,
  `postcode` char(10) COLLATE utf8_bin NOT NULL,
  `state` varchar(20) COLLATE utf8_bin NOT NULL,
  `city` varchar(128) COLLATE utf8_bin NOT NULL,
  `city_id` int(11) unsigned DEFAULT NULL,
  `country` varchar(3) COLLATE utf8_bin NOT NULL,
  `number_of_adverts` int(11) unsigned NOT NULL DEFAULT '0',
  `number_of_quotations` int(11) unsigned NOT NULL DEFAULT '0',
  `number_of_views` int(11) unsigned NOT NULL DEFAULT '0',
  `last_delivery` int(11) unsigned DEFAULT '0',
  `number_of_works_inprogress` int(11) unsigned DEFAULT '0',
  `number_of_works` int(11) unsigned DEFAULT '0',
  `average_response_time` int(11) unsigned DEFAULT '0',
  `average_notation` int(8) unsigned DEFAULT NULL,
  `number_of_notations` int(11) unsigned NOT NULL DEFAULT '0',
  `is_online` enum('Y','N') COLLATE utf8_bin DEFAULT 'N',
  `max_advert_category` int(5) unsigned DEFAULT NULL,
  `ranking` int(11) unsigned DEFAULT NULL,
  `function_id` int(11) unsigned DEFAULT NULL,
  `function` varchar(40) COLLATE utf8_bin NOT NULL,
  `activity_id` int(11) unsigned DEFAULT NULL,
  `is_completed` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_validated` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL,
  `is_admin` enum('YES','NO') COLLATE utf8_bin NOT NULL,
  `is_locked` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `lastlogin` timestamp NULL DEFAULT NULL,
  `lastpassword` timestamp NULL DEFAULT NULL,
  `type` enum('private','professional') COLLATE utf8_bin NOT NULL DEFAULT 'private',
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_user_fk0` (`company_id`),
  KEY `employer_user_fk1` (`function_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=71 ;

--
-- Contenu de la table `t_employer_user`
--

INSERT INTO `t_employer_user` (`id`, `url`, `username`, `instagram_user`, `company_id`, `creator_id`, `default_language`, `gender`, `firstname`, `lastname`, `birthday`, `email`, `password`, `phone`, `mobile`, `fax`, `web`, `address1`, `address2`, `avatar`, `postcode`, `state`, `city`, `city_id`, `country`, `number_of_adverts`, `number_of_quotations`, `number_of_views`, `last_delivery`, `number_of_works_inprogress`, `number_of_works`, `average_response_time`, `average_notation`, `number_of_notations`, `is_online`, `max_advert_category`, `ranking`, `function_id`, `function`, `activity_id`, `is_completed`, `is_validated`, `is_active`, `is_admin`, `is_locked`, `lastlogin`, `lastpassword`, `type`, `status`, `created_at`, `updated_at`) VALUES
(9, 'employer3', 'employer3', '', 2, NULL, 'en', 'Mr', 'Employer3', 'Employer3', NULL, 'employer3@free.fr', '202cb962ac59075b964b07152d234b70', '', '0627107296', '', '', '', '', 'avatar.jpg', '', '', '', NULL, 'FR', 10, 34, 193, 0, 0, 0, 4555, 40, 1, 'N', NULL, NULL, 1, '', NULL, 'YES', 'YES', 'YES', 'YES', 'NO', '2020-10-17 18:43:52', '2020-05-29 20:57:02', 'professional', 'ACTIVE', '2020-05-29 20:57:02', '2020-10-21 21:25:52'),
(42, 'leelee', 'leelee', '', NULL, NULL, 'en', 'Mr', 'lee', 'lee', NULL, 'lee@free.fr', '202cb962ac59075b964b07152d234b70', '', '0627107296', '', '', 'aaa', '', '', '75000', '', 'PARIS', NULL, 'FR', 1, 0, 2, 0, 0, 0, 0, NULL, 0, 'N', NULL, 0, NULL, '', NULL, 'YES', 'YES', 'YES', 'YES', 'NO', '2020-10-07 07:25:25', '2020-10-07 07:25:22', 'private', 'ACTIVE', '2020-10-07 07:25:22', '2020-10-20 00:33:02'),
(43, 'jennyjenny', 'jennyjenny', '', NULL, NULL, 'en', 'Mrs', 'Jenny', 'Jenny', NULL, 'jenny@free.fr', '202cb962ac59075b964b07152d234b70', '', '0627107296', '', '', 'aaaaaaaaa', '', '', '69000', '', 'LYON', NULL, 'FR', 1, 0, 7, 0, 0, 0, 0, NULL, 0, 'N', NULL, 0, NULL, '', 9, 'YES', 'YES', 'YES', 'YES', 'NO', '2020-10-07 07:28:48', '2020-10-07 07:28:45', 'private', 'ACTIVE', '2020-10-07 07:28:45', '2020-10-21 00:18:05'),
(44, 'molloy', 'molloy', '', NULL, NULL, 'en', 'Mr', 'Molloy', 'Molloy', NULL, 'molloy@free.fr', '202cb962ac59075b964b07152d234b70', '', '0627107296', '', '', 'aaaaaaa', '', '', '20000', '', 'CASABLANCA', NULL, 'MA', 1, 0, 2, 0, 0, 0, 0, NULL, 0, 'N', NULL, 0, NULL, '', NULL, 'YES', 'YES', 'YES', 'YES', 'NO', '2020-10-07 07:36:55', '2020-10-07 07:36:53', 'private', 'ACTIVE', '2020-10-07 07:36:53', '2020-10-21 04:14:44'),
(52, '', '', '', NULL, NULL, '', 'Mr', 'Wendy', 'Pierre', NULL, 'voxdeiministry@gmail.com', '', '', '', '', '', '', '', 'avatar.jpg', '', '', '', NULL, '', 0, 0, 0, 0, 0, 0, 0, NULL, 0, 'N', NULL, 0, NULL, '', NULL, 'NO', 'NO', 'YES', 'NO', 'NO', '2020-10-19 16:00:43', NULL, 'private', 'ACTIVE', '2020-10-19 15:06:20', '2020-10-19 16:00:43'),
(69, '', '', '', NULL, NULL, '', 'Mr', 'Grafika', 'Design', NULL, 'grafikadesign509@gmail.com', '', '', '', '', '', '', '', 'avatar.png', '', '', '', NULL, '', 0, 0, 0, 0, 0, 0, 0, NULL, 0, 'N', NULL, 0, NULL, '', NULL, 'NO', 'NO', 'YES', 'NO', 'NO', '2020-10-20 21:19:09', NULL, 'private', 'ACTIVE', '2020-10-20 21:19:09', '2020-10-20 21:19:09'),
(70, '', '', '', NULL, NULL, '', 'Mr', 'Souad', 'Elmajdaoui', NULL, 'so.elmajdaoui@gmail.com', '', '', '', '', '', '', '', 'avatar.png', '', '', '', NULL, '', 0, 0, 0, 0, 0, 0, 0, NULL, 0, 'N', NULL, 0, NULL, '', NULL, 'NO', 'NO', 'YES', 'NO', 'YES', '2020-10-21 10:45:52', NULL, 'private', 'ACTIVE', '2020-10-21 10:43:24', '2020-10-21 10:51:04');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_user_forgot_password`
--

CREATE TABLE IF NOT EXISTS `t_employer_user_forgot_password` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `password` varchar(40) COLLATE utf8_bin NOT NULL,
  `key` varchar(40) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_user_forgot_password_fk0` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_user_language`
--

CREATE TABLE IF NOT EXISTS `t_employer_user_language` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level_id` int(11) unsigned DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_user_language_fk0` (`level_id`),
  KEY `employer_user_language_fk1` (`employer_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=13 ;

--
-- Contenu de la table `t_employer_user_language`
--

INSERT INTO `t_employer_user_language` (`id`, `level_id`, `lang`, `employer_user_id`, `position`, `created_at`, `updated_at`) VALUES
(11, 1, 'en', 9, 1, '2020-08-08 23:04:47', '2020-08-08 23:04:47'),
(12, 1, 'zh', 9, 2, '2020-08-08 23:04:47', '2020-08-08 23:04:47');

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_user_popular`
--

CREATE TABLE IF NOT EXISTS `t_employer_user_popular` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `ip` varchar(16) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_user_popular_fk0` (`employee_user_id`),
  KEY `employer_user_popular_fk1` (`employer_user_id`),
  KEY `employer_user_popular_fk2` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=273 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_user_remember`
--

CREATE TABLE IF NOT EXISTS `t_employer_user_remember` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `key` varchar(40) COLLATE utf8_bin NOT NULL,
  `ip` varchar(36) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_user_session`
--

CREATE TABLE IF NOT EXISTS `t_employer_user_session` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `session` varchar(40) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `ip` varchar(50) COLLATE utf8_bin NOT NULL,
  `lat` decimal(20,13) DEFAULT NULL,
  `lng` decimal(20,13) DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `ended_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_user_session_fk0` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=18 ;

--
-- Contenu de la table `t_employer_user_session`
--

INSERT INTO `t_employer_user_session` (`id`, `session`, `user_id`, `ip`, `lat`, `lng`, `started_at`, `ended_at`, `created_at`, `updated_at`) VALUES
(3, 'df569c76a3u2359fvv7353v5d4', 52, '105.156.114.110', NULL, NULL, '2020-10-19 15:06:22', '2020-10-19 15:38:47', '2020-10-19 15:06:22', NULL),
(16, '4n8dagrptork5ln84ltcck74r2', 69, '200.113.230.31', NULL, NULL, '2020-10-20 21:19:09', '2020-10-20 21:20:31', '2020-10-20 21:19:09', NULL),
(17, 'n4dnk0fbn2hjbuqbh1sf64dp80', 70, '41.250.44.143', NULL, NULL, '2020-10-21 10:43:25', '2020-10-21 10:51:04', '2020-10-21 10:43:25', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `t_employer_user_validation_token`
--

CREATE TABLE IF NOT EXISTS `t_employer_user_validation_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `token` varchar(64) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `employer_user_validation_token_fk0` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_forgot_password`
--

CREATE TABLE IF NOT EXISTS `t_forgot_password` (
  `user_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` varchar(32) COLLATE utf8_bin NOT NULL,
  `key` varchar(40) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `key` (`key`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `t_google_map_address`
--

CREATE TABLE IF NOT EXISTS `t_google_map_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `signature` varchar(128) COLLATE utf8_bin NOT NULL,
  `address` varchar(382) COLLATE utf8_bin NOT NULL,
  `lat` decimal(20,13) DEFAULT NULL,
  `lng` decimal(20,13) DEFAULT NULL,
  `error` varchar(255) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_groups`
--

CREATE TABLE IF NOT EXISTS `t_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `name` varchar(30) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `application` enum('admin','frontend','superadmin') COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=17 ;

--
-- Contenu de la table `t_groups`
--

INSERT INTO `t_groups` (`id`, `is_active`, `name`, `created_at`, `updated_at`, `application`) VALUES
(1, 'YES', 'superadmin', '2011-11-07 09:26:44', '2011-11-07 09:26:44', 'superadmin'),
(2, 'YES', 'admin', '2011-11-07 09:26:44', '2011-11-07 09:26:44', 'superadmin'),
(3, 'YES', 'superadmin', '2011-11-07 09:26:44', '2020-10-10 16:44:57', 'admin'),
(4, 'YES', 'admin', '2011-11-07 09:26:44', '2016-05-19 22:30:30', 'admin'),
(12, 'YES', 'test2', '2014-10-08 11:09:00', '2014-10-08 11:13:52', 'superadmin'),
(13, 'YES', 'test4', '2014-10-08 11:51:51', '2014-10-08 11:52:43', 'superadmin'),
(14, 'YES', 'test3', '2014-10-08 11:51:51', '2014-10-08 11:52:43', 'superadmin'),
(15, 'NO', 'test6', '2014-10-08 11:52:11', '2014-10-08 11:52:50', 'superadmin'),
(16, 'YES', 'test5', '2014-10-08 11:52:11', '2014-10-08 11:56:10', 'superadmin');

-- --------------------------------------------------------

--
-- Structure de la table `t_groups_i18n`
--

CREATE TABLE IF NOT EXISTS `t_groups_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `title` varchar(30) COLLATE utf8_bin NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_i18n` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Contenu de la table `t_groups_i18n`
--

INSERT INTO `t_groups_i18n` (`id`, `lang`, `title`, `group_id`, `created_at`, `updated_at`) VALUES
(3, 'fr', 'SuperAdministrateur1', 3, '2015-08-11 17:18:08', '2016-05-19 22:39:21'),
(4, 'fr', 'Administrateur', 4, '2018-10-30 23:42:00', '2018-10-30 23:42:00');

-- --------------------------------------------------------

--
-- Structure de la table `t_group_permission`
--

CREATE TABLE IF NOT EXISTS `t_group_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission` (`permission_id`),
  KEY `group` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=200 ;

--
-- Contenu de la table `t_group_permission`
--

INSERT INTO `t_group_permission` (`id`, `permission_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 5, 2),
(5, 6, 2),
(6, 9, 3),
(9, 12, 4),
(10, 13, 4),
(11, 17, 5),
(12, 18, 5),
(13, 19, 6),
(14, 20, 6),
(15, 25, 1),
(16, 7, 12),
(21, 1, 12),
(27, 27, 8),
(28, 28, 8),
(31, 53, 8),
(32, 27, 9),
(33, 28, 9),
(34, 29, 9),
(35, 30, 9),
(36, 31, 9),
(37, 32, 9),
(38, 53, 9),
(41, 56, 8),
(42, 35, 8),
(43, 34, 8),
(44, 33, 8),
(48, 53, 10),
(49, 51, 10),
(50, 58, 10),
(51, 57, 10),
(52, 30, 10),
(53, 32, 10),
(54, 31, 10),
(56, 28, 10),
(57, 55, 10),
(58, 54, 10),
(59, 27, 10),
(60, 60, 10),
(61, 59, 10),
(62, 56, 10),
(63, 33, 10),
(64, 9, 4),
(75, 156, 3),
(76, 86, 3),
(77, 34, 3),
(78, 88, 3),
(79, 89, 3),
(80, 94, 3),
(81, 95, 3),
(82, 92, 3),
(83, 96, 3),
(84, 38, 3),
(85, 93, 3),
(86, 37, 3),
(87, 87, 3),
(88, 91, 3),
(89, 35, 3),
(90, 90, 3),
(91, 36, 3),
(92, 33, 3),
(93, 89, 10),
(94, 96, 10),
(95, 87, 10),
(96, 156, 17),
(97, 86, 17),
(98, 34, 17),
(99, 88, 17),
(100, 89, 17),
(101, 94, 17),
(102, 95, 17),
(103, 92, 17),
(104, 96, 17),
(105, 38, 17),
(106, 93, 17),
(107, 37, 17),
(108, 87, 17),
(109, 91, 17),
(110, 35, 17),
(111, 90, 17),
(112, 36, 17),
(113, 33, 17),
(114, 67, 17),
(115, 63, 17),
(116, 76, 17),
(117, 28, 17),
(118, 70, 17),
(119, 81, 17),
(120, 85, 17),
(121, 83, 17),
(122, 84, 17),
(123, 78, 17),
(124, 32, 17),
(125, 31, 17),
(126, 64, 17),
(127, 52, 17),
(128, 73, 17),
(129, 62, 17),
(130, 53, 17),
(131, 59, 17),
(132, 74, 17),
(133, 69, 17),
(134, 71, 17),
(135, 80, 17),
(136, 29, 17),
(137, 60, 17),
(138, 75, 17),
(139, 30, 17),
(140, 68, 17),
(141, 79, 17),
(142, 51, 17),
(143, 77, 17),
(144, 72, 17),
(145, 82, 17),
(146, 27, 17),
(147, 131, 17),
(148, 161, 17),
(149, 117, 17),
(150, 165, 17),
(151, 131, 17),
(152, 142, 17),
(153, 166, 17),
(155, 117, 11),
(156, 165, 11),
(158, 161, 11),
(159, 131, 11),
(160, 56, 17),
(161, 97, 17),
(162, 156, 11),
(163, 86, 11),
(164, 34, 11),
(165, 88, 11),
(166, 89, 11),
(167, 94, 11),
(168, 95, 11),
(169, 96, 11),
(170, 37, 11),
(171, 38, 11),
(172, 93, 11),
(173, 87, 11),
(174, 91, 11),
(175, 92, 11),
(176, 35, 11),
(177, 90, 11),
(178, 36, 11),
(179, 33, 11),
(180, 171, 8),
(182, 171, 4),
(183, 171, 4),
(184, 171, 4),
(185, 171, 4),
(186, 173, 3),
(187, 29, 8),
(191, 177, 8),
(192, 46, 8),
(193, 178, 8),
(194, 172, 8),
(195, 167, 8),
(196, 179, 18),
(197, 184, 23),
(198, 185, 4),
(199, 25, 3);

-- --------------------------------------------------------

--
-- Structure de la table `t_languages`
--

CREATE TABLE IF NOT EXISTS `t_languages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `position` smallint(6) NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `application` enum('frontend','superadmin','admin') COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_1` (`code`,`application`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=23 ;

--
-- Contenu de la table `t_languages`
--

INSERT INTO `t_languages` (`id`, `code`, `position`, `is_active`, `created_at`, `updated_at`, `application`) VALUES
(1, 'ch', 7, 'YES', '2012-04-05 13:52:35', '0000-00-00 00:00:00', 'superadmin'),
(2, 'de', 6, 'YES', '2012-04-05 13:52:35', '0000-00-00 00:00:00', 'superadmin'),
(3, 'en', 5, 'YES', '2012-04-05 13:52:35', '0000-00-00 00:00:00', 'superadmin'),
(4, 'es', 4, 'YES', '2012-04-05 13:52:35', '0000-00-00 00:00:00', 'superadmin'),
(5, 'fi', 3, 'YES', '2012-04-05 13:52:35', '0000-00-00 00:00:00', 'superadmin'),
(6, 'fr', 1, 'YES', '2012-04-05 13:52:35', '0000-00-00 00:00:00', 'superadmin'),
(7, 'gr', 2, 'YES', '2012-04-05 13:52:35', '0000-00-00 00:00:00', 'superadmin'),
(9, 'en', 2, 'YES', '2014-08-05 09:26:43', '2020-08-06 10:47:27', 'frontend'),
(10, 'fr', 1, 'YES', '2014-08-05 07:46:19', '0000-00-00 00:00:00', 'admin'),
(11, 'es', 3, 'NO', '2020-05-24 01:39:12', '2020-08-06 10:44:43', 'frontend'),
(12, 'ab', 2, 'NO', '2020-05-29 02:22:03', '2020-05-29 02:22:03', 'admin'),
(13, 'aa', 3, 'NO', '2020-05-29 02:22:03', '2020-05-29 02:22:03', 'admin'),
(14, 'af', 4, 'NO', '2020-05-29 02:22:03', '2020-05-29 02:22:03', 'admin'),
(15, 'ak', 5, 'NO', '2020-05-29 02:22:03', '2020-05-29 02:22:03', 'admin'),
(16, 'sq', 6, 'NO', '2020-05-29 02:22:03', '2020-05-29 02:22:03', 'admin'),
(17, 'av', 7, 'NO', '2020-05-29 02:22:03', '2020-05-29 02:22:03', 'admin'),
(18, 'ae', 8, 'NO', '2020-05-29 02:22:03', '2020-05-29 02:22:03', 'admin'),
(19, 'ay', 9, 'NO', '2020-05-29 02:22:03', '2020-05-29 02:22:03', 'admin'),
(20, 'az', 10, 'NO', '2020-05-29 02:22:03', '2020-05-29 02:22:03', 'admin'),
(21, 'bm', 11, 'NO', '2020-05-29 02:22:03', '2020-05-29 02:22:03', 'admin'),
(22, 'fr', 4, 'NO', '2020-08-06 07:57:39', '2020-08-06 10:47:28', 'frontend');

-- --------------------------------------------------------

--
-- Structure de la table `t_modules`
--

CREATE TABLE IF NOT EXISTS `t_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `logo` varchar(255) COLLATE utf8_bin NOT NULL,
  `type` varchar(48) COLLATE utf8_bin NOT NULL,
  `title` varchar(128) CHARACTER SET utf8 NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `mode` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '',
  `status` enum('loaded','installed','uninstalled') COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_available` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `in_site` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=327 ;

--
-- Contenu de la table `t_modules`
--

INSERT INTO `t_modules` (`id`, `name`, `logo`, `type`, `title`, `description`, `mode`, `status`, `is_active`, `is_available`, `in_site`, `created_at`, `updated_at`) VALUES
(1, 'site_company', 'logo.png', 'site', 'site company', 'this module manage the site company.', '', 'installed', 'YES', 'YES', 'NO', '2014-08-04 07:17:47', '2014-08-04 07:17:47'),
(26, 'dashboard', 'logo.png', 'core', 'dashboard', 'this module manage dashboard', '', 'loaded', 'YES', 'YES', 'NO', '2014-09-23 19:46:33', '2014-09-23 19:46:33'),
(27, 'default', 'logo.png', 'core', 'default', 'this module manage the default actions.', '', 'loaded', 'YES', 'YES', 'NO', '2014-09-23 19:46:33', '2014-09-23 19:46:33'),
(30, 'modules_manager', 'logo.png', 'core', 'module manager', 'this module manage module on superadmin & sites', '', 'loaded', 'NO', 'YES', 'NO', '2014-09-23 19:46:33', '2014-09-23 19:46:33'),
(35, 'site_client', 'logo.png', 'core', 'site client', 'this module manages the site client.', '', 'loaded', 'NO', 'YES', 'NO', '2014-09-23 19:46:33', '2014-09-23 19:46:33'),
(41, 'themes', 'logo.png', 'theme', 'themes', 'this module manages the themes.', '', 'loaded', 'NO', 'YES', 'NO', '2014-09-23 19:46:33', '2014-09-23 19:46:33'),
(42, 'users', 'logo.png', 'core', 'users', 'this module manages users.', '', 'loaded', 'NO', 'YES', 'NO', '2014-09-23 19:46:33', '2014-09-23 19:46:33'),
(44, 'users_guard', 'logo.png', 'core', 'user guard', 'this module manages the user group,permissions.', '', 'loaded', 'NO', 'YES', 'NO', '2014-09-23 19:46:33', '2014-09-23 19:46:33'),
(46, 'utils', 'logo.png', 'core', 'dashboard', 'this module manage utils', '', 'loaded', 'NO', 'YES', 'NO', '2014-09-23 19:46:33', '2014-09-23 19:46:33'),
(52, 'site', 'logo.png', 'superadmin', 'site', 'this module manages the site.', '', 'installed', 'YES', 'YES', 'NO', '2014-10-20 18:20:13', '2014-10-20 18:20:13'),
(83, 'site_languages', 'logo.png', 'core', 'language', 'this module manages languages.', '', 'loaded', 'NO', 'YES', 'NO', '2015-07-16 15:10:58', '2015-07-16 15:10:58'),
(84, 'site_restrictive_access', '', 'core', 'site access', 'this module manages the site access.', '', 'installed', 'NO', 'YES', 'NO', '2015-07-16 16:21:59', '2015-07-16 16:21:59'),
(141, 'system_emails', 'logo.jpg', 'emails', 'system emails', 'this module manage the system emails actions.', '', 'installed', 'YES', 'YES', 'NO', '2016-05-31 17:32:16', '2016-05-31 17:32:16'),
(207, 'license_manager', 'logo.png', 'license', 'license manager', 'this module manages the license.', '', 'loaded', 'NO', 'YES', 'NO', '2018-09-16 11:39:18', '2018-09-16 11:39:18'),
(216, 'system_texts', 'logo.jpg', 'texts', 'system Texts', 'this module manage the system Texts actions.', '', 'installed', 'YES', 'YES', 'NO', '2018-12-17 23:53:45', '2018-12-17 23:53:45'),
(217, 'site_countries', 'logo.png', 'core', 'country', 'this module manages countries.', '', 'installed', 'NO', 'NO', 'NO', '2019-02-09 13:52:58', '2019-02-09 13:52:58'),
(218, 'highcharts', 'logo.png', 'core', 'highcharts', 'this module manages highcharts.', '', 'loaded', 'NO', 'YES', 'NO', '2019-03-05 08:51:40', '2019-03-05 08:51:40'),
(220, 'server_services', 'logo.png', 'services', 'server services', 'this module manage the server services actions.', '', 'loaded', 'NO', 'NO', 'NO', '2019-03-05 08:51:40', '2019-03-05 08:51:40'),
(222, 'site_elfinder', '', 'core', 'site_elfinder', 'this module manage elfinder (file manager)', '', 'loaded', 'NO', 'YES', 'NO', '2019-03-05 08:51:40', '2019-03-05 08:51:40'),
(223, 'system', 'logo.png', 'core', 'system', 'this module manage the system.', '', 'loaded', 'NO', 'YES', 'NO', '2019-03-05 08:51:40', '2019-03-05 08:51:40'),
(224, 'system_resources', 'logo.png', 'utils', 'Ressources system', 'module Ressources system', '', 'installed', 'YES', 'YES', 'NO', '2019-03-05 08:51:40', '2019-03-05 08:51:40'),
(225, 'system_site', 'logo.png', 'site', 'System site', 'module system site', '', 'loaded', 'NO', 'NO', 'NO', '2019-03-05 08:51:40', '2019-03-05 08:51:40'),
(226, 'tests', 'logo.jpg', 'core', 'tests', 'this module manage the tests actions.', '', 'loaded', 'NO', 'YES', 'NO', '2019-03-05 08:51:40', '2019-03-05 08:51:40'),
(227, 'utils_colorpicker_light', '', 'core', 'color pickers', 'this module manage color pickers', '', 'loaded', 'NO', 'YES', 'NO', '2019-03-05 08:51:40', '2019-03-05 08:51:40'),
(228, 'utils_jpgraph', 'logo.png', 'jpgraph.', 'jpgraph.', 'this module manage the utils_jpgraph.', '', 'loaded', 'NO', 'NO', 'NO', '2019-03-05 08:51:40', '2019-03-05 08:51:40'),
(234, 'cms_pages', 'logo.png', 'cms', 'Content Management System', 'this module manages the pages content', '', 'installed', 'YES', 'YES', 'NO', '2019-03-14 22:02:04', '2019-03-14 22:02:04'),
(246, 'employees', 'logo.png', 'employees', 'employees', 'this module manage the employees.', '', 'installed', 'YES', 'YES', 'NO', '2019-11-22 11:24:28', '2019-11-22 11:24:28'),
(247, 'employers', 'logo.png', 'employers', 'employers', 'this module manage the employers.', '', 'installed', 'YES', 'YES', 'NO', '2019-11-22 11:24:28', '2019-11-22 11:24:28'),
(249, 'site_city', 'logo.png', 'site', 'site city', 'this module manages the site city.', '', 'installed', 'YES', 'YES', 'NO', '2019-12-04 22:25:46', '2019-12-04 22:25:46'),
(250, 'site_shop', 'logo.png', 'site', 'site shops', 'this module manages site shops.', '', 'installed', 'YES', 'YES', 'NO', '2019-12-05 00:11:31', '2019-12-05 00:11:31'),
(251, 'social_networks', 'logo.png', 'social', 'social networks', 'this module manages social networks links.', '', 'installed', 'YES', 'YES', 'NO', '2019-12-05 00:11:31', '2019-12-05 00:11:31'),
(252, 'customers_newsletter', 'logo.png', 'customers', 'customer newsletter', 'this module manages customer newsletters', '', 'installed', 'YES', 'YES', 'NO', '2019-12-05 08:04:44', '2019-12-05 08:04:44'),
(253, 'facebook_oauth', 'logo.png', 'customers', 'facebook oauth', 'this module manages customer facebook oauth', '', 'installed', 'YES', 'YES', 'NO', '2019-12-05 08:04:44', '2019-12-05 08:04:44'),
(254, 'utils_dropzone', 'logo.png', 'utils', 'dropzone.', 'this module manage the utils Dropzone.', '', 'installed', 'YES', 'YES', 'NO', '2019-12-05 08:04:44', '2019-12-05 08:04:44'),
(256, 'site_cookie', 'logo.png', 'site', 'cookie', 'this module manages cookies conditions.', '', 'installed', 'YES', 'YES', 'NO', '2019-12-17 15:44:19', '2019-12-17 15:44:19'),
(257, 'customers_contact', '', 'customers', 'Customers contacts', 'this module manage the customers contacts.', '', 'installed', 'YES', 'YES', 'NO', '2020-01-08 22:11:06', '2020-01-08 22:11:06'),
(258, 'customers', '', 'customers', 'Customers', 'this module manage the customers.', '', 'installed', 'YES', 'YES', 'NO', '2020-01-09 13:00:21', '2020-01-09 13:00:21'),
(259, 'google_oauth', 'logo.png', 'google', 'google_oauth', 'this module manage the google oauth actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-05-04 22:32:19', '2020-05-04 22:32:19'),
(260, 'payments', 'logo.png', 'payments', 'payments', 'this module manage payments actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-05-04 22:32:19', '2020-05-04 22:32:19'),
(261, 'payments_bankwire', 'logo.png', 'payments', 'payments bankwire', 'this module manage payments bankwire actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-05-04 22:32:19', '2020-05-04 22:32:19'),
(262, 'payments_check', 'logo.png', 'payments', 'payments check', 'this module manage payments check actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-05-04 22:32:19', '2020-05-04 22:32:19'),
(263, 'payments_paypal', 'logo.png', 'payments', 'payments paypal', 'this module manage payments paypal actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-05-04 22:32:19', '2020-05-04 22:32:19'),
(264, 'customers_messager', '', 'customers', 'Customers messager', 'this module manage the customers messager.', '', 'installed', 'YES', 'YES', 'NO', '2020-05-04 23:57:50', '2020-05-04 23:57:50'),
(265, 'site_gallery', 'logo.png', 'gallery', 'gallery', 'this module manages the gallery.', '', 'installed', 'YES', 'YES', 'NO', '2020-05-05 00:13:39', '2020-05-05 00:13:39'),
(266, 'site_currency', 'logo.png', 'site', 'site currency', 'this module manages the currency.', '', 'installed', 'YES', 'YES', 'NO', '2020-05-05 00:21:45', '2020-05-05 00:21:45'),
(267, 'cart', 'logo.png', 'sales', 'carts', 'this module manage the carts.', '', 'installed', 'YES', 'YES', 'NO', '2020-05-05 21:45:26', '2020-05-05 21:45:26'),
(269, 'sales', 'logo.png', 'sales', 'sales', 'this module manage the sales.', '', 'installed', 'YES', 'YES', 'NO', '2020-05-05 21:45:26', '2020-05-05 21:45:26'),
(270, 'sales_billing', 'logo.png', 'sales', 'billings', 'this module manage the billings.', '', 'installed', 'YES', 'YES', 'NO', '2020-05-05 21:58:41', '2020-05-05 21:58:41'),
(271, 'sales_quotation', 'logo.png', 'sales', 'quotations', 'this module manage the quotations.', '', 'installed', 'YES', 'YES', 'NO', '2020-05-05 22:03:48', '2020-05-05 22:03:48'),
(272, 'partners', 'logo.png', 'partners', 'partners', 'this module manage the partners.', '', 'loaded', 'YES', 'YES', 'NO', '2020-05-06 16:14:52', '2020-05-06 16:14:52'),
(273, 'employees_messager', '', 'employees', 'employees messager', 'this module manage the employees messager.', '', 'installed', 'YES', 'YES', 'NO', '2020-05-16 01:42:01', '2020-05-16 01:42:01'),
(274, 'employers_messager', '', 'employers', 'employers messager', 'this module manage the employers messager.', '', 'installed', 'YES', 'YES', 'NO', '2020-05-16 20:46:46', '2020-05-16 20:46:46'),
(275, 'sales_order', 'logo.png', 'sales', 'orders', 'this module manage the sales orders.', '', 'installed', 'YES', 'YES', 'NO', '2020-05-19 01:22:08', '2020-05-19 01:22:08'),
(277, 'payments_employee', 'logo.png', 'payments', 'payments employees ', 'this module manage the employees payments.', '', 'installed', 'YES', 'YES', 'NO', '2020-05-19 01:28:06', '2020-05-19 01:28:06'),
(278, 'projects', 'logo.jpg', 'projects', 'project management', 'this module manage the project management actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-06-01 23:27:36', '2020-06-01 23:27:36'),
(279, 'projects_documents', 'logo.jpg', 'projects', 'project document', 'this module manage the project document actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-06-01 23:27:36', '2020-06-01 23:27:36'),
(280, 'employees_alert', 'logo.jpg', 'employees', 'Employees alerts', 'this module manage the Employees alerts actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-06-10 19:35:45', '2020-06-10 19:35:45'),
(281, 'employees_comment', 'logo.jpg', 'employers', 'Employers comments', 'this module manage the Employers comments actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-06-10 19:35:45', '2020-06-10 19:35:45'),
(282, 'employees_filemanager', 'logo.jpg', 'employee', 'Employee filemanager', 'this module manage the employee filemanager actions.', '', 'loaded', 'NO', 'NO', 'NO', '2020-06-10 19:35:45', '2020-06-10 19:35:45'),
(283, 'employees_notation', 'logo.jpg', 'employees', 'Employees notation', 'this module manage the Employees notation actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-06-10 19:35:45', '2020-06-10 19:35:45'),
(284, 'employers_alert', 'logo.jpg', 'employers', 'Employers alerts', 'this module manage the Employers alerts actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-06-10 19:35:45', '2020-06-10 19:35:45'),
(285, 'employers_comment', 'logo.jpg', 'employers', 'Employers comments', 'this module manage the Employers comments actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-06-10 19:35:45', '2020-06-10 19:35:45'),
(286, 'employers_notation', 'logo.jpg', 'employers', 'Employers notation', 'this module manage the Employers notation actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-06-10 19:35:45', '2020-06-10 19:35:45'),
(287, 'site_comment', 'logo.jpg', 'site', 'site comments', 'this module manage the site comments actions.', '', 'installed', 'NO', 'NO', 'NO', '2020-06-10 19:35:45', '2020-06-10 19:35:45'),
(288, 'site_event', 'logo.jpg', 'site', 'site events', 'this module manage the site events actions.', '', 'installed', 'NO', 'NO', 'NO', '2020-06-10 19:35:45', '2020-06-10 19:35:45'),
(289, 'site_guestbook', 'logo.jpg', 'site', 'site guestbook', 'this module manage the site guestbook actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-06-10 19:35:45', '2020-06-10 19:35:45'),
(290, 'twitter_share', 'logo.jpg', 'twitter', 'twitter share', 'this module manage the twitter share actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-06-10 19:35:45', '2020-06-10 19:35:45'),
(291, 'facebook_share', 'logo.jpg', 'facebook', 'facebook share', 'this module manage the facebook share actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-06-10 19:41:15', '2020-06-10 19:41:15'),
(292, 'linkedin_share', 'logo.jpg', 'linkedin', 'linkedin share', 'this module manage the linkedin share actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-06-10 19:41:15', '2020-06-10 19:41:15'),
(293, 'whatsapp_share', 'logo.jpg', 'whatsapp', 'whatsapp share', 'this module manage the whatsapp share actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-06-10 20:07:30', '2020-06-10 20:07:30'),
(294, 'employers_project', 'logo.jpg', 'employers', 'Employers Projects', 'this module manage the employers projects actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-06-11 11:48:28', '2020-06-11 11:48:28'),
(295, 'employees_portfolio', 'logo.jpg', 'employees', 'Employee Portofolio', 'this module manage the employee portofolio actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-06-11 17:25:59', '2020-06-11 17:25:59'),
(296, 'employees_contact', 'logo.jpg', 'employees', 'Employees Contact', 'this module manage the employees contact actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-06-28 20:55:44', '2020-06-28 20:55:44'),
(297, 'employers_contact', 'logo.jpg', 'employers', 'Employers Contact', 'this module manage the employers contact actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-06-28 20:55:44', '2020-06-28 20:55:44'),
(298, 'payments_withdrawal', 'logo.png', 'payments', 'payments withdrawal', 'this module manage payments withdrawal actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-07-01 00:14:59', '2020-07-01 00:14:59'),
(299, 'employees_work', 'logo.png', 'employees', 'employees work', 'this module manage the employees work.', '', 'installed', 'YES', 'YES', 'NO', '2020-07-02 23:25:18', '2020-07-02 23:25:18'),
(302, 'payments_employer', 'logo.png', 'payments', 'payments employers', 'this module manage the employers payments.', '', 'installed', 'YES', 'YES', 'NO', '2020-07-06 22:46:23', '2020-07-06 22:46:23'),
(303, 'instagram_oauth', 'logo.jpg', 'instagram', 'Instagram OAuth', 'this module manage the instagram oauth actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-07-09 22:36:21', '2020-07-09 22:36:21'),
(304, 'linkedin_oauth', 'logo.jpg', 'linkedin', 'Linkedin Auth', 'this module manage the linkedin actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-07-09 22:36:21', '2020-07-09 22:36:21'),
(305, 'payments_wu', 'logo.png', 'payments', 'payments western union', 'this module manage payments western union actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-07-10 20:00:15', '2020-07-10 20:00:15'),
(306, 'emailer_spooler', 'logo.png', 'Mailer', 'Emailer spool system', 'this module manage the Emailer spool system.', '', 'installed', 'YES', 'YES', 'NO', '2020-07-17 00:36:55', '2020-07-17 00:36:55'),
(307, 'payments_stripe', 'logo.jpg', 'payment', 'stripe', 'this module manage the payment actions.', '', 'loaded', 'NO', 'NO', 'NO', '2020-07-17 00:36:55', '2020-07-17 00:36:55'),
(308, 'communication', 'logo.jpg', 'communication', 'communication', 'this module manage the communication actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-07-17 09:47:11', '2020-07-17 09:47:11'),
(309, 'services_smsbox', 'logo.png', 'services', 'sms box', 'this module manage the sms box.', '', 'installed', 'YES', 'YES', 'NO', '2020-07-17 09:47:11', '2020-07-17 09:47:11'),
(310, 'services_smsbox_callback', 'logo.png', 'services', 'sms box callback', 'this module manage the sms box callback.', '', 'installed', 'YES', 'YES', 'NO', '2020-07-17 09:47:11', '2020-07-17 09:47:11'),
(311, 'customers_blog', 'logo.jpg', 'customers', 'customers blog', 'this module manage the customers blog actions.', '', 'installed', 'NO', 'NO', 'NO', '2020-07-22 00:58:12', '2020-07-22 00:58:12'),
(312, 'customers_academy', 'logo.jpg', 'customers', 'customers academy', 'this module manage the customers academy actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-07-22 00:58:12', '2020-07-22 00:58:12'),
(313, 'customers_academy_student', 'logo.jpg', 'customers', 'customers academy student', 'this module manage the customers academy student actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-08-01 12:08:03', '2020-08-01 12:08:03'),
(314, 'customers_academy_teacher', 'logo.jpg', 'customers', 'customers academy teacher', 'this module manage the customers academy teacher actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-08-01 12:08:03', '2020-08-01 12:08:03'),
(315, 'google_maps', 'logo.png', 'utils', 'google map', 'google map', '', 'installed', 'YES', 'YES', 'NO', '2020-08-04 23:14:28', '2020-08-04 23:14:28'),
(316, 'google_analytics', 'logo.png', 'tracking', 'google analytics tracking', 'this module manages google anaytics web statistics.', '', 'installed', 'YES', 'YES', 'NO', '2020-08-27 22:29:06', '2020-08-27 22:29:06'),
(317, 'site_help', 'logo.jpg', 'site', 'site help', 'this module manage the site help actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-08-27 22:49:33', '2020-08-27 22:49:33'),
(318, 'utils_ckeditor', 'logo.png', 'utils', 'ckeditor', 'this module manage the utils ckeditor', '', 'installed', 'YES', 'YES', 'NO', '2020-08-29 18:56:31', '2020-08-29 18:56:31'),
(320, 'customers_notation', 'logo.jpg', 'admin', 'Facebook Auth', 'this module manage the system emails actions.', '', 'loaded', 'NO', 'NO', 'NO', '2020-09-08 11:44:18', '2020-09-08 11:44:18'),
(321, 'customers_academy_newsletter', 'logo.png', 'academy', 'customer academy newsletter', 'this module manages academy newsletters', '', 'installed', 'YES', 'YES', 'NO', '2020-09-08 11:45:22', '2020-09-08 11:45:22'),
(322, 'customers_registration', '', 'customers', 'Customers registration', 'this module manage the customers registrations.', '', 'installed', 'YES', 'YES', 'NO', '2020-09-15 17:43:53', '2020-09-15 17:43:53'),
(323, 'site_warning', 'logo.jpg', 'site', 'site warning', 'this module manage the site warning actions.', '', 'installed', 'YES', 'YES', 'NO', '2020-09-16 10:22:56', '2020-09-16 10:22:56'),
(324, 'system_emailer', 'logo.jpg', 'superadmin', 'Emailer system', 'module Emailer system', '', 'installed', 'NO', 'NO', 'NO', '2020-09-22 08:21:20', '2020-09-22 08:21:20'),
(325, 'utils_nodejs', 'logo.png', 'jpgraph.', 'nodejs utils', 'this module manage the utils_jpgraph.', '', 'installed', 'YES', 'YES', 'NO', '2020-10-09 11:54:38', '2020-10-09 11:54:38'),
(326, 'cron', 'cron.gif', 'superadmin', 'cron', 'this module manage cron', '', 'installed', 'NO', 'NO', 'NO', '2020-10-16 15:05:29', '2020-10-16 15:05:29');

-- --------------------------------------------------------

--
-- Structure de la table `t_modules_admin`
--

CREATE TABLE IF NOT EXISTS `t_modules_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `title` varchar(128) CHARACTER SET utf8 NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `logo` varchar(255) COLLATE utf8_bin NOT NULL,
  `type` varchar(48) COLLATE utf8_bin NOT NULL,
  `version` varchar(10) COLLATE utf8_bin NOT NULL,
  `mode` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=100 ;

--
-- Contenu de la table `t_modules_admin`
--

INSERT INTO `t_modules_admin` (`id`, `name`, `title`, `description`, `logo`, `type`, `version`, `mode`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'cart', 'carts', 'this module manage the carts.', 'logo.png', 'sales', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(2, 'cms_pages', 'Content Management System', 'this module manages the pages content', 'logo.png', 'cms', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(3, 'communication', 'communication', 'this module manage the communication actions.', 'logo.jpg', 'communication', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(4, 'cron', 'cron', 'this module manage cron', 'cron.gif', 'superadmin', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(5, 'customers', 'Customers', 'this module manage the customers.', '', 'customers', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(6, 'customers_academy', 'customers academy', 'this module manage the customers academy actions.', 'logo.jpg', 'customers', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(7, 'customers_academy_newsletter', 'customer academy newsletter', 'this module manages academy newsletters', 'logo.png', 'academy', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(8, 'customers_academy_student', 'customers academy student', 'this module manage the customers academy student actions.', 'logo.jpg', 'customers', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(9, 'customers_academy_teacher', 'customers academy teacher', 'this module manage the customers academy teacher actions.', 'logo.jpg', 'customers', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(10, 'customers_blog', 'customers blog', 'this module manage the customers blog actions.', 'logo.jpg', 'customers', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(11, 'customers_contact', 'Customers contacts', 'this module manage the customers contacts.', '', 'customers', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(12, 'customers_messager', 'Customers messager', 'this module manage the customers messager.', '', 'customers', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(13, 'customers_newsletter', 'customer newsletter', 'this module manages customer newsletters', 'logo.png', 'customers', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(14, 'customers_notation', 'Facebook Auth', 'this module manage the system emails actions.', 'logo.jpg', 'admin', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(15, 'customers_registration', 'Customers registration', 'this module manage the customers registrations.', '', 'customers', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(16, 'dashboard', 'dashboard', 'this module manage dashboard', 'logo.png', 'core', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(17, 'default', 'default', 'this module manage the default actions.', 'logo.png', 'core', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(18, 'emailer_spooler', 'Emailer spool system', 'this module manage the Emailer spool system.', 'logo.png', 'Mailer', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(19, 'employees', 'employees', 'this module manage the employees.', 'logo.png', 'employees', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(20, 'employees_alert', 'Employees alerts', 'this module manage the Employees alerts actions.', 'logo.jpg', 'employees', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(21, 'employees_comment', 'Employers comments', 'this module manage the Employers comments actions.', 'logo.jpg', 'employers', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(22, 'employees_contact', 'Employees Contact', 'this module manage the employees contact actions.', 'logo.jpg', 'employees', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(23, 'employees_filemanager', 'Employee filemanager', 'this module manage the employee filemanager actions.', 'logo.jpg', 'employee', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(24, 'employees_messager', 'employees messager', 'this module manage the employees messager.', '', 'employees', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(25, 'employees_notation', 'Employees notation', 'this module manage the Employees notation actions.', 'logo.jpg', 'employees', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(26, 'employees_portfolio', 'Employee Portofolio', 'this module manage the employee portofolio actions.', 'logo.jpg', 'employees', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(27, 'employees_work', 'employees work', 'this module manage the employees work.', 'logo.png', 'employees', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(28, 'employers', 'employers', 'this module manage the employers.', 'logo.png', 'employers', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(29, 'employers_alert', 'Employers alerts', 'this module manage the Employers alerts actions.', 'logo.jpg', 'employers', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(30, 'employers_comment', 'Employers comments', 'this module manage the Employers comments actions.', 'logo.jpg', 'employers', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(31, 'employers_contact', 'Employers Contact', 'this module manage the employers contact actions.', 'logo.jpg', 'employers', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(32, 'employers_messager', 'employers messager', 'this module manage the employers messager.', '', 'employers', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(33, 'employers_notation', 'Employers notation', 'this module manage the Employers notation actions.', 'logo.jpg', 'employers', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(34, 'employers_project', 'Employers Projects', 'this module manage the employers projects actions.', 'logo.jpg', 'employers', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(35, 'facebook_oauth', 'facebook oauth', 'this module manages facebook ouath', 'logo.png', 'facebook', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(36, 'facebook_share', 'facebook share', 'this module manage the facebook share actions.', 'logo.jpg', 'facebook', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(37, 'google_analytics', 'google analytics tracking', 'this module manages google anaytics web statistics.', 'logo.png', 'tracking', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(38, 'google_maps', 'google map', 'google map', 'logo.png', 'utils', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(39, 'google_oauth', 'google_oauth', 'this module manage the google oauth actions.', 'logo.png', 'google', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(40, 'highcharts', 'highcharts', 'this module manages highcharts.', 'logo.png', 'core', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(41, 'instagram_oauth', 'Instagram OAuth', 'this module manage the instagram oauth actions.', 'logo.jpg', 'instagram', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(42, 'license_manager', 'license manager', 'this module manages the license.', 'logo.png', 'license', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(43, 'linkedin_oauth', 'Linkedin Auth', 'this module manage the linkedin actions.', 'logo.jpg', 'linkedin', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(44, 'linkedin_share', 'linkedin share', 'this module manage the linkedin share actions.', 'logo.jpg', 'linkedin', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(45, 'modules_manager', 'module manager', 'this module manage module on superadmin & sites', 'logo.png', 'core', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(46, 'partners', 'partners', 'this module manage the partners.', 'logo.png', 'partners', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(47, 'payments', 'payments', 'this module manage payments actions.', 'logo.png', 'payments', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(48, 'payments_bankwire', 'payments bankwire', 'this module manage payments bankwire actions.', 'logo.png', 'payments', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(49, 'payments_check', 'payments check', 'this module manage payments check actions.', 'logo.png', 'payments', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(50, 'payments_employee', 'payments employees ', 'this module manage the employees payments.', 'logo.png', 'payments', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(51, 'payments_employer', 'payments employers', 'this module manage the employers payments.', 'logo.png', 'payments', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(52, 'payments_paypal', 'payments paypal', 'this module manage payments paypal actions.', 'logo.png', 'payments', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(53, 'payments_stripe', 'stripe', 'this module manage the payment actions.', 'logo.jpg', 'payment', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(54, 'payments_withdrawal', 'payments withdrawal', 'this module manage payments withdrawal actions.', 'logo.png', 'payments', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(55, 'payments_wu', 'payments western union', 'this module manage payments western union actions.', 'logo.png', 'payments', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(56, 'projects', 'project management', 'this module manage the project management actions.', 'logo.jpg', 'projects', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(57, 'projects_documents', 'project document', 'this module manage the project document actions.', 'logo.jpg', 'projects', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(58, 'sales', 'sales', 'this module manage the sales.', 'logo.png', 'sales', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(59, 'sales_billing', 'billings', 'this module manage the billings.', 'logo.png', 'sales', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(60, 'sales_order', 'orders', 'this module manage the sales orders.', 'logo.png', 'sales', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(61, 'sales_quotation', 'quotations', 'this module manage the quotations.', 'logo.png', 'sales', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(62, 'server_services', 'server services', 'this module manage the server services actions.', 'logo.png', 'services', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(63, 'services_smsbox', 'sms box', 'this module manage the sms box.', 'logo.png', 'services', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(64, 'services_smsbox_callback', 'sms box callback', 'this module manage the sms box callback.', 'logo.png', 'services', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(65, 'site', 'site', 'this module manages the site.', 'logo.png', 'core', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(66, 'site_city', 'site city', 'this module manages the site city.', 'logo.png', 'site', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(67, 'site_client', 'site client', 'this module manages the site client.', 'logo.png', 'core', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(68, 'site_comment', 'site comments', 'this module manage the site comments actions.', 'logo.jpg', 'site', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(69, 'site_company', 'site company', 'this module manage the site company.', 'logo.png', 'site', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(70, 'site_cookie', 'cookie', 'this module manages cookies conditions.', 'logo.png', 'site', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(71, 'site_countries', 'country', 'this module manages countries.', 'logo.png', 'core', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(72, 'site_currency', 'site currency', 'this module manages the currency.', 'logo.png', 'site', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(73, 'site_elfinder', 'site_elfinder', 'this module manage elfinder (file manager)', '', 'core', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(74, 'site_event', 'site events', 'this module manage the site events actions.', 'logo.jpg', 'site', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(75, 'site_gallery', 'gallery', 'this module manages the gallery.', 'logo.png', 'gallery', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(76, 'site_guestbook', 'site guestbook', 'this module manage the site guestbook actions.', 'logo.jpg', 'site', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(77, 'site_help', 'site help', 'this module manage the site help actions.', 'logo.jpg', 'site', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(78, 'site_languages', 'language', 'this module manages languages.', 'logo.png', 'core', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(79, 'site_restrictive_access', 'site access', 'this module manages the site access.', '', 'core', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(80, 'site_shop', 'site shops', 'this module manages site shops.', 'logo.png', 'site', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(81, 'site_warning', 'site warning', 'this module manage the site warning actions.', 'logo.jpg', 'site', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(82, 'social_networks', 'social networks', 'this module manages social networks links.', 'logo.png', 'social', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(83, 'system', 'system', 'this module manage the system.', 'logo.png', 'core', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(84, 'system_emailer', 'Emailer system', 'module Emailer system', 'logo.jpg', 'superadmin', '1.2', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(85, 'system_emails', 'system emails', 'this module manage the system emails actions.', 'logo.jpg', 'emails', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(86, 'system_resources', 'Ressources system', 'module Ressources system', 'logo.png', 'utils', '1.2', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(87, 'system_site', 'System site', 'module system site', 'logo.png', 'site', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(88, 'system_texts', 'system Texts', 'this module manage the system Texts actions.', 'logo.jpg', 'texts', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(89, 'tests', 'tests', 'this module manage the tests actions.', 'logo.jpg', 'core', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(90, 'themes', 'themes', 'this module manages the themes.', 'logo.png', 'theme', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(91, 'twitter_share', 'twitter share', 'this module manage the twitter share actions.', 'logo.jpg', 'twitter', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(92, 'users', 'users', 'this module manages users.', 'logo.png', 'core', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(93, 'users_guard', 'user guard', 'this module manages the user group,permissions.', 'logo.png', 'core', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(94, 'utils', 'dashboard', 'this module manage utils', 'logo.png', 'core', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(95, 'utils_ckeditor', 'ckeditor', 'this module manage the utils ckeditor', 'logo.png', 'utils', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(96, 'utils_colorpicker_light', 'color pickers', 'this module manage color pickers', '', 'core', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(97, 'utils_dropzone', 'dropzone.', 'this module manage the utils Dropzone.', 'logo.png', 'utils', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(98, 'utils_jpgraph', 'jpgraph.', 'this module manage the utils_jpgraph.', 'logo.png', 'jpgraph.', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19'),
(99, 'whatsapp_share', 'whatsapp share', 'this module manage the whatsapp share actions.', 'logo.jpg', 'whatsapp', '1.0', '', 'NO', '2020-09-17 08:18:19', '2020-09-17 08:18:19');

-- --------------------------------------------------------

--
-- Structure de la table `t_partner_activity`
--

CREATE TABLE IF NOT EXISTS `t_partner_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_partner_activity_i18n`
--

CREATE TABLE IF NOT EXISTS `t_partner_activity_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `activity_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`activity_id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_partner_work_category`
--

CREATE TABLE IF NOT EXISTS `t_partner_work_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(48) COLLATE utf8_bin NOT NULL,
  `picture` varchar(64) COLLATE utf8_bin NOT NULL,
  `icon` varchar(64) COLLATE utf8_bin NOT NULL,
  `number_of_works` int(11) unsigned NOT NULL DEFAULT '0',
  `number_of_jobs` int(11) unsigned NOT NULL DEFAULT '0',
  `lb` int(11) unsigned NOT NULL DEFAULT '0',
  `rb` int(11) unsigned NOT NULL DEFAULT '0',
  `level` int(11) unsigned NOT NULL DEFAULT '0',
  `is_active` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `state` enum('UPLOAD') COLLATE utf8_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=134 ;

--
-- Contenu de la table `t_partner_work_category`
--

INSERT INTO `t_partner_work_category` (`id`, `name`, `picture`, `icon`, `number_of_works`, `number_of_jobs`, `lb`, `rb`, `level`, `is_active`, `state`, `created_at`, `updated_at`) VALUES
(1, '', 'all_categories.jpg', '', 0, 0, 1, 250, 0, 'NO', NULL, '2020-05-06 16:19:23', '2020-08-31 10:14:09'),
(2, '', 'Graphic Design header top categories.jpg', 'logo-design256x256.png', 0, 15, 216, 249, 1, 'YES', NULL, '2020-05-21 01:38:23', '2020-08-31 09:48:17'),
(3, '', 'header cat Graphic design1.jpg', 'logo-design256x256.png', 0, 0, 247, 248, 2, 'YES', NULL, '2020-05-21 01:59:38', '2020-09-19 08:14:09'),
(4, '', 'Writing and translations header top categories.jpg', 'Writing-Translation256x256.png', 0, 3, 184, 215, 1, 'YES', NULL, '2020-05-27 13:59:01', '2020-08-26 07:14:30'),
(5, '', 'sous categories videos headers2.jpg', 'video_animation_256x256.png', 0, 3, 126, 157, 1, 'YES', NULL, '2020-05-27 13:59:17', '2020-08-31 09:47:25'),
(6, '', 'Web & Mob development header top categories.jpg', 'dev256x256.png', 0, 2, 96, 125, 1, 'YES', NULL, '2020-05-27 14:00:41', '2020-08-26 07:14:03'),
(7, '', 'Wellness and Healthy living header top categories.jpg', 'wellness256x256.png', 0, 0, 158, 183, 1, 'YES', NULL, '2020-05-27 22:01:44', '2020-08-26 07:14:17'),
(8, '', 'wellness1.jpg', 'Gastronomy wellness256x256.png', 0, 0, 181, 182, 2, 'YES', NULL, '2020-05-27 22:04:08', '2020-09-24 08:59:09'),
(9, '', 'wellness3.jpg', 'Entertain your passion wellness256x256.png', 0, 0, 179, 180, 2, 'YES', NULL, '2020-05-27 22:31:49', '2020-09-24 08:58:06'),
(10, '', 'wellness4.jpg', 'Play your hobby wellness256x256.png', 0, 0, 177, 178, 2, 'YES', NULL, '2020-05-27 22:35:31', '2020-09-24 09:00:49'),
(11, '', 'wellness 6.jpg', 'Yoga class wellness256x256.png', 0, 0, 175, 176, 2, 'YES', NULL, '2020-05-27 22:37:15', '2020-09-24 09:02:28'),
(12, '', 'wellness9.jpg', 'Life coach wellness256x256.png', 0, 0, 173, 174, 2, 'YES', NULL, '2020-05-27 22:39:16', '2020-09-24 08:59:57'),
(13, '', 'wellness12.jpg', 'Private show wellness256x256.png', 0, 0, 171, 172, 2, 'YES', NULL, '2020-05-27 22:40:17', '2020-09-24 09:01:41'),
(14, '', 'header cat Graphic design2.jpg', 'flyer design.png', 0, 0, 245, 246, 2, 'YES', NULL, '2020-06-09 00:33:44', '2020-09-19 08:11:32'),
(15, '', 'header cat Graphic design3pdf.jpg', 'book cover.png', 0, 0, 243, 244, 2, 'YES', NULL, '2020-06-09 00:36:58', '2020-09-19 08:07:07'),
(16, '', 'header cat Graphic design4.jpg', 'business card design.png', 0, 0, 241, 242, 2, 'YES', NULL, '2020-06-09 00:38:22', '2020-09-19 08:07:55'),
(17, '', 'header cat Graphic design5.jpg', 'banners ads desi.png', 0, 0, 239, 240, 2, 'YES', NULL, '2020-06-09 00:40:38', '2020-09-19 08:06:41'),
(18, '', 'header cat Graphic design6.jpg', 'invitation C.png', 0, 0, 237, 238, 2, 'YES', NULL, '2020-06-09 23:02:57', '2020-09-19 08:12:46'),
(19, '', 'Album cover design header.jpg', 'Album cover design256x256.png', 0, 0, 235, 236, 2, 'YES', NULL, '2020-06-09 23:04:00', '2020-09-24 09:03:36'),
(20, '', 'header cat Graphic design 6.jpg', 'Menu.png', 0, 0, 233, 234, 2, 'YES', NULL, '2020-06-09 23:35:50', '2020-09-19 08:15:14'),
(21, '', 'header cat Graphic design10.jpg', 'Catalog.png', 0, 0, 231, 232, 2, 'YES', NULL, '2020-06-09 23:36:39', '2020-09-19 08:10:06'),
(22, '', 'header cat Graphic design11.jpg', 'post cards.png', 0, 0, 229, 230, 2, 'YES', NULL, '2020-06-09 23:36:48', '2020-09-19 08:17:24'),
(23, '', 'header cat Graphic design12.jpg', 'poster.png', 0, 0, 227, 228, 2, 'YES', NULL, '2020-06-09 23:36:59', '2020-09-19 08:17:34'),
(24, '', 'header cat Graphic design13 (1).jpg', 'Social Media design256x256.png', 0, 0, 225, 226, 2, 'YES', NULL, '2020-06-09 23:37:09', '2020-09-24 08:56:59'),
(25, '', 'header cat Graphic design15.jpg', 'packaging.png', 0, 0, 223, 224, 2, 'YES', NULL, '2020-06-09 23:37:20', '2020-09-19 08:16:28'),
(26, '', 'header cat Graphic design16.jpg', 'Tshirt design.png', 0, 0, 221, 222, 2, 'YES', NULL, '2020-06-09 23:37:29', '2020-09-19 08:21:05'),
(27, '', 'header cat Graphic design17.jpg', 'brochure.png', 0, 0, 219, 220, 2, 'YES', NULL, '2020-06-09 23:37:37', '2020-09-19 08:07:37'),
(28, '', 'Data science header top categories.jpg', 'data-science256x256.png', 0, 0, 70, 95, 1, 'YES', NULL, '2020-06-11 23:35:12', '2020-08-26 07:13:53'),
(29, '', 'Music Productions header top categories.jpg', 'Music-Productions256x256.png', 0, 0, 34, 69, 1, 'YES', NULL, '2020-06-11 23:35:31', '2020-08-26 07:13:39'),
(30, '', 'categories headers5.jpg', 'wordpress.png', 0, 0, 123, 124, 2, 'YES', NULL, '2020-06-11 23:36:59', '2020-09-19 08:23:47'),
(31, '', 'categories headers6.jpg', 'HTML.png', 0, 0, 121, 122, 2, 'YES', NULL, '2020-06-11 23:37:08', '2020-09-19 08:12:32'),
(32, '', 'categories headers1.jpg', 'Full stuck.png', 0, 0, 119, 120, 2, 'YES', NULL, '2020-06-11 23:37:15', '2020-09-19 08:12:00'),
(33, '', 'categories headers2.jpg', 'front end.png', 0, 0, 117, 118, 2, 'YES', NULL, '2020-06-11 23:37:23', '2020-09-19 08:11:45'),
(34, '', 'categories headers3.jpg', 'back end.png', 0, 0, 115, 116, 2, 'YES', NULL, '2020-06-11 23:37:30', '2020-09-19 08:06:27'),
(35, '', 'categories headers4.jpg', '', 0, 0, 113, 114, 2, 'YES', NULL, '2020-06-11 23:37:39', '2020-08-18 09:08:21'),
(36, '', 'categories headers7.jpg', 'PhP.png', 0, 0, 111, 112, 2, 'YES', NULL, '2020-06-11 23:37:47', '2020-09-19 08:16:53'),
(37, '', 'categories headers8.jpg', 'java.png', 0, 0, 109, 110, 2, 'YES', NULL, '2020-06-11 23:37:57', '2020-09-19 08:13:22'),
(38, '', 'categories headers9.jpg', 'Python developper256x256.png', 0, 0, 107, 108, 2, 'YES', NULL, '2020-06-11 23:38:07', '2020-09-24 08:55:52'),
(39, '', 'categories headers10.jpg', 'mobile-app256x256.png', 0, 0, 105, 106, 2, 'YES', NULL, '2020-06-11 23:38:16', '2020-09-19 08:15:31'),
(40, '', 'categories headers11.jpg', 'android-dev256x256.png', 0, 0, 103, 104, 2, 'YES', NULL, '2020-06-11 23:38:24', '2020-09-19 08:04:02'),
(41, '', 'categories headers12.jpg', 'ios dev.png', 0, 0, 101, 102, 2, 'YES', NULL, '2020-06-11 23:38:37', '2020-09-19 08:13:11'),
(42, '', 'categories headers14.jpg', 'Software developer icone.png', 0, 0, 99, 100, 2, 'YES', NULL, '2020-06-11 23:38:45', '2020-09-25 12:09:13'),
(43, '', 'categories headers13.jpg', 'game dev.png', 0, 0, 97, 98, 2, 'YES', NULL, '2020-06-11 23:38:53', '2020-09-19 08:12:11'),
(44, '', 'Writing and translation hdr1.jpg', 'resume writing.png', 0, 0, 213, 214, 2, 'YES', NULL, '2020-06-11 23:39:52', '2020-09-19 08:18:36'),
(45, '', 'Writing and translation hdr2.jpg', 'Writing Content writer256x256.png', 0, 0, 211, 212, 2, 'YES', NULL, '2020-06-11 23:40:01', '2020-09-27 21:22:44'),
(46, '', 'Writing and translation hdr3.jpg', 'copywriting.png', 0, 0, 209, 210, 2, 'YES', NULL, '2020-06-11 23:40:10', '2020-09-19 08:10:34'),
(47, '', 'Writing and translation hdr4.jpg', 'Grant Writing256x256.png', 0, 0, 207, 208, 2, 'YES', NULL, '2020-06-11 23:40:20', '2020-09-27 21:33:42'),
(48, '', 'Writing and translation hdr5.jpg', 'article writing.png', 0, 0, 205, 206, 2, 'YES', NULL, '2020-06-11 23:40:28', '2020-09-19 08:05:32'),
(49, '', 'Writing and translation hdr6.jpg', 'Translation.png', 0, 0, 203, 204, 2, 'YES', NULL, '2020-06-11 23:40:36', '2020-09-19 08:20:54'),
(50, '', 'Writing and translation hdr7.jpg', 'ebook.png', 0, 0, 201, 202, 2, 'YES', NULL, '2020-06-11 23:40:46', '2020-09-19 08:11:20'),
(51, '', 'Writing and translation hdr16.jpg', 'Writing Transcription256x256.png', 0, 0, 199, 200, 2, 'YES', NULL, '2020-06-11 23:40:54', '2020-09-27 21:21:56'),
(52, '', 'Writing and translation hdr8.jpg', '', 0, 0, 197, 198, 2, 'YES', NULL, '2020-06-11 23:41:03', '2020-08-18 10:05:13'),
(53, '', 'Writing and translation hdr9.jpg', 'script writing.png', 0, 0, 195, 196, 2, 'YES', NULL, '2020-06-11 23:41:10', '2020-09-19 08:19:26'),
(54, '', 'Writing and translation hdr10.jpg', 'blog wrt.png', 0, 0, 193, 194, 2, 'YES', NULL, '2020-06-11 23:41:18', '2020-09-19 08:06:53'),
(55, '', 'Writing and translation hdr12.jpg', 'proposal.png', 0, 0, 191, 192, 2, 'YES', NULL, '2020-06-11 23:41:25', '2020-09-19 08:18:11'),
(56, '', 'Writing and translation hdr13.jpg', 'Research paper.png', 0, 0, 189, 190, 2, 'YES', NULL, '2020-06-11 23:41:35', '2020-09-19 08:18:22'),
(57, '', 'Writing and translation hdr14.jpg', 'proofreading.png', 0, 0, 187, 188, 2, 'YES', NULL, '2020-06-11 23:41:50', '2020-09-19 08:18:01'),
(58, '', 'Writing and translation hdr15.jpg', 'cover letter.png', 0, 0, 185, 186, 2, 'YES', NULL, '2020-06-11 23:41:58', '2020-09-19 08:10:49'),
(59, '', 'sous categories videos headers1.jpg', 'video editing.png', 0, 0, 155, 156, 2, 'YES', NULL, '2020-06-15 23:45:13', '2020-09-19 08:22:36'),
(60, '', 'sous categories videos headers4.jpg', 'social media intro.png', 0, 0, 153, 154, 2, 'YES', NULL, '2020-06-15 23:45:25', '2020-09-19 08:20:09'),
(61, '', 'sous categories videos headers3.jpg', 'outro video.png', 0, 0, 151, 152, 2, 'YES', NULL, '2020-06-15 23:45:38', '2020-09-19 08:16:04'),
(62, '', 'sous categories videos headers15.jpg', 'video marketing.png', 0, 0, 149, 150, 2, 'YES', NULL, '2020-06-15 23:45:47', '2020-09-19 08:23:04'),
(63, '', 'sous categories videos headers9.jpg', 'Book Trailer.png', 0, 0, 147, 148, 2, 'YES', NULL, '2020-06-15 23:46:00', '2020-09-19 08:07:19'),
(64, '', 'sous categories videos headers10.jpg', 'product_animation_video_256x256.png', 0, 0, 145, 146, 2, 'YES', NULL, '2020-06-15 23:46:08', '2020-09-23 09:33:49'),
(65, '', 'sous categories videos headers12.jpg', 'photography.png', 0, 0, 143, 144, 2, 'YES', NULL, '2020-06-15 23:46:17', '2020-09-19 08:16:42'),
(66, '', 'sous categories videos headers13.jpg', 'videography .png', 0, 0, 141, 142, 2, 'YES', NULL, '2020-06-15 23:46:25', '2020-09-19 08:23:27'),
(67, '', 'sous categories videos headers2.jpg', 'logo animation .png', 0, 0, 139, 140, 2, 'YES', NULL, '2020-06-15 23:46:38', '2020-09-19 08:13:35'),
(68, '', 'animated background video.jpg', 'Animated_background_265x256.png', 0, 0, 137, 138, 2, 'YES', NULL, '2020-06-15 23:46:47', '2020-09-24 09:04:24'),
(69, '', 'sous categories videos headers11.jpg', 'lyric video.png', 0, 0, 135, 136, 2, 'YES', NULL, '2020-06-15 23:47:02', '2020-09-19 08:14:28'),
(70, '', 'sous categories videos headers6.jpg', 'subtitles video .png', 0, 0, 133, 134, 2, 'YES', NULL, '2020-06-15 23:47:09', '2020-09-19 08:20:23'),
(71, '', 'sous categories videos headers7.jpg', 'slideshow.png', 0, 0, 131, 132, 2, 'YES', NULL, '2020-06-15 23:47:16', '2020-09-19 08:19:52'),
(72, '', 'sous categories videos headers5.jpg', 'powerpoint.png', 0, 0, 129, 130, 2, 'YES', NULL, '2020-06-15 23:47:26', '2020-09-19 08:17:47'),
(73, '', 'sous categories videos headers14.jpg', 'video explainer.png', 0, 0, 127, 128, 2, 'YES', NULL, '2020-06-15 23:47:34', '2020-09-19 08:22:52'),
(74, '', 'wellness2.jpg', 'Wellness Teach your culture256x256.png', 0, 0, 169, 170, 2, 'YES', NULL, '2020-06-17 20:54:12', '2020-09-27 21:23:33'),
(75, '', 'wellness5.jpg', 'Wellness Experience other''s experiencd256x256.png', 0, 0, 167, 168, 2, 'YES', NULL, '2020-06-17 20:58:50', '2020-09-27 21:25:14'),
(76, '', 'wellness8.jpg', 'Wellness marriage counseling256x256.png', 0, 0, 165, 166, 2, 'YES', NULL, '2020-06-17 20:59:00', '2020-09-27 21:25:01'),
(77, '', 'wellness11.jpg', 'Wellness relationship counseling256x256.png', 0, 0, 163, 164, 2, 'YES', NULL, '2020-06-17 20:59:19', '2020-09-27 21:24:31'),
(78, '', 'wellness7.jpg', 'Wellness Spiritual healing256x256.png', 0, 0, 161, 162, 2, 'YES', NULL, '2020-06-17 20:59:27', '2020-09-27 21:24:00'),
(79, '', 'wellness10.jpg', 'wellness casting spiritual bondage256x256.png', 0, 0, 159, 160, 2, 'YES', NULL, '2020-06-17 20:59:36', '2020-09-27 21:26:06'),
(80, '', 'sound hdr1.jpg', 'Sound mixing and mastering256x256.png', 0, 0, 67, 68, 2, 'YES', NULL, '2020-07-03 17:51:59', '2020-09-27 21:29:13'),
(81, '', 'sound hdr2.jpg', 'Sound Voice over256x256.png', 0, 0, 65, 66, 2, 'YES', NULL, '2020-07-03 17:52:08', '2020-09-27 21:26:43'),
(82, '', 'soundhdr3.jpg', 'Sound music producers mastering256x256.png', 0, 0, 63, 64, 2, 'YES', NULL, '2020-07-03 17:52:18', '2020-09-27 21:29:42'),
(83, '', 'sound hdr4.jpg', 'Sound singer and vocalists256x256.png', 0, 0, 61, 62, 2, 'YES', NULL, '2020-07-03 17:52:29', '2020-09-27 21:27:46'),
(84, '', 'Sound hdr5.jpg', 'Sound musician session256x256.png', 0, 0, 59, 60, 2, 'YES', NULL, '2020-07-03 17:52:38', '2020-09-27 21:28:26'),
(85, '', 'Soundhdr6.jpg', 'Sound Online music lesson256x256.png', 0, 0, 57, 58, 2, 'YES', NULL, '2020-07-03 17:52:46', '2020-09-27 21:28:14'),
(86, '', 'soundhdr7.jpg', 'Sound song writer256x256.png', 0, 0, 55, 56, 2, 'YES', NULL, '2020-07-03 17:52:54', '2020-09-27 21:27:28'),
(87, '', 'soundhdr8.jpg', 'Podcast Editing.png', 0, 0, 53, 54, 2, 'YES', NULL, '2020-07-03 17:53:20', '2020-09-19 08:17:07'),
(88, '', 'soundhdr10.jpg', 'Sound audiobook256x256.png', 0, 0, 51, 52, 2, 'YES', NULL, '2020-07-03 17:53:27', '2020-09-27 21:30:51'),
(89, '', 'Audio ad production header.jpg', 'Sound audio ad production256x256.png', 0, 0, 49, 50, 2, 'YES', NULL, '2020-07-03 17:53:35', '2020-09-27 21:34:38'),
(90, '', 'soundhdr12.jpg', 'Sound DJ Drops256x256.png', 0, 0, 47, 48, 2, 'YES', NULL, '2020-07-03 17:53:47', '2020-09-27 21:30:26'),
(91, '', 'soundhdr14.jpg', 'Sound dialogue editing256x256.png', 0, 0, 45, 46, 2, 'YES', NULL, '2020-07-03 17:53:54', '2020-09-27 21:30:37'),
(92, '', 'soundhdr15.jpg', 'transcription.png', 0, 0, 43, 44, 2, 'YES', NULL, '2020-07-03 17:54:02', '2020-09-19 08:20:42'),
(93, '', 'soundhdr16.jpg', 'Sound Vocal tuning256x256.png', 0, 0, 41, 42, 2, 'YES', NULL, '2020-07-03 17:54:10', '2020-09-27 21:26:54'),
(94, '', 'soundhdr17.jpg', 'Sound Jingle256x256.png', 0, 0, 39, 40, 2, 'YES', NULL, '2020-07-03 17:54:18', '2020-09-27 21:29:51'),
(95, '', 'soundhdr18.jpg', 'Sound intro and outro i256x256.png', 0, 0, 37, 38, 2, 'YES', NULL, '2020-07-03 17:54:30', '2020-09-27 21:29:59'),
(96, '', 'soundhdr19.jpg', 'Sound effect256x256.png', 0, 0, 35, 36, 2, 'YES', NULL, '2020-07-03 17:54:38', '2020-09-27 21:30:09'),
(97, '', 'Illustrator heaer .jpg', 'Illustrator256x256.png', 0, 0, 217, 218, 2, 'YES', NULL, '2020-07-22 22:36:54', '2020-09-24 08:53:09'),
(98, '', 'Marketing &advertisement header top categories.jpg', 'Marketing256x256.png', 0, 0, 10, 33, 1, 'YES', NULL, '2020-07-27 19:40:59', '2020-08-26 07:13:11'),
(99, '', 'marketing1.jpg', 'video marketing.png', 0, 0, 31, 32, 2, 'YES', NULL, '2020-07-27 19:41:13', '2020-09-17 21:57:58'),
(100, '', 'Marketing2.jpg', 'marketing social media.png', 0, 0, 29, 30, 2, 'YES', NULL, '2020-07-27 19:41:28', '2020-09-25 12:07:57'),
(101, '', 'marketing4.jpg', '', 0, 0, 27, 28, 2, 'YES', NULL, '2020-07-27 19:41:44', '2020-08-17 19:51:39'),
(102, '', 'marketing 4.jpg', 'marketing SEO.png', 0, 0, 25, 26, 2, 'YES', NULL, '2020-07-27 19:41:59', '2020-09-25 12:07:46'),
(103, '', 'marketing5.jpg', 'marketing e-commerce.png', 0, 0, 23, 24, 2, 'YES', NULL, '2020-07-27 19:42:10', '2020-09-25 12:07:11'),
(104, '', 'Marketing7.jpg', 'marketing book.png', 0, 0, 21, 22, 2, 'YES', NULL, '2020-07-27 19:42:28', '2020-09-25 12:06:58'),
(105, '', 'marketing6.jpg', 'marketing music.png', 0, 0, 19, 20, 2, 'YES', NULL, '2020-07-27 19:42:38', '2020-09-25 12:07:31'),
(106, '', 'marketing8.jpg', 'marketing mobile.png', 0, 0, 17, 18, 2, 'YES', NULL, '2020-07-27 19:42:49', '2020-09-25 12:07:23'),
(107, '', 'marketing9.jpg', 'marketing web traffic.png', 0, 0, 15, 16, 2, 'YES', NULL, '2020-07-27 19:42:59', '2020-09-25 12:08:44'),
(108, '', 'marketing10.jpg', 'marketing audio.png', 0, 0, 13, 14, 2, 'YES', NULL, '2020-07-27 19:43:16', '2020-09-25 12:06:46'),
(109, '', 'Data 1.jpg', 'Data icons1.png', 0, 0, 93, 94, 2, 'YES', NULL, '2020-07-27 19:44:03', '2020-09-25 12:05:05'),
(110, '', 'Data2.jpg', 'Data entry icons.png', 0, 0, 91, 92, 2, 'YES', NULL, '2020-07-27 19:44:12', '2020-09-25 12:04:39'),
(111, '', 'Data3.jpg', 'Data engineering icons.png', 0, 0, 89, 90, 2, 'YES', NULL, '2020-07-27 19:44:22', '2020-09-25 12:04:25'),
(112, '', 'Data4.jpg', '', 0, 0, 87, 88, 2, 'YES', NULL, '2020-07-27 19:44:36', '2020-08-17 20:17:45'),
(113, '', 'data5.jpg', 'Data Cybersecurity icons.png', 0, 0, 85, 86, 2, 'YES', NULL, '2020-07-27 19:44:46', '2020-09-25 12:04:11'),
(114, '', 'data6.jpg', 'Data analytics icons.png', 0, 0, 83, 84, 2, 'YES', NULL, '2020-07-27 19:44:55', '2020-09-25 12:03:58'),
(115, '', 'data7.jpg', 'Data visualisation icons.png', 0, 0, 81, 82, 2, 'YES', NULL, '2020-07-27 19:45:06', '2020-09-25 12:06:02'),
(116, '', 'data8.jpg', 'Data extraction icons.png', 0, 0, 79, 80, 2, 'YES', NULL, '2020-07-27 19:45:15', '2020-09-25 12:04:51'),
(117, '', 'Data9.jpg', 'Data processing icons.png', 0, 0, 77, 78, 2, 'YES', NULL, '2020-07-27 19:45:23', '2020-09-25 12:05:43'),
(118, '', 'data10.jpg', 'Data Knowledge representation icons.png', 0, 0, 75, 76, 2, 'YES', NULL, '2020-07-27 19:45:33', '2020-09-25 12:05:16'),
(119, '', 'data11.jpg', 'Data machine learning icons.png', 0, 0, 73, 74, 2, 'YES', NULL, '2020-07-27 19:45:43', '2020-09-25 12:05:31'),
(120, '', 'data13.jpg', '', 0, 0, 71, 72, 2, 'YES', NULL, '2020-07-27 19:45:54', '2020-08-17 20:19:22'),
(121, '', 'Virtual Assitant header.jpg', 'Virtual assistant256x256.png', 0, 0, 11, 12, 2, 'YES', NULL, '2020-07-29 21:37:29', '2020-09-24 08:54:39'),
(129, '', 'FR job3 job3 Graphex(1).png', 'melle.jpg', 0, 0, 4, 9, 1, 'NO', NULL, '2020-08-03 20:27:26', '2020-08-27 08:54:41'),
(131, '', '', 'logo2.jpg', 0, 0, 2, 3, 1, 'NO', 'UPLOAD', '2020-08-04 08:57:41', '2020-08-04 08:57:41'),
(132, '', '', '', 0, 0, 5, 8, 2, 'YES', NULL, '2020-09-24 11:08:26', '2020-09-24 11:08:28'),
(133, '', '', '', 0, 0, 6, 7, 3, 'NO', NULL, '2020-09-24 11:08:40', '2020-09-24 11:08:40');

-- --------------------------------------------------------

--
-- Structure de la table `t_partner_work_category_i18n`
--

CREATE TABLE IF NOT EXISTS `t_partner_work_category_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partner_work_category_i18n_fk0` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=127 ;

--
-- Contenu de la table `t_partner_work_category_i18n`
--

INSERT INTO `t_partner_work_category_i18n` (`id`, `category_id`, `lang`, `title`, `url`, `meta_title`, `meta_description`, `meta_keywords`, `meta_robots`, `layout`, `template`, `content`, `is_active`, `start_at`, `expired_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'en', 'Graphic Design', '/graphic-design', 'Graphic Design', 'Graphic Design', 'Graphic Design', '', 'default', 'default.tpl', '<div style="text-align:justify">Is the means of visual communication and problem-solving with the aid of typography, photography, iconography and illustration.<br />\n<br />\nGraphic designers, construct and merge symbols and or characters, text and images to produce visual representations of concepts or ideas and messages. Why should you hire a Graphic Designer for your business needs? Merely to establish a professional image for your business, and to promote its growth is the utmost reason to hire a graphicdesigner.<br />\n<br />\nDesigners express meticulously the language of color and imagery;graphic designers utilize their expertise to carefully relay messages to your focus audience and generatea brand your customers can trust. They also build graphic notions using computer software or handcrafted design to convey ideas that stimulate, inform, and attract consumers. They create the completeblueprint and production design for applications such as advertisements, brochures, magazines, and reports.If you on the market for a Graphic Designer, you are in the right place! We have thousands of experts with in-depth knowledge to satisfy your needs. Please choose one of our experts below.</div>\n', 'NO', NULL, NULL, '2020-05-21 01:38:23', '2020-10-06 20:23:01'),
(2, 3, 'en', 'Logo Design', '/graphic-design/logo-design', 'Logo Design', 'Logo Design', 'Logo Design', '', 'default', 'default.tpl', '<div style="text-align:justify"><strong>Logo design</strong> is all about establishing the picture-perfect brand mark for a Business. <strong>Logo designers</strong> are skilled graphic designers who produce exclusive, and custom brand imagery for clients, and or Businesses who seek their services; Building your brand is one the most crucial steps needed to showcase your Business, despite its size. When you opt to appoint a logo designer from Graphex, you then choose to work with the best on the Freelance Market, you will be exposed to Freelancers that are highly skilled and dedicated to your branding success.Please choose one of our experts in Logo Design below.</div>\n', 'YES', NULL, NULL, '2020-05-21 01:59:38', '2020-10-06 20:30:56'),
(3, 4, 'en', 'Writing/Translation', '/writing-translation', 'Writing/Translation', 'Writing/Translation', 'Writing/Translation', '', 'default', 'default.tpl', '', '', NULL, NULL, '2020-05-27 13:59:01', '2020-05-27 13:59:01'),
(4, 5, 'en', 'Video/ Logo Animation', '/video-logo-animation', 'Video/ Logo Animation', 'Video/ Logo Animation', '', '', 'default', 'default.tpl', '', 'YES', NULL, NULL, '2020-05-27 13:59:17', '2020-05-27 22:46:49'),
(5, 6, 'en', 'Web/Mob. Development', '/web-mobile-development', 'Web/Mob. Development', 'Web/Mob. Development', '', '', 'default', 'default.tpl', '<div style="text-align:justify">Is the action of composing essential source code to build a website, it describes as writing the HTML pages,web server managing is coded in Java, PHP, Perl and other languages;Look Into JavaScript, Java, PHP, Perl, Web authoring software and application server. Web programmers are known as web developers, or web engineers, they make applications on the web; Their work facilitates non-design aspects of web expansion, which involves encrypting and markup writing, Coding means to program the software itself, and markup refers to coordinating and configuring content. The role is responsible for creating, coding and modifying websites, from its design to functionality,encompassing a client&#39;s specifications. Strive to produce visually enticing sites that showcase user-friendly layout and clear navigation.Don&rsquo;t hesitate to contact one of our top Web programmers and start creating and or revamping the perfect website for your business.</div>\n', 'YES', NULL, NULL, '2020-05-27 14:00:41', '2020-10-06 20:33:40'),
(6, 7, 'en', 'Wellness & Healthy Living', '/wellness-and-healthy-living', 'Wellness & Healthy Living', 'Wellness & Healthy Living', '', '', 'default', 'default.tpl', '', 'YES', NULL, NULL, '2020-05-27 22:01:44', '2020-06-11 23:33:43'),
(7, 8, 'en', 'Gastronomy ', '/wellness-and-healthy-living/gastronomy ', 'Gastronomy ', 'Gastronomy ', 'Gastronomy ', '', 'default', 'default.tpl', '', 'YES', NULL, NULL, '2020-05-27 22:04:08', '2020-06-17 20:53:45'),
(8, 9, 'en', 'Entertain Your Passion', '/wellness-and-healthy-living/entertain-your-passion', 'Entertain Your Passion', 'Entertain Your Passion', 'Entertain Your Passion', '', 'default', 'default.tpl', '', '', NULL, NULL, '2020-05-27 22:31:49', '2020-06-17 20:56:50'),
(9, 10, 'en', 'Play Your Hobby', '/wellness-and-healthy-living/play-your-hobby', 'Play Your Hobby', 'Play Your Hobby', '', '', 'default', 'default.tpl', '', '', NULL, NULL, '2020-05-27 22:35:31', '2020-06-17 20:57:19'),
(10, 11, 'en', 'Yoga Class', '/wellness-and-healthy-living/yoga-class', 'Yoga Class', 'Yoga Class', 'Yoga Class', '', 'default', 'default.tpl', '', '', NULL, NULL, '2020-05-27 22:37:15', '2020-06-17 20:57:40'),
(11, 12, 'en', 'Life Coach', '/wellness-and-healthy-living/life-coach', 'Life Coach', 'Life Coach', 'Life Coach', '', 'default', 'default.tpl', '', '', NULL, NULL, '2020-05-27 22:39:16', '2020-06-17 20:58:03'),
(12, 13, 'en', 'Private Show', '/wellness-and-healthy-living/private-show', 'Private Show', 'Private Show', 'Private Show', '', 'default', 'default.tpl', '', '', NULL, NULL, '2020-05-27 22:40:17', '2020-06-17 20:58:26'),
(13, 14, 'en', 'Flyer Design', '/graphic-design/flyer Design', 'Flyer Design', 'Flyer Design', 'Flyer Design', 'Flyer Design', 'default', 'default.tpl', '<div style="text-align:justify">A flyer is a type of paper or electronic advertisement meant for widespread distribution,usually displayed or distributed in a public place, handed out to individuals or sent through the mail;it also can be allocated via emails, social media platforms and text messaging. In the past decade, flyer assortment was from inexpensive photocopied leaflets to expensive, glossy, full-color circulars., your flyer design solution is right here! Select one of our many designers&rsquo; portfolio below.</div>\n', '', NULL, NULL, '2020-06-09 00:33:44', '2020-10-06 20:25:22'),
(14, 15, 'en', 'Book Cover Design', '/graphic-design/book-cover-design', 'Book Cover Design', 'Book Cover Design', 'Book Cover Design', '', 'default', 'default.tpl', '', '', NULL, NULL, '2020-06-09 00:36:58', '2020-06-09 00:36:58'),
(15, 16, 'en', 'Business Cards', '/graphic-design/business-cards', 'Business Cards', 'Business Cards', '', '', 'default', 'default.tpl', '<div style="text-align:justify">A Business card is the basic marketing tool for an entrepreneur to establish initial client or potential client contact with his or her Business, it contains the name, contact info, and brand logo;the color, language formulation and texture of theBusinesscardis conducive to its ability to convey the company&rsquo;s image to prospective customers. When creating your Business card, ensure that your card is crafted to impress your potential clients on initial contact, you may seek theservice of a professional designer or use a do-it-yourself Businesscardsoftware, though, it is wise to hire a professional to secure a top-notch product that will make a lasting impression on clientele. Remember Your Business Card is acrucialtool of your branding and should act as a visual extension of your brand design so by simply browsing from our thousands of designers&rsquo; portfolio, you will find your solution right here!</div>\n', '', NULL, NULL, '2020-06-09 00:38:22', '2020-10-06 20:27:54'),
(16, 17, 'en', 'Banner Ads', '/graphic-design/banner-ads', 'Banner Ads', 'Banner Ads', 'Banner Ads', 'Banner Ads', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-09 00:40:38', '2020-06-09 00:40:38'),
(17, 18, 'en', 'Invitation Cards', '/graphic-design/invitation-cards', 'Invitation Cards', 'Invitation Cards', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-09 23:02:57', '2020-06-09 23:02:57'),
(18, 19, 'en', 'Album Cover Design', '/graphic-design/album-cover-design', 'Album Cover Design', 'Album Cover Design', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-09 23:04:00', '2020-06-09 23:04:00'),
(19, 20, 'en', 'Menu Design', '/graphic-design/menu-design', 'Menu Design', 'Menu Design', 'Menu Design', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-09 23:35:50', '2020-06-09 23:35:50'),
(20, 21, 'en', 'Catalog Design', '/graphic-design/catalog-design', 'Catalog Design', 'Catalog Design', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-09 23:36:39', '2020-06-09 23:36:39'),
(21, 22, 'en', 'Postcard Design', '/graphic-design/postcard-design', 'Postcard Design', 'Postcard Design', 'Postcard Design', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-09 23:36:48', '2020-06-09 23:36:48'),
(22, 23, 'en', 'Poster Design', '/graphic-design/poster-design', 'Poster Design', 'Poster Design', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-09 23:36:59', '2020-06-09 23:36:59'),
(23, 24, 'en', 'Social Media Design', '/graphic-design/social-media-design', 'Social Media Design', 'Social Media Design', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-09 23:37:09', '2020-06-09 23:37:09'),
(24, 25, 'en', 'Packaging Design', '/graphic-design/packaging-design', 'Packaging Design', 'Packaging Design', 'Packaging Design', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-09 23:37:20', '2020-06-09 23:37:20'),
(25, 26, 'en', 'T-Shirts Design', '/graphic-design/t-shirts-design', 'T-Shirts Design', 'T-Shirts Design', 'T-Shirts Design', '', 'default', 'default.tpl', '<div style="text-align:justify">A printed T-shirt or graphic T-shirt is a T-shirt displaying a design, image or lettering on it,printing is done with textile or laser printing.T-shirt designer The right t-shirt designers can blossom your apparel ideas in a path that impacts the market; Doing a freelance t-shirt design job,or project implies you are an autonomous artist who creates logos, and concepts for t-shirts. You build prototypes on design software, work on apparel and logo designs, aid with brand uniqueness, and connect with the client to understand their vision.Please Hire one of our talented T-shirt designers now.</div>\n', 'NO', NULL, NULL, '2020-06-09 23:37:29', '2020-10-06 20:32:43'),
(26, 27, 'en', 'Brochure Design', '/graphic-design/brochure-design', 'Brochure Design', 'Brochure Design', 'Brochure Design', '', 'default', 'default.tpl', '<strong>Brochures</strong> are marketing documents, created for the purpose of advertising, which can be folded into a template, pamphlet, or leaflet. They are mostly utilized to launch and or reintroduce a company, organization, or products, to bring awareness of available services and benefits to potential customers or members of the public.By simply browsing to our thousands of designers&rsquo; portfolio, you will find your solution right here.', 'NO', NULL, NULL, '2020-06-09 23:37:37', '2020-10-06 20:24:49'),
(27, 28, 'en', 'Data Science', '/data-science', 'Data Science', 'Data Science', '', '', 'default', 'default.tpl', '<div style="text-align:justify">Data science is an inter-disciplinary turf that manipulates scientific methods, processes, algorithms and systems to extricate knowledge and insights from many structural and unstructured data; Data science is associated with data mining, machine learning and big data basically used to understand and analyze actual phenomena with data. Start a partnership with one from our pool of Data Scientists Experts today for your convenience!</div>\n', 'NO', NULL, NULL, '2020-06-11 23:35:12', '2020-10-13 19:50:24'),
(28, 29, 'en', 'Music Productions', '/music-productions', 'Music Productions', 'Music Productions', 'Music Productions', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-11 23:35:31', '2020-06-11 23:35:31'),
(29, 30, 'en', 'WordPress Developer', '/web-mobile-development/wordpress-developer', 'WordPress Developer', 'WordPress Developer', 'WordPress Developer', '', 'default', 'default.tpl', 'WordPress is one of the most useful software to build websites and content management systems (CMS) in the technology world of today. According to experts, 30% of world’s websites were built using WordPress. If you are looking to start a new business, make changes to your existing site, build your portfolio or a developer who has experience with the specific technologies (e.g., plugins, frameworks, libraries) you plan to use on your website. You are at the right place. We have thousands of WordPress experts with in-depth knowledge to satisfy your needs. Choose one of our experts below.  ', 'NO', NULL, NULL, '2020-06-11 23:36:59', '2020-08-26 17:26:50'),
(30, 31, 'en', 'HTML/CSS Developer', '/web-mobile-development/html-css-developer', 'HTML/CSS Developer', 'HTML/CSS Developer', 'HTML/CSS Developer', '', 'default', 'default.tpl', 'Are web professionals whose primary responsibility is to deliver a polished and styled website to make your business attractive to the visitors. Practically every website uses CSS, for a responsive site, if you want to format your theme, landing page, and If you to format your blog or your post appropriately to the business world today. CSS is the right option for you. Choose one of our CSS/HTML Experts below. ', 'NO', NULL, NULL, '2020-06-11 23:37:08', '2020-08-26 17:30:37'),
(31, 32, 'en', 'Full stack Developer', '/web-mobile-development/full-stack-developer', 'Full stack Developer', 'Full stack Developer', '', '', 'default', 'default.tpl', 'Full Stack Developers are computer programmers who are proficient in both front and back end coding. Their primary responsibilities include designing user interactions on websites, developing servers and databases for website functionality and coding for mobile platforms. Full Stack developers Participate in the design and creation of scalable software Writing clean, functional code on the front- and back-end, they also test and fix bugs or other coding issues. Whatever you need in terms of website functionalities, design, development and delivery, Graphex technology has the solution for you. Choose one of our experts below by browsing through their portfolio. You are one click away from the solution you are looking for. Choose one of our experts below.', 'NO', NULL, NULL, '2020-06-11 23:37:15', '2020-08-26 17:27:23'),
(32, 33, 'en', 'Front End Developer', '/web-mobile-development/front-end-developer', 'Front End Developer', 'Front End Developer', '', '', 'default', 'default.tpl', 'Front-End Developers are responsible for implementing visual elements that users see and interact within a web application. Creating that user-facing functionality is the job of a front-end developer. In general, they are supported by back-end web developers, who are responsible for server-side application logic and integration of the work front-end developers do. The front-end developer creates the environment for everything that users see and touch: content, layout, and interaction. A front-end dev is comparable to interior designer of a house that''s been built by a civil engineer. Using these tools, front-end developers work closely with designers or user experience analysts to bring mockups, or wireframes, from development to delivery. Choose one of our Front-End Developers below.', 'NO', NULL, NULL, '2020-06-11 23:37:23', '2020-08-26 17:27:42'),
(33, 34, 'en', 'Back End Developer', '/web-mobile-development/back-end-developer', 'Back End Developer', 'Back End Developer', '', '', 'default', 'default.tpl', 'A back-end developer is someone who builds and maintains the technology needed to power the components which enable the user-facing side of the website to exist. The backend is almost responsible for 80% of the site. Our developers use different Technologies such as: .Net, Java, RoR, PHP, Python. Expertise in Ecommerce, AR, BI, Image Analysis to create Advanced Web Apps & Portals. Enterprise Software. Mobility & Cloud Solutions. By simply browsing to our thousands of developers, you will find your solution right here.', 'NO', NULL, NULL, '2020-06-11 23:37:30', '2020-08-26 17:27:59'),
(34, 35, 'en', 'Dot Net Developer', '/web-mobile-development/dot-net-developer', 'Dot Net Developer', 'Dot Net Developer', 'Dot Net Developer', '', 'default', 'default.tpl', 'A Dot Net developer is responsible for designing, tailoring and developing software applications according to a business'' needs. In addition to the determination and analysis of prerequisites for software, his responsibilities include support and continuous development. This will allow you to take advantage of new data technologies and improve services while still providing service at top level. We have thousands of Dot Net experts with in-depth knowledge to satisfy your needs. Choose one of our Dot Net Developers below.  ', 'NO', NULL, NULL, '2020-06-11 23:37:39', '2020-08-26 17:28:34'),
(35, 36, 'en', 'PHP Developer ', '/web-mobile-development/php-developer-', 'PHP Developer ', 'PHP Developer ', 'PHP Developer ', '', 'default', 'default.tpl', 'PHP stands for Hypertext Preprocessor PHP is known for building web development, business application, and software-based applications. It is also used for basic website functions like accepting usernames and passwords and managing guest books. It can display photo or thumbnail galleries and various other types of dynamic content. PHP is a back end language for most websites. If you want your business to stand out in the complete change in the business world today. PHP developers are very familiar with web fundamentals such as: JavaScript, HTML/CSS, also Database technologies such as MySQL, Oracle etc.… Hire one of our 10 of thousands of PHP experts. ', 'NO', NULL, NULL, '2020-06-11 23:37:47', '2020-08-26 17:27:05'),
(36, 37, 'en', 'Java Developer', '/web-mobile-development/java-developer', 'Java Developer', 'Java Developer', 'Java Developer', '', 'default', 'default.tpl', 'Java Is one of the most common computer programming languages in the world. Java Developer is responsible for the design, development, and management of Java-based applications, web content, software development and games. Out of millions java programmers in the world, Graphex chooses the best ones to serve you better. All our Java programmers have a strong knowledge of other programming languages to potentially and efficiently serve you better. Choose one of our Java Developers below.', 'NO', NULL, NULL, '2020-06-11 23:37:57', '2020-08-26 17:28:52'),
(37, 38, 'en', 'Python Developer', '/web-mobile-development/python-developer', 'Python Developer', 'Python Developer', 'Python Developer', '', 'default', 'default.tpl', 'Python is the language’s greatest feature on code readability. It’s the programming language to develop, implement, and debug a project. Python is the most important feature to develop web applications, and websites. Whether it is a small or big project, by simply contacting one of our python developers, the job is 90% done. Choose one of our talented developers below.', 'NO', NULL, NULL, '2020-06-11 23:38:07', '2020-08-26 17:29:33'),
(38, 39, 'en', 'Mobile App Developer', '/web-mobile-development/mobile-app-developer', 'Mobile App Developer', 'Mobile App Developer', 'Mobile App Developer', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-11 23:38:16', '2020-06-11 23:38:16'),
(39, 40, 'en', 'Android Developer', '/web-mobile-development/android-developer', 'Android Developer', 'Android Developer', 'Android Developer', '', 'default', 'default.tpl', 'An Android Developer is a Software Developer who specializes in designing applications for users of devices supported by the Android Operating System. It is estimated that almost 80% of developers are developing android apps. Android is the largest marketplace with millions of users. Building an app for your business is one of the smartest moves ever, because your business will be exposed to millions of customers. Apps like WhatsApp and Viber, games such as: Candy Crush Saga, Subway Surfers, and Temple Run, just to name a few, were built by Android Operating System. When it comes to mobile Apps, Graphex Developers have the solution. Choose one of our developers by going through their portfolio.', 'NO', NULL, NULL, '2020-06-11 23:38:24', '2020-08-26 17:29:45'),
(40, 41, 'en', 'iOS Developer', '/web-mobile-development/ios-developer', 'iOS Developer', 'iOS Developer', 'iOS Developer', '', 'default', 'default.tpl', 'IOS is responsible for developing applications for mobile devices powered by Apple''s iOS operating system. Ideally, a good iOS developer is proficient with one of the two programming languages for this platform: Objective-C or Swift. If your business or organization doesn’t have an iOS app, you’re missing out on a lot of clients. It is estimated that approximately more than 1.4 billion people are using apple devices. You are losing billions of dollars by not having an iOS application so more clients can reach out to you. Hire one of talented iOS developers now.', 'NO', NULL, NULL, '2020-06-11 23:38:37', '2020-08-26 17:30:07'),
(41, 42, 'en', 'Software Developer', '/web-mobile-development/software-developer', 'Software Developer', 'Software Developer', 'Software Developer', '', 'default', 'default.tpl', 'Software Developers are the creative minds behind computer programs. Some develop the applications that allow people to do specific tasks on a computer or another device. Others develop the underlying systems that run the devices or that control networks. Graphex is the right place for you, if you are looking for a software developer, they are up to date, reliable, they have great communication skills, they are experts in what they are doing. Don’t be hesitated to contact one of our software developers and start creating high-tech software for your business.', 'NO', NULL, NULL, '2020-06-11 23:38:45', '2020-08-26 17:30:22'),
(42, 43, 'en', 'Game Developer', '/web-mobile-development/game-developer', 'Game Developer', 'Game Developer', 'Game Developer', '', 'default', 'default.tpl', 'Do you have a dream idea about a game but you don’t know how to make it become a reality? Whether it’s a school game, sport games, mobile games, kid games, First-person shooter, and puzzles we have the answer for you. Our game developers are specialists in video game development. Whether it is a small or large project, we have the best experienced game developers in our team. Contact us for a quote or choose one of our game developers below.', 'NO', NULL, NULL, '2020-06-11 23:38:53', '2020-08-26 17:29:05'),
(43, 44, 'en', 'Resume Writer', '/writing-translation/resume-writer', 'Resume Writer', 'Resume Writer', 'Resume Writer', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-11 23:39:52', '2020-06-11 23:39:52'),
(44, 45, 'en', 'Content Writer', '/writing-translation/content-writer', 'Content Writer', 'Content Writer', 'Content Writer', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-11 23:40:01', '2020-06-11 23:40:01'),
(45, 46, 'en', 'Copywriter', '/writing-translation/copywriter', 'Copywriter', 'Copywriter', 'Copywriter', '', 'default', 'default.tpl', '<div style="text-align:justify">A person who composes the text in the purpose of products advertisements, or publicity material and/or educate and engage consumers. They engage consumers on websites, blog posts, product descriptions, email blasts, banner advertising, newsletters, white papers, PSAs, social media platforms, including Twitter and Instagram, and other. Choose one of our experts below for Hire!</div>\n', 'NO', NULL, NULL, '2020-06-11 23:40:10', '2020-10-06 20:38:04'),
(46, 47, 'en', 'Grant Writer', '/writing-translation/grant-writer', 'Grant Writer', 'Grant Writer', 'Grant Writer', '', 'default', 'default.tpl', '<div style="text-align:justify"><strong>Grant writing</strong> is the method of seeking for funding via written submission of a proposal for eligibility; they are usually of fered through organization such as a government department, corporation, foundation or trust.Grant writers do research, outline, and present proposals that assist Business or individuals receive grant funding;to be qualified for funding, a Business or individual must have a purpose that aligns with a grant&#39;s specifications, Grant writers typically work for nonprofit or charitable organizations.Grants are a great resource of income for nonprofits and charities, but the process of researching, writing, and pursuing it is lengthy; If you are unable to allocate time for the process.So, hire one of our Grant writers who will work seamlessly with you and your teamto get qualified and well needed funds!</div>\n', 'NO', NULL, NULL, '2020-06-11 23:40:20', '2020-10-06 20:35:32'),
(47, 48, 'en', 'Article Writer', '/writing-translation/article-writer', 'Article Writer', 'Article Writer', 'Article Writer', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-11 23:40:28', '2020-06-11 23:40:28'),
(48, 49, 'en', 'Translator', '/writing-translation/translator', 'Translator', 'Translator', 'Translator', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-11 23:40:36', '2020-06-11 23:40:36'),
(49, 50, 'en', 'eBook Writer', '/writing-translation/ebook-writer', 'eBook Writer', 'eBook Writer', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-11 23:40:46', '2020-06-11 23:40:46'),
(50, 51, 'en', 'Transcriptions', '/writing-translation/transcriptions', 'Transcriptions', 'Transcriptions', 'Transcriptions', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-11 23:40:54', '2020-06-11 23:40:54'),
(51, 52, 'en', 'Speech Writer', '/writing-translation/speech-writer', 'Speech Writer', 'Speech Writer', 'Speech Writer', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-11 23:41:03', '2020-06-11 23:41:03'),
(52, 53, 'en', 'Script Writer', '/writing-translation/script-writer', 'Script Writer', 'Script Writer', 'Script Writer', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-11 23:41:10', '2020-06-11 23:41:10'),
(53, 54, 'en', 'Blog Writer', '/writing-translation/blog-writer', 'Blog Writer', 'Blog Writer', 'Blog Writer', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-11 23:41:18', '2020-06-11 23:41:18'),
(54, 55, 'en', 'Proposal writer', '/writing-translation/proposal-writer', 'Proposal writer', 'Proposal writer', 'Proposal writer', '', 'default', 'default.tpl', '<div style="text-align:justify"><strong>A Proposal</strong> is a document that proposes a resolution to a crisis, or a frequent incur problem, or is an intervention in response to a necessity;this form also known as a topic proposal. Project proposals are documents that tell shareholders why your project ideas should be fulfilled;reading about your ideas in a well-written document should persuade share holders to support them. Proposal writers work for Businesses to produce documents intended to outline intentions and convince expected readers; yours is awaiting from our pool below!</div>\n', 'NO', NULL, NULL, '2020-06-11 23:41:25', '2020-10-06 20:36:25'),
(55, 56, 'en', 'Research Paper Writer', '/writing-translation/research-paper-writer', 'Research Paper Writer', 'Research Paper Writer', 'Research Paper Writer', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-11 23:41:35', '2020-06-11 23:41:35'),
(56, 57, 'en', 'Proofreader', '/writing-translation/proofreader', 'Proofreader', 'Proofreader', 'Proofreader', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-11 23:41:50', '2020-06-11 23:41:50'),
(57, 58, 'en', 'Cover Letter Writer', '/writing-translation/cover-letter-writer', 'Cover Letter Writer', 'Cover Letter Writer', 'Cover Letter Writer', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-11 23:41:58', '2020-06-11 23:41:58'),
(58, 59, 'en', 'Video editing', '/video-logo-animation/video-editing', 'Video editing', 'Video editing', 'Video editing', 'Video editing', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-15 23:45:13', '2020-06-15 23:45:13'),
(59, 60, 'en', 'Social Media Show Intro', '/video-logo-animation/social-media-show-intro', 'Social Media Show Intro', 'Social Media Show Intro', 'Social Media Show Intro', 'Social Media Show Intro', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-15 23:45:25', '2020-06-15 23:45:25'),
(60, 61, 'en', 'Outro for Videos', '/video-logo-animation/outro-for-videos', 'Outro for Videos', 'Outro for Videos', 'Outro for Videos', 'Outro for Videos', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-15 23:45:38', '2020-06-15 23:45:38'),
(61, 62, 'en', 'Video marketing ', '/video-logo-animation/video-marketing-', 'Video marketing ', 'Video marketing ', 'Video marketing ', 'Video marketing ', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-15 23:45:47', '2020-06-15 23:45:47'),
(62, 63, 'en', 'Book Trailer', '/video-logo-animation/book-trailer', 'Book Trailer', 'Book Trailer', 'Book Trailer', 'Book Trailer', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-15 23:46:00', '2020-06-15 23:46:00'),
(63, 64, 'en', 'Product Animation', '/video-logo-animation/product-animation', 'Product Animation', 'Product Animation', 'Product Animation', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-15 23:46:08', '2020-06-15 23:46:08'),
(64, 65, 'en', 'Photographer', '/video-logo-animation/photographer', 'Photographer', 'Photographer', 'Photographer', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-15 23:46:17', '2020-06-15 23:46:17'),
(65, 66, 'en', 'Videographer ', '/video-logo-animation/videographer-', 'Videographer ', 'Videographer ', 'Videographer ', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-15 23:46:25', '2020-06-15 23:46:25'),
(66, 67, 'en', 'Logo Animation', '/video-logo-animation/logo-animation', 'Logo Animation', 'Logo Animation', 'Logo Animation', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-15 23:46:38', '2020-06-15 23:46:38'),
(67, 68, 'en', 'Animated Background', '/video-logo-animation/animated-background', 'Animated Background', 'Animated Background', 'Animated Background', 'Animated Background', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-15 23:46:46', '2020-06-15 23:46:46'),
(68, 69, 'en', 'Song Lyric Video', '/video-logo-animation/song-lyric-video', 'Song Lyric Video', 'Song Lyric Video', 'Song Lyric Video', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-15 23:47:02', '2020-06-15 23:47:02'),
(69, 70, 'en', 'Subtitles ', '/video-logo-animation/subtitles-', 'Subtitles ', 'Subtitles ', 'Subtitles ', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-15 23:47:09', '2020-06-15 23:47:09'),
(70, 71, 'en', 'Slideshows', '/video-logo-animation/slideshows', 'Slideshows', 'Slideshows', 'Slideshows', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-15 23:47:16', '2020-06-15 23:47:16'),
(71, 72, 'en', 'PowerPoint Presentation', '/video-logo-animation/powerpoint-presentation', 'PowerPoint Presentation', 'PowerPoint Presentation', 'PowerPoint Presentation', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-15 23:47:26', '2020-06-15 23:47:26'),
(72, 73, 'en', 'Whiteboard/Video explainer', '/video-logo-animation/whiteboard-video-explainer', 'Whiteboard/Video explainer', 'Whiteboard/Video explainer', 'Whiteboard/Video explainer', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-15 23:47:34', '2020-06-15 23:47:34'),
(73, 74, 'en', 'Teach Your Culture', '/wellness-and-healthy-living/teach-your-culture', 'Teach Your Culture', 'Teach Your Culture', 'Teach Your Culture', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-17 20:54:12', '2020-06-17 20:54:12'),
(74, 75, 'en', 'Experience other’s Experience', '/wellness-and-healthy-living/experience-other-s-experience', 'Experience other’s Experience', 'Experience other’s Experience', 'Experience other’s Experience', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-17 20:58:50', '2020-06-17 20:58:50'),
(75, 76, 'en', 'Marriage counseling', '/wellness-and-healthy-living/marriage-counseling', 'Marriage counseling', 'Marriage counseling', 'Marriage counseling', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-17 20:59:00', '2020-06-17 20:59:00'),
(76, 77, 'en', 'Relationship counseling', '/wellness-and-healthy-living/relationship-counseling', 'Relationship counseling', 'Relationship counseling', 'Relationship counseling', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-17 20:59:19', '2020-06-17 20:59:19'),
(77, 78, 'en', 'Spiritual healing ', '/wellness-and-healthy-living/spiritual-healing-', 'Spiritual healing ', 'Spiritual healing ', 'Spiritual healing ', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-17 20:59:27', '2020-06-17 20:59:27'),
(78, 79, 'en', 'Casting of Spiritual Boundage', '/wellness-and-healthy-living/casting-of-spiritual-boundage', 'Casting of Spiritual Boundage', 'Casting of Spiritual Boundage', 'Casting of Spiritual Boundage', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-06-17 20:59:36', '2020-06-17 20:59:36'),
(79, 80, 'en', 'Mixing & Mastering', '/music-productions/mixing-mastering', 'Mixing & Mastering', 'Mixing & Mastering', 'Mixing & Mastering', '', 'default', 'default.tpl', '<div style="text-align:justify">Masteringis a type of audio post production, a method of formulating and transferring a sourced containing recorded audio to a data storage device (the master), the source from which all copies will be produced (via methods such as pressing, duplication or replication). Mastering entails critical listening of the engineer, yet software tools exist to simplify the process,results are purely intentionalfrom the engineer&rsquo;s perspective, the skills of the engineer, the accuracy of the speaker monitors, and the listening environment. Mastering engineers often apply equalization and dynamic range compression in order to improve sound conversion on all playback systems. Practically, a duplicate of the master recording is made also known as a safety copy in the event the master is lost, damaged or stolen.Audio mixing happens when various sounds are combined into one or more frequencies using a mixing engineer operating, a mixing console, or digital audio workstation; it entail a source&#39;s volume level, frequency content, dynamics, and panoramic position are manipulated or enhanced. Typically done for music, film, television, and live sound. This hands-on, artistic, or otherwise creative treatment is done in order to produce a finished version that is appealing to listeners.Choose one our Experts below for assistance with yourproject now!</div>\n', 'NO', NULL, NULL, '2020-07-03 17:51:59', '2020-10-13 20:07:44'),
(80, 81, 'en', 'Voice Over', '/music-productions/voice-over', 'Voice Over', 'Voice Over', 'Voice Over', '', 'default', 'default.tpl', '<div style="text-align:justify">It is a service that Businesses usually usefor phone recordings, virtual answering services, or video creation. Regardless of your current project, we have just what you are looking for, we have a pool of talented individuals / Freelancers from diverse backgrounds, languages and accents to suit your unique needs. Please select one today!</div>\n', 'NO', NULL, NULL, '2020-07-03 17:52:08', '2020-10-13 20:08:05'),
(81, 82, 'en', 'Producers & Composers', '/music-productions/producers-composers', 'Producers & Composers', 'Producers & Composers', 'Producers & Composers', '', 'default', 'default.tpl', '<div style="text-align:justify">Composers typically work directly on the making of songs or musical compositions bystructuring lyrics and tunes then adding instrumentals later as they see fit, they make pop songs and choral arrangements, symphonies and musicals. Producers, on the other hand, know the music industry from a different angle and work in the production aspect. They can be working with artists needing assistance in a recording studio or at a concert venue. They might work the music side of a film overseeing the background music of a film&#39;s edited scenes. In short Composers write music, producers make organize the sounds to be appealing to listeners. Our Experts are well versed on instruments and technical aspects of composition, and music production. Contact one in portfolios below!</div>\n', 'NO', NULL, NULL, '2020-07-03 17:52:18', '2020-10-13 20:08:28'),
(82, 83, 'en', 'Singers & Vocalists', '/music-productions/singers-vocalists', 'Singers & Vocalists', 'Singers & Vocalists', 'Singers & Vocalists', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-07-03 17:52:29', '2020-07-03 17:52:29'),
(83, 84, 'en', 'Session Musicians', '/music-productions/session-musicians', 'Session Musicians', 'Session Musicians', 'Session Musicians', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-07-03 17:52:38', '2020-07-03 17:52:38'),
(84, 85, 'en', 'Online Music Lessons', '/music-productions/online-music-lessons', 'Online Music Lessons', 'Online Music Lessons', 'Online Music Lessons', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-07-03 17:52:46', '2020-07-03 17:52:46'),
(85, 86, 'en', 'Song writers', '/music-productions/song-writers', 'Song writers', 'Song writers', 'Song writers', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-07-03 17:52:54', '2020-08-18 09:04:04'),
(86, 87, 'en', 'Podcast Editing', '/music-productions/podcast-editing', 'Podcast Editing', 'Podcast Editing', 'Podcast Editing', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-07-03 17:53:20', '2020-07-03 17:53:20'),
(87, 88, 'en', 'Audiobook Production', '/music-productions/audiobook-production', 'Audiobook Production', 'Audiobook Production', 'Audiobook Production', '', 'default', 'default.tpl', '<div style="text-align:justify">Typically used by music producers, video &amp; video game producers; it includes audio mixing, sounds editing, sound design and the add-on of effects, like ADR(Automated Dialogue Replacement or Looping), Foley mixing and Editing, Mixing is also known as (Re-recording), Music Composition and Editing. An audio production process may need some or all the above to be completed. Select one of our Experts today for your convenience!</div>\n', 'NO', NULL, NULL, '2020-07-03 17:53:27', '2020-10-13 20:08:51'),
(88, 89, 'en', 'Audio Ads Production', '/music-productions/audio-ads-production', 'Audio Ads Production', 'Audio Ads Production', 'Audio Ads Production', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-07-03 17:53:35', '2020-07-03 17:53:35'),
(89, 90, 'en', 'DJ Drops & Tags', '/music-productions/dj-drops-tags', 'DJ Drops & Tags', 'DJ Drops & Tags', 'DJ Drops & Tags', '', 'default', 'default.tpl', '<div style="text-align:justify">A DJ Drop is simply a short voice-over sample that you &quot;drop&quot; during any type of performance, in the purpose of branding yourself and your mixes, and lets your audience know who is in control of playing those good vibes! Voice Tags also known as audio drops, beat tags, vocal drops, orproducer tags are short audio clips that act as a signature on your creative media.There are top-notch rated Experts in portfolios below please dive in for your perfect project match!</div>\n', 'NO', NULL, NULL, '2020-07-03 17:53:47', '2020-10-13 20:09:11'),
(90, 91, 'en', 'Dialogue Editing', '/music-productions/dialogue-editing', 'Dialogue Editing', 'Dialogue Editing', 'Dialogue Editing', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-07-03 17:53:54', '2020-07-03 17:53:54'),
(91, 92, 'en', 'Music Transcription', '/music-productions/music-transcription', 'Music Transcription', 'Music Transcription', 'Music Transcription', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-07-03 17:54:02', '2020-07-03 17:54:02'),
(92, 93, 'en', 'Vocal Tuning', '/music-productions/vocal-tuning', 'Vocal Tuning', 'Vocal Tuning', 'Vocal Tuning', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-07-03 17:54:10', '2020-07-03 17:54:10'),
(93, 94, 'en', 'Jingles', '/music-productions/jingles', 'Jingles', 'Jingles', 'Jingles', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-07-03 17:54:18', '2020-07-03 17:54:18'),
(94, 95, 'en', 'Intros & Outros', '/music-productions/intros-outros', 'Intros & Outros', 'Intros & Outros', 'Intros & Outros', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-07-03 17:54:30', '2020-07-03 17:54:30'),
(95, 96, 'en', 'Sound Effects', '/music-productions/sound-effects', 'Sound Effects', 'Sound Effects', 'Sound Effects', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-07-03 17:54:38', '2020-07-03 17:54:38'),
(96, 97, 'en', 'Illustration', '/graphic-design/illustration', 'Illustration', 'Illustration', 'Illustration', '', 'default', 'default.tpl', '<div style="text-align:justify">Is a specialized vector-based design and drawing program,it is used as part of a greater design system, Adobe Illustrator grants the formation of everything from single design elements to entire compositions; Designers use it to make posters, symbols, logos, patterns, icon and industry standard design applications that allow the captivation of your inspired vision with shapes, colors, effects, and typography. It Workson desktop and mobile devices, to swiftly produce beautiful designs that can be applied anywhere on prints, webs, apps, videos, animations, and more. You are one click away from the solution you are looking for. Choose one of our experts below.</div>\n', 'NO', NULL, NULL, '2020-07-22 22:36:54', '2020-10-06 20:24:01'),
(97, 98, 'en', 'Marketing & Advertisement', '/marketing-advertisement', 'Marketing & Advertisement', 'Marketing & Advertisement', 'Marketing & Advertisement', '', 'default', 'default.tpl', 'Marketing & Advertisement', 'NO', NULL, NULL, '2020-07-27 19:40:59', '2020-07-27 19:40:59'),
(98, 99, 'en', 'Video Marketing', '/marketing-advertisement/video-marketing', 'Video Marketing', 'Video Marketing', 'Video Marketing', '', 'default', 'default.tpl', '<div style="text-align:justify">Is simply the use of videos to promote brand marketing, products or services; A compelling marketing campaign tends to integrate video into the mix. Customer endorsements, videos from live events, how-to-videos, explainer videos, corporate training videos, viral (entertainment) videos. Furthermore, video marketing is a gold mine for SEO; It will result in boosting your search engine ranking, click-through rates, and conversions as you reach your target audience. Please rely on our Experts Video Marketers to aid your Business in the integration of effectivebranding now!</div>\n', 'NO', NULL, NULL, '2020-07-27 19:41:13', '2020-10-13 20:03:39'),
(99, 100, 'en', 'Social Media marketing', '/marketing-advertisement/social-media-marketing', 'Social Media marketing', 'Social Media marketing', 'Social Media marketing', '', 'default', 'default.tpl', 'Social Media marketing', 'NO', NULL, NULL, '2020-07-27 19:41:28', '2020-07-27 19:41:28'),
(100, 101, 'en', 'Content Marketing', '/marketing-advertisement/content-marketing', 'Content Marketing', 'Content Marketing', 'Content Marketing', '', 'default', 'default.tpl', 'Content Marketing', 'NO', NULL, NULL, '2020-07-27 19:41:44', '2020-07-27 19:41:44'),
(101, 102, 'en', 'SEO', '/marketing-advertisement/seo', 'SEO', 'SEO', 'SEO', '', 'default', 'default.tpl', '<div style="text-align:justify">Now a days, Online Marketing is a sought after service across the globe, SEO plays an important role in Business marketing; our SEO Experts are very knowledgeable in managing SEO plans, SEO analysts, dissect your competitors, their reviews, optimize your sites, partake in forums and blogs, study relevant platforms updates and trendy tools to optimize your Business platforms. Our Freelancers on Graphex is the home away from home you are longing for.</div>\n', 'NO', NULL, NULL, '2020-07-27 19:41:59', '2020-10-13 20:04:01'),
(102, 103, 'en', 'E-Commerce Marketing', '/marketing-advertisement/e-commerce-marketing', 'E-Commerce Marketing', 'E-Commerce Marketing', 'E-Commerce Marketing', '', 'default', 'default.tpl', '<div style="text-align:justify">Ecommerce is an electronic commerce system or internet commerce, it implies the buying and selling of goods or services facilitated through an internet site, and the allocation of money and data to carry out these transactions. While e-business describes all aspects of operating an online business. Independent freelancers, small businesses, and large corporations have all benefited from ecommerce allowing them to market their goods and services at a scale that was not feasible with traditional offline retail. Global retail ecommerce sales are estimated to reach $27 trillion by close of 2020. There are several types of e-commerce transactions such as: Business to Consumer (B2C): When a business sells a good or service to an individual consumer for example You purchase a pair of glasses from an online retailer. Business to Business (B2B): Businesses market goods or services to other Businesses for instance a business sells software-as-a-service for other businesses to utilize. Consumer to Consumer (C2C):A consumer offers goods or services for sell to another consumer &ldquo;You sell your old glasses on eBay or Shopify to another consumer.Consumer to Business (C2B): Consumers that market their own products or services to a business, as if an influencer offers exposure to their online audience in exchange for a fee. Retail isthesale of a product by a business plainly to a customer without any liaison. Wholesale:The sale of products in bulk, often to a retailer that then sells them directly to consumers.Drop shipping:The sale of a product, which is manufactured and shipped to the consumer by a third-party vendor unbeknownst to the consumer.Crowdfunding:The compilation of money from consumers in advance of a product being available in order to raise the startup capital needed to bring it to market. Subscription:The automatic recurring purchase of a product or service on a regular basis until the subscriber chooses to cancel. Physical products:Any concrete good that entails inventory to be replenished and orders to be physically shipped to customers as they are being sold.Digital products: Downloadable digital goods, templates, and courses, or media that must be purchased for consumption or licensed for use.Services:A skill or set of skills provided in exchange for payment; the service provider&rsquo;s time can be purchased for a fee. Pick one our knowledgeable Experts below to support your E-commerce Business needs!</div>\n', 'NO', NULL, NULL, '2020-07-27 19:42:10', '2020-10-13 20:05:37'),
(103, 104, 'en', 'Book & E-Book Marketing', '/marketing-advertisement/book---e-book-marketing', 'Book & E-Book Marketing', 'Book & E-Book Marketing', 'Book & E-Book Marketing', '', 'default', 'default.tpl', 'Bookis the creative process of a narrow roadmap focusing on what&rsquo;s best for your book, it entails proven tactics that can range from establishing book signings with bookstores to keeping your readers engaged with blogging;eBook is a downloadable readable materialwith the intent of relaxing and or entertainmentduring the course. As it relates to marketing an eBook is an opportunity to give comprehensive insight on an area of expertise, boost a reputation and most importantly to generate new leads benefiting your business goals and your audience. Book marketing Experts are standing by, please select one today!', 'NO', NULL, NULL, '2020-07-27 19:42:28', '2020-10-13 20:04:25'),
(104, 105, 'en', 'Music Marketing', '/marketing-advertisement/music-marketing', 'Music Marketing', 'Music Marketing', 'Music Marketing', '', 'default', 'default.tpl', '<div style="text-align:justify">is essentially the intersection of music and marketing, upon a business launch of a new product, promotion of the new product is imperative, in its simplicity; music marketing is the holistic development of your band&#39;s overall package to gain new listeners and convert them into loyal fans. When incorporating strategy and sustainable as you are integrating the smaller parts of your &quot;business&quot; to generate a viable image both to fans and business partners. Pick one of our Music marketing Experts today!</div>\n', 'NO', NULL, NULL, '2020-07-27 19:42:38', '2020-10-13 20:04:59'),
(105, 106, 'en', 'Mobile Marketing', '/marketing-advertisement/mobile-marketing', 'Mobile Marketing', 'Mobile Marketing', 'Mobile Marketing', '', 'default', 'default.tpl', '<div style="text-align:justify">is an online multi-channel marketing method aimed at reaching a specific audience on their smartphones, feature phones, tablets, or any other related devices through websites, E-mail, SMS and MMS, social media, or mobile applications. Mobile marketing can deliver time and location to customers; its tailor information that supports goods, services, appointment reminders and ideas using an academic approach. Pick one our knowledgeable Experts below to enhance your Business Mobile Marketing needs!</div>\n', 'NO', NULL, NULL, '2020-07-27 19:42:49', '2020-10-13 20:06:00');
INSERT INTO `t_partner_work_category_i18n` (`id`, `category_id`, `lang`, `title`, `url`, `meta_title`, `meta_description`, `meta_keywords`, `meta_robots`, `layout`, `template`, `content`, `is_active`, `start_at`, `expired_at`, `created_at`, `updated_at`) VALUES
(106, 107, 'en', 'Web Traffic', '/marketing-advertisement/web-traffic', 'Web Traffic', 'Web Traffic', 'Web Traffic', '', 'default', 'default.tpl', '<div style="text-align:justify">Website traffic is described as consumers who visit a website, Web traffic is measured in visits, also known as &quot;sessions&quot; and is a familiar way to quantify an online business effectiveness at attracting an audience.As digital marketers evolved and grew, scrutinizing a website&#39;s performance became much more inclusive. Select from our portfolios below to hire your much-needed Digital Marketer.</div>\n', 'NO', NULL, NULL, '2020-07-27 19:42:59', '2020-10-13 20:06:22'),
(107, 108, 'en', 'Audio Marketing', '/marketing-advertisement/audio-marketing', 'Audio Marketing', 'Audio Marketing', 'Audio Marketing', '', 'default', 'default.tpl', '<div style="text-align:justify">Audio content is any type of published material or information that is utilized through listening, it includes any type of auditory entertainment, or marketing collateral such as podcasts, audiobooks and artificial intelligence (AI) voice assistant skills or actions; audio content is produced to be easily consumable on the go or while multitasking. It is typically created using three techniques: The recording of real human voices, the conversion of written text into spoken word using natural language processing (NLP).The recognition of voice commands through smart speakers or voice-oriented devices.Audio content can be usefulat communicating an organization&rsquo;s story, culture, mission, voice to potential customers and or to improve user experience (UX). The advantages for creating audio content can providea new channel of consuming information that may bring new leads or customers, it will improve competitive edge against competitors who haven&rsquo;t utilize this avenue, Aids with convenience of information, it will accrue a higher, dedicated following such as podcast listeners that tune in weekly.Develops a more amiable or relatable voice for an organization, it is a convenient way for users to engage with content and bring about higher return rates, it is typically cloud-based and free of hardware constraints. Please rely on our Experts of Audio Marketing to aid your Business in the integration of Audio Content now!</div>\n', 'NO', NULL, NULL, '2020-07-27 19:43:16', '2020-10-13 20:06:58'),
(108, 109, 'en', 'Data Mining', '/data-science/data-mining', 'Data Mining', 'Data Mining', 'Data Mining', '', 'default', 'default.tpl', '<div style="text-align:justify">Data Mining also known as Knowledge Discovery in Data (KDD)is a procedure use to effectively excerpt usable data,for segmenting the data and evaluating the probability of future events, data mining uses sophisticated mathematical algorithms. it encompasses applications in various fields such as science and research; it combines tools from statistics and artificial intelligence (such as neural networks and machine learning) with database management to scrutinize large digital collections, known as data sets. Retrieved mining demographic data can be utilized for the optimization resources and create effective strategies to various Business functions to foster better decision making. It is broadly used in business like insurance, banking, retail, science research (astronomy, medicine), and government security (detection of criminals and terrorists).Hand-picked one from our pool of Data Mining Experts today!</div>\n', 'NO', NULL, NULL, '2020-07-27 19:44:03', '2020-10-13 19:50:51'),
(109, 110, 'en', 'Data Entry', '/data-science/data-entry', 'Data Entry', 'Data Entry', 'Data Entry', '', 'default', 'default.tpl', '<div style="text-align:justify">is the act of recording or entering of data orinformation into a computer using a keyboard, scanner, disk, andor voice. Data entry Personnel areeither employees and or Freelancers thatinputs data into a computer from forms or othernon-electronic forms of data, or into an online database; they are proficient typist ranging from at least 50 to 80 words per minutes. Choose one of our proficient typists from the portfolios below!</div>\n', 'NO', NULL, NULL, '2020-07-27 19:44:12', '2020-10-13 19:51:20'),
(110, 111, 'en', 'Data Engineering', '/data-science/data-engineering', 'Data Engineering', 'Data Engineering', 'Data Engineering', '', 'default', 'default.tpl', 'Data Engineering', 'NO', NULL, NULL, '2020-07-27 19:44:22', '2020-07-27 19:44:22'),
(111, 112, 'en', 'Web analytics', '/data-science/web-analytics', 'Web analytics', 'Web analytics', 'Web analytics', '', 'default', 'default.tpl', '<div style="text-align:justify">Web analytics measures, collects, analyze and reports web data for principles of insight and optimizing web usage, it&rsquo;s a means for business to broadcast advertising campaigns, market research, and to evaluate and expand the effectiveness of a website. It aids in Web analytics delivers information about the number of visitors to a website and the number of page views. Web Analysts are trendy experts of today&rsquo;s market research we have an array listed in portfolios below for your convenience!</div>\n', 'NO', NULL, NULL, '2020-07-27 19:44:36', '2020-10-13 19:52:01'),
(112, 113, 'en', 'Cybersecurity', '/data-science/cybersecurity', 'Cybersecurity', 'Cybersecurity', 'Cybersecurity', '', 'default', 'default.tpl', '<div style="text-align:justify">Cybersecurity is a method employs to protect systems, networks, and programs from digital attacks,these cyberattacks are usually targeted at accessing, changing, or destroying sensitive information; extorting money from users, or conduct in interruption of normal business processes. Employingefficient cybersecurity methodscan be quite challenging today society; attackers are getting Craftier at everything from identity theft, to extortion attempts, to the loss of important data like family photos. Society&rsquo;s functionality depends on on critical infrastructure like power plants, hospitals, and financial service companies. Cybersecurity Experts assess, reveal exposures to threats, educate the public and Business personnel on the importance of cybersecurity, and strengthen open source tools; they literally make the Internet safer for not only your Business but everyone in society. Cybersecurity is imperative! Browse from our top-notch Experts portfolios to meet your security needs today.</div>\n', 'NO', NULL, NULL, '2020-07-27 19:44:46', '2020-10-13 19:52:29'),
(113, 114, 'en', 'Data Analytics', '/data-science/data-analytics', 'Data Analytics', 'Data Analytics', 'Data Analytics', '', 'default', 'default.tpl', 'Aid in problem solving based on statistical techniques used to understand big data with descriptive, diagnostic, prescriptive, and predictive analytics. It alsodives into data mining processes assessing system informatics for data modeling, monitoring, pattern recognition, and control.\nA Data Engineer RoleThe data science field is amazingly broad, embracing everything from cleaning data to installinganalytical models; they change data into useful format for analysis, they are usually complemented by a team of other scientists and analysts. Reach out to one of Data Engineer by browsing through the respective portfolios below!\n', 'NO', NULL, NULL, '2020-07-27 19:44:55', '2020-10-13 19:51:40'),
(114, 115, 'en', 'Data Visualization', '/data-science/data-visualization', 'Data Visualization', 'Data Visualization', 'Data Visualization', '', 'default', 'default.tpl', '<div style="text-align:justify">To effectively and efficiently communicate information, data visualization make use of statistical graphics, plots, information graphics and other tools. Numerical data may be encoded using dots, lines, or bars, to visually communicate a quantitative message. This process facilitates users analytic and reasoning about data and evidence which enables theaccess of complex data, its understanding and usability. Users may have particular analytical tasks, such as making comparisons or understanding causality, and the design principle of the graphic (i.e., showing comparisons or showing causality) follows the task. Tables are generally used where users will look up a specific measurement, while charts of various types are used to show patterns or relationships in the data for one or more variables.Heightened amounts of data created by Internet activity and an enlarging number of devices in the environment are referred to as &quot;big data&quot; or Internet of things.Select one of our Business-friendly Data Experts today to aggressively support the load traffic to your site!</div>\n', 'NO', NULL, NULL, '2020-07-27 19:45:06', '2020-10-13 19:53:13'),
(115, 116, 'en', 'Data Extraction', '/data-science/data-extraction', 'Data Extraction', 'Data Extraction', 'Data Extraction', '', 'default', 'default.tpl', '<div style="text-align:justify">Data extraction is the retrieval of data out of usually unstructured or poorly structured data sources for further data managing or data storing i.e. data migration; The import into the intermediate extracting system is typically followed by data conversion, and the addition of metadata prior to transferring to an additionalphase in the data workflow. This term is applied when (experimental) data is primarilyintroduced into a computer from primary sources, such as measuring or recording devices. Today&#39;s electronic devices will usually present an electrical connector (e.g. USB) through which &#39;raw data&#39; can be streamed into a personal computer. Choose one our Experts below for assistance with your project now!</div>\n', 'NO', NULL, NULL, '2020-07-27 19:45:15', '2020-10-13 19:52:51'),
(116, 117, 'en', 'Data Processing', '/data-science/data-processing', 'Data Processing', 'Data Processing', 'Data Processing', '', 'default', 'default.tpl', '<div style="text-align:justify">Data Processing takes place once raw data is obtained and converted into usable and readable formats like graphs, and documents which can be understood by computers to be utilized, Business that are deprived of data processing limits their access to data that can improve their competitive edge and profitability. Data Processing which lies in cloud technology is the future! Our pool of Data Processors is readily available for your service, choose one today!</div>\n', 'NO', NULL, NULL, '2020-07-27 19:45:23', '2020-10-13 19:53:42'),
(117, 118, 'en', 'Knowledge Representation', '/data-science/knowledge-representation', 'Knowledge Representation', 'Knowledge Representation', 'Knowledge Representation', '', 'default', 'default.tpl', '<div style="text-align:justify">Knowledge representation and reasoning is the field of artificial intelligence (AI) committed to feed and lay out information about the world in a form that can be utilized by a computer system to conduct complexi.e. diagnosing a medical condition or having a conversation in a natural language. Knowledge representation encompasses findings from logic and psychological human problem-solving habits to computerize various kinds of reasoning, like application of rules or the relations of sets and subsets.Please rely on our Experts of (AI) to aid your Business in the integration of (AI) now!</div>\n', 'NO', NULL, NULL, '2020-07-27 19:45:33', '2020-10-13 19:54:05'),
(118, 119, 'en', 'Machine Learning', '/data-science/machine-learning', 'Machine Learning', 'Machine Learning', 'Machine Learning', '', 'default', 'default.tpl', '<div style="text-align:justify">is a sub-category of (AI) centered on computer algorithms that mechanically improve through experience, it&rsquo;s a mathematical model based on sample data, known as &quot;training data&quot;, to engage in the predictions or decisions without being explicitly programmed to do so; used in email filtering and computer vision, where it is difficult or infeasible to develop conventional algorithms to perform the needed tasks.Please rely on our Experts of (AI) to aid your Business in the integration of (AI) now!</div>\n', 'NO', NULL, NULL, '2020-07-27 19:45:43', '2020-10-13 19:54:32'),
(119, 120, 'en', 'Experimentation & Testing', '/data-science/experimentation---testing', 'Experimentation & Testing', 'Experimentation & Testing', 'Experimentation & Testing', '', 'default', 'default.tpl', '<div style="text-align:justify">Also named (T&amp;E) is the comparison of components versus conditions and specifications via testing, its results are appraised to measure the progression of design performance, supportability, etc. Developmental test and Evaluation or (DT&amp;E) is used to diminish risks throughout acquisition cycle. Operational test and Evaluation known as (OT&amp;E) simulates employment by certain users of a system under realistic operational conditions. Overall, its mechanical assurance of quality of a product, system, or capability. Pick one our knowledgeable Experts below to support your Business needs!</div>\n', 'NO', NULL, NULL, '2020-07-27 19:45:54', '2020-10-13 19:54:55'),
(120, 121, 'en', 'Virtual Assist', '/marketing-advertisement/virtual-assist', 'Virtual Assist', 'Virtual Assist', 'Virtual Assist', '', 'default', 'default.tpl', 'Virtual Assist', 'NO', NULL, NULL, '2020-07-29 21:37:29', '2020-07-29 21:37:29'),
(123, 129, 'en', 'test', '/test', '', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-08-03 20:27:26', '2020-08-03 20:27:26'),
(124, 1, 'en', 'root', '', 'root', ' ', 'root', 'root', 'default', 'default.tpl', 'root', 'NO', NULL, NULL, '2020-08-31 10:14:34', '2020-10-10 06:48:56'),
(125, 132, 'en', 'test1', '/test/test1', '', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-09-24 11:08:26', '2020-09-24 11:08:26'),
(126, 133, 'en', 'test11', '/test//test/test1/test11', '', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-09-24 11:08:40', '2020-09-24 11:08:40');

-- --------------------------------------------------------

--
-- Structure de la table `t_partner_work_category_menu`
--

CREATE TABLE IF NOT EXISTS `t_partner_work_category_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `lb` int(11) unsigned NOT NULL DEFAULT '0',
  `rb` int(11) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `icon` varchar(30) COLLATE utf8_bin NOT NULL,
  `picture` varchar(30) COLLATE utf8_bin NOT NULL,
  `awe` varchar(10) COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `category_id` int(11) unsigned DEFAULT NULL,
  `state` enum('UPLOAD','ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=42 ;

--
-- Contenu de la table `t_partner_work_category_menu`
--

INSERT INTO `t_partner_work_category_menu` (`id`, `name`, `lb`, `rb`, `level`, `icon`, `picture`, `awe`, `is_active`, `category_id`, `state`, `created_at`, `updated_at`) VALUES
(8, '', 1, 68, 0, '', '', '', 'NO', NULL, 'ACTIVE', '2020-07-22 00:13:04', '2020-07-22 00:13:04'),
(9, 'top', 46, 67, 1, '', '', '', 'YES', 0, 'ACTIVE', '2020-07-22 00:14:36', '2020-07-22 00:14:38'),
(10, 'top_category', 28, 45, 1, '', '', '', 'YES', 0, 'ACTIVE', '2020-07-22 00:14:54', '2020-07-27 19:22:19'),
(11, '', 65, 66, 2, '', '', '', 'YES', 14, 'ACTIVE', '2020-07-22 00:15:12', '2020-07-22 00:15:14'),
(12, '', 63, 64, 2, '', '', '', 'YES', 3, 'ACTIVE', '2020-07-22 00:15:28', '2020-07-22 00:15:45'),
(13, '', 59, 60, 2, '', '', '', 'YES', 6, 'ACTIVE', '2020-07-22 00:15:43', '2020-07-22 00:15:45'),
(14, '', 57, 58, 2, '', '', '', 'YES', 6, 'ACTIVE', '2020-07-22 00:16:02', '2020-07-22 00:16:04'),
(15, '', 55, 56, 2, '', '', '', 'YES', 30, 'ACTIVE', '2020-07-22 00:16:17', '2020-07-22 00:16:34'),
(16, '', 53, 54, 2, '', '', '', 'YES', 4, 'ACTIVE', '2020-07-22 00:16:32', '2020-07-22 00:16:34'),
(17, '', 61, 62, 2, '', '', '', 'YES', 97, 'ACTIVE', '2020-07-22 22:37:29', '2020-07-22 22:37:31'),
(18, 'test', 20, 27, 1, '', '', '', 'YES', 0, 'ACTIVE', '2020-07-23 00:35:44', '2020-07-23 00:35:55'),
(19, '', 23, 24, 2, '', '', '', 'YES', 0, 'ACTIVE', '2020-07-23 00:36:09', '2020-07-23 00:36:18'),
(20, '', 25, 26, 2, '', '', '', 'YES', 0, 'ACTIVE', '2020-07-23 00:36:15', '2020-07-23 00:36:17'),
(21, '', 21, 22, 2, '', '', '', 'YES', 0, 'ACTIVE', '2020-07-23 00:36:42', '2020-07-23 00:36:52'),
(22, '', 51, 52, 2, '', '', '', 'YES', 121, 'ACTIVE', '2020-07-27 19:34:32', '2020-07-29 21:38:08'),
(23, '', 49, 50, 2, '', '', '', 'YES', 102, 'ACTIVE', '2020-07-27 19:35:18', '2020-07-27 19:47:27'),
(24, '', 43, 44, 2, '', '', '', 'YES', 6, 'ACTIVE', '2020-07-27 19:37:02', '2020-07-27 19:37:04'),
(25, '', 39, 40, 2, '', '', '', 'YES', 5, 'ACTIVE', '2020-07-27 22:22:36', '2020-07-27 22:22:49'),
(26, '', 41, 42, 2, '', '', '', 'YES', 2, 'ACTIVE', '2020-07-27 22:23:04', '2020-09-29 07:22:00'),
(27, '', 37, 38, 2, '', '', '', 'YES', 29, 'ACTIVE', '2020-07-27 22:23:25', '2020-07-27 22:23:27'),
(28, '', 35, 36, 2, '', '', '', 'YES', 4, 'ACTIVE', '2020-07-27 22:23:50', '2020-07-27 22:24:19'),
(29, '', 33, 34, 2, '', '', '', 'YES', 98, 'ACTIVE', '2020-07-27 22:24:15', '2020-07-27 22:24:19'),
(30, '', 31, 32, 2, '', '', '', 'YES', 28, 'ACTIVE', '2020-07-27 22:24:34', '2020-07-27 22:24:40'),
(31, '', 29, 30, 2, '', '', '', 'YES', 7, 'ACTIVE', '2020-07-27 22:24:55', '2020-07-27 22:24:57'),
(32, 'skills', 2, 19, 1, '', '', '', 'NO', 0, 'ACTIVE', '2020-07-28 17:40:09', '2020-07-28 18:01:20'),
(33, '', 17, 18, 2, '', '', '', 'YES', 2, 'ACTIVE', '2020-07-28 17:40:40', '2020-07-28 17:43:22'),
(34, '', 15, 16, 2, '', '', '', 'YES', 27, 'ACTIVE', '2020-07-28 17:41:59', '2020-07-28 17:43:21'),
(35, '', 13, 14, 2, '', '', '', 'YES', 14, 'ACTIVE', '2020-07-28 17:42:23', '2020-07-28 17:43:21'),
(36, '', 11, 12, 2, '', '', '', 'YES', 16, 'ACTIVE', '2020-07-28 17:42:55', '2020-07-28 17:43:20'),
(37, '', 9, 10, 2, '', '', '', 'YES', 97, 'ACTIVE', '2020-07-28 17:43:17', '2020-07-28 17:43:19'),
(38, '', 7, 8, 2, '', '', '', 'YES', 3, 'ACTIVE', '2020-07-28 17:50:06', '2020-07-28 17:53:04'),
(39, '', 5, 6, 2, '', '', '', 'YES', 26, 'ACTIVE', '2020-07-28 17:50:50', '2020-07-28 17:53:05'),
(40, '', 3, 4, 2, '', '', '', 'YES', 46, 'ACTIVE', '2020-07-28 17:51:52', '2020-07-28 17:53:06'),
(41, '', 47, 48, 2, '', '', '', 'YES', 103, 'ACTIVE', '2020-07-29 22:54:56', '2020-07-29 22:54:58');

-- --------------------------------------------------------

--
-- Structure de la table `t_partner_work_category_menu_i18n`
--

CREATE TABLE IF NOT EXISTS `t_partner_work_category_menu_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `menu_id` int(11) unsigned NOT NULL DEFAULT '0',
  `icon` varchar(30) COLLATE utf8_bin NOT NULL,
  `picture` varchar(30) COLLATE utf8_bin NOT NULL,
  `target` enum('_blank','top','parent','') COLLATE utf8_bin NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `state` enum('UPLOAD','ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partner_work_category_menu_fk0` (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=40 ;

--
-- Contenu de la table `t_partner_work_category_menu_i18n`
--

INSERT INTO `t_partner_work_category_menu_i18n` (`id`, `lang`, `menu_id`, `icon`, `picture`, `target`, `title`, `state`, `created_at`, `updated_at`) VALUES
(7, 'en', 9, '', '', '', '', 'ACTIVE', '2020-07-22 00:14:36', '2020-07-22 00:14:36'),
(8, 'en', 10, '', '', '', '', 'ACTIVE', '2020-07-22 00:14:53', '2020-07-22 00:14:53'),
(9, 'en', 11, '', '', '', 'Flyers', 'ACTIVE', '2020-07-22 00:15:12', '2020-07-22 00:15:12'),
(10, 'en', 12, '', '', '', 'Logo', 'ACTIVE', '2020-07-22 00:15:28', '2020-07-22 00:15:28'),
(11, 'en', 13, '', '', '', 'Web dev', 'ACTIVE', '2020-07-22 00:15:43', '2020-07-22 00:15:43'),
(12, 'en', 14, '', '', '', 'Mob dev', 'ACTIVE', '2020-07-22 00:16:02', '2020-07-22 00:16:02'),
(13, 'en', 15, '', '', '', 'WordPress', 'ACTIVE', '2020-07-22 00:16:17', '2020-07-22 00:16:17'),
(14, 'en', 16, '', '', '', 'Translation', 'ACTIVE', '2020-07-22 00:16:32', '2020-07-22 00:16:32'),
(15, 'en', 17, '', '', '', 'Illustration', 'ACTIVE', '2020-07-22 22:37:29', '2020-07-22 22:37:29'),
(16, 'en', 18, '', '', '', 'test', 'ACTIVE', '2020-07-23 00:35:44', '2020-07-23 00:35:44'),
(17, 'en', 19, '', '', '', 'test1', 'ACTIVE', '2020-07-23 00:36:09', '2020-07-23 00:36:09'),
(18, 'en', 20, '', '', '', 'test2', 'ACTIVE', '2020-07-23 00:36:15', '2020-07-23 00:36:15'),
(19, 'en', 21, '', '', '', 'test3', 'ACTIVE', '2020-07-23 00:36:42', '2020-07-23 00:36:42'),
(20, 'en', 22, '', '', '', 'Virtual Assist', 'ACTIVE', '2020-07-27 19:34:32', '2020-07-29 21:38:08'),
(21, 'en', 23, '', '', '', 'SEO', 'ACTIVE', '2020-07-27 19:35:18', '2020-07-27 19:35:18'),
(22, 'en', 24, '', '', '', 'Web/Mob. Development', 'ACTIVE', '2020-07-27 19:37:02', '2020-07-27 19:37:16'),
(23, 'en', 25, '', '', '', 'Video/ Logo Animation', 'ACTIVE', '2020-07-27 22:22:36', '2020-10-13 22:26:38'),
(24, 'en', 26, '', '', '', 'Graphic design', 'ACTIVE', '2020-07-27 22:23:04', '2020-09-29 07:22:00'),
(25, 'en', 27, '', '', '', 'Music Productions', 'ACTIVE', '2020-07-27 22:23:25', '2020-10-13 22:26:30'),
(26, 'en', 28, '', '', '', 'Writing/Translation', 'ACTIVE', '2020-07-27 22:23:50', '2020-07-27 22:23:50'),
(27, 'en', 29, '', '', '', 'Marketing & Advertisement', 'ACTIVE', '2020-07-27 22:24:15', '2020-10-13 22:26:22'),
(28, 'en', 30, '', '', '', 'Data Science ', 'ACTIVE', '2020-07-27 22:24:34', '2020-07-27 22:24:34'),
(29, 'en', 31, '', '', '', 'Wellness & Healthy Living', 'ACTIVE', '2020-07-27 22:24:55', '2020-10-13 22:26:12'),
(30, 'en', 32, '', '', '', 'BestSeller Skills', 'ACTIVE', '2020-07-28 17:40:09', '2020-07-28 17:40:09'),
(31, 'en', 33, '', '', '', 'Graphic Design', 'ACTIVE', '2020-07-28 17:40:40', '2020-07-28 17:40:40'),
(32, 'en', 34, '', '', '', 'Brochure Design', 'ACTIVE', '2020-07-28 17:41:59', '2020-07-28 17:41:59'),
(33, 'en', 35, '', '', '', 'Flyer Design', 'ACTIVE', '2020-07-28 17:42:23', '2020-07-28 17:42:23'),
(34, 'en', 36, '', '', '', 'Business Card Design', 'ACTIVE', '2020-07-28 17:42:55', '2020-07-28 17:42:55'),
(35, 'en', 37, '', '', '', 'Illustration', 'ACTIVE', '2020-07-28 17:43:17', '2020-07-28 17:43:17'),
(36, 'en', 38, '', '', '', 'Logo Design', 'ACTIVE', '2020-07-28 17:50:06', '2020-07-28 17:50:06'),
(37, 'en', 39, '', '', '', 'T-Shirt Design', 'ACTIVE', '2020-07-28 17:50:50', '2020-07-28 17:50:50'),
(38, 'en', 40, '', '', '', 'Copywriter', 'ACTIVE', '2020-07-28 17:51:52', '2020-07-28 17:51:52'),
(39, 'en', 41, '', '', '', 'E-Commerce Marketing', 'ACTIVE', '2020-07-29 22:54:56', '2020-07-29 22:54:56');

-- --------------------------------------------------------

--
-- Structure de la table `t_payments_model_text`
--

CREATE TABLE IF NOT EXISTS `t_payments_model_text` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `module` varchar(255) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_payment_country`
--

CREATE TABLE IF NOT EXISTS `t_payment_country` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) unsigned NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_payment_currency`
--

CREATE TABLE IF NOT EXISTS `t_payment_currency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) unsigned NOT NULL,
  `currency` varchar(3) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_payment_employee_method`
--

CREATE TABLE IF NOT EXISTS `t_payment_employee_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method_id` int(11) unsigned NOT NULL,
  `position` int(8) NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_employee_method_fk0` (`method_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=26 ;

--
-- Contenu de la table `t_payment_employee_method`
--

INSERT INTO `t_payment_employee_method` (`id`, `method_id`, `position`, `is_active`, `created_at`, `updated_at`) VALUES
(22, 1, 1, 'NO', '2020-07-08 23:43:53', '2020-10-17 16:49:37'),
(23, 2, 2, 'YES', '2020-07-08 23:43:53', '2020-07-08 23:43:53'),
(24, 3, 3, 'YES', '2020-07-10 20:33:46', '2020-07-16 00:38:35'),
(25, 5, 4, 'YES', '2020-07-10 20:33:46', '2020-09-02 20:24:12');

-- --------------------------------------------------------

--
-- Structure de la table `t_payment_employee_user`
--

CREATE TABLE IF NOT EXISTS `t_payment_employee_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employee_user_id` int(11) unsigned NOT NULL,
  `method_id` int(11) unsigned DEFAULT NULL,
  `currency_id` int(11) unsigned DEFAULT NULL,
  `commission_rate_id` int(11) unsigned DEFAULT NULL,
  `commission_with_tax` decimal(10,3) NOT NULL DEFAULT '0.000',
  `commission_without_tax` decimal(10,3) NOT NULL DEFAULT '0.000',
  `payment_price_without_tax` decimal(10,3) DEFAULT '0.000',
  `global_price_with_tax` decimal(10,3) NOT NULL DEFAULT '0.000',
  `global_price_without_tax` decimal(10,3) NOT NULL DEFAULT '0.000',
  `has_commission` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `currency` varchar(3) COLLATE utf8_bin NOT NULL,
  `total_price_with_tax` decimal(10,3) DEFAULT '0.000',
  `payment_price_with_tax` decimal(10,3) DEFAULT '0.000',
  `general_price_without_tax` decimal(10,3) DEFAULT '0.000',
  `general_price_with_tax` decimal(10,3) DEFAULT '0.000',
  `order_total_price_with_tax` decimal(10,3) DEFAULT '0.000',
  `ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `reference` varchar(24) COLLATE utf8_bin NOT NULL,
  `number_of_requests` int(11) unsigned NOT NULL DEFAULT '0',
  `authorization` varchar(128) COLLATE utf8_bin NOT NULL,
  `transaction_time` varchar(40) COLLATE utf8_bin NOT NULL,
  `transaction_reference` varchar(40) COLLATE utf8_bin NOT NULL,
  `transaction_fee` decimal(10,3) NOT NULL,
  `transaction_fee_currency` varchar(3) COLLATE utf8_bin NOT NULL,
  `options` varchar(128) COLLATE utf8_bin NOT NULL,
  `state` enum('INPROGRESS','TODO','PAID','REFUSED','CANCELLED','INPROGRESS') COLLATE utf8_bin NOT NULL DEFAULT 'INPROGRESS',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_employee_user_fk0` (`method_id`),
  KEY `payment_employee_user_fk1` (`employee_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=36 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_payment_employee_user_settings`
--

CREATE TABLE IF NOT EXISTS `t_payment_employee_user_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `method_id` int(11) unsigned DEFAULT NULL,
  `parameters` varchar(128) COLLATE utf8_bin NOT NULL,
  `options` varchar(128) COLLATE utf8_bin NOT NULL,
  `is_default` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Contenu de la table `t_payment_employee_user_settings`
--

INSERT INTO `t_payment_employee_user_settings` (`id`, `employee_user_id`, `method_id`, `parameters`, `options`, `is_default`, `created_at`, `updated_at`) VALUES
(3, 17, 1, '', '{"email":"paypal-p.dev@ewebsolutions.fr"}', 'YES', '2020-07-14 16:33:15', '2020-10-05 07:13:49'),
(4, 17, 2, '', '{"iban":"MA022450000012002774771753"}', 'NO', '2020-07-14 16:33:15', '2020-10-05 07:13:49');

-- --------------------------------------------------------

--
-- Structure de la table `t_payment_employer_method`
--

CREATE TABLE IF NOT EXISTS `t_payment_employer_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method_id` int(11) unsigned NOT NULL,
  `position` int(8) NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_employer_method_fk0` (`method_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=44 ;

--
-- Contenu de la table `t_payment_employer_method`
--

INSERT INTO `t_payment_employer_method` (`id`, `method_id`, `position`, `is_active`, `created_at`, `updated_at`) VALUES
(39, 1, 1, 'NO', '2020-07-10 20:26:59', '2020-10-17 16:49:48'),
(40, 2, 2, 'YES', '2020-07-10 20:26:59', '2020-07-10 20:27:02'),
(41, 3, 3, 'YES', '2020-07-10 20:26:59', '2020-07-10 20:27:03'),
(42, 4, 4, 'YES', '2020-07-10 20:27:07', '2020-07-10 20:27:09'),
(43, 5, 5, 'YES', '2020-07-10 20:28:05', '2020-09-02 20:24:09');

-- --------------------------------------------------------

--
-- Structure de la table `t_payment_employer_user`
--

CREATE TABLE IF NOT EXISTS `t_payment_employer_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employer_user_id` int(11) unsigned NOT NULL,
  `method_id` int(11) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL,
  `currency_id` int(11) unsigned NOT NULL,
  `currency` varchar(3) COLLATE utf8_bin NOT NULL,
  `total_price_with_tax` decimal(10,3) DEFAULT '0.000',
  `payment_price_with_tax` decimal(10,3) DEFAULT '0.000',
  `order_total_price_with_tax` decimal(10,3) DEFAULT '0.000',
  `ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `reference` varchar(24) COLLATE utf8_bin NOT NULL,
  `authorization` varchar(128) COLLATE utf8_bin NOT NULL,
  `transaction_time` varchar(40) COLLATE utf8_bin NOT NULL,
  `transaction_reference` varchar(40) COLLATE utf8_bin NOT NULL,
  `transaction_fee` decimal(10,3) NOT NULL,
  `transaction_fee_currency` varchar(3) COLLATE utf8_bin NOT NULL,
  `payer` varchar(32) COLLATE utf8_bin NOT NULL,
  `state` enum('TOVALID','ACCEPTED','REFUSED','CANCELLED','INPROGRESS') COLLATE utf8_bin NOT NULL DEFAULT 'INPROGRESS',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_employer_user_fk0` (`method_id`),
  KEY `payment_employer_user_fk1` (`employer_user_id`),
  KEY `payment_employer_user_fk2` (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=43 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_payment_method`
--

CREATE TABLE IF NOT EXISTS `t_payment_method` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(48) COLLATE utf8_bin NOT NULL,
  `module` varchar(24) COLLATE utf8_bin NOT NULL,
  `position` smallint(6) NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Contenu de la table `t_payment_method`
--

INSERT INTO `t_payment_method` (`id`, `name`, `module`, `position`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'paypal', 'payments_paypal', 1, 'NO', '2020-05-07 20:08:57', '2020-10-17 16:50:00'),
(2, 'bankwire', 'payments_bankwire', 2, 'YES', '2020-05-07 20:09:19', '2020-06-24 21:41:49'),
(3, 'check', 'payments_check', 3, 'YES', '2020-05-07 20:09:36', '2020-06-24 21:46:06'),
(4, 'withdrawal', 'payments_withdrawal', 4, 'YES', '2020-07-01 00:15:06', '2020-07-01 00:15:28'),
(5, 'wu', 'payments_wu', 5, 'YES', '2020-07-10 20:00:21', '2020-07-10 20:16:23');

-- --------------------------------------------------------

--
-- Structure de la table `t_payment_method_settings`
--

CREATE TABLE IF NOT EXISTS `t_payment_method_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `method_id` int(11) unsigned NOT NULL,
  `amount_maximum` decimal(10,3) NOT NULL DEFAULT '0.000',
  `amount_minimum` decimal(10,3) NOT NULL DEFAULT '0.000',
  `adder` decimal(10,3) NOT NULL DEFAULT '0.000',
  `adder_rate` decimal(5,3) NOT NULL DEFAULT '0.000',
  `tax_rate` decimal(5,3) NOT NULL DEFAULT '0.000',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_method_settings_fk0` (`method_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=36 ;

--
-- Contenu de la table `t_payment_method_settings`
--

INSERT INTO `t_payment_method_settings` (`id`, `method_id`, `amount_maximum`, `amount_minimum`, `adder`, `adder_rate`, `tax_rate`, `created_at`, `updated_at`) VALUES
(31, 1, 0.000, 0.000, 1.000, 0.030, 0.200, '2020-06-30 22:38:58', '2020-10-05 09:47:01'),
(32, 2, 0.000, 0.000, 1.000, 0.030, 0.200, '2020-06-30 22:38:58', '2020-10-05 09:47:01'),
(33, 3, 0.000, 0.000, 1.000, 0.030, 0.200, '2020-06-30 22:38:58', '2020-10-05 09:47:01'),
(34, 4, 0.000, 0.000, 1.000, 0.030, 0.200, '2020-07-10 20:12:20', '2020-10-05 09:47:01'),
(35, 5, 0.000, 0.000, 1.000, 0.030, 0.200, '2020-07-10 20:12:20', '2020-09-08 17:20:18');

-- --------------------------------------------------------

--
-- Structure de la table `t_payment_model_text`
--

CREATE TABLE IF NOT EXISTS `t_payment_model_text` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `module` varchar(255) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_payment_model_text_i18n`
--

CREATE TABLE IF NOT EXISTS `t_payment_model_text_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int(11) unsigned NOT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_bin NOT NULL,
  `text` text COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`lang`,`model_id`),
  KEY `payment_model_text_fk0` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_payment_paypal_settings`
--

CREATE TABLE IF NOT EXISTS `t_payment_paypal_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mode` varchar(24) COLLATE utf8_bin NOT NULL DEFAULT '',
  `client` varchar(255) COLLATE utf8_bin NOT NULL,
  `secret` varchar(128) COLLATE utf8_bin NOT NULL,
  `payer` varchar(40) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=14 ;

--
-- Contenu de la table `t_payment_paypal_settings`
--

INSERT INTO `t_payment_paypal_settings` (`id`, `mode`, `client`, `secret`, `payer`, `created_at`, `updated_at`) VALUES
(13, 'test', 'AQeSDKfIJjpQhwIGYxOcQJU2qcG0n_IKuO0O0eNX_udQFZ76wr1SgXqNKzTk4ANogls_GeCLCING96qi', 'EM0nkefMEKRpHfwBUG5M5uv6MywUtlak4HaE8_sbNS6OXkcSQIfmauj9Aj7geWnuP0JJcsmGIp8CSDry', 'SSZDVUZNYP32G', '2020-10-05 09:47:01', '2020-10-05 09:47:01');

-- --------------------------------------------------------

--
-- Structure de la table `t_payment_transaction`
--

CREATE TABLE IF NOT EXISTS `t_payment_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL,
  `response` text COLLATE utf8_bin NOT NULL,
  `ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `transaction` varchar(40) COLLATE utf8_bin NOT NULL,
  `acceptance` varchar(40) COLLATE utf8_bin NOT NULL,
  `status` varchar(24) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_permissions`
--

CREATE TABLE IF NOT EXISTS `t_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `application` enum('admin','frontend','superadmin') COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=26 ;

--
-- Contenu de la table `t_permissions`
--

INSERT INTO `t_permissions` (`id`, `name`, `group_id`, `created_at`, `updated_at`, `application`) VALUES
(1, 'superadmin', 0, '2014-07-27 13:14:10', '0000-00-00 00:00:00', 'superadmin'),
(2, 'superadmin_write', 0, '2014-07-27 13:14:10', '0000-00-00 00:00:00', 'superadmin'),
(3, 'superadmin_system', 0, '2014-07-27 13:14:10', '0000-00-00 00:00:00', 'superadmin'),
(4, 'superadmin_specific', 0, '2014-07-27 13:14:10', '0000-00-00 00:00:00', 'superadmin'),
(5, 'admin_write', 0, '2014-07-27 13:14:10', '0000-00-00 00:00:00', 'superadmin'),
(6, 'admin_read', 0, '2014-07-27 13:14:10', '0000-00-00 00:00:00', 'superadmin'),
(7, 'admin_specific', 0, '2014-07-27 13:14:10', '0000-00-00 00:00:00', 'superadmin'),
(8, 'superadmin_specific2', 0, '2014-07-27 13:14:10', '0000-00-00 00:00:00', 'superadmin'),
(9, 'admin', 4, '2014-07-27 13:14:10', '2014-10-30 08:41:03', 'admin'),
(19, 'frontend_system', 0, '2014-07-27 13:14:10', '0000-00-00 00:00:00', 'frontend'),
(20, 'frontend_specific', 0, '2014-07-27 13:14:10', '0000-00-00 00:00:00', 'frontend'),
(23, 'frontend_specific', 0, '2014-07-27 13:14:10', '0000-00-00 00:00:00', 'frontend'),
(24, 'frontend_specific2', 0, '2014-07-27 13:14:10', '0000-00-00 00:00:00', 'frontend'),
(25, 'superadmin', 0, '2019-04-24 20:56:58', '2019-04-24 20:56:58', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `t_permissions_i18n`
--

CREATE TABLE IF NOT EXISTS `t_permissions_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `title` varchar(100) COLLATE utf8_bin NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_i18n` (`permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Contenu de la table `t_permissions_i18n`
--

INSERT INTO `t_permissions_i18n` (`id`, `lang`, `title`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 'fr', 'Administration2', 9, '2015-08-11 11:55:12', '2015-08-11 15:49:55'),
(2, 'fr', 'superadministrateur', 25, '2019-04-24 20:56:58', '2019-04-24 20:56:58');

-- --------------------------------------------------------

--
-- Structure de la table `t_permission_group`
--

CREATE TABLE IF NOT EXISTS `t_permission_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Contenu de la table `t_permission_group`
--

INSERT INTO `t_permission_group` (`id`, `name`) VALUES
(4, 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `t_permission_group_i18n`
--

CREATE TABLE IF NOT EXISTS `t_permission_group_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned NOT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `value` varchar(100) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_group_0` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Contenu de la table `t_permission_group_i18n`
--

INSERT INTO `t_permission_group_i18n` (`id`, `group_id`, `lang`, `value`, `created_at`, `updated_at`) VALUES
(4, 4, 'fr', 'Administrateur', '2014-10-30 08:39:45', '2014-10-30 08:39:45');

-- --------------------------------------------------------

--
-- Structure de la table `t_product_category_i18n`
--

CREATE TABLE IF NOT EXISTS `t_product_category_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_project`
--

CREATE TABLE IF NOT EXISTS `t_project` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(24) NOT NULL,
  `name` varchar(256) NOT NULL,
  `abr` varchar(5) NOT NULL,
  `color` varchar(16) NOT NULL,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `number_of_tasks` int(11) unsigned NOT NULL,
  `number_of_payments` int(11) unsigned NOT NULL,
  `estimated_duration` int(11) unsigned NOT NULL,
  `duration` int(11) unsigned NOT NULL,
  `logo` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `parameters` varchar(256) NOT NULL,
  `is_active` enum('NO','YES') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `quotation_id` int(11) unsigned DEFAULT NULL,
  `project_id` int(11) unsigned DEFAULT NULL,
  `order_id` int(11) unsigned DEFAULT NULL,
  `work_id` int(11) unsigned DEFAULT NULL,
  `has_employee_notation` enum('NO','YES') NOT NULL DEFAULT 'NO',
  `has_employer_notation` enum('NO','YES') NOT NULL DEFAULT 'NO',
  `state_id` int(11) unsigned DEFAULT NULL,
  `status` enum('ACTIVE','DELETE','CLOSE') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_fk0` (`employee_user_id`),
  KEY `project_fk1` (`employer_user_id`),
  KEY `project_fk2` (`quotation_id`),
  KEY `project_fk3` (`project_id`),
  KEY `project_fk4` (`order_id`),
  KEY `project_fk5` (`work_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_project_task`
--

CREATE TABLE IF NOT EXISTS `t_project_task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(11) unsigned NOT NULL,
  `employee_user_id` int(11) unsigned NOT NULL,
  `employer_user_id` int(11) unsigned NOT NULL,
  `name` varchar(256) NOT NULL,
  `reference` varchar(16) NOT NULL,
  `requested_by` varchar(64) NOT NULL,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `requested_at` datetime DEFAULT NULL,
  `total_duration` int(11) unsigned NOT NULL,
  `estimated_duration` int(11) unsigned NOT NULL,
  `description` text NOT NULL,
  `priority` int(11) unsigned DEFAULT NULL,
  `color` varchar(10) NOT NULL,
  `is_active` enum('NO','YES') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `state_id` int(11) unsigned DEFAULT NULL,
  `status` enum('ACTIVE','DELETE') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `project_task_fk0` (`project_id`),
  KEY `project_task_fk1` (`employee_user_id`),
  KEY `project_task_fk2` (`employer_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_project_task_state`
--

CREATE TABLE IF NOT EXISTS `t_project_task_state` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `color` varchar(16) NOT NULL,
  `icon` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_project_task_state_i18n`
--

CREATE TABLE IF NOT EXISTS `t_project_task_state_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `state_id` int(11) unsigned NOT NULL,
  `lang` varchar(2) NOT NULL,
  `value` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`state_id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_sales_quotation_state`
--

CREATE TABLE IF NOT EXISTS `t_sales_quotation_state` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_sale_billing`
--

CREATE TABLE IF NOT EXISTS `t_sale_billing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `month` int(11) unsigned NOT NULL,
  `day` int(11) unsigned NOT NULL,
  `year` int(11) unsigned NOT NULL,
  `dated_at` datetime DEFAULT NULL,
  `reference` varchar(10) COLLATE utf8_bin NOT NULL,
  `payment_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `company_id` int(11) unsigned DEFAULT NULL,
  `guest_id` int(11) unsigned DEFAULT NULL,
  `order_id` int(11) unsigned DEFAULT NULL,
  `method_id` int(11) unsigned DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `culture` varchar(5) COLLATE utf8_bin NOT NULL,
  `culture_preferred` varchar(5) COLLATE utf8_bin NOT NULL,
  `ip` varchar(16) COLLATE utf8_bin NOT NULL,
  `currency_id` int(11) unsigned NOT NULL,
  `message` text COLLATE utf8_bin NOT NULL,
  `secure` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `number_of_quotations` int(11) unsigned NOT NULL DEFAULT '0',
  `total_sale_price_with_tax` decimal(10,3) NOT NULL,
  `total_sale_price_without_tax` decimal(10,3) NOT NULL,
  `commission_without_tax` decimal(10,3) NOT NULL,
  `commission_rate_id` int(11) unsigned DEFAULT NULL,
  `commission_with_tax` decimal(10,3) NOT NULL,
  `global_sale_price_without_tax` decimal(10,3) NOT NULL,
  `global_sale_price_with_tax` decimal(10,3) NOT NULL,
  `payment_sale_price_with_tax` decimal(10,3) NOT NULL,
  `payment_sale_price_without_tax` decimal(10,3) NOT NULL,
  `general_sale_price_with_tax` decimal(10,3) NOT NULL,
  `general_sale_price_without_tax` decimal(10,3) NOT NULL,
  `tax_amount` decimal(10,3) NOT NULL,
  `taxes` varchar(128) COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `state` enum('DONE','DELETED') COLLATE utf8_bin NOT NULL DEFAULT 'DONE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_billing_fk0` (`currency_id`),
  KEY `sale_billing_fk1` (`employer_user_id`),
  KEY `sale_billing_fk2` (`company_id`),
  KEY `sale_billing_fk3` (`order_id`),
  KEY `sale_billing_fk4` (`method_id`),
  KEY `sale_billing_fk5` (`payment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_sale_billing_quotation`
--

CREATE TABLE IF NOT EXISTS `t_sale_billing_quotation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `signature` varchar(64) COLLATE utf8_bin NOT NULL,
  `billing_id` int(11) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL,
  `order_quotation_id` int(11) unsigned NOT NULL,
  `quotation_id` int(11) unsigned NOT NULL,
  `project_id` int(11) unsigned DEFAULT NULL,
  `tax_id` int(11) unsigned DEFAULT NULL,
  `in_at` date DEFAULT NULL,
  `out_at` date DEFAULT NULL,
  `number_of_hours` int(11) unsigned NOT NULL DEFAULT '0',
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `comments` varchar(512) COLLATE utf8_bin DEFAULT '',
  `sale_price_with_tax` decimal(10,3) NOT NULL,
  `sale_price_without_tax` decimal(10,3) NOT NULL,
  `total_sale_price_with_tax` decimal(10,3) NOT NULL,
  `total_sale_price_without_tax` decimal(10,3) NOT NULL,
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_billing_quotation_fk0` (`quotation_id`),
  KEY `sale_billing_quotation_fk1` (`billing_id`),
  KEY `sale_billing_quotation_fk2` (`order_id`),
  KEY `sale_billing_quotation_fk3` (`project_id`),
  KEY `sale_billing_quotation_fk4` (`order_quotation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_sale_billing_state`
--

CREATE TABLE IF NOT EXISTS `t_sale_billing_state` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_sale_billing_state_i18n`
--

CREATE TABLE IF NOT EXISTS `t_sale_billing_state_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `state_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`state_id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_sale_employee_commission`
--

CREATE TABLE IF NOT EXISTS `t_sale_employee_commission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(48) COLLATE utf8_bin NOT NULL,
  `start_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `number_of_rates` int(11) unsigned NOT NULL DEFAULT '0',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_sale_employee_commission`
--

INSERT INTO `t_sale_employee_commission` (`id`, `name`, `start_at`, `expired_at`, `number_of_rates`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'general', NULL, NULL, 3, 'NO', '2020-07-09 17:49:41', '2020-10-05 09:43:41');

-- --------------------------------------------------------

--
-- Structure de la table `t_sale_employee_commission_rate`
--

CREATE TABLE IF NOT EXISTS `t_sale_employee_commission_rate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `commission_id` int(11) unsigned NOT NULL,
  `from` decimal(10,2) NOT NULL,
  `to` decimal(10,2) NOT NULL,
  `fix` decimal(10,2) NOT NULL,
  `rate` decimal(3,2) NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `start_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `sale_employee_commission_rate_fk0` (`commission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=14 ;

--
-- Contenu de la table `t_sale_employee_commission_rate`
--

INSERT INTO `t_sale_employee_commission_rate` (`id`, `commission_id`, `from`, `to`, `fix`, `rate`, `is_active`, `start_at`, `expired_at`, `created_at`, `updated_at`) VALUES
(11, 1, 0.00, 500.00, 0.00, 0.20, 'NO', NULL, NULL, '2020-10-05 09:45:16', '2020-10-05 09:45:16'),
(12, 1, 500.01, 10000.00, 0.00, 0.10, 'NO', NULL, NULL, '2020-10-05 09:45:16', '2020-10-05 09:45:16'),
(13, 1, 10000.01, 1000000.00, 0.00, 0.05, 'NO', NULL, NULL, '2020-10-05 09:45:16', '2020-10-05 09:45:16');

-- --------------------------------------------------------

--
-- Structure de la table `t_sale_employee_quotation`
--

CREATE TABLE IF NOT EXISTS `t_sale_employee_quotation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employee_advert_id` int(11) unsigned DEFAULT NULL,
  `employer_advert_id` int(11) unsigned DEFAULT NULL,
  `request_id` int(11) DEFAULT NULL,
  `project_id` int(11) unsigned DEFAULT NULL,
  `reference` varchar(48) COLLATE utf8_bin DEFAULT '',
  `employee_advert_lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `employer_advert_lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `price` decimal(8,3) NOT NULL DEFAULT '0.000',
  `in_at` date DEFAULT NULL,
  `out_at` date DEFAULT NULL,
  `number_of_hours` int(11) unsigned NOT NULL DEFAULT '0',
  `schedule_needed` enum('N','Y') COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin,
  `sender` enum('EMPLOYEE','EMPLOYER') COLLATE utf8_bin DEFAULT NULL,
  `has_history` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N',
  `version` int(8) unsigned DEFAULT '0',
  `employee_state` enum('PROPOSED','REFUSED','NEGOCIATED','ACCEPTED') COLLATE utf8_bin DEFAULT NULL,
  `employee_stated_at` timestamp NULL DEFAULT NULL,
  `employer_state` enum('REFUSED','NEGOCIATED','ACCEPTED') COLLATE utf8_bin DEFAULT NULL,
  `employer_stated_at` timestamp NULL DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `state` enum('REFUSED','ACCEPTED','INCART','PAID') COLLATE utf8_bin DEFAULT NULL,
  `state_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_employee_quotation_fk0` (`employee_user_id`),
  KEY `sale_employee_quotation_fk1` (`employer_user_id`),
  KEY `sale_employee_quotation_fk2` (`employer_advert_id`),
  KEY `sale_employee_quotation_fk3` (`state_id`),
  KEY `sale_employee_quotation_fk4` (`project_id`),
  KEY `sale_employee_quotation_fk5` (`employee_advert_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=58 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_sale_employee_quotation_history`
--

CREATE TABLE IF NOT EXISTS `t_sale_employee_quotation_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) unsigned DEFAULT NULL,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `price` decimal(8,3) NOT NULL DEFAULT '0.000',
  `in_at` date DEFAULT NULL,
  `out_at` date DEFAULT NULL,
  `number_of_hours` int(11) unsigned NOT NULL DEFAULT '0',
  `schedule_needed` enum('N','Y') COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin,
  `sender` enum('EMPLOYEE','EMPLOYER') COLLATE utf8_bin DEFAULT NULL,
  `version` int(8) unsigned DEFAULT '0',
  `employee_state` enum('PROPOSED','REFUSED','NEGOCIATED','ACCEPTED') COLLATE utf8_bin DEFAULT NULL,
  `employee_stated_at` timestamp NULL DEFAULT NULL,
  `employer_state` enum('REFUSED','NEGOCIATED','ACCEPTED') COLLATE utf8_bin DEFAULT NULL,
  `employer_stated_at` timestamp NULL DEFAULT NULL,
  `state` enum('REFUSED','ACCEPTED') COLLATE utf8_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_employee_quotation_history_fk0` (`employee_user_id`),
  KEY `sale_employee_quotation_history_fk1` (`employer_user_id`),
  KEY `sale_employee_quotation_history_fk2` (`quotation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_sale_employer_commission`
--

CREATE TABLE IF NOT EXISTS `t_sale_employer_commission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(48) COLLATE utf8_bin NOT NULL,
  `start_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `number_of_rates` int(11) unsigned NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Contenu de la table `t_sale_employer_commission`
--

INSERT INTO `t_sale_employer_commission` (`id`, `name`, `start_at`, `expired_at`, `number_of_rates`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 'general', NULL, NULL, 2, 'NO', '2020-05-05 23:48:49', '2020-07-01 21:42:07');

-- --------------------------------------------------------

--
-- Structure de la table `t_sale_employer_commission_rate`
--

CREATE TABLE IF NOT EXISTS `t_sale_employer_commission_rate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `commission_id` int(11) unsigned NOT NULL,
  `from` decimal(10,2) NOT NULL,
  `to` decimal(10,2) NOT NULL,
  `fix` decimal(10,2) NOT NULL,
  `rate` decimal(3,2) NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `start_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_commission_rate_fk0` (`commission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=20 ;

--
-- Contenu de la table `t_sale_employer_commission_rate`
--

INSERT INTO `t_sale_employer_commission_rate` (`id`, `commission_id`, `from`, `to`, `fix`, `rate`, `is_active`, `start_at`, `expired_at`, `created_at`, `updated_at`) VALUES
(18, 2, 0.00, 4000.00, 10.00, 0.10, 'NO', NULL, NULL, '2020-06-30 14:24:46', '2020-06-30 14:24:46'),
(19, 2, 4000.00, 10000.00, 8.00, 0.08, 'NO', NULL, NULL, '2020-06-30 14:24:46', '2020-06-30 14:24:46');

-- --------------------------------------------------------

--
-- Structure de la table `t_sale_employer_quotation_commission`
--

CREATE TABLE IF NOT EXISTS `t_sale_employer_quotation_commission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `company_id` int(11) unsigned DEFAULT NULL,
  `tax_id` int(11) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `price` decimal(8,3) NOT NULL DEFAULT '0.000',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_employer_quotation_commissiony_fk0` (`employer_user_id`),
  KEY `sale_employer_quotation_commissiony_fk1` (`quotation_id`),
  KEY `sale_employer_quotation_commissiony_fk2` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_sale_order`
--

CREATE TABLE IF NOT EXISTS `t_sale_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `month` int(11) unsigned NOT NULL,
  `day` int(11) unsigned NOT NULL,
  `year` int(11) unsigned NOT NULL,
  `dated_at` datetime DEFAULT NULL,
  `reference` varchar(24) COLLATE utf8_bin NOT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `company_id` int(11) unsigned DEFAULT NULL,
  `guest_id` int(11) unsigned DEFAULT NULL,
  `cart_id` int(11) unsigned DEFAULT NULL,
  `method_id` int(11) unsigned DEFAULT NULL,
  `payment_id` int(11) unsigned DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `culture` varchar(5) COLLATE utf8_bin NOT NULL,
  `culture_preferred` varchar(5) COLLATE utf8_bin NOT NULL,
  `ip` varchar(16) COLLATE utf8_bin NOT NULL,
  `currency_id` int(11) unsigned NOT NULL,
  `message` text COLLATE utf8_bin NOT NULL,
  `secure` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `number_of_quotations` int(11) unsigned NOT NULL DEFAULT '0',
  `number_of_payments` int(8) unsigned NOT NULL DEFAULT '0',
  `total_sale_price_with_tax` decimal(10,3) NOT NULL,
  `total_sale_price_without_tax` decimal(10,3) NOT NULL,
  `commission_without_tax` decimal(10,3) NOT NULL,
  `commission_rate_id` int(11) unsigned DEFAULT NULL,
  `commission_with_tax` decimal(10,3) NOT NULL,
  `global_sale_price_without_tax` decimal(10,3) NOT NULL,
  `global_sale_price_with_tax` decimal(10,3) NOT NULL,
  `payment_price_without_tax` decimal(10,3) DEFAULT '0.000',
  `payment_price_with_tax` decimal(10,3) DEFAULT '0.000',
  `general_price_without_tax` decimal(10,3) DEFAULT '0.000',
  `general_price_with_tax` decimal(10,3) DEFAULT '0.000',
  `tax_amount` decimal(11,3) NOT NULL,
  `taxes` varchar(128) COLLATE utf8_bin NOT NULL,
  `has_commission` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `state` enum('INPROGRESS','PAID','ORDERED','DELETED') COLLATE utf8_bin NOT NULL DEFAULT 'INPROGRESS',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_order_fk0` (`currency_id`),
  KEY `sale_order_fk1` (`employer_user_id`),
  KEY `sale_order_fk2` (`company_id`),
  KEY `sale_order_fk3` (`cart_id`),
  KEY `sale_order_fk4` (`method_id`),
  KEY `sale_order_fk5` (`payment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=49 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_sale_order_quotation`
--

CREATE TABLE IF NOT EXISTS `t_sale_order_quotation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `signature` varchar(64) COLLATE utf8_bin NOT NULL,
  `order_id` int(11) unsigned NOT NULL,
  `cart_id` int(11) unsigned NOT NULL,
  `cart_quotation_id` int(11) unsigned NOT NULL,
  `quotation_id` int(11) unsigned NOT NULL,
  `project_id` int(11) unsigned DEFAULT NULL,
  `tax_id` int(11) unsigned DEFAULT NULL,
  `in_at` date DEFAULT NULL,
  `out_at` date DEFAULT NULL,
  `number_of_hours` int(11) unsigned NOT NULL DEFAULT '0',
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `comments` varchar(512) COLLATE utf8_bin DEFAULT '',
  `sale_price_with_tax` decimal(10,3) NOT NULL,
  `sale_price_without_tax` decimal(10,3) NOT NULL,
  `total_sale_price_with_tax` decimal(10,3) NOT NULL,
  `total_sale_price_without_tax` decimal(10,3) NOT NULL,
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_order_quotation_fk0` (`quotation_id`),
  KEY `sale_order_quotation_fk1` (`order_id`),
  KEY `sale_order_quotation_fk2` (`cart_id`),
  KEY `sale_order_quotation_fk3` (`project_id`),
  KEY `sale_order_quotation_fk4` (`cart_quotation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=73 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_sale_tax`
--

CREATE TABLE IF NOT EXISTS `t_sale_tax` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(6,5) NOT NULL DEFAULT '0.00000',
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_rate` (`rate`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_sale_tax`
--

INSERT INTO `t_sale_tax` (`id`, `rate`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 0.08800, 'York Tax', 'NO', '2020-06-30 12:55:38', '2020-10-06 15:47:29');

-- --------------------------------------------------------

--
-- Structure de la table `t_services_smsbox_callback`
--

CREATE TABLE IF NOT EXISTS `t_services_smsbox_callback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modem` varchar(24) COLLATE utf8_bin NOT NULL,
  `reference` varchar(24) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(20) COLLATE utf8_bin NOT NULL,
  `message` varchar(255) COLLATE utf8_bin NOT NULL,
  `ts` varchar(20) COLLATE utf8_bin NOT NULL,
  `accuse` int(11) NOT NULL,
  `error_callback` varchar(10) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_services_smsbox_model`
--

CREATE TABLE IF NOT EXISTS `t_services_smsbox_model` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `color` varchar(16) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_services_sms_box_sent`
--

CREATE TABLE IF NOT EXISTS `t_services_sms_box_sent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) COLLATE utf8_bin NOT NULL,
  `reference` varchar(255) COLLATE utf8_bin NOT NULL,
  `message` text COLLATE utf8_bin NOT NULL,
  `error_api` text COLLATE utf8_bin NOT NULL,
  `error_callback` text COLLATE utf8_bin NOT NULL,
  `parameters` text COLLATE utf8_bin NOT NULL,
  `errors` text COLLATE utf8_bin NOT NULL,
  `is_sent` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_received` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `sent_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_sessions`
--

CREATE TABLE IF NOT EXISTS `t_sessions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `session` varchar(32) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `ip` varchar(50) COLLATE utf8_bin NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_sites`
--

CREATE TABLE IF NOT EXISTS `t_sites` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_host` varchar(255) CHARACTER SET latin1 NOT NULL,
  `site_db_name` varchar(64) CHARACTER SET latin1 NOT NULL,
  `site_db_login` varchar(40) CHARACTER SET latin1 NOT NULL DEFAULT 'root',
  `site_db_password` varchar(40) CHARACTER SET latin1 NOT NULL,
  `site_db_host` varchar(128) CHARACTER SET latin1 NOT NULL DEFAULT 'localhost',
  `site_admin_theme` varchar(64) CHARACTER SET latin1 NOT NULL DEFAULT 'theme1',
  `site_admin_available` enum('YES','NO') CHARACTER SET latin1 NOT NULL DEFAULT 'YES',
  `site_frontend_theme` varchar(64) CHARACTER SET latin1 NOT NULL DEFAULT 'theme1',
  `site_frontend_available` enum('YES','NO') CHARACTER SET latin1 NOT NULL DEFAULT 'YES',
  `site_available` enum('YES','NO') CHARACTER SET latin1 NOT NULL DEFAULT 'NO',
  `site_type` varchar(4) CHARACTER SET latin1 NOT NULL DEFAULT 'ECOM',
  `site_master` varchar(64) CHARACTER SET latin1 NOT NULL,
  `site_access_restricted` tinyint(1) NOT NULL,
  `logo` varchar(24) COLLATE utf8_bin NOT NULL,
  `picture` varchar(24) COLLATE utf8_bin NOT NULL,
  `is_uptodate` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `banner` varchar(40) CHARACTER SET utf8 NOT NULL,
  `favicon` varchar(40) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `site_host` (`site_host`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `t_sites`
--

INSERT INTO `t_sites` (`site_id`, `site_host`, `site_db_name`, `site_db_login`, `site_db_password`, `site_db_host`, `site_admin_theme`, `site_admin_available`, `site_frontend_theme`, `site_frontend_available`, `site_available`, `site_type`, `site_master`, `site_access_restricted`, `logo`, `picture`, `is_uptodate`, `banner`, `favicon`) VALUES
(1, 'graphex.ewebsolutionskech.com', 'site_graphex', 'site_graphex', 'iPGWcNrFlYyr7H5d', 'localhost', 'default', 'YES', 'theme1', 'YES', 'YES', 'CUST', '', 1, '', 'picture.png', 'NO', '', ''),
(2, 'graphex-landing.ewebsolutionskech.com', 'site_graphex', 'site_graphex', 'iPGWcNrFlYyr7H5d', 'localhost', 'default', 'YES', 'theme2', 'YES', 'YES', 'CUST', '', 1, '', 'picture.png', 'NO', '', ''),
(3, 'www.graphextech.com', 'site_graphex', 'site_graphex', 'iPGWcNrFlYyr7H5d', 'localhost', 'default', 'YES', 'theme1', 'YES', 'YES', 'CUST', '', 1, '', 'picture.png', 'NO', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `t_sites_clients`
--

CREATE TABLE IF NOT EXISTS `t_sites_clients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `design` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT 'default',
  `style` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT 'default',
  `params` varchar(40) CHARACTER SET utf8 NOT NULL,
  `keywords` varchar(512) COLLATE utf8_bin NOT NULL,
  `description` varchar(512) COLLATE utf8_bin NOT NULL,
  `banner` varchar(40) CHARACTER SET utf8 NOT NULL,
  `favicon` varchar(40) CHARACTER SET utf8 NOT NULL,
  `favicon_ico` varchar(40) CHARACTER SET utf8 NOT NULL,
  `is_tablet` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_mobile` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_default` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `id_company` int(11) NOT NULL,
  `application` enum('frontend','admin') COLLATE utf8_bin NOT NULL DEFAULT 'frontend',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Contenu de la table `t_sites_clients`
--

INSERT INTO `t_sites_clients` (`id`, `lang`, `name`, `design`, `style`, `params`, `keywords`, `description`, `banner`, `favicon`, `favicon_ico`, `is_tablet`, `is_mobile`, `is_active`, `is_default`, `id_company`, `application`, `created_at`, `updated_at`) VALUES
(3, 'fr', 'Frontend Office', 'default', 'default', '', '', '', '', '', '', 'NO', 'NO', 'NO', 'NO', 0, 'frontend', '2012-02-09 13:06:14', '2020-08-06 09:00:22'),
(4, 'fr', 'Admin Office', 'default', 'default', '', '', '', '', '', '', 'NO', 'NO', 'NO', 'NO', 0, 'admin', '2012-02-09 13:06:14', '2012-04-09 12:34:22'),
(6, 'en', 'Graphex', 'default', 'default', '', '', '', '', '', '', 'NO', 'NO', 'NO', 'YES', 0, 'frontend', '2012-02-09 13:06:14', '2020-08-26 08:38:59'),
(7, 'en', 'Admin Office', 'default', 'default', '', '', '', '', '', '', 'NO', 'NO', 'YES', 'YES', 0, 'admin', '2012-02-09 13:06:14', '2012-04-09 12:34:22'),
(8, 'es', 'Frontend Office', 'default', 'default', '', '', '', '', '', '', 'NO', 'NO', 'NO', 'NO', 0, 'frontend', '2012-02-09 13:06:14', '2020-08-06 09:00:24');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_city`
--

CREATE TABLE IF NOT EXISTS `t_site_city` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `postcode` varchar(10) COLLATE utf8_bin DEFAULT '',
  `country_id` int(11) unsigned NOT NULL,
  `awe` varchar(10) COLLATE utf8_bin DEFAULT '',
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_city_fk0` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Contenu de la table `t_site_city`
--

INSERT INTO `t_site_city` (`id`, `name`, `icon`, `color`, `postcode`, `country_id`, `awe`, `position`, `created_at`, `updated_at`) VALUES
(1, '', '', '#9e4545', '', 3, '', 2, '2019-12-05 20:20:05', '2020-01-05 11:35:18'),
(2, '', '', '', '', 3, '', 1, '2019-12-05 20:21:53', '2019-12-05 20:21:53');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_city_i18n`
--

CREATE TABLE IF NOT EXISTS `t_site_city_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `city_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`city_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Contenu de la table `t_site_city_i18n`
--

INSERT INTO `t_site_city_i18n` (`id`, `lang`, `title`, `city_id`, `created_at`, `updated_at`) VALUES
(1, 'fr', 'MARRAKECH', 1, '2019-12-05 20:20:05', '2019-12-05 20:20:05'),
(2, 'fr', 'toto', 2, '2019-12-05 20:21:53', '2019-12-05 20:21:53');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_cms_block`
--

CREATE TABLE IF NOT EXISTS `t_site_cms_block` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_site_cms_block_page`
--

CREATE TABLE IF NOT EXISTS `t_site_cms_block_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `block_id` int(11) unsigned NOT NULL,
  `page_id` int(11) unsigned DEFAULT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `target` enum('_blank','top','parent','') COLLATE utf8_bin NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_cms_block_page_fk0` (`block_id`),
  KEY `site_cms_block_page_fk1` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_site_cms_menu`
--

CREATE TABLE IF NOT EXISTS `t_site_cms_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `lb` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rb` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_id` int(11) unsigned DEFAULT NULL,
  `icon` varchar(30) COLLATE utf8_bin NOT NULL,
  `awe` varchar(30) COLLATE utf8_bin NOT NULL,
  `picture` varchar(30) COLLATE utf8_bin NOT NULL,
  `target` enum('_blank','top','parent','') COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_link` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'YES',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_cms_menu_fk0` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=76 ;

--
-- Contenu de la table `t_site_cms_menu`
--

INSERT INTO `t_site_cms_menu` (`id`, `name`, `lb`, `rb`, `level`, `page_id`, `icon`, `awe`, `picture`, `target`, `is_link`, `is_active`, `created_at`, `updated_at`) VALUES
(6, '', 1, 102, 0, NULL, '', '', '', '', '', '', '2020-07-19 23:56:18', '2020-07-20 23:07:30'),
(7, 'header', 88, 101, 1, NULL, '', '', '', '', '', 'YES', '2020-07-19 23:59:06', '2020-07-21 01:10:55'),
(8, 'about', 76, 87, 1, NULL, '', '', '', '_blank', '', 'YES', '2020-07-20 00:01:29', '2020-07-20 23:43:44'),
(17, '', 77, 78, 2, 9, '', '', '', '', '', 'YES', '2020-07-20 23:44:25', '2020-07-20 23:44:25'),
(18, '', 79, 80, 2, 10, '', '', '', '', '', 'YES', '2020-07-21 00:27:21', '2020-07-21 00:27:23'),
(19, '', 81, 82, 2, 11, '', '', '', '', '', 'YES', '2020-07-21 00:28:33', '2020-07-21 00:28:34'),
(20, '', 83, 84, 2, 12, '', '', '', '', '', 'YES', '2020-07-21 00:32:15', '2020-07-21 00:32:18'),
(21, '', 85, 86, 2, 13, '', '', '', '', '', 'NO', '2020-07-21 00:41:51', '2020-10-17 16:43:30'),
(22, 'safety', 66, 75, 1, NULL, '', '', '', '', '', 'YES', '2020-07-21 00:47:04', '2020-07-21 00:47:06'),
(23, '', 73, 74, 2, 14, '', '', '', '', '', 'YES', '2020-07-21 00:47:28', '2020-07-21 00:47:29'),
(24, '', 71, 72, 2, 15, '', '', '', '', '', 'YES', '2020-07-21 00:47:44', '2020-07-21 00:47:46'),
(25, '', 69, 70, 2, 16, '', '', '', '', '', 'YES', '2020-07-21 00:48:04', '2020-07-21 00:48:05'),
(26, '', 67, 68, 2, 17, '', '', '', '', '', 'YES', '2020-07-21 00:48:21', '2020-07-21 00:48:24'),
(27, 'helpcenter', 58, 65, 1, NULL, '', '', '', '', '', 'YES', '2020-07-21 00:57:39', '2020-07-21 00:57:55'),
(28, '', 63, 64, 2, 18, '', '', '', '', '', 'YES', '2020-07-21 00:58:16', '2020-07-21 00:58:18'),
(29, '', 61, 62, 2, 19, '', '', '', '', '', 'YES', '2020-07-21 00:58:32', '2020-07-21 00:58:37'),
(30, '', 59, 60, 2, 20, '', '', '', '', '', 'YES', '2020-07-21 00:58:48', '2020-07-21 00:58:50'),
(31, 'blog', 48, 57, 1, NULL, '', '', '', '', '', 'NO', '2020-07-21 00:59:14', '2020-10-17 18:26:32'),
(32, '', 55, 56, 2, 21, '', '', '', '', '', 'NO', '2020-07-21 00:59:32', '2020-10-17 18:27:11'),
(33, '', 53, 54, 2, 22, '', '', '', '', '', 'NO', '2020-07-21 00:59:44', '2020-10-17 18:27:09'),
(34, '', 51, 52, 2, 23, '', '', '', '', '', 'NO', '2020-07-21 00:59:58', '2020-10-17 18:27:10'),
(35, '', 49, 50, 2, 24, '', '', '', '', '', 'NO', '2020-07-21 01:00:20', '2020-10-17 18:27:10'),
(36, 'academy', 42, 47, 1, NULL, '', '', '', '', '', 'YES', '2020-07-21 01:00:40', '2020-07-21 01:00:42'),
(37, '', 45, 46, 2, 25, '', '', '', '', '', 'YES', '2020-07-21 01:03:03', '2020-07-21 01:03:05'),
(38, '', 89, 90, 2, 26, '', '', '', '', '', 'YES', '2020-07-21 01:14:57', '2020-07-21 01:16:10'),
(39, '', 91, 92, 2, 27, '', '', '', '', '', 'YES', '2020-07-21 01:16:29', '2020-07-21 01:16:36'),
(40, '', 93, 94, 2, 28, '', '', '', '', '', 'NO', '2020-07-21 01:16:50', '2020-10-17 18:26:40'),
(41, '', 95, 96, 2, 29, '', '', '', '', '', 'YES', '2020-07-21 01:17:15', '2020-07-21 01:17:17'),
(42, '', 97, 98, 2, 30, '', '', '', '', '', 'NO', '2020-07-21 01:17:34', '2020-10-17 16:42:31'),
(43, '', 99, 100, 2, 31, '', '', '', '', '', 'YES', '2020-07-21 01:17:53', '2020-08-04 19:37:22'),
(45, 'test', 34, 41, 1, 33, '', '', '', '', '', 'YES', '2020-07-21 17:53:22', '2020-07-31 22:58:44'),
(46, 'test1', 39, 40, 2, NULL, '', '', '', '', '', 'YES', '2020-07-23 08:23:27', '2020-07-31 22:16:58'),
(47, 'test2', 37, 38, 2, NULL, '', '', '', '', '', 'YES', '2020-07-23 08:23:37', '2020-07-31 22:16:58'),
(49, '', 43, 44, 2, NULL, '', '', '', '', '', 'YES', '2020-07-29 23:20:00', '2020-07-29 23:20:02'),
(50, 'bottom-academy-right', 26, 33, 1, NULL, '', '', '', '', '', 'YES', '2020-09-09 07:53:14', '2020-09-09 17:01:49'),
(51, 'bottom-academy-left', 10, 25, 1, NULL, '', '', '', '', '', 'YES', '2020-09-09 07:53:24', '2020-09-09 17:01:43'),
(53, '', 31, 32, 2, 38, '', '', '', '', '', 'YES', '2020-09-09 16:48:59', '2020-09-09 17:06:58'),
(54, '', 15, 16, 2, 40, '', '', '', '', '', 'YES', '2020-09-09 16:58:41', '2020-09-09 16:59:04'),
(55, '', 13, 14, 2, 41, '', '', '', '', '', 'YES', '2020-09-09 16:59:32', '2020-09-09 16:59:55'),
(56, '', 17, 18, 2, 42, '', '', '', '', '', 'YES', '2020-09-09 17:00:23', '2020-09-09 17:00:41'),
(57, '', 11, 12, 2, 39, '', '', '', '', '', 'YES', '2020-09-09 17:04:26', '2020-09-09 17:04:42'),
(58, '', 29, 30, 2, 44, '', '', '', '', '', 'YES', '2020-09-09 17:07:24', '2020-09-09 17:07:49'),
(59, '', 27, 28, 2, 45, '', '', '', '', '', 'YES', '2020-09-09 17:08:17', '2020-09-09 17:08:57'),
(71, 'test3', 35, 36, 2, NULL, '', '', '', '', '', 'YES', '2020-09-09 18:19:23', '2020-09-15 18:20:33'),
(72, 'academy-top', 2, 9, 1, NULL, '', '', '', '', '', 'YES', '2020-09-15 08:07:23', '2020-09-15 08:07:25'),
(73, '', 5, 6, 2, 44, '', '', '', '', '', 'YES', '2020-09-15 08:10:20', '2020-09-15 08:12:18'),
(74, '', 3, 4, 2, 45, '', '', '', '', '', 'YES', '2020-09-15 08:11:10', '2020-09-15 08:12:03'),
(75, '', 7, 8, 2, 26, '', '', '', '', '', 'YES', '2020-09-15 08:14:09', '2020-09-15 08:14:40');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_cms_menu_i18n`
--

CREATE TABLE IF NOT EXISTS `t_site_cms_menu_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `menu_id` int(11) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_cms_menu_i18n_fk0` (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=81 ;

--
-- Contenu de la table `t_site_cms_menu_i18n`
--

INSERT INTO `t_site_cms_menu_i18n` (`id`, `lang`, `menu_id`, `title`, `created_at`, `updated_at`) VALUES
(6, 'en', 7, '', '2020-07-19 22:59:06', '2020-07-19 22:59:06'),
(7, 'en', 8, 'About Graphex', '2020-07-19 23:01:29', '2020-07-19 23:01:29'),
(15, 'en', 6, '', '2020-07-20 23:07:30', '2020-07-20 23:07:30'),
(20, 'en', 17, 'Graphex Mission', '2020-07-20 23:44:25', '2020-07-20 23:44:25'),
(21, '', 8, 'About Graphex', '2020-07-20 23:54:10', '2020-07-20 23:54:10'),
(22, 'en', 18, 'Graphex Vision', '2020-07-21 00:27:20', '2020-07-21 00:27:20'),
(23, 'en', 19, 'Carrier Center', '2020-07-21 00:28:33', '2020-07-21 00:28:33'),
(24, 'en', 20, 'News and Statistics', '2020-07-21 00:32:15', '2020-07-21 00:32:15'),
(25, 'en', 21, 'Event Calendar', '2020-07-21 00:41:51', '2020-07-21 00:41:51'),
(26, 'en', 22, 'Safety', '2020-07-21 00:47:04', '2020-07-21 00:47:04'),
(27, 'en', 23, 'Terms and Conditions', '2020-07-21 00:47:28', '2020-07-21 00:47:28'),
(28, 'en', 24, 'Copywriting', '2020-07-21 00:47:44', '2020-07-21 00:47:44'),
(29, 'en', 25, 'Privacy policy', '2020-07-21 00:48:03', '2020-07-21 00:48:03'),
(30, 'en', 26, 'Terms of service', '2020-07-21 00:48:21', '2020-07-21 00:48:21'),
(31, 'en', 27, 'Help Center', '2020-07-21 00:57:39', '2020-07-21 00:57:39'),
(32, 'en', 28, 'Trust and Safety', '2020-07-21 00:58:16', '2020-07-21 00:58:16'),
(33, 'en', 29, 'Have a Question', '2020-07-21 00:58:32', '2020-07-21 00:58:32'),
(34, 'en', 30, 'Report an Issue', '2020-07-21 00:58:48', '2020-07-21 00:58:48'),
(35, 'en', 31, 'Blog', '2020-07-21 00:59:14', '2020-07-21 00:59:14'),
(36, 'en', 32, 'Invite a seller', '2020-07-21 00:59:32', '2020-07-21 00:59:32'),
(37, 'en', 33, 'Invite a vendor', '2020-07-21 00:59:44', '2020-07-21 00:59:44'),
(38, 'en', 34, 'Graphex Room', '2020-07-21 00:59:58', '2020-07-21 00:59:58'),
(39, 'en', 35, 'Activities', '2020-07-21 01:00:20', '2020-07-21 01:00:20'),
(40, 'en', 36, 'Graphex Academy', '2020-07-21 01:00:40', '2020-07-21 01:00:40'),
(41, 'en', 37, 'Coming Soon', '2020-07-21 01:03:03', '2020-07-21 01:03:03'),
(42, 'en', 38, 'Home', '2020-07-21 01:14:57', '2020-07-21 01:14:57'),
(43, '', 38, 'Home', '2020-07-21 01:16:08', '2020-07-21 01:16:08'),
(44, 'en', 39, 'About', '2020-07-21 01:16:29', '2020-07-21 01:16:29'),
(45, 'en', 40, 'Blog', '2020-07-21 01:16:50', '2020-07-21 01:16:50'),
(46, 'en', 41, 'Academy', '2020-07-21 01:17:15', '2020-07-21 01:17:15'),
(47, 'en', 42, 'Events', '2020-07-21 01:17:34', '2020-07-21 01:17:34'),
(48, 'en', 43, 'Contact', '2020-07-21 01:17:53', '2020-07-21 01:17:53'),
(50, 'en', 45, 'TEST', '2020-07-21 17:53:22', '2020-07-21 17:53:22'),
(51, 'en', 46, '', '2020-07-23 08:23:27', '2020-07-23 08:23:27'),
(52, 'en', 47, '', '2020-07-23 08:23:37', '2020-07-23 08:23:37'),
(54, 'en', 49, 'Graphex Academy', '2020-07-29 23:20:00', '2020-07-29 23:20:00'),
(55, 'en', 50, '', '2020-09-09 07:53:14', '2020-09-09 07:53:14'),
(56, 'en', 51, '', '2020-09-09 07:53:24', '2020-09-09 07:53:24'),
(58, 'en', 53, 'Help & support', '2020-09-09 16:48:59', '2020-09-09 16:48:59'),
(59, 'en', 54, 'Terms & conditions', '2020-09-09 16:58:41', '2020-09-09 16:58:41'),
(60, 'en', 55, 'Vision', '2020-09-09 16:59:32', '2020-09-09 16:59:32'),
(61, 'en', 56, 'Contact us', '2020-09-09 17:00:23', '2020-09-09 17:00:23'),
(62, 'en', 57, 'About us', '2020-09-09 17:04:26', '2020-09-09 17:04:26'),
(63, 'en', 58, 'Learn on Graphex', '2020-09-09 17:07:24', '2020-09-09 17:07:24'),
(64, 'en', 59, 'Teach on Graphex', '2020-09-09 17:08:17', '2020-09-09 17:08:17'),
(76, 'en', 71, 'test3', '2020-09-09 18:19:23', '2020-09-09 18:19:23'),
(77, 'en', 72, '', '2020-09-15 08:07:23', '2020-09-15 08:07:23'),
(78, 'en', 73, 'Learn on Graphex', '2020-09-15 08:10:20', '2020-09-15 08:10:20'),
(79, 'en', 74, 'Teach on Graphex', '2020-09-15 08:11:10', '2020-09-15 08:11:10'),
(80, 'en', 75, 'Graphex Technology', '2020-09-15 08:14:09', '2020-09-15 08:14:09');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_cms_page`
--

CREATE TABLE IF NOT EXISTS `t_site_cms_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=46 ;

--
-- Contenu de la table `t_site_cms_page`
--

INSERT INTO `t_site_cms_page` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(4, 'numbers', 'YES', '2020-07-17 18:52:48', NULL),
(5, 'howitworks', 'YES', '2020-07-17 18:30:40', '2020-07-17 18:30:40'),
(6, 'marketing', 'YES', '2020-07-17 18:41:32', '2020-07-17 18:41:32'),
(7, 'test11', 'YES', '2020-07-19 23:43:18', '2020-07-19 23:43:18'),
(9, '', 'YES', '2020-07-20 23:44:25', '2020-07-20 23:44:25'),
(10, '', 'YES', '2020-07-21 00:27:21', '2020-07-21 00:27:21'),
(11, '', 'YES', '2020-07-21 00:28:33', '2020-07-21 00:28:33'),
(12, '', 'YES', '2020-07-21 00:32:15', '2020-07-21 00:32:15'),
(13, '', 'YES', '2020-07-21 00:41:51', '2020-07-21 00:41:51'),
(14, 'terms_and_conditions', 'YES', '2020-07-21 00:47:28', '2020-07-21 00:47:28'),
(15, '', 'YES', '2020-07-21 00:47:44', '2020-07-21 00:47:44'),
(16, '', 'YES', '2020-07-21 00:48:03', '2020-07-21 00:48:03'),
(17, '', 'YES', '2020-07-21 00:48:21', '2020-07-21 00:48:21'),
(18, '', 'YES', '2020-07-21 00:58:16', '2020-07-21 00:58:16'),
(19, '', 'YES', '2020-07-21 00:58:32', '2020-07-21 00:58:32'),
(20, '', 'YES', '2020-07-21 00:58:48', '2020-07-21 00:58:48'),
(21, '', 'YES', '2020-07-21 00:59:32', '2020-07-21 00:59:32'),
(22, '', 'YES', '2020-07-21 00:59:44', '2020-07-21 00:59:44'),
(23, '', 'YES', '2020-07-21 00:59:58', '2020-07-21 00:59:58'),
(24, '', 'YES', '2020-07-21 01:00:20', '2020-07-21 01:00:20'),
(25, 'Coming Soon', 'YES', '2020-07-21 01:03:03', '2020-07-21 01:03:03'),
(26, 'Home', 'YES', '2020-07-21 01:14:57', '2020-07-21 01:14:57'),
(27, '', 'YES', '2020-07-21 01:16:29', '2020-07-21 01:16:29'),
(28, '', 'YES', '2020-07-21 01:16:50', '2020-07-21 01:16:50'),
(29, '', 'YES', '2020-07-21 01:17:15', '2020-07-21 01:17:15'),
(30, '', 'YES', '2020-07-21 01:17:34', '2020-07-21 01:17:34'),
(31, '', 'YES', '2020-07-21 01:17:53', '2020-07-21 01:17:53'),
(32, 'test', 'NO', '2020-07-22 21:29:56', '2020-07-22 21:29:56'),
(33, 'toto', 'NO', '2020-07-31 22:58:44', '2020-07-31 22:58:44'),
(34, '', 'YES', '2020-09-03 09:20:19', '2020-09-03 09:20:19'),
(35, 'academy_home_learn', 'NO', '2020-09-07 11:56:03', '2020-09-07 11:56:03'),
(36, 'academy_home_teach', 'NO', '2020-09-07 11:56:28', '2020-09-07 11:56:28'),
(37, 'academy_home_offers', 'YES', '2020-09-07 12:12:36', '2020-09-07 12:12:36'),
(38, '', 'YES', '2020-09-09 16:46:15', '2020-09-09 16:46:15'),
(39, '', 'YES', '2020-09-09 16:50:06', '2020-09-09 16:50:06'),
(40, '', 'YES', '2020-09-09 16:59:04', '2020-09-09 16:59:04'),
(41, '', 'YES', '2020-09-09 16:59:55', '2020-09-09 16:59:55'),
(42, '', 'YES', '2020-09-09 17:00:41', '2020-09-09 17:00:41'),
(44, '', 'YES', '2020-09-09 17:07:47', '2020-09-09 17:07:47'),
(45, '', 'YES', '2020-09-09 17:08:57', '2020-09-09 17:08:57');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_cms_page_i18n`
--

CREATE TABLE IF NOT EXISTS `t_site_cms_page_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `url` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_robots` varchar(30) COLLATE utf8_bin NOT NULL,
  `layout` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT 'default',
  `template` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT 'default',
  `content` text COLLATE utf8_bin NOT NULL,
  `in_menu` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'YES',
  `is_sitemap` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'YES',
  `is_cached` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `start_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_cms_page_i18n_fk0` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=54 ;

--
-- Contenu de la table `t_site_cms_page_i18n`
--

INSERT INTO `t_site_cms_page_i18n` (`id`, `page_id`, `lang`, `url`, `meta_title`, `meta_description`, `meta_keywords`, `meta_robots`, `layout`, `template`, `content`, `in_menu`, `is_sitemap`, `is_cached`, `is_active`, `start_at`, `expired_at`, `created_at`, `updated_at`) VALUES
(4, 4, 'en', '#', '', '', '', '', 'default.xml', 'default.tpl', '   <section class="ftco-section ftco-counter" id="section-counter">\n                <div class="container">\n                    <div class="row justify-content-center">\n                        <div class="col-md-10">\n                            <div class="row">\n                                <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">\n                                    <div class="block-18 text-center">\n                                        <div class="text">\n                                            <strong class="number" data-number="1350000">0</strong>\n                                            <span>Jobs</span>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">\n                                    <div class="block-18 text-center">\n                                        <div class="text">\n                                            <strong class="number" data-number="40000">0</strong>\n                                            <span>Members</span>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">\n                                    <div class="block-18 text-center">\n                                        <div class="text">\n                                            <strong class="number" data-number="30000">0</strong>\n                                            <span>Resume</span>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">\n                                    <div class="block-18 text-center">\n                                        <div class="text">\n                                            <strong class="number" data-number="10500">0</strong>\n                                            <span>Company</span>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                </div>\n            </section>', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-17 17:52:48', '2020-07-17 18:27:50'),
(5, 4, 'fr', '#', '', '', '', '', 'default.xml', 'default.tpl', '   <section class="ftco-section ftco-counter" id="section-counter">\n                <div class="container">\n                    <div class="row justify-content-center">\n                        <div class="col-md-10">\n                            <div class="row">\n                                <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">\n                                    <div class="block-18 text-center">\n                                        <div class="text">\n                                            <strong class="number" data-number="1350000">0</strong>\n                                            <span>Jobs</span>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">\n                                    <div class="block-18 text-center">\n                                        <div class="text">\n                                            <strong class="number" data-number="40000">0</strong>\n                                            <span>Members</span>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">\n                                    <div class="block-18 text-center">\n                                        <div class="text">\n                                            <strong class="number" data-number="30000">0</strong>\n                                            <span>Resume</span>\n                                        </div>\n                                    </div>\n                                </div>\n                                <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">\n                                    <div class="block-18 text-center">\n                                        <div class="text">\n                                            <strong class="number" data-number="10500">0</strong>\n                                            <span>Company</span>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                </div>\n            </section>', 'YES', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-17 18:24:57', '2020-07-17 18:28:00'),
(6, 5, 'en', '', 'How it works', '', '', '', 'default.xml', 'default.tpl', '<div class="container">\n<div class="justify-content-center mb-5 pb-3 row">\n<div class="col-md-7 fadeInUp ftco-animate ftco-animated heading-section text-center">\n<h2>How It Works</h2>\n\n<h4>it&#39;s easy as 1-2-3-4.</h4>\n</div>\n</div>\n\n<div class="row">\n<div class="col-lg-3 col-md-4 fadeInUp ftco-animate ftco-animated sectionHowItWork">\n<div style="text-align:center">\n<div class="sectionHowItWork-divImage"><img src="/web/files/icons/monitor.png" /></div>\n\n<div class="sectionHowItWork-divDescription">\n<h4>1. Post a job</h4>\n\n<p>Simply post a job<br />\nif you post a job<br />\nan associate will contact you<br />\nwithin minutes.<br />\nOtherwise<br />\nyou can choose an associate<br />\nfrom our available freelancers<br />\nby going through their portfolio<br />\nand click on get a quote or<br />\nsimply send a message directly to them.</p>\n</div>\n</div>\n</div>\n\n<div class="col-lg-3 col-md-4 fadeInUp ftco-animate ftco-animated sectionHowItWork">\n<div style="text-align:center">\n<div class="sectionHowItWork-divImage"><img src="/web/files/icons/group.png" /></div>\n\n<div class="sectionHowItWork-divDescription">\n<h4>2. Choose freelancers</h4>\n\n<p>Whatever your needs are,<br />\nthere will be a freelancer to get it done.<br />\nServices such as: Graphic and web design, Data Science,<br />\nmobile app development,<br />\nvirtual assistants, business and marketing,<br />\nMusic productions, writing &amp; translations and<br />\na lot more. (See all categories).<br />\nFind professionals you can trust<br />\nby going through their portfolios and their profiles.<br />\nYou&rsquo;ll see samples of previous work and<br />\nread reviews from previous customers.</p>\n</div>\n</div>\n</div>\n\n<div class="col-lg-3 col-md-4 fadeInUp ftco-animate ftco-animated sectionHowItWork">\n<div style="text-align:center">\n<div class="sectionHowItWork-divImage"><img src="/web/files/icons/lock.png" /></div>\n\n<div class="sectionHowItWork-divDescription">\n<h4>3. Secure payment</h4>\n\n<p>At Graphex Technology,<br />\nyour secure and safe payment is our first priority.<br />\nThe beauty about our company,<br />\nyou negotiate with the freelancer, but you pay our company.<br />\nThe freelancer won&rsquo;t get paid until the job is done.<br />\nThe freelancer will get paid when the project is completed and you&#39;re 100% satisfied.<br />\nYou can track the progress of your projects by sending<br />\nan email to the freelancer or access the database<br />\nprovided by your freelancer to allow transparency.</p>\n</div>\n</div>\n</div>\n\n<div class="col-lg-3 col-md-4 fadeInUp ftco-animate ftco-animated sectionHowItWork">\n<div style="text-align:center">\n<div class="sectionHowItWork-divImage"><img src="/web/files/icons/support.png" /></div>\n\n<div class="sectionHowItWork-divDescription">\n<h4>4. 24/7 support</h4>\n\n<p>We have a team of customer supports available<br />\n24/7 and 7 days a week<br />\nto answer all your questions<br />\nand concerns.<br />\nWe speak many languages<br />\nto facilitate customers to express<br />\nthemselves in their own languages,<br />\njust so their concerns can be understood and solved.<br />\nWe&#39;re always here to help.<br />\nOur support consists of real people who are available 24/7.</p>\n</div>\n</div>\n</div>\n</div>\n</div>', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-17 18:30:40', '2020-07-17 18:30:40'),
(7, 5, 'fr', '', '', '', '', '', 'default.xml', 'default.tpl', '<section class="ftco-section">\n                <div class="container">\n                    <div class="row justify-content-center mb-5 pb-3">\n                        <div class="col-md-7 heading-section text-center ftco-animate fadeInUp ftco-animated">\n                            <h2 class="mb-4"><span>How</span> It Work</h2>\n                        </div>\n                    </div>\n                    <div class="row">\n                        <div class="col-lg-3 col-md-3 ftco-animate fadeInUp ftco-animated sectionHowItWork">\n                            <div style="text-align: center;">\n                                <div class="sectionHowItWork-divImage">\n                                    <img src="/web/pictures/translation11.png">\n                                </div>\n                                <div class="sectionHowItWork-divDescription">\n                                    <h4>Teach Your Culture</h4>\n                                    <p>dzef dfedfref a aaa aaaaaaa aaaaaaaaa aaaa aknkn niinono ibibib</p>\n                                </div>\n                            </div>\n                        </div>\n                        <div class="col-lg-3 col-md-3 ftco-animate fadeInUp ftco-animated sectionHowItWork">\n                            <div style="text-align: center;">\n                                <div class="sectionHowItWork-divImage">\n                                    <img src="/web/pictures/translation11.png">\n                                </div>\n                                <div class="sectionHowItWork-divDescription">\n                                    <h4>Entertain Your Passion</h4>\n                                    <p>dzef dfedfref a aaa aaaaaaa aaaaaaaaa aaaa aknkn niinono ibibib</p>\n                                </div>\n                            </div>\n                        </div>\n                        <div class="col-lg-3 col-md-3 ftco-animate fadeInUp ftco-animated sectionHowItWork">\n                            <div style="text-align: center;">\n                                <div class="sectionHowItWork-divImage">\n                                    <img src="/web/pictures/translation11.png">\n                                </div>\n                                <div class="sectionHowItWork-divDescription">\n                                    <h4>Play Your Hobby</h4>\n                                    <p>dzef dfedfref a aaa aaaaaaa aaaaaaaaa aaaa aknkn niinono ibibib</p>\n                                </div>\n                            </div>\n                        </div>\n                        <div class="col-lg-3 col-md-3 ftco-animate fadeInUp ftco-animated sectionHowItWork">\n                            <div style="text-align: center;">\n                                <div class="sectionHowItWork-divImage">\n                                    <img src="/web/pictures/translation11.png">\n                                </div>\n                                <div class="sectionHowItWork-divDescription">\n                                    <h4>Experience other’s Experience</h4>\n                                    <p>dzef dfedfref a aaa aaaaaaa aaaaaaaaa aaaa aknkn niinono ibibib</p>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                </div>\n            </section>        ', 'YES', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-17 18:30:54', '2020-07-17 18:30:54'),
(8, 6, 'fr', '', '', '', '', '', 'default.xml', 'default.tpl', ' <section class="ftco-section services-section bg-light">\n                <div class="container">\n                    <div class="row d-flex">\n                        <div class="col-md-3 d-flex align-self-stretch ftco-animate">\n                            <div class="media block-6 services d-block">\n                                <div class="icon icon-onHomePage">\n                                    {*<span class="flaticon-resume"></span>*}\n                                    <img src="/web/pictures/translation11.png"/>\n                                </div>\n                                <div class="media-body">\n                                    <h3 class="heading mb-3">Search Millions of Jobs</h3>\n                                    <p>A small river named Duden flows by their place and supplies.</p>\n                                </div>\n                            </div>      \n                        </div>\n                        <div class="col-md-3 d-flex align-self-stretch ftco-animate">\n                            <div class="media block-6 services d-block">\n                                <div class="icon icon-onHomePage">\n                                    <img src="/web/pictures/translation11.png"/>\n                                </div>\n                                <div class="media-body">\n                                    <h3 class="heading mb-3">Easy To Manage Jobs</h3>\n                                    <p>A small river named Duden flows by their place and supplies.</p>\n                                </div>\n                            </div>    \n                        </div>\n                        <div class="col-md-3 d-flex align-self-stretch ftco-animate">\n                            <div class="media block-6 services d-block">\n                                <div class="icon icon-onHomePage">\n                                    <img src="/web/pictures/translation11.png"/>\n                                </div>\n                                <div class="media-body">\n                                    <h3 class="heading mb-3">Top Careers</h3>\n                                    <p>A small river named Duden flows by their place and supplies.</p>\n                                </div>\n                            </div>      \n                        </div>\n                        <div class="col-md-3 d-flex align-self-stretch ftco-animate">\n                            <div class="media block-6 services d-block">\n                                <div class="icon icon-onHomePage">\n                                    <img src="/web/pictures/translation11.png"/>\n                                </div>\n                                <div class="media-body">\n                                    <h3 class="heading mb-3">Search Expert Candidates</h3>\n                                    <p>A small river named Duden flows by their place and supplies.</p>\n                                </div>\n                            </div>      \n                        </div>\n                    </div>\n                </div>\n            </section>', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-17 18:41:32', '2020-07-17 18:41:32'),
(9, 6, 'en', '', '', '', '', '', 'default.xml', 'default.tpl', '<section class="ftco-section services-section bg-light">\n                <div class="container">\n                    <div class="row d-flex">\n                        <div class="col-md-3 d-flex align-self-stretch ftco-animate">\n                            <div class="media block-6 services d-block">\n                                <div class="icon icon-onHomePage">\n                                    {*<span class="flaticon-resume"></span>*}\n                                    <img src="/web/pictures/1.jpg"/>\n                                </div>\n                                <div class="media-body">\n                                    {*<h3 class="heading mb-3">Search Millions of Jobs</h3>*}\n                                   <p class="newClassForParagraph">Find Thousands of Jobs in minutes Search Jobs by countries, cities, mostrecents, or get in touch with an employer directly.</p>\n                                </div>\n                            </div>      \n                        </div>\n                        <div class="col-md-3 d-flex align-self-stretch ftco-animate">\n                            <div class="media block-6 services d-block">\n                                <div class="icon icon-onHomePage">\n                                    <img src="/web/pictures/2.jpg"/>\n                                </div>\n                                <div class="media-body">\n                                   <p class="newClassForParagraph">We are here for you 24/7, You can contact us,or chat with our hiring parteners. We have part time and hourly jobs.</p>\n                                </div>\n                            </div>    \n                        </div>\n                        <div class="col-md-3 d-flex align-self-stretch ftco-animate">\n                            <div class="media block-6 services d-block">\n                                <div class="icon icon-onHomePage">\n                                    <img src="/web/pictures/3.jpg"/>\n                                </div>\n                                <div class="media-body">\n                                  <p class="newClassForParagraph">You’re in control of how much you want to make for theday. All you need is a computer and internet access.</p>\n                                </div>\n                            </div>      \n                        </div>\n                        <div class="col-md-3 d-flex align-self-stretch ftco-animate">\n                            <div class="media block-6 services d-block">\n                                <div class="icon icon-onHomePage">\n                                    <img src="/web/pictures/4.jpg"/>\n                                </div>\n                                <div class="media-body">\n                                     <p class="newClassForParagraph">Make money everys econd It’seasy: <br/>\n1.accept a job offer,<br/>\n                                        2.finish the job and,<br/>\n                                        3.Get paid right away.<br/>\n                                    </p>\n                                </div>\n                            </div>      \n                        </div>\n                    </div>\n                </div>\n            </section>', 'YES', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-17 18:41:46', '2020-07-17 18:41:46'),
(11, 7, 'en', 'test11', 'test11', '', '', '', 'default.xml', 'default.tpl', 'test11', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-20 00:59:37', '2020-07-20 00:59:37'),
(16, 9, 'en', 'graphex-mission', 'Graphex Mission', 'Graphex mission', 'Graphex mission', '', 'default.xml', 'default.tpl', '<div><img src="/web/files/pictures/mission-final-first.png" style="height:100%; width:100%" />\n<h1>GRAPHEX MISSION STATEMENT</h1>\n\n<div>\n<p>It is our mission to afford employment access, and entrepreneurial<br />\nopportunities to people around the world, aiming to forever change lives,<br />\ncareers, and businesses. Graphex Technology strives to be a company<br />\nthat cares about meeting the needs of its customers,<br />\nfreelancers, international students and its affiliates;<br />\nthereby promoting freedom, flexibility, growth, and<br />\nsatisfaction with no compromise to quality of services.<br />\n<br />\nWhile evolving with our ever-changing landscape of the technological world.<br />\nGraphex offers an array of possibilities, and is proudly aiming at ending poverty,<br />\nby contributing to the reduction of unemployment rates around the world;<br />\ndecreasing the influx of massive migration and influence the lessening of Pollution.<br />\nAt Graphex Technology we aspire to make the world a better place.</p>\n</div>\n\n<div style="background-color:#083940">\n<h1>A Word From the CEO</h1>\n\n<div class="row">\n<div class="col-md-4 divImageMission"><img src="/web/files/pictures/mission-fina-second.png" /></div>\n</div>\n\n<div class="LastDivMission"><img src="/web/files/pictures/mission-fina-third2.png" />\n<p>On behalf of all our directors and managers at Graphex Technology,<br />\nWe are thrilled to welcome you to our company.<br />\nYou just made a giant step in your career by becoming a partner of Graphex and a member of a global community;<br />\nGraphex is all about Discovering Your Purpose and get the most out of it.<br />\nA wise man once said: &ldquo;If you don&rsquo;t let people use you, you become useless.&rdquo;<br />\nIn a world where everything seems not to be working well.<br />\nGovernment is unable to create jobs, unemployment rate is escalating,<br />\nTechnology is killing a lot of jobs, banks are closing, family disintegration due to lack of jobs.<br />\nPeople are asking government to leave before their mandate time<br />\nbecause leaders don&rsquo;t keep their words; a Global market like Graphex where you can sell your services,<br />\nyour gifts and your talents is what the world needs right now.<br />\n<br />\nAs the world is changing, Graphex Technology is preparing the future for You.<br />\nIf you get laid off, use the time for you to know the truth and what you capable of doing,<br />\nin other words discover your purpose. If you don&rsquo;t have a job,<br />\nor you are living in a country where you have never worked before, don&rsquo;t worry! You are at the right place.<br />\nAt Graphex Technology, we want you to be deployed, not employed.<br />\nWe want you to become an entrepreneur, a business partner, not an employee;<br />\nWhere you are sitting in a box from 9 to 5, you cannot apply your knowledge potentially and efficiently.<br />\nWhere an employer is telling you how much they can offer hourly, when you know you&rsquo;re worth much more.<br />\nWe want to disrupt that modern slavery type of life, where A boss is telling you what time to clock in and out,<br />\nWhat time to take lunch, when to go on vacation, and how much you will make per year.<br />\nBasically, your life is controlled, they already know if you will be successful or not<br />\nBecause they calculate by the time you retire, how much money you&rsquo;ll be making by then.<br />\nMost of the time, while amid work, you are transported into a dream state,<br />\nLooking at yourself in a virtual mirror, you know that is not the right place for you.<br />\nSometimes, you feel like quitting your job, but you&rsquo;re asking yourself what are you going to do?<br />\nWhat are the kids going to eat? How are the bills going to be paid?<br />\nYou know you are gifted, and talented but you do not want to admit it,<br />\nand most time you do not know where to start.<br />\nWhen you sit at that desk, deep inside of you, you&rsquo;re really thinking about a gift,<br />\na talent that you have, this is what you really want to do but you&rsquo;re scared of quitting<br />\nbecause there&rsquo;s no guarantee that you will find something else to do.<br />\nWell, Graphex is here to the rescue! Now is the time to discover your purpose,<br />\ndo what you like doing best and let the world pay you for it.<br />\n<br />\nYou don&rsquo;t need to be the tallest, nor the heaviest, the biggest, the longest or the largest to impact the world.<br />\nYou are a leader, and you can lead in your gifted area. I would like to quote a well-known verse in the Bible,<br />\nProverbs 18:16 that says: &ldquo;A man&rsquo;s gift opens doors for him and brings him before great men.&rdquo;<br />\nIt&rsquo;s time to use your gifts and talents and let them serve you. The only thing you need is a leadership&rsquo;s attitude;<br />\nYour attitude makes you different from everybody else.<br />\nLook at the lion, is not the heaviest, not the smartest animal in the jungle,<br />\nbut when he shows up every animal on its territory straighten up.<br />\nThe lion keeps on being the king of the jungle, because of his enormous attitude.<br />\nYou need to change your belief system it defines who you are;<br />\nYou cannot become more than you think you are, your belief system is what determined your attitude.<br />\nThe elephant is bigger, heavier, smarter, more powerful and larger but yet when he sees the lion, he runs.<br />\nChange will start happening when you start working on your thinking;<br />\nRemember start acting the way you think, and you will see success coming your way!<br />\nContainers of blessings and prosperities will be delivered to your house.<br />\nYou can start today, by redesigning your belief system.</p>\n</div>\n</div>\n</div>\n', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-20 23:44:25', '2020-07-20 23:44:25'),
(17, 10, 'en', 'graphex-vision', 'Graphex Vision', 'Graphex Vision', 'Graphex Vision', '', 'default.xml', 'default.tpl', '<div class="firstImageVision"><img src="/web/files/banners/en/1_vision.jpg" /></div>\n\n<div class="secondDivVision textFontColorGlobal">Graphex Global vision is to end poverty by decreasing the unemployment rate, so people everywhere in the world can live a decent life. Create a platform where they completely independent. They can work at home, while traveling, while sitting in the beach, even while taking care of their children at home. Our goal is to increase and promote lasting family bounding, decrease massive migration, and diminish extreme poverty due to lack of jobs.</div>\n\n<div class="row">\n<div class="col-md-6"><img src="/web/files/pictures/2_vision.jpg" style="width:100%" /></div>\n\n<div class="col-md-6 textFontColorGlobal">\n<p>We believe the fight against poverty in the world it&rsquo;s not only about charity, but create an environment where they can be linked, empowered, inspired and transformed should on top of the list. Giving them the opportunity to work and provide for themselves, is our main priority at Graphex.</p>\n</div>\n</div>\n\n<div class="marginOnVision">\n<h2>Why Graphex?</h2>\n\n<div class="classWhyGraphex row">\n<div class="col-md-6">\n<div class="divWhyGraphexColgloabl">\n<div class="icon-onVisionPage"><img src="/web/pictures/3.jpg" /></div>\n\n<h5>Make money in minutes</h5>\n\n<div class="textVisionGraphex">You get paid for the service right after you complete the job,<br />\nplus tips and other commisions<br />\nand you are in control of how much you want to make.</div>\n</div>\n</div>\n\n<div class="col-md-6">\n<div class="divWhyGraphexColgloabl">\n<div class="icon-onVisionPage"><img src="/web/pictures/1.jpg" /></div>\n\n<h5>Be an agnet of change</h5>\n\n<div class="textVisionGraphex">We believe the fight against poverty in the world it&rsquo;s not only about charity, but create an environment where they can be linked, empowered, inspired and transformed should on top of the list. Giving them the opportunity to work and provide for themselves, is our main priority at Graphex.</div>\n</div>\n</div>\n</div>\n\n<div class="row" style="border-bottom:1px solid black">\n<div class="col-md-12">\n<div class="divWhyGraphexColgloabl">\n<div class="icon-onVisionPage"><img src="/web/pictures/1.jpg" /></div>\n\n<h5>Be an agnet of change</h5>\n\n<div class="textVisionGraphex">We believe the fight against poverty in the world it&rsquo;s not only about charity, but create an environment where they can be linked, empowered, inspired and transformed should on top of the list. Giving them the opportunity to work and provide for themselves, is our main priority at Graphex.</div>\n</div>\n</div>\n</div>\n</div>\n\n<div class="marginOnVision"><img src="/web/files/pictures/3_vision.jpg" style="width:100%" /></div>\n', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 00:27:21', '2020-07-21 00:27:21'),
(18, 11, 'en', 'carrier-center', 'Carrier Center', 'Carirer Center', 'Carrier Center', '', 'default.xml', 'default.tpl', '<div style="color:#222222">\n<div><img src="/web/files/banners/en/career-center.jpg" style="height:100%; width:100%" /></div>\n\n<div>\n<h4>Equal Opportunity Employer</h4>\n\n<p>Graphex is an Equal Opportunity Employer. We are committed to inclusion and diversity.<br />\nWe proudly promote employment and advancement opportunities to all qualified candidates.<br />\nWe do not discriminate based upon race, religion, color, national origin, gender (including pregnancy, childbirth, or related medical condition), sexual orientation, gender identity, gender expression, age, status as a protected veteran, status as an individual with a disability, or other applicable legally protected characteristics.<br />\n&nbsp;</p>\n\n<h4>Commitment to Diversity</h4>\n\n<p>Graphex is devoted in promoting and embracing diverse and inclusive culture possible;<br />\nOur community is made up of Freelancers and Businesses from several countries around the world, and we believe the ability to provide a platform and or marketplace that empowers them and serves their diverse needs starts with employees.<br />\nDiversity, Presence, and Belonging is critical to the achievement of our Business and our capability to further our mission of creating economic opportunities to better lives globally.<br />\nWe make a rigorous effort to ensure these efforts are intertwined throughout everything we do, both internally and externally, in order to do our part in making meaningful strides towards equality.<br />\n&nbsp;</p>\n\n<h4>Graphex&rsquo;s Culture</h4>\n\n<p>Graphex culture revolves around our mission statement, and our core values of innovation and strong performance reflecting high-quality services.<br />\nWe set our visions high and believe that attitude and customer service is essential to our mission and growth.<br />\n&nbsp;</p>\n</div>\n{*====================================== Second Page ==============================*}\n\n<div>\n<h4>How can Users Growth on Graphex&rsquo;s Platform and or Marketplace?</h4>\n\n<p style="margin-left:20px">a. To get more projects and or job, tailor your portfolio to showcase your skills and ensure that it is well done, pick up more engagements and or assignments to gain more experience and level up on Graphex.<br />\nb. There are three ranks on Graphex, Level I (beginner), Level II (intermediate) and Level III (expert); The more you work (engagement / Assignment), the faster you will increase your ranking. You&rsquo;re able to set higher pricing in relation to your expertise.<br />\nc. Remember your portfolio is your way of advertising your skills and your services.So always put your best work in your portfolio reflecting your professionalism and experiences.<br />\nd. To get good rating, you must render an impeccable service to your client,in a timely fashion with professionalism and customer service friendly.<br />\n&nbsp;</p>\n\n<div class="row">\n<div class="col-md-4">\n<h4>Continuing Education</h4>\n\n<p>a. Graphex Academy is another dimension on Graphex where you can be empowered by acquiring skills to enhance, or complement your expertise, and keeping up to date with current trend in your area of expertise. We will be hosting webinars, in-services and other types of educational materials to help you stay at the top of your field;some will be courtesy of Graphex Technology while others will available for a fee.</p>\n\n<h4>How is Graphex growing?</h4>\n\n<p>a. Graphex Technology is growing rapidly with our Headquarters in New York; and multiple locations throughout the world which are: California, Canada, Haiti, Dominican Republic, Brazil, Chili, China, India, Pakistan, Nigeria and England. We are in 2 locations in the USA and 11 countries; Soon we will be hiring for above locations and for more location across the globe.<br />\n&nbsp;</p>\n</div>\n\n<div class="col-md-8" style="text-align:right"><img src="/web/files/pictures/career-center-middle.jpg" style="height:100%; width:100%" /></div>\n</div>\n\n<div>\n<p>Growth is inevitable when you strive at improving yourself, achieving your goals and gearing toward success. ~Eve Baudin Retreating in your comfort zone is inviting stagnation in your realm. ~Eve Baudin</p>\n</div>\n{*============================== Third Page ======================================*}\n\n<div>\n<h4>Graphex on the terrestrial map</h4>\n<img src="/web/files/pictures/career-center-bottom.jpg" style="display:block; margin:0 auto; max-width:100%" />\n<h5 style="text-align:center"><span class="classSpanCareerCenter">Graphex Location</span></h5>\n\n<div class="row">\n<div class="col-md-3" style="padding:20px"><img src="/web/files/pictures/new-york.jpg" style="height:100%; width:100%" /> <span class="spanPisitionCareer"> New York </span></div>\n\n<div class="col-md-3" style="padding:20px"><img src="/web/files/pictures/california.jpg" style="height:100%; width:100%" /> <span class="spanPisitionCareer"> California </span></div>\n\n<div class="col-md-3" style="padding:20px"><img src="/web/files/pictures/haiti.jpg" style="height:100%; width:100%" /> <span class="spanPisitionCareer"> Haiti </span></div>\n\n<div class="col-md-3" style="padding:20px"><img src="/web/files/pictures/canada.jpg" style="height:100%; width:100%" /> <span class="spanPisitionCareer"> Canada </span></div>\n\n<div class="col-md-3" style="padding:20px"><img src="/web/files/pictures/nigeria.jpg" style="height:100%; width:100%" /> <span class="spanPisitionCareer"> Nigeria </span></div>\n\n<div class="col-md-3" style="padding:20px"><img src="/web/files/pictures/london.jpg" style="height:100%; width:100%" /> <span class="spanPisitionCareer"> London </span></div>\n\n<div class="col-md-3" style="padding:20px"><img src="/web/files/pictures/india.jpg" style="height:100%; width:100%" /> <span class="spanPisitionCareer"> India </span></div>\n\n<div class="col-md-3" style="padding:20px"><img src="/web/files/pictures/china.jpg" style="height:100%; width:100%" /> <span class="spanPisitionCareer"> China </span></div>\n\n<div class="col-md-3" style="padding:20px"><img src="/web/files/pictures/pakistan.jpg" style="height:100%; width:100%" /> <span class="spanPisitionCareer">Pakistan </span></div>\n\n<div class="col-md-3" style="padding:20px"><img src="/web/files/pictures/dominican.jpg" style="height:100%; width:100%" /> <span class="spanPisitionCareer"> Dominican public </span></div>\n\n<div class="col-md-3" style="padding:20px"><img src="/web/files/pictures/brazil.jpg" style="height:100%; width:100%" /> <span class="spanPisitionCareer"> Brazil </span></div>\n</div>\n</div>\n</div>\n</div>\n', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 00:28:33', '2020-07-21 00:28:33'),
(19, 12, 'en', 'news-and-statistics', 'News and Statistics', 'News and Statistics', 'News and Statistics', '', 'default.xml', 'default.tpl', '<div style="height: 400px;">\n                        <img src="/web/pictures/news-and-statics.jpg" style="height: 100%;width: 100%;">\n                    </div>\n\n\n<h1 style="color:red">kjdhfkjdshfkjdhsgkjfhgkjjdfhgkjdfhgkdfhjkdfhgkjdf</h1>\n<a href="/lien1">lien1</a>\n<ul>\n<li>item1\n</li>\n</ul>', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 00:32:15', '2020-07-21 00:32:15'),
(20, 13, 'en', '/events/calendar', 'Event Calendar', 'Event Calendar', 'Event Calendar', 'Event Calendar', 'default.xml', 'default.tpl', 'Event Calendar', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 00:41:51', '2020-07-21 00:41:51');
INSERT INTO `t_site_cms_page_i18n` (`id`, `page_id`, `lang`, `url`, `meta_title`, `meta_description`, `meta_keywords`, `meta_robots`, `layout`, `template`, `content`, `in_menu`, `is_sitemap`, `is_cached`, `is_active`, `start_at`, `expired_at`, `created_at`, `updated_at`) VALUES
(21, 14, 'en', 'terms-and-conditions', 'Terms and Conditions', 'Terms and Conditions', 'Terms and Conditions', '', 'default.xml', 'default.tpl', '<div style="margin-top: 30px;">\n                        <h5 style="display: inline-block;">Graphex Technology</h5> is a platform that connects professionals, technicians, certified skills workers with businesses and the communities around the world to provide business technology solutions clients to develop the full potential of their enterprises.<br />\n                        Graphex has a wide array of experts their main focus is to increase the presence of your business online, enhance faster operational efficiency, collaborate and meet new clients everyday. Building this platform, it&rsquo;s a dream comes true in a willingness to link people all around the world, make everyone become their own boss, and reinvent themselves by using their skills and ability to sell services to right in the comfort in their home.<br />\n                        We believe that, every human on earth carries a seed of business, they were born to lead and be successful in their areas of gifting. Graphex is aiming to helping businesses and organizations become more efficient, profitable, and competitive on the market.<br />\n                        <br />\n                        THE FOLLOWING TERMS AND CONDITIONS APPLY IF YOU ARE ACCESSING GRAPHEX TECHNOLOGY SERVICES. (AS THOSE TERMS ARE DEFINED BELOW): WELCOME TO GRAPHEX TECHNOLOGY, AN E-COMMERCE SOLUTION THAT ALLOWS BUSINEES OWNERS, FREELANCERS (Sellers), AND EMPLOYERS TO OFFER WEBSITES SERVICES, GRAPHIC DESIGNS, WEBSITE DESIGNS, WRITING AND TRANSLATIONS, DATA SCIENCE, FREELANCING SERVICES.<br />\n                        BEFORE YOU, A SELLER OR BUYER, ACCESS THE APP OR SERVICES (AS SUCH TERMS ARE DEFINED BELOW), PLEASE CAREFULLY REVIEW ALL TERMS AND CONDITIONS IN THESE TERMS OF USE (&ldquo;TERMS&rdquo;) AND BE SURE YOU UNDERSTAND THEM.<br />\n                        THESE TERMS CONSTITUTE A LEGAL AGREEMENT BETWEEN GRAPHEX TECHNOLOGY LLC (&ldquo;GRAPHEX&rdquo;, &ldquo;WE&rdquo;, AND/OR &ldquo;US&rdquo;) AND YOU AND/OR THE ENTITY YOU REPRESENT (&ldquo;SELLER OR BUYER&rdquo; AND/OR &ldquo;YOU&rdquo;) WHICH GOVERNS YOUR USE OF OUR SERVICES; FOR CLARITY, THESE TERMS ARE AN AGREEMENT BETWEEN YOU AND GRAPHEX ONLY, AND NOT BETWEEN YOU AND ANY OF GRAPHEX&rsquo;S LICENSORS, VENDORS, FREELANCERS, CONTRACTORS OR SUPPLIERS, INCLUDING WITHOUT LIMITATION GRAPHEX ACADEMY.<br />\n                        YOUR USE OF THE SERVICES IS EXPRESSLY CONDITIONED UPON YOUR ASSENT TO THESE TERMS, INCLUDING ANY UPDATES, TO THE EXCLUSION OF ALL OTHER TERMS. BY CHOOSING &ldquo;I ACCEPT&rdquo;, OR DOWNLOADING, ACCESSING, OR USING THE SERVICES IN ANY MANNER, OR CONTINUING TO USE THE SERVICES AFTER ANY UPDATES (I) YOU AGREE THAT YOU HAVE READ THESE TERMS, THAT YOU UNDERSTAND THEM, AND THAT YOU AGREE TO BE LEGALLY BOUND BY THEM, AND (II) IF YOU ARE ENTERING THESE TERMS ON BEHALF OF AN ENTITY, YOU REPRESENT AND WARRANT THAT YOU ARE AUTHORIZED TO BIND SUCH ENTITY.<br />\n                        Subject to the terms and conditions of these Terms, GRAPHEX, its affiliates, contractors and/or agents will use commercially reasonable efforts to, in connection with sales made through the Seller platform, coordinate order processing, customer service and web and sales analytics through the Graphex application software product (the &ldquo;App&rdquo;) available on the App Store.<br />\n                        The Services and these Terms may be altered or modified from time to time in Graphex&rsquo;s sole discretion, except that if we alter or modify these Terms, we will bring it to your attention by updating the Terms on the Graphex App Store, by sending you an email, and/or by some other means.<br />\n                        Access to the Services may require Seller or Buyer to install certain software applications and/or access other software services operated or provided by third parties (&ldquo;Third Party Services&rdquo;).<br />\n                        Graphex is not responsible for the operation of any Third Party Services nor the availability or operation of the Services to the extent such availability and operation is dependent upon Third Party Services.<br />\n                        Seller is solely responsible for procuring any and all rights necessary for it to access Third Party Services and for complying with any applicable terms or conditions thereof. Graphex does not make any representations or warranties with respect to Third Party Services or any third party providers. Any exchange of data or other interaction between Seller and a third party provider is solely between Seller and such third party provider and is governed by such third party&rsquo;s terms and conditions.<br />\n                        Seller acknowledges and agrees that Graphex has the right to remove any content, including Seller Content (as defined below) or Product from the Services at any time, for any reason (including, but not limited to, upon receipt of threats, claims or allegations relating to such content or Product). Graphex is also free to suspend access to your use of the Services or your account, for any reason, in our reasonable discretion.\n                        <h4><span style="border-bottom: 3px solid black;">LICENSE</span></h4>\n                        Subject to the terms and conditions of these Terms (including, without limitation, the restrictions set forth in Section 4 below), Graphex hereby grants Seller a limited, non-sublicensable, non-transferable, non-exclusive license to access and use the Services in accordance with the terms of these Terms. This license will terminate automatically upon termination of these Terms.\n\n                        <h4><span style="border-bottom: 3px solid black;">INTELLECTUAL PROPERTY</span></h4>\n                        Seller acknowledges and agrees that Graphex owns all right, title and interest (including proprietary and intellectual property rights and all other rights of any sort throughout the world) relating to any and all inventions, works of authorship, artistry, designations, designs, the &ldquo;look and feel,&rdquo; know how, ideas, programs and information in connection with the Services (including without limitation the App) and all derivatives, modifications, upgrades, or versions thereof and Graphex&rsquo;s name, trademark, and logo of Graphex. Seller acknowledges that, except for the limited license expressly granted in these Terms, Seller has not acquired and will not acquire any right, title or interest in the Services or the Graphex&rsquo;s products or any intellectual property relating to any of the foregoing.<br />\n                        Graphex acknowledges and agrees that Seller retains all right, title and interest in and to Seller&rsquo;s name, intellectual property and logo all unique content, including without limitation images, artwork, and designs created or provided by Seller on the Seller&rsquo;s account. Seller hereby grants Graphex and its successors a worldwide, non-exclusive, royalty-free, sublicensable license to use, display, reproduce and distribute the Seller products and Seller Content:<br />\n                        <ul style="{*list-style-type: none;*}color: #222;font-weight: bold;list-style: disclosure-closed;">\n                            <li>\n                                1. For the purposes of these Terms, including for the purpose of fulfilling Graphex&rsquo;s obligation of providing the Services.\n                            </li>\n                            <li>\n                                2. As reasonably necessary to publicize the parties&rsquo; relationship and Seller&rsquo;s use of the Services.\n                            </li>\n                        </ul>\n                        \n                        To the extent generally available through the Services, Graphexwill provide Seller access to customer data, such as name, address, email, and order history, for customers who purchase Seller&rsquo;s Products. Seller represents and warrants that its use of Customer Data will at all times comply with all applicable law and regulations, as well as the privacy policy applicable to it at the time of collection.\n                        <h4><span style="border-bottom: 3px solid black;">SELLER RESPONSIBILITIES</span></h4>\n                        Seller will upload Seller Content in an acceptable format to Graphex&rsquo;s discretion, may include: png,eps,svg, jpg, jpeg, and gif formats of at least 300 dpi depends of the project) and comply with all other technical requirements for the Seller Content, all as determined by Graphex in its discretion.<br />\n                        Seller will integrate the App and display content provided through the App on the Seller&rsquo;s account by installing the App and connecting it to the Seller account, or by following other instructions which may be provided by Graphex from time to time.<br />\n                        Seller will not, and will not permit anyone else to, directly or indirectly:<br />\n                        <ul style="{*list-style-type: none;*}color: #222;font-weight: bold;list-style: disclosure-closed;">\n                            <li>\n                                1. reverse engineer, decompile, disassemble or otherwise attempt to discover the source code, object code or underlying structure, ideas, data or algorithms of any part of the Services (except to the extent such restriction is prohibited by applicable law);\n                            </li>\n                            <li>\n                                2. copy, modify, translate, or create derivative works based on the Services;\n                            </li>\n                            <li>\n                                3. rent, sell, lease, distribute, provide on a service bureau basis or otherwise use the Services for the benefit of any third party;\n                            </li>\n                            <li>\n                                4. remove or otherwise alter any proprietary notices or labels from the Services or any portion thereof;\n                            </li>\n                            <li>\n                                5. use or refer to the Services or any portion thereof for benchmarking or to research, build, or modify a product or service competitive with the Services; or 6. or use the Services other than in accordance with these Terms and in compliance with all applicable laws and regulations. Seller is responsible for all of Seller&rsquo;s activity in connection with the Services.\n                            </li>\n                        </ul>\n                        \n                        Seller acknowledges and agrees that the terms of sale available here (as updated by Graphex from time to time) will apply to any purchase through the Seller Account, and Seller will comply with its obligations set forth in such terms and will not modify or obscure such terms or otherwise take any action that would impede the effectiveness of such terms.<br />\n                        Seller acknowledges and agrees that the privacy policy available here (as updated by Graphex from time to time) will apply to the Seller Account and Seller will comply with its obligations set forth in such policy and will not modify or obscure such policy or otherwise take any action that would impede the effectiveness of such policy. Seller agrees to only use data obtained from users of the Seller Account (including, without limitation, any Customer Data) as expressly allowed by such privacy policy and applicable law.<br />\n                        Seller acknowledges and agrees that it will conduct itself at all times in such a manner as not to engage in conduct that is generally viewed by the public as offensive, reprehensible, illegal, vulgar, or that otherwise impairs or diminishes or is reasonably likely to impair or diminish the reputation of Graphex.<br />\n                        You may be required to sign up for an account in connection with the App and Services and select a password and user name (&ldquo;Graphex User ID&rdquo;). You promise to provide us with accurate, complete, and updated registration information about yourself. You may not select as your Graphex User ID a name that you don&rsquo;t have the right to use, or another person&rsquo;s name with the intent to impersonate that person. You may not transfer your account to anyone else without our prior written permission. You will not share your account or password with anyone, and you must protect the security of your account and your password. You&rsquo;re responsible for any activity associated with your account.\n                        <h4><span style="border-bottom: 3px solid black;">CONFIDENTIALITY</span></h4>\n                        Seller agrees that all code, inventions, algorithms, know-how and ideas and all other proprietary business and technical information obtained from Graphex is the confidential property of the Graphex (&ldquo;Confidential Information&rsquo;&rsquo;).<br />\n                        Except as allowed herein, during the term of these Terms and after any termination hereof, Seller will hold in confidence and not use or disclose any Confidential Information and will be responsible for any use or disclosure of such Confidential Information by its employees, agents, and contractors. Confidential Information will not include information Seller can document:<br />\n                        1. is or has become readily publicly available without restriction through no fault of the Seller or its employees, agents or contractors;<br />\n                        2.is received without restriction from a third party lawfully in possession of such information and lawfully empowered to disclose such information;<br />\n                        3. was rightfully in the possession of Seller without restriction prior to its disclosure by Graphex;<br />\n                        4. was independently developed by Seller employees or consultants without use of or reference to the Confidential Information.<br />\n                        If required by law or court order, Seller may disclose Confidential Information provided that Seller provides prior notice to Graphex of any such intended disclosure (to the extent permitted by law), uses reasonable efforts to limit such disclosure and to obtain confidential treatment of or a protective order governing any such disclosure, and allows Graphex to participate in the proceedings.\n                        <h4><span style="border-bottom: 3px solid black;">REPRESENTATIONS AND WARRANTIES; WARRANTY DISCLAIMER</span></h4>\n                        Seller represents and warrants that:<br />\n                        1. Seller owns, controls, or has all licenses, rights, consents and permissions necessary to use and authorize Graphex and its agents, contractors and service providers to use the Seller Content and Seller products;<br />\n                        2. neither the Seller products the Seller Content, nor performance of these Terms by either party will infringe, misappropriate or violate any intellectual property rights or other rights or agreements;<br />\n                        3. neither the Seller products nor the Seller Content contain anything that defames, libels or otherwise injures or interferes with the privacy or publicity rights of any third party or anything that is obscene, pornographic, abusive, offensive or otherwise violates any law or right of any third party;<br />\n                        4. no part of the Seller products, the Seller Content, or these Terms (or their performance) will require payment of any kind to any third party;<br />\n                        5. Seller will not (and will not permit anyone else to) upload, download, post, submit or otherwise distribute or facilitate distribution of any content or software through the Services that is able to disrupt, damage or interfere with the proper function of any software, hardware, or telecommunications equipment, system, data or other information; circumvent or manipulate Graphex&rsquo;s fee structure or the billing process; impose an unreasonable or disproportionately large load on Graphex&rsquo;s (or its third party providers&rsquo;) infrastructure; or interfere or attempt to interfere with the proper working of the Services or any activities conducted on or through the Services;<br />\n                        6. Seller&rsquo;s use of the Services will comply with all applicable law.<br />\n                        ALL SERVICES PROVIDED BY GRAPHEX AND/OR ITS AGENTS, VENDORS, PARTNERS, CONTRACTORS AND SUPPLIERS ARE PROVIDED &ldquo;AS IS&rdquo; AND WITHOUT WARRANTIES OF ANY KIND EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, WARRANTIES OF ACCURACY, RELIABILITY, TIMELINESS, MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR WARRANTIES ARISING OUT OF COURSE OF DEALING, COURSE OF PERFORMANCE OR USAGE OF TRADE.\n                        <h4><span style="border-bottom: 3px solid black;">FEES AND PAYMENT</span></h4>\n                        Platform Fee: By accepting these Terms, you confirm that you will automatically be charged a one-time payment to the service requested or a fee associated with the Services through your Payment.\n\n                        <h4><span style="border-bottom: 3px solid black;">PRODUCTS FEES</span></h4>\n                        For each service sold through Seller&rsquo;s account, buyer will pay Graphex the applicable service fee, as listed on Graphex&rsquo;s terms and conditions. Buyer will pay such service Fees in accordance with the then-current applicable payment terms buyer has selected through the Services. through Buyers&rsquo;s selected method of payment. Buyer agrees to make payment in accordance with its Payment Terms and hereby authorizes Graphex to charge Buyer&rsquo;s Payment Method in accordance therewith. Graphex is not responsible for any error by any payment providers associated with Buyer&rsquo;s Payment Method. Graphex may update the Product Fees from time to time.<br />\n                        BUYER MUST PROVIDE CURRENT, COMPLETE AND ACCURATE INFORMATION FOR BUYER&rsquo;S PAYMENT METHOD AND BILLING ACCOUNT. SELLER MUST PROMPTLY UPDATE ALL INFORMATION TO KEEP ITS PAYMENT METHOD AND BILLING ACCOUNT CURRENT, COMPLETE AND ACCURATE (SUCH AS A CHANGE IN BILLING ADDRESS, CREDIT CARD NUMBER, OR CREDIT CARD EXPIRATION DATE IF THE CARDS WERE SAVED AS A DEFAULT METHOD OF PAYMENT).<br />\n                        Buyer will pay Graphex any development, service and other fees which Graphex may introduce from time to time. Upon the introduction of new fees, Graphex will notify Buyer through the Services. If Buyer does not consent to the new fees, then Buyer must cease use of the Services or follow the instructions provided by Graphex in the applicable notice.\n                        <h4><span style="border-bottom: 3px solid black;">TERMINATION</span></h4>\n                        These Terms may be immediately terminated by either party for any reason upon notice to the other party.\n\n                        <h4><span style="border-bottom: 3px solid black;">RELATIONSHIP OF THE PARTIES</span></h4>\n                        Notwithstanding any provision hereof, for all purposes of these Terms each party will be and act as an independent contractor and not a partner, Business owner, joint venturer, agent, employee or representative of the other and will not bind nor attempt to bind the other to any contract. Buyer is an independent contractor and is solely responsible for all taxes, withholdings, and other statutory or contractual obligations of any sort.\n\n                        <h4><span style="border-bottom: 3px solid black;">INDEMNIFICATION</span></h4>\n                        Seller, at its own expense, will indemnify and hold harmless Graphex, its officers, directors, employees, associates and affiliated corporations against any liabilities, damages and expenses, including, without limitation, reasonable attorneys&rsquo; fees, that are actually paid to an unaffiliated third party resulting from third party claims that arise from or relate to:<br />\n                        1. an actual or claimed violation of any intellectual property and proprietary rights of any person or entity, including without limitation, rights of publicity, by the Seller Content, Seller products, or materials and marketing provided by Seller in connection with these Terms<br />\n                        2. Buyer&rsquo;s payment or failure to pay any taxes relating to the sale of services, or buyer&rsquo;s use of the Services.\n                        <h4><span style="border-bottom: 3px solid black;">LIMITATION OF LIABILITY</span></h4>\n                        GRAPHEX CANNOT GUARANTEE THE IDENTITY OR INFORMATION OF ANY USERS (INCLUDING, BUT NOT LIMITED TO, CUSTOMERS) WITH WHOM SELLER INTERACTS IN THE COURSE OF USING THE SERVICES. SELLER OR BUYER WILL NOT HOLD GRAPHEX RESPONSIBLE FOR ACTIONS OR INACTIONS OF UNAFFILIATED USERS, INCLUDING ANYTHING THEY INDIVIDUALLY OR COLLECTIVELY POST. EXCEPT FOR ANY BREACH OF SECTION OF (CONFIDENTIALITY) OR GRAPHEX&rsquo;S GROSS NEGLIGENCE OR WILLFUL MISCONDUCT, IN NO EVENT WILL GRAPHEX BE LIABLE CONCERNING THE SUBJECT MATTER OF THESE TERMS, REGARDLESS OF THE FORM OF ANY CLAIM OR ACTION (WHETHER IN CONTRACT, NEGLIGENCE, STRICT LIABILITY, TORT OR OTHERWISE), FOR ANY (A) INDIRECT, PUNITIVE, INCIDENTAL, RELIANCE, SPECIAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES INCLUDING, BUT NOT LIMITED TO, LOSS OF BUSINESS, REVENUES, PROFITS AND GOODWILL, (B) DATA LOSS OR COSTS OF PROCUREMENT OF SUBSTITUTE GOODS, SERVICES, TECHNOLOGY, OR RIGHTS, OR (C) DAMAGES, IN THE AGGREGATE, IN EXCESS OF THE AMOUNT OF GROSS REVENUES PAID TO SELLER BY GRAPHEX DURING THE PREVIOUS THREE (3) MONTHS, EVEN IF IT HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.<br />\n                        <h4><span style="border-bottom: 3px solid black;">GENERAL</span></h4>\n                        Governing Law; Arbitration. These Terms will be construed under the laws of the State of New York, without regard to its conflicts of law provisions. Any dispute arising from or relating to the subject matter of these Terms shall be finally settled in Nassau County, New York, in English, in accordance with the Streamlined Arbitration Rules and Procedures of Judicial Arbitration and Mediation Services, Inc. (&quot;JAMS&quot;) then in effect, by one commercial arbitrator with substantial experience in resolving intellectual property and commercial contract disputes, who shall be selected from the appropriate list of JAMS arbitrators in accordance with such Rules. Judgment upon the award rendered by such arbitrator may be entered in any court of competent jurisdiction. Notwithstanding the foregoing obligation to arbitrate disputes, each party shall have the right to pursue injunctive or other equitable relief at any time, from any court of competent jurisdiction. For all purposes of this Agreement, the parties consent to exclusive jurisdiction and venue in the state or federal courts located in, respectively, Nassau County, New York.<br />\n                        No Third-Party Beneficiaries. These Terms is made exclusively for the benefit of the parties hereto and not for the benefit of any third person or entity.<br />\n                        <h4><span style="border-bottom: 3px solid black;">NOTICE</span></h4>\n                        Any notice required or permitted by these Terms to be given to either Party will be deemed to have been duly given if sent (a) by electronic email, with confirmation of successful transmission to support@graphex.netwhen sent by Buyer to Graphex and to the email address provided by buyer to Graphex when sent by Graphex to Seller; or (b) in writing, hand delivered or mailed by first-class, registered or certified mail, postage prepaid and addressed to Legal Department, Graphex at P.O. Box 130157, Springfield Gardens, New York, 11413. when mailed by Buyer to Graphex, and to the address provided by Buyer to Graphex when sent by Graphex to Buyer. A notice will be deemed to be delivered: (x) in the cases of electronic mail and hand delivery, on the date it is actually delivered; and (y) in the case of first-class, registered or certified mail, postage prepaid, on the third (3rd) business day after it is delivered to the U.S. Postal Service. Force Majeure. Neither party nor, its vendors nor their affiliates, subsidiaries, parent corporation or any of their parents&rsquo; affiliates or subsidiaries, will be liable in any way for delay, failure in performance, loss or damage related to or due to or arising out of any of the following force majeure conditions: fire, terrorism, strike, embargo, explosion, power blackout, earthquake, volcanic action, flood, war, water, the elements, labor disputes, civil disturbances, government requirement, civil or military authority, acts of God or public enemy, or other causes beyond its reasonable control, whether or not similar to the foregoing.<br />\n                        Severability. If any term or provision of these Terms will be held to be invalid or unenforceable, the remainder of these Terms will not be affected thereby; and each term and provision hereof will be valid and enforceable to the fullest extent permitted by applicable law.<br />\n                        <h4><span style="border-bottom: 3px solid black;">HEADINGS</span></h4>\n                        The paragraph headings are supplied only for convenience and do not restrict or elaborate on the terms and provisions contained in such paragraphs.<br />\n                        Amendment. Graphex retains the right to modify the Services or the terms of these Terms at any time. Graphex will inform Buyer of any modifications or changes to the Services via the Services or other means. Buyer&rsquo;s use of the Services after receiving such notice will constitute acceptance of such modifications or changes.<br />\n                        Entire Agreement.Graphex and Seller or Buyer acknowledge that these Terms are the complete and exclusive statement between the parties with respect to the Services and supersedes all proposals or prior agreements, oral or written, and all other communications between the parties, relating to the subject matter of these Terms.<br />\n                        Assignment. These Terms will be binding and inure to the benefit of the parties. Seller and Buyer may not assign or otherwise transfer these Terms without Graphex prior written consent. Graphex may freely assign or otherwise transfer these Terms or any of its rights or obligations hereunder. Any purported assignment or delegation, in contravention of these terms, will be null and void.\n                    </div>\n                </div>  ', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 00:47:28', '2020-07-21 00:47:28'),
(22, 15, 'en', 'copywriting', 'Copywriting', 'Copywriting', 'Copywriting', '', 'default.xml', 'default.tpl', '<div style="margin-top:30px"><img src="/web/files/pictures/copyright.jpg" style="width:100%" /></div>\n\n<div class="divCopywritingOut">\n<div>\n<div class="divCopywritingIn">\n<h2>Graphex Copyright Agreement</h2>\n\n<p>Graphex Technology is a platform that contains buyers and sellers.<br />\nThere is a constant transfer of information and a busy traffic of data sharing.<br />\nWe have tones of intellectual documents on the site,<br />\nsome of them belong to the sellers, and the others belong to the buyers.<br />\nAll the data are protected under the Graphex Copyright agreement.<br />\nAll rights reserved to Graphex, No part of the contents may be reproduced,<br />\ndistributed, or transmitted in any form or by any means, including photocopying,<br />\nrecording, or other electronic or mechanical methods,<br />\nwithout the prior written permission of Graphex or the buyer/seller<br />\nUploading the documents, except in the case of brief quotations embodied<br />\nin critical reviews and certain other noncommercial uses permitted by copyright law.<br />\nFor permission requests, Contact us right here on our page, or send it to our mailing address;<br />\naddressed &ldquo;Attention: Graphex Technology Press Department,&rdquo; at the address below.<br />\n<br />\nP.O. Box 130157 Springfield Gardens<br />\nNew York, 11413 You can also submit a complaint at contact@graphex.net</p>\n\n<h2>COPYRIGHT INFRINGEMENT</h2>\n\n<ul>\n<li>Graphex Technology is a platform of millions of users, our team don&rsquo;t check every single document,<br />\naudio, video or any content uploaded on the site.<br />\nShould you have any complaints for copyright violation for any intellectual documents,<br />\nplease file a complaint and be sure to send this information below.</li>\n<li>The document, art, audio, video or link violated.</li>\n<li>Proof of your copyrights ownership, such as the registration number or a copy of the registration certificate.</li>\n<li>An ID mentioning your name or your business name correctly as it is written on the document.</li>\n<li>Your copyright certificate mentioning the policy your document is protected under.</li>\n<li>A statement made under penalty of perjury that the information provided in the notice is accurate<br />\nand that you are the copyright owner or the owner of an exclusive right that is being infringed or<br />\nare authorized to make the complaint on behalf of the copyright owner or<br />\nthe owner of an exclusive right that is being infringed.</li>\n<li>Your signature</li>\n</ul>\n\n<p>For Complaints, Contact us right here on our page, or send it to our mailing address;<br />\naddressed &ldquo;Attention: Graphex Technology Complaint Department,&rdquo; at the address below.<br />\n<br />\nP.O. Box 130157 Springfield Gardens<br />\nNew York, 11413<br />\n<br />\nYou can also submit a complaint at complaint@graphex.net</p>\n\n<h2>Graphex Users</h2>\n\n<p>After 3 complaints against you infringing people&rsquo;s intellectual documents of any types.<br />\nYour account will be suspended to possible complete deletion.</p>\n</div>\n</div>\n</div>', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 00:47:44', '2020-07-21 00:47:44');
INSERT INTO `t_site_cms_page_i18n` (`id`, `page_id`, `lang`, `url`, `meta_title`, `meta_description`, `meta_keywords`, `meta_robots`, `layout`, `template`, `content`, `in_menu`, `is_sitemap`, `is_cached`, `is_active`, `start_at`, `expired_at`, `created_at`, `updated_at`) VALUES
(23, 16, 'en', 'privacy-policy', 'Privacy policy', 'Privacy policy', 'Privacy policy', '', 'default.xml', 'default.tpl', '<div style="text-align:justify">Privacy Policy We have created this privacy statement in order to demonstrate our firm commitment to protectand respect your privacy and personal data and help you understand the information we collect, how we use it and the choices you have.<br />\nWhile in its very nature some of this information may be of a technical nature we haveattempted to present this it as clearly and simply possible.<br />\nAs laws change or are updated or clarified we will always endeavor to do what is necessary tocomply with those laws and so, this policy is subject to change at any time.<br />\nYou areadvised tocheck back on a regular basis for any further updates and alterations.<br />\nFor simplicity we will refer to the website, any mobile versions, APIs or services we provide as&ldquo;the platform&rdquo; and Graphex.net and its owners or operators as &ldquo;us&rdquo;, &ldquo;our&rdquo; or &ldquo;we&rdquo; By using the platform whether that be as a registered user or simply browsing, you areconsenting to the use of your information as laid out in this privacy policy.<br />\nOur use of cookies orsimilar technologies are set out in a separate policy. We ask that you read our privacy policy and ensure that you are happy with our use and sharing of your information. If you are unhappy with or do not agree to any part of the privacy policy you can contact us for any questions or concerns.<br />\nShould you already have an account you must request that your account isterminated. You can do this by contacting support. Our privacy policy only applies to Graphex platform.<br />\nHow do we collect personal information? Information may be collected in a number of ways.<br />\n&nbsp;\n<h4>We can split this into:</h4>\nInformation supplied / volunteered. To simply browse the platform, you don&#39;t need to supply any information but if you wish to doanything more you&#39;ll need to create an account.<br />\nIn order to create and maintain your accountyou need to provide certain information. Some of this is mandatory and some of this isvoluntary.<br />\n&nbsp;\n<h4>Mandatory profile information:</h4>\nTo create an account, you must provide a valid email Address, your first and last name, a profile picture, your location and a user name (does not have to be your real name).<br />\nProfile information: At any time, via your account settings page you may changeor add more information to yourprofile by providing extra publicly available information such as the country and the city where you live, your date of birth, a profile avatar / image (does not have to be an image ofyou), information about you, your portfolio, pictures, videos, links of other websites.<br />\nEtc&hellip;<br />\n&nbsp;\n<h4>Information volunteered by posting:</h4>\nBy uploading files, post comments,replies, take part in groups or discussions, contact other users, favorite, play, downloador report files, posts, users you may provide personal data.<br />\nInformation volunteered by correspondence: You may provide personal informationshould you contact us via email or any other service, either online or offline or use any ofthe web forms on the platform.<br />\n&nbsp;\n<h4>Information from third parties:</h4>\nYou may provide personal information in the event thatwe allow users to link accounts from third party services such as Facebook or twitter. Thisinformation would be based on their privacy policies and your settings with those servicesso be sure to check what those are too.<br />\n&nbsp;\n<h4>Information automatically logged:</h4>\nAs with all web sites and services when using the platform some information is created andlogged automatically.<br />\n&nbsp;\n<h4>That includes but is not limited to:</h4>\nthe IP address (Internet protocol) of the device you are using to access the platformyour browser type, browser version and operating system, the type of device that you are using to access the platform (mac / pc / mobile etc.)<br />\nthe date and time you accessed the platform or made updates or editsthe search terms of any searches you may have doneinteractions you have performed while using the platform.<br />\nFor example, uploading,downloading, deleting, editing or playing files, viewing, posting, editing or replying to posts or discussions, searching for content, updating your profile or preferencesthe page that you visited and or refereed you to the platform prior to your visit andsearches you may have performed to find the platforminformation collected by the use of cookies.<br />\nSharing information The information we collect is used in the following ways and is done so based on us having alegitimate interest in doing so in order to provide, maintain and secure the platform.<br />\n&nbsp;\n<h4>Your interaction with and use of the platform :</h4>\n\n<ul>\n	<li>To provide you with products and services</li>\n	<li>To enable us to develop and improve the platform</li>\n	<li>To help us manage requests and support you when you contact us</li>\n	<li>To notify you about any changes if necessary</li>\n	<li>To send notifications of interactions on your files or responses to conversations withinforums etc.</li>\n	<li>To provide stats and reports to you and other users</li>\n	<li>To send notifications or messages from other users</li>\n	<li>To send notifications to enable you to administer your accounts</li>\n	<li>To enable age restriction</li>\n	<li>To identify you and the content and contributions you submit to the platform</li>\n	<li>To provide you with content relevant to your searches or preferences Maintaining, optimizing, securing the platform</li>\n	<li>To help us to identify you and the accounts you have</li>\n	<li>To better understand, manage and optimize the platform in order to improve and customize it to your needs</li>\n	<li>To detect, prevent or take action on fraud, spam or activities that are or could be in breachof our terms and conditions or guidelines</li>\n	<li>To discover and fix any issues or problems Targeted content, advertising To tailor content to your needs or requests to provide content relevant to your preferences or actionsto show you ads on behalf of any sponsors or advertisers in the case of in house ads.</li>\n</ul>\nIn some cases, we may need to share information collected.<br />\nFor example: Other users / visitors: As this is a community driven platform and content posted is inthe public realm any images, audio files, videos, comments, forum posts and any othercontent you provide or post is done so voluntarily in the knowledge that it will be availablepublicly to both registered and none registered users.<br />\nWe simply process this data onyour behalf as per our terms and conditions.<br />\nWe do not disclose your email address or IP address to other users and advise that you donot post personal information publicly.<br />\nWe cannot however prevent you from doing this and so, you do so, against our wishes and at your own risk.<br />\nOther users may also see information regarding your interaction with theirs or other userscontent such as downloads, plays, favorites or comments along with your online statusand last seen times.<br />\n&nbsp;\n<h4>Service providers:</h4>\nWe may need to pass your personal data to certain reputablethird parties in order to provide services on our behalf such as processing payments orhosting. Where possible these service providers should have put in placemeasures to ensure the security of your data.<br />\nWith consent: We may share your information with your consent.<br />\nFor legal reasons / to protect ours or others interests:<br />\nWe may pass your personal datawhere we are under obligation to do so for legal reasons or to protect the safety, securityor rights of ourselves or that of others.<br />\nAggregated data: We may aggregate data in order to create statistical reports andinformation.<br />\nThis information would not include any information that could be used toidentity an individual and may be shared with third parties or publicly. For example, to showvisitor numbers or trends.<br />\nAdvertisers or sponsors may use techniques to track the effectiveness of ads or campaigns andto ensure that ads are delivered effectively.<br />\nSee our terms and conditions. Retention Periods Your personal data is retained for the duration or your account.<br />\nIn some cases, we may keepinformation longer and, in these cases,, it may be in an anonymized form or in a way that nolonger links it to an individual. Your rights, choices and control of your information Dependent on your location you have certain rights regards your personal information and canchoose how we collect and use it.<br />\nInformation supplied / volunteered Should you choose to create an account you can manage the information you provide in anumber of waysvia your account settings page you can:<br />\n&bull; Manage your email address, user name, location and date of birth<br />\n&bull; Manage your avatar<br />\n&bull; Manage your profile description, items where you give information about the hardware/software you use, your musical tastes etc.and any outbound links<br />\n&bull; Manage your preferences for being contacted by other users<br />\n&bull; Manage your preferences for being notified of comments or replies to your uploads, forumposts etc.<br />\n&bull; Request your account be terminated via the admin / delete pages for your uploads you can upload, edit or delete pictures, videos,<br />\nloops, tracks or documents associated information Terminating your account You may request your account be terminated at any time either via your account settings pageor by contacting support.<br />\nTo prove your ownership of an account you would need to log in andcontact us directly. Should you no longer have access to your account you may contact us byother methods and we will endeavor to resolve the situation.<br />\nShould you request that your account is terminated your data will be deleted and may never berecoverable.<br />\nYou should remember to backup any information you prefer to keep. Account deletion may not be instant but will be done within a reasonable time frame. We may need toretain some data either for legal reasons or where we have a legitimate reason for doing so.<br />\nEven in the case that your account is terminated there is every chance that your information willstill appear on search engines and external sites.<br />\nThis is out of our control. Your account information may still be kept in the form or backups or server logs until such a time that those backups or server logs become obsoleteor replaced. Dependent on your location you may contact us in order to:<br />\n&bull; Ask to have your information updated or corrected if for some reason you are unable to doit yourself via your account settings page<br />\n&bull; Request that we provide your information in a commonly used electronic formatrequest that we erase or restrict our use of your information<br />\n&bull; Object to our use of your information in certain circumstances.<br />\n&nbsp;\n<h4>Note:</h4>\nsome choices or changes you make could prevent us from providing the platform to you.<br />\nExternal Links Our site contains links to other sites.<br />\nWe are not responsible for the privacy practices or thecontent of such web sites.<br />\nAge Restrictions / Children Unfortunately for legal reasons anyone below the age of 13 is not allowed to use the platformand we kindly ask that anyone below that age refrains from attempting to create an account or passing any personal information to us.<br />\nWe don&rsquo;t knowingly process any personal information ofanyone below the age of 13 and should it be bought to our attention that this is or has beendone we will remove or anonymize this information as swiftly as possible.<br />\nLiability We have appropriate security measures in place in our physical facilities to protect against theloss, misuse or alteration of information that we have collected from users of the platform.<br />\nData breaches Should there be an instance where data security is breached we will, where necessary, takesteps to inform users in a timely fashion. Contact us if you are still looking for more When using the platform, you may find links of other sites, apps or services etc.<br />\nWe are not responsible for those services, their practices ortheir policies and we encourage you to review them accordingly.<br />\nHow do we collect personal information? Information may be collected in a number of ways. We can split this into: Information supplied / volunteered.<br />\nTo simply browse the platform, you don&#39;t need to supply any information but if you wish to doanything more you&#39;ll need to create an account.<br />\nIn order to create and maintain your accountyou need to provide certain information.<br />\nSome of this is mandatory and some of this isvoluntary.<br />\n&nbsp;\n<h4>Mandatory profile information:</h4>\nTo create an account, you must provide a valid email Address, your first and last name, a profile picture, your location and a user name (does not have to be your real name).<br />\n&nbsp;\n<h4>Profile information:</h4>\nAt any time, via your account settings page you may changeor add more information to yourprofile by providing extra publicly available information such as the country and the city where you live, your date of birth, a profile avatar / image (does not have to be an image ofyou),<br />\ninformation about you, your portfolio, pictures, videos, links of other websites. Etc&hellip;<br />\nInformation volunteered by posting: By uploading files, post comments,replies, take part in groups or discussions, contact other users, favorite, play, downloador report files, posts, users you may provide personal data.<br />\n&nbsp;\n<h4>Information volunteered by correspondence:</h4>\nYou may provide personal informationshould you contact us via email or any other service, either online or offline or use any ofthe web forms on the platform.<br />\n&nbsp;\n<h4>Information from third parties:</h4>\nYou may provide personal information in the event thatwe allow users to link accounts from third party services such as Facebook or twitter.<br />\nThisinformation would be based on their privacy policies and your settings with those servicesso be sure to check what those are too.<br />\n&nbsp;\n<h4>Information automatically logged:</h4>\nAs with all web sites and services when using the platform some information is created andlogged automatically.<br />\nThat includes but is not limited to: the IP address (Internet protocol) of the device you are using to access the platformyour browser type, browser version and operating system, the type of device that you are using to access the platform (mac / pc / mobile etc.)<br />\nthe date and time you accessed the platform or made updates or editsthe search terms of any searches you may have doneinteractions you have performed while using the platform. For example, uploading,downloading, deleting, editing or playing files, viewing, posting, editing or replying to posts or discussions, searching for content, updating your profile or preferencesthe page that you visited and or refereed you to the platform prior to your visit andsearches you may have performed to find the platforminformation collected by the use of cookies.<br />\nSharing information The information we collect is used in the following ways and is done so based on us having alegitimate interest in doing so in order to provide, maintain and secure the platform.<br />\nYour interaction with and use of the platform<br />\n&bull; To provide you with products and services<br />\n&bull; To enable us to develop and improve the platform<br />\n&bull; To help us manage requests and support you when you contact us<br />\n&bull; To notify you about any changes if necessary<br />\n&bull; To send notifications of interactions on your files or responses to conversations withinforums etc.<br />\n&bull; To provide stats and reports to you and other users<br />\n&bull; To send notifications or messages from other users<br />\n&bull; To send notifications to enable you to administer your accounts<br />\n&bull; To enable age restriction<br />\n&bull; To identify you and the content and contributions you submit to the platform<br />\n&bull; To provide you with content relevant to your searches or preferences Maintaining, optimizing, securing the platform<br />\n&bull; To help us to identify you and the accounts you have<br />\n&bull; To better understand, manage and optimize the platform in order to improve and customize it to your needs<br />\n&bull; To detect, prevent or take action on fraud, spam or activities that are or could be in breachof our terms and conditions or guidelines<br />\n&bull; To discover and fix any issues or problems Targeted content, advertising To tailor content to your needs or requests to provide content relevant<br />\nto your preferences or actionsto show you ads on behalf of any sponsors or advertisers in the case of in house ads.<br />\nIn some cases, we may need to share information collected.<br />\n&nbsp;\n<h4>For example:</h4>\nOther users / visitors: As this is a community driven platform and content posted is inthe public realm any images, audio files, videos, comments, forum posts and any othercontent you provide or post is done so voluntarily in the knowledge that it will be availablepublicly to both registered and none registered users.We simply process this data onyour behalf as per our terms and conditions.<br />\nWe do not disclose your email address or IP address to other users and advise that you donot post personal information publicly.<br />\nWe cannot however prevent you from doing this and so, you do so, against our wishes and at your own risk.Other users may also see information regarding your interaction with theirs or other userscontent such as downloads, plays, favorites or comments along with your online statusand last seen times.<br />\n&nbsp;\n<h4>Service providers:</h4>\nWe may need to pass your personal data to certain reputablethird parties in order to provide services on our behalf such as processing payments orhosting.<br />\nWhere possible these service providers should have put in placemeasures to ensure the security of your data.<br />\nWith consent: We may share your information with your consent.<br />\nFor legal reasons / to protect ours or others interests: We may pass your personal datawhere we are under obligation to do so for legal reasons or to protect the safety, securityor rights of ourselves or that of others.<br />\n&nbsp;\n<h4>Aggregated data:</h4>\nWe may aggregate data in order to create statistical reports andinformation.<br />\nThis information would not include any information that could be used toidentity an individual and may be shared with third parties or publicly.<br />\nFor example, to showvisitor numbers or trends.<br />\nAdvertisers or sponsors may use techniques to track the effectiveness of ads or campaigns andto ensure that ads are delivered effectively. See our terms and conditions. Retention Periods Your personal data is retained for the duration or your account.<br />\nIn some cases, we may keepinformation longer and, in these cases,, it may be in an anonymized form or in a way that nolonger links it to an individual.<br />\nYour rights, choices and control of your information Dependent on your location you have certain rights regards your personal information and canchoose how we collect and use it.<br />\nInformation supplied / volunteered Should you choose to create an account you can manage the information you provide in anumber of waysvia your account settings page you can:<br />\n&bull; Manage your email address, user name, location and date of birth<br />\n&bull; Manage your avatar<br />\n&bull; Manage your profile description, items where you give information about the hardware/software you use, your musical tastes etc. and any outbound links<br />\n&bull; Manage your preferences for being contacted by other users<br />\n&bull; Manage your preferences for being notified of comments or replies to your uploads, forumposts etc.<br />\n&bull; Request your account be terminated via the admin / delete pages for your uploads you can upload, edit or delete pictures, videos, loops, tracks or documents associated information Terminating your account You may request your account be terminated at any time either via your account settings pageor by contacting support.<br />\nTo prove your ownership of an account you would need to log in andcontact us directly.<br />\nShould you no longer have access to your account you may contact us byother methods and we will endeavor to resolve the situation.<br />\nShould you request that your account is terminated your data will be deleted and may never berecoverable.<br />\nYou should remember to backup any information you prefer to keep. Account deletion may not be instant but will be done within a reasonable time frame. We may need toretain some data either for legal reasons or where we have a legitimate reasonfor doing so.<br />\nEven in the case that your account is terminated there is every chance that your information willstill appear on search engines and external sites. This is out of our control. Your account information may still be kept in the form or backups or server logs until such a time that those backups or server logs become obsoleteor replaced.<br />\nDependent on your location you may contact us in order to:<br />\n&bull; Ask to have your information updated or corrected if for some reason you are unable to doit yourself via your account settings page<br />\n&bull; Request that we provide your information in a commonly used electronic formatrequest that we erase or restrict our use of your information<br />\n&bull; Object to our use of your information in certain circumstances.<br />\n&nbsp;\n<h4>Note:</h4>\nsome choices or changes you make could prevent us from providing the platform to you.<br />\nExternal Links Our site contains links to other sites. We are not responsible for the privacy practices or thecontent of such web sites.<br />\nAge Restrictions / Children Unfortunately for legal reasons anyone below the age of 13 is not allowed to use the platformand we kindly ask that anyone below that age refrains from attempting to create an account or passing any personal information to us.<br />\nWe don&rsquo;t knowingly process any personal information ofanyone below the age of 13 and should it be bought to our attention that this is or has beendone we will remove or anonymize this information as swiftly as possible.<br />\nLiability We have appropriate security measures in place in our physical facilities to protect against theloss, misuse or alteration of information that we have collected from users of the platform.<br />\nData breaches Should there be an instance where data security is breached we will, where necessary, takesteps to inform users in a timely fashion. Contact us if you are still looking for more .</div>\n', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 00:48:04', '2020-07-21 00:48:04');
INSERT INTO `t_site_cms_page_i18n` (`id`, `page_id`, `lang`, `url`, `meta_title`, `meta_description`, `meta_keywords`, `meta_robots`, `layout`, `template`, `content`, `in_menu`, `is_sitemap`, `is_cached`, `is_active`, `start_at`, `expired_at`, `created_at`, `updated_at`) VALUES
(24, 17, 'en', 'terms-of-service', 'Terms of service', 'Terms of service', 'Terms of service', '', 'default.xml', 'default.tpl', '<div>\n                        <div style="height:400px">\n                            <img src="/web/files/pictures/terms_image.jpg" style="height:100%; width:100%" />\n                        </div>\n                        <div style="color: #222;margin-top: 40px;">\n                            <h4>GRAPHEX USER AGREEMENT</h4>\n                            <strong>\n                                PLEASE READ THE FOLLOWING TERMS OF SERVICE/ USER\n                                AGREEMENT AND POLICIES CAREFULLY. BY ACCESSING OR\n                                USING OUR WEBSITE: GRAPHEX TECHNOLOGY, OR OUR\n                                SERVICES, YOU HEREBY AGREE TO BE BOUND BY THESE TERMS,\n                                AND CONDITIONSAND ALL TERMS INCORPORATED HEREIN BY \n                                REFERENCE. IT IS THE RESPONSIBILITY OF YOU, THE USER\n                                CUSTOMER, OR PROSPECTIVE CUSTOMER TO READ THE TERMS\n                                AND CONDITIONS BEFORE PROCEEDING TO USE THIS SITE. THESE\n                                INCLUDE VARIOUS LIMITATIONS, EXCLUSIONS AND BINDING\n                                ARBITRATION AGREEMENT, AND CLASS ACTION WAIVER.IF YOU\n                                DO NOT EXPRESSLY AGREE TO ALL TERMS AND CONDITIONS\n                                PLEASE DO NOT PROCEED WITH THE USE OF OUR WEBSITE AND\n                                OR SERVICES\n                            </strong>\n                            </p>\n                            <p>\n                                This User Agreement is a contract between(you or user) Graphex Technology (“Graphex Technology,”“we,” or“us”)users who are browsers, vendors, customers, merchants, and/or contributors of content and our affiliates, Graphex Technology and to the extent expressly stated. By visiting our Site, and or purchasing something from us, you engage in our "Service" and agree to be bound by the following terms and conditions; including those additional terms and conditions and policies referenced herein and/or available by hyperlink.<br/><br/>\n                                This Agreement includes and hereby incorporates by reference the follo-wing import antagreements,as they may be in effect and are subject to modification periodically, as we reserve the right to update, change or \n\n                                replace any part of these Terms by posting updates and/or changes to our Site. <br/>\n                                It is your responsibility as the user to check this page periodically for changes. Your continued use of or access to the Site following the posting of any changes constitutes acceptance of those changes; i.e. Site Terms of Use;FeeandACH; Authorization Agreement; CookiePolicy; Privacy Policy; Mark Use Guide lines ;Freelancer Membership Agreement ;Proprietary Rights, Infringement Reporting Procedures; Graphex Technology Academy; Graphex Software License Agreement; API Terms of Use. <br/><br/>\n\n                                These agreements are collectively with this Agreement calledthe “Terms of Service”. Subject to the conditions set forth herein, Graphex Technology may in its sole discretion amend this Agreement and the otherterms of Serviceat any timeby postinga revised versionon the Site.<br/><br/>\n                                If a Substantial changeincludes an increase toFees charged by Graphex, Graphexwill provide  minimaland up to72hours of advance notice of the change but may NOT provideany advance notice forc hanges resulting in a reduction in Fees or any temporary or promotional Fee change.Any re-visions to the Terms of Service will take effect on the noted effective date.<br/><br/>\n\n                            <h4>TABLE OFCONTENTS</h4>\n                            <h5>1.Graphex User Accounts & Profile</h5>\n                            <ul style="list-style-type: none;">\n                                <li>1.a Conduct</li>\n                                <li>1.b Registration and Approval of User Account</li>\n                                <li>1.c AccountEligibility</li>\n                                <li>1.d AccountTypes</li>\n                                <li>1.e AccountPermissions</li>\n                                <li>1.f Identity and Location Verification</li>\n                                <li>1.g Usernames and Passwords</li>\n                            </ul>\n                            <h4>GRAPHEX USER ACCOUNTS& PROFILE</h4>\n                            We reserve the right but not the obligation to take any of the following actions in our sole discretion at any time and for any reason without giving you any prior notice: \n                            <ul style="list-style-type: none;">\n                                <li>1. Restrict, suspend, or terminate your access to all or any part of our Site.</li>\n                                <li>2. Change, suspend or discontinue all or any part of our products or Site.</li>\n                                <li>3. Refuse, move, or remove any content that is available on all or any part of our Site.</li>\n                                <li>4. Deactivate or delete your accounts.</li>\n                                <li>5. Establish general practices and limits concerning use of our Site.</li>\n                            </ul>\n                            You agree that we will not be liable to you or any third party for taking any of these actions. You understand and agree that our Site may include communications such as service announcements and administrative or legal notices from us. Please note that you cannot opt out of receiving these notices.<br/><br/>\n\n                            <h5>1.b REGISTRATION AND APPROVAL OF USER ACCOUNT</h5><br/>\n                            By registering for an account to use the Site or Available SiteServices (an “Account”), by using Graphex Websiteand the GraphexServicesafter the Effective Date if you had an Account on the Effective Date, or by clicking to accept the Terms of Service when prompted on the Site;you agree to abide by this Agreement and the other Terms of Service. To access and use certain portions of the Graphex Websiteand the GraphexServices, you must register for an Account.<br/><br/>\n\n                            Subject to the Site Terms of Use, certain portions of the Site are available to Site Visitors, including those portions before your Account registration is accepted. Graphexreserves the right to decline a registration to join Graphexor to add an Account of any type(i.e., as a Client or Freelancer), for any lawful reason, including supply and demand, cost to maintain data, or other business considerations. Once you create an account with us you are registered on the site. If you are merely surfing or browsing through the Site and have not yet created an account, your use of the Site is still subject to this Agreement; if you do not agree to this Agreement, do not use the Site.<br/>\n\n                            When you create an account, you will provide a unique username and emailaddress, we will also ask you to create a password because any activities that occur under your username or password are your responsibility;it is important for you to keep your username and/or password secure.You may not assign or otherwise transfer your account to any other person or entity,You acknowledge that is not responsible for third party access to your account that results from theft ormis-appropriation of your account;Notify us immediately if you believe that someone has used your username, email, or password without your authorization.<br/><br/>\n\n                            Furthermore, the registrant Userhereby acknowledges, understands and agrees to: <br/>\n                            a)furnish factual, correct, current and complete information with regards to yourself as may be requested by the data registration process, andmain-tain,and promptly update your registration, yourprofile information,and all other forms you access on the Site or provide to us tomaintain its truth-fulness, accuracy, and completeness always.<br/>\n                            b)You agree not to provide any false or misleading informationaboutyouridentity or location, your business, your skills, or the services your business provides and to correct any such information that is or becomesfalseor misleading.<br/>\n                            If anyone knowingly provides any information of a false, untrue, inaccurate or incomplete nature, GRAPHEX TECHNOLOGY  will have sufficient grounds and rights to suspend or terminate the member in violation of this aspect of the Agreement, and as such refuse any and all current or future use of GRAPHEX TECHNOLOGY  Services, or any portion thereof.<br/><br/>\n                            \n                            <h5>1.a CONDUCT</h5>\n                                As a user of our website, you herein acknowledge, understand and agree that all information, text, software, data, photographs, music, video, messages, tags or any other content, whether it is publicly or privately posted and/or transmitted, is the expressed sole responsibility of the individual from whom the content originated. In short, this means that you \n                                5are solely responsible for any and all content posted, uploaded, emailed, transmitted or otherwise made available by way of the Services, and as such, we do not guarantee the accuracy, integrity or quality of such content. It is expressly understood that by use of our Services, you may be exposed tocontent including, but not limited to, any errors or omissions in any content posted, and/or any loss or damage of any kind incurred as a result of the use of any content posted, emailed, transmitted or otherwise made available by.<br/>\n                                Furthermore, you hereinagree not to make use of GRAPHEX TECHNOLOGY ''s Services for the purpose of: <br/>\n                                a) uploading, posting, emailing, transmitting, or otherwise making available any content that shall be deemed unlawful, harmful, threatening, abusive, harassing, tortious, defamatory, vulgar, obscene, libelous, or invasive of another''s privacy or which ishateful.and/or racially, ethnically, or otherwise objectionable.<br/>\n                                b) causing harm to minors in any manner whatsoever.<br/>\n                                c) impersonating any individual or entity, including, but not limited to, any officials, forum leaders, guides or hosts or falsely stating or otherwise misrepresenting any affiliation with an individual or entity.<br/>\n                                d) forging captions, headings or titles or otherwise offering any content that you personally have no right to pursuant to any law nor having any contractual or fiduciary relationship with.<br/>\n                                e) uploading, posting, emailing, transmitting or otherwise offering any such content that may infringe upon any patent, copyright, trademark, or any other proprietary or intellectual rights of any other party.<br/>\n                                f) uploading, posting, emailing, transmitting or otherwise offering any content that you do not personally have any right to offer pursuant to any law or in accordance with any contractual or fiduciary relationship.<br/>\n                                g) uploading, posting, emailing, transmitting, or otherwise offeringany unsolicited or unauthorized advertising, promotional flyers, "junk mail," "spam," or any other form of solicitation, except in any such areas that may have been designated for such purpose.<br/>\n                                h) uploading, posting, emailing, transmitting, or otherwise offering any source that may contain a software virus or other computer code, any files and/or programs which have been designed to interfere, destroy and/or limit the operation of any computer software, hardware, or telecommunication equipment.<br/>\n                                i) disrupting the normal flow of communication, or otherwise acting in any manner that would negatively affect other users'' ability to participate in any real time interactions.<br/>\n                                j) interfering with or disrupting any GRAPHEX TECHNOLOGY Services, servers and/or networks that may be connected or related to our website, including, but not limited to, the use of any device software and/or routine to bypass the robot exclusion headers.<br/>\n                                k) intentionally or unintentionally violating any local, state, federal, national orinternational law, including, but not limited to, rules, guidelines, and/or regulations decreed by the U.S. Securities and Exchange Commission, in addition to any rules of any nation or other securities exchange, that would include without limitation, theNew York Stock Exchange, the American Stock Exchange, or the NASDAQ, and any regulations having the force of law.<br/>\n                                l) providing informational support or resources, concealing and/or disguising the character, location, and or source to any organization delegated by the United States government as a "foreign terrorist organization" in accordance withSection 219 of the Immigration Nationality Act.<br/>\n                                m) "stalking" or with the intent to otherwise harass another individual; and/orcollecting or storing of any personal data relating to any other user in connection with the prohibited conduct and/or activities which have been set forth in the aforementioned paragraphs.<br/>\n                                GRAPHEX TECHNOLOGY herein reserves the right to pre-screen, refuse and/or delete any content currently available through our Services. In addition, we reserve the right to remove and/or delete any such content that would violate the Terms,or which would otherwise be considered offensive to other visitors, and or users.<br/><br/>\n                                \n                                GRAPHEX TECHNOLOGY  herein reserves the right to access, preserve and/or disclose useraccount information and/or content if it is requested to do so by law or in good faith belief that any such action is deemed reasonably necessary for:<br/>\n                                a) compliance with any legal process<br/>\n                                b) enforcement of the Terms<br/>\n                                c) responding to any claim that therein contained content is in violation of the rights of any third partyd) responding to requests for customer service,orprotecting the rights, propertyor the personal safety of GRAPHEX TECHNOLOGY, its visitors, and usersincluding the general public.<br/><br/>\n                                GRAPHEX TECHNOLOGY  herein reserves the right to include the use of security components that may permit digital information,or material to be protected, and that such use of information and/or material is subject to usage guidelines, and regulations established by GRAPHEXTECHNOLOGY or any other content providers supplying content services to GRAPHEX TECHNOLOGY. \n                                You are hereby prohibited from making any attempt to overrideorcircumvent any of the embedded usage rules in our Services. Furthermore, unauthorized reproduction, publication, distribution, or exhibition of any information or materials supplied by our Services, despite whether done so in whole or in part, is expressly prohibited.<br/><br/>\n                                \n                                <h5>1.c ACCOUNT ELIGIBILITY</h5>\n                                To register for an Account or use the Site and Site Services, you mustand hereby represent that you:<br/>\n                                1)are a customer, freelancer, international students, and oranaffiliateauthorized to act for and bind an independent business (whether it be as a self-employed individual/sole proprietor or as a corporation, limited liability company, or other entity); <br/>\n                                2) will use the Site and Site Services for business purposes only; <br/>\n                                3) will comply with any licensing, registration, or other requirements with respect to your business, or the business for which you are acting, and the provision of Freelancer Services. <br/>\n                                4) You are either a legal entity or an individual who is 18 years or older (or have otherwise reached the age of majority in the jurisdiction in which you conduct business) in each case who can form legally binding contracts.<br/><br/>\n                                <h5>1.d ACCOUNT TYPES</h5>\n                                There are different Account types,once you register for one Account type,you cannot add another Account types under the same username and password; if you have a Business Account,you can create a designated Account for each of your team members within your Business Account.Youcan have a Business and a Freelancer Account, please be advised if you have more than one Account,they cannot be merged into one.<br/><br/>\n     \n                                <h5>1.e ACCOUNT PERMISSIONS</h5>\n                                You agree not to request or allow another person to create an Account on your behalf,for your use,or for your benefit except that anauthorized employee or agent may create an Account on behalf of your business.<br/><br/>\n                                \n                                <h5>1.f IDENTITY AND LOCATION VERIFICATION </h5>\n                                When you sign up for an account on Graphex from time to time thereafter, your account will be subject to verification including but not limited to validation againstthird-partydatabases; or the verify-cation of one ormoreofficial government or legal documents that confirm your identity, your location,and your ability to act on behalf of your business on Graphex.<br/>\n                                You authorize Graphex ,directly or through third parties, to make any inquiries necessary to validate your identity ,your location, and confirm your ownership of your email address,or financial accounts ,subject to applicable law .When requested ,you must timely provide Graphex with complete in formation about your self and your business,which includes but is not limited to providing official government, or legald ocuments .During verification ,some account features may be temporarily limited; when verification is successfully completed,account features will be restored.<br/><br/>\n                                \n                                <h5>1.g USERNAMES AND PASSWORDS</h5>\n                                By granting other Users permissions under your Account,including as a Team Member or Agency Member, you represent and warrant that :<br/>\n                                a)the User isa uthorized to act on your behalf; and you are fully responsible and liable for the User’s act sandomissions, including for obligations and liabilities relating to making payments and entering into Service Contracts and the Terms of Service.<br/>\n                                b)You authorize Graphex to assume that any person using the Site with your username and password,either is YOU or isa uthorized to act on YOUR behalf.<br/>\n                                c)You further agree not to use the account or login with the username and password of another User of the Site if you are not permitted to use both or the use would violate the Terms of Service.<br/>\n                                d) If any such User violates the Terms of Service, it may affect your ability to use the Site and Site Services.Upon closure of an account, Graphex may close any or all related Accounts.<br/>.<br/>\n                                \n                                <h5>NONDISCRIMINATION STATEMENT </h5>\n                                Graphex Technology’s mission is to create economic opportunities byallowing access to our platformaiming to forever change lives, careers, and businesses by promotingfreedom, flexibility, growth, and satisfaction with no compromise to quality of services; At Graphex Technology we aspire to make the world a better place.These opportunities should be equally available to all qualified talent in our community, regardless of background, nationality, race, ethnicity, sex, gender, gender identity, sexual orientation, disability status, veteran status, marital status, or other similarly protected characteristics. A condition of using the Site is your agreement not to engage in any unlawful discrimination or harassing conduct, such conduct is not permitted on Graphexby any user of our community. Graphexdoes not require Users to violate local laws or take actions that may subject them to legal liability; Users engaging in this activity are subject to Account closure. Please bring any reports of discrimination or harassment to our attention by using our contact info listed on our website.<br/><br/>\n                                <h5>1. Parties</h5>\n                                You are entering into this Agreement with Graphex Technology (also referred to as “we”and “us”).Whetheryou reside in the United States,or outside the United States,you are entering into this Agreement withGraphex Technology..<br/><br/>\n                                \n                                <h5>2. Fees Charged to Freelancers</h5>\n                                Pursuant to the User Agreement, we charge Freelancers a Service Fee foreach payment their Client makes to theFreelancer on a Service Contract. Depending on certain features of the Service Contract, the Service Fees will becharged either as "tiered" or "straight" pricing, as discussed in further detail in this Section 2. Where applicable, Graphex Technologymay also collect taxes (such as value added tax (VAT) in Europe) on Service Fees.<br/>\n                                Additionally, the use of various Payment Methods offered through the Site, and the Site Services may incur added fees orcharges. All Payment Methods will be posted on the Site along with any associated fees or charges, which we mayupdate from time to time at our sole discretion. You hereby authorize us to charge to you and to collect from you(consistent with this Agreement, the User Agreement, or elsewhere in the Terms of Service) any fees, charges, or taxesdescribed in this Section.<br/><br/>\n                                \n                                <h5>2.1 Tiered Pricing</h5>\n                                We will charge you a Service Fee based on the total Freelancer Fees collected by you from your Client (less any refundsor reversals) for the duration of your relationship with your Client (the “Engagement Relationship”). Unless different pricingdescribed in Section 2.2, 2.3, or 2.4 applies, the Service Fee rates decrease as the total Freelancer Fees you havecollected from your Client for the Engagement Relationship meet certain thresholds as follows (“Tiered Pricing”).<br/><br/>\n                                \n                                <h5>2.2 TOTAL FREELANCER FEES COLLECTED FROM CLIENTS & GRAPHEX SERVICE FEES</h5>\n                                (per Engagement Relationship)<br/>\n                                $101 to $500.00 Graphex Service Fees are 20%<br/>\n                                $500.01 to $10,000.00Graphex Service Fees are 10% <br/>\n                                $10,000.01 and upGraphex Service Fees are 5% <br/>\n                                Below are some examples of Tiered Pricing.<br/>\n                                Example 1. Fixed-Price Contract; Repeat Service Contracts <br/>\n                                If a Freelancer and a Client who have never entereda Service Contract<br/>\n                                together before agreeingto a $600 Fixed-PriceContract, the Service Fee will be calculated as follows:<br/><br/>\n                                <h4>GRAPHEX SERVICE FEESTO FREELANCERS</h4>\n                                \n                                $0 to $100 Graphex Service Fees is10%=$10 ($100 x 10%) <br/>\n                                $101to $500 Graphex Service Fees is20%=$100 ($500 x 20%)<br/>\n                                Example: If Total Freelancer Feesamount to $600 (Total Engagement Relationship Fees: $600)<br/>\n                                Graphex Total ServiceFees will equal to $110 <br/>\n                                Note:The Service Fee will appear as a single amount in your Account,rather than separate amounts as shown in the example above. \n                                Examples in this Agreement are provided for illustrative purposes only and are not binding. Because of rounding, the Service Fees charged may differ slightly.If the same Freelancer and Client agree to another $600 Fixed-Price Contract, the Service Fee will be calculated as follows:<br/><br/>\n\n                                <h5>2.3 FREELANCER FEES&GRAPHEX SERVICE FEE RATESE </h5>\n                                Example: If Freelancer’s service Fees are $600 Graphex will collect 10% as itsService Fees which equal to $60 ($600 x 10%) <br/>\n                                Total Freelancer Fees: $600<br/>\n                                (If Total Engagement Relationship Fees: $1,200)Graphex Service Fees remains at 10% which=$120 <br/>\n                                If the same Freelancer and Client enter into additionalFixed-Price Contracts for different Service Contracts, the Freelancer Fees for each Service Contract will count toward the total Freelancer Fees collected for purposes ofdetermining the Tiered Pricing that applies to the Service Fees. If the Freelancer collects $10,000 in Freelancer Fees from the Client, then the Service Fee on any additional Freelancer Fees for the Engagement Relationship with the Client will be 5% of the Freelancer Fees. For example, if the Freelancer has collected a total of $15,000 inFreelancer Fees during the Engagement Relationship and the Freelancer and Client entera new Fixed-Price Contract for $1,000, the Service Fee would be determined as follows:<br/><br/>\n\n                                <h5>2.3 FREELANCER FEES&GRAPHEX SERVICE FEE RATES</h5>\n                                Example: If Freelancer’s service Fees are $600 Graphex will collect 10% as itsService Fees which equal to $60 ($600 x 10%) <br/>\n                                Total Freelancer Fees: $600 <br/>\n                                (If Total Engagement Relationship Fees: $1,200)Graphex Service Fees remains at 10% which= $120 <br/>\n                                If the same Freelancer and Client enter into additional Fixed-Price Contracts for different Service Contracts, the Freelancer Fees for each Service Contract will count toward the total Freelancer Fees collected for purposes ofdetermining the Tiered Pricing that applies to the Service Fees. <br/>\n                                If the Freelancer collects $10,000 in Freelancer Fees from the Client, then the Service Fee on any additional Freelancer Fees for the Engagement Relationship with the Client will be 5% of the Freelancer Fees. For example, if the Freelancer has collected a total of $15,000 inFreelancer Fees during the Engagement Relationship and the Freelancer and Client entera new Fixed-Price Contract for $1,000, the Service Fee would be determined as follows:<br/><br/>\n                                \n                                <h5>2.4 FREELANCER FEES & GRAPHEX SERVICE FEE RATES</h5>\n                                For a Freelancer Fee of $1,000 Graphex Service Fees is10% =$100 ($1,000 x 5%)<br/>\n                                If the Client is seeking additional Service from the Freelancer, in example below added engagement amount to $15,000 + $1000 from previous order for a Total Engagement Relationship Fees of $16,000)<br/>\n                                Graphex Total Service Feeswill be $800.<br/>\n                        </div>\n                    </div>', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 00:48:21', '2020-07-21 00:48:21'),
(25, 18, 'en', 'trust-and-safety', 'Trust and Safety', 'Trust and Safety', 'Trust and Safety', '', 'default.xml', 'default.tpl', '<div style="height:400px">\n                        <img src="/web/files/pictures/trust-safety.png" style="height:100%; width:100%" />\n                    </div>\n                    <div style="margin-top: 40px;color: #222;">\n                        <h4><span style="border-bottom: 3px solid black;">PROFILE PICTURE</span></h4>\n                        Graphex’s Terms of Use request that you accurately represent yourself.<br/> \n                        Your profile picture must be current and looks like you, no filters allowed. <br/><br/> \n\n                        <h4><span style="border-bottom: 3px solid black;">What is a profile picture?</span></h4>\n                        Your profile picture is the image of yourself that you share with potential clients, customers, and consumers through your Graphex profile.<br/>\n                        This picture is used to authenticate your identity. Your profile picture may not misrepresent your identity or represent you as someone else.<br/><br/>\n\n                        <h4><span style="border-bottom: 3px solid black;">Approved profile pictures</span></h4>\n                        Your profile picture should precisely reflect who you are, and it must look like you. It must be a close-up image of yourself with a focus on your head and shoulders, and clearly show your full face. <br/><br/>\n                        <h4><span style="border-bottom: 3px solid black;">PRO TIPS</span></h4>\n                        Typically People want to feel they can trust a freelancer before engaging them for any type of project, big or small that they may need, and your profile photo is a significant part of the equation.<br/>\n                        Clients are also concerned about professionalism, so it is important to present yourself professionally.<br/>\n                        Your photo should have clear lighting and a simple background, and focus on your face; Remember to smile and be friendly!<br/><br/>\n\n                        <h4><span style="border-bottom: 3px solid black;">VIOLATIONS</span></h4>\n                        Graphex’s Terms of Use prohibit the use of a profile picture that misrepresents your identity or represents you as someone else. Also, you cannot misrepresent your information, impersonate another person or entity, or falsely imply a relationship with Graphex or with another company with whom you do not have a relationship. <br/><br/>\n\n                        <h4><span style="border-bottom: 3px solid black;">Picture Quality</span></h4>\n                        In order to ensure a quality experience for clients, your profile picture <strong>cannot</strong>:\n                        <ul>\n                            <li>Be blank</li>\n                            <li>Any portion of your face cannot be unclear</li>\n                            <li>Be blurry</li>\n                            <li>Be a group photo</li>\n                            <li>Include text</li>\n                            <li>Show you topless, naked, or sexually suggestive</li>\n                        </ul>\n\n                        <h4><span style="border-bottom: 3px solid black;">Picture Subject</span></h4>\n                        Your profile picture must look like you.<br/>\n                        It <strong>cannot</strong> be: \n                        <ul>\n                            <li>Animals</li>\n                            <li>Another person or celebrity</li>\n                            <li>Architecture</li>\n                            <li>Avatars</li>\n                            <li>Sculptures or other artistic representations</li>\n                            <li>Baby/child</li>\n                            <li>Clip art</li>\n                            <li>Landscapes</li>\n                            <li>Logos</li>\n                            <li>Objects</li>\n                            <li>Stock image</li>\n                            <li>Graphex badge</li>\n                            <li>Graphex logo</li>\n                        </ul>\n\n                        A profile picture that does not accurately represent you and or authenticate your identity in accordance with this policy is a violation of the Terms of Service and can result in warnings, account suspension and or termination. Users who violate the Terms of Service, and or this policy, can fully lose the ability to use the Graphex Technology’s platform.<br/><br/>\n                        <h4><span style="border-bottom: 3px solid black;">GRAPHEX TECHNOLOGY PROHIBITS USERS OF GRAPHEX OF CIRCUMVENTION OF ANY SORT.</span></h4>\n                        <strong>What is circumvention?</strong>\n                        Circumvention would be when a client and freelancer meet on Graphex but decided to conduct their relationship outside of Graphex, usually by sending payment through another means outside of the platform and or exchanging contact information in any form. Circumvention is a serious violation of the Terms of Service. If Clients, Freelancers and or both simultaneously has taken any step in order to take their relationship off our platform, he/she or they are committing circumvention, i.e. like asking to be paid or make a payment outside of our service.<br/><br/>\n                        <h4><span style="border-bottom: 3px solid black;">Violations</span></h4>\n                        Violating the non-circumvention clause of the Terms of Service will result in account suspension and or termination; These users will lose the ability to use Graphex, potentially put their hard-earned reputation at risk, and will be charged a penalty of a $1,000 for breaching Graphex User agreement and Terms of Service that relationship.<br/><br/>\n                        <h4><span style="border-bottom: 3px solid black;">Is asking to be paid outside of Graphex a violation?</span></h4>\n                        Yes, asking to carry out payments outside of Graphex is circumvention and a violation of the User Agreement and Terms of Service.<br/><br/>\n\n                        <h4><span style="border-bottom: 3px solid black;">When does a freelancer/ client relationship initially starts on Graphex?</span></h4>\n                        Graphex relationship begins when the client and freelancer first “identify” each other on Graphex Technology. This could be when a freelancer sends their proposal for a specific posted project or job to a potential client or when a client post a job or is soliciting for a said project, and or a when client select a freelancer from viewing the freelancer’s portfolio.<br/><br/>\n\n                        <strong>Note:</strong> Graphex’s User Agreement and Terms of Service prohibit the requesting or sharing of a means of direct contact (aka “contact information”) before a contract starts.<br/><br/>\n                        <h4><span style="border-bottom: 3px solid black;">What is a “Means of Direct Contact”?</span></h4>\n                        A means of direct contact is a little wider than just contact information because it includes information that enable a client or freelancer to be contacted outside of Graphex which is prohibited.<br/>\n                        Here are some examples:<br/>\n                        <ul>\n                            <li>Phone number</li>\n                            <li>Email address</li>\n                            <li>Physical address</li>\n                            <li>Link to a contact form or form requesting contact information</li>\n                            <li>Link to an applicant management system or means to accept or submit a proposal or application outside of Graphex</li>\n                            <li>Any handles, usernames, or information that would allow a user to make contact with you on social media or another website, platform or application that includes a communications tool (Skype, Slack, or WeChat ID or any other social media platform not listed here)</li>\n                        </ul>\n\n                        It is a violation of Graphex’s Terms of Service to request or share this kind of information before a contract starts.  For example, you should not share this information in your job post, proposal, or during an interview. Waiting to share this information until a contract starts, can also help keep you safe.<br/> \n                        <strong>All Users must conduct interviews and all associated Pre-contract communications must take place via Graphex Platform.</strong><br/><br/>\n\n                        <h4><span style="border-bottom: 3px solid black;">Can I share my name or my company’s name?</span></h4>\n                        Yes, you can share your name and or company names. However, we urge you to be prudent with whom you share identifying information to prevent unwanted spam, fraud, or harassment.<br/><br/>\n\n                        <h4><span style="border-bottom: 3px solid black;">I worked on a website and want to share the link with a potential client, is that allowed?</span></h4>\n                        Yes, If you worked on a website (design, writing, etc.) for a past client and want to share the link with a potential client as part of your portfolio, you also may do so yet you must ensure that the website does not contain any contact information, otherwise you’ll be in violation Graphex’s user agreement and Terms of Service. In these cases, please be sure to ask the client to only contact you through Graphex until a contract is started. Please note that sharing social media handles/IDs is strongly prohibited.<br/><br/>\n\n                        <h4><span style="border-bottom: 3px solid black;">I am a client who needs work done on my website and I want to share the link. Is that allowed?</span></h4>\n                        Yes. You are free to share details of the work to be done, including links to your website(s). You may do this even if the website includes your contact information; in these cases, please be sure to ask the freelancer to only contact you through Graphex until a contract is started otherwise you’ll be in violation Graphex’s user agreement and Terms of Service. Please note that sharing social media handles/IDs is strongly prohibited.<br/><br/>\n\n                        <h4><span style="border-bottom: 3px solid black;">I need to share a portfolio that is not on Graphex. Can I do that?</span></h4>\n                        Absolutely Not! We know sharing your past work is important, hence why all of your attractive, and professional work must be attached in your portfolio, remember your portfolio is your way of advertising your skills and your services. So always put your best work in your portfolio reflecting your professionalism and experiences.<br/>\n\n                        <h4><span style="border-bottom: 3px solid black;">What are permitted examples of the for “legal purposes” exception?</span></h4>\n                        Sometimes after the initial vetting process, a legal or formal process is necessary before final project scoping, negotiations, and/or a contract can start. Some examples include, but are not limited to:\n                        <ul>\n                            <li>A non-disclosure agreement also known as “NDA”</li>\n                            <li>A business License</li>\n                            <li>Identifying information to confirm the right to conduct business with local authorities</li>\n                            <li>Background checks</li>\n                        </ul><br/>\n\n\n                        <h4><span style="border-bottom: 3px solid black;">What are permitted examples of the for “systems access” exception?</span></h4>\n                        Companies maintain information in various formats and systems that could be needed for project scoping and at times access to these systems are granted by using an email address. Some examples include, but are not limited to:\n                        <ul>\n                            <li>GitHub/Bitbucket/Gitlab or other code repositories</li>\n                            <li>Google/Facebook or other ad analytics programs</li>\n                            <li>QuickBooks or other bookkeeping/accounting programs</li>\n                            <li>Cloud drive folder</li>\n                            <li>Online e-signature</li>\n                            <li>Website host or builder</li>\n                        </ul>    \n                        <h4><span style="border-bottom: 3px solid black;">What is an interview?</span></h4>\n                        After a freelancer submits a proposal to a job or answers to a direct inquiry from a client, the freelancer and client have entered the “interview” stage of a project. The interview stage of a project includes:\n                        <ul>\n                            <li>Project scoping</li>\n                            <li>Assessment of the freelancer’s skills and availability by the client</li>\n                            <li>Assessment of the client and project details by the freelancer</li>\n                            <li>Contract negotiations</li>\n                        </ul>		\n                        This could include conversations through text-based messaging, sharing and discussing project details, video meetings or voice calls. All of these activities are required to take place through Graphex Messages, and collaboration tools.<br/>\n                        Staying on Graphex and practicing these rules can also help keep you safe.<br/><br/>\n\n\n\n                        <h4><span style="border-bottom: 3px solid black;">Common violations and ways to avoid them</span></h4>\n                        <ul style="list-style-type: decimal;">\n                            <li>Identity Ambiguity and Account Sharing: Be truthful! by providing your correct and authentic information and use a clear-cut photo of yourself. </li>\n                            <li>Do not allow anyone else to use your account, in other words no account sharing, and do not ever log into one of your clients'' accounts on their behalf. Instead, have them add you to their team with the appropriate permissions. Promptly respond to all requests to phone verify or ID verify by Graphex.</li>\n                            <li>Collecting Payments Outside of Graphex: Always collect payment through Graphex; If a client offers to pay you outside of Graphex, it is your responsibility to decline and you must inform us, if Not, you will be in breach of Graphex User agreement and Terms of Service and will be charged a penalty of a $1,000 per infraction. When Client submit their payment, it is being held in a designated Escrow Account, and payment will be released to the Freelancer when the completed work or project is submitted to the client and is satisfactory according to the client’s expectation.</li>\n                            <li>Failing to Execute on Your Contracts as outlined: When you agree to a project, you vow to complete the work and to produce high-quality service/ work. In addition, you must precisely and truthfully describe your business, your skills and qualifications, and the services you offer. Misrepresenting your abilities or failing to fulfill your contract responsibilities can result in low client satisfaction and payment disputes.</li>\n                            <li>Contact Information Sharing: Keep contact with potential clients only on Graphex. Your profile cannot contain your phone, email, or other direct contact information, for example Skype IDs etc....</li>\n                            <li>Spam and Harassment: Treat everyone with respect and professional courtesy in all types of communications; Customize your applications to the needs of each job and client. Do not send the same cover letter repeatedly, excessively and or message anyone.</li>\n\n                            <li>Feedback Abuse: Great feedback is earned, not forced! Do not pressure clients to give you good feedback, and do not withhold your client work and or project until feedback is left. It is OK to let clients know that you strive to provide high-quality work or services to earn a good rating and or to ask for feedback to be left.</li>\n                            <li>Account holds and suspension for any of these reasons will be counted on your Stats and disqualify you from Top Rated status. We strongly suggest you review the full Graphex User Agreement And Terms of Service.</li>\n                            <li>What is unsolicited contact?<br/>\n                                Unsolicited contact is when an Graphex user finds information on the platform and uses it to contact another client and or a freelancer for their own purposes outside of Graphex’s platform. This contact can be to solicit circumvention or for another reason. Recipients of unsolicited contact have not requested or invited this contact from other users, and must report it directly to Graphex Trust and Safety management team.\n                            </li>\n                            <li>How can I report if someone has contacted me outside of Graphex?<br/>\n                                You can report any unsolicited off-platform contact by reaching out to Graphex “Report & Issue Page” located within Graphex; there are multiple options in reporting: a. You can call us directly using our contact number listed on Graphex. b. You can email us through the “Report & Issue Page”.\n                            </li>\n                        </ul>\n                        <h4>At Graphex Technology, we aim to create a safe and reliable place for clients, and freelancers to get more accomplished. Our network stretches globally with services offered on our Platform ranging from Accounting, Graphic Designs, Business management to Writing and more.</h4>\n                    </div>', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 00:58:16', '2020-07-21 00:58:16');
INSERT INTO `t_site_cms_page_i18n` (`id`, `page_id`, `lang`, `url`, `meta_title`, `meta_description`, `meta_keywords`, `meta_robots`, `layout`, `template`, `content`, `in_menu`, `is_sitemap`, `is_cached`, `is_active`, `start_at`, `expired_at`, `created_at`, `updated_at`) VALUES
(26, 19, 'en', 'have-a-question', 'Have a Question', 'Have a Question', 'Have a Question', '', 'default.xml', 'default.tpl', '<div style="color:#222222">\n<div style="height:400px"><img src="/web/files/banners/en/have-question.jpg" style="height:100%; width:100%" /></div>\n\n<div class="textParagraph">\n<h2 style="text-align:center">Have a Question?</h2>\nThe purpose of Graphex Have a Question Page is to ensure communication between Graphex and Its Users, it enables the reporting of any concerns and or issues that may arise from either party, i.e. Clients, Freelancers, located in national, or international region and or any other Graphex Users. It also covers any questions that may be related to the use of Graphex&rsquo;s Platform where applicable.<br />\n&nbsp;\n<h5>1. What if I am not satisfied with my freelancer&rsquo;s service rendered?</h5>\nIf you are not satisfied with the service and or work provided by your Freelancer:\n\n<div style="margin-left:20px">a. You can opt to choose another Freelancer by shopping through readily available Portfolios specific to your needs.<br />\nb. You can request your money back; however, we would hate to see you go unsatisfied, we strongly advise that you reach out to Graphex Management Team below through this page, or call us directly by using the phone number listed in our &ldquo;contact us&rdquo; tab, and or contact our customer service for further assistance accordingly. For Graphex aims to provide you and your business with the highest quality services; Your satisfaction is our top priority!<br />\n&nbsp;</div>\n\n<h5>2. When satisfied with completion of service where do I write a review and or rate my Freelancer?</h5>\n\n<div style="margin-left:20px">a. Once satisfied with service provided by your Freelancer, you can and should write a review and rate Graphex&rsquo;s Platform and your Freelancer&rsquo;s page, it&rsquo;s a courteous way of saying thank you for a satisfactory or a job well done. Please note: If you&rsquo;re dissatisfied with services provided on our platform, do not hesitate to reach out to Graphex as mention above before proceeding to write a review, and a rating on Graphex Platform; first allow us the opportunity to resolve your issues and concerns internally. Thank you in advance for your understanding.<br />\n&nbsp;</div>\n\n<h5>3. Where do I leave a Tip for my Freelancer after receiving satisfactory services?</h5>\n\n<div style="margin-left:20px">a. You may Tip your Freelancer using the same payment method that you&rsquo;ve submitted through Graphex when paying your Freelancer with clear indication of the percentage or amount of tips that you desire to leave your Freelancer and or you can use the link prompted by Graphex to issue a tip to your Freelancer.<br />\n&nbsp;</div>\n\n<h5>4. How do I change my username and password on Graphex?</h5>\n\n<div style="margin-left:20px">a. To change your username and password please go to setting located on the upper right corner of your profile click setting then proceed to your changes by entering the desired username and or password.<br />\n&nbsp;</div>\n\n<h5>5. How do I deactivate or close my Account?</h5>\n\n<div style="margin-left:20px">a. To deactivate or close your Account, you must write a letter addressing your request to Graphex&rsquo;s Administrator (s) with your information and explanation for closing your Account.<br />\n&nbsp;</div>\n\n<h5>6. How to get more gigs / jobs / or better rating on Graphex?</h5>\n\n<div style="margin-left:20px">a. First ensure that your photo is current and reflects who you are; Remember to smile and be friendly! Clients are also concerned about professionalism, so it is important to present yourself professionally. Create a trusting rapport with your client on the initial interaction, by establishing a customer friendly approach in all aspect of your interaction.<br />\nb. To get more gigs, projects and or job, tailor your portfolio to showcase your skills and ensure that it is well done; remember your portfolio is your way of advertising your skills and your services. So always put your best work in your portfolio reflecting your professionalism and experiences.<br />\nc. To get good rating, you must render an impeccable service to your client, in a timely fashion with professionalism and customer service friendly.<br />\n&nbsp;</div>\n\n<h5>7. What Do I need to set up a Business Account?</h5>\n\n<div style="margin-left:20px">a. To set sign up for a Business Account, you need readily on hand your Business name, physical address, phone number, email address; you need your EIN or TIN number and ( your resellers certificate when applicable.) along with your name and other pertinent information as needed.<br />\n&nbsp;</div>\n\n<h5>8. How many Users can I add under my Business Account?</h5>\n\n<div style="margin-left:20px">a. You can create as many Account as your Business needs requires; your team&rsquo;s Account is of limited access versus yours.<br />\n&nbsp;</div>\n\n<h5>9. Can I hire a full-time worker from Graphex and bring him/her into our company?</h5>\n\n<div style="margin-left:20px">a. For the most part, yes. We will work with you to fully understand your specific requirements so that we can establish a mutually beneficial arrangement; However, please be prepared to pay a release fee for the desired freelancer.<br />\n&nbsp;</div>\n\n<h5>10. How does Graphex screening process ensure quality candidates that meet our requirements?</h5>\n\n<div style="margin-left:20px">a. We screen for communication skills, personality, domain-specific knowledge, and a high level of professionalism.<br />\nb. Our process includes a variety of ways to determine skill and proficiency, including portfolio reviews, technical coding challenges, user or market research, business cases, project management backlog grooming, formal assessments, as well as live problem-solving sessions as appropriate to the candidate and vertical.<br />\n&nbsp;</div>\n\n<h5>11. Do you offer services such as screening, vetting, and testing to help us hire employees outside of the Graphex network?</h5>\n\n<div style="margin-left:20px">a. While we currently do not supply these services, we plan on offering them in the future. Meanwhile if you decide to hire a Graphex Freelancer, worker or else permanently for your company outside of Graphex, you must contact Graphex Administrator via email placing your inquiry and you are responsible for further screening, vetting, and testing of that said party.<br />\nb. What methods of payment does Graphex accept? We currently accept all major credit cards, Debit Cards, ACH, bank wires, Online Checks, Western Unions and PayPal.<br />\n&nbsp;</div>\n\n<h5>12. Why was my payment declined?</h5>\n\n<div style="margin-left:20px">a. Payments may be declined for several reasons. If your payment was declined, please review the following:\n<div style="margin-left:20px">1. Make sure you entered the payment details correctly.<br />\n2. Check to see that your credit/debit card is valid and not expired.<br />\n3. Make sure you have available funds on your card.</div>\nb. Generally, the payment source has more information than we do as to why your payment was declined. Therefore, we recommend checking with your bank or PayPal.<br />\nc. If you still have issues with your payment, try using a different payment option (i.e., if you are using PayPal, you should consider using your credit or Debit card, online checks and or Western Union). If you still have issues completing your order, you can contact Customer Service for Help.<br />\n&nbsp;</div>\n\n<h5>13. How do I know when a Freelancer or Worker is online?</h5>\n\n<div style="margin-left:20px">a. Online Status is shown by a small green circle next to the profile picture, which lets you know that the user is currently logged in on Graphex, this is useful in receiving quick responses from sellers, Workers, and or Freelancers when contacting them.<br />\nb. The online user status is visible on various pages, such as the Profile, Conversations, and service pages. On the Category, Subcategory, and advanced search pages, you can filter the marketplace results according to online sellers, workers and or Freelancers.</div>\nFor further detail on identifying your online status, see Managing Your Account in your settings. When the small circle next to the profile picture is gray, it indicates that User is offline.<br />\n&nbsp;\n<h5>14. What kind of services can I sell on Graphex?</h5>\n\n<div style="margin-left:20px">a. Be innovative! You can offer any service you desire as long as you comply with our terms and you are proficient / skilled in said service. Graphex has multitude of categories you can browse to get ideas of what skills you can offer and how to showcase them.<br />\n&nbsp;</div>\n\n<h5>15. How much time do I need to invest to Freelance on Graphex?</h5>\n\n<div style="margin-left:20px">a. Graphex promotes flexibility; You need to dedicate some time and effort in the beginning to learn the marketplace / Platform, then you can decide for yourself what amount of work and or project you want to do. You work around your availability, so you have the freedom you so desire to care for your family, take road trips, vacationed any time you wish without the hassle of asking for time off with the anticipation of possible denial.<br />\nb. As an international student, you get the opportunity to study abroad without the hassle applying for work permit of said country, or having to look for employment in an unknown country just to make end meets; You are able to make as little or as much as you need working or freelance on Graphex, the sky is literally the limit!<br />\n&nbsp;</div>\n\n<h5>16. How I price my service on Graphex?</h5>\n\n<div style="margin-left:20px">a. You can create Packages with set prices, and further tailor packages to your client&rsquo;s needs; you set your pricing anywhere from $10 - $1,000 and up and we suggest that you offer three versions of your service at three different prices for your client&rsquo;s convenience. Graphex is expecting you to provide high-quality services at every price point.<br />\n&nbsp;</div>\n\n<h5>17. How much does it cost to sign up on Graphex?</h5>\n\n<div style="margin-left:20px">a. Good news! It&rsquo;s free to sign up on Graphex; There is no subscription required or fees to list your services. Please refer to Graphex User Agreement for further details on fees charge to freelancers.<br />\n&nbsp;</div>\n\n<h5>18. What is Out of Office mode and when should I use it?</h5>\n\n<div style="margin-left:20px">a. Out of Office mode allows to communicate your unavailability with your clients and or potential clients; it allows them to know you&#39;re currently unavailable to receive new orders, basically select the date you plan to return, select a reason (i.e., I&#39;m on vacation, and or I&#39;m overbooked, or other), add a brief notation, activate it then you&rsquo;re all set. When the timeframe expires, the Out of Office mode will automatically be deactivated, and your services will be back on the marketplace as available.<br />\n&nbsp;</div>\n\n<h5>19. Can I activate Out of Office mode if I have active Orders?</h5>\n\n<div style="margin-left:20px">a. Yes, activating Out of Office mode does not affect existing orders. However, you still need to deliver anticipated services in a timely fashion.<br />\n&nbsp;</div>\n\n<h5>20. Will my response rate be affected?</h5>\n\n<div style="margin-left:20px">a. No, it will not. When you are not available, you are unable to accept new orders. However, you will receive emails in your provided email contact, reflecting new client&rsquo;s interest and or notifications from Graphex Admin.<br />\n&nbsp;</div>\n\n<h5>21. Is my personal information safe?</h5>\n\n<div style="margin-left:20px">a. At Graphex technology we care about your privacy and the safety of your personal information. Besides the ultimate security level established within Graphex to avoid data breach, any attempt or attack from cyber criminals, we have a devoted team of Cyber security available 24/7 to detect any threat or attempt to our data base to access any data. You can refer to our Privacy Policy, our Terms of Service and Trust and Security for more information.<br />\n&nbsp;</div>\n<strong> Graphex aims to provide you and your business with the highest quality service; Your satisfaction is our top priority! So please don&rsquo;t hesitate to reach out to us for help 24 hours a day/ 7 days a week.<br />\nSincerely, Graphex Administration. </strong></div>\n</div>\n', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 00:58:32', '2020-07-21 00:58:32'),
(27, 20, 'en', 'report-an-issue', 'Report an Issue', 'Report an Issue', 'Report an Issue', '', 'default.xml', 'default.tpl', 'Report an Issue', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 00:58:48', '2020-07-21 00:58:48'),
(28, 21, 'en', 'invite-a-seller', 'Invite a seller', 'Invite a seller', 'Invite a seller', '', 'default.xml', 'default.tpl', 'Invite a seller', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 00:59:32', '2020-07-21 00:59:32'),
(29, 22, 'en', 'invite-a-vendor', 'Invite a vendor', 'Invite a vendor', 'Invite a vendor', '', 'default.xml', 'default.tpl', 'Invite a vendor', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 00:59:44', '2020-07-21 00:59:44'),
(30, 23, 'en', 'graphex-room', 'Graphex Room', 'Graphex Room', 'Graphex Room', '', 'default.xml', 'default.tpl', 'Graphex Room', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 00:59:58', '2020-07-21 00:59:58'),
(31, 24, 'en', 'activities', 'Activities', 'Activities', 'Activities', '', 'default.xml', 'default.tpl', 'Activities', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 01:00:20', '2020-07-21 01:00:20'),
(32, 25, 'en', '', 'Coming Soon', '', '', '', 'default.xml', 'default.tpl', '', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 01:03:03', '2020-07-21 01:03:03'),
(33, 26, 'en', '/', 'Home', 'Home', 'Home', '', 'default.xml', 'default.tpl', 'Home', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 01:14:57', '2020-07-21 01:14:57'),
(34, 26, '', '', 'Home', 'Home', 'Home', '', 'default.xml', 'default.tpl', 'Home', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 01:16:08', '2020-07-21 01:16:08'),
(35, 27, 'en', 'about', 'About', 'About', 'About', '', 'default.xml', 'default.tpl', '<div style="height:400px"><img src="/web/files/banners/en/1.jpg" style="height:100%; width:100%" /></div>\n\n<div class="container" style="color:#222222; font-family:Trebuchet MS; font-size:18px">\n<div>\n<div style="color:#222222; font-size:23px; font-weight:bold; text-align:center">The future of the world belongs to those who believe the world is owned by technology.</div>\n\n<div style="text-align:right">&mdash;Wendy Pierre</div>\n</div>\n\n<div class="divAboutUs-about margin-top-about">\n<h1>About Us</h1>\n\n<div>Graphex Technology is a platform that connects professionals, technicians,<br />\ncertified skills workers with businesses and The communities around the world<br />\nto provide business technology solutions to clients to develop the full potential of their enterprises.<br />\nGraphex has a wide array of experts, their main focus is to increase the presence of your business online,<br />\nEnhance faster operational efficiency, collaborate and meet new clients everyday.<br />\nBuilding this platform, it&rsquo;s a dream comes true in a willingness to link people all around the world,<br />\nto empower everyone to become their own boss, and reinvent themselves;<br />\nBy using their skills and abilities to sell services in the comfort of their home.<br />\nWe believe every human on earth carries a seed of business within,<br />\nthey were born to lead and be successful in their gifted areas.<br />\nGraphex is aiming to help businesses and organizations<br />\nTo become more efficient, profitable, and competitive on the market.</div>\n</div>\n\n<div class="divConnection-about margin-top-about">\n<div class="row">\n<div class="col-md-5">\n<h1>When we are connected, we become stronger</h1>\n\n<div>In addition to giving customers all around the world a fastest, secure, and safe way to get their jobs done in the comfort of their homes. We are working to linking people day by day closer to each other and make the world a better place for all. Our main goal is to allow people who have skills, innovators and international students who don&rsquo;t have a job, to be able to work while studying.</div>\n</div>\n\n<div class="col-md-7"><img src="/web/files/pictures/2.jpg" style="height:100%; width:100%" /></div>\n</div>\n</div>\n\n<div class="divHowItWork-about margin-top-about" style="font-size:14px">\n<div class="justify-content-center mb-5 pb-3 row">\n<div class="col-md-7 fadeInUp ftco-animate ftco-animated heading-section text-center">\n<h2>How It Works</h2>\n\n<h4>it&#39;s easy as 1-2-3-4.</h4>\n</div>\n</div>\n\n<div class="row">\n<div class="col-lg-3 col-md-3 fadeInUp ftco-animate ftco-animated sectionHowItWork">\n<div style="text-align:center">\n<div class="sectionHowItWork-divImage"><img src="/web/files/icons/monitor.png" /></div>\n\n<div class="sectionHowItWork-divDescription">\n<h4>1. Post a job</h4>\n\n<p>Simply post a job if you post a job<br />\nan associate will contact you within minutes.<br />\nOtherwise<br />\nyou can choose an associate<br />\nfrom our available freelancers<br />\nby going through their portfolio<br />\nand click on get a quote or<br />\nsimply send a message directly to them.</p>\n</div>\n</div>\n</div>\n\n<div class="col-lg-3 col-md-3 fadeInUp ftco-animate ftco-animated sectionHowItWork">\n<div style="text-align:center">\n<div class="sectionHowItWork-divImage"><img src="/web/files/icons/group.png" /></div>\n\n<div class="sectionHowItWork-divDescription">\n<h4>2. Choose freelancers</h4>\n\n<p>Whatever your needs are, there will be a freelancer to get it done. Services such as: Graphic and web design, Data Science, mobile app development, virtual assistants, business and marketing, Music productions, writing &amp; translations and a lot more. (See all categories). Find professionals you can trust by going through their portfolios and their profiles. You&rsquo;ll see samples of previous work and read reviews from previous customers.</p>\n</div>\n</div>\n</div>\n\n<div class="col-lg-3 col-md-3 fadeInUp ftco-animate ftco-animated sectionHowItWork">\n<div style="text-align:center">\n<div class="sectionHowItWork-divImage"><img src="/web/files/icons/lock.png" /></div>\n\n<div class="sectionHowItWork-divDescription">\n<h4>3. Secure payment</h4>\n\n<p>At Graphex Technology, your secure and safe payment is our first priority. The beauty about our company, you negotiate with the freelancer, but you pay our company. The freelancer won&rsquo;t get paid until the job is done. The freelancer will get paid when the project is completed and you&#39;re 100% satisfied. You can track the progress of your projects by sending an email to the freelancer or access the database provided by your freelancer to allow transparency.</p>\n</div>\n</div>\n</div>\n\n<div class="col-lg-3 col-md-3 fadeInUp ftco-animate ftco-animated sectionHowItWork">\n<div style="text-align:center">\n<div class="sectionHowItWork-divImage"><img src="/web/files/icons/support.png" /></div>\n\n<div class="sectionHowItWork-divDescription">\n<h4>4. 24/7 support</h4>\n\n<p>We have a team of customer supports available 24/7 and 7 days a week to answer all your questions and concerns. We speak many languages to facilitate customers to express themselves in their own languages, just so their concerns can be understood and solved. We&#39;re always here to help. Our support consists of real people who are available 24/7.</p>\n</div>\n</div>\n</div>\n</div>\n</div>\n{*=========================== Graphex Acdademy ===========================*}\n\n<div class="divAcademy-about margin-top-about"><img src="/web/files/banners/en/3.jpg" style="height:100%; width:100%" /></div>\n{*=========================== Last Div Bottom ===========================*}\n\n<div class="divBottom-about margin-top-about">\n<div>At Graphex Technology, we believe in education, helping people,<br />\nproblem solving, removing barriers are our priorities.<br />\nTherefore; we create Graphex Academy, where people who don&rsquo;t have<br />\na skill can easily learn an online course in one to three months.<br />\nAfter the completion of the course, the person will upload the certificate,<br />\nand his/her portfolio to Graphex human resources team;<br />\nand then be able to receive projects and start working right away.<br />\nProfessors can also apply to teach in our online programs.</div>\n\n<div class="div-button-about">Start Learning now Teach on Graphex</div>\n</div>\n</div>\n', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 01:16:29', '2020-07-21 01:16:29'),
(36, 28, 'en', '/blog', 'Blog', 'Blog', 'Blog', '', 'default.xml', 'default.tpl', 'Blog', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 01:16:50', '2020-07-21 01:16:50'),
(37, 29, 'en', '/academy', 'Academy', 'Academy', 'Academy', '', 'default.xml', 'default.tpl', 'Academy', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 01:17:15', '2020-07-21 01:17:15'),
(38, 30, 'en', '/events', 'Events', 'Events', 'Events', '', 'default.xml', 'default.tpl', 'Events', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 01:17:34', '2020-07-21 01:17:34'),
(39, 31, 'en', '/contact-us', 'Contact', 'Contact', 'Contact', '', 'default.xml', 'contact.tpl', 'AAAAAAAA', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-21 01:17:53', '2020-07-21 01:17:53'),
(40, 32, 'fr', '', '', '', '', '', 'default.xml', 'default.tpl', '', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-22 21:29:56', '2020-07-22 21:29:56'),
(41, 33, 'en', 'toto', 'toto', 'toto', 'toto', '', 'default.xml', 'default.tpl', 'toto', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-07-31 22:58:44', '2020-07-31 22:58:44'),
(42, 34, 'en', 'job-recruiter', 'Recruiter Needed', 'Recruiter Needed', 'Recruiter Needed', '', 'default.xml', 'default.tpl', '<span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="color:#000000"><strong>Position: </strong><a name="_Hlk49722322">International Recruiting Agent</a></span></span></span><br />\n<span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="color:#000000"><strong>Department: </strong>Business Development/ Recruitment</span></span></span><br />\n<span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="color:#000000"><strong>Responsible to: </strong><a name="_Hlk49721182">Chief Executive Officer/ Administrator and Or Designee</a></span></span></span><br />\n<span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="color:#000000"><strong>QUALIFICATIONS/ REQUIREMENTS:</strong></span></span></span><br />\n<span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="color:#000000"><span style="font-size:12pt">Exempt and non-exempt recruiting experience in full life-cycle environment, including management of multiple high-volume roles simultaneously; Minimum of 4 years&rsquo; experience recruiting in relevant industry environment, Bachelor&rsquo;s degree in Business and or Human resources with psychology, writing, communication, management, accounting and strong critical thinking skills/ problem solving and decision-making attitude. Social media influencers, experienced Bloggers in Business development; Multilingual Required, Bachelor&rsquo;s Required and Master&rsquo;s degree preferred.</span></span></span></span><br />\n<span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="color:#000000"><strong>SPECIFIC RESPONSIBILITIES: </strong></span></span></span>\n<ul>\n	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12pt">Responsible for international recruitments / outreach which entails traveling overseas/abroad to ensure various community outreach as applicable.</span></span></span></li>\n	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12pt">Establishes recruiting requirements by studying organization plans and objectives and meeting with appropriate personnel to discuss recruiting/ outreach strategies.</span></span></span></li>\n	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12pt">Builds applicant sources by researching and contacting community services, colleges, social media, databases, and online employment forums, job advertisements, contacting recruiters, and using newsgroups and job sites. providing organization information, opportunities, and benefits making presentations.</span></span></span></li>\n	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12pt">Assessing applicant&rsquo;s knowledge, skills, and experience to best suit open positions; Fostering the company&rsquo;s reputation and attractiveness as a good employment opportunity for people overseas and unemployed students by emphasizing benefits, perks and its flexibility.</span></span></span></li>\n	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12pt">Determines applicant qualifications by interviewing applicants, analyzing responses, verifying references, and comparing qualifications to job requirements and applicant&rsquo;s critical thinking skills. &nbsp;</span></span></span></li>\n	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12pt">Maintaining solid professional rapport with potential candidates by replying to &nbsp;&nbsp;&nbsp;emails from new hires having issues Completing paperwork; Function as a resource and role model to new hires and team members to ensure cohesiveness in workflow.</span></span></span></li>\n	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12pt">Evaluates applicants by discussing job requirements and applicant&rsquo;s qualifications with managers, appropriate personnel or designee.</span></span></span></li>\n</ul>\n\n<ul>\n	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12pt">Participate in job fairs and career events in person and virtually via Zoom, and or other social media platform.</span></span></span></li>\n	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12pt">Report to Quality Assurance Committee Quarterly providing recruitment reports, pros &amp; cons, and Corrective Action Plan to be in motion for the following quarter.</span></span></span></li>\n	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12pt">Conduct audits as assigned and report findings in a timely fashion to appropriate personnel.</span></span></span></li>\n	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12pt">Keeping up to date on current employment legislation, regulations within and enforcing them within the company as applicable.</span></span></span></li>\n	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12pt">Manages intern program by aiding in conducting orientations, scheduling rotations, and assignments; monitoring intern job contributions</span>, coaching interns, and advising managers on training and coaching.</span></span></li>\n</ul>\n\n<ul>\n	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12pt">Participate in departmental and interdisciplinary committees as assigned or as applicable which influence and or determine policies and revisions thereof.</span></span></span></li>\n	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12pt">Demonstrates knowledge respect and sensitivity as identified within the company&rsquo;s policies and mission statement.</span></span></span></li>\n	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12pt">Perform any special projects and assigned tasks by Chief Executive Officer/ and Or Designee.</span></span></span></li>\n	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12pt">Maintain professional competence through participation in-services and other appropriate job-related learning experiences.</span></span></span></li>\n	<li><span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="font-size:12pt">Most exhibit the ability to communicate verbal and written information in English and other known languages.</span></span></span></li>\n</ul>\n<span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="color:#000000"><a name="_Hlk49722088"><strong>RECRUITER ESSENTIAL SKILLS</strong></a></span></span></span><br />\n<span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="color:#000000"><span style="font-size:12pt">Recruiting and interviewing skills / Strong Critical thinking skills</span></span></span></span><br />\n<span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="color:#000000"><span style="font-size:12pt">Phone, Skype, and online meeting platform interaction/usage</span></span></span></span><br />\n<span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="color:#000000"><span style="font-size:12pt">Supports workplace diversity / Familiarity with relevant employment Law</span></span></span></span><br />\n<span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="color:#000000"><span style="font-size:12pt">Professionalism, organization, and project management skills</span></span></span></span><br />\n<span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="color:#000000"><strong>ACKNOWLEDGEMENT</strong></span></span></span><br />\n<span style="font-size:11pt"><span style="font-family:Calibri,sans-serif"><span style="color:#000000"><span style="font-size:12pt">I have read this job description and fully understand the requirements set forth therein. I hereby accept the position of International Recruitment Agent and agreed to perform the identified essential functions in a safe manner, and in accordance with establish procedures by the company which are subject to change at any given time with minimal or notice at all.</span></span></span></span>', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-09-03 09:20:19', '2020-09-03 09:20:19'),
(43, 35, 'en', 'Learn-on-Graphex', 'Learn on Graphex', 'Learn on Graphex', 'Learn on Graphex', '', 'default.xml', 'academy_default.tpl', '<span style="font-size:20px"><strong>Learn on Graphex</strong></span>', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-09-07 11:56:03', '2020-09-07 11:56:03'),
(44, 36, 'en', 'Teach-on-Graphex', 'Teach on Graphex', 'Teach on Graphex\n', 'Teach on Graphex\n', '', 'default.xml', 'academy_default.tpl', '<span style="font-size:20px"><strong>Teach on Graphex</strong></span>', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-09-07 11:56:28', '2020-09-07 11:56:28'),
(45, 37, 'en', '', '', '', '', '', 'default.xml', 'default.tpl', '<div class="container-fluid">\n<div class="row">\n<div class="col-md-4 mb-3 mt-3"><img alt="" src="http://www.project55.net/web/pictures/academy/discussion.JPG" />\n<h3>Unlimited Access</h3>\n</div>\n\n<div class="col-md-4 mb-3 mt-3"><img alt="" src="http://www.project55.net/web/pictures/academy/discussion.JPG" />\n<h3>Learn From Expert</h3>\n</div>\n\n<div class="col-md-4 mb-3 mt-3"><img alt="" src="http://www.project55.net/web/pictures/academy/discussion.JPG" />\n<h3>A Growing Library</h3>\n</div>\n</div>\n</div>\n', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-09-07 12:12:36', '2020-09-07 12:12:36'),
(46, 38, 'en', 'academy/help-support', 'Help & support', 'help & support', 'help & support', '', 'default.xml', 'default.tpl', 'help &amp; support', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-09-09 16:46:15', '2020-09-09 16:46:15'),
(47, 39, 'en', 'academy/about-us', 'About us', 'About us', 'About us', '', 'default.xml', 'default.tpl', 'Academy About us', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-09-09 16:50:06', '2020-09-09 16:50:06'),
(48, 40, 'en', 'academy/terms-conditions', 'Terms & conditions', 'Terms & conditions', 'Terms & conditions', '', 'default.xml', 'default.tpl', 'Terms &amp; conditions', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-09-09 16:59:04', '2020-09-09 16:59:04'),
(49, 41, 'en', 'academy/vision', 'Vision', 'Vision', 'Vision', 'Vision', 'default.xml', 'default.tpl', 'Vision', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-09-09 16:59:55', '2020-09-09 16:59:55'),
(50, 42, 'en', 'academy/contact-us', 'Contact us', 'Contact us', 'Contact us', 'Contact us', 'default.xml', 'default.tpl', 'Contact us', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-09-09 17:00:41', '2020-09-09 17:00:41'),
(52, 44, 'en', 'academy/learn-on-graphex', 'Learn on Graphex', 'Learn on Graphex', 'Learn on Graphex', 'Learn on Graphex', 'default.xml', 'default.tpl', '<a href="http://www.project55.net/cms/Learn-on-Graphex.html">Learn on Graphex</a>', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-09-09 17:07:47', '2020-09-09 17:07:47'),
(53, 45, 'en', 'academy/teach-on-graphex', 'Teach on Graphex', 'Teach on Graphex', 'Teach on Graphex', 'Teach on Graphex', 'default.xml', 'default.tpl', '<a href="http://www.project55.net/cms/Teach-on-Graphex.html">Teach on Graphex</a>', 'NO', 'YES', 'NO', 'NO', NULL, NULL, '2020-09-09 17:08:57', '2020-09-09 17:08:57');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_company`
--

CREATE TABLE IF NOT EXISTS `t_site_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `commercial` varchar(50) COLLATE utf8_bin NOT NULL,
  `ape` varchar(11) COLLATE utf8_bin NOT NULL,
  `siret` varchar(14) COLLATE utf8_bin NOT NULL,
  `tva` varchar(13) COLLATE utf8_bin NOT NULL,
  `picture` varchar(255) COLLATE utf8_bin NOT NULL,
  `header` varchar(255) COLLATE utf8_bin NOT NULL,
  `footer` varchar(255) COLLATE utf8_bin NOT NULL,
  `coordinates` varchar(64) COLLATE utf8_bin NOT NULL,
  `email` varchar(64) CHARACTER SET utf8 NOT NULL,
  `web` varchar(64) CHARACTER SET utf8 NOT NULL,
  `mobile` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `phone` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `fax` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `address1` varchar(128) COLLATE utf8_bin NOT NULL,
  `address2` varchar(128) COLLATE utf8_bin NOT NULL,
  `postcode` varchar(10) COLLATE utf8_bin NOT NULL,
  `city` varchar(50) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `state` varchar(50) COLLATE utf8_bin NOT NULL,
  `is_site` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Contenu de la table `t_site_company`
--

INSERT INTO `t_site_company` (`id`, `name`, `commercial`, `ape`, `siret`, `tva`, `picture`, `header`, `footer`, `coordinates`, `email`, `web`, `mobile`, `phone`, `fax`, `address1`, `address2`, `postcode`, `city`, `country`, `state`, `is_site`, `is_active`, `created_at`, `updated_at`) VALUES
(6, 'Graphex Technology LLC', 'Graphex', '', '', '', 'GraphexTechnologyLLC.png', '', '', '', 'graphextech@hotmail.com', 'www.graphextech.com', '0627107296', '707-308-7070', '', '99 Wall Street Suite 1498, NEW YORK, N.Y.', '', '10005', 'NEW YORK, NY', 'US', '', 'YES', 'NO', '2014-08-04 13:17:52', '2020-06-15 14:35:07');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_cookie`
--

CREATE TABLE IF NOT EXISTS `t_site_cookie` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=40 ;

--
-- Contenu de la table `t_site_cookie`
--

INSERT INTO `t_site_cookie` (`id`, `ip`, `created_at`) VALUES
(1, '127.0.0.1', '2019-12-17 17:11:29'),
(2, '127.0.0.1', '2019-12-24 18:05:27'),
(3, '127.0.0.1', '2020-01-05 12:10:31'),
(4, '127.0.0.1', '2020-01-08 22:16:43'),
(5, '127.0.0.1', '2020-01-09 19:16:35'),
(6, '127.0.0.1', '2020-01-10 21:05:45'),
(7, '127.0.0.1', '2020-01-15 09:36:48'),
(8, '127.0.0.1', '2020-01-15 21:11:11'),
(9, '127.0.0.1', '2020-01-17 11:26:16'),
(10, '127.0.0.1', '2020-01-21 09:06:36'),
(11, '127.0.0.1', '2020-04-15 22:24:22'),
(12, '127.0.0.1', '2020-04-16 18:19:17'),
(13, '127.0.0.1', '2020-07-28 23:55:45'),
(14, '127.0.0.1', '2020-08-03 23:42:12'),
(15, '127.0.0.1', '2020-08-05 23:51:15'),
(16, '127.0.0.1', '2020-08-19 19:03:50'),
(17, '127.0.0.1', '2020-08-27 22:33:08'),
(18, '127.0.0.1', '2020-09-19 10:31:49'),
(19, '127.0.0.1', '2020-09-22 19:04:18'),
(20, '127.0.0.1', '2020-09-28 08:58:03'),
(21, '127.0.0.1', '2020-09-28 16:43:16'),
(22, '127.0.0.1', '2020-10-02 12:53:50'),
(23, '105.67.134.71', '2020-10-17 16:58:37'),
(24, '105.67.134.71', '2020-10-17 20:43:14'),
(25, '76.19.152.198', '2020-10-18 14:50:59'),
(26, '142.184.69.196', '2020-10-18 15:17:23'),
(27, '66.249.65.205', '2020-10-18 18:14:34'),
(28, '68.196.101.238', '2020-10-18 19:29:43'),
(29, '76.231.25.71', '2020-10-19 01:26:45'),
(30, '104.148.216.54', '2020-10-19 03:14:32'),
(31, '76.231.25.71', '2020-10-19 03:42:58'),
(32, '191.125.18.221', '2020-10-19 05:43:09'),
(33, '191.125.18.221', '2020-10-19 05:43:09'),
(34, '191.125.18.221', '2020-10-19 05:43:09'),
(35, '104.137.203.166', '2020-10-19 14:34:24'),
(36, '200.113.230.31', '2020-10-20 21:13:19'),
(37, '76.231.25.71', '2020-10-20 23:34:27'),
(38, '168.196.126.101', '2020-10-21 01:03:03'),
(39, '66.249.66.87', '2020-10-21 06:27:16');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_country`
--

CREATE TABLE IF NOT EXISTS `t_site_country` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_1` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Contenu de la table `t_site_country`
--

INSERT INTO `t_site_country` (`id`, `code`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'AM', 'YES', '2019-02-09 16:07:04', '2019-02-09 16:13:02'),
(3, 'DE', 'YES', '2019-02-09 19:40:10', '2019-02-09 19:40:10'),
(4, 'AT', 'YES', '2019-02-09 19:40:10', '2019-02-09 19:40:10'),
(5, 'GB', 'NO', '2019-03-12 23:04:20', '0000-00-00 00:00:00'),
(6, 'NL', 'NO', '2019-03-12 23:04:20', '0000-00-00 00:00:00'),
(7, 'ES', 'NO', '2019-03-12 23:04:48', '0000-00-00 00:00:00'),
(8, 'FR', 'NO', '2019-03-12 23:04:48', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_country_i18n`
--

CREATE TABLE IF NOT EXISTS `t_site_country_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `code` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `title` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1281 ;

--
-- Contenu de la table `t_site_country_i18n`
--

INSERT INTO `t_site_country_i18n` (`id`, `lang`, `code`, `title`) VALUES
(4, 'en', 'AF', 'Afghanistan'),
(8, 'en', 'AL', 'Albania'),
(12, 'en', 'DZ', 'Algeria'),
(20, 'en', 'AD', 'Andorra'),
(24, 'en', 'AO', 'Angola'),
(28, 'en', 'AG', 'Antigua and Barbuda'),
(31, 'en', 'AZ', 'Azerbaijan'),
(32, 'en', 'AR', 'Argentina'),
(36, 'en', 'AU', 'Australia'),
(40, 'en', 'AT', 'Austria'),
(44, 'en', 'BS', 'Bahamas'),
(48, 'en', 'BH', 'Bahrain'),
(50, 'en', 'BD', 'Bangladesh'),
(51, 'en', 'AM', 'Armenia'),
(52, 'en', 'BB', 'Barbados'),
(56, 'en', 'BE', 'Belgium'),
(64, 'en', 'BT', 'Bhutan'),
(68, 'en', 'BO', 'Bolivia (Plurinational State of)'),
(70, 'en', 'BA', 'Bosnia and Herzegovina'),
(72, 'en', 'BW', 'Botswana'),
(76, 'en', 'BR', 'Brazil'),
(84, 'en', 'BZ', 'Belize'),
(90, 'en', 'SB', 'Solomon Islands'),
(96, 'en', 'BN', 'Brunei Darussalam'),
(100, 'en', 'BG', 'Bulgaria'),
(104, 'en', 'MM', 'Myanmar'),
(108, 'en', 'BI', 'Burundi'),
(112, 'en', 'BY', 'Belarus'),
(116, 'en', 'KH', 'Cambodia'),
(120, 'en', 'CM', 'Cameroon'),
(124, 'en', 'CA', 'Canada'),
(132, 'en', 'CV', 'Cabo Verde'),
(140, 'en', 'CF', 'Central African Republic'),
(144, 'en', 'LK', 'Sri Lanka'),
(148, 'en', 'TD', 'Chad'),
(152, 'en', 'CL', 'Chile'),
(156, 'en', 'CN', 'China'),
(170, 'en', 'CO', 'Colombia'),
(174, 'en', 'KM', 'Comoros'),
(178, 'en', 'CG', 'Congo'),
(180, 'en', 'CD', 'Congo, Democratic Republic of the'),
(188, 'en', 'CR', 'Costa Rica'),
(191, 'en', 'HR', 'Croatia'),
(192, 'en', 'CU', 'Cuba'),
(196, 'en', 'CY', 'Cyprus'),
(203, 'en', 'CZ', 'Czechia'),
(204, 'en', 'BJ', 'Benin'),
(208, 'en', 'DK', 'Denmark'),
(212, 'en', 'DM', 'Dominica'),
(214, 'en', 'DO', 'Dominican Republic'),
(218, 'en', 'EC', 'Ecuador'),
(222, 'en', 'SV', 'El Salvador'),
(226, 'en', 'GQ', 'Equatorial Guinea'),
(231, 'en', 'ET', 'Ethiopia'),
(232, 'en', 'ER', 'Eritrea'),
(233, 'en', 'EE', 'Estonia'),
(242, 'en', 'FJ', 'Fiji'),
(246, 'en', 'FI', 'Finland'),
(250, 'en', 'FR', 'France'),
(262, 'en', 'DJ', 'Djibouti'),
(266, 'en', 'GA', 'Gabon'),
(268, 'en', 'GE', 'Georgia'),
(270, 'en', 'GM', 'Gambia'),
(276, 'en', 'DE', 'Germany'),
(288, 'en', 'GH', 'Ghana'),
(296, 'en', 'KI', 'Kiribati'),
(300, 'en', 'GR', 'Greece'),
(308, 'en', 'GD', 'Grenada'),
(320, 'en', 'GT', 'Guatemala'),
(324, 'en', 'GN', 'Guinea'),
(328, 'en', 'GY', 'Guyana'),
(332, 'en', 'HT', 'Haiti'),
(340, 'en', 'HN', 'Honduras'),
(348, 'en', 'HU', 'Hungary'),
(352, 'en', 'IS', 'Iceland'),
(356, 'en', 'IN', 'India'),
(360, 'en', 'ID', 'Indonesia'),
(364, 'en', 'IR', 'Iran (Islamic Republic of)'),
(368, 'en', 'IQ', 'Iraq'),
(372, 'en', 'IE', 'Ireland'),
(376, 'en', 'IL', 'Israel'),
(380, 'en', 'IT', 'Italy'),
(384, 'en', 'CI', 'Côte d''Ivoire'),
(388, 'en', 'JM', 'Jamaica'),
(392, 'en', 'JP', 'Japan'),
(398, 'en', 'KZ', 'Kazakhstan'),
(400, 'en', 'JO', 'Jordan'),
(404, 'en', 'KE', 'Kenya'),
(408, 'en', 'KP', 'Korea (Democratic People''s Republic of)'),
(410, 'en', 'KR', 'Korea, Republic of'),
(414, 'en', 'KW', 'Kuwait'),
(417, 'en', 'KG', 'Kyrgyzstan'),
(418, 'en', 'LA', 'Lao People''s Democratic Republic'),
(422, 'en', 'LB', 'Lebanon'),
(426, 'en', 'LS', 'Lesotho'),
(428, 'en', 'LV', 'Latvia'),
(430, 'en', 'LR', 'Liberia'),
(434, 'en', 'LY', 'Libya'),
(438, 'en', 'LI', 'Liechtenstein'),
(440, 'en', 'LT', 'Lithuania'),
(442, 'en', 'LU', 'Luxembourg'),
(450, 'en', 'MG', 'Madagascar'),
(454, 'en', 'MW', 'Malawi'),
(458, 'en', 'MY', 'Malaysia'),
(462, 'en', 'MV', 'Maldives'),
(466, 'en', 'ML', 'Mali'),
(470, 'en', 'MT', 'Malta'),
(478, 'en', 'MR', 'Mauritania'),
(480, 'en', 'MU', 'Mauritius'),
(484, 'en', 'MX', 'Mexico'),
(492, 'en', 'MC', 'Monaco'),
(496, 'en', 'MN', 'Mongolia'),
(498, 'en', 'MD', 'Moldova, Republic of'),
(499, 'en', 'ME', 'Montenegro'),
(504, 'en', 'MA', 'Morocco'),
(508, 'en', 'MZ', 'Mozambique'),
(512, 'en', 'OM', 'Oman'),
(516, 'en', 'NA', 'Namibia'),
(520, 'en', 'NR', 'Nauru'),
(524, 'en', 'NP', 'Nepal'),
(528, 'en', 'NL', 'Netherlands'),
(548, 'en', 'VU', 'Vanuatu'),
(554, 'en', 'NZ', 'New Zealand'),
(558, 'en', 'NI', 'Nicaragua'),
(562, 'en', 'NE', 'Niger'),
(566, 'en', 'NG', 'Nigeria'),
(578, 'en', 'NO', 'Norway'),
(583, 'en', 'FM', 'Micronesia (Federated States of)'),
(584, 'en', 'MH', 'Marshall Islands'),
(585, 'en', 'PW', 'Palau'),
(586, 'en', 'PK', 'Pakistan'),
(591, 'en', 'PA', 'Panama'),
(598, 'en', 'PG', 'Papua New Guinea'),
(600, 'en', 'PY', 'Paraguay'),
(604, 'en', 'PE', 'Peru'),
(608, 'en', 'PH', 'Philippines'),
(616, 'en', 'PL', 'Poland'),
(620, 'en', 'PT', 'Portugal'),
(624, 'en', 'GW', 'Guinea-Bissau'),
(626, 'en', 'TL', 'Timor-Leste'),
(634, 'en', 'QA', 'Qatar'),
(642, 'en', 'RO', 'Romania'),
(643, 'en', 'RU', 'Russian Federation'),
(646, 'en', 'RW', 'Rwanda'),
(659, 'en', 'KN', 'Saint Kitts and Nevis'),
(662, 'en', 'LC', 'Saint Lucia'),
(670, 'en', 'VC', 'Saint Vincent and the Grenadines'),
(674, 'en', 'SM', 'San Marino'),
(678, 'en', 'ST', 'Sao Tome and Principe'),
(682, 'en', 'SA', 'Saudi Arabia'),
(686, 'en', 'SN', 'Senegal'),
(688, 'en', 'RS', 'Serbia'),
(690, 'en', 'SC', 'Seychelles'),
(694, 'en', 'SL', 'Sierra Leone'),
(702, 'en', 'SG', 'Singapore'),
(703, 'en', 'SK', 'Slovakia'),
(704, 'en', 'VN', 'Viet Nam'),
(705, 'en', 'SI', 'Slovenia'),
(706, 'en', 'SO', 'Somalia'),
(710, 'en', 'ZA', 'South Africa'),
(716, 'en', 'ZW', 'Zimbabwe'),
(724, 'en', 'ES', 'Spain'),
(728, 'en', 'SS', 'South Sudan'),
(729, 'en', 'SD', 'Sudan'),
(740, 'en', 'SR', 'Suriname'),
(748, 'en', 'SZ', 'Eswatini'),
(752, 'en', 'SE', 'Sweden'),
(756, 'en', 'CH', 'Switzerland'),
(760, 'en', 'SY', 'Syrian Arab Republic'),
(762, 'en', 'TJ', 'Tajikistan'),
(764, 'en', 'TH', 'Thailand'),
(768, 'en', 'TG', 'Togo'),
(776, 'en', 'TO', 'Tonga'),
(780, 'en', 'TT', 'Trinidad and Tobago'),
(784, 'en', 'AE', 'United Arab Emirates'),
(788, 'en', 'TN', 'Tunisia'),
(792, 'en', 'TR', 'Turkey'),
(795, 'en', 'TM', 'Turkmenistan'),
(798, 'en', 'TV', 'Tuvalu'),
(800, 'en', 'UG', 'Uganda'),
(804, 'en', 'UA', 'Ukraine'),
(807, 'en', 'MK', 'North Macedonia'),
(818, 'en', 'EG', 'Egypt'),
(826, 'en', 'GB', 'United Kingdom of Great Britain and Northern Ireland'),
(834, 'en', 'TZ', 'Tanzania, United Republic of'),
(840, 'en', 'US', 'United States of America'),
(854, 'en', 'BF', 'Burkina Faso'),
(858, 'en', 'UY', 'Uruguay'),
(860, 'en', 'UZ', 'Uzbekistan'),
(862, 'en', 'VE', 'Venezuela (Bolivarian Republic of)'),
(882, 'en', 'WS', 'Samoa'),
(887, 'en', 'YE', 'Yemen'),
(894, 'en', 'ZM', 'Zambia'),
(895, 'fr', 'AF', 'Afghanistan'),
(896, 'fr', 'AL', 'Albanie'),
(897, 'fr', 'DZ', 'Algérie'),
(898, 'fr', 'AD', 'Andorre'),
(899, 'fr', 'AO', 'Angola'),
(900, 'fr', 'AG', 'Antigua-et-Barbuda'),
(901, 'fr', 'AZ', 'Azerbaïdjan'),
(902, 'fr', 'AR', 'Argentine'),
(903, 'fr', 'AU', 'Australie'),
(904, 'fr', 'AT', 'Autriche'),
(905, 'fr', 'BS', 'Bahamas'),
(906, 'fr', 'BH', 'Bahreïn'),
(907, 'fr', 'BD', 'Bangladesh'),
(908, 'fr', 'AM', 'Arménie'),
(909, 'fr', 'BB', 'Barbade'),
(910, 'fr', 'BE', 'Belgique'),
(911, 'fr', 'BT', 'Bhoutan'),
(912, 'fr', 'BO', 'Bolivie'),
(913, 'fr', 'BA', 'Bosnie-Herzégovine'),
(914, 'fr', 'BW', 'Botswana'),
(915, 'fr', 'BR', 'Brésil'),
(916, 'fr', 'BZ', 'Belize'),
(917, 'fr', 'SB', 'Salomon'),
(918, 'fr', 'BN', 'Brunei'),
(919, 'fr', 'BG', 'Bulgarie'),
(920, 'fr', 'MM', 'Birmanie'),
(921, 'fr', 'BI', 'Burundi'),
(922, 'fr', 'BY', 'Biélorussie'),
(923, 'fr', 'KH', 'Cambodge'),
(924, 'fr', 'CM', 'Cameroun'),
(925, 'fr', 'CA', 'Canada'),
(926, 'fr', 'CV', 'Cap-Vert'),
(927, 'fr', 'CF', 'République centrafricaine'),
(928, 'fr', 'LK', 'Sri Lanka'),
(929, 'fr', 'TD', 'Tchad'),
(930, 'fr', 'CL', 'Chili'),
(931, 'fr', 'CN', 'Chine'),
(932, 'fr', 'CO', 'Colombie'),
(933, 'fr', 'KM', 'Comores (pays)'),
(934, 'fr', 'CG', 'République du Congo'),
(935, 'fr', 'CD', 'République démocratique du Congo'),
(936, 'fr', 'CR', 'Costa Rica'),
(937, 'fr', 'HR', 'Croatie'),
(938, 'fr', 'CU', 'Cuba'),
(939, 'fr', 'CY', 'Chypre (pays)'),
(940, 'fr', 'CZ', 'Tchéquie'),
(941, 'fr', 'BJ', 'Bénin'),
(942, 'fr', 'DK', 'Danemark'),
(943, 'fr', 'DM', 'Dominique'),
(944, 'fr', 'DO', 'République dominicaine'),
(945, 'fr', 'EC', 'Équateur (pays)'),
(946, 'fr', 'SV', 'Salvador'),
(947, 'fr', 'GQ', 'Guinée équatoriale'),
(948, 'fr', 'ET', 'Éthiopie'),
(949, 'fr', 'ER', 'Érythrée'),
(950, 'fr', 'EE', 'Estonie'),
(951, 'fr', 'FJ', 'Fidji'),
(952, 'fr', 'FI', 'Finlande'),
(953, 'fr', 'FR', 'France'),
(954, 'fr', 'DJ', 'Djibouti'),
(955, 'fr', 'GA', 'Gabon'),
(956, 'fr', 'GE', 'Géorgie (pays)'),
(957, 'fr', 'GM', 'Gambie'),
(958, 'fr', 'DE', 'Allemagne'),
(959, 'fr', 'GH', 'Ghana'),
(960, 'fr', 'KI', 'Kiribati'),
(961, 'fr', 'GR', 'Grèce'),
(962, 'fr', 'GD', 'Grenade (pays)'),
(963, 'fr', 'GT', 'Guatemala'),
(964, 'fr', 'GN', 'Guinée'),
(965, 'fr', 'GY', 'Guyana'),
(966, 'fr', 'HT', 'Haïti'),
(967, 'fr', 'HN', 'Honduras'),
(968, 'fr', 'HU', 'Hongrie'),
(969, 'fr', 'IS', 'Islande'),
(970, 'fr', 'IN', 'Inde'),
(971, 'fr', 'ID', 'Indonésie'),
(972, 'fr', 'IR', 'Iran'),
(973, 'fr', 'IQ', 'Irak'),
(974, 'fr', 'IE', 'Irlande (pays)'),
(975, 'fr', 'IL', 'Israël'),
(976, 'fr', 'IT', 'Italie'),
(977, 'fr', 'CI', 'Côte d''Ivoire'),
(978, 'fr', 'JM', 'Jamaïque'),
(979, 'fr', 'JP', 'Japon'),
(980, 'fr', 'KZ', 'Kazakhstan'),
(981, 'fr', 'JO', 'Jordanie'),
(982, 'fr', 'KE', 'Kenya'),
(983, 'fr', 'KP', 'Corée du Nord'),
(984, 'fr', 'KR', 'Corée du Sud'),
(985, 'fr', 'KW', 'Koweït'),
(986, 'fr', 'KG', 'Kirghizistan'),
(987, 'fr', 'LA', 'Laos'),
(988, 'fr', 'LB', 'Liban'),
(989, 'fr', 'LS', 'Lesotho'),
(990, 'fr', 'LV', 'Lettonie'),
(991, 'fr', 'LR', 'Liberia'),
(992, 'fr', 'LY', 'Libye'),
(993, 'fr', 'LI', 'Liechtenstein'),
(994, 'fr', 'LT', 'Lituanie'),
(995, 'fr', 'LU', 'Luxembourg (pays)'),
(996, 'fr', 'MG', 'Madagascar'),
(997, 'fr', 'MW', 'Malawi'),
(998, 'fr', 'MY', 'Malaisie'),
(999, 'fr', 'MV', 'Maldives'),
(1000, 'fr', 'ML', 'Mali'),
(1001, 'fr', 'MT', 'Malte'),
(1002, 'fr', 'MR', 'Mauritanie'),
(1003, 'fr', 'MU', 'Maurice (pays)'),
(1004, 'fr', 'MX', 'Mexique'),
(1005, 'fr', 'MC', 'Monaco'),
(1006, 'fr', 'MN', 'Mongolie'),
(1007, 'fr', 'MD', 'Moldavie'),
(1008, 'fr', 'ME', 'Monténégro'),
(1009, 'fr', 'MA', 'Maroc'),
(1010, 'fr', 'MZ', 'Mozambique'),
(1011, 'fr', 'OM', 'Oman'),
(1012, 'fr', 'NA', 'Namibie'),
(1013, 'fr', 'NR', 'Nauru'),
(1014, 'fr', 'NP', 'Népal'),
(1015, 'fr', 'NL', 'Pays-Bas'),
(1016, 'fr', 'VU', 'Vanuatu'),
(1017, 'fr', 'NZ', 'Nouvelle-Zélande'),
(1018, 'fr', 'NI', 'Nicaragua'),
(1019, 'fr', 'NE', 'Niger'),
(1020, 'fr', 'NG', 'Nigeria'),
(1021, 'fr', 'NO', 'Norvège'),
(1022, 'fr', 'FM', 'États fédérés de Micronésie (pays)'),
(1023, 'fr', 'MH', 'Îles Marshall (pays)'),
(1024, 'fr', 'PW', 'Palaos'),
(1025, 'fr', 'PK', 'Pakistan'),
(1026, 'fr', 'PA', 'Panama'),
(1027, 'fr', 'PG', 'Papouasie-Nouvelle-Guinée'),
(1028, 'fr', 'PY', 'Paraguay'),
(1029, 'fr', 'PE', 'Pérou'),
(1030, 'fr', 'PH', 'Philippines'),
(1031, 'fr', 'PL', 'Pologne'),
(1032, 'fr', 'PT', 'Portugal'),
(1033, 'fr', 'GW', 'Guinée-Bissau'),
(1034, 'fr', 'TL', 'Timor oriental'),
(1035, 'fr', 'QA', 'Qatar'),
(1036, 'fr', 'RO', 'Roumanie'),
(1037, 'fr', 'RU', 'Russie'),
(1038, 'fr', 'RW', 'Rwanda'),
(1039, 'fr', 'KN', 'Saint-Christophe-et-Niévès'),
(1040, 'fr', 'LC', 'Sainte-Lucie'),
(1041, 'fr', 'VC', 'Saint-Vincent-et-les-Grenadines'),
(1042, 'fr', 'SM', 'Saint-Marin'),
(1043, 'fr', 'ST', 'Sao Tomé-et-Principe'),
(1044, 'fr', 'SA', 'Arabie saoudite'),
(1045, 'fr', 'SN', 'Sénégal'),
(1046, 'fr', 'RS', 'Serbie'),
(1047, 'fr', 'SC', 'Seychelles'),
(1048, 'fr', 'SL', 'Sierra Leone'),
(1049, 'fr', 'SG', 'Singapour'),
(1050, 'fr', 'SK', 'Slovaquie'),
(1051, 'fr', 'VN', 'Viêt Nam'),
(1052, 'fr', 'SI', 'Slovénie'),
(1053, 'fr', 'SO', 'Somalie'),
(1054, 'fr', 'ZA', 'Afrique du Sud'),
(1055, 'fr', 'ZW', 'Zimbabwe'),
(1056, 'fr', 'ES', 'Espagne'),
(1057, 'fr', 'SS', 'Soudan du Sud'),
(1058, 'fr', 'SD', 'Soudan'),
(1059, 'fr', 'SR', 'Suriname'),
(1060, 'fr', 'SZ', 'Eswatini'),
(1061, 'fr', 'SE', 'Suède'),
(1062, 'fr', 'CH', 'Suisse'),
(1063, 'fr', 'SY', 'Syrie'),
(1064, 'fr', 'TJ', 'Tadjikistan'),
(1065, 'fr', 'TH', 'Thaïlande'),
(1066, 'fr', 'TG', 'Togo'),
(1067, 'fr', 'TO', 'Tonga'),
(1068, 'fr', 'TT', 'Trinité-et-Tobago'),
(1069, 'fr', 'AE', 'Émirats arabes unis'),
(1070, 'fr', 'TN', 'Tunisie'),
(1071, 'fr', 'TR', 'Turquie'),
(1072, 'fr', 'TM', 'Turkménistan'),
(1073, 'fr', 'TV', 'Tuvalu'),
(1074, 'fr', 'UG', 'Ouganda'),
(1075, 'fr', 'UA', 'Ukraine'),
(1076, 'fr', 'MK', 'Macédoine du Nord'),
(1077, 'fr', 'EG', 'Égypte'),
(1078, 'fr', 'GB', 'Royaume-Uni'),
(1079, 'fr', 'TZ', 'Tanzanie'),
(1080, 'fr', 'US', 'États-Unis'),
(1081, 'fr', 'BF', 'Burkina Faso'),
(1082, 'fr', 'UY', 'Uruguay'),
(1083, 'fr', 'UZ', 'Ouzbékistan'),
(1084, 'fr', 'VE', 'Venezuela'),
(1085, 'fr', 'WS', 'Samoa'),
(1086, 'fr', 'YE', 'Yémen'),
(1087, 'fr', 'ZM', 'Zambie'),
(1088, 'es', 'AF', 'Afganistán'),
(1089, 'es', 'AL', 'Albania'),
(1090, 'es', 'DZ', 'Argelia'),
(1091, 'es', 'AD', 'Andorra'),
(1092, 'es', 'AO', 'Angola'),
(1093, 'es', 'AG', 'Antigua y Barbuda'),
(1094, 'es', 'AZ', 'Azerbaiyán'),
(1095, 'es', 'AR', 'Argentina'),
(1096, 'es', 'AU', 'Australia'),
(1097, 'es', 'AT', 'Austria'),
(1098, 'es', 'BS', 'Bahamas'),
(1099, 'es', 'BH', 'Baréin'),
(1100, 'es', 'BD', 'Bangladés'),
(1101, 'es', 'AM', 'Armenia'),
(1102, 'es', 'BB', 'Barbados'),
(1103, 'es', 'BE', 'Bélgica'),
(1104, 'es', 'BT', 'Bután'),
(1105, 'es', 'BO', 'Bolivia'),
(1106, 'es', 'BA', 'Bosnia y Herzegovina'),
(1107, 'es', 'BW', 'Botsuana'),
(1108, 'es', 'BR', 'Brasil'),
(1109, 'es', 'BZ', 'Belice'),
(1110, 'es', 'SB', 'Islas Salomón'),
(1111, 'es', 'BN', 'Brunéi'),
(1112, 'es', 'BG', 'Bulgaria'),
(1113, 'es', 'MM', 'Birmania'),
(1114, 'es', 'BI', 'Burundi'),
(1115, 'es', 'BY', 'Bielorrusia'),
(1116, 'es', 'KH', 'Camboya'),
(1117, 'es', 'CM', 'Camerún'),
(1118, 'es', 'CA', 'Canadá'),
(1119, 'es', 'CV', 'Cabo Verde'),
(1120, 'es', 'CF', 'República Centroafricana'),
(1121, 'es', 'LK', 'Sri Lanka'),
(1122, 'es', 'TD', 'Chad'),
(1123, 'es', 'CL', 'Chile'),
(1124, 'es', 'CN', 'China'),
(1125, 'es', 'CO', 'Colombia'),
(1126, 'es', 'KM', 'Comoras'),
(1127, 'es', 'CG', 'República del Congo'),
(1128, 'es', 'CD', 'República Democrática del Congo'),
(1129, 'es', 'CR', 'Costa Rica'),
(1130, 'es', 'HR', 'Croacia'),
(1131, 'es', 'CU', 'Cuba'),
(1132, 'es', 'CY', 'Chipre'),
(1133, 'es', 'CZ', 'República Checa'),
(1134, 'es', 'BJ', 'Benín'),
(1135, 'es', 'DK', 'Dinamarca'),
(1136, 'es', 'DM', 'Dominica'),
(1137, 'es', 'DO', 'República Dominicana'),
(1138, 'es', 'EC', 'Ecuador'),
(1139, 'es', 'SV', 'El Salvador'),
(1140, 'es', 'GQ', 'Guinea Ecuatorial'),
(1141, 'es', 'ET', 'Etiopía'),
(1142, 'es', 'ER', 'Eritrea'),
(1143, 'es', 'EE', 'Estonia'),
(1144, 'es', 'FJ', 'Fiyi'),
(1145, 'es', 'FI', 'Finlandia'),
(1146, 'es', 'FR', 'Francia'),
(1147, 'es', 'DJ', 'Yibuti'),
(1148, 'es', 'GA', 'Gabón'),
(1149, 'es', 'GE', 'Georgia'),
(1150, 'es', 'GM', 'Gambia'),
(1151, 'es', 'DE', 'Alemania'),
(1152, 'es', 'GH', 'Ghana'),
(1153, 'es', 'KI', 'Kiribati'),
(1154, 'es', 'GR', 'Grecia'),
(1155, 'es', 'GD', 'Granada'),
(1156, 'es', 'GT', 'Guatemala'),
(1157, 'es', 'GN', 'Guinea'),
(1158, 'es', 'GY', 'Guyana'),
(1159, 'es', 'HT', 'Haití'),
(1160, 'es', 'HN', 'Honduras'),
(1161, 'es', 'HU', 'Hungría'),
(1162, 'es', 'IS', 'Islandia'),
(1163, 'es', 'IN', 'India'),
(1164, 'es', 'ID', 'Indonesia'),
(1165, 'es', 'IR', 'Irán'),
(1166, 'es', 'IQ', 'Irak'),
(1167, 'es', 'IE', 'Irlanda'),
(1168, 'es', 'IL', 'Israel'),
(1169, 'es', 'IT', 'Italia'),
(1170, 'es', 'CI', 'Costa de Marfil'),
(1171, 'es', 'JM', 'Jamaica'),
(1172, 'es', 'JP', 'Japón'),
(1173, 'es', 'KZ', 'Kazajistán'),
(1174, 'es', 'JO', 'Jordania'),
(1175, 'es', 'KE', 'Kenia'),
(1176, 'es', 'KP', 'Corea del Norte'),
(1177, 'es', 'KR', 'Corea del Sur'),
(1178, 'es', 'KW', 'Kuwait'),
(1179, 'es', 'KG', 'Kirguistán'),
(1180, 'es', 'LA', 'Laos'),
(1181, 'es', 'LB', 'Líbano'),
(1182, 'es', 'LS', 'Lesoto'),
(1183, 'es', 'LV', 'Letonia'),
(1184, 'es', 'LR', 'Liberia'),
(1185, 'es', 'LY', 'Libia'),
(1186, 'es', 'LI', 'Liechtenstein'),
(1187, 'es', 'LT', 'Lituania'),
(1188, 'es', 'LU', 'Luxemburgo'),
(1189, 'es', 'MG', 'Madagascar'),
(1190, 'es', 'MW', 'Malaui'),
(1191, 'es', 'MY', 'Malasia'),
(1192, 'es', 'MV', 'Maldivas'),
(1193, 'es', 'ML', 'Malí'),
(1194, 'es', 'MT', 'Malta'),
(1195, 'es', 'MR', 'Mauritania'),
(1196, 'es', 'MU', 'Mauricio'),
(1197, 'es', 'MX', 'México'),
(1198, 'es', 'MC', 'Mónaco'),
(1199, 'es', 'MN', 'Mongolia'),
(1200, 'es', 'MD', 'Moldavia'),
(1201, 'es', 'ME', 'Montenegro'),
(1202, 'es', 'MA', 'Marruecos'),
(1203, 'es', 'MZ', 'Mozambique'),
(1204, 'es', 'OM', 'Omán'),
(1205, 'es', 'NA', 'Namibia'),
(1206, 'es', 'NR', 'Nauru'),
(1207, 'es', 'NP', 'Nepal'),
(1208, 'es', 'NL', 'Países Bajos'),
(1209, 'es', 'VU', 'Vanuatu'),
(1210, 'es', 'NZ', 'Nueva Zelanda'),
(1211, 'es', 'NI', 'Nicaragua'),
(1212, 'es', 'NE', 'Níger'),
(1213, 'es', 'NG', 'Nigeria'),
(1214, 'es', 'NO', 'Noruega'),
(1215, 'es', 'FM', 'Micronesia'),
(1216, 'es', 'MH', 'Islas Marshall'),
(1217, 'es', 'PW', 'Palaos'),
(1218, 'es', 'PK', 'Pakistán'),
(1219, 'es', 'PA', 'Panamá'),
(1220, 'es', 'PG', 'Papúa Nueva Guinea'),
(1221, 'es', 'PY', 'Paraguay'),
(1222, 'es', 'PE', 'Perú'),
(1223, 'es', 'PH', 'Filipinas'),
(1224, 'es', 'PL', 'Polonia'),
(1225, 'es', 'PT', 'Portugal'),
(1226, 'es', 'GW', 'Guinea-Bisáu'),
(1227, 'es', 'TL', 'Timor Oriental'),
(1228, 'es', 'QA', 'Catar'),
(1229, 'es', 'RO', 'Rumania'),
(1230, 'es', 'RU', 'Rusia'),
(1231, 'es', 'RW', 'Ruanda'),
(1232, 'es', 'KN', 'San Cristóbal y Nieves'),
(1233, 'es', 'LC', 'Santa Lucía'),
(1234, 'es', 'VC', 'San Vicente y las Granadinas'),
(1235, 'es', 'SM', 'San Marino'),
(1236, 'es', 'ST', 'Santo Tomé y Príncipe'),
(1237, 'es', 'SA', 'Arabia Saudita'),
(1238, 'es', 'SN', 'Senegal'),
(1239, 'es', 'RS', 'Serbia'),
(1240, 'es', 'SC', 'Seychelles'),
(1241, 'es', 'SL', 'Sierra Leona'),
(1242, 'es', 'SG', 'Singapur'),
(1243, 'es', 'SK', 'Eslovaquia'),
(1244, 'es', 'VN', 'Vietnam'),
(1245, 'es', 'SI', 'Eslovenia'),
(1246, 'es', 'SO', 'Somalia'),
(1247, 'es', 'ZA', 'Sudáfrica'),
(1248, 'es', 'ZW', 'Zimbabue'),
(1249, 'es', 'ES', 'España'),
(1250, 'es', 'SS', 'Sudán del Sur'),
(1251, 'es', 'SD', 'Sudán'),
(1252, 'es', 'SR', 'Surinam'),
(1253, 'es', 'SZ', 'Suazilandia'),
(1254, 'es', 'SE', 'Suecia'),
(1255, 'es', 'CH', 'Suiza'),
(1256, 'es', 'SY', 'Siria'),
(1257, 'es', 'TJ', 'Tayikistán'),
(1258, 'es', 'TH', 'Tailandia'),
(1259, 'es', 'TG', 'Togo'),
(1260, 'es', 'TO', 'Tonga'),
(1261, 'es', 'TT', 'Trinidad y Tobago'),
(1262, 'es', 'AE', 'Emiratos Árabes Unidos'),
(1263, 'es', 'TN', 'Túnez'),
(1264, 'es', 'TR', 'Turquía'),
(1265, 'es', 'TM', 'Turkmenistán'),
(1266, 'es', 'TV', 'Tuvalu'),
(1267, 'es', 'UG', 'Uganda'),
(1268, 'es', 'UA', 'Ucrania'),
(1269, 'es', 'MK', 'Macedonia del Norte'),
(1270, 'es', 'EG', 'Egipto'),
(1271, 'es', 'GB', 'Reino Unido'),
(1272, 'es', 'TZ', 'Tanzania'),
(1273, 'es', 'US', 'Estados Unidos'),
(1274, 'es', 'BF', 'Burkina Faso'),
(1275, 'es', 'UY', 'Uruguay'),
(1276, 'es', 'UZ', 'Uzbekistán'),
(1277, 'es', 'VE', 'Venezuela'),
(1278, 'es', 'WS', 'Samoa'),
(1279, 'es', 'YE', 'Yemen'),
(1280, 'es', 'ZM', 'Zambia');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_country_language`
--

CREATE TABLE IF NOT EXISTS `t_site_country_language` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(11) unsigned DEFAULT NULL,
  `language_id` int(11) unsigned DEFAULT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_country_language_fk0` (`language_id`),
  KEY `site_country_language_fk1` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `t_site_country_language`
--

INSERT INTO `t_site_country_language` (`id`, `country_id`, `language_id`, `position`, `created_at`, `updated_at`) VALUES
(9, 5, 9, 0, '2019-04-13 23:43:13', '2019-04-13 23:43:13');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_currency`
--

CREATE TABLE IF NOT EXISTS `t_site_currency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(6,3) NOT NULL DEFAULT '0.000',
  `code` varchar(3) COLLATE utf8_bin NOT NULL,
  `position` int(11) unsigned NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_site_currency`
--

INSERT INTO `t_site_currency` (`id`, `rate`, `code`, `position`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1.000, 'USD', 0, 'YES', '2013-09-20 22:39:28', '2020-05-07 22:44:08');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_event`
--

CREATE TABLE IF NOT EXISTS `t_site_event` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `reference` varchar(32) COLLATE utf8_bin DEFAULT '',
  `city` varchar(128) COLLATE utf8_bin NOT NULL,
  `city_id` int(11) unsigned DEFAULT NULL,
  `place_id` int(11) unsigned DEFAULT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `picture` varchar(64) COLLATE utf8_bin NOT NULL,
  `number_of_people` int(11) unsigned DEFAULT NULL,
  `in_at` date DEFAULT NULL,
  `out_at` date DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `duration` int(11) unsigned NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL,
  `status` enum('ACTIVE','DELETE','UPLOAD') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Contenu de la table `t_site_event`
--

INSERT INTO `t_site_event` (`id`, `name`, `reference`, `city`, `city_id`, `place_id`, `country`, `picture`, `number_of_people`, `in_at`, `out_at`, `price`, `duration`, `is_active`, `status`, `published_at`, `created_at`, `updated_at`) VALUES
(3, '', '', 'PARIS', NULL, 0, 'FR', 'Graphex Technology LLC .png', 100, '2020-10-10', '2020-10-10', 0.00, 0, 'YES', 'ACTIVE', NULL, '2020-10-10 10:56:12', '2020-10-10 15:53:54'),
(4, '', 'A2020101000004', 'New York', NULL, 0, 'US', '', 100, '2020-10-10', '2020-10-10', 0.00, 0, 'NO', 'ACTIVE', NULL, '2020-10-10 16:39:00', '2020-10-10 16:39:00');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_event_document`
--

CREATE TABLE IF NOT EXISTS `t_site_event_document` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `file` varchar(128) COLLATE utf8_bin NOT NULL,
  `extension` varchar(10) COLLATE utf8_bin NOT NULL,
  `event_id` int(11) unsigned NOT NULL,
  `filesize` int(11) unsigned DEFAULT NULL,
  `is_public` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'Y',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_event_document_fk0` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_site_event_i18n`
--

CREATE TABLE IF NOT EXISTS `t_site_event_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `url` varchar(255) COLLATE utf8_bin DEFAULT '',
  `meta_title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `meta_description` varchar(512) COLLATE utf8_bin DEFAULT '',
  `short_description` varchar(512) COLLATE utf8_bin DEFAULT '',
  `meta_keyword` varchar(512) COLLATE utf8_bin NOT NULL,
  `meta_robots` varchar(64) COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin,
  `event_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`event_id`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Contenu de la table `t_site_event_i18n`
--

INSERT INTO `t_site_event_i18n` (`id`, `lang`, `url`, `meta_title`, `meta_description`, `short_description`, `meta_keyword`, `meta_robots`, `content`, `event_id`, `created_at`, `updated_at`) VALUES
(1, 'en', 'ttttttttttttttttttttttttt', 'ttttttttttttttttttttttttt', 'ssssss', '', '', '', '', 3, '2020-10-10 12:12:49', '2020-10-10 12:32:49'),
(2, 'en', 'my-first-event', 'my first event', 'my first event', 'description first event', 'my first event', '', 'Contenu first event 32 kb', 4, '2020-10-10 17:39:00', '2020-10-10 17:39:00');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_event_place`
--

CREATE TABLE IF NOT EXISTS `t_site_event_place` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(16) COLLATE utf8_bin NOT NULL,
  `fax` varchar(16) COLLATE utf8_bin NOT NULL,
  `web` varchar(255) COLLATE utf8_bin NOT NULL,
  `address1` varchar(255) COLLATE utf8_bin NOT NULL,
  `address2` varchar(255) COLLATE utf8_bin NOT NULL,
  `picture` varchar(255) COLLATE utf8_bin NOT NULL,
  `postcode` char(10) COLLATE utf8_bin NOT NULL,
  `city` varchar(128) COLLATE utf8_bin NOT NULL,
  `city_id` int(11) unsigned DEFAULT NULL,
  `country` varchar(3) COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL,
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_site_event_speaker`
--

CREATE TABLE IF NOT EXISTS `t_site_event_speaker` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) unsigned DEFAULT NULL,
  `speaker_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_site_event_speaker_user`
--

CREATE TABLE IF NOT EXISTS `t_site_event_speaker_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gender` enum('Mr','Ms','Mrs') COLLATE utf8_bin NOT NULL,
  `firstname` varchar(48) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(48) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(16) COLLATE utf8_bin NOT NULL,
  `fax` varchar(16) COLLATE utf8_bin NOT NULL,
  `web` varchar(255) COLLATE utf8_bin NOT NULL,
  `address1` varchar(255) COLLATE utf8_bin NOT NULL,
  `address2` varchar(255) COLLATE utf8_bin NOT NULL,
  `avatar` varchar(255) COLLATE utf8_bin NOT NULL,
  `postcode` char(10) COLLATE utf8_bin NOT NULL,
  `city` varchar(128) COLLATE utf8_bin NOT NULL,
  `city_id` int(11) unsigned DEFAULT NULL,
  `country` varchar(3) COLLATE utf8_bin NOT NULL,
  `function_id` int(11) unsigned DEFAULT NULL,
  `function` varchar(40) COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL,
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employer_user_u0` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_site_event_user`
--

CREATE TABLE IF NOT EXISTS `t_site_event_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(48) COLLATE utf8_bin DEFAULT '',
  `instagram_user` varchar(24) COLLATE utf8_bin DEFAULT '',
  `gender` enum('Mr','Ms','Mrs') COLLATE utf8_bin NOT NULL,
  `firstname` varchar(48) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(48) COLLATE utf8_bin NOT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(40) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(16) COLLATE utf8_bin NOT NULL,
  `fax` varchar(16) COLLATE utf8_bin NOT NULL,
  `web` varchar(255) COLLATE utf8_bin NOT NULL,
  `address1` varchar(255) COLLATE utf8_bin NOT NULL,
  `address2` varchar(255) COLLATE utf8_bin NOT NULL,
  `avatar` varchar(255) COLLATE utf8_bin NOT NULL,
  `postcode` char(10) COLLATE utf8_bin NOT NULL,
  `state` varchar(20) COLLATE utf8_bin NOT NULL,
  `city` varchar(128) COLLATE utf8_bin NOT NULL,
  `city_id` int(11) unsigned DEFAULT NULL,
  `country` varchar(3) COLLATE utf8_bin NOT NULL,
  `function_id` int(11) unsigned DEFAULT NULL,
  `function` varchar(40) COLLATE utf8_bin NOT NULL,
  `is_completed` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_validated` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL,
  `is_locked` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `lastlogin` timestamp NULL DEFAULT NULL,
  `lastpassword` timestamp NULL DEFAULT NULL,
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_event_user_u0` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- Contenu de la table `t_site_event_user`
--

INSERT INTO `t_site_event_user` (`id`, `username`, `instagram_user`, `gender`, `firstname`, `lastname`, `birthday`, `email`, `password`, `phone`, `mobile`, `fax`, `web`, `address1`, `address2`, `avatar`, `postcode`, `state`, `city`, `city_id`, `country`, `function_id`, `function`, `is_completed`, `is_validated`, `is_active`, `is_locked`, `lastlogin`, `lastpassword`, `status`, `created_at`, `updated_at`) VALUES
(6, '', '', 'Mr', 'event', 'event', NULL, 'event@free.fr', '202cb962ac59075b964b07152d234b70', '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, '', 'NO', 'YES', 'YES', 'NO', '2020-10-10 16:13:20', '2020-08-01 09:56:34', 'ACTIVE', '2020-08-01 09:56:34', '2020-10-10 16:13:20'),
(7, '', '', 'Mr', 'event1', 'event1', NULL, 'event1@free.fr', '202cb962ac59075b964b07152d234b70', '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, '', 'NO', 'YES', 'YES', 'NO', NULL, '2020-08-01 21:57:12', 'ACTIVE', '2020-08-01 21:57:12', '2020-08-02 23:13:04');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_event_user_forgot_password`
--

CREATE TABLE IF NOT EXISTS `t_site_event_user_forgot_password` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `password` varchar(40) COLLATE utf8_bin NOT NULL,
  `key` varchar(40) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_event_user_forgot_password_fk0` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_site_event_user_remember`
--

CREATE TABLE IF NOT EXISTS `t_site_event_user_remember` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `key` varchar(40) COLLATE utf8_bin NOT NULL,
  `ip` varchar(36) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_site_event_user_session`
--

CREATE TABLE IF NOT EXISTS `t_site_event_user_session` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `session` varchar(40) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `ip` varchar(50) COLLATE utf8_bin NOT NULL,
  `lat` decimal(20,13) DEFAULT NULL,
  `lng` decimal(20,13) DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `ended_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_event_user_session_fk0` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `t_site_event_user_session`
--

INSERT INTO `t_site_event_user_session` (`id`, `session`, `user_id`, `ip`, `lat`, `lng`, `started_at`, `ended_at`, `created_at`, `updated_at`) VALUES
(1, '0mj6opvdaje5fijjn56tfqmkh0', 6, '127.0.0.1', NULL, NULL, '2020-08-01 10:26:55', '2020-08-04 14:48:21', '2020-08-01 11:26:55', NULL),
(2, 'hm0hmb5kr3155vh3k92cjs1m11', 6, '127.0.0.1', NULL, NULL, '2020-08-04 15:29:25', '2020-08-04 15:48:27', '2020-08-04 16:29:25', NULL),
(3, '35mjvkculq9s31scmfho8qg4a5', 6, '127.0.0.1', NULL, NULL, '2020-10-10 16:13:20', '2020-10-10 18:32:34', '2020-10-10 17:13:20', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `t_site_event_user_validation_token`
--

CREATE TABLE IF NOT EXISTS `t_site_event_user_validation_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `token` varchar(64) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `site_event_user_validation_token_fk0` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Contenu de la table `t_site_event_user_validation_token`
--

INSERT INTO `t_site_event_user_validation_token` (`id`, `user_id`, `token`, `created_at`) VALUES
(3, 6, 'e45c05777a886ab981045dceef17dab4a800f8b4', '2020-08-01 09:56:34'),
(4, 7, 'f08fcc72cf2c1d416c561e2c8e9d8af2f0a728a6', '2020-08-01 21:57:12');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_gallery`
--

CREATE TABLE IF NOT EXISTS `t_site_gallery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `component` varchar(64) COLLATE utf8_bin NOT NULL,
  `template` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `height` varchar(32) COLLATE utf8_bin NOT NULL,
  `width` varchar(32) COLLATE utf8_bin NOT NULL,
  `effect` varchar(32) COLLATE utf8_bin NOT NULL,
  `slices` int(11) unsigned NOT NULL,
  `boxCols` int(11) unsigned NOT NULL,
  `boxRows` int(11) unsigned NOT NULL,
  `animSpeed` int(11) unsigned NOT NULL,
  `pauseTime` int(11) unsigned NOT NULL,
  `startSlide` int(11) unsigned NOT NULL,
  `directionNav` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `controlNav` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `controlNavThumbs` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `pauseOnHover` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `manualAdvance` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `randomStart` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_fullscreen` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `start_at` date DEFAULT NULL,
  `expired_at` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Contenu de la table `t_site_gallery`
--

INSERT INTO `t_site_gallery` (`id`, `name`, `component`, `template`, `height`, `width`, `effect`, `slices`, `boxCols`, `boxRows`, `animSpeed`, `pauseTime`, `startSlide`, `directionNav`, `controlNav`, `controlNavThumbs`, `pauseOnHover`, `manualAdvance`, `randomStart`, `is_fullscreen`, `is_active`, `start_at`, `expired_at`, `created_at`, `updated_at`) VALUES
(1, 'Home', '/site_gallery/default', 'default', '', '', 'random', 15, 8, 4, 500, 3000, 0, 'NO', 'NO', 'NO', 'YES', 'NO', 'NO', 'NO', 'YES', NULL, NULL, '2020-07-17 23:56:51', '2020-08-03 18:48:30'),
(2, 'Partners', '/site_gallery/default', 'default', '', '', 'random', 15, 8, 4, 500, 3000, 0, 'NO', 'NO', 'NO', 'YES', 'NO', 'NO', 'NO', 'NO', NULL, NULL, '2020-07-27 14:17:31', '2020-10-17 16:41:15'),
(3, 'Academy', '/site_gallery/default', 'default', '', '', 'random', 15, 8, 4, 500, 3000, 0, 'NO', 'NO', 'NO', 'YES', 'NO', 'NO', 'NO', 'YES', NULL, NULL, '2020-07-27 15:12:28', '2020-07-27 15:12:30'),
(4, 'AcademyAdvise', '/site_gallery/default', 'default', '', '', 'random', 15, 8, 4, 500, 3000, 0, 'NO', 'NO', 'NO', 'YES', 'NO', 'NO', 'NO', 'YES', NULL, NULL, '2020-07-27 15:37:49', '2020-07-27 15:37:52'),
(5, 'academy_gallery', '/site_gallery/default', 'default', '', '', 'random', 15, 8, 4, 500, 3000, 0, 'NO', 'NO', 'NO', 'YES', 'NO', 'NO', 'NO', 'YES', NULL, NULL, '2020-09-07 11:53:00', '2020-09-07 11:53:02');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_gallery_i18n`
--

CREATE TABLE IF NOT EXISTS `t_site_gallery_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) unsigned NOT NULL,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `link` varchar(255) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Contenu de la table `t_site_gallery_i18n`
--

INSERT INTO `t_site_gallery_i18n` (`id`, `gallery_id`, `lang`, `title`, `link`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', '', '', '2020-07-17 23:56:51', '2020-07-17 23:56:51'),
(2, 2, 'en', 'Our partners', '', '2020-07-27 14:17:31', '2020-07-27 22:35:14'),
(3, 3, 'en', 'Academy', '', '2020-07-27 15:12:28', '2020-07-27 15:12:28'),
(4, 4, 'en', 'Academy', '', '2020-07-27 15:37:49', '2020-07-27 15:37:49'),
(5, 5, 'en', '', '', '2020-09-07 11:53:00', '2020-09-07 11:53:00');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_gallery_picture`
--

CREATE TABLE IF NOT EXISTS `t_site_gallery_picture` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `picture_id` int(11) unsigned NOT NULL,
  `gallery_id` int(11) unsigned NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `position` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=58 ;

--
-- Contenu de la table `t_site_gallery_picture`
--

INSERT INTO `t_site_gallery_picture` (`id`, `picture_id`, `gallery_id`, `is_active`, `position`) VALUES
(11, 37, 1, 'NO', 1),
(13, 39, 1, 'NO', 1),
(14, 40, 1, 'NO', 1),
(15, 41, 1, 'NO', 1),
(25, 46, 1, 'NO', 3),
(26, 47, 1, 'NO', 2),
(27, 48, 1, 'NO', 4),
(28, 49, 2, 'YES', 5),
(29, 50, 2, 'YES', 6),
(30, 51, 2, 'YES', 5),
(34, 52, 4, 'NO', 7),
(35, 53, 3, 'NO', 1),
(36, 54, 3, 'NO', 4),
(37, 55, 3, 'NO', 4),
(38, 56, 4, 'YES', 9),
(41, 60, 1, 'YES', 8),
(42, 61, 1, 'YES', 10),
(43, 62, 1, 'NO', 15),
(44, 63, 1, 'NO', 11),
(45, 64, 1, 'NO', 12),
(46, 65, 1, 'NO', 13),
(47, 66, 1, 'NO', 14),
(48, 67, 3, 'YES', 16),
(49, 68, 3, 'YES', 18),
(50, 69, 3, 'YES', 17),
(51, 78, 5, 'YES', 1),
(52, 81, 1, 'NO', 19),
(53, 82, 1, 'YES', 20),
(54, 83, 1, 'YES', 21),
(55, 84, 1, 'YES', 22),
(56, 85, 1, 'YES', 23),
(57, 86, 1, 'YES', 24);

-- --------------------------------------------------------

--
-- Structure de la table `t_site_help`
--

CREATE TABLE IF NOT EXISTS `t_site_help` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `picture` varchar(40) COLLATE utf8_bin NOT NULL,
  `icon` varchar(24) COLLATE utf8_bin NOT NULL,
  `color` varchar(10) COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_site_help`
--

INSERT INTO `t_site_help` (`id`, `name`, `picture`, `icon`, `color`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'employee-list-advert', '', '', '', 'NO', '2020-08-27 23:21:16', '2020-08-28 08:20:25');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_help_i18n`
--

CREATE TABLE IF NOT EXISTS `t_site_help_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `help_id` int(11) unsigned NOT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `link` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_help_i18n_fk0` (`help_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_site_help_i18n`
--

INSERT INTO `t_site_help_i18n` (`id`, `help_id`, `lang`, `link`, `description`, `content`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', '', 'Description', '  AAAAAAAAAAAAAA We welcome users to register on our digital platforms. We offer the below mentioned registration services which may be subject to change in the future.<br/>\r\n                    All changes will be appended in the terms and conditions page and communicated to existing users by email.<br/>\r\n                    Registration services are offered for individual subscribers only.<br/>\r\n                    If multiple individuals propose to access the same account or for corporate accounts kindly contact or write in to us. <br/>\r\n                    Subscription rates will vary for multiple same time access.<br/>\r\n                    The nature and volume of Business Standard content services you consume on the digital platforms will vary according to the type of registration you choose,<br/>\r\n                    on the geography you reside or the offer you subscribe to.', 'AAAAAAAAAAAAWe welcome users to register on our digital platforms.', '2020-08-27 23:21:16', '2020-09-02 22:02:05');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_language_i18n`
--

CREATE TABLE IF NOT EXISTS `t_site_language_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `code` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `title` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1465 ;

--
-- Contenu de la table `t_site_language_i18n`
--

INSERT INTO `t_site_language_i18n` (`id`, `lang`, `code`, `title`) VALUES
(1, 'en', 'en', 'English'),
(2, 'en', 'aa', 'Afar'),
(3, 'en', 'ab', 'Abkhazian'),
(4, 'en', 'af', 'Afrikaans'),
(5, 'en', 'am', 'Amharic'),
(6, 'en', 'ar', 'Arabic'),
(7, 'en', 'as', 'Assamese'),
(8, 'en', 'ay', 'Aymara'),
(9, 'en', 'az', 'Azerbaijani'),
(10, 'en', 'ba', 'Bashkir'),
(11, 'en', 'be', 'Belarusian'),
(12, 'en', 'bg', 'Bulgarian'),
(13, 'en', 'bh', 'Bihari'),
(14, 'en', 'bi', 'Bislama'),
(15, 'en', 'bn', 'Bengali/Bangla'),
(16, 'en', 'bo', 'Tibetan'),
(17, 'en', 'br', 'Breton'),
(18, 'en', 'ca', 'Catalan'),
(19, 'en', 'co', 'Corsican'),
(20, 'en', 'cs', 'Czech'),
(21, 'en', 'cy', 'Welsh'),
(22, 'en', 'da', 'Danish'),
(23, 'en', 'de', 'German'),
(24, 'en', 'dz', 'Bhutani'),
(25, 'en', 'el', 'Greek'),
(26, 'en', 'eo', 'Esperanto'),
(27, 'en', 'es', 'Spanish'),
(28, 'en', 'et', 'Estonian'),
(29, 'en', 'eu', 'Basque'),
(30, 'en', 'fa', 'Persian'),
(31, 'en', 'fi', 'Finnish'),
(32, 'en', 'fj', 'Fiji'),
(33, 'en', 'fo', 'Faeroese'),
(34, 'en', 'fr', 'French'),
(35, 'en', 'fy', 'Frisian'),
(36, 'en', 'ga', 'Irish'),
(37, 'en', 'gd', 'Scots/Gaelic'),
(38, 'en', 'gl', 'Galician'),
(39, 'en', 'gn', 'Guarani'),
(40, 'en', 'gu', 'Gujarati'),
(41, 'en', 'ha', 'Hausa'),
(42, 'en', 'hi', 'Hindi'),
(43, 'en', 'hr', 'Croatian'),
(44, 'en', 'hu', 'Hungarian'),
(45, 'en', 'hy', 'Armenian'),
(46, 'en', 'ia', 'Interlingua'),
(47, 'en', 'ie', 'Interlingue'),
(48, 'en', 'ik', 'Inupiak'),
(49, 'en', 'in', 'Indonesian'),
(50, 'en', 'is', 'Icelandic'),
(51, 'en', 'it', 'Italian'),
(52, 'en', 'iw', 'Hebrew'),
(53, 'en', 'ja', 'Japanese'),
(54, 'en', 'ji', 'Yiddish'),
(55, 'en', 'jw', 'Javanese'),
(56, 'en', 'ka', 'Georgian'),
(57, 'en', 'kk', 'Kazakh'),
(58, 'en', 'kl', 'Greenlandic'),
(59, 'en', 'km', 'Cambodian'),
(60, 'en', 'kn', 'Kannada'),
(61, 'en', 'ko', 'Korean'),
(62, 'en', 'ks', 'Kashmiri'),
(63, 'en', 'ku', 'Kurdish'),
(64, 'en', 'ky', 'Kirghiz'),
(65, 'en', 'la', 'Latin'),
(66, 'en', 'ln', 'Lingala'),
(67, 'en', 'lo', 'Laothian'),
(68, 'en', 'lt', 'Lithuanian'),
(69, 'en', 'lv', 'Latvian/Lettish'),
(70, 'en', 'mg', 'Malagasy'),
(71, 'en', 'mi', 'Maori'),
(72, 'en', 'mk', 'Macedonian'),
(73, 'en', 'ml', 'Malayalam'),
(74, 'en', 'mn', 'Mongolian'),
(75, 'en', 'mo', 'Moldavian'),
(76, 'en', 'mr', 'Marathi'),
(77, 'en', 'ms', 'Malay'),
(78, 'en', 'mt', 'Maltese'),
(79, 'en', 'my', 'Burmese'),
(80, 'en', 'na', 'Nauru'),
(81, 'en', 'ne', 'Nepali'),
(82, 'en', 'nl', 'Dutch'),
(83, 'en', 'no', 'Norwegian'),
(84, 'en', 'oc', 'Occitan'),
(85, 'en', 'om', '(Afan)/Oromoor/Oriya'),
(86, 'en', 'pa', 'Punjabi'),
(87, 'en', 'pl', 'Polish'),
(88, 'en', 'ps', 'Pashto/Pushto'),
(89, 'en', 'pt', 'Portuguese'),
(90, 'en', 'qu', 'Quechua'),
(91, 'en', 'rm', 'Rhaeto-Romance'),
(92, 'en', 'rn', 'Kirundi'),
(93, 'en', 'ro', 'Romanian'),
(94, 'en', 'ru', 'Russian'),
(95, 'en', 'rw', 'Kinyarwanda'),
(96, 'en', 'sa', 'Sanskrit'),
(97, 'en', 'sd', 'Sindhi'),
(98, 'en', 'sg', 'Sangro'),
(99, 'en', 'sh', 'Serbo-Croatian'),
(100, 'en', 'si', 'Singhalese'),
(101, 'en', 'sk', 'Slovak'),
(102, 'en', 'sl', 'Slovenian'),
(103, 'en', 'sm', 'Samoan'),
(104, 'en', 'sn', 'Shona'),
(105, 'en', 'so', 'Somali'),
(106, 'en', 'sq', 'Albanian'),
(107, 'en', 'sr', 'Serbian'),
(108, 'en', 'ss', 'Siswati'),
(109, 'en', 'st', 'Sesotho'),
(110, 'en', 'su', 'Sundanese'),
(111, 'en', 'sv', 'Swedish'),
(112, 'en', 'sw', 'Swahili'),
(113, 'en', 'ta', 'Tamil'),
(114, 'en', 'te', 'Telugu'),
(115, 'en', 'tg', 'Tajik'),
(116, 'en', 'th', 'Thai'),
(117, 'en', 'ti', 'Tigrinya'),
(118, 'en', 'tk', 'Turkmen'),
(119, 'en', 'tl', 'Tagalog'),
(120, 'en', 'tn', 'Setswana'),
(121, 'en', 'to', 'Tonga'),
(122, 'en', 'tr', 'Turkish'),
(123, 'en', 'ts', 'Tsonga'),
(124, 'en', 'tt', 'Tatar'),
(125, 'en', 'tw', 'Twi'),
(126, 'en', 'uk', 'Ukrainian'),
(127, 'en', 'ur', 'Urdu'),
(128, 'en', 'uz', 'Uzbek'),
(129, 'en', 'vi', 'Vietnamese'),
(130, 'en', 'vo', 'Volapuk'),
(131, 'en', 'wo', 'Wolof'),
(132, 'en', 'xh', 'Xhosa'),
(133, 'en', 'yo', 'Yoruba'),
(134, 'en', 'zh', 'Chinese'),
(135, 'en', 'zu', 'Zulu'),
(1281, 'fr', 'aa', 'afar'),
(1282, 'fr', 'ab', 'abkhaze'),
(1283, 'fr', 'af', 'afrikaans'),
(1284, 'fr', 'ak', 'akan'),
(1285, 'fr', 'sq', 'albanais'),
(1286, 'fr', 'am', 'amharique'),
(1287, 'fr', 'ar', 'arabe'),
(1288, 'fr', 'an', 'aragonais'),
(1289, 'fr', 'hy', 'arménien'),
(1290, 'fr', 'as', 'assamais'),
(1291, 'fr', 'av', 'avar'),
(1292, 'fr', 'ae', 'avestique'),
(1293, 'fr', 'ay', 'aymara'),
(1294, 'fr', 'az', 'azéri'),
(1295, 'fr', 'ba', 'bachkir'),
(1296, 'fr', 'bm', 'bambara'),
(1297, 'fr', 'eu', 'basque'),
(1298, 'fr', 'be', 'biélorusse'),
(1299, 'fr', 'bn', 'bengali'),
(1300, 'fr', 'bh', 'bihari'),
(1301, 'fr', 'bi', 'bichlamar'),
(1302, 'fr', 'bs', 'bosniaque'),
(1303, 'fr', 'br', 'breton'),
(1304, 'fr', 'bg', 'bulgare'),
(1305, 'fr', 'my', 'birman'),
(1306, 'fr', 'ca', 'catalan; valencien'),
(1307, 'fr', 'ch', 'chamorro'),
(1308, 'fr', 'ce', 'tchétchène'),
(1309, 'fr', 'zh', 'chinois'),
(1310, 'fr', 'cu', 'slavon d''église; vieux slave; slavon liturgique; vieux bulgare'),
(1311, 'fr', 'cv', 'tchouvache'),
(1312, 'fr', 'kw', 'cornique'),
(1313, 'fr', 'co', 'corse'),
(1314, 'fr', 'cr', 'cree'),
(1315, 'fr', 'cs', 'tchèque'),
(1316, 'fr', 'da', 'danois'),
(1317, 'fr', 'dv', 'maldivien'),
(1318, 'fr', 'nl', 'néerlandais; flamand'),
(1319, 'fr', 'dz', 'dzongkha'),
(1320, 'fr', 'en', 'anglais'),
(1321, 'fr', 'eo', 'espéranto'),
(1322, 'fr', 'et', 'estonien'),
(1323, 'fr', 'ee', 'éwé'),
(1324, 'fr', 'fo', 'féroïen'),
(1325, 'fr', 'fj', 'fidjien'),
(1326, 'fr', 'fi', 'finnois'),
(1327, 'fr', 'fr', 'français'),
(1328, 'fr', 'fy', 'frison occidental'),
(1329, 'fr', 'ff', 'peul'),
(1330, 'fr', 'ka', 'géorgien'),
(1331, 'fr', 'de', 'allemand'),
(1332, 'fr', 'gd', 'gaélique; gaélique écossais'),
(1333, 'fr', 'ga', 'irlandais'),
(1334, 'fr', 'gl', 'galicien'),
(1335, 'fr', 'gv', 'manx; mannois'),
(1336, 'fr', 'el', 'grec moderne (après 1453)'),
(1337, 'fr', 'gn', 'guarani'),
(1338, 'fr', 'gu', 'goudjrati'),
(1339, 'fr', 'ht', 'haïtien; créole haïtien'),
(1340, 'fr', 'ha', 'haoussa'),
(1341, 'fr', 'he', 'hébreu'),
(1342, 'fr', 'hz', 'herero'),
(1343, 'fr', 'hi', 'hindi'),
(1344, 'fr', 'ho', 'hiri motu'),
(1345, 'fr', 'hr', 'croate'),
(1346, 'fr', 'hu', 'hongrois'),
(1347, 'fr', 'ig', 'igbo'),
(1348, 'fr', 'is', 'islandais'),
(1349, 'fr', 'io', 'ido'),
(1350, 'fr', 'ii', 'yi de Sichuan'),
(1351, 'fr', 'iu', 'inuktitut'),
(1352, 'fr', 'ie', 'interlingue'),
(1353, 'fr', 'ia', 'interlingua (langue auxiliaire internationale)'),
(1354, 'fr', 'id', 'indonésien'),
(1355, 'fr', 'ik', 'inupiaq'),
(1356, 'fr', 'it', 'italien'),
(1357, 'fr', 'jv', 'javanais'),
(1358, 'fr', 'ja', 'japonais'),
(1359, 'fr', 'kl', 'groenlandais'),
(1360, 'fr', 'kn', 'kannada'),
(1361, 'fr', 'ks', 'kashmiri'),
(1362, 'fr', 'kr', 'kanouri'),
(1363, 'fr', 'kk', 'kazakh'),
(1364, 'fr', 'km', 'khmer central'),
(1365, 'fr', 'ki', 'kikuyu'),
(1366, 'fr', 'rw', 'rwanda'),
(1367, 'fr', 'ky', 'kirghiz'),
(1368, 'fr', 'kv', 'kom'),
(1369, 'fr', 'kg', 'kongo'),
(1370, 'fr', 'ko', 'coréen'),
(1371, 'fr', 'kj', 'kuanyama; kwanyama'),
(1372, 'fr', 'ku', 'kurde'),
(1373, 'fr', 'lo', 'lao'),
(1374, 'fr', 'la', 'latin'),
(1375, 'fr', 'lv', 'letton'),
(1376, 'fr', 'li', 'limbourgeois'),
(1377, 'fr', 'ln', 'lingala'),
(1378, 'fr', 'lt', 'lituanien'),
(1379, 'fr', 'lb', 'luxembourgeois'),
(1380, 'fr', 'lu', 'luba-katanga'),
(1381, 'fr', 'lg', 'ganda'),
(1382, 'fr', 'mk', 'macédonien'),
(1383, 'fr', 'mh', 'marshall'),
(1384, 'fr', 'ml', 'malayalam'),
(1385, 'fr', 'mi', 'maori'),
(1386, 'fr', 'mr', 'marathe'),
(1387, 'fr', 'ms', 'malais'),
(1388, 'fr', 'mg', 'malgache'),
(1389, 'fr', 'mt', 'maltais'),
(1390, 'fr', 'mn', 'mongol'),
(1391, 'fr', 'na', 'nauruan'),
(1392, 'fr', 'nv', 'navaho'),
(1393, 'fr', 'nr', 'ndébélé du Sud'),
(1394, 'fr', 'nd', 'ndébélé du Nord'),
(1395, 'fr', 'ng', 'ndonga'),
(1396, 'fr', 'ne', 'népalais'),
(1397, 'fr', 'nn', 'norvégien nynorsk; nynorsk, norvégien'),
(1398, 'fr', 'nb', 'norvégien bokmål'),
(1399, 'fr', 'no', 'norvégien'),
(1400, 'fr', 'ny', 'chichewa; chewa; nyanja'),
(1401, 'fr', 'oc', 'occitan (après 1500)'),
(1402, 'fr', 'oj', 'ojibwa'),
(1403, 'fr', 'or', 'oriya'),
(1404, 'fr', 'om', 'galla'),
(1405, 'fr', 'os', 'ossète'),
(1406, 'fr', 'pa', 'pendjabi'),
(1407, 'fr', 'fa', 'persan'),
(1408, 'fr', 'pi', 'pali'),
(1409, 'fr', 'pl', 'polonais'),
(1410, 'fr', 'pt', 'portugais'),
(1411, 'fr', 'ps', 'pachto'),
(1412, 'fr', 'qu', 'quechua'),
(1413, 'fr', 'rm', 'romanche'),
(1414, 'fr', 'ro', 'roumain; moldave'),
(1415, 'fr', 'rn', 'rundi'),
(1416, 'fr', 'ru', 'russe'),
(1417, 'fr', 'sg', 'sango'),
(1418, 'fr', 'sa', 'sanskrit'),
(1419, 'fr', 'si', 'singhalais'),
(1420, 'fr', 'sk', 'slovaque'),
(1421, 'fr', 'sl', 'slovène'),
(1422, 'fr', 'se', 'sami du Nord'),
(1423, 'fr', 'sm', 'samoan'),
(1424, 'fr', 'sn', 'shona'),
(1425, 'fr', 'sd', 'sindhi'),
(1426, 'fr', 'so', 'somali'),
(1427, 'fr', 'st', 'sotho du Sud'),
(1428, 'fr', 'es', 'espagnol; castillan'),
(1429, 'fr', 'sc', 'sarde'),
(1430, 'fr', 'sr', 'serbe'),
(1431, 'fr', 'ss', 'swati'),
(1432, 'fr', 'su', 'soundanais'),
(1433, 'fr', 'sw', 'swahili'),
(1434, 'fr', 'sv', 'suédois'),
(1435, 'fr', 'ty', 'tahitien'),
(1436, 'fr', 'ta', 'tamoul'),
(1437, 'fr', 'tt', 'tatar'),
(1438, 'fr', 'te', 'télougou'),
(1439, 'fr', 'tg', 'tadjik'),
(1440, 'fr', 'tl', 'tagalog'),
(1441, 'fr', 'th', 'thaï'),
(1442, 'fr', 'bo', 'tibétain'),
(1443, 'fr', 'ti', 'tigrigna'),
(1444, 'fr', 'to', 'tongan (Îles Tonga)'),
(1445, 'fr', 'tn', 'tswana'),
(1446, 'fr', 'ts', 'tsonga'),
(1447, 'fr', 'tk', 'turkmène'),
(1448, 'fr', 'tr', 'turc'),
(1449, 'fr', 'tw', 'twi'),
(1450, 'fr', 'ug', 'ouïgour'),
(1451, 'fr', 'uk', 'ukrainien'),
(1452, 'fr', 'ur', 'ourdou'),
(1453, 'fr', 'uz', 'ouszbek'),
(1454, 'fr', 've', 'venda'),
(1455, 'fr', 'vi', 'vietnamien'),
(1456, 'fr', 'vo', 'volapük'),
(1457, 'fr', 'cy', 'gallois'),
(1458, 'fr', 'wa', 'wallon'),
(1459, 'fr', 'wo', 'wolof'),
(1460, 'fr', 'xh', 'xhosa'),
(1461, 'fr', 'yi', 'yiddish'),
(1462, 'fr', 'yo', 'yoruba'),
(1463, 'fr', 'za', 'zhuang; chuang'),
(1464, 'fr', 'zu', 'zoulou');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_picture`
--

CREATE TABLE IF NOT EXISTS `t_site_picture` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `height` int(11) unsigned NOT NULL,
  `width` int(11) unsigned NOT NULL,
  `picture` varchar(255) COLLATE utf8_bin NOT NULL,
  `extension` varchar(5) COLLATE utf8_bin NOT NULL,
  `filesize` int(11) unsigned NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `start_at` date DEFAULT NULL,
  `expired_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=87 ;

--
-- Contenu de la table `t_site_picture`
--

INSERT INTO `t_site_picture` (`id`, `name`, `height`, `width`, `picture`, `extension`, `filesize`, `is_active`, `start_at`, `expired_at`) VALUES
(42, '', 0, 0, 'h3.jpg', 'jpg', 36647, 'YES', NULL, NULL),
(43, '', 0, 0, 'h3.jpg', 'jpg', 36647, 'YES', NULL, NULL),
(44, '', 0, 0, 'h2.jpg', 'jpg', 139094, 'YES', NULL, NULL),
(45, '', 0, 0, 'h2.jpg', 'jpg', 139094, 'YES', NULL, NULL),
(46, '', 0, 0, 'h3.jpg', 'jpg', 36647, 'YES', NULL, NULL),
(47, '', 0, 0, 'h1.jpg', 'jpg', 58321, 'YES', NULL, NULL),
(48, '', 0, 0, 'h2.jpg', 'jpg', 139094, 'YES', NULL, NULL),
(49, '', 0, 0, 'coca-cola.jpg', 'jpg', 98514, 'YES', NULL, NULL),
(50, '', 0, 0, 'amazon.png', 'png', 77574, 'YES', NULL, NULL),
(51, '', 0, 0, 'heinz.png', 'png', 50455, 'YES', NULL, NULL),
(52, '', 0, 0, 'academy.jpg', 'jpg', 437424, 'YES', NULL, NULL),
(53, '', 0, 0, 'blank.png', 'png', 3383, 'YES', NULL, NULL),
(54, '', 0, 0, 'blank.png', 'png', 3383, 'YES', NULL, NULL),
(55, '', 0, 0, 'blank.png', 'png', 3383, 'YES', NULL, NULL),
(56, '', 0, 0, 'Graphex-Academy-new.jpg', 'jpg', 903846, 'YES', NULL, NULL),
(57, '', 0, 0, 'G Aka.png', 'png', 107366, 'YES', NULL, NULL),
(58, '', 0, 0, 'hdr9-11.jpg', 'jpg', 2940822, 'YES', NULL, NULL),
(59, '', 0, 0, 'Graphex-Academy-new.jpg', 'jpg', 903846, 'YES', NULL, NULL),
(60, '', 0, 0, 'hdr_test.jpg', 'jpg', 509815, 'NO', NULL, NULL),
(61, '', 0, 0, 'hdr-1.jpg', 'jpg', 299872, 'YES', NULL, NULL),
(62, '', 0, 0, 'back drop graphex.jpg', 'jpg', 889862, 'YES', NULL, NULL),
(63, '', 0, 0, 'Top-header3.jpg', 'jpg', 121331, 'YES', NULL, NULL),
(64, '', 0, 0, 'Top-header5.jpg', 'jpg', 279369, 'YES', NULL, NULL),
(65, '', 0, 0, 'Top-header2.jpg', 'jpg', 169750, 'YES', NULL, NULL),
(66, '', 0, 0, 'Top-header1.jpg', 'jpg', 117905, 'YES', NULL, NULL),
(67, '', 0, 0, 'Graphex academy ban2.jpg', 'jpg', 381011, 'YES', NULL, NULL),
(68, '', 0, 0, 'Graphex Academy bannng1.jpg', 'jpg', 323781, 'YES', NULL, NULL),
(69, '', 0, 0, 'Graphex Acedmy baner.jpg', 'jpg', 286290, 'YES', NULL, NULL),
(70, '', 0, 0, 'Graphex Acedmy baner.jpg', 'jpg', 286290, 'YES', NULL, NULL),
(71, '', 0, 0, 'Graphex Academy bannng1.jpg', 'jpg', 323781, 'YES', NULL, NULL),
(72, '', 0, 0, 'Graphex Academy bannng1.jpg', 'jpg', 323781, 'YES', NULL, NULL),
(73, '', 0, 0, 'Graphex Academy bannng1.jpg', 'jpg', 323781, 'YES', NULL, NULL),
(74, '', 0, 0, 'Graphex Academy bannng1.jpg', 'jpg', 323781, 'YES', NULL, NULL),
(75, '', 0, 0, 'Graphex Academy bannng1.jpg', 'jpg', 323781, 'YES', NULL, NULL),
(76, '', 0, 0, 'Graphex Academy bannng1.jpg', 'jpg', 323781, 'YES', NULL, NULL),
(77, '', 0, 0, 'Graphex Academy bannng1.jpg', 'jpg', 323781, 'YES', NULL, NULL),
(78, '', 0, 0, 'banner.jpg', 'jpg', 53811, 'YES', NULL, NULL),
(79, 'seethousansofjob', 0, 0, 'all_categories.jpg', 'jpg', 134717, 'YES', NULL, NULL),
(80, 'LogoAcademy', 0, 0, 'logo.jpg', 'jpg', 3798, 'YES', NULL, NULL),
(81, '', 0, 0, 'header-g3.jpg', 'jpg', 149563, 'YES', NULL, NULL),
(82, '', 0, 0, 'header-G1.jpg', 'jpg', 172740, 'YES', NULL, NULL),
(83, '', 0, 0, 'header G1.jpg', 'jpg', 172740, 'YES', NULL, NULL),
(84, '', 0, 0, 'home header 35.jpg', 'jpg', 128838, 'YES', NULL, NULL),
(85, '', 0, 0, 'header-g2.jpg', 'jpg', 106026, 'YES', NULL, NULL),
(86, '', 0, 0, 'header g22.jpg', 'jpg', 96813, 'YES', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `t_site_picture_i18n`
--

CREATE TABLE IF NOT EXISTS `t_site_picture_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `picture_id` int(11) unsigned NOT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `picture` varchar(255) COLLATE utf8_bin NOT NULL,
  `extension` varchar(5) COLLATE utf8_bin NOT NULL,
  `filesize` int(11) unsigned NOT NULL,
  `link` varchar(255) COLLATE utf8_bin NOT NULL,
  `target` enum('_blank','top','parent','') COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_picture_i18n_fk0` (`picture_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=85 ;

--
-- Contenu de la table `t_site_picture_i18n`
--

INSERT INTO `t_site_picture_i18n` (`id`, `picture_id`, `lang`, `picture`, `extension`, `filesize`, `link`, `target`, `description`, `content`, `title`, `created_at`, `updated_at`) VALUES
(39, 42, 'en', '', '', 0, '', '', '', '', 'h3', '2020-07-27 12:25:23', '2020-07-27 12:25:23'),
(40, 43, 'en', '', '', 0, '', '', '', '', 'h3', '2020-07-27 12:26:54', '2020-07-27 12:26:54'),
(41, 44, 'en', '', '', 0, '', '', '', '', 'h2', '2020-07-27 14:12:28', '2020-07-27 14:12:28'),
(42, 45, 'en', '', '', 0, '', '', '', '', 'h2', '2020-07-27 14:12:31', '2020-07-27 14:12:31'),
(43, 46, 'en', '', '', 0, '', '', '', '', 'h3', '2020-07-27 14:27:40', '2020-07-27 14:27:40'),
(44, 47, 'en', '', '', 0, '', '', '', '', 'h11', '2020-07-27 14:27:40', '2020-07-28 22:30:54'),
(45, 48, 'en', '', '', 0, '', '', '', '', 'h2', '2020-07-27 14:27:40', '2020-07-27 14:27:40'),
(46, 49, 'en', '', '', 0, '', '', '', '', 'coca-cola', '2020-07-27 14:39:08', '2020-07-27 14:39:08'),
(47, 50, 'en', '', '', 0, '', '', '', '', 'amazon', '2020-07-27 14:39:08', '2020-07-27 14:39:08'),
(48, 51, 'en', '', '', 0, '', '', '', '', 'heinz', '2020-07-27 14:39:09', '2020-07-27 14:39:09'),
(49, 52, 'en', '', '', 0, '', '', '', '', 'academy', '2020-07-27 15:37:55', '2020-07-27 15:37:55'),
(51, 53, 'en', '', '', 0, '/cms/toto.html', '', 'Learn a new skill and make your money', '', 'Graphex Academy', '2020-07-28 22:16:23', '2020-07-28 22:50:51'),
(52, 54, 'en', '', '', 0, '', '', 'academy - slogan2', 'academy - slogan2', 'academy - slogan2', '2020-07-28 22:42:21', '2020-07-28 22:46:14'),
(53, 55, 'en', '', '', 0, '', '', 'academy - slogan3', 'academy - slogan3', 'academy - slogan3', '2020-07-28 22:42:26', '2020-07-28 22:46:03'),
(54, 56, 'en', '', '', 0, '', '', '', '', 'Graphex-Academy-new', '2020-07-29 21:51:44', '2020-07-29 21:51:44'),
(55, 57, 'en', '', '', 0, '', '', '', '', 'G Aka', '2020-07-29 21:52:22', '2020-07-29 21:52:22'),
(56, 58, 'en', '', '', 0, '', '', '', '', 'hdr9-11', '2020-07-29 23:46:54', '2020-07-29 23:46:54'),
(57, 59, 'en', '', '', 0, '', '', '', '', 'Graphex-Academy-new', '2020-07-29 23:47:36', '2020-07-29 23:47:36'),
(58, 60, 'en', '', '', 0, '', '', '', '', 'hdr_test', '2020-07-29 23:50:42', '2020-07-29 23:50:42'),
(59, 61, 'en', '', '', 0, '', '', '', '', 'hdr-1', '2020-07-29 23:56:45', '2020-07-29 23:56:45'),
(60, 62, 'en', '', '', 0, '', '', '', '', 'back drop graphex', '2020-08-19 22:06:37', '2020-08-19 22:06:37'),
(61, 63, 'en', '', '', 0, '', '', '', '', 'Top-header3', '2020-08-25 12:38:10', '2020-08-25 12:38:10'),
(62, 64, 'en', '', '', 0, '', '', '', '', 'Top-header5', '2020-08-25 12:38:10', '2020-08-25 12:38:10'),
(63, 65, 'en', '', '', 0, '', '', '', '', 'Top-header2', '2020-08-25 12:38:11', '2020-08-25 12:38:11'),
(64, 66, 'en', '', '', 0, '', '', '', '', 'Top-header1', '2020-08-25 12:38:11', '2020-08-25 12:38:11'),
(65, 67, 'en', '', '', 0, '', '', '', '', 'Graphex academy ban2', '2020-09-03 08:19:43', '2020-09-03 08:19:43'),
(66, 68, 'en', '', '', 0, '', '', '', '', 'Graphex Academy bannng1', '2020-09-03 08:19:47', '2020-09-03 08:19:47'),
(67, 69, 'en', '', '', 0, '', '', '', '', 'Graphex Acedmy baner', '2020-09-03 08:19:50', '2020-09-03 08:19:50'),
(68, 70, 'en', '', '', 0, '', '', '', '', 'Graphex Acedmy baner', '2020-09-03 08:23:18', '2020-09-03 08:23:18'),
(69, 71, 'en', '', '', 0, '', '', '', '', 'Graphex Academy bannng1', '2020-09-03 08:31:02', '2020-09-03 08:31:02'),
(70, 72, 'en', '', '', 0, '', '', '', '', 'Graphex Academy bannng1', '2020-09-03 08:31:13', '2020-09-03 08:31:13'),
(71, 73, 'en', '', '', 0, '', '', '', '', 'Graphex Academy bannng1', '2020-09-03 08:36:00', '2020-09-03 08:36:00'),
(72, 74, 'en', '', '', 0, '', '', '', '', 'Graphex Academy bannng1', '2020-09-03 08:39:01', '2020-09-03 08:39:01'),
(73, 75, 'en', '', '', 0, '', '', '', '', 'Graphex Academy bannng1', '2020-09-03 08:39:10', '2020-09-03 08:39:10'),
(74, 76, 'en', '', '', 0, '', '', '', '', 'Graphex Academy bannng1', '2020-09-03 08:39:53', '2020-09-03 08:39:53'),
(75, 77, 'en', '', '', 0, '', '', '', '', 'Graphex Academy bannng1', '2020-09-03 08:40:52', '2020-09-03 08:40:52'),
(76, 78, 'en', '', '', 0, '', '', '', '', 'academy-banner', '2020-09-07 11:51:35', '2020-09-07 11:51:45'),
(77, 79, 'en', '', '', 0, '', '', '', '', 'seethousansofjob', '2020-09-11 09:17:51', '2020-09-11 09:18:12'),
(78, 80, 'en', '', '', 0, '', '', '', '', 'LogoAcademy', '2020-09-17 12:34:03', '2020-09-17 12:34:17'),
(79, 81, 'en', '', '', 0, '', '', '', '', 'header-g3', '2020-10-02 08:31:28', '2020-10-02 08:31:28'),
(80, 82, 'en', '', '', 0, '', '', '', '', 'header-G1', '2020-10-02 08:31:28', '2020-10-02 08:31:28'),
(81, 83, 'en', '', '', 0, '', '', '', '', 'header G1', '2020-10-02 08:31:28', '2020-10-02 08:31:28'),
(82, 84, 'en', '', '', 0, '', '', '', '', 'home header 35', '2020-10-02 08:31:28', '2020-10-02 08:31:28'),
(83, 85, 'en', '', '', 0, '', '', '', '', 'header-g2', '2020-10-02 08:31:28', '2020-10-02 08:31:28'),
(84, 86, 'en', '', '', 0, '', '', '', '', 'header g22', '2020-10-02 08:31:28', '2020-10-02 08:31:28');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_shop`
--

CREATE TABLE IF NOT EXISTS `t_site_shop` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `favicon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `icon` varchar(24) COLLATE utf8_bin DEFAULT '',
  `logo` varchar(24) COLLATE utf8_bin DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_site_shop_i18n`
--

CREATE TABLE IF NOT EXISTS `t_site_shop_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin DEFAULT '',
  `meta_title` varchar(255) COLLATE utf8_bin DEFAULT '',
  `meta_keywords` varchar(512) COLLATE utf8_bin DEFAULT '',
  `meta_description` varchar(512) COLLATE utf8_bin DEFAULT '',
  `meta_author` varchar(255) COLLATE utf8_bin DEFAULT '',
  `shop_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`shop_id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_site_warning`
--

CREATE TABLE IF NOT EXISTS `t_site_warning` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `icon` varchar(40) COLLATE utf8_bin NOT NULL,
  `color` varchar(10) COLLATE utf8_bin DEFAULT '',
  `picture` varchar(40) COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Contenu de la table `t_site_warning`
--

INSERT INTO `t_site_warning` (`id`, `name`, `icon`, `color`, `picture`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'employer-new-advert', '', '', '', 'NO', '2020-09-17 20:40:24', '2020-09-17 20:40:24'),
(2, 'employee-new-advert', '', '', '', 'NO', '2020-09-17 20:45:37', '2020-09-17 20:45:37'),
(3, 'employee-view-advert', '', '', '', 'NO', '2020-09-17 20:45:49', '2020-09-17 20:45:49'),
(4, 'employer-view-advert', '', '', '', 'NO', '2020-09-17 20:46:01', '2020-09-17 20:46:01');

-- --------------------------------------------------------

--
-- Structure de la table `t_site_warning_i18n`
--

CREATE TABLE IF NOT EXISTS `t_site_warning_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `warning_id` int(11) unsigned NOT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `link` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_warning_i18n_fk0` (`warning_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Contenu de la table `t_site_warning_i18n`
--

INSERT INTO `t_site_warning_i18n` (`id`, `warning_id`, `lang`, `link`, `description`, `content`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', '', 'Warning1', '{* SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSs\r\n<div class="classDivWarning"><i class="mdi mdi-alert-circle"></i>{__(''Warning 1'')}</div>\r\n                <div class="classDivWarning"><i class="mdi mdi-alert-circle"></i>{__(''Warning 2'')}</div>\r\n                <div class="classDivWarning"><i class="mdi mdi-alert-circle"></i>{__(''Warning 3'')}</div> *}', 'Warning1', '2020-09-17 20:40:24', '2020-10-05 13:39:00'),
(2, 2, 'en', '', 'employee-new-advert  warning', 'employee-new-advert  warning', 'employee-new-advert warning', '2020-09-17 20:45:37', '2020-09-17 20:46:27'),
(3, 3, 'en', '', 'employee-view-advert  warning', 'employee-view-advert  warning', 'employee-view-advert  warning', '2020-09-17 20:45:49', '2020-09-17 20:46:34'),
(4, 4, 'en', '', 'employer-view-advert  warning', 'employer-view-advert  warning', 'employer-view-advert  warning', '2020-09-17 20:46:01', '2020-09-17 20:46:40');

-- --------------------------------------------------------

--
-- Structure de la table `t_social_networks`
--

CREATE TABLE IF NOT EXISTS `t_social_networks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 NOT NULL,
  `awe` varchar(40) COLLATE utf8_bin NOT NULL,
  `link` varchar(255) CHARACTER SET utf8 NOT NULL,
  `picture` varchar(64) CHARACTER SET utf8 NOT NULL,
  `is_active` enum('YES','NO') CHARACTER SET utf8 NOT NULL DEFAULT 'NO',
  `position` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Contenu de la table `t_social_networks`
--

INSERT INTO `t_social_networks` (`id`, `name`, `awe`, `link`, `picture`, `is_active`, `position`, `created_at`, `updated_at`) VALUES
(1, 'facebook', 'facebook', 'https://www.facebook.com/GraphexTechnology', 'facebook.png', 'YES', 1, '2013-10-20 12:39:12', '2020-10-16 15:45:51'),
(3, 'twitter', 'twitter', 'https://twitter.com/GrapheXTechnol1', 'twitter.png', 'YES', 2, '2013-10-20 22:26:06', '2020-05-29 16:01:41'),
(4, 'instagram', 'instagram', 'https://www.instagram.com/graphex_technology_llc/', '', 'YES', 3, '2020-05-29 16:07:00', '2020-10-16 15:46:02'),
(5, 'linkedin', 'linkedin', 'https://www.linkedin.com/in/graphex-productions-7a7a71155', '', 'YES', 4, '2020-05-29 16:10:08', '2020-05-29 16:10:31'),
(6, 'Youtube', 'youtube', 'https://www.youtube.com/channel/UCe8S1I1zqwfNSTYrTU9njNA', '', 'YES', 5, '2020-07-30 09:31:46', '2020-08-12 10:16:35');

-- --------------------------------------------------------

--
-- Structure de la table `t_system_model_email`
--

CREATE TABLE IF NOT EXISTS `t_system_model_email` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `type` enum('SYSTEM','') COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `t_system_model_email`
--

INSERT INTO `t_system_model_email` (`id`, `name`, `type`) VALUES
(1, 'customer_forgot_password', ''),
(2, 'new_holidays_model_email', ''),
(3, 'customer_congratulations', '');

-- --------------------------------------------------------

--
-- Structure de la table `t_system_model_email_i18n`
--

CREATE TABLE IF NOT EXISTS `t_system_model_email_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int(11) unsigned NOT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_bin NOT NULL,
  `subject` varchar(255) COLLATE utf8_bin NOT NULL,
  `body` text COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`lang`,`model_id`),
  KEY `customers_model_email_0` (`model_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `t_system_model_email_i18n`
--

INSERT INTO `t_system_model_email_i18n` (`id`, `model_id`, `lang`, `value`, `subject`, `body`, `created_at`, `updated_at`) VALUES
(1, 1, 'fr', 'mot de passe oublié', 'mot de passe oublié2', '{$user.gender} {$user.name},\n\nMot de passe: {$forgotpassword.nocrypted_password}\n\nMerci de confirmer votre email :  <a href="{$forgotpassword.uri}">Merci de confirmer votre nouveau mot de passe</a>\n\nSalutations\n', '2015-08-13 09:46:24', '2015-08-13 15:30:25'),
(2, 2, 'fr', 'Demande de congés', 'Demande de congés de {$employee.name} du {$holiday.in_at.ddmmyyyy} au {$holiday.out_at.ddmmyyyy}', 'Demande de congés d la part de {$employee.name}\nDu {$holiday.in_at.ddmmyyyy} au {$holiday.out_at.ddmmyyyy}', '2018-03-16 23:53:25', '2018-03-17 01:35:22'),
(3, 3, 'fr', 'Création compte : Félicitation', 'dsfdsfdsfds', '<div class="container email" style="font-size:25px;margin-left:100px;">\n       <h3>{$customer.courtesy}  {$customer.gender.short} {$customer.firstname}  {$customer.lastname}<br><br>\n        Pour finaliser la création de votre compte, veuillez cliquer sur le lien ci-après :<br>\n        <a href="{$token.url}">Continuer votre inscription</a><br><br>\n        Cordialement<br><br>\n        L’équipe {$company.commercial}<br><br>\n        --</h3>\n        <div class="">\n          <img title="Logo" class="logo" src="{$company.picture.url}" alt="Logo">              \n        </div>\n        <h3>{$company.web}</h3>\n    </div>', '2018-12-15 12:37:25', '2018-12-15 14:00:42');

-- --------------------------------------------------------

--
-- Structure de la table `t_system_model_text`
--

CREATE TABLE IF NOT EXISTS `t_system_model_text` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `type` enum('SYSTEM','') COLLATE utf8_bin NOT NULL DEFAULT '',
  `orientation` varchar(16) COLLATE utf8_bin NOT NULL,
  `size` varchar(10) COLLATE utf8_bin NOT NULL,
  `module` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_system_model_text_i18n`
--

CREATE TABLE IF NOT EXISTS `t_system_model_text_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int(11) unsigned NOT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_bin NOT NULL,
  `text` text COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`lang`,`model_id`),
  KEY `system_model_text_0` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_users`
--

CREATE TABLE IF NOT EXISTS `t_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_bin NOT NULL,
  `password` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `sex` enum('Mr','Ms','Mrs') COLLATE utf8_bin DEFAULT NULL,
  `firstname` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `lastname` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `picture` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `phone` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `mobile` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `fax` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `birthday` date DEFAULT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_guess` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_locked` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `locked_at` timestamp NULL DEFAULT NULL,
  `unlocked_by` int(11) DEFAULT NULL,
  `number_of_try` int(2) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_password_gen` timestamp NULL DEFAULT NULL,
  `lastlogin` timestamp NULL DEFAULT NULL,
  `is_sponsor` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `website` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content_group_id` int(11) unsigned DEFAULT NULL,
  `sponsor_id` int(11) unsigned DEFAULT NULL,
  `specialty_id` int(11) unsigned DEFAULT NULL,
  `profession_id` int(11) unsigned DEFAULT NULL,
  `physician_number` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `accept_newsletter` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `email_tosend` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `application` enum('admin','frontend','superadmin') COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`,`application`),
  UNIQUE KEY `email` (`email`,`application`),
  KEY `users_fk0` (`profession_id`),
  KEY `users_fk1` (`specialty_id`),
  KEY `users_fk2` (`content_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=100 ;

--
-- Contenu de la table `t_users`
--

INSERT INTO `t_users` (`id`, `username`, `password`, `sex`, `firstname`, `lastname`, `email`, `picture`, `phone`, `mobile`, `fax`, `birthday`, `is_active`, `is_guess`, `is_locked`, `locked_at`, `unlocked_by`, `number_of_try`, `created_at`, `updated_at`, `last_password_gen`, `lastlogin`, `is_sponsor`, `website`, `content_group_id`, `sponsor_id`, `specialty_id`, `profession_id`, `physician_number`, `accept_newsletter`, `email_tosend`, `application`) VALUES
(1, 'fmallet', '202cb962ac59075b964b07152d234b70', 'Mr', 'frédéric', 'mallet', 'fd.mallet@ewebsolutions.fr', '', '', '', '', NULL, 'YES', 'NO', 'NO', NULL, NULL, 0, '2011-11-06 08:26:44', '2020-10-19 16:39:26', '2011-11-06 08:26:44', '2020-10-19 16:39:26', 'NO', NULL, NULL, NULL, NULL, NULL, NULL, 'NO', 'NO', 'superadmin'),
(3, 'fmalletad', '202cb962ac59075b964b07152d234b70', 'Mr', 'frédéric', 'mallet', 'fd.mallet@ewebsolutions.fr', '', '', '', '', NULL, 'YES', 'NO', 'NO', NULL, NULL, 0, '2011-11-06 08:26:44', '2020-10-20 23:11:46', '2014-10-17 11:08:31', '2020-10-20 23:11:46', 'NO', NULL, NULL, NULL, NULL, NULL, NULL, 'NO', 'NO', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `t_user_group`
--

CREATE TABLE IF NOT EXISTS `t_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  PRIMARY KEY (`id`),
  KEY `group` (`group_id`),
  KEY `user` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=15 ;

--
-- Contenu de la table `t_user_group`
--

INSERT INTO `t_user_group` (`id`, `group_id`, `user_id`, `is_active`) VALUES
(1, 1, 1, 'YES'),
(2, 2, 1, 'YES'),
(3, 2, 2, 'YES'),
(14, 4, 3, 'YES');

-- --------------------------------------------------------

--
-- Structure de la table `t_user_permission`
--

CREATE TABLE IF NOT EXISTS `t_user_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission` (`permission_id`),
  KEY `user` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Contenu de la table `t_user_permission`
--

INSERT INTO `t_user_permission` (`id`, `permission_id`, `user_id`) VALUES
(1, 4, 1),
(2, 7, 2),
(3, 8, 1);

-- --------------------------------------------------------

--
-- Structure de la table `t_user_remember`
--

CREATE TABLE IF NOT EXISTS `t_user_remember` (
  `user_id` int(11) NOT NULL,
  `key` varchar(32) COLLATE utf8_bin NOT NULL,
  `ip` varchar(50) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `index` (`user_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `t_user_remember`
--

INSERT INTO `t_user_remember` (`user_id`, `key`, `ip`, `created_at`) VALUES
(0, 'oxw0nv5ln1ck00o8gkgk0w8owssks08', '127.0.0.1', '2019-12-07 12:18:38');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `t_cart_quotation`
--
ALTER TABLE `t_cart_quotation`
  ADD CONSTRAINT `cart_quotation_fk0` FOREIGN KEY (`quotation_id`) REFERENCES `t_sale_employee_quotation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_quotation_fk1` FOREIGN KEY (`cart_id`) REFERENCES `t_cart` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_quotation_fk2` FOREIGN KEY (`project_id`) REFERENCES `t_employer_project` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_cart_quotation_commission`
--
ALTER TABLE `t_cart_quotation_commission`
  ADD CONSTRAINT `cart_quotation_commission_fk0` FOREIGN KEY (`quotation_id`) REFERENCES `t_sale_employee_quotation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_quotation_commission_fk1` FOREIGN KEY (`cart_id`) REFERENCES `t_cart` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_quotation_commission_fk2` FOREIGN KEY (`cart_quotation_id`) REFERENCES `t_cart_quotation` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_customer_abuse_type_i18n`
--
ALTER TABLE `t_customer_abuse_type_i18n`
  ADD CONSTRAINT `customer_abuse_type_fk0` FOREIGN KEY (`abuse_id`) REFERENCES `t_customer_abuse_type` (`id`) ON DELETE CASCADE;


--
-- Contraintes pour la table `t_customer_academy_level_i18n`
--
ALTER TABLE `t_customer_academy_level_i18n`
  ADD CONSTRAINT `customer_academy_level_fk0` FOREIGN KEY (`level_id`) REFERENCES `t_customer_academy_level` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_customer_academy_software_i18n`
--
ALTER TABLE `t_customer_academy_software_i18n`
  ADD CONSTRAINT `customer_academy_software_fk0` FOREIGN KEY (`software_id`) REFERENCES `t_customer_academy_software` (`id`) ON DELETE CASCADE;


--
-- Contraintes pour la table `t_customer_academy_topic_i18n`
--
ALTER TABLE `t_customer_academy_topic_i18n`
  ADD CONSTRAINT `customer_academy_topic_fk0` FOREIGN KEY (`topic_id`) REFERENCES `t_customer_academy_topic` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_customer_advert_comment_i18n`
--
ALTER TABLE `t_customer_advert_comment_i18n`
  ADD CONSTRAINT `customer_advert_comment_i18n_fk0` FOREIGN KEY (`comment_id`) REFERENCES `t_customer_advert_comment` (`id`) ON DELETE CASCADE;

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

--
-- Contraintes pour la table `t_customer_claim_type_i18n`
--
ALTER TABLE `t_customer_claim_type_i18n`
  ADD CONSTRAINT `customer_claim_type_fk0` FOREIGN KEY (`type_id`) REFERENCES `t_customer_claim_type` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_customer_course_category_course`
--
ALTER TABLE `t_customer_course_category_course`
  ADD CONSTRAINT `customer_course_category_course_fk0` FOREIGN KEY (`course_i18n_id`) REFERENCES `t_customer_academy_course_i18n` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_course_category_course_fk1` FOREIGN KEY (`category_id`) REFERENCES `t_customer_course_category` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_customer_course_category_i18n`
--
ALTER TABLE `t_customer_course_category_i18n`
  ADD CONSTRAINT `customer_course_category_i18n_fk0` FOREIGN KEY (`category_id`) REFERENCES `t_customer_course_category` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_customer_course_document`
--
ALTER TABLE `t_customer_course_document`
  ADD CONSTRAINT `customer_course_document_fk0` FOREIGN KEY (`course_i18n_id`) REFERENCES `t_customer_academy_course_i18n` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_customer_message_file`
--
ALTER TABLE `t_customer_message_file`
  ADD CONSTRAINT `customer_messager_file_fk0` FOREIGN KEY (`message_id`) REFERENCES `t_customer_message` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_emailer_spooler_scheduler_email_sent`
--
ALTER TABLE `t_emailer_spooler_scheduler_email_sent`
  ADD CONSTRAINT `emailer_spooler_email_sent_1` FOREIGN KEY (`scheduler_id`) REFERENCES `t_emailer_spooler_scheduler` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `emailer_spooler_email_sent_2` FOREIGN KEY (`email_id`) REFERENCES `t_emailer_spooler` (`id`) ON DELETE CASCADE;


--
-- Contraintes pour la table `t_employee_advert_category`
--
ALTER TABLE `t_employee_advert_category`
  ADD CONSTRAINT `employee_advert_category_fk1` FOREIGN KEY (`category_id`) REFERENCES `t_partner_work_category` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employee_content_i18n`
--
ALTER TABLE `t_employee_content_i18n`
  ADD CONSTRAINT `employee_content_i18n_fk0` FOREIGN KEY (`content_id`) REFERENCES `t_employee_content` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employee_experience_i18n`
--
ALTER TABLE `t_employee_experience_i18n`
  ADD CONSTRAINT `employee_experience_fk0` FOREIGN KEY (`experience_id`) REFERENCES `t_employee_experience` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employee_function_i18n`
--
ALTER TABLE `t_employee_function_i18n`
  ADD CONSTRAINT `employee_function_fk0` FOREIGN KEY (`function_id`) REFERENCES `t_employee_function` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employee_gallery_i18n`
--
ALTER TABLE `t_employee_gallery_i18n`
  ADD CONSTRAINT `employee_gallery_i18n_fk0` FOREIGN KEY (`gallery_id`) REFERENCES `t_employee_gallery` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employee_graduate_diploma_i18n`
--
ALTER TABLE `t_employee_graduate_diploma_i18n`
  ADD CONSTRAINT `employee_graduate_diploma_fk0` FOREIGN KEY (`graduate_id`) REFERENCES `t_employee_graduate_diploma` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employee_language_i18n`
--
ALTER TABLE `t_employee_language_i18n`
  ADD CONSTRAINT `employee_language_fk0` FOREIGN KEY (`language_id`) REFERENCES `t_employee_language` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employee_language_level_i18n`
--
ALTER TABLE `t_employee_language_level_i18n`
  ADD CONSTRAINT `employee_language_level_fk0` FOREIGN KEY (`level_id`) REFERENCES `t_employee_language_level` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employee_notation_category_i18n`
--
ALTER TABLE `t_employee_notation_category_i18n`
  ADD CONSTRAINT `employee_notation_category_fk0` FOREIGN KEY (`category_id`) REFERENCES `t_employee_notation_category` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employee_notation_criteria`
--
ALTER TABLE `t_employee_notation_criteria`
  ADD CONSTRAINT `employee_notation_criteria_fk1` FOREIGN KEY (`category_id`) REFERENCES `t_employee_notation_category` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employee_notation_criteria_i18n`
--
ALTER TABLE `t_employee_notation_criteria_i18n`
  ADD CONSTRAINT `employee_notation_criteria_fk0` FOREIGN KEY (`criteria_id`) REFERENCES `t_employee_notation_criteria` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employee_skill_i18n`
--
ALTER TABLE `t_employee_skill_i18n`
  ADD CONSTRAINT `employee_skill_fk0` FOREIGN KEY (`skill_id`) REFERENCES `t_employee_skill` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employee_study_level_i18n`
--
ALTER TABLE `t_employee_study_level_i18n`
  ADD CONSTRAINT `employee_study_level_fk0` FOREIGN KEY (`level_id`) REFERENCES `t_employee_study_level` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employee_user_graduate_diploma`
--
ALTER TABLE `t_employee_user_graduate_diploma`
  ADD CONSTRAINT `employee_user_graduate_diploma_fk0` FOREIGN KEY (`graduate_id`) REFERENCES `t_employee_graduate_diploma` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employee_user_graduate_diploma_i18n`
--
ALTER TABLE `t_employee_user_graduate_diploma_i18n`
  ADD CONSTRAINT `employee_user_graduate_diploma_i18n_fk0` FOREIGN KEY (`user_graduate_id`) REFERENCES `t_employee_user_graduate_diploma` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employee_user_language`
--
ALTER TABLE `t_employee_user_language`
  ADD CONSTRAINT `employee_user_language_fk0` FOREIGN KEY (`level_id`) REFERENCES `t_employee_language_level` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employee_user_skill`
--
ALTER TABLE `t_employee_user_skill`
  ADD CONSTRAINT `employee_user_skill_fk0` FOREIGN KEY (`skill_id`) REFERENCES `t_employee_skill` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employee_user_skill_i18n`
--
ALTER TABLE `t_employee_user_skill_i18n`
  ADD CONSTRAINT `employee_user_skill_i18n_fk0` FOREIGN KEY (`skill_id`) REFERENCES `t_employee_user_skill` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employer_activity_i18n`
--
ALTER TABLE `t_employer_activity_i18n`
  ADD CONSTRAINT `employer_activity_fk0` FOREIGN KEY (`activity_id`) REFERENCES `t_employer_activity` (`id`) ON DELETE CASCADE;




--
-- Contraintes pour la table `t_employer_budget_unit_i18n`
--
ALTER TABLE `t_employer_budget_unit_i18n`
  ADD CONSTRAINT `employer_budget_unit_fk0` FOREIGN KEY (`unit_id`) REFERENCES `t_employer_budget_unit` (`id`) ON DELETE CASCADE;


-- Contraintes pour la table `t_employer_city_gallery_city`
--
ALTER TABLE `t_employer_city_gallery_city`
  ADD CONSTRAINT `employer_city_gallery_city_fk0` FOREIGN KEY (`gallery_id`) REFERENCES `t_employer_city_gallery` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employer_city_gallery_city_fk1` FOREIGN KEY (`city_id`) REFERENCES `t_site_city` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employer_city_gallery_i18n`
--
ALTER TABLE `t_employer_city_gallery_i18n`
  ADD CONSTRAINT `employer_city_gallery_i18n_fk0` FOREIGN KEY (`gallery_id`) REFERENCES `t_employer_city_gallery` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employer_company`
--
ALTER TABLE `t_employer_company`
  ADD CONSTRAINT `employer_company_fk0` FOREIGN KEY (`city_id`) REFERENCES `t_site_city` (`id`) ON DELETE CASCADE;



--
-- Contraintes pour la table `t_employer_contract_type_i18n`
--
ALTER TABLE `t_employer_contract_type_i18n`
  ADD CONSTRAINT `employer_contract_type_fk0` FOREIGN KEY (`type_id`) REFERENCES `t_employer_contract_type` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employer_function_i18n`
--
ALTER TABLE `t_employer_function_i18n`
  ADD CONSTRAINT `employer_function_fk0` FOREIGN KEY (`function_id`) REFERENCES `t_employer_function` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employer_gallery_company`
--
ALTER TABLE `t_employer_gallery_company`
  ADD CONSTRAINT `employer_gallery_company_fk0` FOREIGN KEY (`gallery_id`) REFERENCES `t_employer_gallery` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employer_gallery_company_fk1` FOREIGN KEY (`employer_id`) REFERENCES `t_employer_company` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employer_gallery_i18n`
--
ALTER TABLE `t_employer_gallery_i18n`
  ADD CONSTRAINT `employer_gallery_i18n_fk0` FOREIGN KEY (`gallery_id`) REFERENCES `t_employer_gallery` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employer_language_i18n`
--
ALTER TABLE `t_employer_language_i18n`
  ADD CONSTRAINT `employer_language_fk0` FOREIGN KEY (`language_id`) REFERENCES `t_employer_language` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employer_language_level_i18n`
--
ALTER TABLE `t_employer_language_level_i18n`
  ADD CONSTRAINT `employer_language_level_fk0` FOREIGN KEY (`level_id`) REFERENCES `t_employer_language_level` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employer_level_i18n`
--
ALTER TABLE `t_employer_level_i18n`
  ADD CONSTRAINT `employer_level_fk0` FOREIGN KEY (`level_id`) REFERENCES `t_employer_level` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employer_notation_category_i18n`
--
ALTER TABLE `t_employer_notation_category_i18n`
  ADD CONSTRAINT `employer_notation_category_fk0` FOREIGN KEY (`category_id`) REFERENCES `t_employer_notation_category` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employer_notation_criteria`
--
ALTER TABLE `t_employer_notation_criteria`
  ADD CONSTRAINT `employer_notation_criteria_fk1` FOREIGN KEY (`category_id`) REFERENCES `t_employer_notation_category` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employer_notation_criteria_i18n`
--
ALTER TABLE `t_employer_notation_criteria_i18n`
  ADD CONSTRAINT `employer_notation_criteria_fk0` FOREIGN KEY (`criteria_id`) REFERENCES `t_employer_notation_criteria` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employer_project_document`
--
ALTER TABLE `t_employer_project_document`
  ADD CONSTRAINT `employer_project_document_fk0` FOREIGN KEY (`project_id`) REFERENCES `t_employer_project` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employer_project_i18n`
--
ALTER TABLE `t_employer_project_i18n`
  ADD CONSTRAINT `employer_project_i18n_fk0` FOREIGN KEY (`project_id`) REFERENCES `t_employer_project` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employer_user`
--
ALTER TABLE `t_employer_user`
  ADD CONSTRAINT `employer_user_fk0` FOREIGN KEY (`company_id`) REFERENCES `t_employer_company` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employer_user_fk1` FOREIGN KEY (`function_id`) REFERENCES `t_employer_function` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_employer_user_language`
--
ALTER TABLE `t_employer_user_language`
  ADD CONSTRAINT `employer_user_language_fk0` FOREIGN KEY (`level_id`) REFERENCES `t_employer_language_level` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_groups_i18n`
--
ALTER TABLE `t_groups_i18n`
  ADD CONSTRAINT `group_i18n` FOREIGN KEY (`group_id`) REFERENCES `t_groups` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_partner_activity_i18n`
--
ALTER TABLE `t_partner_activity_i18n`
  ADD CONSTRAINT `partner_activity_fk0` FOREIGN KEY (`activity_id`) REFERENCES `t_partner_activity` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_partner_work_category_i18n`
--
ALTER TABLE `t_partner_work_category_i18n`
  ADD CONSTRAINT `partner_work_category_i18n_fk0` FOREIGN KEY (`category_id`) REFERENCES `t_partner_work_category` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_partner_work_category_menu_i18n`
--
ALTER TABLE `t_partner_work_category_menu_i18n`
  ADD CONSTRAINT `partner_work_category_menu_fk0` FOREIGN KEY (`menu_id`) REFERENCES `t_partner_work_category_menu` (`id`) ON DELETE CASCADE;


--
-- Contraintes pour la table `t_payment_method_settings`
--
ALTER TABLE `t_payment_method_settings`
  ADD CONSTRAINT `payment_method_settings_fk0` FOREIGN KEY (`method_id`) REFERENCES `t_payment_method` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_payment_model_text_i18n`
--
ALTER TABLE `t_payment_model_text_i18n`
  ADD CONSTRAINT `payment_model_text_fk0` FOREIGN KEY (`model_id`) REFERENCES `t_payment_model_text` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_permissions_i18n`
--
ALTER TABLE `t_permissions_i18n`
  ADD CONSTRAINT `permission_i18n` FOREIGN KEY (`permission_id`) REFERENCES `t_permissions` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_permission_group_i18n`
--
ALTER TABLE `t_permission_group_i18n`
  ADD CONSTRAINT `permission_group_0` FOREIGN KEY (`group_id`) REFERENCES `t_permission_group` (`id`) ON DELETE CASCADE;



--
-- Contraintes pour la table `t_sale_billing_state_i18n`
--
ALTER TABLE `t_sale_billing_state_i18n`
  ADD CONSTRAINT `sale_billing_state_fk0` FOREIGN KEY (`state_id`) REFERENCES `t_sale_billing_state` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_sale_employee_commission_rate`
--
ALTER TABLE `t_sale_employee_commission_rate`
  ADD CONSTRAINT `sale_employee_commission_rate_fk0` FOREIGN KEY (`commission_id`) REFERENCES `t_sale_employee_commission` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_sale_employer_commission_rate`
--
ALTER TABLE `t_sale_employer_commission_rate`
  ADD CONSTRAINT `sale_commission_rate_fk0` FOREIGN KEY (`commission_id`) REFERENCES `t_sale_employer_commission` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_sessions`
--
ALTER TABLE `t_sessions`
  ADD CONSTRAINT `user_4` FOREIGN KEY (`user_id`) REFERENCES `t_users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_site_city`
--
ALTER TABLE `t_site_city`
  ADD CONSTRAINT `site_city_fk0` FOREIGN KEY (`country_id`) REFERENCES `t_site_country` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_site_city_i18n`
--
ALTER TABLE `t_site_city_i18n`
  ADD CONSTRAINT `site_city_fk1` FOREIGN KEY (`city_id`) REFERENCES `t_site_city` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_site_cms_block_page`
--
ALTER TABLE `t_site_cms_block_page`
  ADD CONSTRAINT `site_cms_block_page_fk0` FOREIGN KEY (`block_id`) REFERENCES `t_site_cms_block_page` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `site_cms_block_page_fk1` FOREIGN KEY (`page_id`) REFERENCES `t_site_cms_page` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_site_cms_menu`
--
ALTER TABLE `t_site_cms_menu`
  ADD CONSTRAINT `site_cms_menu_fk0` FOREIGN KEY (`page_id`) REFERENCES `t_site_cms_page` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_site_cms_menu_i18n`
--
ALTER TABLE `t_site_cms_menu_i18n`
  ADD CONSTRAINT `site_cms_menu_i18n_fk0` FOREIGN KEY (`menu_id`) REFERENCES `t_site_cms_menu` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_site_cms_page_i18n`
--
ALTER TABLE `t_site_cms_page_i18n`
  ADD CONSTRAINT `site_cms_page_i18n_fk0` FOREIGN KEY (`page_id`) REFERENCES `t_site_cms_page` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_site_event_i18n`
--
ALTER TABLE `t_site_event_i18n`
  ADD CONSTRAINT `site_event_i18n_fk0` FOREIGN KEY (`event_id`) REFERENCES `t_site_event` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_site_help_i18n`
--
ALTER TABLE `t_site_help_i18n`
  ADD CONSTRAINT `site_help_i18n_fk0` FOREIGN KEY (`help_id`) REFERENCES `t_site_help` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_site_picture_i18n`
--
ALTER TABLE `t_site_picture_i18n`
  ADD CONSTRAINT `site_picture_i18n_fk0` FOREIGN KEY (`picture_id`) REFERENCES `t_site_picture` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_site_shop_i18n`
--
ALTER TABLE `t_site_shop_i18n`
  ADD CONSTRAINT `site_shop_fk0` FOREIGN KEY (`shop_id`) REFERENCES `t_site_shop` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_site_warning_i18n`
--
ALTER TABLE `t_site_warning_i18n`
  ADD CONSTRAINT `site_warning_i18n_fk0` FOREIGN KEY (`warning_id`) REFERENCES `t_site_warning` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_system_model_email_i18n`
--
ALTER TABLE `t_system_model_email_i18n`
  ADD CONSTRAINT `customers_model_email_0` FOREIGN KEY (`model_id`) REFERENCES `t_system_model_email` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `system_model_email_0` FOREIGN KEY (`model_id`) REFERENCES `t_system_model_email` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `t_system_model_text_i18n`
--
ALTER TABLE `t_system_model_text_i18n`
  ADD CONSTRAINT `system_model_text_0` FOREIGN KEY (`model_id`) REFERENCES `t_system_model_text` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
