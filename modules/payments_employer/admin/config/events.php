<?php

return array(

    "payment.accepted"=> array(
        "payments_employer"=>array("PaymentEmployerEvents","setPaymentAccepted"),
    ),
   
        "site.email.settings.form" => array(
        "payments_employer"=>array("PaymentEmployerEvents","SetEmailSettingsForForm"),
    ),
);
