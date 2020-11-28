<?php


return array(

    "menu"=>array(                   
                    "employer.dashboard"=>array(                                          
                        "childs"=>array(            
                                "000_employer_dashboard"=>null,
                                "100_employer_myadverts"=>null,
                              //  "200_employer_mydocuments"=>null,
                              
                                "400_employer_mysearches"=>null,                            
                                "500_employer_myfavourites"=>null,
                              //  "600_employer_mymessages"=>null,
                                "680_employer_mypage"=>null,
                                "700_employer_company"=>null,
                                "750_employer_mycompanypage"=>null,
                                "800_employer_users"=>null,
                              
                            ),                     
                    ),                       
     ),
       
    "items"=>array(
                                   
           "000_employer_dashboard"=>array(
                     "title"=>"Dashboard", 
                     "mdi"=>"mdi-home",
                     "active"=>true,
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employers_ajax'=>array('action'=>'Dashboard')),
                     "enabled"=>true,                                  
                 ),                
        
          "100_employer_myadverts"=>array(
                     "title"=>"My jobs", 
                     "mdi"=>"mdi-view-list",
                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employers_ajax'=>array('action'=>'ListAdvert')),
                     "enabled"=>true,                                  
                 ), 
        
        
        
        
        "200_employer_mydocuments"=>array(
                     "title"=>"My Documents", 
                     "mdi"=>"mdi-android-messages",                    
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employers_ajax'=>array('action'=>'ListDocument')),
                     "enabled"=>true,                                  
                 ), 
        
         "400_employer_mysearches"=>array(
                     "title"=>"My searches", 
                     "mdi"=>"mdi-magnify",
                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employers_ajax'=>array('action'=>'ListSearch')),
                     "enabled"=>true,                                  
                 ), 
         "500_employer_myfavourites"=>array(
                     "title"=>"My favorites", 
                     "mdi"=>"mdi-heart",
                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employers_ajax'=>array('action'=>'ListFavourite')),
                     "enabled"=>true,                                  
                 ),
        
          "680_employer_mypage"=>array(
                     "title"=>"My page", 
                     "mdi"=>"mdi-file-document-box",                    
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employers_ajax'=>array('action'=>'MyContent')),
                     "enabled"=>true,                                  
                 ),  
        
           "700_employer_company"=>array(
                     "title"=>"My Company", 
                      "mdi"=>"mdi-domain",
                        "is_admin"=>true,
                     //"credentials"=>array(array('superadmin','admin','settings_user')),
                    "route_ajax"=>array('employers_ajax'=>array('action'=>'MyCompany')),
                     "component"=>"/employers/myCompanyItemMenu",
                     "enabled"=>true,                                  
                 ), 
        
         "750_employer_mycompanypage"=>array(
                     "title"=>"My company page", 
                     "mdi"=>"mdi-file-document-box",       
                     "is_admin"=>true,    
                     "component"=>"/employers/myCompanyContentItemMenu",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('employers_ajax'=>array('action'=>'MyCompanyContent')),
                     "enabled"=>true,                                  
                 ), 
          "800_employer_users"=>array(
                     "title"=>"My Users", 
                     "mdi"=>"mdi-account-group",
                    "is_admin"=>true,
                     //"credentials"=>array(array('superadmin','admin','settings_user')),
                    "component"=>"/employers/myUsersItemMenu",
                    "route_ajax"=>array('employers_ajax'=>array('action'=>'ListUser')),
                     "enabled"=>true,                                  
                 ),  
        
  ),
);