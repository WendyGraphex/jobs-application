<?php

return array(

  
    "payment.accepted"=> array(
        "employees_work"=>array("EmployeeWorkEvents","setCreateWorks"),
    ),
    
    "project.finished"=> array(
        "employees_work"=>array("EmployeeWorkEvents","setProjectFinished"),
    ),
);
