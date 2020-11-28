<?php

return array(
    
    "items" => array(
                  
         "9999_dashboard_settings_admin"=>array(
                      "childs"=>array(
                          "000_settings_partners_category.admin"=>"",                                                      
                       )
                 ),  

         "000_settings_partners_category.admin" => array(
                "title" => "Work categories",
                "icon_awe" => "fa-cogs",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('partners_ajax' => array('action' => 'ListCategory')),
                "enabled" => true,
         ), 
             
        
         "6000_site_admin"=>array(
                     "childs"=>array('80_site_partners_category_menu_admin'=>''),              
         ),  
        
        "80_site_partners_category_menu_admin"=>array(
                "title"=>"Category menu manager",
               
                "route_ajax"=>array("partners_ajax"=>array("action"=>"ListCategoryMenu")),    
               
                "enabled"=>true,               
            ),   

    ),
);