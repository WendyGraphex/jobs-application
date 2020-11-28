<?php

return array(

    "menu" => array(
        "dashboard" => array(
            "childs" => array('7950_customer_blog_admin' => ''),
        ),

    ),



    "items" => array(

         "7950_customer_blog_admin" => array(
            "title" => "Blog",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "icon_awe" => "fa-dollar-sign fa-2x",
          //  "route_ajax" => array('site_ajax' => array('action' => 'Home')),
            "childs" => array(
                  '00_customer_blog_admin' => null,  
                  '10_customer_blog_activities_admin' => null,  
                  "20_customer_blog_activities_menu_admin"=>null,
                ),
               "enabled" => true,
        ),                
        
        
         "00_customer_blog_admin" => array(
            "title" => "Articles",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('customers_blog_ajax' => array('action' => 'ListArticle')),
            "enabled" => true,
        ),              
       
          "10_customer_blog_activities_admin" => array(
            "title" => "Activites",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('customers_blog_ajax' => array('action' => 'ListActivity')),
            "enabled" => true,
        ),   
        
        
          "20_customer_blog_activities_menu_admin"=>array(
                "title"=>"Activity menu manager",
               
                "route_ajax"=>array("customers_blog_ajax"=>array("action"=>"ListActivityMenu")),    
               
                "enabled"=>true,               
            ),   
          
    ),


);
