<?php


return array(

    "menu"=>array(                   
                    "employee.dashboard"=>array(                                          
                        "childs"=>array(                                                                
                                "800_employee_mymessages"=>null,
                            ),                     
                    ),                       
     ),
       
    "items"=>array(
                                   
     
        
         "800_employee_mymessages"=>array(
                     "title"=>"Messenger", 
                     "mdi"=>"mdi-file-document-box",                    
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employees_messager_ajax'=>array('action'=>'ListMessage')),
                     "enabled"=>true,                                  
                 ), 
        
  ),
);