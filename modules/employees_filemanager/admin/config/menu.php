<?php

return array(

  

    "items" => array(

         "3000_employees_admin" => array(           
            "childs" => array(
              
                "15_employees.filemanager.admin" =>'',
              
                ),
                "enabled" => true,
        ),

        
            "15_employees.filemanager.admin" => array(
            "title" => "File Manager",
            "icon_awe" => "fa-users",
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('employees_filemanagerçajax' => array('action' => 'ListFile')),
            "enabled" => true,
                ),
                
       
         
          
    ),


);
