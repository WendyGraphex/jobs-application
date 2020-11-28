<?php

return array(

    "items" => array(       
           
           "6500_site_event_admin"=>array(
                    
                     "childs"=>array("100_site_event_order_admin"=>null,
                                    '97_payments_event_order_payment_admin' => null,  
                                ),                                    
                 ),    

         "100_site_event_order_admin" => array(
                "title" => "Purshase Orders",
                "icon_awe" => "fa-cart",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('site_event_order_ajax' => array('action' => 'ListOrder')),
                "enabled" => true,
         ),                
        
         "97_payments_event_order_payment_admin" => array(
                "title" => "Sale Orders",
                "icon_awe" => "fa-cart",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('site_event_order_ajax' => array('action' => 'ListPayment')),
                "enabled" => true,
         ),                
        
    ),

);