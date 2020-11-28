<?php

return array(
    

    "sales_order_ajax"=>array("pattern"=>'/module/sales/orders/admin/{action}',
                            "module"=>"sales_order",
                            "action"=>"ajax{action}",
                            "requirements"=>array("action"=>".*")),
    "sales_order"=>array("pattern"=>'/sales/orders/admin/{action}',
                            "module"=>"sales_order",
                            "action"=>"{action}",
                            "requirements"=>array("action"=>".*")),
   
   
);

