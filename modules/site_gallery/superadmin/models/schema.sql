--
-- Structure de la table `t_site_gallery`  
--
CREATE TABLE IF NOT EXISTS `t_site_gallery` (
            `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
            `name` varchar(255)  NOT NULL,
            `component` varchar(64)  NOT NULL,
            `template` varchar(32) NOT NULL DEFAULT '',
            `height` varchar(32) NOT NULL,
            `width` varchar(32) NOT NULL,
            `effect` varchar(32) NOT NULL,
            `slices` int(11) unsigned  NOT NULL,
            `boxCols` int(11) unsigned  NOT NULL,
            `boxRows` int(11) unsigned  NOT NULL,
            `animSpeed` int(11) unsigned  NOT NULL,
            `pauseTime` int(11) unsigned  NOT NULL,
            `startSlide` int(11) unsigned  NOT NULL,
            `directionNav` enum('YES','NO')  NOT NULL DEFAULT 'NO',
            `controlNav` enum('YES','NO')  NOT NULL DEFAULT 'NO',
            `controlNavThumbs` enum('YES','NO')  NOT NULL DEFAULT 'NO',
            `pauseOnHover` enum('YES','NO')  NOT NULL DEFAULT 'NO',
            `manualAdvance` enum('YES','NO')  NOT NULL DEFAULT 'NO', 
            `randomStart` enum('YES','NO')  NOT NULL DEFAULT 'NO',
            `is_fullscreen` enum('YES','NO')  NOT NULL DEFAULT 'NO',  
            `is_active` enum('YES','NO')  NOT NULL DEFAULT 'NO',                       
            `start_at` date  NULL DEFAULT NULL,
            `expired_at` date  NULL DEFAULT NULL,
            `created_at` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
            `updated_at` timestamp  NOT NULL ,      
    PRIMARY KEY (`id`)      
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1; 

--
-- Structure de la table `t_site_gallery_i18n`  
--
CREATE TABLE IF NOT EXISTS `t_site_gallery_i18n` (
            `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
            `gallery_id` int(11) unsigned NOT NULL,
            `lang` varchar(2) NULL DEFAULT NULL,      
            `title` varchar(255)  NOT NULL,    
            `link` varchar(255)  NOT NULL,           
            `created_at` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
            `updated_at` timestamp  NOT NULL ,
     PRIMARY KEY (`id`)      
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

--
-- Structure de la table `t_site_picture`  
--
CREATE TABLE IF NOT EXISTS `t_site_picture` (
            `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
            `name` varchar(255)  NOT NULL,                 
            `height`int(11) unsigned NOT NULL,
            `width` int(11) unsigned NOT NULL,   
            `picture` varchar(255)  NOT NULL,     
            `extension` varchar(5)  NOT NULL,      
            `filesize` int(11) unsigned NOT NULL,         
            `is_active` enum('YES','NO')  NOT NULL DEFAULT 'NO',                        
            `start_at` date  NULL DEFAULT NULL,
            `expired_at` date  NULL DEFAULT NULL,          
     PRIMARY KEY (`id`)      
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

--
-- Structure de la table `t_site_picture_i18n`  
--
CREATE TABLE IF NOT EXISTS `t_site_picture_i18n` (
            `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
            `picture_id` int(11) unsigned  NOT NULL,
            `lang` varchar(2)  NOT NULL,                 
            `link` VARCHAR(255) NOT NULL,
            `target` enum('_blank','top','parent','') COLLATE utf8_bin NOT NULL DEFAULT '',
            `description` varchar(255)  NOT NULL,
            `content` text COLLATE utf8_bin NOT NULL ,
            `title` varchar(255)  NOT NULL,
            `created_at` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
            `updated_at` timestamp  NOT NULL,
     PRIMARY KEY (`id`)      
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;

--
-- Structure de la table `t_site_gallery_picture`  
--
CREATE TABLE IF NOT EXISTS `t_site_gallery_picture` (
            `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
            `picture_id` int(11) unsigned  NOT NULL,
            `gallery_id` int(11) unsigned  NOT NULL,   
            `is_active` enum('YES','NO')  NOT NULL DEFAULT 'NO',    
            `position` int(11) unsigned  NOT NULL,           
     PRIMARY KEY (`id`)      
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;


ALTER TABLE `t_site_gallery_picture` ADD CONSTRAINT `site_picture_fk0` FOREIGN KEY (`gallery_id`) REFERENCES `t_site_gallery` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_site_gallery_picture` ADD CONSTRAINT `site_picture_fk1` FOREIGN KEY (`picture_id`) REFERENCES `t_site_picture` (`id`) ON DELETE CASCADE;
ALTER TABLE `t_site_picture_i18n` ADD CONSTRAINT `site_picture_i18n_fk0` FOREIGN KEY (`picture_id`) REFERENCES `t_site_picture` (`id`) ON DELETE CASCADE;
