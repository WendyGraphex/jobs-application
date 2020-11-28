<?php

return array(

    "site.settings.form" => array(
        "projects"=>array("ProjectEvents","setSettingsForForm"),
    ),

    "employee.works.created"=> array(
        "projects"=>array("ProjectEvents","setCreateProjects"),
    ),
    
      "site.email.settings.form" => array(
        "projects"=>array("ProjectEvents","SetEmailSettingsForForm"),
    ),

);
