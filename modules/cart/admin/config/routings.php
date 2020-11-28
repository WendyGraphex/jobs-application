<?php


return array(

    "cart_ajax" => array("pattern" => '/module/carts/admin/{action}', 
                               "module" => "cart", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

);
