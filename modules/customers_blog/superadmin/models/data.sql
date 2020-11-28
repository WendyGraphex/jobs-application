
INSERT INTO `t_customer_blog_activity` (`id`, `name`, `picture`, `icon`, `number_of_articles`, `lb`, `rb`, `level`, `is_active`, `state`, `created_at`, `updated_at`) VALUES
(22, '', '', '', 0, 1, 30, 0, 'NO', NULL, '2020-10-11 10:23:33', '2020-10-11 10:23:33'),
(27, '', '', '', 0, 16, 21, 1, 'YES', NULL, '2020-10-12 06:20:51', '2020-10-12 06:23:54'),
(28, '', '', '', 0, 4, 15, 1, 'YES', NULL, '2020-10-12 06:21:10', '2020-10-12 06:23:55'),
(31, '', '', '', 0, 19, 20, 2, 'YES', NULL, '2020-10-12 06:22:50', '2020-10-12 06:23:57'),
(32, '', '', '', 0, 17, 18, 2, 'YES', NULL, '2020-10-12 06:22:50', '2020-10-12 06:23:58'),
(33, '', '', '', 0, 9, 10, 2, 'YES', NULL, '2020-10-12 06:23:40', '2020-10-12 06:23:48'),
(34, '', '', '', 0, 7, 8, 2, 'YES', NULL, '2020-10-12 06:23:40', '2020-10-12 06:23:48'),
(35, '', '', '', 0, 5, 6, 2, 'YES', NULL, '2020-10-12 06:23:40', '2020-10-12 06:23:49'),
(36, 'success', '', '', 0, 2, 3, 1, 'YES', NULL, '2020-10-24 09:15:50', '2020-10-24 11:22:01');


INSERT INTO `t_customer_blog_activity_i18n` (`id`, `activity_id`, `lang`, `title`, `url`, `meta_title`, `meta_description`, `meta_keywords`, `meta_robots`, `layout`, `template`, `content`, `is_active`, `start_at`, `expired_at`, `created_at`, `updated_at`) VALUES
(14, 27, 'en', 'Sale on graphex', 'Sale-on-graphex', 'Sale on graphex', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:20:51', '2020-10-12 06:20:51'),
(15, 28, 'en', 'Learn on graphex', 'Learn-on-graphex', 'Learn on graphex', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:21:10', '2020-10-12 06:21:10'),
(18, 31, 'en', 'Products', 'Products', 'Products', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:22:50', '2020-10-12 06:22:50'),
(19, 32, 'en', 'Services', 'Services', 'Services', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:22:50', '2020-10-12 06:22:50'),
(20, 33, 'en', 'Learn new Courses', 'Learn-new-Courses', 'Learn new Courses', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:23:40', '2020-10-12 06:23:40'),
(21, 34, 'en', 'Technology', 'Technology', 'Technology', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:23:40', '2020-10-12 06:23:40'),
(22, 35, 'en', 'Marketing', 'Marketing', 'Marketing', '', '', '', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-12 06:23:40', '2020-10-12 06:23:40'),
(23, 36, 'en', 'Success Stories', 'success-stories', 'Success Stories', 'Success Stories', 'Success Stories', 'Success Stories', 'default', 'default.tpl', '', 'NO', NULL, NULL, '2020-10-24 09:15:50', '2020-10-24 09:15:50');



INSERT INTO `t_customer_blog_activity_menu` (`id`, `name`, `lb`, `rb`, `level`, `icon`, `picture`, `awe`, `is_active`, `activity_id`, `state`, `created_at`, `updated_at`) VALUES
(9, '', 1, 18, 0, '', '', '', 'YES', NULL, 'ACTIVE', '2020-10-19 15:36:38', '2020-10-19 15:36:38'),
(10, 'top', 2, 17, 1, '', '', '', 'YES', NULL, 'ACTIVE', '2020-10-19 15:36:51', '2020-10-19 15:36:54'),
(11, 'Learn on graphex ', 9, 16, 2, '', '', '', 'YES', 28, 'ACTIVE', '2020-10-19 15:37:05', '2020-10-19 14:58:50'),
(12, 'Sale on graphex ', 3, 8, 2, '', '', '', 'YES', 27, 'ACTIVE', '2020-10-19 15:37:17', '2020-10-19 14:58:40'),
(13, 'Marketing ', 14, 15, 3, '', '', '', 'YES', 35, 'ACTIVE', '2020-10-19 15:37:37', '2020-10-19 15:00:03'),
(14, 'Technology ', 12, 13, 3, '', '', '', 'YES', 34, 'ACTIVE', '2020-10-19 15:37:49', '2020-10-19 14:59:47'),
(15, 'Learn new Courses', 10, 11, 3, '', '', '', 'YES', 33, 'ACTIVE', '2020-10-19 15:38:01', '2020-10-19 14:59:38'),
(16, 'Services ', 6, 7, 3, '', '', '', 'YES', 32, 'ACTIVE', '2020-10-19 15:38:36', '2020-10-19 14:59:22'),
(17, 'Products ', 4, 5, 3, '', '', '', 'YES', 31, 'ACTIVE', '2020-10-19 15:38:48', '2020-10-19 14:59:11');


INSERT INTO `t_customer_blog_activity_menu_i18n` (`id`, `lang`, `menu_id`, `icon`, `picture`, `target`, `title`, `state`, `created_at`, `updated_at`) VALUES
(8, 'en', 10, '', '', '', 'top', 'ACTIVE', '2020-10-19 15:36:51', '2020-10-19 15:36:51'),
(9, 'en', 11, '', '', '', 'Learn on graphex ', 'ACTIVE', '2020-10-19 15:37:05', '2020-10-19 15:37:05'),
(10, 'en', 12, '', '', '', 'Sale on graphex ', 'ACTIVE', '2020-10-19 15:37:17', '2020-10-19 15:37:17'),
(11, 'en', 13, '', '', '', 'Marketing ', 'ACTIVE', '2020-10-19 15:37:37', '2020-10-19 15:37:37'),
(12, 'en', 14, '', '', '', 'Technology ', 'ACTIVE', '2020-10-19 15:37:49', '2020-10-19 15:37:49'),
(13, 'en', 15, '', '', '', 'Learn new Courses', 'ACTIVE', '2020-10-19 15:38:01', '2020-10-19 15:38:01'),
(14, 'en', 16, '', '', '', 'Services ', 'ACTIVE', '2020-10-19 15:38:36', '2020-10-19 15:38:36'),
(15, 'en', 17, '', '', '', 'Products ', 'ACTIVE', '2020-10-19 15:38:48', '2020-10-19 15:38:48');