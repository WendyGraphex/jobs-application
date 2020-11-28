<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
     
    /* ================================================================================================ */          
   'ajaxListArticle'=>array( 
                                    'helpers'=>array('date'=>null,'number'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialArticle'=>array(
                               
                            'helpers'=>array('date'=>null,'number'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
    
     'ajaxNewArticleI18n'=>array(
          'widgets'=>array('select_country'=>''), 
                'helpers'=>array('date'=>null,'number'=>null),
         "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
      ), 
     
      'ajaxViewArticleI18n'=>array(
           'widgets'=>array('select_country'=>''), 
            'helpers'=>array('date'=>null,'number'=>null),
          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
      ), 
    
     'ajaxSaveNewArticleI18n'=>array(
          'widgets'=>array('select_country'=>''), 
                                    'template'=>"customers_blog_ajaxNewArticleI18n.tpl",  
               'helpers'=>array('date'=>null,'number'=>null),
         "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
      ), 
     
      'ajaxSaveArticleI18n'=>array(
           'widgets'=>array('select_country'=>''), 
                                    'template'=>"customers_blog_ajaxViewArticleI18n.tpl",  
           'helpers'=>array('date'=>null,'number'=>null),
         "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
      ), 
     
     
     
     
     /* ================= Activity ======================================= */
 
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
     
     "ajaxSaveNewActivityI18n"=>array(
         "template"=>"customers_blog_ajaxNewActivityI18n.tpl"
     ),
     
      "ajaxViewActivityI18n"=>array(     
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_language"=>null
                                                 ),
                                ),
     ),
     
     "ajaxSaveActivityI18n"=>array(
         "template"=>"customers_blog_ajaxViewActivityI18n.tpl",
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_language"=>null
                                                 ),
                                ),
     ),
     
       /* ======================== A C T I V I T Y ================================================= */
     
      'ajaxSaveNewActivityI18n'=>array(
                                    'template'=>"customers_blog_ajaxNewActivityI18n.tpl",  
      ), 
     
      'ajaxSaveActivityI18n'=>array(
                                    'template'=>"customers_blog_ajaxViewActivityI18n.tpl",  
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
     
     
      /* ================= Activity Menu ======================================= */
 
    'ajaxListActivityMenu'=>array(
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
    ),
    'ajaxListPartialActivityMenu'=>array(
                           
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
     ),
     
      "ajaxSaveNewActivityMenuI18n"=>array(
         "template"=>"customers_blog_ajaxNewActivityMenuI18n.tpl"
     ),
     
      "ajaxViewActivityMenuI18n"=>array(     
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_language"=>null
                                                 ),
                                ),
     ),
     
     "ajaxSaveActivityMenuI18n"=>array(
         "template"=>"customers_blog_ajaxViewActivityMenuI18n.tpl",
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_language"=>null
                                                 ),
                                ),
     ),
     
     "ajaxSaveNewMultipleActivityI18n"=>array(
         "template"=>"customers_blog_ajaxNewMultipleActivityI18n.tpl"
     )
 ); 
 
