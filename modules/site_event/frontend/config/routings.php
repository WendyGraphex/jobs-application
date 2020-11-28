<?php

return array(
    
  "site_event_events"=>array("pattern"=>'/events',"module"=>"site_event","action"=>"events"),
    
  "site_event_calendar"=>array("pattern"=>'/events/calendar',"module"=>"site_event","action"=>"calendar"),
    
  "site_event_ajax"=>array("pattern"=>'/module/event/{action}',"module"=>"site_event","action"=>"ajax{action}","requirements"=>array("action"=>".*")),   
    
  "site_event_user_signin"=>array("pattern"=>"/event/user/signin",
                               "module"=>"site_event",
                               "action"=>"signin"),
    
    "site_event_user_forgot_password"=>array("pattern"=>"/event/user/account/forgot-password","module"=>"site_event","action"=>"forgotPassword"),
    
    "site_event_user_forgot_password_confirm"=>array("pattern"=>"/event/user/account/forgotPassword/Confirm","module"=>"site_event","action"=>"forgotPasswordConfirm"),
      
    "site_event_user_forgot_password_change"=>array("pattern"=>"/event/user/account/forgot-password/Change","module"=>"site_event","action"=>"forgotPasswordChange"),
   
    
    "site_event_user_account"=>array("pattern"=>'/event/user/account',
                            "module"=>"site_event",
                            "action"=>"account",
                            ),
    
     "site_event_user_account_created"=>array("pattern"=>'/event/user/account/created',
                            "module"=>"site_event",
                            "action"=>"accountCreated",
                            ),       
    
    "site_event_user_logout"=>array("pattern"=>'/event/user/logout',
                            "module"=>"site_event",
                            "action"=>"logout",
                            ),
    
     "site_event_user_login"=>array("pattern"=>'/event/user/login',
                            "module"=>"site_event",
                            "action"=>"login",
                            ),    
    
     
   
  "site_event_user_validate_email"=>array("pattern"=>"/event/user/account/validate",
                            "module"=>"site_event",
                            "action"=>"validateEmail"),
    
    
     
     "site_event_event"=>array("pattern"=>'/event/{url}.html',
                            "module"=>"site_event",
                            "action"=>"event", 
                             "parameters"=>array('url'=>"{url}"),
                            "requirements"=>array("url"=>".*")
                         ),
);

