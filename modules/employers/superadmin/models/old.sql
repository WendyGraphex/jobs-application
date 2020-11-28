



---TO CHECK --------------------------------------------------------------------------------------------


--
-- Structure de la table `t_employee_mission`
--

CREATE TABLE IF NOT EXISTS `t_employee_mission` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `lang` varchar(2) COLLATE utf8_bin NOT NULL,
  `employer_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employer_id` (`employer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

-- --------------------------------------------------------

--
-- Contraintes pour la table `t_employee_mission`
--
ALTER TABLE `t_employee_mission`
  ADD CONSTRAINT `employee_mission_fk0` FOREIGN KEY (`employer_id`) REFERENCES `t_employer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


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
  ADD CONSTRAINT `emloyee_mission_request_fk3` FOREIGN KEY (`employee_mission_id`) REFERENCES `t_employee_mission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emloyee_mission_request_fk4` FOREIGN KEY (`employee_id`) REFERENCES `t_employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emloyee_mission_request_fk5` FOREIGN KEY (`employer_id`) REFERENCES `t_employer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `t_employee_mission_comments`
  ADD CONSTRAINT `employee_mission_comments_fk1` FOREIGN KEY (`employee_mission_id`) REFERENCES `t_employee_mission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


  ALTER TABLE `t_emloyee_mission_request`
  ADD CONSTRAINT `emloyee_mission_request_fk0` FOREIGN KEY (`employee_mission_id`) REFERENCES `t_employee_mission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emloyee_mission_request_fk2` FOREIGN KEY (`employer_id`) REFERENCES `t_employer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


  ALTER TABLE `t_employee_mission_alert_search`
  ADD CONSTRAINT `employee_mission_alert_search_fk0` FOREIGN KEY (`employee_mission_id`) REFERENCES `t_employee_mission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


