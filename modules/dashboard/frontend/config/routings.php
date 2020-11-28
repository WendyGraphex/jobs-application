<?php

return array(
    

    "dashboard_ajax"=>array("pattern"=>'/module/dashboard/admin/{action}',
                            "module"=>"dashboard",
                            "action"=>"ajax{action}",
                            "requirements"=>array("action"=>".*")),

);

