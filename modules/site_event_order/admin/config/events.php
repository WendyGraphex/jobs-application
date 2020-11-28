<?php

return array(

    "site.settings.form" => array(
        "site_event_order"=>array("SiteEventOrderEvents","SetSettingsForForm"),
    ),

    "payment.event.accepted"=> array(
        "site_event_order"=>array("SiteEventOrderEvents","setOrderPaid"),
    ),
);
