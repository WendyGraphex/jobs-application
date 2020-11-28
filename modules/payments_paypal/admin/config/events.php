<?php

return array(

    "payment.settings.form" => array(
        "payments_paypal"=>array("PaymentPaypalEvents","setPaymentSettingsForForm"),
    ),

   'payment.settings.update' => array(
        "payments_paypal"=>array("PaymentPaypalEvents","setPaymentSettingsUpdate"),
    ),

);
