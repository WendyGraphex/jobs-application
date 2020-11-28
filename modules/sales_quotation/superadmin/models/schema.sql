--
-- Structure de la table `t_employer_quotation_request`
--

CREATE TABLE IF NOT EXISTS `t_employer_quotation_request` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
   `reference` VARCHAR(24) NOT NULL,
    `advert_id` int(11) unsigned DEFAULT NULL, 
    `lang` varchar(2) DEFAULT "", 
    `employee_user_id` int(11) unsigned DEFAULT NULL,
    `employer_user_id` int(11) unsigned DEFAULT NULL,   
   `description` TEXT DEFAULT "", 
`number_of_projects` int(8) unsigned DEFAULT 0,
`number_of_quotations` int(8) unsigned DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;


ALTER TABLE `t_employer_quotation_request` ADD CONSTRAINT `employer_quotation_request_fk0` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employer_quotation_request` ADD CONSTRAINT `employer_quotation_request_fk1` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employer_quotation_request` ADD CONSTRAINT `employer_quotation_request_fk2` FOREIGN KEY (`advert_id`) REFERENCES `t_employee_advert` (`id`) ON DELETE CASCADE;



CREATE TABLE IF NOT EXISTS `t_employer_quotation_project_request` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `advert_id` int(11) unsigned DEFAULT NULL, 
    `quotation_id` int(11) unsigned DEFAULT NULL,
    `employee_user_id` int(11) unsigned DEFAULT NULL,
    `employer_user_id` int(11) unsigned DEFAULT NULL, 
    `project_id` int(11) unsigned DEFAULT NULL, 
    `request_id` int(11) unsigned DEFAULT NULL,
 `quoted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

ALTER TABLE `t_employer_quotation_project_request` ADD CONSTRAINT `employer_quotation_project_request_fk0` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employer_quotation_project_request` ADD CONSTRAINT `employer_quotation_project_request_fk1` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employer_quotation_project_request` ADD CONSTRAINT `employer_quotation_project_request_fk2` FOREIGN KEY (`request_id`) REFERENCES `t_employer_quotation_request` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employer_quotation_project_request` ADD CONSTRAINT `employer_quotation_project_request_fk3` FOREIGN KEY (`project_id`) REFERENCES `t_employer_project` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_sales_quotation_state` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT "",     
  `icon` varchar(24) DEFAULT "",
  `color` varchar(10) DEFAULT "",    
  `awe` varchar(10) DEFAULT "",    
  `position` int(11) NOT NULL, 
   `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `t_sales_quotation_state_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(2) DEFAULT "", 
  `title` varchar(255) DEFAULT "", 
  `state_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
   PRIMARY KEY (`id`)   ,  
   UNIQUE KEY `unique` (`state_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_sales_quotation_state_i18n` ADD CONSTRAINT `sales_quotation_state_fk0` FOREIGN KEY (`state_id`) REFERENCES `t_sales_quotation_state` (`id`) ON DELETE CASCADE;


--
-- Structure de la table `t_sale_employee_quotation`
--

CREATE TABLE IF NOT EXISTS `t_sale_employee_quotation` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_advert_id` int(11) unsigned DEFAULT NULL, 
  `employer_advert_id` int(11) unsigned DEFAULT NULL, 
  `project_id` int(11) unsigned DEFAULT NULL, 
  `reference` varchar(48) DEFAULT "",   
  `employee_advert_lang` varchar(2) DEFAULT "", 
  `employer_advert_lang` varchar(2) DEFAULT "", 
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,    
  `price` decimal(8,3) NOT NULL DEFAULT 0.0,
  `in_at` DATE NULL DEFAULT NULL,
  `out_at`  DATE NULL DEFAULT NULL,
  `number_of_hours` int(11) unsigned NOT NULL DEFAULT 0,  
  `schedule_needed` ENUM('N','Y') NOT NULL,  
  `description` TEXT DEFAULT "", 
  `sender` enum('EMPLOYEE', 'EMPLOYER') NULL DEFAULT NULL,	
  `has_history` enum('Y', 'N') NOT NUL DEFAULT 'N',
  `version` int(8) unsigned DEFAULT 0, 
  `employee_state` ENUM('REFUSED','NEGOCIATED','ACCEPTED') DEFAULT NULL,
  `employee_stated_at` timestamp NULL DEFAULT NULL,
  `employer_state` ENUM('REFUSED','NEGOCIATED','ACCEPTED') DEFAULT NULL,
  `employer_stated_at` timestamp NULL DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `state` ENUM('REFUSED','ACCEPTED','INCART','PAID') NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;


ALTER TABLE `t_sale_employee_quotation` ADD CONSTRAINT `sale_employee_quotation_fk0` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_sale_employee_quotation` ADD CONSTRAINT `sale_employee_quotation_fk1` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_sale_employee_quotation` ADD CONSTRAINT `sale_employee_quotation_fk2` FOREIGN KEY (`employer_advert_id`) REFERENCES `t_employer_advert` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_sale_employee_quotation` ADD CONSTRAINT `sale_employee_quotation_fk3` FOREIGN KEY (`state_id`) REFERENCES `t_sales_quotation_state` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_sale_employee_quotation` ADD CONSTRAINT `sale_employee_quotation_fk4` FOREIGN KEY (`project_id`) REFERENCES `t_employer_project` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_sale_employee_quotation` ADD CONSTRAINT `sale_employee_quotation_fk5` FOREIGN KEY (`employee_advert_id`) REFERENCES `t_employee_advert` (`id`) ON DELETE CASCADE;

ALTER TABLE `t_employer_quotation_project_request` ADD CONSTRAINT `employer_quotation_project_request_fk4` FOREIGN KEY (`quotation_id`) REFERENCES `t_sale_employee_quotation` (`id`) ON DELETE CASCADE;


--
-- Structure de la table `t_sale_employee_quotation_history`
--

CREATE TABLE IF NOT EXISTS `t_sale_employee_quotation_history` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, 
  `quotation_id` int(11) unsigned DEFAULT NULL, 
  `employee_user_id` int(11) UNSIGNED DEFAULT NULL,
  `employer_user_id` int(11) UNSIGNED DEFAULT NULL,
  `price` decimal(8,3) NOT NULL DEFAULT '0.000',
  `in_at` date DEFAULT NULL,
  `out_at` date DEFAULT NULL,
  `number_of_hours` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `schedule_needed` enum('N','Y') NOT NULL,
  `description` text DEFAULT "",
  `sender` enum('EMPLOYEE', 'EMPLOYER') NULL DEFAULT NULL,
  `version` int(8) UNSIGNED DEFAULT '0',
  `employee_state` enum('PROPOSED','REFUSED','NEGOCIATED','ACCEPTED') NULL DEFAULT NULL,
  `employee_stated_at` timestamp NULL DEFAULT NULL,
  `employer_state` enum('REFUSED','NEGOCIATED','ACCEPTED') NULL DEFAULT NULL,
  `employer_stated_at` timestamp NULL DEFAULT NULL,
  `state` enum('REFUSED','ACCEPTED') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

ALTER TABLE `t_sale_employee_quotation_history` ADD CONSTRAINT `sale_employee_quotation_history_fk0` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_sale_employee_quotation_history` ADD CONSTRAINT `sale_employee_quotation_history_fk1` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_sale_employee_quotation_history` ADD CONSTRAINT `sale_employee_quotation_history_fk2` FOREIGN KEY (`quotation_id`) REFERENCES `t_sale_employee_quotation` (`id`) ON DELETE CASCADE;


--
-- Structure de la table `t_sale_employer_quotation_commission`
--

CREATE TABLE IF NOT EXISTS `t_sale_employer_quotation_commission` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) unsigned DEFAULT NULL, 
  `employer_user_id` int(11) unsigned DEFAULT NULL, 
  `company_id` int(11) unsigned DEFAULT NULL, 
  `tax_id` int(11) unsigned DEFAULT NULL, 
  `title` varchar(255) DEFAULT "",      
  `price` decimal(8,3) NOT NULL DEFAULT 0.0,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

