<?php

return array(
    
    // Tous les jours toutes les 1 mns
        
     "sales_quotation_employer_request_generator_revival_cron"=>array(
        "title"=>"Employer Request Revivals Generator cron.",
        "minutes"=>"*",
        "hours"=>"*",
        "days"=>"*",
        "months"=>"*",
        "weekdays"=>"*",
        "task"=>"/sales_quotation/generateRequestRevivals",
        "is_active"=>"NO"
    )
   
);