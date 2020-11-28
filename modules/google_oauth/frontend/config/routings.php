<?php
return array(
    

     "google_oauth_callback_employee"=>array("pattern"=>'/google/oauth/callback/employee',
                            "module"=>"google_oauth",
                            "action"=>"callbackEmployee",
                            ),
    
     "google_oauth_callback_employer"=>array("pattern"=>'/google/oauth/callback/employer',
                            "module"=>"google_oauth",
                            "action"=>"callbackEmployer",
                            ),
    
     "google_oauth_callback_student"=>array("pattern"=>'/google/oauth/callback/student',
                            "module"=>"google_oauth",
                            "action"=>"callbackStudent",
                            ),
    
     "google_oauth_callback_teacher"=>array("pattern"=>'/google/oauth/callback/teacher',
                            "module"=>"google_oauth",
                            "action"=>"callbackTeacher",
                            ),
    
     "google_oauth_callback_event_user"=>array("pattern"=>'/google/oauth/callback/eventuser',
                            "module"=>"google_oauth",
                            "action"=>"callbackEventUser",
                            ),
    
    
      "google_oauth_callback_employee_want_a_job"=>array("pattern"=>'/google/oauth/callback/employee/want-a-job',
                            "module"=>"google_oauth",
                            "action"=>"callbackEmployeeWantAJob",
                            ),
    
     "google_oauth_callback_employer_post_a_job"=>array("pattern"=>'/google/oauth/callback/employer/post-a-job',
                            "module"=>"google_oauth",
                            "action"=>"callbackEmployerPostAJob",
                            ),

);