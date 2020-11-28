<?php

return array(

   "menu"=>array(                   
                    "site_event.user.dashboard"=>array(                                          
                        "childs"=>array(                                                                                                                      
                                "400_site_event_my_advise_payments"=>null,                            
                                "450_site_event_my_payments"=>null,      
                            ),                     
                    ),                            
     ),
       
    "items"=>array(                                                            
            "400_site_event_my_advise_payments"=>array(
                     "title"=>"My payment advises", 
                     "mdi"=>"mdi-currency-usd",                    
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('payments_event_user_ajax'=>array('action'=>'ListAdviseForUser')),
                     "enabled"=>true,                                  
                 ), 
          "450_site_event_my_payments"=>array(
                     "title"=>"My payments", 
                     "mdi"=>"mdi-currency-usd",                    
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('payments_event_user_ajax'=>array('action'=>'ListPaymentForUser')),
                     "enabled"=>true,                                  
                 ), 
  ),
);