<?php

return array(

   
    "items" => array(

        "3000_employees_admin" => array(             
            "childs" => array(
                '40_employees.invitations.admin' => '',
                
                ),
              
        ),

         
         
         "40_employees.invitations.admin" => array(
                "title" => "Invitations",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employees_invitation_ajax' => array('action' => 'ListInvitation')),
                "enabled" => true,
            ),
        
           
    ),


);