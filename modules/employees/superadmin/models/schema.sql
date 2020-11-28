--
-- Structure de la table `t_employee_user`
--

CREATE TABLE IF NOT EXISTS `t_employee_user` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `creator_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `level_id` INT(11) UNSIGNED NULL,
  `experience_id` INT(11) UNSIGNED NULL,
  `username` varchar(48) DEFAULT "",
  `instagram_user` varchar(24) DEFAULT "",
  `linkedin_user` varchar(24) DEFAULT "",
  `gender` enum('Mr','Ms','Mrs') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `firstname` varchar(48) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lastname` varchar(48) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `birthday` date  NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fax` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `web` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `address1` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `address2` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `postcode` char(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `state` varchar(20) COLLATE utf8_bin NOT NULL,
  `city` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `country` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `number_of_adverts` int(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `default_language` VARCHAR(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `last_delivery` int(11) UNSIGNED DEFAULT 0,
  `number_of_works_inprogress` int(11) UNSIGNED DEFAULT 0,
  `number_of_works` int(11) UNSIGNED DEFAULT 0, 
  `avevage_response_time` int(11) UNSIGNED DEFAULT 0,
  `average_notation` int(8) UNSIGNED NULL DEFAULT NULL ,
  `is_online` ENUM('Y','N') DEFAULT 'N',
  `max_advert_category` int(5) UNSIGNED NULL DEFAULT NULL ,
  `is_active` enum('YES','NO') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `is_locked` ENUM('NO','YES') NOT NULL DEFAULT 'NO',
  `is_validated` ENUM('NO','YES') NOT NULL DEFAULT 'NO',
  `is_completed` ENUM('NO','YES') NOT NULL DEFAULT 'NO',
  `is_activated` ENUM('NO','YES') NOT NULL DEFAULT 'NO' ,
  `status` ENUM('ACTIVE','DELETE') NOT NULL DEFAULT 'ACTIVE' ,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE `employee_user_u0` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

-- --------------------------------------------------------


CREATE TABLE `t_employee_session` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
 `session` varchar(40) COLLATE utf8_bin NOT NULL,
 `user_id` int(11) UNSIGNED NOT NULL, 
 `ip` varchar(50) COLLATE utf8_bin NOT NULL,
  `lat` decimal(20,13)  NULL DEFAULT NULL,      
  `lng` decimal(20,13)  NULL DEFAULT NULL, 
 `started_at` timestamp NOT NULL,
 `ended_at` timestamp NOT NULL, 
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_employee_session` ADD CONSTRAINT `employee_session_fk1` FOREIGN KEY (`user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;


CREATE TABLE `t_employee_remember` (
 `id` int(11) UNSIGNED NOT NULL  AUTO_INCREMENT,
 `employee_id` int(11) UNSIGNED NOT NULL,
 `key` varchar(40) COLLATE utf8_bin NOT NULL,
 `ip` varchar(50) COLLATE utf8_bin NOT NULL,
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


ALTER TABLE `t_employee_remember` ADD CONSTRAINT `employee_remember_fk1` FOREIGN KEY (`employee_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;


--
-- Structure de la table `t_employee_forgotPassword`
--

CREATE TABLE IF NOT EXISTS `t_employee_forgot_password` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `key` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `employee_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

-- --------------------------------------------------------

--
-- Contraintes pour la table `t_employee_forgotPassword`
--
ALTER TABLE `t_employee_forgot_password`   ADD CONSTRAINT `employee_forgot_password_fk0` FOREIGN KEY (`employee_id`) REFERENCES `t_employee_user` (`id`);


--
-- Contraintes pour la table `t_employee_validation_token`
--
CREATE TABLE IF NOT EXISTS `t_employee_validation_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,   
  `user_id` int(11) unsigned NOT NULL,
  `token` varchar(64) COLLATE utf8_bin NOT NULL,
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contraintes pour la table `t_employee_validation_token`
--
ALTER TABLE `t_employee_validation_token` ADD CONSTRAINT `employee_validation_token_fk0` FOREIGN KEY (`user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_employee_contact` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
 `gender` enum('Mr','Ms','Mrs') NOT NULL,
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
 `updated_at` timestamp  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



CREATE TABLE IF NOT EXISTS `t_employee_advert` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,   
 `reference` varchar(32) DEFAULT "" ,
  `budget` decimal(8,2) NOT NULL DEFAULT 0.0,
  `employee_user_id` int(11) UNSIGNED NOT NULL,
  `number_of_languages` int(8) UNSIGNED DEFAULT 0,
  `number_of_categories` int(8) UNSIGNED DEFAULT 0,
  `number_of_documents` int(8) UNSIGNED DEFAULT 0,
 `published_at` datetime  NULL DEFAULT NULL, 
 `refused_at` datetime  NULL DEFAULT NULL, 
  `expired_at` datetime NULL DEFAULT NULL,
`position` int(11) UNSIGNED DEFAULT 0 ,
  `state` ENUM('UPLOAD','DRAFT','REFUSED','COMMITTED','PUBLISHED') DEFAULT 'DRAFT' ,  
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

ALTER TABLE `t_employee_advert` ADD CONSTRAINT `employee_advert_fk1` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_employee_advert_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `url` varchar(255) DEFAULT "", 
  `title` varchar(255) DEFAULT "", 
  `short_description` varchar(512) DEFAULT "",   
  `content` TEXT DEFAULT "",
  `advert_id` int(11) unsigned DEFAULT NULL,
  `is_validated` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO', 
  `published_at` datetime  NULL DEFAULT NULL, 
  `refused_at` datetime  NULL DEFAULT NULL, 
  `state` ENUM('UPLOAD') NULL DEFAULT NULL ,  
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
   PRIMARY KEY (`id`),  
   UNIQUE KEY `unique` (`advert_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_employee_advert_i18n` ADD CONSTRAINT `employee_advert_i18n_fk0` FOREIGN KEY (`advert_id`) REFERENCES `t_employee_advert` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_employee_advert_category` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,  
  `advert_id` int(11) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

ALTER TABLE `t_employee_advert_category` ADD CONSTRAINT `employee_advert_category_fk0` FOREIGN KEY (`advert_id`) REFERENCES `t_employee_advert` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_advert_category` ADD CONSTRAINT `employee_advert_category_fk1` FOREIGN KEY (`category_id`) REFERENCES `t_partner_work_category` (`id`) ON DELETE CASCADE;



--
-- Structure de la table `t_employee_advert_document`
--

CREATE TABLE IF NOT EXISTS `t_employee_advert_document` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `file` varchar(128) COLLATE utf8_bin NOT NULL,
  `extension` varchar(10) COLLATE utf8_bin NOT NULL,
  `advert_id` int(11) UNSIGNED NOT NULL,
 `employee_user_id` int(11) UNSIGNED NOT NULL,
  `filesize` int(11) unsigned DEFAULT NULL,  
`is_public` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'Y',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL  DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_employee_advert_document` ADD CONSTRAINT `employee_advert_document_fk0` FOREIGN KEY (`advert_id`) REFERENCES `t_employee_advert`  (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_advert_document` ADD CONSTRAINT `employee_advert_document_fk1` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user`  (`id`) ON DELETE CASCADE;



CREATE TABLE IF NOT EXISTS `t_employee_advert_popular` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,  
  `advert_id` int(11) unsigned DEFAULT NULL,  
  `employee_user_id` int(11) UNSIGNED NULL,
 `employer_user_id` int(11) UNSIGNED NULL,
 `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `ip` varchar(16) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

ALTER TABLE `t_employee_advert_popular` ADD CONSTRAINT `employee_advert_popular_fk0` FOREIGN KEY (`advert_id`) REFERENCES `t_employee_advert` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_advert_popular` ADD CONSTRAINT `employee_advert_popular_fk1` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_advert_popular` ADD CONSTRAINT `employee_advert_popular_fk2` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;

-- 
-- CREATE TABLE IF NOT EXISTS `t_employee_advert_search` (
--   `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,    
--   `employer_user_id` int(11) UNSIGNED NULL DEFAULT NULL,
--   `employee_user_id` int(11) UNSIGNED NULL DEFAULT NULL,
--   `category_id` int(11) UNSIGNED NULL DEFAULT NULL,
--   `number_of_results` int(11) UNSIGNED DEFAULT 0,
--   `ip` varchar(16) COLLATE utf8_bin NOT NULL, 
--   `lang` varchar(2) COLLATE utf8_bin NOT NULL,
--   `culture` VARCHAR(6) NOT NULL,
--   `country` varchar(2) COLLATE utf8_bin NOT NULL,
--   `city` varchar(64) COLLATE utf8_bin NOT NULL,
--   `query` varchar(64) COLLATE utf8_bin NOT NULL,
--   `location` varchar(64) COLLATE utf8_bin NOT NULL,
--   `created_at` datetime NOT NULL,
--   `updated_at` datetime  NULL DEFAULT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

-- ALTER TABLE `t_employee_advert_search` ADD CONSTRAINT `employee_advert_search_fk0` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
-- ALTER TABLE `t_employee_advert_search` ADD CONSTRAINT `employee_advert_search_fk1` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
-- ALTER TABLE `t_employee_advert_search` ADD CONSTRAINT `employee_advert_search_fk2` FOREIGN KEY (`category_id`) REFERENCES `t_partner_work_category` (`id`) ON DELETE CASCADE;
-- 
-- 
-- CREATE TABLE IF NOT EXISTS `t_employee_advert_search_result` (
--   `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,    
--   `search_id` int(11) UNSIGNED NULL,
--   `advert_id` int(11) UNSIGNED NULL,
--   `created_at` datetime NOT NULL,
--   `updated_at` datetime  NULL DEFAULT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;
-- 
-- ALTER TABLE `t_employee_advert_search_result` ADD CONSTRAINT `employee_advert_search_result_fk0` FOREIGN KEY (`search_id`) REFERENCES `t_employee_advert_search` (`id`) ON DELETE CASCADE;
-- ALTER TABLE `t_employee_advert_search_result` ADD CONSTRAINT `employee_advert_search_result_fk1` FOREIGN KEY (`advert_id`) REFERENCES `t_employee_advert` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_employee_advert_city` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,  
  `city_id` int(11) unsigned DEFAULT NULL,
  `advert_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

ALTER TABLE `t_employee_advert_city` ADD CONSTRAINT `employee_advert_city_fk0` FOREIGN KEY (`advert_id`) REFERENCES `t_employee_advert` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_advert_city` ADD CONSTRAINT `employee_advert_city_fk0` FOREIGN KEY (`city_id`) REFERENCES `t_site_city` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_employee_advert_alert` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,    
  `employee_id` int(11) UNSIGNED NOT NULL ,  
  `advert_id` int(11) UNSIGNED NOT NULL ,  
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

ALTER TABLE `t_employee_advert_alert` ADD CONSTRAINT `employee_advert_alert_fk0` FOREIGN KEY (`advert_id`) REFERENCES `t_employer_advert` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_advert_alert` ADD CONSTRAINT `employee_advert_alert_fk1` FOREIGN KEY (`employee_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;



CREATE TABLE IF NOT EXISTS `t_employee_advert_request` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,    
  `employee_id` int(11) UNSIGNED NOT NULL ,  
  `advert_id` int(11) UNSIGNED NOT NULL ,  
  `employer_id` int(11) UNSIGNED NOT NULL ,  
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

ALTER TABLE `t_employee_advert_request` ADD CONSTRAINT `employee_advert_request_fk0` FOREIGN KEY (`advert_id`) REFERENCES `t_employer_advert` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_advert_request` ADD CONSTRAINT `employee_advert_request_fk1` FOREIGN KEY (`employee_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_advert_request` ADD CONSTRAINT `employee_advert_request_fk2` FOREIGN KEY (`employer_id`) REFERENCES `t_employer_company` (`id`) ON DELETE CASCADE;



CREATE TABLE IF NOT EXISTS `t_employee_advert_i18n_remark` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,  
  `advert_i18n_id` int(11) unsigned DEFAULT NULL,  
  `remarks` TEXT DEFAULT "", 
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_employee_advert_i18n_remark` ADD CONSTRAINT `employee_advert_remark_fk0` FOREIGN KEY (`advert_i18n_id`) REFERENCES `t_employee_advert_i18n` (`id`) ON DELETE CASCADE;



CREATE TABLE IF NOT EXISTS `t_employee_advert_i18n_claim` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,  
  `reference` varchar(48) DEFAULT "",   
  `contact_id` int(11) UNSIGNED NOT NULL ,  
  `type_id` int(11) UNSIGNED NULL DEFAULT NULL, 
  `advert_i18n_id` int(11) UNSIGNED NOT NULL ,     
  `description` TEXT DEFAULT "", 
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;


ALTER TABLE `t_employee_advert_i18n_claim` ADD CONSTRAINT `employee_advert_i18n_claim_fk0` FOREIGN KEY (`advert_i18n_id`) REFERENCES `t_employee_advert_i18n` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_advert_i18n_claim` ADD CONSTRAINT `employee_advert_i18n_claim_fk1` FOREIGN KEY (`contact_id`) REFERENCES `t_customer_contact_claim` (`id`) ON DELETE CASCADE;



CREATE TABLE IF NOT EXISTS `t_employee_advert_alert_advert` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,    
  `alert_id` int(11) UNSIGNED NOT NULL ,  
  `advert_id` int(11) UNSIGNED NOT NULL ,  
  `employee_id` int(11) UNSIGNED NOT NULL ,  
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

ALTER TABLE `t_employee_advert_alert_advert` ADD CONSTRAINT `employee_advert_alert_advert_fk0` FOREIGN KEY (`advert_id`) REFERENCES `t_employer_advert` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_advert_alert_advert` ADD CONSTRAINT `employee_advert_alert_advert_fk1` FOREIGN KEY (`alert_id`) REFERENCES `t_employee_alert` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_advert_alert_advert` ADD CONSTRAINT `employee_advert_alert_advert_fk2` FOREIGN KEY (`employee_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;


--
-- Structure de la table `t_employee_gallery`
--

CREATE TABLE IF NOT EXISTS `t_employee_gallery` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(15) COLLATE utf8_bin NOT NULL, 
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `tpl` varchar(15) COLLATE utf8_bin NOT NULL,
  `number_of_items` INT(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



CREATE TABLE IF NOT EXISTS `t_employee_gallery_i18n` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `title` VARCHAR(255) NOT NULL, 
  `gallery_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


ALTER TABLE `t_employee_gallery_i18n` ADD CONSTRAINT `employee_gallery_i18n_fk0` FOREIGN KEY (`gallery_id`) REFERENCES `t_employee_gallery` (`id`) ON DELETE CASCADE;

--
-- Structure de la table `t_employee_gallery_employee`
--

CREATE TABLE IF NOT EXISTS `t_employee_gallery_employee` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) UNSIGNED NOT NULL,
  `employee_user_id` int(11) UNSIGNED NOT NULL,
  `position` INT(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


ALTER TABLE `t_employee_gallery_employee` ADD CONSTRAINT `employee_gallery_employee_fk0` FOREIGN KEY (`gallery_id`) REFERENCES `t_employee_gallery` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_gallery_employee` ADD CONSTRAINT `employee_gallery_employee_fk1` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;




CREATE TABLE IF NOT EXISTS `t_employee_study_level` (
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


CREATE TABLE IF NOT EXISTS `t_employee_study_level_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `title` varchar(255) DEFAULT "", 
  `level_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
   PRIMARY KEY (`id`)   ,  
   UNIQUE KEY `unique` (`level_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_employee_study_level_i18n` ADD CONSTRAINT `employee_study_level_fk0` FOREIGN KEY (`level_id`) REFERENCES `t_employee_study_level` (`id`) ON DELETE CASCADE;



CREATE TABLE IF NOT EXISTS `t_employee_function` (
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


CREATE TABLE IF NOT EXISTS `t_employee_function_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `title` varchar(255) DEFAULT "", 
  `function_id` int(11) unsigned DEFAULT NULL,
`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp  NULL DEFAULT NULL,   
   PRIMARY KEY (`id`)   ,  
   UNIQUE KEY `unique` (`function_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_employee_function_i18n` ADD CONSTRAINT `employee_function_fk0` FOREIGN KEY (`function_id`) REFERENCES `t_employee_function` (`id`) ON DELETE CASCADE;



CREATE TABLE IF NOT EXISTS `t_employee_experience` (
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


CREATE TABLE IF NOT EXISTS `t_employee_experience_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `title` varchar(255) DEFAULT "", 
  `experience_id` int(11) unsigned DEFAULT NULL,
`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp  NULL DEFAULT NULL,   
   PRIMARY KEY (`id`)   ,  
   UNIQUE KEY `unique` (`experience_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_employee_experience_i18n` ADD CONSTRAINT `employee_experience_fk0` FOREIGN KEY (`experience_id`) REFERENCES `t_employee_experience` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_employee_category` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,  
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

ALTER TABLE `t_employee_category` ADD CONSTRAINT `employee_category_fk0` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_category` ADD CONSTRAINT `employee_category_fk1` FOREIGN KEY (`category_id`) REFERENCES `t_partner_work_category` (`id`) ON DELETE CASCADE;




CREATE TABLE IF NOT EXISTS `t_employee_content` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, 
  `employee_user_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(15) COLLATE utf8_bin NOT NULL, 
  `picture` varchar(24) COLLATE utf8_bin NOT NULL ,
  `url` VARCHAR(255) NOT NULL,
  `template` varchar(64) COLLATE utf8_bin NOT NULL, 
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_employee_content` ADD CONSTRAINT `employee_content_fk0` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS `t_employee_content_i18n` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, 
  `content_id` int(11) UNSIGNED NOT NULL,
`lang` VARCHAR(2) NOT NULL ,
  `description` VARCHAR(255) NOT NULL,
`meta_title` varchar(255) COLLATE utf8_bin NOT NULL,
`meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
`meta_keywords` varchar(255) COLLATE utf8_bin NOT NULL,
`meta_robots` varchar(30) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_employee_content_i18n` ADD CONSTRAINT `employee_content_i18n_fk0` FOREIGN KEY (`content_id`) REFERENCES `t_employee_content` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_employee_language_level` (
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


CREATE TABLE IF NOT EXISTS `t_employee_language_level_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `title` varchar(255) DEFAULT "", 
  `level_id` int(11) unsigned DEFAULT NULL,
   `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
   PRIMARY KEY (`id`)   ,  
   UNIQUE KEY `unique` (`level_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_employee_language_level_i18n` ADD CONSTRAINT `employee_language_level_fk0` FOREIGN KEY (`level_id`) REFERENCES `t_employee_language_level` (`id`) ON DELETE CASCADE;



CREATE TABLE IF NOT EXISTS `t_employee_user_language` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level_id` int(11) unsigned DEFAULT NULL,
  `lang` varchar(2) DEFAULT "", 
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `position` int(11) NOT NULL, 
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_employee_user_language` ADD CONSTRAINT `employee_user_language_fk0` FOREIGN KEY (`level_id`) REFERENCES `t_employee_language_level` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_user_language` ADD CONSTRAINT `employee_user_language_fk1` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS `t_employee_skill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT, 
  `name` varchar(32) DEFAULT "",     
  `icon` varchar(24) DEFAULT "",
  `picture` varchar(24) DEFAULT "",
  `color` varchar(10) DEFAULT "",    
  `awe` varchar(10) DEFAULT "",    
  `position` int(11) NOT NULL, 
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `t_employee_skill_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `title` varchar(255) DEFAULT "", 
  `skill_id` int(11) unsigned DEFAULT NULL,
`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp  NULL DEFAULT NULL,   
   PRIMARY KEY (`id`)   ,  
   UNIQUE KEY `unique` (`skill_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_employee_skill_i18n` ADD CONSTRAINT `employee_skill_fk0` FOREIGN KEY (`skill_id`) REFERENCES `t_employee_skill` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_employee_user_skill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `skill_id` int(11) unsigned DEFAULT NULL,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
`position` int(11) NOT NULL,   
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_employee_user_skill` ADD CONSTRAINT `employee_user_skill_fk0` FOREIGN KEY (`skill_id`) REFERENCES `t_employee_skill` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_user_skill` ADD CONSTRAINT `employee_user_skill_fk1` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_employee_user_skill_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `value` varchar(255) DEFAULT "", 
  `skill_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp  NULL DEFAULT NULL,   
   PRIMARY KEY (`id`)   ,  
   UNIQUE KEY `unique` (`skill_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_employee_user_skill_i18n` ADD CONSTRAINT `employee_user_skill_i18n_fk0` FOREIGN KEY (`skill_id`) REFERENCES `t_employee_user_skill` (`id`) ON DELETE CASCADE;




CREATE TABLE IF NOT EXISTS `t_employee_graduate_diploma` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT, 
  `name` varchar(32) DEFAULT "",    
`position` int(11) NOT NULL,   
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `t_employee_graduate_diploma_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "",  
 `title` varchar(255) DEFAULT "",  
  `graduate_id` int(11) unsigned DEFAULT NULL,
`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp  NULL DEFAULT NULL,   
   PRIMARY KEY (`id`)   ,  
   UNIQUE KEY `unique` (`graduate_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_employee_graduate_diploma_i18n` ADD CONSTRAINT `employee_graduate_diploma_fk0` FOREIGN KEY (`graduate_id`) REFERENCES `t_employee_graduate_diploma` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_employee_user_graduate_diploma` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT, 
  `city_id` int(11) unsigned DEFAULT NULL,
  `graduate_id` int(11) unsigned DEFAULT NULL,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `country` varchar(2) DEFAULT "",  
  `year` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_employee_user_graduate_diploma` ADD CONSTRAINT `employee_user_graduate_diploma_fk0` FOREIGN KEY (`graduate_id`) REFERENCES `t_employee_graduate_diploma` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_user_graduate_diploma` ADD CONSTRAINT `employee_user_graduate_diploma_fk1` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_employee_user_graduate_diploma_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `diploma` varchar(255) DEFAULT "", 
  `location` varchar(255) DEFAULT "", 
  `city` varchar(255) DEFAULT "", 
  `user_graduate_id` int(11) unsigned DEFAULT NULL,
`created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp  NULL DEFAULT NULL,   
   PRIMARY KEY (`id`)   ,  
   UNIQUE KEY `unique` (`user_graduate_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_employee_user_graduate_diploma_i18n` ADD CONSTRAINT `employee_user_graduate_diploma_i18n_fk0` FOREIGN KEY (`user_graduate_id`) REFERENCES `t_employee_user_graduate_diploma` (`id`) ON DELETE CASCADE;




CREATE TABLE IF NOT EXISTS `t_employee_user_popular` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,  
  `employee_user_id` int(11) unsigned DEFAULT NULL,  
  `employer_user_id` int(11) UNSIGNED NULL DEFAULT NULL,  
  `user_id` int(11) UNSIGNED NULL DEFAULT NULL,  
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `ip` varchar(16) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

ALTER TABLE `t_employee_user_popular` ADD CONSTRAINT `employee_user_popular_fk0` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_user_popular` ADD CONSTRAINT `employee_user_popular_fk1` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_user_popular` ADD CONSTRAINT `employee_user_popular_fk2` FOREIGN KEY (`user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;



CREATE TABLE IF NOT EXISTS `t_employee_category_popular` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,  
  `employee_user_id` int(11) unsigned DEFAULT NULL,  
  `employer_user_id` int(11) unsigned DEFAULT NULL,  
  `category_id` int(11) UNSIGNED NULL DEFAULT NULL,  
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `ip` varchar(16) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

ALTER TABLE `t_employee_category_popular` ADD CONSTRAINT `employee_category_popular_fk0` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_category_popular` ADD CONSTRAINT `employee_category_popular_fk1` FOREIGN KEY (`category_id`) REFERENCES `t_partner_work_category` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_category_popular` ADD CONSTRAINT `employee_category_popular_fk2` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;


 

CREATE TABLE IF NOT EXISTS `t_employee_favourite` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,     
  `employee_user_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employer_user_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employee_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employer_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employer_advert_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employee_advert_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employer_advert_lang` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `employee_advert_lang` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

