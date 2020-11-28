<?php

return array(

    "items" => array(       
           
           "6500_site_event_admin"=>array(
                    
                     "childs"=>array("000_site_event_cart_admin"=>null,
                                ),                                    
                 ),    

         "000_site_event_cart_admin" => array(
                "title" => "Carts",
                "icon_awe" => "fa-shopping-cart",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('site_event_cart_ajax' => array('action' => 'List')),
                "enabled" => true,
         ),              
        
    ),

);