--
-- Structure de la table `t_payment_debit_event_user`  
--
CREATE TABLE IF NOT EXISTS `t_payment_debit_event_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,    
  `event_user_id` int(11) unsigned NOT NULL, 
  `method_id` int(11) unsigned NOT NULL, 
  `order_id` int(11) unsigned NOT NULL, 
  `currency_id` int(11) unsigned NOT NULL, 
  `currency` varchar(3)  NOT NULL, 
  `total_price_with_tax` decimal(10,3) DEFAULT '0.0',
  `payment_price_with_tax` decimal(10,3) DEFAULT '0.0',  
  `order_total_price_with_tax` decimal(10,3) DEFAULT '0.0', 
  `ip` varchar(40)  NOT NULL, 
  `reference` varchar(24) NOT NULL,
  `authorization` varchar(128) COLLATE utf8_bin NOT NULL,
  `transaction_time` varchar(40) COLLATE utf8_bin NOT NULL,
  `transaction_reference` varchar(40) COLLATE utf8_bin NOT NULL,
  `transaction_fee` decimal(10,3) NOT NULL,
  `transaction_fee_currency` varchar(3) COLLATE utf8_bin NOT NULL,
  `payer` varchar(32) COLLATE utf8_bin NOT NULL,
  `state` ENUM('TOVALID','ACCEPTED','REFUSED','CANCELLED','INPROGRESS') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'INPROGRESS',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,  
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

 

--
-- Structure de la table `t_payment_employer_method`  
--
CREATE TABLE IF NOT EXISTS `t_payment_debit_event_user_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,      
  `method_id` int(11) unsigned NOT NULL, 
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',    
  `position` int(8) unsigned NOT NULL,  
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,  
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


--
-- Structure de la table `t_payment_debit_event_user`  
--
CREATE TABLE IF NOT EXISTS `t_payment_credit_event_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,    
  `event_user_id` int(11) unsigned NOT NULL, 
  `method_id` int(11) unsigned NOT NULL, 
  `order_id` int(11) unsigned NOT NULL, 
  `currency_id` int(11) unsigned NOT NULL, 
  `currency` varchar(3)  NOT NULL, 
  `total_price_with_tax` decimal(10,3) DEFAULT '0.0',
  `payment_price_with_tax` decimal(10,3) DEFAULT '0.0',  
  `order_total_price_with_tax` decimal(10,3) DEFAULT '0.0', 
  `ip` varchar(40)  NOT NULL, 
  `reference` varchar(24) NOT NULL,
  `authorization` varchar(128) COLLATE utf8_bin NOT NULL,
  `transaction_time` varchar(40) COLLATE utf8_bin NOT NULL,
  `transaction_reference` varchar(40) COLLATE utf8_bin NOT NULL,
  `transaction_fee` decimal(10,3) NOT NULL,
  `transaction_fee_currency` varchar(3) COLLATE utf8_bin NOT NULL,
  `payer` varchar(32) COLLATE utf8_bin NOT NULL,
  `state` ENUM('TOVALID','ACCEPTED','REFUSED','CANCELLED','INPROGRESS') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'INPROGRESS',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,  
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

 

--
-- Structure de la table `t_payment_employer_method`  
--
CREATE TABLE IF NOT EXISTS `t_payment_credit_event_user_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,      
  `method_id` int(11) unsigned NOT NULL, 
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',    
  `position` int(8) unsigned NOT NULL,  
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,  
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;
