<?php


return array(

    "customers_academy_student_ajax" => array("pattern" => '/module/academy/student/admin/{action}', 
                               "module" => "customers_academy_student", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

    
);