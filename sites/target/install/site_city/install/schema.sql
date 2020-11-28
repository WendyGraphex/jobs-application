
CREATE TABLE IF NOT EXISTS `t_site_city` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT "",     
  `icon` varchar(24) DEFAULT "",
  `color` varchar(10) DEFAULT "",    
  `postcode` varchar(10) DEFAULT "", 
  `country` varchar(2) DEFAULT "", 
  `awe` varchar(10) DEFAULT "",    
  `position` int(11) NOT NULL, 
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `t_site_city_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `title` varchar(255) DEFAULT "", 
  `city_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
   PRIMARY KEY (`id`)   ,  
   UNIQUE KEY `unique` (`city_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_site_city_i18n` ADD CONSTRAINT `site_city_fk0` FOREIGN KEY (`city_id`) REFERENCES `t_site_city` (`id`) ON DELETE CASCADE;

