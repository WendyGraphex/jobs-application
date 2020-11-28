<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
/*====================================== P A Y M E N T S   M E T H O D ===================================================*/
      'ajaxListMethod'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialMethod'=>array(
                           
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),

     
     "ajaxPartialSettings"=>array(                           
                            'helpers'=>array('date'=>null,"number"=>null),           
    ),
     
      "ajaxSettings"=>array(                           
                            'helpers'=>array('date'=>null,"number"=>null),           
    ),
 ); 
 
