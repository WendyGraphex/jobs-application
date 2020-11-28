CREATE TABLE IF NOT EXISTS `t_employer_alert` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,     
  `employee_user_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employer_user_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employee_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employer_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employee_advert_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employer_advert_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `employee_advert_lang` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `employer_advert_lang` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

