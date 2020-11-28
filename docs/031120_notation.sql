DELETE FROM `t_customer_user_advert_i18n_notation`;
DELETE FROM `t_employee_notation_category`;
DELETE FROM `t_employee_notation_category_i18n`;
DELETE FROM `t_employee_notation_criteria`;
DELETE FROM `t_employee_notation_criteria_i18n`; 
DELETE FROM `t_employer_notation_category`;
DELETE FROM `t_employer_notation_category_i18n`;
DELETE FROM `t_employer_notation_criteria`;
DELETE FROM `t_employer_notation_criteria_i18n`;

INSERT INTO `t_customer_user_advert_i18n_notation` (`id`, `sender`, `employee_user_id`, `employer_user_id`, `employer_criteria_id`, `employee_criteria_id`, `employee_advert_id`, `employee_advert_lang`, `employer_advert_id`, `employer_advert_lang`, `work_id`, `project_id`, `quotation_id`, `notation`, `created_at`, `updated_at`) VALUES
(189, 'EMPLOYER', 17, 9, NULL, 1, NULL, '', 71, 'en', 27, 33, 39, 6, '2020-10-13 12:22:44', '2020-10-13 12:22:44'),
(190, 'EMPLOYER', 17, 9, NULL, 8, NULL, '', 71, 'en', 27, 33, 39, 4, '2020-10-13 12:22:44', '2020-10-13 12:22:44'),
(191, 'EMPLOYER', 17, 9, NULL, 2, NULL, '', 71, 'en', 27, 33, 39, 6, '2020-10-13 12:22:44', '2020-10-13 12:22:44'),
(192, 'EMPLOYER', 17, 9, NULL, 7, NULL, '', 71, 'en', 27, 33, 39, 3, '2020-10-13 12:22:44', '2020-10-13 12:22:44'),
(193, 'EMPLOYEE', 17, 9, 1, NULL, NULL, '', 71, 'en', 27, 33, 39, 2, '2020-10-15 07:30:17', '2020-10-15 07:30:17'),
(194, 'EMPLOYEE', 17, 9, 2, NULL, NULL, '', 71, 'en', 27, 33, 39, 3, '2020-10-15 07:30:17', '2020-10-15 07:30:17'),
(195, 'EMPLOYEE', 17, 9, 3, NULL, NULL, '', 71, 'en', 27, 33, 39, 4, '2020-10-15 07:30:17', '2020-10-15 07:30:17'),
(196, 'EMPLOYEE', 17, 9, 4, NULL, NULL, '', 71, 'en', 27, 33, 39, 5, '2020-10-15 07:30:17', '2020-10-15 07:30:17'),
(197, 'EMPLOYEE', 17, 9, 17, NULL, NULL, '', 71, 'en', 27, 33, 39, 3, '2020-10-15 07:30:17', '2020-10-15 07:30:17'),
(198, 'EMPLOYEE', 17, 9, 18, NULL, NULL, '', 71, 'en', 27, 33, 39, 3, '2020-10-15 07:30:17', '2020-10-15 07:30:17'),
(199, 'EMPLOYEE', 17, 9, 19, NULL, NULL, '', 71, 'en', 27, 33, 39, 3, '2020-10-15 07:30:17', '2020-10-15 07:30:17');


INSERT INTO `t_employee_notation_category` (`id`, `name`, `icon`, `color`, `awe`, `position`, `created_at`, `updated_at`) VALUES
(1, '', '', '', '', 1, '2020-07-30 10:12:15', '2020-07-30 10:12:15'),
(2, '', '', '', '', 2, '2020-07-30 10:20:51', '2020-07-30 10:20:51'),
(3, '', '', '', '', 3, '2020-07-30 10:20:51', '2020-07-30 10:20:51');



INSERT INTO `t_employee_notation_category_i18n` (`id`, `lang`, `title`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'en', 'Communication level', 1, '2020-07-30 10:12:15', '2020-10-20 19:02:00'),
(2, 'en', 'Would recommend the service to a friend', 2, '2020-07-30 10:20:51', '2020-10-20 19:02:16'),
(3, 'en', 'Service as described - Did your business partner meet your expectation?', 3, '2020-07-30 10:20:51', '2020-10-20 19:06:08');

--
-- Déchargement des données de la table `t_employee_notation_criteria`
--

INSERT INTO `t_employee_notation_criteria` (`id`, `category_id`, `name`, `icon`, `color`, `awe`, `max`, `position`, `created_at`, `updated_at`) VALUES
(1, 3, '', '', '', '', 5, 2, '2020-07-30 11:35:53', '2020-10-27 13:59:26'),
(2, 3, '', '', '', '', 5, 3, '2020-07-30 11:39:29', '2020-10-27 13:59:31'),
(7, 3, '', '', '', '', 5, 4, '2020-07-30 15:22:02', '2020-10-27 13:59:35'),
(8, 1, '', '', '', '', 5, 1, '2020-07-30 15:23:51', '2020-10-20 19:03:05'),
(9, 3, '', '', '', '', 5, 5, '2020-10-20 19:05:13', '2020-10-20 19:05:13'),
(10, 3, '', '', '', '', 5, 6, '2020-10-20 19:05:25', '2020-10-20 19:05:25'),
(11, 3, '', '', '', '', 5, 7, '2020-10-20 19:05:40', '2020-10-20 19:05:40'),
(12, 3, '', '', '', '', 5, 8, '2020-10-27 13:59:20', '2020-10-27 13:59:20'),
(13, 2, '', '', '', '', 5, 9, '2020-10-27 14:00:40', '2020-10-27 14:00:40');

