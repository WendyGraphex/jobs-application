--
-- Structure de la table `t_customer_newsletter`
--

CREATE TABLE IF NOT EXISTS `t_customer_newsletter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ip` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;
