
--
-- Structure de la table `t_users_profession`  
--
CREATE TABLE IF NOT EXISTS `t_users_profession` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,            
        `name` varchar(64)  NOT NULL,            
        `system` varchar(64)  NOT NULL,   
        `method` varchar(24)  NOT NULL,   
        `has_title` ENUM( 'NO', 'YES' ) NOT NULL DEFAULT 'NO' , 
        `position` int(11) NOT NULL,         
     PRIMARY KEY (`id`)      
) ENGINE=InnoDB DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;

--
-- Structure de la table `t_users_profession_i18n`  
--
CREATE TABLE IF NOT EXISTS `t_users_profession_i18n` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `profession_id` int(11) unsigned NOT NULL,
        `lang` varchar(2)  NOT NULL,             
        `value` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,  
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp  NULL ,   
     PRIMARY KEY (`id`)   ,  
     UNIQUE KEY `unique` (`profession_id`,`lang`)   
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `t_users_profession_i18n` ADD CONSTRAINT `users_profession_fk0` FOREIGN KEY (`profession_id`) REFERENCES `t_users_profession` (`id`) ON DELETE CASCADE;



--
-- Structure de la table `t_users_speciality`  
--
CREATE TABLE IF NOT EXISTS `t_users_speciality` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,            
        `name` varchar(64)  NOT NULL,            
        `system` varchar(64)  NOT NULL, 
        `position` int(11) NOT NULL,             
     PRIMARY KEY (`id`)      
) ENGINE=InnoDB DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;

--
-- Structure de la table `t_users_speciality_i18n`  
--
CREATE TABLE IF NOT EXISTS `t_users_speciality_i18n` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `speciality_id` int(11) unsigned NOT NULL,
        `lang` varchar(2)  NOT NULL,             
        `value` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,  
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp  NULL DEFAULT NULL,   
     PRIMARY KEY (`id`)   ,  
     UNIQUE KEY `unique` (`speciality_id`,`lang`)   
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `t_users_speciality_i18n` ADD CONSTRAINT `users_speciality_fk0` FOREIGN KEY (`speciality_id`) REFERENCES `t_users_speciality` (`id`) ON DELETE CASCADE;

--
-- Structure de la table `t_users`
--

CREATE TABLE IF NOT EXISTS `t_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_bin NOT NULL,
  `password` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `sex` enum('Mr','Ms','Mrs') DEFAULT NULL,
  `firstname` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `lastname` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `picture` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `phone` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `mobile` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `fax` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `birthday` date DEFAULT NULL, 
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_guess` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_password_gen` timestamp  NULL DEFAULT '0000-00-00 00:00:00',
  `lastlogin` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `accept_newsletter` ENUM( "YES", "NO" ) DEFAULT "NO" NOT NULL, 
  `physician_number` varchar(255) NULL DEFAULT NULL,  
  `profession_id` int(11)  unsigned NULL DEFAULT NULL,
  `specialty_id` int(11)  unsigned NULL DEFAULT NULL,
  `sponsor_id` int(11)  unsigned NULL DEFAULT NULL,
  `content_group_id` int(11) unsigned NULL DEFAULT NULL,
  `website` varchar(255) NULL DEFAULT NULL,
  `email_tosend` ENUM( "YES", "NO" ) DEFAULT "NO" NOT NULL,   
  `application` enum('admin','frontend','superadmin') COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),  
  UNIQUE KEY `username` (`username`,`application`),
  UNIQUE KEY `email` (`email`,`application`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_users` ADD CONSTRAINT `users_fk0` FOREIGN KEY (`profession_id`) REFERENCES `t_users_profession` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_users` ADD CONSTRAINT `users_fk1` FOREIGN KEY (`specialty_id`) REFERENCES `t_users_speciality` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_users` ADD CONSTRAINT `users_fk2` FOREIGN KEY (`content_group_id`) REFERENCES `t_content_groups` (`id`) ON DELETE CASCADE;
--
-- Structure de la table `t_users_forgot_password`
--

CREATE TABLE IF NOT EXISTS `t_users_forgot_password` (
  `user_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` varchar(32) COLLATE utf8_bin NOT NULL,
  `key` varchar(40) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `key` (`key`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contraintes pour la table `t_customers_forgot_password`
--
ALTER TABLE `t_users_forgot_password` ADD CONSTRAINT `users_2` FOREIGN KEY (`user_id`) REFERENCES `t_users` (`id`) ON DELETE CASCADE;


