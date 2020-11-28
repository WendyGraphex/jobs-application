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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


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


ALTER TABLE `t_customer_blog_article_i18n` ADD CONSTRAINT `customer_blog_article_i18n_fk0` FOREIGN KEY (`article_id`) REFERENCES `t_customer_blog_article` (`id`) ON DELETE CASCADE;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_customer_blog_activity_i18n` ADD CONSTRAINT `customer_blog_activity_i18n_fk0` FOREIGN KEY (`activity_id`) REFERENCES `t_customer_blog_activity` (`id`) ON DELETE CASCADE;



--
-- Structure de la table `t_customer_blog_activity_menu`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Structure de la table `t_customer_blog_activity_menu_i18n`
--

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
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- FOREIGN KEYS
ALTER TABLE `t_customer_blog_activity_menu_i18n` ADD CONSTRAINT `customer_blog_activity_menu_fk0` FOREIGN KEY (`menu_id`) REFERENCES `t_customer_blog_activity_menu` (`id`) ON DELETE CASCADE;




CREATE TABLE IF NOT EXISTS `t_customer_blog_article_activity` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,  
  `article_id` int(11) unsigned DEFAULT NULL,
  `activity_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

ALTER TABLE `t_customer_blog_article_activity` ADD CONSTRAINT `customer_blog_article_activity_fk0` FOREIGN KEY (`article_id`) REFERENCES `t_customer_blog_article` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_customer_blog_article_activity` ADD CONSTRAINT `customer_blog_article_activity_fk1` FOREIGN KEY (`activity_id`) REFERENCES `t_customer_blog_activity` (`id`) ON DELETE CASCADE;



