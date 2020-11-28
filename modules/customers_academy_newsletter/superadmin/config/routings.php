<?php

return array(
    "newsletter_list"=>array("pattern"=>'/customers/newsletter',"module"=>"customers_academy_newsletter","action"=>"list"),
    "newsletter_export"=>array("pattern"=>'/customers/newsletter/export',"module"=>"customers_academy_newsletter","action"=>"export"),
    "newsletter_ajax"=>array("pattern"=>'/module/customers/newsletter/{action}',"module"=>"customers_academy_newsletter","action"=>"ajax{action}","requirements"=>array("action"=>".*")),
);

/*
return array(
            "newsletter_list"=>array("pattern"=>'#^/customers/newsletter$#',"module"=>"customer_newsletter","action"=>"list"),
            "newsletter_export"=>array("pattern"=>'#^/customers/newsletter/export$#',"module"=>"customer_newsletter","action"=>"export"),
            "newsletter_ajax"=>array("pattern"=>'#^/module/customers/newsletter/(.*)?$#',"module"=>"customer_newsletter","action"=>"ajax\\1"),

  );
 */