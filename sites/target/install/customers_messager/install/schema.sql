-- Structure de la table `t_customer_message`

CREATE TABLE IF NOT EXISTS `t_customer_message` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
 `employee_user_id` int(11) UNSIGNED NULL DEFAULT NULL,
 `employer_user_id` int(11) UNSIGNED NULL DEFAULT NULL,
 `user_id` int(11) NULL,
 `direction` ENUM('FROM','TO') DEFAULT 'FROM' , 
 `message` varchar(512) COLLATE utf8_bin NOT NULL, 
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_customer_message` ADD CONSTRAINT `customer_messager_fk0` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_customer_message` ADD CONSTRAINT `customer_messager_fk1` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_customer_message` ADD CONSTRAINT `customer_messager_fk2` FOREIGN KEY (`user_id`) REFERENCES `t_users` (`id`) ON DELETE CASCADE;
