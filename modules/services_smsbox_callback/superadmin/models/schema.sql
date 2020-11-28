--
-- Structure de la table `t_services_smsbox_callback`  
--
CREATE TABLE IF NOT EXISTS `t_services_smsbox_callback` (              
    `id` int(11) NOT NULL AUTO_INCREMENT,            
    `modem` varchar(24) COLLATE utf8_bin NOT NULL, 
    `reference` varchar(24) COLLATE utf8_bin NOT NULL,   
    `mobile` varchar(20) COLLATE utf8_bin NOT NULL,  
    `message` varchar(255) COLLATE utf8_bin NOT NULL,  
    `ts` varchar(20) COLLATE utf8_bin NOT NULL,     
    `accuse` int(11) NOT NULL,   
    `error_callback` varchar(10) COLLATE utf8_bin NOT NULL,            
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)     
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
