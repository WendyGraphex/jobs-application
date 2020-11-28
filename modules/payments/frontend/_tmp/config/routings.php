<?php

return array(
    "payments_cart"=>array("pattern"=>'/my_shopping_cart/payment',"module"=>"payments","action"=>"listpayments"),     
    "payments_response"=>array("pattern"=>'/payment/{module}/{action}',
                            "requirements"=>array("module"=>".*","action"=>"Cancelled|Declined|Exception|Accepted"),
                            "module"=>"payments_{module}","action"=>"{action}payment"),   
);

