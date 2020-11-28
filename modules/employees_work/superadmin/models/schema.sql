--
-- Structure de la table `t_employee_work`
-- 
CREATE TABLE IF NOT EXISTS `t_employee_work` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,    
        `reference` varchar(24)  NOT NULL,        ``
        `name` varchar(256)  NOT NULL,
        `abr` varchar(5)  NOT NULL,
        `color` varchar(16)  NOT NULL,
        `start_at` DATETIME  NULL DEFAULT NULL,
        `end_at` DATETIME  NULL DEFAULT NULL,
        `iteration` int(8) unsigned NOT NULL DEFAULT 0,
        `number_of_payments` int(8) UNSIGNED NOT NULL,
        `number_of_hours` int(11) UNSIGNED NOT NULL,  
        `duration` int(11) unsigned NOT NULL,
        `logo` varchar(64) NOT NULL,
        `description` TEXT NOT NULL,       
        `employer_user_id` int(11) unsigned NULL DEFAULT NULL,
        `employee_user_id` int(11) unsigned NULL DEFAULT NULL,      
        `quotation_id`int(11) unsigned NULL DEFAULT NULL,
        `project_id` int(11) unsigned NULL DEFAULT NULL,  
        `order_id` int(11) unsigned NULL DEFAULT NULL ,     
        `state_id` int(11) unsigned NULL DEFAULT NULL,
        `total_price_without_tax` decimal(10,3) DEFAULT '0.0',          
        `total_price_with_tax` decimal(10,3) DEFAULT '0.0',   
        `total_paid_without_tax` decimal(10,3) DEFAULT '0.0',          
        `total_paid_with_tax` decimal(10,3) DEFAULT '0.0',    
        `total_unpaid_without_tax` decimal(10,3) DEFAULT '0.0',          
        `total_unpaid_with_tax` decimal(10,3) DEFAULT '0.0',       
        `state` ENUM('INPROGRESS','HOLD','PAID','CLOSE') CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp  NULL DEFAULT NULL,       
     PRIMARY KEY (`id`)      
) ENGINE=InnoDB DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;


ALTER TABLE `t_employee_work` ADD CONSTRAINT `employee_work_fk0` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_work` ADD CONSTRAINT `employee_work_fk1` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_work` ADD CONSTRAINT `employee_work_fk2` FOREIGN KEY (`quotation_id`) REFERENCES `t_sale_employee_quotation` (`id`) ON DELETE CASCADE;
--ALTER TABLE `t_employee_work` ADD CONSTRAINT `employee_work_fk3` FOREIGN KEY (`project_id`) REFERENCES `t_project` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_work` ADD CONSTRAINT `employee_work_fk4` FOREIGN KEY (`order_id`) REFERENCES `t_sale_order` (`id`) ON DELETE CASCADE;


--
-- Structure de la table `t_employee_work_payment_request`
-- 
CREATE TABLE IF NOT EXISTS `t_employee_work_payment_request` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT, 
        `dated_at` DATE NULL DEFAULT NULL, 
        `requested_at` DATETIME NULL DEFAULT NULL, 
        `reference` varchar(24)  NOT NULL,                
        `employer_user_id` int(11) unsigned NULL DEFAULT NULL,
        `employee_user_id` int(11) unsigned NULL DEFAULT NULL,
        `work_id`int(11) unsigned NULL DEFAULT NULL,  
        `quotation_id`int(11) unsigned NULL DEFAULT NULL,
        `project_id` int(11) unsigned NULL DEFAULT NULL,  
        `payment_id`int(11) unsigned NULL DEFAULT NULL,
        `iteration` int(8) unsigned NOT NULL DEFAULT 0,
        `total_price_without_tax` decimal(10,3) DEFAULT '0.0',          
        `total_price_with_tax` decimal(10,3) DEFAULT '0.0',         
        `sms_sent_at` DATETIME  NULL DEFAULT NULL,  
        `email_sent_at` DATETIME NULL DEFAULT NULL, 
        `accepted_at` DATETIME  NULL DEFAULT NULL,  
        `refused_at` DATETIME  NULL DEFAULT NULL,  
        `confirmed_at` DATETIME  NULL DEFAULT NULL, 
        `confirmed_by`int(11) NULL DEFAULT NULL,  
        `status` ENUM('PLANNED','ACTIVE','REFUSED','ACCEPTED','PAID') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'PLANNED',    
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp  NULL DEFAULT NULL,       
     PRIMARY KEY (`id`)      
) ENGINE=InnoDB DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;

ALTER TABLE `t_employee_work_payment_request` ADD CONSTRAINT `employee_work_payment_request_fk0` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_work_payment_request` ADD CONSTRAINT `employee_work_payment_request_fk1` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_work_payment_request` ADD CONSTRAINT `employee_work_payment_request_fk2` FOREIGN KEY (`work_id`) REFERENCES `t_employee_work` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_work_payment_request` ADD CONSTRAINT `employee_work_payment_request_fk3` FOREIGN KEY (`quotation_id`) REFERENCES `t_sale_employee_quotation` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employee_work_payment_request` ADD CONSTRAINT `employee_work_payment_request_fk4` FOREIGN KEY (`payment_id`) REFERENCES `t_payment_employee_user` (`id`) ON DELETE CASCADE;



