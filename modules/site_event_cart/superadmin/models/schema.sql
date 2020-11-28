--
-- Structure de la table `t_site_event_cart`
--

CREATE TABLE `t_site_event_cart` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reference` varchar(10) NOT NULL,
  `event_user_id` int(11) unsigned NULL DEFAULT NULL ,    
  `lang` varchar(2)  NOT NULL,
  `country` varchar(2)  NOT NULL,
  `culture` varchar(5)  NOT NULL,
  `culture_preferred` varchar(5)  NOT NULL,  
  `ip` varchar(16)  NOT NULL, 
  `currency_id` int(11) unsigned NOT NULL,  
  `message` text COLLATE utf8_bin NOT NULL,
  `secure` varchar(32) NOT NULL DEFAULT '', 
  `number_of_events` int(11) unsigned NOT NULL DEFAULT '0',
  `total_sale_price_without_tax` decimal(10,3) NOT NULL,  
  `total_sale_price_with_tax` decimal(10,3) NOT NULL, 
  `commission_without_tax` decimal(10,3) NOT NULL,
  `commission_with_tax` decimal(10,3) NOT NULL,
  `global_sale_price_without_tax` decimal(10,3) NOT NULL,  
  `global_sale_price_with_tax` decimal(10,3) NOT NULL, 
  `commission_rate_id`int(11) unsigned DEFAULT NULL,
  `has_commission` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',   
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',   
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',       
  `state` enum('INPROGRESS','ORDERED','DELETED','SAVED') COLLATE utf8_bin NOT NULL DEFAULT 'INPROGRESS',       
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


ALTER TABLE `t_site_event_cart` ADD CONSTRAINT `site_event_cart_fk0` FOREIGN KEY (`currency_id`) REFERENCES `t_site_currency` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_site_event_cart` ADD CONSTRAINT `site_event_cart_fk1` FOREIGN KEY (`event_user_id`) REFERENCES `t_site_event_user` (`id`) ON DELETE CASCADE;

-- Structure de la table `t_site_event_cart_event`

CREATE TABLE IF NOT EXISTS `t_site_event_cart_event` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `signature` varchar(64) COLLATE utf8_bin NOT NULL,
  `cart_id` int(11) UNSIGNED NOT NULL,
  `event_id` int(11) UNSIGNED NOT NULL,
  `event_user_id` int(11) unsigned DEFAULT NULL,
  `seller_user_id` int(11) unsigned DEFAULT NULL,
  `tax_id` int(11) UNSIGNED DEFAULT NULL,  
  `quantity` int(8) UNSIGNED NOT NULL DEFAULT '1',
  `comments` varchar(512) COLLATE utf8_bin DEFAULT '',
  `sale_price_with_tax` decimal(10,3) NOT NULL,
  `sale_price_without_tax` decimal(10,3) NOT NULL,
  `total_sale_price_with_tax` decimal(10,3) NOT NULL,
  `total_sale_price_without_tax` decimal(10,3) NOT NULL,
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


ALTER TABLE `t_site_event_cart_event` ADD CONSTRAINT `site_event_cart_event_fk0` FOREIGN KEY (`cart_id`) REFERENCES `t_site_event_cart` (`id`) ON DELETE CASCADE;

