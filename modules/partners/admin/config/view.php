<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
     
 
     
     /* ================= Category ======================================= */
 
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
     
     "ajaxSaveNewCategoryI18n"=>array(
         "template"=>"partners_ajaxNewCategoryI18n.tpl"
     ),
     
      "ajaxViewCategoryI18n"=>array(     
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_language"=>null
                                                 ),
                                ),
     ),
     
     "ajaxSaveCategoryI18n"=>array(
         "template"=>"partners_ajaxViewCategoryI18n.tpl",
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_language"=>null
                                                 ),
                                ),
     ),
     
       /* ======================== A C T I V I T Y ================================================= */
     
      'ajaxSaveNewActivityI18n'=>array(
                                    'template'=>"partners_ajaxNewActivityI18n.tpl",  
      ), 
     
      'ajaxSaveActivityI18n'=>array(
                                    'template'=>"partners_ajaxViewActivityI18n.tpl",  
      ),
     'ajaxListActivity'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialActivity'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
     
      /* ================= Category Menu ======================================= */
 
    'ajaxListCategoryMenu'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
    ),
    'ajaxListPartialCategoryMenu'=>array(
                           
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
     ),
     
      "ajaxSaveNewCategoryMenuI18n"=>array(
         "template"=>"partners_ajaxNewCategoryMenuI18n.tpl"
     ),
     
      "ajaxViewCategoryMenuI18n"=>array(     
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_language"=>null
                                                 ),
                                ),
     ),
     
     "ajaxSaveCategoryMenuI18n"=>array(
         "template"=>"partners_ajaxViewCategoryMenuI18n.tpl",
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_language"=>null
                                                 ),
                                ),
     ),
 ); 
 
