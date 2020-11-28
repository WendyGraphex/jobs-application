<?php

return array(   
    
    "facebook_oauth_callback_employee"=>array("pattern"=>'/facebook/oauth/callback/employee',
                            "module"=>"facebook_oauth",
                            "action"=>"callbackEmployee",
                          ),
    
     "facebook_oauth_callback_employer"=>array("pattern"=>'/facebook/oauth/callback/employer',
                            "module"=>"facebook_oauth",
                            "action"=>"callbackEmployer",
                          ),
    
       "facebook_oauth_callback_student"=>array("pattern"=>'/facebook/oauth/callback/student',
                            "action"=>"callbackStudent",
                          ),
    
       "facebook_oauth_callback_teacher"=>array("pattern"=>'/facebook/oauth/callback/teacher',
                            "action"=>"callbackTeacher",
                          ),
    
      "facebook_oauth_callback_event_user"=>array("pattern"=>'/facebook/oauth/callback/eventuser',
                            "action"=>"callbackEventUser",
                          ),
     
     "facebook_oauth_callback_employee_want_a_job"=>array("pattern"=>'/facebook/oauth/callback/employee/want-a-job',
                            "module"=>"facebook_oauth",
                            "action"=>"callbackEmployeeWantAJob",
                          ),
    
     "facebook_oauth_callback_employer_post_a_job"=>array("pattern"=>'/facebook/oauth/callback/employer/post-a-job',
                            "module"=>"facebook_oauth",
                            "action"=>"callbackEmployerPostAJob",
                          ),
);
