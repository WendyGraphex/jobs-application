--
-- Structure de la table `t_site_country`
--

CREATE TABLE IF NOT EXISTS `t_site_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(2) COLLATE utf8_bin NOT NULL DEFAULT '',  
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',  
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_1` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;


