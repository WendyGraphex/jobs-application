<?php

return array(
    
    // Tous les jours toutes les 1 mns
    "employee_work_email_generator_cron"=>array(
        "title"=>"Employee Work Emails Generator cron.",
        "minutes"=>"*",
        "hours"=>"*",
        "days"=>"*",
        "months"=>"*",
        "weekdays"=>"*",
        "task"=>"/employees_work/generateEmails",
        "is_active"=>"NO"
    ),
    
     "employee_work_request_generator_cron"=>array(
        "title"=>"Employee Work Requests Generator cron.",
        "minutes"=>"*",
        "hours"=>"*",
        "days"=>"*",
        "months"=>"*",
        "weekdays"=>"*",
        "task"=>"/employees_work/generateRequests",
        "is_active"=>"NO"
    )
   
);