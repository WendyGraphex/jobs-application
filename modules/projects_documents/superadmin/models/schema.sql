--
-- Structure de la table `t_project_task_document`
--

CREATE TABLE IF NOT EXISTS `t_project_task_document` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `file` varchar(128) COLLATE utf8_bin NOT NULL,
  `extension` varchar(10) COLLATE utf8_bin NOT NULL,
  `project_id` int(11) UNSIGNED NOT NULL,
`task_id` int(11) UNSIGNED NOT NULL,
 `employee_user_id` int(11) UNSIGNED NOT NULL,
 `employer_user_id` int(11) UNSIGNED NOT NULL,
  `filesize` int(11) unsigned DEFAULT NULL,  
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL  DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

 