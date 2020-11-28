-- Structure de la table `t_employer_invitation`

CREATE TABLE IF NOT EXISTS `t_employer_invitation` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
 `gender` enum('Mr','Ms','Mrs') NOT NULL,
 `firstname` varchar(64) COLLATE utf8_bin NOT NULL,
 `lastname` varchar(64) COLLATE utf8_bin NOT NULL, 
 `email` varchar(255) COLLATE utf8_bin NOT NULL,
 `friend_firstname` varchar(64) COLLATE utf8_bin NOT NULL,
 `friend_lastname` varchar(64) COLLATE utf8_bin NOT NULL, 
 `friend_email` varchar(255) COLLATE utf8_bin NOT NULL,
 `phone` varchar(16) COLLATE utf8_bin NOT NULL,
 `mobile` varchar(16) COLLATE utf8_bin NOT NULL,
 `fax` varchar(16) COLLATE utf8_bin NOT NULL,
 `address1` varchar(255) COLLATE utf8_bin NOT NULL,
 `address2` varchar(255) COLLATE utf8_bin NOT NULL,
 `postcode` char(10) COLLATE utf8_bin NOT NULL,
 `city` varchar(128) COLLATE utf8_bin NOT NULL,
 `country` varchar(2) COLLATE utf8_bin NOT NULL,
 `state` varchar(20) COLLATE utf8_bin NOT NULL,
 `subject` varchar(255) COLLATE utf8_bin NOT NULL,
 `message` varchar(512) COLLATE utf8_bin NOT NULL,
 `employee_user_id` int(11) unsigned NULL DEFAULT NULL, 
 `employer_user_id` int(11) unsigned NULL DEFAULT NULL,
 `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
 `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

