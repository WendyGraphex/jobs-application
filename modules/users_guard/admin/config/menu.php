<?php

return array(
  "menu" => array(
        "dashboard" => array(
            "childs" => array('160_user_guard_credentials_admin' => ''
                        ),
        ),
    ),
    
    "items"=>array(
                
        
        "7000_users_admin" => array(           
            "childs" => array(
               "20_users_groups_admin"=> '',
                "30_users_permissions_admin" => '',
                "40_users.sessions.admin"=>''
                ),
            "enabled" => true,
        ),
      /*  "160_user_guard_credentials_admin"=>array(
                    "title"=>"Credentials",
                    "icon_awe"=>"fa-users",
                    "childs"=>array("00_users_groups_admin"=>'',
                                    "10_users_permissions_admin"=>'',
                                  //  "30_users.settings.admin"=>''
                                   )                                 
                 ),  */ 
                
       "20_users_groups_admin"=>array(
                     "title"=>"Groups",
                     "icon_awe"=>"fa-users",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('users_guard_ajax'=>array('action'=>'ListGroup')),
                     "enabled"=>true,                                  
                 ),  
        
        "30_users_permissions_admin"=>array(
                     "title"=>"Permissions",
                     "icon_awe"=>"fa-lock",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('users_guard_ajax'=>array('action'=>'ListPermission')),
                     "enabled"=>true,                                  
                 ), 
        
        "40_users.sessions.admin"=>array(
                      "title"=>"Connections",
                         "icon_awe" => "fa-users",
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('users_guard_ajax'=>array('action'=>'ListSession')),
                     "enabled"=>true,                                  
                 ),
       
  ),
  

);