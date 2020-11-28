<?php

return array(
    
    // Tous les jours toutes les 1 mns
    "emailer_spooler_cron"=>array(
        "title"=>"Emailer spooler cron.",
        "minutes"=>"*",
        "hours"=>"*",
        "days"=>"*",
        "months"=>"*",
        "weekdays"=>"*",
        "task"=>"/emailer_spooler/update",
        "is_active"=>"NO"
    )
   
);