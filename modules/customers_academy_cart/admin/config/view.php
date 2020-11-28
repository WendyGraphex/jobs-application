<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
     
      'ajaxList'=>array(
                                    'helpers'=>array('date'=>null,'number'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartial'=>array(                            
                            'helpers'=>array('date'=>null,'number'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListLost'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialLost'=>array(                            
                            'helpers'=>array('date'=>null,'number'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
      'ajaxListDone'=>array(
                                    'helpers'=>array('date'=>null,'number'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialDone'=>array(                            
                            'helpers'=>array('date'=>null,'number'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
      ),
     
    /*  'ajaxListPartialProductForCart'=>array(                            
                            'helpers'=>array('date'=>null,'number'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),*/
 ); 
 
