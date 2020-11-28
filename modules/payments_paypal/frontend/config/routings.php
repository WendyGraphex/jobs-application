<?php


return array(

    "payments_paypal_ajax" => array("pattern" => '/module/payments/paypal/admin/{action}', 
                               "module" => "payments_paypal", 
                               "action" => "ajax{action}", 
                               "requirements" => array("action" => ".*")),

  /*   "payments_paypal_cancel" => array("pattern" => '/payments/paypal/cancel', 
                               "module" => "payments_paypal", 
                               "action" => "Cancel", 
                                ),
    
     "payments_paypal_success" => array("pattern" => '/payments/paypal/success', 
                               "module" => "payments_paypal", 
                               "action" => "Success", 
                                ), */
    
     "payments_paypal_return" => array("pattern" => '/payments/paypal/return', 
                               "module" => "payments_paypal", 
                               "action" => "AutomaticResponse", 
                                ),
    
     "payments_paypal_test" => array("pattern" => '/paypal/test', 
                               "module" => "payments_paypal", 
                               "action" => "proceed", 
                               "requirements" => array("action" => ".*")),
);