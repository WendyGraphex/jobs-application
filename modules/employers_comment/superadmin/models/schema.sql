-- Structure de la table `t_customer_comment`

CREATE TABLE IF NOT EXISTS `t_employer_advert_comment` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,  
 `advert_lang` varchar(2) COLLATE utf8_bin NOT NULL,
 `employee_user_id` int(11) UNSIGNED NULL,
 `employer_user_id` int(11) UNSIGNED NULL, 
 `advert_id` int(11) UNSIGNED NULL,   
 `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_employer_advert_comment` ADD CONSTRAINT `employer_advert_comment_fk0` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employer_advert_comment` ADD CONSTRAINT `employer_advert_comment_fk1` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employer_advert_comment` ADD CONSTRAINT `employer_advert_comment_fk2` FOREIGN KEY (`advert_id`) REFERENCES `t_employer_advert` (`id`) ON DELETE CASCADE;


-- Structure de la table `t_customer_comment_i18n`

CREATE TABLE IF NOT EXISTS `t_employer_advert_comment_i18n` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, 
 `lang` varchar(2) COLLATE utf8_bin NOT NULL,  
 `comment_id` int(11) UNSIGNED NULL, 
 `message` varchar(512) COLLATE utf8_bin NOT NULL,  
 `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


ALTER TABLE `t_employer_advert_comment_i18n` ADD CONSTRAINT `employer_advert_comment_i18n_fk0` FOREIGN KEY (`comment_id`) REFERENCES `t_employer_advert_comment` (`id`) ON DELETE CASCADE;
