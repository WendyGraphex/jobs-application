<?php

return array(   
   
    
"employees_invitation_ajax"=>array("pattern"=>'/module/freelancers/invitation/admin/{action}',
                            "module"=>"employees_invitation",
                            "action"=>"ajax{action}",
                            "requirements"=>array("action"=>".*")),
   
 "employees_invitation_invitation"=>array("pattern"=>'/freelancer/invitation',
                            "module"=>"employees_invitation",
                            "action"=>"invitation",
                            "requirements"=>array("action"=>".*")),
   
);
