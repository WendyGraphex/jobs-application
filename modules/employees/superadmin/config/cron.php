<?php

return array(
    
    // Tous les jours toutes les 1 mns
        
     "employee_revival_generator_cron"=>array(
        "title"=>"Employee Advert Revivals Generator cron.",
        "minutes"=>"*",
        "hours"=>"*",
        "days"=>"*",
        "months"=>"*",
        "weekdays"=>"*",
        "task"=>"/employees/generateRevivals",
        "is_active"=>"NO"
    )
   
);