ALTER TABLE `t_sale_employer_quotation_commission` ADD CONSTRAINT `sale_employer_quotation_commissiony_fk0` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_sale_employer_quotation_commission` ADD CONSTRAINT `sale_employer_quotation_commissiony_fk1` FOREIGN KEY (`quotation_id`) REFERENCES `t_sale_employee_quotation` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_sale_employer_quotation_commission` ADD CONSTRAINT `sale_employer_quotation_commissiony_fk2` FOREIGN KEY (`company_id`) REFERENCES `t_employer_company` (`id`) ON DELETE CASCADE;
--
-- Structure de la table `t_sale_employee_quotation_work`
--

CREATE TABLE IF NOT EXISTS `t_sale_employee_quotation_work` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) unsigned DEFAULT NULL, 
  `reference` varchar(48) DEFAULT "",   
  `lang` varchar(2) DEFAULT "", 
  `employee_user_id` int(11) unsigned DEFAULT NULL,
  `employer_user_id` int(11) unsigned DEFAULT NULL,    
  `price` decimal(8,3) NOT NULL DEFAULT 0.0,
  `description` TEXT DEFAULT "", 
  `in_at` DATE NULL DEFAULT NULL,
  `out_at` DATE NULL DEFAULT NULL,
   


  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;


ALTER TABLE `t_sale_employee_quotation_work` ADD CONSTRAINT `sale_employee_quotation_work_fk0` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_sale_employee_quotation_work` ADD CONSTRAINT `sale_employee_quotation_work_fk1` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_sale_employee_quotation_work` ADD CONSTRAINT `sale_employee_quotation_work_fk2` FOREIGN KEY (`quotation_id`) REFERENCES `t_sale_employee_quotation` (`id`) ON DELETE CASCADE;


