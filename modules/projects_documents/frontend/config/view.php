<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
/*====================================== PROJECT   M E T H O D ===================================================*/
      'ajaxListProject'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialProject'=>array(
                           
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
  "ajaxUploadDocument"=>array(
          'helpers'=>array('number'=>null)
     ),
     
     "ajaxListPartialDocumentForTaskForEmployee"=>array(
          'helpers'=>array('number'=>null)
     ),
     
       "ajaxListPartialDocumentForProjectForEmployee"=>array(
          'helpers'=>array('number'=>null)
     ),
     
       "ajaxListPartialDocumentForTaskForEmployer"=>array(
          'helpers'=>array('number'=>null)
     ),
     
       "ajaxListPartialDocumentForProjectForEmployer"=>array(
          'helpers'=>array('number'=>null)
     )
 ); 
 
