<?php

return array(

   "menu"=>array(                   
                    "site_event.user.dashboard"=>array(                                          
                        "childs"=>array(            
                                                                                                          
                                "075_site_event_mycart"=>null, 
                            
                            ),                     
                    ),  
        
                  
     ),        

    "items" => array(
          "075_site_event_mycart"=>array(
                     "title"=>"My Cart", 
                     "mdi"=>"mdi-cart",                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('site_event_cart_ajax'=>array('action'=>'MyCart')),
                     "component"=>"/site_event_cart/myCartItemMenu",
                     "enabled"=>true,                                  
                 ),   
      
          
    ),


);
