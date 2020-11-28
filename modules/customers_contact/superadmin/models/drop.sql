-- Tables without foreign key

DELETE FROM `t_customer`;


-- Table linked by foreign keys

DROP TABLE IF EXISTS `t_customer`;
DROP TABLE IF EXISTS `t_customer_forgot_password`;
DROP TABLE IF EXISTS `t_customer_sessions`;
DROP TABLE IF EXISTS `t_customer_remember`;