CREATE TABLE IF NOT EXISTS `t_google_map_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT, 
  `signature` varchar(128) COLLATE utf8_bin NOT NULL,
  `address` varchar(382) COLLATE utf8_bin NOT NULL,
  `lat` decimal(20,13) NULL DEFAULT NULL,
  `lng` decimal(20,13) NULL DEFAULT NULL,
  `error` varchar(255) COLLATE utf8_bin NOT NULL, 
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;