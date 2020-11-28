<?php

return array(
  "items"=>array(   
                "site_customers"=>array(
                     // "site_admin_customers" to be sure that well positionned
                     "childs"=>array("site_admin_customers"=>'',"site_newsletter"=>''),
                 ),          
      
// CHILDS 
                "site_newsletter"=>array(
                     "title"=>"newsletter",
                     "url"=>"/customers/newsletter",
                     "urlAjax"=>"/module/customers/newsletter/List",
                     "picture"=>"/pictures/icons/newsletter.png",
                     "enabled"=>true,
                     "icon_awe"=>"fa-newspaper-o",
                     "module"=>"customer_newsletter",
                 ),      
   ),   
);