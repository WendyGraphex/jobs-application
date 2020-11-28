<?php

return array('all'=>array('classView'=>'SmartyView',
                           'widgets'=>array('messages'=>null),                             
                          ),
            
    "ajaxListPartialRequest"=>array(
        "helpers"=>array('degree'=>null,'date'=>null),
              'security'=>array(
                                                     "php_functions"=>array(
                                                         "format_date"=>null),),   
    ),
    
    "ajaxListRequest"=>array(
        "helpers"=>array('degree'=>null,'date'=>null),
        'security'=>array(
                                                     "php_functions"=>array(
                                                         "format_date"=>null),),   
    ),
); 
 
