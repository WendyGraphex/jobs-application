<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,"banner"=>null),
                          ),
     
       'ajaxListEmail'=>array(                         
                          'helpers'=>array("date"=>null),
                          'security'=>array(
                                "php_functions"=>array(
                                                   "format_date"=>null,                                                       
                                                ),
                           ), 
      ),
     
       'ajaxListPartialEmail'=>array(                         
                          'helpers'=>array("date"=>null),
                          'security'=>array(
                                "php_functions"=>array(
                                                   "format_date"=>null,                                                       
                                                ),
                           ), 
      ),
 ); 
 
