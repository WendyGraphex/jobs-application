<?php

return array(
    
    // Tous les jours toutes les 1 mns
        
     "employer_revival_generator_cron"=>array(
        "title"=>"Employer Advert Revivals Generator cron.",
        "minutes"=>"*",
        "hours"=>"*",
        "days"=>"*",
        "months"=>"*",
        "weekdays"=>"*",
        "task"=>"/employers/generateRevivals",
        "is_active"=>"NO"
    )
   
);