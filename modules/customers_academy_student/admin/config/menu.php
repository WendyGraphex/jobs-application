<?php

return array(

    "items" => array(

         "7900_customer_academy_admin" => array(           
            "childs" => array(      
                  "100_customer_academy_students_admin" =>null,       
                "110_customer_academy_students.sessions.admin"=>null,
                ),         
        ),                
        
         
          "100_customer_academy_students_admin" => array(
            "title" => "Students",            
            //  "credentials"=>array(array('superadmin','admin','settings_user')),
            "route_ajax" => array('customers_academy_student_ajax' => array('action' => 'ListStudent')),
            "enabled" => true,
        ), 
         
        
          "110_customer_academy_students.sessions.admin"=>array(
                         "title"=>"Student connections",
                         "icon_awe" => "fa-users",
                       //  "credentials"=>array(array('superadmin','admin','settings_user')),
                         "route_ajax"=>array('customers_academy_student_ajax'=>array('action'=>'ListSession')),
                         "enabled"=>true,
                     ),  
        
          
    ),


);
