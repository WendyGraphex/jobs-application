--
-- Structure de la table `t_payment_employee_user`  
--
CREATE TABLE IF NOT EXISTS `t_payment_employee_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,    
  `employee_user_id` int(11) unsigned NOT NULL, 
  `method_id` int(11) unsigned   NULL DEFAULT NULL,  
  `currency_id` int(11) unsigned   NULL DEFAULT NULL,  
  `currency` varchar(3)  NOT NULL, 
  `total_price_with_tax` decimal(10,3) DEFAULT '0.0',
  `payment_price_with_tax` decimal(10,3) DEFAULT '0.0',  
  `order_total_price_with_tax` decimal(10,3) DEFAULT '0.0', 
  `ip` varchar(40)  NOT NULL, 
  `reference` varchar(24) NOT NULL,
  `authorization` varchar(128) NOT NULL,
  `transaction_time` varchar(40)  NOT NULL, 
  `transaction_reference` varchar(40)  NOT NULL, 
  `transaction_fee` decimal(10,3) NOT NULL,
  `transaction_fee_currency` varchar(3) COLLATE utf8_bin NOT NULL,
  `options` varchar(128) NOT NULL,
  `state` ENUM('TOVALID','ACCEPTED','REFUSED','CANCELLED','INPROGRESS') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'INPROGRESS',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,  
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_payment_employee_user` ADD CONSTRAINT `payment_employee_user_fk0` FOREIGN KEY (`method_id`) REFERENCES `t_payment_method` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_payment_employee_user` ADD CONSTRAINT `payment_employee_user_fk1` FOREIGN KEY (`employee_user_id`) REFERENCES `t_employee_user` (`id`) ON DELETE CASCADE;
--
-- Structure de la table `t_payment_employee_method`  
--
CREATE TABLE IF NOT EXISTS `t_payment_employee_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,      
  `method_id` int(11) unsigned NOT NULL, 
  `position` int(8) unsigned NOT NULL,  
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',     
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,  
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_payment_employee_method` ADD CONSTRAINT `payment_employee_method_fk0` FOREIGN KEY (`method_id`) REFERENCES `t_payment_method` (`id`) ON DELETE CASCADE;



--
-- Structure de la table `t_payment_employee_settings`  
--
CREATE TABLE IF NOT EXISTS `t_payment_employee_user_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,    
  `employee_user_id` int(11) unsigned NOT NULL, 
  `method_id` int(11) unsigned   NULL DEFAULT NULL,      
  `parameters` varchar(128) NOT NULL,
  `options` varchar(128) NOT NULL,
  `is_default` ENUM('YES','NO') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,  
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;
