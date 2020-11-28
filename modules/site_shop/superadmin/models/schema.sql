

CREATE TABLE IF NOT EXISTS `t_site_shop` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,    
  `favicon` varchar(24) DEFAULT "",    
  `icon` varchar(24) DEFAULT "",    
  `logo` varchar(24) DEFAULT "",    
  `created_at` datetime NOT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `t_site_shop_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `meta_title` varchar(255) DEFAULT "", 
  `meta_keywords` varchar(512) DEFAULT "",   
  `meta_description` varchar(512) DEFAULT "",  
  `meta_author` varchar(255) DEFAULT "",  
  `shop_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
   PRIMARY KEY (`id`)   ,  
   UNIQUE KEY `unique` (`shop_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_site_shop_i18n` ADD CONSTRAINT `site_shop_fk0` FOREIGN KEY (`shop_id`) REFERENCES `t_site_shop` (`id`) ON DELETE CASCADE;


