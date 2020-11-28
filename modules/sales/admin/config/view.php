<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
     
    /* =============== EMPLOYER COMMISSION =================================== */
     'ajaxSaveEmployerCommission'=>array(
             'template'=>"sales_ajaxViewEmployerCommission.tpl",      
             'helpers'=>array("date"=>null),                                                      
     ),
     
     'ajaxViewEmployerCommission'=>array(                                      
             'helpers'=>array("date"=>null),                                                      
     ),
     
     'ajaxNewEmployerCommission'=>array(                                      
             'helpers'=>array("date"=>null),                                                      
     ),
     
     'ajaxListEmployerCommission'=>array(                                      
             'helpers'=>array("date"=>null),   
         "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
     ),
     
     'ajaxListPartialEmployerCommission'=>array(                                      
             'helpers'=>array("date"=>null),
         "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
     ),
     
      'ajaxListPartialRateForEmployerCommission'=>array(                                      
             'helpers'=>array("date"=>null,'number'=>null),                                                      
     ),
     
     'ajaxSaveMultipleRateForEmployerCommission'=>array(
         'helpers'=>array("date"=>null,'number'=>null),          
         'template'=>'sales_ajaxListPartialRateForEmployerCommission.tpl'
     ),
     
     
    /* =============== EMPLOYEE COMMISSION =================================== */
     'ajaxSaveEmployeeCommission'=>array(
             'template'=>"sales_ajaxViewEmployeeCommission.tpl",      
             'helpers'=>array("date"=>null),                                                      
     ),
     
     'ajaxViewEmployeeCommission'=>array(                                      
             'helpers'=>array("date"=>null),                                                      
     ),
     
     'ajaxNewEmployeeCommission'=>array(                                      
             'helpers'=>array("date"=>null),                                                      
     ),
     
     'ajaxListEmployeeCommission'=>array(                                      
             'helpers'=>array("date"=>null),   
         "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
     ),
     
     'ajaxListPartialEmployeeCommission'=>array(                                      
             'helpers'=>array("date"=>null),
         "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
     ),
     
      'ajaxListPartialRateForEmployeeCommission'=>array(                                      
             'helpers'=>array("date"=>null,'number'=>null),                                                      
     ),
     
     'ajaxSaveMultipleRateForEmployeeCommission'=>array(
         'helpers'=>array("date"=>null,'number'=>null),          
         'template'=>'sales_ajaxListPartialRateForEmployeeCommission.tpl'
     ),
     
     "_settings"=>array(
            "plugins"=>array("helpers"=>array('number'=>null)),
            "security"=>array("php_functions"=>array(                                                                                          
                                            "format_pourcentage"=>null
                                                 ),
                                ),
    ),
     
     
      /* ================= Tax ======================================= */
     
      "ajaxListTax"=>array(
           'helpers'=>array("number"=>null),     
      ),
     
      "ajaxListPartialTax"=>array(
           'helpers'=>array("number"=>null),     
      ),
     
     'ajaxNewTax'=>array(                                                                       
            'helpers'=>array("number"=>null),                                                                         
      ), 
     
      'ajaxViewTax'=>array(                                                                       
            'helpers'=>array("number"=>null),                                                                         
      ), 
     
     'ajaxSaveTax'=>array(                                                                       
            'helpers'=>array("number"=>null), 
            'template'=>"products_ajaxViewTax.tpl"
      ),
 ); 
 
