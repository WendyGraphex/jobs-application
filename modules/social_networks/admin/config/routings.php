<?php

return array(
    "social_networks_list"=>array("pattern"=>'/social-networks/admin',"module"=>"social_networks","action"=>"ListSocial"),
    "social_networks_ajax"=>array("pattern"=>'/module/social-networks/admin/{action}',"module"=>"social_networks","action"=>"ajax{action}","requirements"=>array("action"=>".*")),
);

