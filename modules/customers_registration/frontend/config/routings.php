<?php

return array(   
   
    
"customers_registration_ajax"=>array("pattern"=>'/module/customers/registration/admin/{action}',
                            "module"=>"customers_registration",
                            "action"=>"ajax{action}",
                            "requirements"=>array("action"=>".*")),
   

    "customers_registration_register"=>array("pattern"=>'/registration',
                            "module"=>"customers_registration",
                            "action"=>"register",
                            "requirements"=>array("action"=>".*")),
);
