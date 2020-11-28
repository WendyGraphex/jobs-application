<?php

return array(
    
     
  "customers_academy_student_ajax"=>array("pattern"=>'/module/academy/student/{action}',"module"=>"customers_academy_student","action"=>"ajax{action}","requirements"=>array("action"=>".*")),   
    
  "customers_academy_student_signin"=>array("pattern"=>"/academy/student/user/signin",
                               "module"=>"customers_academy_student",
                               "action"=>"signin"),
    
    "customers_academy_student_forgot_password"=>array("pattern"=>"/academy/student/account/forgot-password","module"=>"customers_academy_student","action"=>"forgotPassword"),
    
    "customers_academy_student_forgot_password_confirm"=>array("pattern"=>"/academy/student/account/forgotPassword/Confirm","module"=>"customers_academy_student","action"=>"forgotPasswordConfirm"),
      
    "customers_academy_student_forgot_password_change"=>array("pattern"=>"/academy/student/account/forgot-password/Change","module"=>"customers_academy_student","action"=>"forgotPasswordChange"),
   
    
    "customers_academy_student_account"=>array("pattern"=>'/academy/student/account',
                            "module"=>"customers_academy_student",
                            "action"=>"account",
                            ),
    
     "customers_academy_student_account_created"=>array("pattern"=>'/academy/student/account/created',
                            "module"=>"customers_academy_student",
                            "action"=>"accountCreated",
                            ),       
    
    "customers_academy_student_logout"=>array("pattern"=>'/academy/student/logout',
                            "module"=>"customers_academy_student",
                            "action"=>"logout",
                            ),
    
     "customers_academy_student_login"=>array("pattern"=>'/academy/student/login',
                            "module"=>"customers_academy_student",
                            "action"=>"login",
                            ),    
    
     
   
  "customers_academy_student_validate_email"=>array("pattern"=>"/academy/student/account/validate",
                            "module"=>"customers_academy_student",
                            "action"=>"validateEmail"),
);

