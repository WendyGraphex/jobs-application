<?php


 
return array(
        
     "site_warning_ajax"=>array("pattern"=>'/module/site/warning/admin/{action}',"module"=>"site_warning","action"=>"ajax{action}","requirements"=>array("action"=>".*")),
           
     "site_warning_ajax_text"=>array("pattern"=>'/module/site/warnings/{name}',
                                  "module"=>"site_warning",
                                  "action"=>"ajaxWarning",
                                  "requirements"=>array("name"=>".*"),
                                  "parameters"=>array('name'=>'{name}')
                    ),
       
  );
 