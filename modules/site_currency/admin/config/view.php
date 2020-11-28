<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
     
      'ajaxListCurrency'=>array( 
                                'helpers'=>array('date'=>null,"number"=>null),
                                "security"=>array("php_functions"=>array(                                                                                          
                                                                  "format_date"=>null
                                                                       ),
                                                      ),
                          
                            ),
     
      'ajaxListPartialCurrency'=>array(
                            'helpers'=>array('date'=>null,"number"=>null),
          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
           
                            ),
     
     "ajaxNewCurrency"=>array(
                 'helpers'=>array("number"=>null),      
               
     ),
     
     
     "ajaxViewCurrency"=>array(
                 'helpers'=>array("number"=>null),      
               
     ),
     
     
     "ajaxSaveCurrency"=>array(
         'template'=>'site_currency_ajaxViewCurrency.tpl'
     )
      
 
 ); 
 
