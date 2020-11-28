<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',
                          // 'stylesheets'=>array("main.css"=>null),
                          'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
    
      'list'=>array(        'widgets'=>array("banner"=>null),
                            'layout'=>array("template"=>"layout_dashboard.xml"),
                            'title'=>'customers | newsletter',
                            'javascripts'=>array('jquery-1.7.min.js'=>null,
                                                 'ui/jquery-ui-1.8.20.custom.min.js'=>null,
                                                 'jquery.custom.js'=>null,
                                                 'jquery.custom.messages.js'=>array("type"=>"url"),
                                                ),
                            'stylesheets'=>array("main.css"=>null,                                 
                                                 "themes/base/jquery.ui.all.css"=>null,
                                                 "ui.datepicker.css"=>null,   
                                                ),
                            'blocks'=>array("JqueryScriptsReady"=>null),
                            
                            'helpers'=>array("date"=>null),
                            'security'=>array(
                                    "php_functions"=>array(
                                                   "format_date"=>null,
                                                   ),
                                   ),
                             ),  
      'ajaxList'=>array(
                            
                            'blocks'=>array("JqueryScriptsReady"=>null),
                            'helpers'=>array("date"=>null),
                            'security'=>array(
                                    "php_functions"=>array(
                                                   "format_date"=>null,
                                                   ),
                                   ),
                       ),
     
 /*    "pdfExport"=>array("widgets"=>array("banner"=>null),
                        "helpers"=>array("date"=>""),
                        "security"=>array("php_functions"=>array(
                                                    "format_date"=>'',
                                                   ),
         
          
          ),
         ),*/
     
            ); 
 
