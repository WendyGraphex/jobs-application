<?php

return array(

   
    "items" => array(

        "5000_employers_admin" => array(             
            "childs" => array(
                '40_employers.invitations.admin' => '',
                
                ),
              
        ),

         
         
         "40_employers.invitations.admin" => array(
                "title" => "Invitations",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employers_invitation_ajax' => array('action' => 'ListInvitation')),
                "enabled" => true,
            ),
        
           
    ),


);