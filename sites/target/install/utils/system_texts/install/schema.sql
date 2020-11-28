--
-- Structure de la table `t_system_model_text`  
--
CREATE TABLE IF NOT EXISTS `t_system_model_text` (   
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,       
    `name` varchar(255) COLLATE utf8_bin NOT NULL,   
    `type` ENUM( 'SYSTEM', '' ) NOT NULL DEFAULT '' ,   
    `module` varchar(255) COLLATE utf8_bin NOT NULL,   
     PRIMARY KEY (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Structure de la table `t_system_model_text_i18n`  
--
CREATE TABLE IF NOT EXISTS `t_system_model_text_i18n` (   
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,  
    `model_id` int(11) unsigned NOT NULL,
    `lang` varchar(2) NOT NULL default '',
    `value` varchar(255) COLLATE utf8_bin NOT NULL,     
    `text` text COLLATE utf8_bin NOT NULL,   
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',   
     PRIMARY KEY (`id`),   
    UNIQUE KEY `unique` (`lang`,`model_id`)     
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_system_model_text_i18n` ADD CONSTRAINT `system_model_text_0` FOREIGN KEY (`model_id`) REFERENCES `t_system_model_text` (`id`) ON DELETE CASCADE;

