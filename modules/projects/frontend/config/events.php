<?php

return array(

  
    "employee.works.created"=> array(
        "projects"=>array("ProjectEvents","setCreateProjects"),
    ),
    
    "employee.work.request.accepted"=> array(
        "projects"=>array("ProjectEvents","checkIfProjectHasToBeClosed"),
    ),
);
