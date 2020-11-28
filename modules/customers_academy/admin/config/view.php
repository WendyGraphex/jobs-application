<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
     
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
         "template"=>"customers_academy_ajaxNewCategoryI18n.tpl"
     ),
     
      "ajaxViewCategoryI18n"=>array(     
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_language"=>null
                                                 ),
                                ),
     ),
     
     "ajaxSaveCategoryI18n"=>array(
         "template"=>"customers_academy_ajaxViewCategoryI18n.tpl",
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_language"=>null
                                                 ),
                                ),
     ),
     
     /* ======================================== L E V E L =========================================== */
     
      'ajaxListLevel'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
    ),
    'ajaxListPartialLevel'=>array(
                           
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
     ),
           
     
      'ajaxSaveNewLevelI18n'=>array(
                                    'template'=>"customers_academy_ajaxNewLevelI18n.tpl",  
      ), 
     
      'ajaxSaveLevelI18n'=>array(
                                    'template'=>"customers_academy_ajaxViewLevelI18n.tpl",  
      ), 
     
      "ajaxSaveNewMultipleLevelI18n"=>array(
         'template'=>'customers_academy_ajaxNewMultipleLevelI18n.tpl'
     ),
     
       /* ======================================== Popular =========================================== */
      'ajaxListPopular'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
    ),
    'ajaxListPartialPopular'=>array(
                           
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
     ),
     
         /* ======================================== COURSES =========================================== */
      'ajaxListCourse'=>array(
                                    'helpers'=>array('date'=>null,'number'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
    ),
    'ajaxListPartialCourse'=>array(
                           
                            'helpers'=>array('date'=>null,'number'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
     ),
     
      'ajaxDisplayCourseI18n'=>array(
                           
                            'helpers'=>array('date'=>null,'number'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
     ),
       /* ======================================== CONTACTS =========================================== */ 
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
     
     
     /* ======================================== TOPIC =========================================== */
     
      'ajaxListTopicForCategoryI18n'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
    ),
    'ajaxListPartialTopicForCategoryI18n'=>array(
                           
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
     ),
           
     
      'ajaxSaveNewTopicI18nForCategoryI18n'=>array(
                                    'template'=>"customers_academy_ajaxNewTopicI18nForCategoryI18n.tpl",  
      ), 
     
      'ajaxSaveTopicI18n'=>array(
                                    'template'=>"customers_academy_ajaxViewTopicI18nForCategoryI18n.tpl",  
      ), 
     
      "ajaxSaveNewMultipleTopicI18nForCategoryI18n"=>array(
         'template'=>'customers_academy_ajaxNewMultipleTopicI18nForCategoryI18n.tpl'
     ),
     
      /* ======================================== SOFTWARE =========================================== */
     
      'ajaxListSoftwareForCategoryI18n'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
    ),
    'ajaxListPartialSoftwareForCategoryI18n'=>array(
                           
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
     ),
           
     
      'ajaxSaveNewSoftwareI18nForCategoryI18n'=>array(
                                    'template'=>"customers_academy_ajaxNewSoftwareI18nForCategoryI18n.tpl",  
      ), 
     
      'ajaxSaveSoftwareI18n'=>array(
                                    'template'=>"customers_academy_ajaxViewSoftwareI18nForCategoryI18n.tpl",  
      ), 
     
      "ajaxSaveNewMultipleSoftwareI18nForCategoryI18n"=>array(
         'template'=>'customers_academy_ajaxNewMultipleSoftwareI18nForCategoryI18n.tpl'
     ),
 ); 
 
