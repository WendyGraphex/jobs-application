--
-- Structure de la table `t_site_cookie`
--

CREATE TABLE IF NOT EXISTS `t_site_cookie` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` VARCHAR(16) COLLATE utf8_bin NOT NULL DEFAULT '',    
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

