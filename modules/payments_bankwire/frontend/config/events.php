<?php

return array(

    "payment.employee.settings.form" => array(
        "payments_bankwire"=>array("PaymentBankwireEvents","setEmployeeSettingsForForm"),
    ),
   
    'payment.employee.settings.load' => array(
        "payments_bankwire"=>array("PaymentBankwireEvents","setEmployeeSettingsLoad"),
    ),

);
