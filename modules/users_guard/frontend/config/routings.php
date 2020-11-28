<?php

return array(    
    "users_guard_customers_signin"=>array(
      "pattern"=>'/customers/signin',
      "module"=>"users_guard",
      "action"=>"customersSignin"),
    "users_guard_login"=>array(
      "pattern"=>'/login',
      "module"=>"users_guard",
      "action"=>"login"),
    "users_guard_ajax"=>array(
      "pattern"=>'/module/users/guard/admin/{action}',
      "module"=>"users_guard",
      "action"=>"ajax{action}",
      "requirements"=>array("action"=>".*")),
    "users_guard_mobile"=>array(
      "pattern"=>'/mobile/users/guard/admin/{action}',
      "module"=>"users_guard",
      "action"=>"{action}ForMobile",
      "requirements"=>array("action"=>".*")),
);
