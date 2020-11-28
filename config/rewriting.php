<?php
//  URL /application/web/ => URL pattern /
return array(
    //"rule_common"=>array("pattern"=>'#^/module/common/([^/]*)/(.*)?$#',"file"=>"/modules/\\1/common/view/\\2"),
    //"rule_app"=>array("pattern"=>'#^/module/([^/]*)/(.*)?$#',"file"=>"/modules/\\1/".mfConfig::get('mf_app')."/view/\\2"),
    "rule_app" => array("pattern" => '#^/module/([^/]*)/(.*)?$#', "files" =>
        array(
            "site_common_path" => "/sites/" . mfConfig::get('mf_site_db_name') . "/modules/\\1/common/view/\\2",
            "site_app_path" => "/sites/" . mfConfig::get('mf_site_db_name') . "/modules/\\1/" . mfConfig::get('mf_app') . "/view/\\2",
            "common_path" => "/modules/\\1/common/view/\\2",
            "app_path" => "/modules/\\1/" . mfConfig::get('mf_app') . "/view/\\2"
        ),
    ),
    "rule_nocache" => array("pattern" => "#^/nocache/(.*)$#", "cache" => false, "path" => "/\\1"),
    //  "rule_all_log"=>array("pattern"=>'#^/log/(.*)?$#',"file"=>"/log/\\1"),

);

