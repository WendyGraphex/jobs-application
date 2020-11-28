<?php


return array(

    "items"=>array(
      
        "6000_site_admin"=>array(
                     "childs"=>array('15_system_shops_admin'=>''),              
                                       
                 ),  
     
     
      "15_system_shops_admin"=>array(
                    "title"=>"Shops",
                    "icon_awe"=>"fa-cart",
                    "route_ajax"=>array("site_shop_ajax"=>array("action"=>"ListShop")),                  
                   // "picture"=>"/pictures/icons/email.jpg",
                  // "help"=>"modify, add and delete status", 
                  //  "credentials"=>array(array('superadmin','admin','settings_customer_texts')),
                    "enabled"=>true,      
                    ), 

  ),
);