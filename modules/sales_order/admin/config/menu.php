<?php

return array(


    "items" => array(
       
           
         "2000_sales_admin"=>array(

                      "childs"=>array(
                          "100_sales_order_admin"=>null,                            
                       )
                 ),  

         "100_sales_order_admin" => array(
                "title" => "Orders",
                "icon_awe" => "fa-cart",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('sales_order_ajax' => array('action' => 'ListOrder')),
                "enabled" => true,
         ), 
        
        
        
    ),


);