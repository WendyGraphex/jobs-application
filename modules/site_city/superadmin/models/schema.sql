
CREATE TABLE IF NOT EXISTS `t_site_city` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT "",     
  `icon` varchar(24) DEFAULT "",
  `color` varchar(10) DEFAULT "",    
  `postcode` varchar(10) DEFAULT "", 
  `country_id` int(11) unsigned NOT NULL  ,
  `awe` varchar(10) DEFAULT "",    
  `position` int(11) NOT NULL, 
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_site_city` ADD CONSTRAINT `site_city_fk0` FOREIGN KEY (`country_id`) REFERENCES `t_site_country` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_site_city_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `title` varchar(255) DEFAULT "", 
  `city_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
   PRIMARY KEY (`id`)   ,  
   UNIQUE KEY `unique` (`city_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_site_city_i18n` ADD CONSTRAINT `site_city_fk1` FOREIGN KEY (`city_id`) REFERENCES `t_site_city` (`id`) ON DELETE CASCADE;

