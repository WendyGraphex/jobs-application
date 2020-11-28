--
-- Structure de la table `t_employee`
--

CREATE TABLE IF NOT EXISTS `t_employee` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
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
  `city` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `country` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `is_active` enum('YES','NO') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `is_validated` ENUM('NO','YES') NOT NULL DEFAULT 'NO',
  `is_completed` ENUM('NO','YES') NOT NULL DEFAULT 'NO',
  `is_activated` ENUM('NO','YES') NOT NULL DEFAULT 'NO' ,
  `status` ENUM('ACTIVE','DELETE') NOT NULL DEFAULT 'ACTIVE' ,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
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

ALTER TABLE `t_employee_session` ADD CONSTRAINT `employee_session_fk1` FOREIGN KEY (`user_id`) REFERENCES `t_employee` (`id`) ON DELETE CASCADE;


CREATE TABLE `t_employee_remember` (
 `id` int(11) UNSIGNED NOT NULL  AUTO_INCREMENT,
 `employee_id` int(11) UNSIGNED NOT NULL,
 `key` varchar(40) COLLATE utf8_bin NOT NULL,
 `ip` varchar(50) COLLATE utf8_bin NOT NULL,
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


ALTER TABLE `t_employee_remember` ADD CONSTRAINT `employee_remember_fk1` FOREIGN KEY (`employee_id`) REFERENCES `t_employee` (`id`) ON DELETE CASCADE;


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
ALTER TABLE `t_employee_forgot_password`   ADD CONSTRAINT `employee_forgot_password_fk0` FOREIGN KEY (`employee_id`) REFERENCES `t_employee` (`id`);


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
ALTER TABLE `t_employee_validation_token` ADD CONSTRAINT `employee_validation_token_fk0` FOREIGN KEY (`user_id`) REFERENCES `t_employee` (`id`) ON DELETE CASCADE;


------------> TO CHECK
--
-- Structure de la table `t_employee_mission_comments`
--

CREATE TABLE IF NOT EXISTS `t_employee_mission_comments` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) UNSIGNED NOT NULL,
  `employee_mission_id` int(11) UNSIGNED NOT NULL,
  `comments` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`,`employee_mission_id`),
  KEY `employee_mission_id` (`employee_mission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

-- --------------------------------------------------------

--
-- Contraintes pour la table `t_employee_mission_comments`
--
ALTER TABLE `t_employee_mission_comments`
  ADD CONSTRAINT `employee_mission_comments_fk0` FOREIGN KEY (`employee_id`) REFERENCES `t_employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Structure de la table `t_emloyee_mission_request`
--

CREATE TABLE IF NOT EXISTS `t_emloyee_mission_request` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_mission_id` int(11) UNSIGNED NOT NULL,
  `employee_id` int(11) UNSIGNED NOT NULL,
  `employer_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_mission_id` (`employee_mission_id`,`employee_id`,`employer_id`),
  KEY `employee_id` (`employee_id`),
  KEY `employer_id` (`employer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

-- --------------------------------------------------------

--
-- Contraintes pour la table `t_emloyee_mission_request`
--
ALTER TABLE `t_emloyee_mission_request`
  ADD CONSTRAINT `emloyee_mission_request_fk1` FOREIGN KEY (`employee_id`) REFERENCES `t_employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


--
-- Structure de la table `t_employee_mission_alert`
--

CREATE TABLE IF NOT EXISTS `t_employee_mission_alert` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

-- --------------------------------------------------------

--
-- Contraintes pour la table `t_employee_mission_alert`
--
ALTER TABLE `t_employee_mission_alert`
  ADD CONSTRAINT `employee_mission_alert_fk0` FOREIGN KEY (`employee_id`) REFERENCES `t_employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


--
-- Structure de la table `t_employee_mission_alert_search`
--

CREATE TABLE IF NOT EXISTS `t_employee_mission_alert_search` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_mission_id` int(11) UNSIGNED NOT NULL,
  `alert_id` int(11) UNSIGNED NOT NULL,
  `employee_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_mission_id` (`employee_mission_id`,`alert_id`,`employee_id`),
  KEY `alert_id` (`alert_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

-- --------------------------------------------------------

--
-- Contraintes pour la table `t_employee_mission_alert_search`
--
ALTER TABLE `t_employee_mission_alert_search`
  ADD CONSTRAINT `employee_mission_alert_search_fk1` FOREIGN KEY (`alert_id`) REFERENCES `t_employee_mission_alert` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_mission_alert_search_fk2` FOREIGN KEY (`employee_id`) REFERENCES `t_employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


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
 `message` varchar(255) COLLATE utf8_bin NOT NULL,
 `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
 `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updated_at` timestamp  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;