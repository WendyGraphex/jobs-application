CREATE TABLE IF NOT EXISTS `t_employer_notation_category` (
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


CREATE TABLE IF NOT EXISTS `t_employer_notation_category_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `title` varchar(255) DEFAULT "", 
  `category_id` int(11) unsigned DEFAULT NULL,
`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp  NULL DEFAULT NULL,   
   PRIMARY KEY (`id`)   ,  
   UNIQUE KEY `unique` (`category_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_employer_notation_category_i18n` ADD CONSTRAINT `employer_notation_category_fk0` FOREIGN KEY (`category_id`) REFERENCES `t_employer_notation_category` (`id`) ON DELETE CASCADE;



CREATE TABLE IF NOT EXISTS `t_employer_notation_criteria` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT, 
  `name` varchar(32) DEFAULT "",     
  `icon` varchar(24) DEFAULT "",
  `color` varchar(10) DEFAULT "",    
  `awe` varchar(10) DEFAULT "",   
  `max` int(11) unsigned NOT NULL DEFAULT 0, 
  `position` int(11) NOT NULL, 
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `t_employer_notation_criteria_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `title` varchar(255) DEFAULT "", 
  `criteria_id` int(11) unsigned DEFAULT NULL,
`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp  NULL DEFAULT NULL,   
   PRIMARY KEY (`id`)   ,  
   UNIQUE KEY `unique` (`criteria_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_employer_notation_criteria_i18n` ADD CONSTRAINT `employer_notation_criteria_fk0` FOREIGN KEY (`criteria_id`) REFERENCES `t_employer_notation_criteria` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_employer_advert_i18n_notation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT, 
  `employee_user_id` int(11) UNSIGNED  NULL DEFAULT NULL,
  `employer_user_id` int(11) UNSIGNED NULL DEFAULT NULL,  
  `employee_advert_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employee_advert_lang` varchar(2) DEFAULT "", 
  `employer_advert_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employer_advert_lang` varchar(2) DEFAULT "", 
  `work_id` int(11) UNSIGNED NOT NULL, 
  `notation` decimal(6,3) NOT NULL DEFAULT 0, 
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;




CREATE TABLE IF NOT EXISTS `t_employer_criteria_notation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT, 
  `employer_user_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `criteria_id` int(11) UNSIGNED NULL DEFAULT NULL,  
  `notation` decimal(6,3) NOT NULL DEFAULT 0, 
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

