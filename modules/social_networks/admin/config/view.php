<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',
                           'widgets'=>array('messages'=>array(),'alerts'=>null),
                          ),
     
'ListSocial'=>array(
                'layout'=>array("template"=>"layout_dashboard.xml"),
                'stylesheets'=>array("main.css"=>null,
                                     "themes/base/jquery.ui.all.css"=>null,
                                     "ui.datepicker.css"=>null
                                    ),      
                'widgets'=>array("banner"=>null,"stylesheets"=>null),                             
                'title'=>'social networks | admin',
                'javascripts'=>array('jquery-1.7.min.js'=>null,
                                     'jquery.custom.js'=>null,
                                     'jquery.custom.messages.js'=>array("type"=>"url"),
                                     'ui/jquery-ui-1.8.20.custom.min.js'=>null,
                                    ),
                
                'blocks'=>array("JqueryScriptsReady"=>null),                                                                                             
                'helpers'=>array("date"=>null),
                'security'=>array(
                   "php_functions"=>array("format_date"=>null),
                ),                   
   ),
     
   'ajaxListSocial'=>array(
                        
                        'blocks'=>array('JqueryScriptsReady'=>null),                                                   
                        "widgets"=>array("stylesheets"=>null),                                     
                        'stylesheets'=>array("ui.datepicker.css"=>null),
                        'helpers'=>array("date"=>null),
                        'security'=>array(
                                "php_functions"=>array("format_date"=>null),
                         ), 
   ),
                                  
   'ajaxListPartialSocial'=>array(
                        
                        'blocks'=>array('JqueryScriptsReady'=>null),                                     
                        'helpers'=>array("date"=>null),                                                
                        'security'=>array(
                                "php_functions"=>array("format_date"=>null),
                         ),                   
   ),
   
   "ajaxViewSocial"=>array(
        'blocks'=>array('JqueryScriptsReady'=>null),
        'helpers'=>array( "date"=>null),                                     
        'security'=>array(
            "php_functions"=>array(                                                                        
                           "format_date"=>null, 
                                    ),
             ),
   ),

   'ajaxSaveSocial'=>array(
                    "template"=>"social_networks_ajaxViewSocial.tpl",
                    "blocks"=>array('JqueryScriptsReady'=>null),   
                    'helpers'=>array( "date"=>null),                                     
                    'security'=>array(
                         "php_functions"=>array(                                                                        
                                        "format_date"=>null, 
                                                 ),
                          ),
   ),   
     
    "ajaxNewSocial"=>array(
        'blocks'=>array('JqueryScriptsReady'=>null),                                            
   ),
     
); 
 
