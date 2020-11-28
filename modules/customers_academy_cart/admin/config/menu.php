<?php

return array(

    
    "items" => array(
       
           
        "2000_sales_admin"=>array(
                      "childs"=>array(
                          "000_customers_academy_cart_admin"=>null,                            
                       )
                 ),

         
         "000_customers_academy_cart_admin" => array(
                "title" => "Carts",
                "icon_awe" => "fa-shopping-cart",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('customers_academy_cart_ajax' => array('action' => 'List')),
                "enabled" => true,
         ), 
        
    ),


);