<?php

return array(

    
    
    "menu" => array(
        "dashboard" => array(
            "childs" => array('2000_sales_billings_admin' => null),
        ),

    ),
    
    "items" => array(
       
           
         "2000_sales_billings_admin"=>array(
              "title" => "Billings",
                "icon_awe" => "fa-receipt", //"fa-dollar-sign",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
               // "route_ajax" => array('sales_ajax' => array('action' => 'ListSale')),
                "enabled" => true,
                      "childs"=>array(
                          "000_sales_billings_admin"=>null,                            
                       )
                 ),  

         "000_sales_billings_admin" => array(
                "title" => "Billings",
              //  "icon_awe" => "fa-cart",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('sales_billing_ajax' => array('action' => 'ListBilling')),
                "enabled" => true,
         ), 
        
         
        
        "9999_dashboard_settings_admin"=>array(
              "childs"=>array(                  
                   "35_system_sales_billing_state_admin" =>'',                              
              ),                        
         ), 
        
        
         "35_system_sales_billing_state_admin" => array(
            "title" => "Billing States",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "icon_awe" => "fa-user fa-2x",
             "route_ajax" => array('sales_billing_ajax' => array('action' => 'ListState')),
             "enabled" => true,
        ),
    ),


);