<?php

return array(
    
       "all"=>array(
                     "logger"=>array("class"=>"mfLogger"),
                     "databaseManager"=>array("class"=>"mfDatabaseManager","options"=>array('json'=>true)),
                     "request"=>array("class"=>"mfWebRequest"),
                     "actionStack"=>array("class"=>"mfActionStack"),
                     "componentStack"=>array("class"=>"mfComponentStack"),
    
              )
);