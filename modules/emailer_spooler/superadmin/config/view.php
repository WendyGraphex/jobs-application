<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,"banner"=>null),
                          ),
     
        
       "ajaxSettings"=>array(
            'blocks'=>array('JqueryScriptsReady'=>null),      
      ),
     
       'ajaxListEmail'=>array(                  
                            'blocks'=>array('JqueryScriptsReady'=>null),      
                          'helpers'=>array("date"=>null),
                          'security'=>array(
                                "php_functions"=>array(
                                                   "format_date"=>null,                                                       
                                                ),
                           ), 
      ),
     
       'ajaxListPartialEmail'=>array(      
                            'blocks'=>array('JqueryScriptsReady'=>null),      
                          'helpers'=>array("date"=>null),
                          'security'=>array(
                                "php_functions"=>array(
                                                   "format_date"=>null,                                                       
                                                ),
                           ), 
      ),
 ); 
 
