--
-- Structure de la table `t_site_currency`  
--
CREATE TABLE IF NOT EXISTS `t_site_currency` (
             `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
             `rate` decimal(6,3) NOT NULL DEFAULT '0.00000',
             `code` varchar(3)  NOT NULL,
             `position` INT(11) UNSIGNED NOT NULL,
             `is_active` enum('YES','NO')  NOT NULL DEFAULT 'NO',
             `created_at` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
             `updated_at` timestamp  NOT NULL ,
     PRIMARY KEY (`id`),      
      UNIQUE KEY `unique_code` (`code`)     
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

