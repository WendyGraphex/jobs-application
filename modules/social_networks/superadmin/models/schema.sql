--
-- Schema de la table `t_social_networks`
--

CREATE TABLE IF NOT EXISTS `t_social_networks` (  
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 NOT NULL,
  `link` varchar(255) CHARACTER SET utf8 NOT NULL,
  `picture` varchar(64) CHARACTER SET utf8 NOT NULL, 
  `is_active` enum('YES','NO') CHARACTER SET utf8 NOT NULL DEFAULT 'NO',  
  `position` int(11) unsigned NOT NULL,
  `created_at` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp  NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
