<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
     
      /* ======================== T Y P E ================================================= */
     
      'ajaxSaveNewCityI18n'=>array(
                                    'template'=>"site_city_ajaxNewCityI18n.tpl",  
      ), 
     
      'ajaxSaveCityI18n'=>array(
                                    'template'=>"site_city_ajaxViewCityI18n.tpl",  
      ),
     
     "ajaxNewCityI18n"=>array(
                 'helpers'=>array("number"=>null),      
                 'functions'=>array('html_options_format'=>''),
                 'widgets'=>array('select_country'=>''), 
           
     ),
     
      "ajaxViewCityI18n"=>array(
                 'helpers'=>array("number"=>null),      
                 'functions'=>array('html_options_format'=>''),
                 'widgets'=>array('select_country'=>''), 
                
     ),
     'ajaxListCity'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialCity'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
 ); 
 
