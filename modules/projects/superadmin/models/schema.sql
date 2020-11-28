--
-- Structure de la table `t_project`
-- 
CREATE TABLE IF NOT EXISTS `t_project` (
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
        `order_id` int(11) unsigned NULL DEFAULT NULL,
        `work_id` int(11) unsigned NULL DEFAULT NULL,
        `state_id` int(11) unsigned NULL DEFAULT NULL,
        `status` enum('ACTIVE','DELETE','CLOSE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp  NULL DEFAULT NULL,       
     PRIMARY KEY (`id`)      
) ENGINE=InnoDB DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;


ALTER TABLE `t_project` ADD CONSTRAINT `project_fk0` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_project` ADD CONSTRAINT `project_fk1` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_project` ADD CONSTRAINT `project_fk2` FOREIGN KEY (`quotation_id`) REFERENCES `t_sale_employee_quotation` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_project` ADD CONSTRAINT `project_fk3` FOREIGN KEY (`project_id`) REFERENCES `t_employer_project` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_project` ADD CONSTRAINT `project_fk4` FOREIGN KEY (`order_id`) REFERENCES `t_sale_order` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_project` ADD CONSTRAINT `project_fk5` FOREIGN KEY (`work_id`) REFERENCES `t_employee_work` (`id`) ON DELETE CASCADE;




CREATE TABLE IF NOT EXISTS `t_project_task_state` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,            
             `name` varchar(64)  NOT NULL,
             `color` varchar(16)  NOT NULL,
             `icon` varchar(64)  NOT NULL,           
     PRIMARY KEY (`id`)      
) ENGINE=InnoDB DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;

--
-- Structure de la table `t_project_task_state_i18n`  
--
CREATE TABLE IF NOT EXISTS `t_project_task_state_i18n` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `state_id` int(11) unsigned NOT NULL,
        `lang` varchar(2)  NOT NULL,             
        `value` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,  
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp NULL DEFAULT NULL,   
     PRIMARY KEY (`id`)   ,  
     UNIQUE KEY `unique` (`state_id`,`lang`)   
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `t_project_task_state_i18n` ADD CONSTRAINT `project_task_state_fk0` FOREIGN KEY (`state_id`) REFERENCES `t_project_task_state` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_project_task` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,  
        `project_id` int(11) unsigned NOT NULL,                
        `employee_user_id` int(11) unsigned NOT NULL,      
        `employer_user_id` int(11) unsigned NOT NULL,      
        `name` varchar(256)  NOT NULL,
        `reference` varchar(16)  NOT NULL,
        `requested_by` varchar(64)  NOT NULL,                  
        `start_at` DATETIME  NULL DEFAULT NULL,
        `end_at` DATETIME  NULL DEFAULT NULL,
        `requested_at` DATETIME  NULL DEFAULT NULL,
        `before_at` DATETIME NULL DEFAULT NULL 
        `total_duration` int(11) unsigned NOT NULL,
        `estimated_duration` int(11) unsigned NOT NULL,
        `description` TEXT NOT NULL,
        `priority` INT(11) UNSIGNED NULL,
        `color` varchar(10)  NOT NULL,
        `creator` ENUM('EMPLOYEE','EMPLOYER') NOT NULL,
        `is_active` enum('NO','YES') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
        `state_id` int(11) unsigned NULL DEFAULT NULL,
        `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',       
     PRIMARY KEY (`id`)      
) ENGINE=InnoDB DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;

ALTER TABLE `t_project_task` ADD CONSTRAINT `project_task_fk0` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_project_task` ADD CONSTRAINT `project_task_fk1` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_project_task` ADD CONSTRAINT `project_task_fk2` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
