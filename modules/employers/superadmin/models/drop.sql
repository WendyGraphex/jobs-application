-- Tables without foreign key

DELETE FROM `t_employer`;

-- Table linked by foreign keys

DROP TABLE IF EXISTS `t_employer_session`;
DROP TABLE IF EXISTS `t_employer_remember`;
DROP TABLE IF EXISTS `t_employer_forgotPassword`;
DROP TABLE IF EXISTS `t_employee_mission`;
DROP TABLE IF EXISTS `t_employee_mission_request`;
DROP TABLE IF EXISTS `t_employer`;