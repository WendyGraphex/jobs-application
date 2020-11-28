--
-- Structure de la table `t_postcode_city`
--

CREATE TABLE IF NOT EXISTS `t_postcode_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postcode` varchar(5) NOT NULL default '',
  `city` varchar(128) NOT NULL default '',
  `country` varchar(2) NOT NULL default 'FR',
  PRIMARY KEY (`id`),
  UNIQUE KEY unique_1  (`postalcode`,`city`,`country`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

--
-- Structure de la table `t_text_email_i18n`  
--
CREATE TABLE IF NOT EXISTS `t_text_email_i18n` (   
    `module` varchar(40) NOT NULL default '',       
    `lang` varchar(2) NOT NULL default '',
    `key` varchar(255) COLLATE utf8_bin NOT NULL,
    `subject` varchar(255) COLLATE utf8_bin NOT NULL,
    `body` text COLLATE utf8_bin NOT NULL, 
     UNIQUE KEY `unique` (`module`,`lang`,`key`)     
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;