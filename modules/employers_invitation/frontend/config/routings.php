<?php

return array(   
   
    
"employers_invitation_ajax"=>array("pattern"=>'/module/employers/invitation/admin/{action}',
                            "module"=>"employers_invitation",
                            "action"=>"ajax{action}",
                            "requirements"=>array("action"=>".*")),
   
   
 "employers_invitation_invitation"=>array("pattern"=>'/employer/invitation',
                            "module"=>"employers_invitation",
                            "action"=>"invitation",
                            "requirements"=>array("action"=>".*")),
   
);
