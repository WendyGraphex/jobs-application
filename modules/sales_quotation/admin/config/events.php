<?php

return array(

    "site.settings.form" => array(
        "sales_quotation"=>array("SaleQuotationEvents","SetSettingsForForm"),
    ),

    "payment.accepted"=> array(
        "sales_quotation"=>array("SaleQuotationEvents","setQuotationPaid"),
    ),
    
      "site.email.settings.form" => array(
        "sales_quotation"=>array("SaleQuotationEvents","SetEmailSettingsForForm"),
    ),
);
