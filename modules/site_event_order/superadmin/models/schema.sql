--
-- Structure de la table `t_site_event_order`
--

CREATE TABLE `t_site_event_order` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `month` int(11) UNSIGNED NOT NULL,
  `day` int(11) UNSIGNED NOT NULL,
  `year` int(11) UNSIGNED NOT NULL,
  `dated_at` timestamp NULL DEFAULT NULL,
  `reference` varchar(10) NOT NULL,
  `event_user_id` int(11) unsigned NULL DEFAULT NULL ,
  `company_id` int(11) unsigned NULL DEFAULT NULL ,
  `guest_id` int(11) unsigned NULL DEFAULT NULL , 
  `cart_id` int(11) unsigned NULL DEFAULT NULL , 
  `method_id` int(11) unsigned NULL DEFAULT NULL , 
  `payment_id` int(11) unsigned NULL DEFAULT NULL , 
  `lang` varchar(2)  NOT NULL,
  `country` varchar(2)  NOT NULL,
  `culture` varchar(5)  NOT NULL,
  `culture_preferred` varchar(5)  NOT NULL,  
  `ip` varchar(16)  NOT NULL, 
  `currency_id` int(11) unsigned NOT NULL,  
  `message` text COLLATE utf8_bin NOT NULL,
  `secure` varchar(32) NOT NULL DEFAULT '', 
  `number_of_events` int(11) unsigned NOT NULL DEFAULT '0',
  `number_of_items` int(11) unsigned NOT NULL DEFAULT '0',
  `number_of_payments` int(8) unsigned NOT NULL DEFAULT '0',
  `total_sale_price_with_tax` decimal(10,3) NOT NULL,
  `total_sale_price_without_tax` decimal(10,3) NOT NULL,   
  `commission_without_tax` decimal(10,3) NOT NULL,
  `commission_rate_id` int(11) UNSIGNED DEFAULT NULL,
  `commission_with_tax` decimal(10,3) NOT NULL,
  `global_sale_price_without_tax` decimal(10,3) NOT NULL,
  `global_sale_price_with_tax` decimal(10,3) NOT NULL, 
  `payment_price_without_tax` decimal(10,3) DEFAULT '0.0' ,
  `payment_price_with_tax` decimal(10,3) DEFAULT '0.0',
  `general_price_without_tax` decimal(10,3) DEFAULT '0.0',
  `general_price_with_tax` decimal(10,3) DEFAULT '0.0',
  `tax_amount` DECIMAL(10,3) NOT NULL DEFAULT '0' ,
  `taxes` VARCHAR(128) NOT NULL,
  `has_commission` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',   
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',       
  `state` ENUM('INPROGRESS','ORDERED','DELETED','SAVED','CANCELLED') COLLATE utf8_bin NOT NULL DEFAULT 'INPROGRESS',       
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


--ALTER TABLE `t_site_event_order` ADD CONSTRAINT `site_event_order_fk0` FOREIGN KEY (`currency_id`) REFERENCES `t_site_currency` (`id`) ON DELETE CASCADE;
--ALTER TABLE `t_site_event_order` ADD CONSTRAINT `site_event_order_fk1` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;
--ALTER TABLE `t_site_event_order` ADD CONSTRAINT `site_event_order_fk2` FOREIGN KEY (`company_id`) REFERENCES `t_employer_company` (`id`) ON DELETE CASCADE;
--ALTER TABLE `t_site_event_order` ADD CONSTRAINT `site_event_order_fk3` FOREIGN KEY (`cart_id`) REFERENCES `t_cart` (`id`) ON DELETE CASCADE;
--ALTER TABLE `t_site_event_order` ADD CONSTRAINT `site_event_order_fk4` FOREIGN KEY (`method_id`) REFERENCES `t_payment_method` (`id`) ON DELETE CASCADE;
--ALTER TABLE `t_site_event_order` ADD CONSTRAINT `site_event_order_fk5` FOREIGN KEY (`payment_id`) REFERENCES `t_payment_employer_user` (`id`) ON DELETE CASCADE;


-- Structure de la table `t_sales_order_quotation`

CREATE TABLE `t_site_event_order_event` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
 `signature` varchar(64)  NOT NULL, 
 `order_id` int(11) unsigned NOT NULL,
 `cart_id` int(11) unsigned NOT NULL,
 `cart_event_id` int(11) unsigned NOT NULL,
 `tax_id` int(11) UNSIGNED NULL DEFAULT NULL,    
 `event_user_id` int(11) unsigned DEFAULT NULL,
 `seller_user_id` int(11) unsigned DEFAULT NULL,
 `event_id` int(11) unsigned NOT NULL,
 `quantity` int(8) unsigned NOT NULL DEFAULT '1',
 `comments` varchar(512) DEFAULT "",
 `sale_price_with_tax` decimal(10,3) NOT NULL,
 `sale_price_without_tax` decimal(10,3) NOT NULL, 
 `total_sale_price_with_tax` decimal(10,3) NOT NULL,
 `total_sale_price_without_tax` decimal(10,3) NOT NULL,     
 `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_site_event_order_event` ADD CONSTRAINT `site_event_order_event_fk0` FOREIGN KEY (`order_id`) REFERENCES `t_site_event_order` (`id`) ON DELETE CASCADE;

--
-- Structure de la table `t_site_event_order_payment`
-- 
CREATE TABLE IF NOT EXISTS `t_site_event_order_payment` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT, 
        `date` DATE NULL DEFAULT NULL,        
        `reference` varchar(24)  NOT NULL,                
        `event_user_id` int(11) unsigned NULL DEFAULT NULL,       
        `event_id`int(11) unsigned NULL DEFAULT NULL, 
        `order_event_id`int(11) unsigned NULL DEFAULT NULL,  
        `order_id`int(11) unsigned NULL DEFAULT NULL,        
        `payment_id`int(11) unsigned NULL DEFAULT NULL,      
        `quantity` int(8) unsigned NOT NULL DEFAULT '1',  
        `sale_price_with_tax` decimal(10,3) NOT NULL,
        `sale_price_without_tax` decimal(10,3) NOT NULL, 
        `total_sale_price_without_tax` decimal(10,3) DEFAULT '0.0',          
        `total_sale_price_with_tax` decimal(10,3) DEFAULT '0.0',                
        `status` ENUM('ACTIVE','DELETED','PAID') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',    
        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp  NULL DEFAULT NULL,       
     PRIMARY KEY (`id`)      
) ENGINE=InnoDB DEFAULT CHARSET=utf8  AUTO_INCREMENT=1;