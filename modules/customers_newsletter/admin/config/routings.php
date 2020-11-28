<?php

return array(
    "customers_newsletter_list"=>array("pattern"=>'/customers/newsletter',"module"=>"customers_newsletter","action"=>"list"),
    "customers_newsletter_export"=>array("pattern"=>'/customers/newsletter/export',"module"=>"customers_newsletter","action"=>"export"),
    "customers_newsletter_ajax"=>array("pattern"=>'/module/customers/newsletter/{action}',"module"=>"customers_newsletter","action"=>"ajax{action}","requirements"=>array("action"=>".*")),
);
