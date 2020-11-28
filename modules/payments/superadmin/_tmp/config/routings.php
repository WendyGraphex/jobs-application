<?php

return array(    
    "payments_ajax_payments"=>array("pattern"=>'/module/payments/admin/{action}',"module"=>"payments","action"=>"ajax{action}","requirements"=>array("action"=>".*")),
    "payments_ajax_payment"=>array("pattern"=>'/module/payments/{payment}/admin/{action}',
                            "requirements"=>array("payment"=>".*","action"=>".*"),
                            "module"=>"payments","action"=>"ajax{action}",
                            "parameters"=>array("payment"=>"{payment}")),   
);

