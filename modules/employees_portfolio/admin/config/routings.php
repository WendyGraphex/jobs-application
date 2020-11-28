<?php


return array(

    "employees_portfolio_ajax" => array("pattern" => '/module/employees/portfolio/admin/{action}', 
                               "module" => "employees_portfolio", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),   
    
);