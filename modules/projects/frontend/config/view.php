<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
    
    'ajaxListProjectForEmployee'=>array(
                                    'helpers'=>array('date'=>null,'number'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
    ),
     
    'ajaxListPartialProjectForEmployee'=>array(
                           
                            'helpers'=>array('date'=>null,'number'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
    ),
     
     
    'ajaxListProjectForEmployer'=>array(
                                    'helpers'=>array('date'=>null,'number'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
    ),
     
    'ajaxListPartialProjectForEmployer'=>array(
                           
                            'helpers'=>array('date'=>null,'number'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
    ),
     
     "ajaxListPartialRequestForProject"=>array(                           
            'helpers'=>array('date'=>null,"number"=>null),
            "security"=>array("php_functions"=>array(                                                                                          
                            "format_date"=>null
                                 ),
                ),
    ),
     
     
    'ajaxListPartialTaskForProjectForEmployee'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
    ),
     
    'ajaxListPartialTaskForProjectForEmployer'=>array(
                           
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
    ),
     
     "ajaxModifyEndAtDialogForEmployee"=>array(                           
                            'helpers'=>array('date'=>null),            
    ),
     
        "ajaxModifyStartAtDialogForEmployee"=>array(                           
                            'helpers'=>array('date'=>null),            
    ),
     
     'emailStartAtChange'=>array( 'helpers'=>array('date'=>null)),
     
     'emailEndAtChange'=>array( 'helpers'=>array('date'=>null)),
     
     "ajaxDisplayProjectForEmployee"=>array( 'helpers'=>array('date'=>null,'number'=>null)),
     
     
     "ajaxNewTaskForEmployee"=>array(                           
                            'helpers'=>array('date'=>null,'number'=>null),            
    ),
     
      "ajaxViewTaskForEmployee"=>array(                           
                            'helpers'=>array('date'=>null,'number'=>null),            
    ),
     
      "ajaxDisplayTaskForEmployee"=>array(                           
                            'helpers'=>array('date'=>null,'number'=>null),            
    ),
     
     "ajaxSaveTaskForEmployee"=>array(
          'helpers'=>array('date'=>null,'number'=>null),   
         "template"=>"projects_ajaxViewTaskForEmployee.tpl"
     ),
     
     "ajaxEditTaskForEmployee"=>array(
            'helpers'=>array('date'=>null,'number'=>null),   
     ),
     
     "ajaxSaveEditTask"=>array(
          'helpers'=>array('date'=>null,'number'=>null),   
         "template"=>"projects_ajaxDisplayTaskForEmployee.tpl"
     ),
     
     
       "ajaxNewTaskForEmployer"=>array(                           
                            'helpers'=>array('date'=>null,'number'=>null),            
    ),
     
      "ajaxViewTaskForEmployer"=>array(                           
                            'helpers'=>array('date'=>null,'number'=>null),            
    ),
     
      "ajaxDisplayTaskForEmployer"=>array(                           
                            'helpers'=>array('date'=>null,'number'=>null),            
    ),
     
     "ajaxSaveTaskForEmployer"=>array(
          'helpers'=>array('date'=>null,'number'=>null),   
         "template"=>"projects_ajaxViewTaskForEmployer.tpl"
     ),
     
     "ajaxEditTaskForEmployer"=>array(
            'helpers'=>array('date'=>null,'number'=>null),   
     ),
     
     "ajaxMultipleSelectionTaskProcessForProjectForEmployer"=>array(
         'template'=>'projects_ajaxMultipleSelectionTaskForProjectForEmployer.tpl'
     )
 ); 
 
