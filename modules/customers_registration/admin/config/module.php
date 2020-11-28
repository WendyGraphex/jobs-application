<?php

// key=[action]
return array(
    
      "ExportCsv"=>array("mode"=>"none","helpers"=>array('date'=>null,'number'=>null)),
    
    "ajaxDeleteRegistration"=>array("mode"=>"none","helpers"=>array('date'=>null,'number'=>null)),
  
     "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);