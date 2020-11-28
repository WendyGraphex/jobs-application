<?php

return array(
   
    "items" => array(

        "5000_employers_admin" => array(           
            "childs" => array(               
                "51_employers.users.comment.admin" =>'',               
                ),
                "enabled" => true,
        ),

        
        "51_employers.users.comment.admin" => array(
                "title" => "Comments",
                "icon_awe" => "fa-building",
                //  "credentials"=>array(array('superadmin','admin','settings_user')),
                "route_ajax" => array('employers_comment_ajax' => array('action' => 'ListComment')),
                "enabled" => true,
            ),
        
        
    ),


);