<?php

return array(

    
    
    "menu" => array(
        "dashboard" => array(
            "childs" => array('2000_sales_admin' => null),
        ),

    ),
    
    "items" => array(
       
           
         "2000_sales_admin"=>array(
              "title" => "Sales",
                "icon_awe" => "fa-shopping-cart",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
               // "route_ajax" => array('sales_ajax' => array('action' => 'ListSale')),
                "enabled" => true,
                      "childs"=>array(
                    //      "100_sales_admin"=>null,                            
                       )
                 ),  
 
       /*  "100_sales_admin" => array(
                "title" => "Sales",
                "icon_awe" => "fa-cart",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('sales_ajax' => array('action' => 'ListSale')),
                "enabled" => true,
         ), */
        
        
         
         "9999_dashboard_settings_admin"=>array(
                      "childs"=>array(
                          "030_settings_sales_employer_commission.admin"=>"",  
                          "035_settings_sales_employee_commission.admin"=>"",  
                          "040_settings_sales_tax.admin"=>"",    
                       )
                 ),  
         
        
         "030_settings_sales_employer_commission.admin" => array(
                "title" => "Employer Commissions",
                "icon_awe" => "fa-cart",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('sales_ajax' => array('action' => 'ListEmployerCommission')),
                "enabled" => true,
         ), 
        
         "035_settings_sales_employee_commission.admin" => array(
                "title" => "Freelancer Commissions",
                "icon_awe" => "fa-cart",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('sales_ajax' => array('action' => 'ListEmployeeCommission')),
                "enabled" => true,
         ), 
        
        
           "040_settings_sales_tax.admin" => array(
            "title" => "Taxes",
            "icon_awe" => "fa-dollar",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('sales_ajax' => array('action' => 'ListTax')),
            "enabled" => true,
        ),
    ),


);