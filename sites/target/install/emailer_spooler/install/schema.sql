--
-- Structure de la table `t_emailer_spooler`
--
CREATE TABLE IF NOT EXISTS `t_emailer_spooler` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,  
  `site_id` int(11) NOT NULL,  
  `from` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `to` VARCHAR(512) COLLATE utf8_bin NOT NULL,  
  `cc` VARCHAR(512) COLLATE utf8_bin NOT NULL,  
  `subject` VARCHAR(512) COLLATE utf8_bin NOT NULL,  
  `body` MEDIUMTEXT COLLATE utf8_bin NOT NULL, 
  `is_sent` enum('YES','NO')  NOT NULL DEFAULT 'NO',
  `state` enum('SENT','INPROGRESS')  NULL DEFAULT NULL,
  `status` varchar(16) COLLATE utf8_bin DEFAULT '',
  `created_at` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NOT NULL,  
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;


--
-- Structure de la table `t_emailer_spooler_scheduler`
--

CREATE TABLE IF NOT EXISTS `t_emailer_spooler_scheduler` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,     
  `number_of_emails` int(11) unsigned NOT NULL DEFAULT 0,  
  `has_error` enum('YES','NO')  NOT NULL DEFAULT 'NO',   
  `error_code` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '', 
  `number_of_emails_sent` int(11) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin; 



CREATE TABLE IF NOT EXISTS `t_emailer_spooler_scheduler_email_sent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,    
  `email_id` int(11) unsigned NOT NULL DEFAULT 0,
  `scheduler_id` int(11) unsigned NOT NULL DEFAULT 0,  
  `error_code` varchar(255) COLLATE utf8_bin NOT NULL, 
  `is_sent` enum('YES','NO')  NOT NULL DEFAULT 'NO',    
  `has_error` enum('YES','NO')  NOT NULL DEFAULT 'NO',         
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin; 

ALTER TABLE `t_emailer_spooler_scheduler_email_sent` ADD CONSTRAINT `emailer_spooler_email_sent_1` FOREIGN KEY (`scheduler_id`) REFERENCES `t_emailer_spooler_scheduler` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_emailer_spooler_scheduler_email_sent` ADD CONSTRAINT `emailer_spooler_email_sent_2` FOREIGN KEY (`email_id`) REFERENCES `t_emailer_spooler` (`id`) ON DELETE CASCADE;
