<?php


return array(

    "menu"=>array(                   
                   
        "customer.dashboard"=>array(                                          
                        "childs"=>array(            
                               
                            //    "200_customer_messages"=>null,
                              
                            ),                     
                    ),        
     ),
       
    "items"=>array(
                                   
         
        
            
        "200_customer_messages"=>array(
                     "title"=>"Messages", 
                     "mdi"=>"mdi-format-list-bulleted",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                    "route_ajax"=>array('customers_messager_ajax'=>array('action'=>'ListMessagesForCustomer')),
                     "enabled"=>true,                                  
                 ),  
  ),
);