CREATE TABLE IF NOT EXISTS `t_customer_user_advert_i18n_notation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT, 
  `employee_user_id` int(11) UNSIGNED  NULL DEFAULT NULL,
  `employer_user_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employee_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employer_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employer_criteria_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employee_criteria_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employee_advert_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employee_advert_lang` varchar(2) DEFAULT "", 
  `employer_advert_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employer_advert_lang` varchar(2) DEFAULT "", 
  `work_id` int(11) UNSIGNED NOT NULL, 
  `notation` int(11) unsigned NOT NULL DEFAULT 0, 
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NULL DEFAULT NULL,   
PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


--ALTER TABLE `t_employer_user_advert_i18n_notation` ADD CONSTRAINT `employer_user_advert_i18n_notation_fk0` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
--ALTER TABLE `t_employer_user_advert_i18n_notation` ADD CONSTRAINT `employer_user_advert_i18n_notation_fk1` FOREIGN KEY (`criteria_id`) REFERENCES `t_employer_notation_criteria` (`id`) ON DELETE CASCADE;
--ALTER TABLE `t_employer_user_advert_i18n_notation` ADD CONSTRAINT `employer_user_advert_i18n_notation_fk2` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
--ALTER TABLE `t_employer_user_advert_i18n_notation` ADD CONSTRAINT `employer_user_advert_i18n_notation_fk2` FOREIGN KEY (`advert_id`) REFERENCES `t_employer_advert` (`id`) ON DELETE CASCADE;