<?php

/*
 * Generated by SuperAdmin Generator date : 24/04/13 15:45:29
 */

return array('all'=>array('classView'=>'SmartyView',
                           'widgets'=>array('messages'=>null),                             
                          ),
            
   /*  "FileManager"=>array(                        
                   'layout'=>array("template"=>"layout_dashboard.xml"),
                                  
                   'stylesheets'=>array("main.css"=>null,
                                        "themes/base/jquery.ui.all.css"=>null,
                                        'elfinder/elfinder.min.css'=>null,
                                        'elfinder/theme.css'=>null,
                   ),
                   'javascripts'=>array(
                                        'jquery-1.7.min.js'=>null,                                       
                                        'jquery.custom.js'=>null,
                                        'jquery.custom.messages.js'=>array("type"=>"url"),
                                        'ui/jquery-ui-1.8.20.custom.min.js'=>null,
                                        'elfinder.min.js'=>array("module"=>"site_elfinder","application"=>"frontend"),                                        
                                       ),
                   'widgets'=>array("banner"=>null,"stylesheets"=>null),
                   'blocks'=>array('JqueryScriptsReady'=>null),
     ),*/
    
     "ajaxFileManagerView"=>array(        
                   'stylesheets'=>array(
                                        'elfinder/elfinder.min.css'=>null,
                                        'elfinder/theme.css'=>null,
                   ),
                   'javascripts'=>array(                                       
                                        'elfinder.min.js'=>array("module"=>"site_elfinder","application"=>"frontend","async"=>false),                                        
                                       ),                   
                   'blocks'=>array('JqueryScriptsReady'=>null),
                   "widgets"=>array("stylesheets"=>null),  
     ),
    
); 
 
