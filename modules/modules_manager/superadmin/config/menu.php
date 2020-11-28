<?php


return array(
    
  "menu"=>array(                   
                  
                    "dashboard_home"=>array(                     
                       "childs"=>array("dashboard_module_manager_admin"=>null,"dashboard_module_manager"=>null),                                 
                      ),
  ),
    
  "items"=>array(
      
      "dashboard_module_manager_admin"=>array(   
                    "title"=>"Module Manager Admin",
                    "component"=>"/modules_manager/menuItemAdmin",     
                    "route_ajax"=>array('modules_manager_ajax_moduleManagerAdmin'=>array('action'=>'ListModuleManagerAdmin')),                  
                    "credentials"=>array(array('superadmin','admin')),
                    "enabled"=>true,                         
       ), 
      
      "dashboard_module_manager"=>array(           
                    "title"=>"Module Manager",
                    "component"=>"/modules_manager/menuItem",     
                    "route_ajax"=>array('modules_manager_ajax'=>array('action'=>'ListModuleManager')),                 
                    "credentials"=>array(array('superadmin','admin')),
                    "enabled"=>true,                         
       ), 
      
    ),

);