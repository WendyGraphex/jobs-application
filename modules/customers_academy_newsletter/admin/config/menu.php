<?php

return array(

     
    "items" => array(

         "7900_customer_academy_admin" => array(
           
            "childs" => array(
                              
                  '870_customer_academy_newsletter_admin' => null,                    
                 
                ),
             
        ),                
        
       
      
         '870_customer_academy_newsletter_admin'  => array(
                 "title"=>"Newsletters",             
                "route_ajax"=>array("customers_academy_newsletter_ajax"=>array("action"=>"List")),  
                "picture"=>"/pictures/icons/newsletter.png",
                "enabled"=>true,      
         ),        
    ),


);

