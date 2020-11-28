<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null),
                          ),
     
     
     
       'ajaxSaveNewModelI18n'=>array(
                                    'template'=>"system_emails_ajaxNewModelI18n.tpl",                                                                                 
                               
                                                      
        ), 
     
        'ajaxSaveModelI18n'=>array(
                                    'template'=>"system_emails_ajaxViewModelI18n.tpl",                                                                                                                                                   
                                                      
        ), 
     
    /*  "ajaxListEmailForMeeting"=>array(
                'helpers'=>array("date"=>null),
                'security'=>array("php_functions"=>array("format_date"=>null,)),    
      ),
     
       "ajaxListEmailForContract"=>array(
                'helpers'=>array("date"=>null),
                'security'=>array("php_functions"=>array("format_date"=>null,)),    
      ),*/
     
        "email"=>array(
                  'widgets'=>array('banner'=>null),   
                  "helpers"=>array('number'=>null,"date"=>null),     
                             "security"=>array(
                                    "php_functions"=>array(
                                                    "format_date"=>null,"format_number"=>null
                                                   ),
                                   ),   
        ),
       'ajaxListModel'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialModel'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
 ); 
 
