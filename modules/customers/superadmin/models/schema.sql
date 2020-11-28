CREATE TABLE IF NOT EXISTS `t_customer_claim_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT "",     
  `icon` varchar(24) DEFAULT "",
  `color` varchar(10) DEFAULT "",    
  `awe` varchar(10) DEFAULT "",    
  `position` int(11) NOT NULL, 
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `t_customer_claim_type_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `title` varchar(255) DEFAULT "", 
  `type_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
   PRIMARY KEY (`id`)   ,  
   UNIQUE KEY `unique` (`type_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_customer_claim_type_i18n` ADD CONSTRAINT `customer_claim_type_fk0` FOREIGN KEY (`type_id`) REFERENCES `t_customer_claim_type` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_customer_contact_claim` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,    
  `firstname` varchar(48) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lastname` varchar(48) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, 
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;



CREATE TABLE IF NOT EXISTS `t_customer_advert_search` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,    
  `employer_user_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employee_user_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `category_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `number_of_results` int(11) UNSIGNED DEFAULT 0,
  `ip` varchar(16) COLLATE utf8_bin NOT NULL, 
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `culture` VARCHAR(6) NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `city` varchar(64) COLLATE utf8_bin NOT NULL,
  `query` varchar(64) COLLATE utf8_bin NOT NULL,
  `location` varchar(64) COLLATE utf8_bin NOT NULL,
  `type` enum('employee','employer') COLLATE utf8_bin NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;
