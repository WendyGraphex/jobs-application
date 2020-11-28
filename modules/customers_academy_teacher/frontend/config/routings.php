<?php

return array(
    
     
  "customers_academy_teacher_ajax"=>array("pattern"=>'/module/academy/teacher/{action}',"module"=>"customers_academy_teacher","action"=>"ajax{action}","requirements"=>array("action"=>".*")),   
    
  "customers_academy_teacher_signin"=>array("pattern"=>"/academy/teacher/user/signin",
                               "module"=>"customers_academy_teacher",
                               "action"=>"signin"),
    
    "customers_academy_teacher_forgot_password"=>array("pattern"=>"/academy/teacher/account/forgot-password","module"=>"customers_academy_teacher","action"=>"forgotPassword"),
    
    "customers_academy_teacher_forgot_password_confirm"=>array("pattern"=>"/academy/teacher/account/forgotPassword/Confirm","module"=>"customers_academy_teacher","action"=>"forgotPasswordConfirm"),
      
    "customers_academy_teacher_forgot_password_change"=>array("pattern"=>"/academy/teacher/account/forgot-password/Change","module"=>"customers_academy_teacher","action"=>"forgotPasswordChange"),
   
    
    "customers_academy_teacher_account"=>array("pattern"=>'/academy/teacher/account',
                            "module"=>"customers_academy_teacher",
                            "action"=>"account",
                            ),
    
     "customers_academy_teacher_account_created"=>array("pattern"=>'/academy/teacher/account/created',
                            "module"=>"customers_academy_teacher",
                            "action"=>"accountCreated",
                            ),       
    
    "customers_academy_teacher_logout"=>array("pattern"=>'/academy/teacher/logout',
                            "module"=>"customers_academy_teacher",
                            "action"=>"logout",
                            ),
    
     "customers_academy_teacher_login"=>array("pattern"=>'/academy/teacher/login',
                            "module"=>"customers_academy_teacher",
                            "action"=>"login",
                            ),    
    
     
   
  "customers_academy_teacher_validate_email"=>array("pattern"=>"/academy/teacher/account/validate",
                            "module"=>"customers_academy_teacher",
                            "action"=>"validateEmail"),
);

