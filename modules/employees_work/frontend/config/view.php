<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
    
       'ajaxListWork'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialWork'=>array(
                           
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
    "ajaxListPartialRequestForEmployer"=>array(
                           
                            'helpers'=>array('date'=>null,'number'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
     
      "ajaxListRequestForEmployee"=>array(
                           
                            'helpers'=>array('date'=>null,'number'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      "ajaxListPartialRequestForEmployee"=>array(
                           
                            'helpers'=>array('date'=>null,'number'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
     "ajaxProceedToCredit"=>array(
                           
                            'helpers'=>array('date'=>null,'number'=>null),
         ),
     
     "ajaxDialogAmountRequestForEmployer"=>array(
                           
                            'helpers'=>array('date'=>null,'number'=>null),
         ),
     
     "ajaxListPartialRequestForProjectForEmployee"=>array(
                           
                            'helpers'=>array('date'=>null,'number'=>null),
         ),
     
     "ajaxRequestClosed"=>array(
                           
                            'helpers'=>array('date'=>null,'number'=>null),
         ),
     
      "ajaxDialogPayAllForEmployer"=>array(
                           
                            'helpers'=>array('number'=>null,'date'=>null,),
         ),
     
     "ajaxSaveDialogPayAllForEmployer"=>array(
                           
                            'helpers'=>array('number'=>null,'date'=>null,),
         ),
     
     
     'ajaxSaveDialogAmountRequestForEmployer'=>array(
                           
                            'helpers'=>array('number'=>null,'date'=>null,),
         ),
     
     'refusedRequestEmployer' => array(
        'blocks'=>array("JqueryScriptsReady"=>null),
        'helpers'=>array('number'=>null,'date'=>null),
       /* 'layout' => array(
            "template" => "default.xml",
        ),*/
        'stylesheets' => array(
         
        ),
        'javascripts' => array(
            
        ),
        'title' => "My account - payment refused",
        'widgets' => array("banner" => null),
        'metas' => array(
            "description" => "super web",
            "keywords" => "key1,key2...",
        ),
    ),
 ); 
 
