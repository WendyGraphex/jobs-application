<?php


return array(

    "menu"=>array(                   
                    "academy_teacher.user.dashboard"=>array(                                          
                        "childs"=>array(            
                                                                                                          
                                "100_academy_teacher_my_courses"=>null,
                                "200_academy_teacher_my_payments"=>null, 
                            
                            ),                     
                    ),  
        
                  
     ),
       
    "items"=>array(
                                   
       
           "100_academy_teacher_my_courses"=>array(
                     "title"=>"My Courses", 
                     "mdi"=>"mdi-view-list",
                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('customers_academy_teacher_ajax'=>array('action'=>'ListCourse')),
                     "enabled"=>true,                                  
           ), 
         
        
           "200_academy_teacher_my_payments"=>array(
                     "title"=>"My Payments", 
                     "mdi"=>"mdi-view-list",
                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('customers_academy_teacher_ajax'=>array('action'=>'ListPayment')),
                     "enabled"=>true,                                  
                 ), 
  ),
);