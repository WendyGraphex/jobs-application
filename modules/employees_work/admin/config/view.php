<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
/*====================================== WORK ===================================================*/
      'ajaxListWork'=>array(
                                    'helpers'=>array('date'=>null,"number"=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialWork'=>array(
                           
                            'helpers'=>array('date'=>null,"number"=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
/*====================================== WORK PAYMENT===================================================*/
      'ajaxListPayment'=>array(
                                    'helpers'=>array('date'=>null,"number"=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialPayment'=>array(
                           
                            'helpers'=>array('date'=>null,"number"=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
     "ajaxProcessWork"=>array(
                           
                            'helpers'=>array('date'=>null,"number"=>null),
           
                            ),
     
      
      'ajaxListPartialPaymentForWork'=>array(
                           
                            'helpers'=>array('date'=>null,"number"=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
     
     "ajaxProcessWorks"=>array('helpers'=>array('date'=>null,"number"=>null)),
     
     "ajaxGenerateRequests"=>array('helpers'=>array('date'=>null,"number"=>null)),
     
     "ajaxGenerateEmailRequests"=>array('helpers'=>array('date'=>null,"number"=>null)),
 ); 
 
