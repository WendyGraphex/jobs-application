<?php

return array(

   "menu"=>array(                   
                    "site_event.user.dashboard"=>array(                                          
                        "childs"=>array(                                                                                                                      
                                "070_site_event_orders"=>null,                             
                                "350_site_event_customer_orders"=>null,      
                            ),                     
                    ),                            
     ),
       
    "items"=>array(                                                            
           "070_site_event_orders"=>array(
                     "title"=>"My Orders", 
                     "mdi"=>"mdi-currency-usd",                    
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('site_event_order_ajax'=>array('action'=>'ListOrderForUser')),
                     "enabled"=>true,                                  
                 ), 
        
          "350_site_event_customer_orders"=>array(
                     "title"=>"My Customer Orders", 
                     "mdi"=>"mdi-currency-usd",                    
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('site_event_order_ajax'=>array('action'=>'ListCustomerOrderForUser')),
                     "enabled"=>true,                                  
                 ), 
  ),
);