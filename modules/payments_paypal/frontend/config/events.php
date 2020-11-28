<?php

return array(

    "payment.employee.settings.form" => array(
        "payments_paypal"=>array("PaymentPaypalEvents","setEmployeeSettingsForForm"),
    ),
   
    'payment.employee.settings.load' => array(
        "payments_paypal"=>array("PaymentPaypalEvents","setEmployeeSettingsLoad"),
    ),

);
