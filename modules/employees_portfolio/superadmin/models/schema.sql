--
-- Structure de la table `t_employee_portfolio_document`
--

CREATE TABLE IF NOT EXISTS `t_employee_portfolio_document` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `file` varchar(32) COLLATE utf8_bin NOT NULL,
  `extension` varchar(10) COLLATE utf8_bin NOT NULL,   
  `filesize` int(11) unsigned DEFAULT NULL,  
  `employee_user_id` int(11) UNSIGNED NOT NULL,
  `position` INT(11) UNSIGNED NOT NULL,
  `is_public` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'Y', 
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_employee_portfolio_document` ADD CONSTRAINT `employee_portfolio_document_fk0` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;

CREATE TABLE `t_employee_portfolio_document_i18n` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
 `document_id` int(11) UNSIGNED NOT NULL,
 `lang` varchar(2) COLLATE utf8_bin NOT NULL,
 `title` varchar(15) COLLATE utf8_bin NOT NULL,
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_employee_portfolio_document_i18n` ADD CONSTRAINT `employee_portfolio_document_i18n_fk0` FOREIGN KEY (`document_id`) REFERENCES `t_employee_portfolio_document` (`id`) ON DELETE CASCADE;

