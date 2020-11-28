--
-- Structure de la table `t_services_sms_box_sent`
--
CREATE TABLE IF NOT EXISTS `t_services_sms_box_sent` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `mobile` varchar(255) COLLATE utf8_bin NOT NULL,
    `reference` varchar(255) COLLATE utf8_bin NOT NULL,
    `message` text COLLATE utf8_bin NOT NULL,
    `error_api` TEXT CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `error_callback` text COLLATE utf8_bin NOT NULL,
    `parameters` text COLLATE utf8_bin NOT NULL,
    `errors` text COLLATE utf8_bin NOT NULL,
    `is_sent` enum('YES','NO')  NOT NULL DEFAULT 'NO',
    `is_received` enum('YES','NO')  NOT NULL DEFAULT 'NO',
    `sent_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `t_services_smsbox_model` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `content` TEXT NOT NULL,
  `status` ENUM( 'ACTIVE', 'DELETE' ) NOT NULL DEFAULT 'ACTIVE' ,
  `color` varchar(16)  NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;



