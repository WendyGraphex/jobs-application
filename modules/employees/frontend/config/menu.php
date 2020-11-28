<?php


return array(

    "menu"=>array(                   
                    "employee.dashboard"=>array(                                          
                        "childs"=>array(            
                                "000_employee_dashboard"=>null,                                                                                       
                                "100_employee_myadverts"=>null,
                           //     "200_employee_mydocuments"=>null,
                                "400_employee_mysearches"=>null,                            
                                "500_employee_myfavourites"=>null,
                           
                                "680_employee_mypage"=>null,
                            ),                     
                    ),                       
     ),
       
    "items"=>array(
                                   
           "000_employee_dashboard"=>array(
                     "title"=>"Dashboard", 
                     "mdi"=>"mdi-home",
                     "active"=>true,
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employees_ajax'=>array('action'=>'Dashboard')),
                     "enabled"=>true,                                  
                 ),                
        
           "100_employee_myadverts"=>array(
                     "title"=>"My jobs", 
                     "mdi"=>"mdi-view-list",
                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employees_ajax'=>array('action'=>'ListAdvert')),
                     "enabled"=>true,                                  
                 ), 
         
         "400_employee_mysearches"=>array(
                     "title"=>"My searches", 
                     "mdi"=>"mdi-magnify",
                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employees_ajax'=>array('action'=>'ListSearch')),
                     "enabled"=>true,                                  
                 ), 
         "500_employee_myfavourites"=>array(
                     "title"=>"My favorites", 
                     "mdi"=>"mdi-heart",
                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employees_ajax'=>array('action'=>'ListFavourite')),
                     "enabled"=>true,                                  
                 ),
        
       
          "680_employee_mypage"=>array(
                     "title"=>"My page", 
                     "mdi"=>"mdi-file-document-box",                    
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employees_ajax'=>array('action'=>'MyContent')),
                     "enabled"=>true,                                  
                 ),
        
        "200_employee_mydocuments"=>array(
                     "title"=>"My Documents", 
                     "mdi"=>"mdi-android-messages",                    
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employees_ajax'=>array('action'=>'ListDocument')),
                     "enabled"=>true,                                  
                 ), 
        
       
  ),
);