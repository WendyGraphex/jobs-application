<?php


return array(

    "customers_academy_teacher_ajax" => array("pattern" => '/module/academy/teacher/admin/{action}', 
                               "module" => "customers_academy_teacher", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    
);