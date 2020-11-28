<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
    /*====================================== PROJECT   M E T H O D ===================================================*/
      'ajaxListProject'=>array(
                                    'helpers'=>array('date'=>null,'number'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialProject'=>array(
                           
                            'helpers'=>array('date'=>null,'number'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
   /*====================================== PROJECT  REQUEST ===================================================*/
      
     
      'ajaxListPartialRequestForProject'=>array(
                           
                            'helpers'=>array('date'=>null,'number'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
       "ajaxDetailsForProject"=>array(
                          
                            'helpers'=>array('date'=>null,'number'=>null),         
                            ),
     
     "ajaxNewTaskStateI18n"=>array(
           'helpers'=>array('date'=>null,'number'=>null),         
     ),
     
      "ajaxViewTaskStateI18n"=>array(
           'helpers'=>array('date'=>null,'number'=>null),         
     ),
     
     "ajaxSaveNewTaskStateI18n"=>array(
           'helpers'=>array('date'=>null,'number'=>null),  
         'template'=>'projects_ajaxNewTaskStateI18n.tpl'
     ),
     
      "ajaxSaveTaskStateI18n"=>array(
           'helpers'=>array('date'=>null,'number'=>null),  
         'template'=>'projects_ajaxViewTaskStateI18n.tpl'
     ),
 ); 
 
