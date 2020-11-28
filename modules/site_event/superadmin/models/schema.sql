CREATE TABLE IF NOT EXISTS `t_site_event` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `reference` varchar(32) COLLATE utf8_bin DEFAULT '',
  `city` varchar(128) COLLATE utf8_bin NOT NULL,
  `city_id` int(11) UNSIGNED DEFAULT NULL,
  `place_id` int(11) UNSIGNED DEFAULT NULL,
  `event_user_id` int(11) UNSIGNED DEFAULT NULL,
  `country` varchar(2) COLLATE utf8_bin NOT NULL,
  `picture` varchar(64) COLLATE utf8_bin NOT NULL,
  `number_of_people` int(11) UNSIGNED DEFAULT NULL,
  `quantity` int(11) UNSIGNED DEFAULT NULL,
  `number_of_documents` int(11) UNSIGNED NOT NULL,
  `in_at` date DEFAULT NULL,
  `out_at` date DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `duration` int(11) UNSIGNED NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL,
  `state` enum('UPLOAD','DRAFT','REFUSED','COMMITTED','PUSHISHED') COLLATE utf8_bin NOT NULL DEFAULT 'DRAFT',
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `published_at` datetime DEFAULT NULL,
  `committed_at` datetime DEFAULT NULL,
  `refused_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE IF NOT EXISTS `t_site_event_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT, 
  `lang` varchar(2) DEFAULT "", 
  `url` varchar(255) DEFAULT "", 
  `title` varchar(255) DEFAULT "", 
  `meta_title` varchar(255) DEFAULT "", 
  `meta_description` varchar(512) DEFAULT "",   
  `short_description` varchar(512) DEFAULT "",   
  `content` TEXT DEFAULT "",
  `event_id` int(11) unsigned DEFAULT NULL, 
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
   PRIMARY KEY (`id`),  
   UNIQUE KEY `unique` (`event_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_site_event_i18n` ADD CONSTRAINT `site_event_i18n_fk0` FOREIGN KEY (`event_id`) REFERENCES `t_site_event` (`id`) ON DELETE CASCADE;



CREATE TABLE IF NOT EXISTS `t_site_event_speaker_user` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,  
  `gender` enum('Mr','Ms','Mrs') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `firstname` varchar(48) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lastname` varchar(48) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,  
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, 
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fax` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `web` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `address1` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `address2` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `postcode` char(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `city` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `state` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `city_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `country` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,   
  `function_id` int(11) UNSIGNED  NULL DEFAULT NULL,
  `function` varchar(40)  COLLATE utf8_bin NOT NULL, 
  `is_active` enum('YES','NO')  COLLATE utf8_bin NOT NULL,   
  `status` ENUM('ACTIVE','DELETE') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
  PRIMARY KEY (`id`),
  UNIQUE KEY `speaker_user_k0` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;



CREATE TABLE IF NOT EXISTS `t_site_event_speaker_users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,    
  `event_id` int(11) UNSIGNED  NULL DEFAULT NULL,
  `speaker_user_id` int(11) UNSIGNED  NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;




CREATE TABLE IF NOT EXISTS `t_site_event_place` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,    
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,  
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, 
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fax` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `web` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `address1` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `address2` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `postcode` char(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `city` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `city_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `country` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,     
  `is_active` enum('YES','NO')  COLLATE utf8_bin NOT NULL,   
  `status` ENUM('ACTIVE','DELETE') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;




CREATE TABLE IF NOT EXISTS `t_site_event_user` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(48) DEFAULT "",  
  `instagram_user` varchar(24) DEFAULT "",
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
  `state` varchar(20) COLLATE utf8_bin NOT NULL,
  `city_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `country` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,  
  `function_id` int(11) UNSIGNED  NULL DEFAULT NULL,
  `function` varchar(40)  COLLATE utf8_bin NOT NULL,
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
  UNIQUE KEY `site_event_user_u0` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

--
-- Structure de la table `t_site_event_session`
--

CREATE TABLE IF NOT EXISTS `t_site_event_user_session` (
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
-- Contraintes pour la table `t_site_event_session`
--
ALTER TABLE `t_site_event_user_session`   ADD CONSTRAINT `site_event_user_session_fk0` FOREIGN KEY (`user_id`) REFERENCES `t_site_event_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Structure de la table `t_site_event_user_remember`
--

CREATE TABLE IF NOT EXISTS `t_site_event_user_remember` (
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
-- Contraintes pour la table `t_site_event_remember`
--
ALTER TABLE `t_site_event_user_remember`  ADD CONSTRAINT `site_event_user_remember_fk0` FOREIGN KEY (`user_id`) REFERENCES `t_site_event_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Structure de la table `t_site_event_user_forgot_password`
--

CREATE TABLE IF NOT EXISTS `t_site_event_user_forgot_password` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `password` varchar(40) COLLATE utf8_bin NOT NULL,
  `key` varchar(40) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

ALTER TABLE `t_site_event_user_forgot_password`  ADD CONSTRAINT `site_event_user_forgot_password_fk0` FOREIGN KEY (`user_id`) REFERENCES `t_site_event_user` (`id`) ON DELETE CASCADE;


--
-- Contraintes pour la table `t_site_event_user_validation_token`
--
CREATE TABLE IF NOT EXISTS `t_site_event_user_validation_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,   
  `user_id` int(11) unsigned NOT NULL,
  `token` varchar(64) COLLATE utf8_bin NOT NULL,
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contraintes pour la table `t_site_event_validation_token`
--
ALTER TABLE `t_site_event_user_validation_token` ADD CONSTRAINT `site_event_user_validation_token_fk0` FOREIGN KEY (`user_id`) REFERENCES `t_site_event_user` (`id`) ON DELETE CASCADE;



--
-- Structure de la table `t_site_event_document`
--

CREATE TABLE IF NOT EXISTS `t_site_event_document` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `file` varchar(128) COLLATE utf8_bin NOT NULL,
  `extension` varchar(10) COLLATE utf8_bin NOT NULL,
  `event_id` int(11) UNSIGNED NOT NULL,
  `filesize` int(11) unsigned DEFAULT NULL,  
  `is_public` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'Y',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL  DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_site_event_document` ADD CONSTRAINT `site_event_document_fk0` FOREIGN KEY (`event_id`) REFERENCES `t_site_event`  (`id`) ON DELETE CASCADE;




CREATE TABLE IF NOT EXISTS `t_site_event_seller_commission` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(48) COLLATE utf8_bin NOT NULL, 
  `start_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,  
   `number_of_rates` int(11)  UNSIGNED  NOT NULL DEFAULT 0,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE IF NOT EXISTS `t_site_event_seller_commission_rate` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `commission_id`  int(11)  UNSIGNED  NOT NULL,
  `from` decimal(10,2) NOT NULL,
  `to` decimal(10,2) NOT NULL,
  `fix` decimal(10,2) NOT NULL,
  `rate` decimal(3,2) NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `start_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_site_event_seller_commission_rate` ADD CONSTRAINT `site_event_seller_commission_rate_fk0` FOREIGN KEY (`commission_id`) REFERENCES `t_site_event_seller_commission` (`id`) ON DELETE CASCADE;


