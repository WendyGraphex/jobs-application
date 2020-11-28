
CREATE TABLE IF NOT EXISTS `t_employer_project` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,   
  `reference` varchar(32) DEFAULT "", 
  `name` VARCHAR(128) NOT NULL,
  `budget` decimal(8,2) NOT NULL DEFAULT 0.0,
  `employer_user_id` int(11) UNSIGNED NOT NULL,
  `number_of_languages` int(8) UNSIGNED DEFAULT 0,  
  `number_of_documents` int(8) UNSIGNED DEFAULT 0,
  `number_of_shares` int(8) UNSIGNED DEFAULT 0, 
  `position` int(11) UNSIGNED DEFAULT 0,
  `state` ENUM('UPLOAD') NULL DEFAULT NULL ,  
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

ALTER TABLE `t_employer_project` ADD CONSTRAINT `employer_project_fk1` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_employer_project_i18n` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(32) DEFAULT "", 
  `lang` varchar(2) DEFAULT "", 
  `url` varchar(255) DEFAULT "", 
  `title` varchar(255) DEFAULT "", 
  `short_description` varchar(512) DEFAULT "",   
  `content` TEXT DEFAULT "",
  `project_id` int(11) unsigned DEFAULT NULL,  
  `state` ENUM('UPLOAD') NULL DEFAULT NULL ,  
  `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  `updated_at` datetime  NULL DEFAULT NULL,
   PRIMARY KEY (`id`),  
   UNIQUE KEY `unique` (`project_id`,`lang`)   
) ENGINE=InnoDB DEFAULT  CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

ALTER TABLE `t_employer_project_i18n` ADD CONSTRAINT `employer_project_i18n_fk0` FOREIGN KEY (`project_id`) REFERENCES `t_employer_project` (`id`) ON DELETE CASCADE;

--
-- Structure de la table `t_employer_project_document`
--

CREATE TABLE IF NOT EXISTS `t_employer_project_document` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `file` varchar(128) COLLATE utf8_bin NOT NULL,
  `extension` varchar(10) COLLATE utf8_bin NOT NULL,
  `project_id` int(11) UNSIGNED NOT NULL,
  `employer_user_id` int(11) UNSIGNED NOT NULL,
  `filesize` int(11) unsigned DEFAULT NULL,  
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL  DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_employer_project_document` ADD CONSTRAINT `employer_project_document_fk0` FOREIGN KEY (`project_id`) REFERENCES `t_employer_project`  (`id`) ON DELETE CASCADE;
ALTER TABLE `t_employer_project_document` ADD CONSTRAINT `employer_project_document_fk1` FOREIGN KEY (`employer_user_id`) REFERENCES `t_employer_user`  (`id`) ON DELETE CASCADE;

