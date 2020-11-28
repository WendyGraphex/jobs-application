CREATE TABLE IF NOT EXISTS `t_partner_work_category` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(48) COLLATE utf8_bin NOT NULL,  
  `picture` VARCHAR(64) NOT NULL,
  `number_of_works` int(11) unsigned NOT NULL DEFAULT '0',
  `number_of_jobs` int(11) unsigned NOT NULL DEFAULT '0',
  `lb` int(11) unsigned NOT NULL DEFAULT '0',
  `rb` int(11) unsigned NOT NULL DEFAULT '0',
  `level` int(11) unsigned NOT NULL DEFAULT '0',
  `is_active` ENUM('NO','YES') NOT NULL DEFAULT 'NO', 
  `state` enum('UPLOAD') COLLATE utf8_bin NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE IF NOT EXISTS `t_partner_work_category_i18n` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id`  int(11)  UNSIGNED  NOT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `title` VARCHAR(255) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_partner_work_category_i18n` ADD CONSTRAINT `partner_work_category_i18n_fk0` FOREIGN KEY (`category_id`) REFERENCES `t_partner_work_category` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_partner_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT "",     
  `icon` varchar(24) DEFAULT "",
  `color` varchar(10) DEFAULT "",    
  `awe` varchar(10) DEFAULT "",    
  `position` int(11) NOT NULL, 
`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp  NULL DEFAULT NULL,   
PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `t_partner_activity_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `title` varchar(255) DEFAULT "", 
  `activity_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp  NULL DEFAULT NULL,   
   PRIMARY KEY (`id`)   ,  
   UNIQUE KEY `unique` (`activity_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_partner_activity_i18n` ADD CONSTRAINT `partner_activity_fk0` FOREIGN KEY (`activity_id`) REFERENCES `t_partner_activity` (`id`) ON DELETE CASCADE;



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
  `category_id`  int(11)  unsigned NULL DEFAULT NULL,
  `state` enum('UPLOAD','ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL, 
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Structure de la table `t_partner_work_category_menu_i18n`
--

CREATE TABLE IF NOT EXISTS `t_partner_work_category_menu_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `menu_id`  int(11) unsigned NOT NULL DEFAULT 0,
  `icon` varchar(30) COLLATE utf8_bin NOT NULL,  
  `picture` varchar(30) COLLATE utf8_bin NOT NULL,  
  `target` enum('_blank','top','parent','') COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(255) COLLATE utf8_bin NOT NULL,  
    `state` enum('UPLOAD','ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL, 
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- FOREIGN KEYS
ALTER TABLE `t_partner_work_category_menu_i18n` ADD CONSTRAINT `partner_work_category_menu_fk0` FOREIGN KEY (`menu_id`) REFERENCES `t_partner_work_category_menu` (`id`) ON DELETE CASCADE;
