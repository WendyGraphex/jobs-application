-- Tables without foreign key

DELETE FROM `t_employee`;

-- Table linked by foreign keys

DROP TABLE IF EXISTS `t_employee_session`;
DROP TABLE IF EXISTS `t_employee_remember`;
DROP TABLE IF EXISTS `t_employee_forgotPassword`;
DROP TABLE IF EXISTS `t_employee_mission_comments`;
DROP TABLE IF EXISTS `t_employee_mission_request`;
DROP TABLE IF EXISTS `t_employee_mission_alert_search`;
DROP TABLE IF EXISTS `t_employee_mission_alert`;
DROP TABLE IF EXISTS `t_employee`;