<?php

return array(
    
    "items"=>array(            
                          
        "5500_customers_admin" => array(
            
           // "route_ajax" => array('site_ajax' => array('action' => 'Home')),
            "childs" => array(
                  "10_customers_newsletters"=>''         
                ),
         
        ), 
            "10_customers_newsletters"=>array(
                "title"=>"Newsletters",             
                "route_ajax"=>array("customers_newsletter_ajax"=>array("action"=>"List")),  
                "picture"=>"/pictures/icons/newsletter.png",
                "enabled"=>true,                                         
            ),                       
                    
   ),   
    
  

);