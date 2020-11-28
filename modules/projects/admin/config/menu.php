<?php

return array(

    "menu" => array(
        "dashboard" => array(
            "childs" => array('7800_projects_admin' => ''),
        ),

    ),



    "items" => array(

         "7800_projects_admin" => array(
            "title" => "Project Manager",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "icon_awe" => "fa-dollar-sign fa-2x",
          //  "route_ajax" => array('site_ajax' => array('action' => 'Home')),
            "childs" => array(
                  '00_projects_admin' => null,  
                  '90_projects_settings_state_admin' => null,  
                ),
               "enabled" => true,
        ),                
        
        
         "00_projects_admin" => array(
            "title" => "Projects",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('projects_ajax' => array('action' => 'ListProject')),
            "enabled" => true,
        ),              
       
          '90_projects_settings_state_admin' => array(
            "title" => "Task States",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('projects_ajax' => array('action' => 'ListTaskState')),
            "enabled" => true,
        ),  
          
    ),


);
