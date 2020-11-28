CREATE TABLE IF NOT EXISTS `t_customer_academy_teacher_user` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(48) DEFAULT "",  
  `instagram_user` varchar(24) DEFAULT "",
  `linkedin_user` varchar(24) DEFAULT "",
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
`state` varchar(20) COLLATE utf8_bin NOT NULL,
  `city` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `city_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `country` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,  
  `function_id` int(11) UNSIGNED  NULL DEFAULT NULL,
  `function` varchar(40)  COLLATE utf8_bin NOT NULL,
  `is_completed` ENUM('NO','YES') NOT NULL DEFAULT 'NO',
  `is_validated` ENUM('NO','YES') NOT NULL DEFAULT 'NO',
  `is_active` enum('YES','NO')  COLLATE utf8_bin NOT NULL,  
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
  `lat` decimal(20,13) NULL DEFAULT NULL,      
  `lng` decimal(20,13) NULL DEFAULT NULL, 
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

