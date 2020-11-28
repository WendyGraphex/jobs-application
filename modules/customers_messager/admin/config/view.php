<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
     
     
     'ajaxListMessage'=>array(
                                    'helpers'=>array('date'=>null,'number'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialMessage'=>array(
                           
                            'helpers'=>array('date'=>null,'number'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
     'ajaxViewMessage'=>array(
                           
                            'helpers'=>array('date'=>null,'number'=>null),          
                            ),
     
      "ajaxReplyMessage"=>array(
       'helpers'=>array('date'=>null)
   ),
     
   "ajaxUpLoadFileForMessage"=>array(
      'helpers'=>array("number"=>null,'date'=>null),                              
   ),
     
       'ajaxListAdminMessage'=>array(
                                    'helpers'=>array('date'=>null,'number'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialAdminMessage'=>array(
                           
                            'helpers'=>array('date'=>null,'number'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
     
      'ajaxViewAdminMessage'=>array(
                           
                            'helpers'=>array('date'=>null,'number'=>null),          
                            ),
     
      "ajaxReplyAdminMessage"=>array(
       'helpers'=>array('date'=>null)
   ),
 ); 
 
