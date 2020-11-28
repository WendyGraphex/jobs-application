<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
    
     /* ============================= TYPE =============================================== */
       'ajaxNewTypeI18n'=>array(                                                                       
                                     'helpers'=>array("date"=>null),                                     
                                    
      ), 
     
      'ajaxSaveNewTypeI18n'=>array(
                                    'template'=>"customers_ajaxNewTypeI18n.tpl",  
      ), 
     
      "ajaxSaveTypeI18n"=>array(
              "template"=>"customers_ajaxViewTypeI18n.tpl"
      ),
     
     /* ============================= CONTACT =============================================== */
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
      /* ============================= TYPE =============================================== */
     
     'ajaxListType'=>array(  'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     'ajaxListPartialType'=>array(  'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),

 ); 
 