INSERT INTO `t_employee_notation_criteria_i18n` (`id`, `lang`, `title`, `criteria_id`, `created_at`, `updated_at`) VALUES
(1, 'en', 'Respect', 1, '2020-07-30 11:35:53', '2020-10-27 13:58:55'),
(2, 'en', 'Hospitality', 2, '2020-07-30 11:39:29', '2020-10-27 13:58:45'),
(7, 'en', 'Enthusiasm', 7, '2020-07-30 15:22:02', '2020-10-27 13:58:34'),
(8, 'en', 'Were you able to understand your business partner', 8, '2020-07-30 15:23:51', '2020-10-20 19:03:05'),
(9, 'en', 'Expertise', 9, '2020-10-20 19:05:13', '2020-10-20 19:05:13'),
(10, 'en', 'Courtesy', 10, '2020-10-20 19:05:25', '2020-10-20 19:05:25'),
(11, 'en', 'Promptness', 11, '2020-10-20 19:05:40', '2020-10-20 19:05:40'),
(12, 'en', 'Reliable', 12, '2020-10-27 13:59:20', '2020-10-27 13:59:20'),
(13, 'en', 'Agree', 13, '2020-10-27 14:00:40', '2020-10-27 14:00:40');


INSERT INTO `t_employer_notation_category` (`id`, `name`, `icon`, `color`, `awe`, `position`, `created_at`, `updated_at`) VALUES
(1, '', '', '', '', 1, '2020-07-30 11:39:48', '2020-07-30 11:39:48'),
(2, '', '', '', '', 2, '2020-07-30 11:39:57', '2020-07-30 11:39:57'),
(3, '', '', '', '', 3, '2020-07-30 11:39:57', '2020-07-30 11:39:57');


INSERT INTO `t_employer_notation_category_i18n` (`id`, `lang`, `title`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'en', 'Communication level', 1, '2020-07-30 11:39:48', '2020-10-27 14:01:59'),
(2, 'en', 'Would recommend the service to a friend ', 2, '2020-07-30 11:39:57', '2020-10-27 14:02:07'),
(3, 'en', 'Service as described - Did your business partner meet your expectation? ', 3, '2020-07-30 11:39:57', '2020-10-27 14:03:18');

INSERT INTO `t_employer_notation_criteria` (`id`, `category_id`, `name`, `icon`, `color`, `awe`, `max`, `position`, `created_at`, `updated_at`) VALUES
(1, 1, '', '', '', '', 5, 1, '2020-07-30 11:43:33', '2020-10-27 14:03:53'),
(2, 2, '', '', '', '', 5, 2, '2020-07-30 11:43:42', '2020-10-27 14:03:58'),
(3, 3, '', '', '', '', 5, 3, '2020-09-03 21:34:35', '2020-10-27 14:04:03'),
(4, 3, '', '', '', '', 5, 4, '2020-09-03 21:35:18', '2020-10-27 14:03:46'),
(17, 3, '', '', '', '', 5, 5, '2020-09-03 21:44:05', '2020-10-27 14:04:22'),
(18, 3, '', '', '', '', 5, 6, '2020-09-03 21:44:05', '2020-10-27 14:04:32'),
(19, 3, '', '', '', '', 5, 7, '2020-09-03 21:44:29', '2020-10-27 14:05:51'),
(20, 3, '', '', '', '', 5, 8, '2020-10-27 14:06:05', '2020-10-27 14:06:05'),
(21, 3, '', '', '', '', 5, 9, '2020-10-27 14:06:13', '2020-10-27 14:06:13');


INSERT INTO `t_employer_notation_criteria_i18n` (`id`, `lang`, `title`, `criteria_id`, `created_at`, `updated_at`) VALUES
(1, 'en', 'Were you able to understand your business partner', 1, '2020-07-30 11:43:33', '2020-10-27 14:02:34'),
(2, 'en', 'Agree', 2, '2020-07-30 11:43:42', '2020-10-27 14:02:48'),
(3, 'en', 'Expertise', 3, '2020-09-03 21:34:35', '2020-10-27 14:03:33'),
(4, 'en', 'Courtesy', 4, '2020-09-03 21:35:18', '2020-10-27 14:03:46'),
(17, 'en', 'Promptness', 17, '2020-09-03 21:44:05', '2020-10-27 14:04:15'),
(18, 'en', 'Enthusiasm', 18, '2020-09-03 21:44:05', '2020-10-27 14:04:32'),
(19, 'en', 'Hospitality', 19, '2020-09-03 21:44:29', '2020-10-27 14:05:51'),
(20, 'en', 'Respect', 20, '2020-10-27 14:06:05', '2020-10-27 14:06:05'),
(21, 'en', 'Reliable', 21, '2020-10-27 14:06:13', '2020-10-27 14:06:13');
