--
-- Structure de la table `t_payment_paypal_settings`  
--
CREATE TABLE IF NOT EXISTS `t_payment_paypal_settings` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
        `mode` varchar(24)  NOT NULL DEFAULT '',  
        `client` varchar(255) COLLATE utf8_bin NOT NULL,            
        `secret` varchar(128)  NOT NULL,    
        `payer` varchar(40)  NOT NULL,           
        `created_at` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_at` timestamp  NULL DEFAULT NULL,
      PRIMARY KEY (`id`)      
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;
