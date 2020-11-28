<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
     
      'ajaxListContact'=>array(  'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialContact'=>array(
                             'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
       ),
     
         'ajaxListRequest'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialRequest'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
    
     /* ****************************** ABUSE *******************************************/
       'ajaxNewAbuseTypeI18n'=>array(                                                                       
                                     'helpers'=>array("date"=>null),                                     
                                    
      ), 
     
      'ajaxSaveNewAbuseTypeI18n'=>array(
                                    'template'=>"customers_contact_ajaxNewAbuseTypeI18n.tpl",  
      ), 
     
      "ajaxSaveAbuseTypeI18n"=>array(
              "template"=>"customers_contact_ajaxViewAbuseTypeI18n.tpl"
      ),
     
      'ajaxListAbuseType'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialAbuseType'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
   
 ); 
 
