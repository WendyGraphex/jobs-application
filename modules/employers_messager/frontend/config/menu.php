<?php


return array(

    "menu"=>array(                   
                    "employer.dashboard"=>array(                                          
                        "childs"=>array(                                                                
                                "600_employer_mymessages"=>null,
                            ),                     
                    ),                       
     ),
       
    "items"=>array(
                                   
     
        
         "600_employer_mymessages"=>array(
                     "title"=>"Messenger", 
                     "mdi"=>"mdi-file-document-box",                    
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employers_messager_ajax'=>array('action'=>'ListMessage')),
                     "enabled"=>true,                                  
                 ), 
        
  ),
);