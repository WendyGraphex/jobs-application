
CREATE TABLE IF NOT EXISTS `t_employee_advert_i18n_share` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` varchar(48) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lastname` varchar(48) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, 
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,  
  `advert_i18n_id` int(11) unsigned DEFAULT NULL,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `message` varchar(512) COLLATE utf8_bin NOT NULL, 
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_employee_advert_i18n_share` ADD CONSTRAINT `employee_advert_share_fk0` FOREIGN KEY (`advert_i18n_id`) REFERENCES `t_employee_advert_i18n` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_advert_i18n_share` ADD CONSTRAINT `employee_advert_share_fk1` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_advert_i18n_share` ADD CONSTRAINT `employee_advert_share_fk2` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_employee_advert_i18n_abuse` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` varchar(48) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lastname` varchar(48) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, 
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,  
  `advert_i18n_id` int(11) unsigned DEFAULT NULL,
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,
  `type_id` int(11) unsigned DEFAULT NULL,
  `message` varchar(512) COLLATE utf8_bin NOT NULL, 
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_employee_advert_i18n_abuse` ADD CONSTRAINT `employee_advert_abuse_fk0` FOREIGN KEY (`advert_i18n_id`) REFERENCES `t_employee_advert_i18n` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_advert_i18n_abuse` ADD CONSTRAINT `employee_advert_abuse_fk1` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_advert_i18n_abuse` ADD CONSTRAINT `employee_advert_abuse_fk2` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
-- ALTER TABLE `t_employee_advert_i18n_abuse` ADD CONSTRAINT `employee_advert_abuse_fk3` FOREIGN KEY (`type_id`) REFERENCES `t_customer_abuse_type` (`id`) ON DELETE CASCADE;

