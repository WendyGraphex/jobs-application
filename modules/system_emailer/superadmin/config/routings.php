<?php

return array(   
    "system_emailer"=>array("pattern"=>'/system/emailer/admin/{action}',"module"=>"system_emailer","action"=>"{action}","requirements"=>array("action"=>".*")),
    "system_emailer_ajax"=>array("pattern"=>'/module/system/emailer/admin/{action}',"module"=>"system_emailer","action"=>"ajax{action}","requirements"=>array("action"=>".*")),
);

