CREATE TABLE IF NOT EXISTS `t_customer_course_category` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(48) COLLATE utf8_bin NOT NULL,  
  `picture` VARCHAR(64) NOT NULL,
  `number_of_courses` int(11) unsigned NOT NULL DEFAULT '0', 
  `number_of_views` int(11) unsigned NOT NULL DEFAULT '0', 
  `lb` int(11) unsigned NOT NULL DEFAULT '0',
  `rb` int(11) unsigned NOT NULL DEFAULT '0',
  `level` int(11) unsigned NOT NULL DEFAULT '0',
  `is_active` ENUM('NO','YES') NOT NULL DEFAULT 'NO', 
  `state` enum('UPLOAD') COLLATE utf8_bin NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE IF NOT EXISTS `t_customer_course_category_i18n` (
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

ALTER TABLE `t_customer_course_category_i18n` ADD CONSTRAINT `customer_course_category_i18n_fk0` FOREIGN KEY (`category_id`) REFERENCES `t_customer_course_category` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_customer_academy_teacher_user` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(48) DEFAULT "",  
  `gender` enum('Mr','Ms','Mrs') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `firstname` varchar(48) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lastname` varchar(48) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `birthday` date NULL DEFAULT NULL,
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
  `city` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `city_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `country` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,  
  `function_id` int(11) UNSIGNED  NULL DEFAULT NULL,
  `function` varchar(40)  COLLATE utf8_bin NOT NULL,
  `number_of_courses` int(11) UNSIGNED DEFAULT 0,
  `is_completed` ENUM('NO','YES') NOT NULL DEFAULT 'NO',
  `is_validated` ENUM('NO','YES') NOT NULL DEFAULT 'NO',
  `is_active` enum('YES','NO')  COLLATE utf8_bin NOT NULL,
  `is_admin` enum('YES','NO')  COLLATE utf8_bin NOT NULL,
  `is_locked` ENUM('NO','YES') NOT NULL DEFAULT 'NO',
  `lastlogin` timestamp NULL DEFAULT NULL,
  `lastpassword` timestamp NULL DEFAULT NULL,
  `status` ENUM('ACTIVE','DELETE') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_academy_teacher_user_u0` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

--
-- Structure de la table `t_customer_academy_teacher_session`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_teacher_user_session` (
   `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
 `session` varchar(40) COLLATE utf8_bin NOT NULL,
 `user_id` int(11) UNSIGNED NOT NULL, 
 `ip` varchar(50) COLLATE utf8_bin NOT NULL,
  `lat` decimal(20,13) NOT NULL DEFAULT '0.000000',      
  `lng` decimal(20,13) NOT NULL DEFAULT '0.000000', 
 `started_at` timestamp  NULL,
 `ended_at` timestamp  NULL,
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp  NULL DEFAULT NULL,   
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;
-- --------------------------------------------------------

--
-- Contraintes pour la table `t_customer_academy_teacher_session`
--
ALTER TABLE `t_customer_academy_teacher_user_session`   ADD CONSTRAINT `customer_academy_teacher_user_session_fk0` FOREIGN KEY (`user_id`) REFERENCES `t_customer_academy_teacher_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Structure de la table `t_customer_academy_teacher_user_remember`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_teacher_user_remember` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL,
  `key` varchar(40) COLLATE utf8_bin NOT NULL,
  `ip` varchar(36) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

-- --------------------------------------------------------

--
-- Contraintes pour la table `t_customer_academy_teacher_remember`
--
ALTER TABLE `t_customer_academy_teacher_user_remember`  ADD CONSTRAINT `customer_academy_teacher_user_remember_fk0` FOREIGN KEY (`user_id`) REFERENCES `t_customer_academy_teacher_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Structure de la table `t_customer_academy_teacher_user_forgot_password`
--

CREATE TABLE IF NOT EXISTS `t_customer_academy_teacher_user_forgot_password` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `password` varchar(40) COLLATE utf8_bin NOT NULL,
  `key` varchar(40) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

ALTER TABLE `t_customer_academy_teacher_user_forgot_password`  ADD CONSTRAINT `customer_academy_teacher_user_forgot_password_fk0` FOREIGN KEY (`user_id`) REFERENCES `t_customer_academy_teacher_user` (`id`) ON DELETE CASCADE;


--
-- Contraintes pour la table `t_customer_academy_teacher_user_validation_token`
--
CREATE TABLE IF NOT EXISTS `t_customer_academy_teacher_user_validation_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,   
  `user_id` int(11) unsigned NOT NULL,
  `token` varchar(64) COLLATE utf8_bin NOT NULL,
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contraintes pour la table `t_customer_academy_teacher_validation_token`
--
ALTER TABLE `t_customer_academy_teacher_user_validation_token` ADD CONSTRAINT `customer_academy_teacher_user_validation_token_fk0` FOREIGN KEY (`user_id`) REFERENCES `t_customer_academy_teacher_user` (`id`) ON DELETE CASCADE;



CREATE TABLE IF NOT EXISTS `t_customer_academy_course_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `url` varchar(255) DEFAULT "", 
  `title` varchar(255) DEFAULT "", 
  `short_description` varchar(512) DEFAULT "",   
  `content` TEXT DEFAULT "",  
  `reference` varchar(32) DEFAULT "" ,
  `price` decimal(8,2) NOT NULL DEFAULT 0.0,
  `teacher_user_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `level_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `number_of_views` int(8) UNSIGNED DEFAULT 0,
  `number_of_documents` int(8) UNSIGNED DEFAULT 0,
  `ranking` int(11) UNSIGNED DEFAULT 0 ,
  `is_validated` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO', 
  `published_at` datetime  NULL DEFAULT NULL, 
  `refused_at` datetime  NULL DEFAULT NULL, 
  `expired_at` datetime NULL DEFAULT NULL,
  `committed_at` DATETIME NULL DEFAULT NULL ,
  `state` ENUM('UPLOAD') NULL DEFAULT NULL ,  
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_customer_academy_course_i18n` ADD CONSTRAINT `customer_academy_course_i18n_fk0` FOREIGN KEY (`teacher_user_id`) REFERENCES `t_customer_academy_teacher_user` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_customer_academy_level` (
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


CREATE TABLE IF NOT EXISTS `t_customer_academy_level_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `title` varchar(255) DEFAULT "", 
  `level_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
   PRIMARY KEY (`id`)   ,  
   UNIQUE KEY `unique` (`level_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_customer_academy_level_i18n` ADD CONSTRAINT `customer_academy_level_fk0` FOREIGN KEY (`level_id`) REFERENCES `t_customer_academy_level` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_customer_course_category_course` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_i18n_id` int(11) unsigned DEFAULT NULL,
  `category_id` int(11) unsigned DEFAULT NULL,
  `position` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_customer_course_category_course` ADD CONSTRAINT `customer_course_category_course_fk0` FOREIGN KEY (`course_i18n_id`) REFERENCES `t_customer_academy_course_i18n` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_customer_course_category_course` ADD CONSTRAINT `customer_course_category_course_fk1` FOREIGN KEY (`category_id`) REFERENCES `t_customer_course_category` (`id`) ON DELETE CASCADE;


--
-- Structure de la table `t_customer_course_document`
--

CREATE TABLE IF NOT EXISTS `t_customer_course_document` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `file` varchar(128) COLLATE utf8_bin NOT NULL,
  `extension` varchar(10) COLLATE utf8_bin NOT NULL,
  `course_i18n_id` int(11) UNSIGNED NOT NULL,
  `teacher_user_id` INT(11) UNSIGNED NOT NULL ,
  `filesize` int(11) unsigned DEFAULT NULL,  
  `is_public` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'Y',
  `position` INT(11) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL  DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_customer_course_document` ADD CONSTRAINT `customer_course_document_fk0` FOREIGN KEY (`course_i18n_id`) REFERENCES `t_customer_academy_course_i18n`  (`id`) ON DELETE CASCADE;

-- Structure de la table `t_customer_academy_contact`

CREATE TABLE IF NOT EXISTS `t_customer_academy_contact` (
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
 `subject` varchar(255) COLLATE utf8_bin NOT NULL,
 `message` varchar(512) COLLATE utf8_bin NOT NULL,
 `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
 `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE IF NOT EXISTS `t_customer_academy_topic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(32) DEFAULT "",     
  `icon` varchar(24) DEFAULT "",
  `color` varchar(10) DEFAULT "",    
  `awe` varchar(10) DEFAULT "",    
  `position` int(11) NOT NULL, 
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `t_customer_academy_topic_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `title` varchar(255) DEFAULT "", 
  `topic_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
   PRIMARY KEY (`id`)   ,  
   UNIQUE KEY `unique` (`topic_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_customer_academy_topic_i18n` ADD CONSTRAINT `customer_academy_topic_fk0` FOREIGN KEY (`topic_id`) REFERENCES `t_customer_academy_topic` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_customer_academy_software` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(32) DEFAULT "",     
  `icon` varchar(24) DEFAULT "",
  `color` varchar(10) DEFAULT "",    
  `awe` varchar(10) DEFAULT "",    
  `position` int(11) NOT NULL, 
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `t_customer_academy_software_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `title` varchar(255) DEFAULT "", 
  `software_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
   PRIMARY KEY (`id`)   ,  
   UNIQUE KEY `unique` (`software_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_customer_academy_software_i18n` ADD CONSTRAINT `customer_academy_software_fk0` FOREIGN KEY (`software_id`) REFERENCES `t_customer_academy_software` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_customer_academy_course_popular` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,  
  `course_i18n_id` int(11) unsigned DEFAULT NULL,  
  `student_user_id` int(11) UNSIGNED NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `ip` varchar(16) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;
