--
-- Structure de la table `t_site_country`
--

CREATE TABLE IF NOT EXISTS `t_site_country` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(2) COLLATE utf8_bin NOT NULL DEFAULT '',  
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',  
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_1` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;


--
-- Structure de la table `t_site_country_language`  
--
CREATE TABLE IF NOT EXISTS `t_site_country_language` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,            
        `country_id` int(11) unsigned  NULL,  
        `language_id` int(11) unsigned  NULL,         
        `position` int(11) NOT NULL,             
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp  NULL,      
     PRIMARY KEY (`id`)      
) ENGINE=InnoDB DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;

ALTER TABLE `t_site_country_language` ADD CONSTRAINT `site_country_language_fk0` FOREIGN KEY (`language_id`) REFERENCES `t_languages` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_site_country_language` ADD CONSTRAINT `site_country_language_fk1` FOREIGN KEY (`country_id`) REFERENCES `t_site_country` (`id`) ON DELETE CASCADE;




CREATE TABLE IF NOT EXISTS `t_site_country_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',  
  `code` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '', 
  `title` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',  
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,  
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;