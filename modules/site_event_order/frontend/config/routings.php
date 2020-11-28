<?php

return array(
    

    "site_event_order_ajax"=>array("pattern"=>'/module/events/orders/admin/{action}',
                            "module"=>"site_event_order",
                            "action"=>"ajax{action}",
                            "requirements"=>array("action"=>".*")),
    "site_event_order"=>array("pattern"=>'/events/orders/admin/{action}',
                            "module"=>"site_event_order",
                            "action"=>"{action}",
                            "requirements"=>array("action"=>".*")),
   
     "site_event_order_sale_conditions" => array("pattern" => '/events/sales-conditions', 
                               "module" => "site_event_order", 
                               "action" => "conditions", 
                               "requirements" => array("action" => ".*")),
);

