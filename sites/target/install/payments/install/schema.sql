--
-- Structure de la table `t_payment`
-- 

CREATE TABLE IF NOT EXISTS `t_payment_method` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT, 
  `name` varchar(48)  NOT NULL,   
  `module` varchar(24)  NOT NULL,   
  `position` smallint(6) NOT NULL,  
  `is_active` enum('YES','NO')  NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,  
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Structure de la table `t_payment_country`
-- 
CREATE TABLE IF NOT EXISTS `t_payment_country` ( 
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT, 
  `payment_id` int(11) unsigned NOT NULL,
  `country` varchar(2)  NOT NULL ,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,  
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Structure de la table `t_payment_currency`
-- 
CREATE TABLE IF NOT EXISTS `t_payment_currency` ( 
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT, 
  `payment_id` int(11) unsigned NOT NULL,
  `currency` varchar(3)  NOT NULL  ,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,  
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Structure de la table `t_payment_transaction`
-- 
CREATE TABLE IF NOT EXISTS `t_payment_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,    
  `order_id` int(11) unsigned NOT NULL,    
  `response` text NOT NULL,  
  `ip` varchar(40)  NOT NULL, 
  `transaction` varchar(40)  NOT NULL, 
  `acceptance` varchar(40)  NOT NULL, 
  `status`  varchar(24)  NOT NULL, 
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,  
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;


--
-- Structure de la table `t_system_model_text`  
--
CREATE TABLE IF NOT EXISTS `t_payment_model_text` (   
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,       
    `name` varchar(255) COLLATE utf8_bin NOT NULL,    
    `module` varchar(255) COLLATE utf8_bin NOT NULL,   
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT NULL,  
     PRIMARY KEY (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Structure de la table `t_payments_model_text_i18n`  
--
CREATE TABLE IF NOT EXISTS `t_payment_model_text_i18n` (   
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,  
    `model_id` int(11) unsigned NOT NULL,
    `lang` varchar(2) NOT NULL default '',
    `value` varchar(255) COLLATE utf8_bin NOT NULL,     
    `text` text COLLATE utf8_bin NOT NULL,   
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT NULL,   
     PRIMARY KEY (`id`),   
    UNIQUE KEY `unique` (`lang`,`model_id`)     
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_payment_model_text_i18n` ADD CONSTRAINT `payment_model_text_fk0` FOREIGN KEY (`model_id`) REFERENCES `t_payment_model_text` (`id`) ON DELETE CASCADE;

