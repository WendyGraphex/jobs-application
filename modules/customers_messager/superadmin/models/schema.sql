-- Structure de la table `t_customer_message`

CREATE TABLE IF NOT EXISTS `t_customer_message` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
 `employee_user_id` int(11) UNSIGNED NULL DEFAULT NULL,
 `employer_user_id` int(11) UNSIGNED NULL DEFAULT NULL,
 `user_id` int(11) NULL,
 `parent_id` int(11) UNSIGNED NULL DEFAULT NULL,
 `sender` enum('EMPLOYEE', 'EMPLOYER', 'ADMIN') NULL DEFAULT NULL,	
 `subject` varchar(128) COLLATE utf8_bin NOT NULL, 
 `message` varchar(512) COLLATE utf8_bin NOT NULL, 
 `number_of_files` INT(8) UNSIGNED NOT NULL DEFAULT 0,
 `employer_deleted_at` timestamp NULL DEFAULT NULL,
 `employee_deleted_at` timestamp NULL DEFAULT NULL,
 `deleted_at` timestamp NULL DEFAULT NULL,
 `read_at` timestamp NULL DEFAULT NULL,
 `state` ENUM('SENT')  DEFAULT NULL,
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_customer_message` ADD CONSTRAINT `customer_messager_fk0` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_customer_message` ADD CONSTRAINT `customer_messager_fk1` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_customer_message` ADD CONSTRAINT `customer_messager_fk2` FOREIGN KEY (`user_id`) REFERENCES `t_users` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_customer_message_file` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,  
 `file` varchar(128) COLLATE utf8_bin NOT NULL, 
 `extension` varchar(10) COLLATE utf8_bin NOT NULL, 
 `size` int(11) UNSIGNED NULL DEFAULT '0', 
 `message_id` int(11) UNSIGNED NULL DEFAULT NULL, 
 `status` ENUM('ACTIVE','DELETE') NOT NULL DEFAULT 'ACTIVE',
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


ALTER TABLE `t_customer_message_file` ADD CONSTRAINT `customer_messager_file_fk0` FOREIGN KEY (`message_id`) REFERENCES `t_customer_message` (`id`) ON DELETE CASCADE;