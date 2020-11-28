DELETE FROM t_sites;
INSERT INTO `t_sites` (`site_id`, `site_host`, `site_db_name`, `site_db_login`, `site_db_password`, `site_db_host`, `site_admin_theme`, `site_admin_available`, `site_frontend_theme`, `site_frontend_available`, `site_available`, `site_type`, `site_master`, `site_access_restricted`, `logo`, `picture`, `is_uptodate`, `banner`, `favicon`) VALUES
(1, 'landing.graphextech.com', 'site_graphex', 'site_graphex', 'XwmmtyeauPfH5v8y', '10.2.2.51', 'default', 'YES', 'theme2', 'YES', 'YES', 'CUST', '', 1, '', 'picture.png', 'NO', '', ''),
(2, 'prod.graphextech.com', 'site_graphex', 'site_graphex', 'XwmmtyeauPfH5v8y', '10.2.2.51', 'default', 'YES', 'theme1', 'YES', 'YES', 'CUST', '', 1, '', 'picture.png', 'NO', '', ''),
(3, 'www.graphextech.com', 'site_graphex', 'site_graphex', 'XwmmtyeauPfH5v8y', '10.2.2.51', 'default', 'YES', 'theme1', 'YES', 'YES', 'CUST', '', 1, '', 'picture.png', 'NO', '', '');


