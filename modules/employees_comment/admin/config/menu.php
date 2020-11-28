<?php

return array(
   
    "items" => array(

        "3000_employees_admin" => array(           
            "childs" => array(               
                "51_employees.users.comment.admin" =>'',               
                ),
                "enabled" => true,
        ),

        
        "51_employees.users.comment.admin" => array(
                "title" => "Comments",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_comment_ajax' => array('action' => 'ListComment')),
                "enabled" => true,
            ),
        
        
    ),


);