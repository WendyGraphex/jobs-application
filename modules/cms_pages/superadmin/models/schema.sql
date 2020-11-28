--
-- Structure de la table `t_site_cms_page`
--

CREATE TABLE IF NOT EXISTS `t_site_cms_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Structure de la table `t_site_cms_page_i18n`
--
CREATE TABLE IF NOT EXISTS `t_site_cms_page_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` unsigned int(11)  NOT NULL,
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
  `updated_at` timestamp  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_site_cms_page_i18n` ADD CONSTRAINT `site_cms_page_i18n_fk0` FOREIGN KEY (`page_id`) REFERENCES `t_site_cms_page` (`id`) ON DELETE CASCADE;

--
-- Structure de la table `t_site_cms_block`
--
CREATE TABLE IF NOT EXISTS `t_site_cms_block` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin NOT NULL, 
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Structure de la table `t_site_cms_block_page`
--
CREATE TABLE IF NOT EXISTS `t_site_cms_block_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `block_id`  int(11) unsigned  NOT NULL,
  `page_id`  int(11) unsigned NULL DEFAULT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `target` enum('_blank','top','parent','') COLLATE utf8_bin NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- FOREIGN KEYS
ALTER TABLE `t_site_cms_block_page` ADD CONSTRAINT `site_cms_block_page_fk0` FOREIGN KEY (`block_id`) REFERENCES `t_site_cms_block_page` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_site_cms_block_page` ADD CONSTRAINT `site_cms_block_page_fk1`FOREIGN KEY (`page_id`) REFERENCES `t_site_cms_page` (`id`) ON DELETE CASCADE;

--  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
--
-- Structure de la table `t_site_cms_menu`
--

CREATE TABLE IF NOT EXISTS `t_site_cms_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,  
  `lb` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rb` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0', 
  `page_id`  int(11) unsigned  NULL DEFAULT NULL,
  `icon` varchar(30) COLLATE utf8_bin NOT NULL,  
  `awe` varchar(30) COLLATE utf8_bin NOT NULL,  
  `picture` varchar(30) COLLATE utf8_bin NOT NULL,  
  `target` enum('_blank','top','parent','') COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_link` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'YES',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


ALTER TABLE `t_site_cms_menu` ADD CONSTRAINT `site_cms_menu_fk0` FOREIGN KEY (`page_id`) REFERENCES `t_site_cms_page` (`id`) ON DELETE CASCADE;

--  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
--  `start_at` timestamp NULL DEFAULT NULL,
--  `expired_at` timestamp NULL DEFAULT NULL,

--
-- Structure de la table `t_site_cms_menu_i18n`
--

CREATE TABLE IF NOT EXISTS `t_site_cms_menu_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `menu_id`  int(11) unsigned NULL DEFAULT NULL, 
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,  
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- FOREIGN KEYS
ALTER TABLE `t_site_cms_menu_i18n` ADD CONSTRAINT `site_cms_menu_i18n_fk0` FOREIGN KEY (`menu_id`) REFERENCES `t_site_cms_menu` (`id`) ON DELETE CASCADE;
