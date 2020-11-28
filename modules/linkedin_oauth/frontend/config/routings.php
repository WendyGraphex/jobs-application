<?php
return array(
    

     "linkedin_oauth_callback_employee"=>array("pattern"=>'/linkedin/oauth/callback/employee',
                            "module"=>"linkedin_oauth",
                            "action"=>"callbackEmployee",
                            ),
    
     "linkedin_oauth_callback_employer"=>array("pattern"=>'/linkedin/oauth/callback/employer',
                            "module"=>"linkedin_oauth",
                            "action"=>"callbackEmployer",
                            ),
    
    "linkedin_oauth_callback_student"=>array("pattern"=>'/linkedin/oauth/callback/student',
                            "module"=>"linkedin_oauth",
                            "action"=>"callbackStudent",
                            ),
    
    "linkedin_oauth_callback_teacher"=>array("pattern"=>'/linkedin/oauth/callback/teacher',
                            "module"=>"linkedin_oauth",
                            "action"=>"callbackTeacher",
                            ),
    
    "linkedin_oauth_callback_event_user"=>array("pattern"=>'/linkedin/oauth/callback/eventuser',
                            "module"=>"linkedin_oauth",
                            "action"=>"callbackEventUser",
                            ),

);