<?php


return array(

    "menu"=>array(                   
                    "academy_student.user.dashboard"=>array(                                          
                        "childs"=>array(            
                                                                                                          
                                "100_academy_student_my_courses"=>null,
                                "200_academy_student_my_billings"=>null, 
                            
                            ),                     
                    ),  
        
                  
     ),
       
    "items"=>array(
                                   
       
           "100_academy_student_my_courses"=>array(
                     "title"=>"My Courses", 
                     "mdi"=>"mdi-view-list",
                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('customers_academy_student_ajax'=>array('action'=>'ListCourse')),
                     "enabled"=>true,                                  
           ), 
         
        
           "200_academy_student_my_billings"=>array(
                     "title"=>"My Billings", 
                     "mdi"=>"mdi-view-list",
                   
                   //  "credentials"=>array(array('superadmin','admin','settings_user')),
                     "route_ajax"=>array('customers_academy_student_ajax'=>array('action'=>'ListBilling')),
                     "enabled"=>true,                                  
                 ), 
  ),
);