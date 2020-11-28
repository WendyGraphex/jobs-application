<?php

return array(
       "site_elfinder_connector"=>array("pattern"=>'/module/elfinder/connector',"module"=>"site_elfinder","action"=>"connector"),
       "site_elfinder_file_manager"=>array("pattern"=>'/site/filemanager',"module"=>"site_elfinder","action"=>"FileManager"),
       "site_elfinder_ajax_file_manager"=>array("pattern"=>'/module/site/filemanager/{action}',"module"=>"site_elfinder","action"=>"ajaxFileManager{action}","requirements"=>array("action"=>".*")),
       
  );
