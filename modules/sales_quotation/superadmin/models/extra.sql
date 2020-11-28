

--
-- Structure de la table `t_sales_employee_quotation_item`
--

CREATE TABLE IF NOT EXISTS `t_sale_employee_quotation_item` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reference` varchar(48) DEFAULT "",   
  `quotation_id` int(11) unsigned DEFAULT NULL,  
  `price` decimal(8,3) NOT NULL DEFAULT 0.0,
  `description` TEXT DEFAULT "", 
  `version` int(8) unsigned DEFAULT 0, 
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

ALTER TABLE `t_sale_employee_quotation` ADD CONSTRAINT `sale_employee_quotation_fk0` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_sale_employee_quotation` ADD CONSTRAINT `sale_employee_quotation_fk1` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_sale_employee_quotation` ADD CONSTRAINT `sale_employee_quotation_fk2` FOREIGN KEY (`advert_id`) REFERENCES `t_employee_advert` (`id`) ON DELETE CASCADE;




