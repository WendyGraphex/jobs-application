<?php


return array(

    "menu"=>array(                   
                    "site_event.user.dashboard"=>array(                                          
                        "childs"=>array(            
                                                                                                          
                                "250_user_my_events"=>null,
                             //   "200_user_my_billings"=>null, 
                                "300_user_my_customers"=>null,                                
                                "800_user_my_places"=>null, 
                            
                            ),                     
                    ),  
        
                  
     ),
       
    "items"=>array(
                                   
       
           "250_user_my_events"=>array(
                     "title"=>"My Events", 
                     "mdi"=>"mdi-view-list",
                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('site_event_ajax'=>array('action'=>'ListEvent')),
                     "enabled"=>true,                                  
           ), 
         
        
       /*    "200_user_my_billings"=>array(
                     "title"=>"My Billings", 
                     "mdi"=>"mdi-view-list",
                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('site_event_ajax'=>array('action'=>'ListBilling')),
                     "enabled"=>true,                                  
                 ),*/
        
        
           "300_user_my_customers"=>array(
                     "title"=>"My Customers", 
                     "mdi"=>"mdi-view-list",
                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('site_event_ajax'=>array('action'=>'ListCustomer')),
                     "enabled"=>true,                                  
                 ),
        
         "800_user_my_places"=>array(
                     "title"=>"My Places", 
                     "mdi"=>"mdi-view-list",
                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('site_event_ajax'=>array('action'=>'ListPlace')),
                     "enabled"=>true,                                  
                 ), 
  ),
);