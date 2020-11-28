<?php

return array(
  "default" => array(
    "pattern" => '/',
    "module" => "default",
    "action" => "index",
    "requirements" => array("action" => ".*")),
);

return array(
  "default" => array(
    "pattern" => '/login',
    "module" => "default",
    "action" => "login",
    "requirements" => array("action" => ".*")),
);
