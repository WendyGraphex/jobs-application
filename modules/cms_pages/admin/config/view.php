<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',
                            'widgets'=>array('messages'=>null,'alerts'=>null),  
                          ),
 
     /* ======= P A G E S ========================================== */
     "ajaxViewPageI18n"=>array(
                           // 'widgets'=>array("stylesheets"=>null),  
                           // "blocks"=>array("JqueryScriptsReady"=>null),
                          //  "stylesheets"=>array("ui.datepicker.css"=>null),
                          //  "javascripts"=>array("tiny_mce/3.4.6/jquery.tinymce.js"=>array("async"=>false)),
                            'helpers'=>array("date"=>null),
                            'security'=>array(
                                    "php_functions"=>array(
                                                        "format_date"=>null,
                                                   ),
                             ),
     ),
     
     "ajaxSavePageI18n"=>array(
                            "template"=>"cms_pages_ajaxViewPageI18n.tpl",
                         //   'widgets'=>array("stylesheets"=>null),  
                          //  "blocks"=>array("JqueryScriptsReady"=>null),                         
                            'helpers'=>array("date"=>null),
                            'security'=>array(
                                    "php_functions"=>array(
                                                        "format_date"=>null,
                                                   ),
                             ),
     ),
    
     "ajaxNewPageI18n"=>array(
                         //   'widgets'=>array("stylesheets"=>null),  
                         //   "blocks"=>array("JqueryScriptsReady"=>null),
                          //  "stylesheets"=>array("ui.datepicker.css"=>null),
                          //  "javascripts"=>array("tiny_mce/3.4.6/jquery.tinymce.js"=>array("async"=>false)),
                            'helpers'=>array("date"=>null),
                            'security'=>array(
                                    "php_functions"=>array(
                                                        "format_date"=>null,
                                                   ),
                             ),
     ),
   
     "ajaxSaveNewPageI18n"=>array(
                            "template"=>"cms_pages_ajaxNewPageI18n.tpl",
                            //'widgets'=>array("stylesheets"=>null),  
                            //"blocks"=>array("JqueryScriptsReady"=>null),
                           // "stylesheets"=>array("ui.datepicker.css"=>null),
                        //    "javascripts"=>array("tiny_mce/3.4.6/jquery.tinymce.js"=>array("async"=>false)),
                            'helpers'=>array("date"=>null),
                            'security'=>array(
                                    "php_functions"=>array(
                                                        "format_date"=>null,
                                                   ),
                             ),
     ),
        
     
     "ajaxListPage"=>array(                           
                            
                           // 'blocks'=>array("JqueryScriptsReady"=>null),
                            'helpers'=>array('date'=>null),
                            "security"=>array("php_functions"=>array(                                                                                          
                                    "format_date"=>null
                                ),
                            
                            ),
         //'functions'=>array('html_options_format'=>null, ),
         
     ), 
     
     "ajaxListPartialPage"=>array(                           
                            
                         //   'blocks'=>array("JqueryScriptsReady"=>null),
                            'helpers'=>array('date'=>null),
                            "security"=>array("php_functions"=>array(                                                                                          
                                    "format_date"=>null
                                         ),
                                ),
        // 'functions'=>array('html_options_format'=>null, ),
     ), 
     
     
      "ajaxDialogListPartialPage"=>array(                           
                            
                         
                            'helpers'=>array('date'=>null),
                           
     ), 
     
     
     /* ================================= M E N U S ========================================== */
    "ajaxListPartialMenu"=>array(                           
                           
                            'helpers'=>array('date'=>null),
                            "security"=>array("php_functions"=>array(                                                                                          
                                    "format_date"=>null
                                         ),
                                ),
        
     ), 
     
     
     "ajaxSaveNewMenuI18n"=>array(
         "template"=>"cms_pages_ajaxNewMenuI18n.tpl"
     ),
     
     "ajaxSaveMenuI18n"=>array(
         "template"=>"cms_pages_ajaxViewMenuI18n.tpl"
     ),
     
      "ajaxSaveNewNodeI18n"=>array(
         "template"=>"cms_pages_ajaxNewNodeI18n.tpl"
     ),
     
); 
