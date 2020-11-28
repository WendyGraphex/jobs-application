CREATE TABLE IF NOT EXISTS `t_sale_employer_commission` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(48) COLLATE utf8_bin NOT NULL, 
  `start_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,  
   `number_of_rates` int(11)  UNSIGNED  NOT NULL DEFAULT 0,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE IF NOT EXISTS `t_sale_employer_commission_rate` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `commission_id`  int(11)  UNSIGNED  NOT NULL,
  `from` decimal(10,2) NOT NULL,
  `to` decimal(10,2) NOT NULL,
  `fix` decimal(10,2) NOT NULL,
  `rate` decimal(3,2) NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `start_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_sale_employer_commission_rate` ADD CONSTRAINT `sale_employer_commission_rate_fk0` FOREIGN KEY (`commission_id`) REFERENCES `t_sale_employer_commission` (`id`) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS `t_sale_employee_commission` (
 `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(48) COLLATE utf8_bin NOT NULL, 
  `start_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,  
   `number_of_rates` int(11)  UNSIGNED  NOT NULL DEFAULT 0,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE IF NOT EXISTS `t_sale_employee_commission_rate` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `commission_id`  int(11)  UNSIGNED  NOT NULL,
  `from` decimal(10,2) NOT NULL,
  `to` decimal(10,2) NOT NULL,
  `fix` decimal(10,2) NOT NULL,
  `rate` decimal(3,2) NOT NULL,
  `is_active` enum('YES','NO') COLLATE utf8_bin NOT NULL DEFAULT 'NO',
  `start_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

ALTER TABLE `t_sale_employee_commission_rate` ADD CONSTRAINT `sale_employee_commission_rate_fk0` FOREIGN KEY (`commission_id`) REFERENCES `t_sale_employee_commission` (`id`) ON DELETE CASCADE;






CREATE TABLE IF NOT EXISTS `t_sale_tax` (
        `id` int(11) unsigned NOT NULL AUTO_INCREMENT,            
             `rate` decimal(6,5) NOT NULL DEFAULT '0.000',
             `description` varchar(255)  NOT NULL,
             `is_active` enum('YES','NO')  NOT NULL DEFAULT 'NO',
             `created_at` timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
             `updated_at` timestamp  NOT NULL ,
     PRIMARY KEY (`id`),      
      UNIQUE KEY `unique_rate` (`rate`)     
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;
