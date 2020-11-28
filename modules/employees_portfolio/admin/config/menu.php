<?php

return array(
   
    "items" => array(

        "3000_employees_admin" => array(           
            "childs" => array(               
                "33_employees.users.portfolio.admin" =>'',               
                ),
                "enabled" => true,
        ),

        
        "33_employees.users.portfolio.admin" => array(
                "title" => "Portfolio",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_portfolio_ajax' => array('action' => 'ListPortfolio')),
                "enabled" => true,
            ),
        
        
    ),


);