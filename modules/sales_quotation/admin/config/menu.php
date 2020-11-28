<?php

return array(

    
    
    "menu" => array(
        "dashboard" => array(
            "childs" => array('1000_sales_quotations_admin' => null),
        ),

    ),
    
    "items" => array(
       
           
         "1000_sales_quotations_admin"=>array(
              "title" => "Offers",
                "icon_awe" => "fa-dollar-sign",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
               // "route_ajax" => array('sales_ajax' => array('action' => 'ListSale')),
                "enabled" => true,
                      "childs"=>array(
                          "000_sales_quotations_admin"=>null,                            
                       )
                 ),  

         "000_sales_quotations_admin" => array(
                "title" => "Quotations",
              //  "icon_awe" => "fa-cart",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('sales_quotation_ajax' => array('action' => 'ListQuotation')),
                "enabled" => true,
         ), 
        
         
        "9999_dashboard_settings_admin"=>array(
              "childs"=>array(                  
                   "45_system_sales_quotation_state_admin" =>'',                              
              ),                        
         ), 
        
        
         "45_system_sales_quotation_state_admin" => array(
            "title" => "Quotation States",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "icon_awe" => "fa-user fa-2x",
             "route_ajax" => array('sales_quotation_ajax' => array('action' => 'ListState')),
             "enabled" => true,
        ),
        
        
        
        
         "5000_employers_admin" => array(           
            "childs" => array(
                
                 "30_employers.requests.admin" =>'',
            
                ),
             
        ),
        
           "30_employers.requests.admin" => array(
                "title" => "Requests",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('sales_quotation_ajax' => array('action' => 'ListRequest')),
                "enabled" => true,
            ),
    ),


);