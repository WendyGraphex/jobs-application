--
-- Structure de la table `t_site_help`  
--
CREATE TABLE IF NOT EXISTS `t_site_help` (
            `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
            `name` varchar(255)  NOT NULL,    
            `icon` varchar(40)  NOT NULL,       
            `picture` varchar(40)  NOT NULL,               
            `is_active` enum('YES','NO')  NOT NULL DEFAULT 'NO',                                   
            `created_at` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
            `updated_at` timestamp  NULL DEFAULT NULL,        
     PRIMARY KEY (`id`)      
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

--
-- Structure de la table `t_site_help_i18n`  
--
CREATE TABLE IF NOT EXISTS `t_site_help_i18n` (
            `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
            `help_id` int(11) unsigned  NOT NULL,
            `lang` varchar(2)  NOT NULL,                 
            `link` VARCHAR(255) NOT NULL,          
            `description` varchar(255)  NOT NULL,
            `content` text COLLATE utf8_bin NOT NULL ,
            `title` varchar(255)  NOT NULL,
            `created_at` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
            `updated_at` timestamp  NULL DEFAULT NULL,
     PRIMARY KEY (`id`)      
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

ALTER TABLE `t_site_help_i18n` ADD CONSTRAINT `site_help_i18n_fk0` FOREIGN KEY (`help_id`) REFERENCES `t_site_help` (`id`) ON DELETE CASCADE;
