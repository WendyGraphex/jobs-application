<?php

return array(
    "customers_academy_newsletter_list"=>array("pattern"=>'/customers/academy/newsletter',"module"=>"customers_academy_newsletter","action"=>"list"),
    "customers_academy_newsletter_export"=>array("pattern"=>'/customers/academy/newsletter/export',"module"=>"customers_academy_newsletter","action"=>"export"),
    "customers_academy_newsletter_ajax"=>array("pattern"=>'/module/customers/academy/newsletter/{action}',"module"=>"customers_academy_newsletter","action"=>"ajax{action}","requirements"=>array("action"=>".*")),
);
