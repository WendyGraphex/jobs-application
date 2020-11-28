<?php
// List of dirs to parse file class and define class
return array("autoload" => array(
    "core" => array("path" => mfConfig::get('mf_internal_lib_dir')),
    //   "external_elfinder" =>array("path"=>mfConfig::get('mf_external_lib_dir')."/elfinder"),
    "framework_app" => array("path" => mfConfig::get('mf_app_framework_dir')),
    "framework_common" => array("path" => mfConfig::get('mf_framework_common_dir')),
    "modules_app" => array("path" => mfConfig::get('mf_modules_dir') . "/" . mfConfig::get('mf_app') . "/lib"),
    "modules_common" => array("path" => mfConfig::get('mf_modules_dir') . "/*/common/lib"),
    "modules_lib" => array("path" => mfConfig::get('mf_modules_dir') . "/*/" . mfConfig::get('mf_app') . "/lib"),
),
);
