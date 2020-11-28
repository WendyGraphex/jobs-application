
--
-- Structure de la table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `street` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `addressable_id` int(11) unsigned DEFAULT NULL,
  `addressable_type` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

