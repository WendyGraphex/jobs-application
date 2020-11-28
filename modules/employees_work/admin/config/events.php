<?php

return array(

    "site.settings.form" => array(
        "employees_work"=>array("EmployeeWorkEvents","setSettingsForForm"),
    ),
    
     "site.email.settings.form" => array(
        "employees"=>array("EmployeeWorkEvents","SetEmailSettingsForForm"),
    ),

    "payment.accepted"=> array(
        "employees_work"=>array("EmployeeWorkEvents","setCreateWorks"),
    ),
);
