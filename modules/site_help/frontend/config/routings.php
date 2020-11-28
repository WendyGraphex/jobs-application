<?php


 
return array(
        
     "site_help_ajax"=>array("pattern"=>'/module/site/help/admin/{action}',"module"=>"site_help","action"=>"ajax{action}","requirements"=>array("action"=>".*")),
           
     "site_help_ajax_text"=>array("pattern"=>'/module/site/helps/{name}',
                                  "module"=>"site_help",
                                  "action"=>"ajaxHelp",
                                  "requirements"=>array("name"=>".*"),
                                  "parameters"=>array('name'=>'{name}')
                    ),
       
  );
 