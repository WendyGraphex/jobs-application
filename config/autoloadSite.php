<?php
// List of dirs to parse file class and define class
return array("autoload" => array(
    "site" => array("path" => mfConfig::get('mf_site_dir') . "/lib"),
    "site_common_app" => array("path" => mfConfig::get('mf_site_dir') . "/common/lib"),
    "site_app" => array("path" => mfConfig::get('mf_site_dir') . "/" . mfConfig::get('mf_app') . "/lib"),
    "modules_site_common_lib" => array("path" => mfConfig::get('mf_site_dir') . "/modules/*/common/lib"),
    "modules_site_app_lib" => array("path" => mfConfig::get('mf_site_dir') . "/modules/*/" . mfConfig::get('mf_app') . "/lib"),
),
);
