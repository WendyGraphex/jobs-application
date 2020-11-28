<?php

return array(

   

    "items" => array(

         "8000_projects_admin" => array(
            "title" => "Projects",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "icon_awe" => "fa-dollar-sign fa-2x",
          //  "route_ajax" => array('site_ajax' => array('action' => 'Home')),
            "childs" => array(
                  '10_projects_documents_admin' => null,  
                
                ),
               "enabled" => true,
        ),                
        
        
         "10_projects_documents_admin" => array(
            "title" => "Documents",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('projects_documents_ajax' => array('action' => 'ListDocument')),
            "enabled" => true,
        ),              
       
         
          
    ),


);
