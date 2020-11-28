<?php

return array(
    

    "employers_contact_ajax"=>array("pattern"=>'/module/employer/contact/admin/{action}',
                            "module"=>"employers_contact",
                            "action"=>"ajax{action}",
                            "requirements"=>array("action"=>".*")),
   
     "employers_contact"=>array("pattern"=>"/employer/contact",
                            "module"=>"employers_contact",
                            "action"=>"contact"),
);

