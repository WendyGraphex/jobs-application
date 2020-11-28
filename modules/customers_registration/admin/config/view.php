<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
     
      'ajaxListRegistration'=>array(  'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialRegistration'=>array(
                             'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
       ),
     "ajaxSaveCustomer"=>array(
                 'template'=>'customers_registration_ajaxViewCustomer.tpl',
                 'helpers'=>array("number"=>null),                 
                 'widgets'=>array('select_country'=>''), 
               
     ),
          
 ); 
 
