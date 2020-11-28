<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
     
        /* ======================== C A T E G O R Y================================================= */
     'ajaxListCategory'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialCategory'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxSaveNewCategoryI18n'=>array(
                                    'template'=>"employees_notation_ajaxNewCategoryI18n.tpl",  
      ), 
     
      'ajaxSaveCategoryI18n'=>array(
                                    'template'=>"employees_notation_ajaxViewCategoryI18n.tpl",  
      ), 
     
     "ajaxSaveNewMultipleCategoryI18n"=>array(
         'template'=>'employees_notation_ajaxNewMultipleCategoryI18n.tpl'
     ),
     
     
       /* ======================== CRITERIA ================================================= */
     'ajaxListCriteria'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialCriteria'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxSaveNewCriteriaI18n'=>array(
                                    'template'=>"employees_notation_ajaxNewCriteriaI18n.tpl",  
      ), 
     
      'ajaxSaveCriteriaI18n'=>array(
                                    'template'=>"employees_notation_ajaxViewCriteriaI18n.tpl",  
      ), 
     
     "ajaxSaveNewMultipleCriteriaI18n"=>array(
         'template'=>'employees_notation_ajaxNewMultipleCriteriaI18n.tpl'
     ),
     
     
     'ajaxListNotation'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialNotation'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),   
 ); 
 
