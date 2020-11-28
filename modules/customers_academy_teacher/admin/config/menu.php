<?php

return array(

    "items" => array(

         "7900_customer_academy_admin" => array(           
            "childs" => array(      
                    "200_customer_academy_teachers_admin" =>null,   
                    "210_customer_academy_teachers.sessions.admin" => '',
                ),         
        ),                
        
         
           "200_customer_academy_teachers_admin" => array(
            "title" => "Teachers",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('customers_academy_teacher_ajax' => array('action' => 'ListTeacher')),
            "enabled" => true,
        ), 
        
      
         "210_customer_academy_teachers.sessions.admin"=>array(
                         "title"=>"Teacher connections",
                         "icon_awe" => "fa-users",
                       //  "credentials"=>array(array('superadmin','admin','settings_user')),
                         "route_ajax"=>array('customers_academy_teacher_ajax'=>array('action'=>'ListSession')),
                         "enabled"=>true,
                     ),  
        
        
          
    ),


);
