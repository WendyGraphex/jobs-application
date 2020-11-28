<?php

return array(
    

    "employees_contact_ajax"=>array("pattern"=>'/module/employee/contact/admin/{action}',
                            "module"=>"employees_contact",
                            "action"=>"ajax{action}",
                            "requirements"=>array("action"=>".*")),
   
   "employees_contact"=>array("pattern"=>"/employee/contact",
                            "module"=>"employees_contact",
                            "action"=>"contact"),        
);

