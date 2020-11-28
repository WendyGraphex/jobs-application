-- Structure de la table `t_customer_contact`

CREATE TABLE `t_customer_contact` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
 `gender` enum('Mr','Ms','Mrs') NOT NULL,
 `firstname` varchar(64) COLLATE utf8_bin NOT NULL,
 `lastname` varchar(64) COLLATE utf8_bin NOT NULL, 
 `email` varchar(255) COLLATE utf8_bin NOT NULL,
 `phone` varchar(16) COLLATE utf8_bin NOT NULL,
 `mobile` varchar(16) COLLATE utf8_bin NOT NULL,
 `fax` varchar(16) COLLATE utf8_bin NOT NULL,
 `adress1` varchar(255) COLLATE utf8_bin NOT NULL,
 `adress2` varchar(255) COLLATE utf8_bin NOT NULL,
 `avatar` varchar(64) COLLATE utf8_bin NOT NULL,
 `postcode` char(10) COLLATE utf8_bin NOT NULL,
 `city` varchar(128) COLLATE utf8_bin NOT NULL,
 `country` varchar(2) COLLATE utf8_bin NOT NULL,
 `state` varchar(20) COLLATE utf8_bin NOT NULL,
 `message` varchar(255) COLLATE utf8_bin NOT NULL,
 `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
 `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
   UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Structure de la table `t_customer_request`

CREATE TABLE `t_customer_request` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
 `gender` enum('Mr','Ms','Mrs') NOT NULL,
 `firstname` varchar(64) COLLATE utf8_bin NOT NULL,
 `lastname` varchar(64) COLLATE utf8_bin NOT NULL, 
 `email` varchar(255) COLLATE utf8_bin NOT NULL,
 `phone` varchar(16) COLLATE utf8_bin NOT NULL,
 `mobile` varchar(16) COLLATE utf8_bin NOT NULL,
 `fax` varchar(16) COLLATE utf8_bin NOT NULL,
 `adress1` varchar(255) COLLATE utf8_bin NOT NULL,
 `adress2` varchar(255) COLLATE utf8_bin NOT NULL,
 `avatar` varchar(64) COLLATE utf8_bin NOT NULL,
 `postcode` char(10) COLLATE utf8_bin NOT NULL,
 `city` varchar(128) COLLATE utf8_bin NOT NULL,
 `country` varchar(2) COLLATE utf8_bin NOT NULL,
 `state` varchar(20) COLLATE utf8_bin NOT NULL,
 `message` varchar(255) COLLATE utf8_bin NOT NULL,
 `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
 `status` enum('ACTIVE','DELETE') COLLATE utf8_bin NOT NULL DEFAULT 'ACTIVE',
 `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
   UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;