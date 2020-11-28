<?php
return array(
    

     "instagram_oauth_callback_employee"=>array("pattern"=>'/instagram/oauth/callback/employee',
                            "module"=>"instagram_oauth",
                            "action"=>"callbackEmployee",
                            ),
    
     "instagram_oauth_callback_employer"=>array("pattern"=>'/instagram/oauth/callback/employer',
                            "module"=>"instagram_oauth",
                            "action"=>"callbackEmployer",
                            ),
      "instagram_oauth_callback_student"=>array("pattern"=>'/instagram/oauth/callback/student',
                            "module"=>"instagram_oauth",
                            "action"=>"callbackStudent",
                            ),
     "instagram_oauth_callback_teacher"=>array("pattern"=>'/instagram/oauth/callback/teacher',
                            "module"=>"instagram_oauth",
                            "action"=>"callbackTeacher",
                            ),
     "instagram_oauth_callback_event_user"=>array("pattern"=>'/instagram/oauth/callback/eventuser',
                            "module"=>"instagram_oauth",
                            "action"=>"callbackEventUser",
                            ),
    
    
     "instagram_oauth_callback_employee_want_a_job"=>array("pattern"=>'/instagram/oauth/callback/employee/want-a-job',
                            "module"=>"instagram_oauth",
                            "action"=>"callbackEmployeeWantAJob",
                            ),
    
     "instagram_oauth_callback_employer_post_a_job"=>array("pattern"=>'/instagram/oauth/callback/employer/post-a-job',
                            "module"=>"instagram_oauth",
                            "action"=>"callbackEmployerPostAJob",
                            ),
  
);