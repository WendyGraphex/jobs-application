--
-- Structure de la table `t_employee_work`
-- 
CREATE TABLE IF NOT EXISTS `t_employee_work` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,    
        `reference` varchar(24)  NOT NULL,        
        `name` varchar(256)  NOT NULL,
        `abr` varchar(5)  NOT NULL,
        `color` varchar(16)  NOT NULL,
        `start_at` DATETIME  NULL DEFAULT NULL,
        `end_at` DATETIME  NULL DEFAULT NULL,
        `number_of_tasks` int(11) UNSIGNED NOT NULL,
        `estimated_duration` int(11) unsigned NOT NULL,
        `duration` int(11) unsigned NOT NULL,
        `logo` varchar(64) NOT NULL,
        `description` TEXT NOT NULL,
        `parameters` varchar(256)  NOT NULL,
        `is_active` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
        `employer_user_id` int(11) unsigned NULL DEFAULT NULL,
        `employee_user_id` int(11) unsigned NULL DEFAULT NULL,
        `quotation_id`int(11) unsigned NULL DEFAULT NULL,
        `project_id` int(11) unsigned NULL DEFAULT NULL,
        `state_id` int(11) unsigned NULL DEFAULT NULL,
        `status` enum('ACTIVE','DELETE','CLOSE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp  NULL DEFAULT NULL,       
     PRIMARY KEY (`id`)      
) ENGINE=InnoDB DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;


ALTER TABLE `t_employee_work` ADD CONSTRAINT `employee_work_fk0` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_work` ADD CONSTRAINT `employee_work_fk1` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_work` ADD CONSTRAINT `employee_work_fk2` FOREIGN KEY (`quotation_id`) REFERENCES `t_sale_employee_quotation` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_work` ADD CONSTRAINT `employee_work_fk3` FOREIGN KEY (`project_id`) REFERENCES `t_employer_project` (`id`) ON DELETE CASCADE;
