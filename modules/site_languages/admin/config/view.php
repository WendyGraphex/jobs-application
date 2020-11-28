<?php
// key = [action][view]
 return array('all'=>array( 'classView'=>'SmartyView',           
                            'widgets'=>array('messages'=>null,'alerts'=>null),      
                          ),    
                   
  'dashboardList'=>array(
                            'layout'=>array("template"=>"layout_dashboard.xml"),
                            'stylesheets'=>array("main.css"=>null,
                                                 "themes/base/jquery.ui.all.css"=>null,
                                                ),      
                            'widgets'=>array("banner"=>null),                             
                            'title'=>'dashboard | languages',
                            'javascripts'=>array('jquery-1.7.min.js'=>null,
                                                 'jquery.custom.js'=>null,
                                                 'jquery.custom.messages.js'=>array("type"=>"url"),
                                                 'ui/jquery-ui-1.8.20.custom.min.js'=>null,
                                                ),
                            
                            'blocks'=>array("JqueryScriptsReady"=>null),
                             ), 
     
  'ajaxDashboardList'=>array(                            
                            'blocks'=>array("JqueryScriptsReady"=>null),
                            
                            ),
     
  'ajaxDashboardListPartial'=>array(                            
                            'blocks'=>array("JqueryScriptsReady"=>null),
                            
                            ),    
     
   'List'=>array(
                            'layout'=>array("template"=>"layout_dashboard.xml"),
                            'stylesheets'=>array("main.css"=>null,
                                                 "themes/base/jquery.ui.all.css"=>null,
                                                ),      
                            'widgets'=>array("banner"=>null),                             
                            'title'=>'languages',
                            'javascripts'=>array('jquery-1.7.min.js'=>null,
                                                 'jquery.custom.js'=>null,
                                                 'jquery.custom.messages.js'=>array("type"=>"url"),
                                                 'ui/jquery-ui-1.8.20.custom.min.js'=>null,
                                                ),
                            
                            'blocks'=>array("JqueryScriptsReady"=>null),
                             ), 
     
  
     
      "ajaxListLanguage"=>array(
             'helpers'=>array("date"=>null),
            'security'=>array("php_functions"=>array("format_date"=>null,'format_language'=>null),),    
        ),
     
         "ajaxListPartialLanguage"=>array(
             'helpers'=>array("date"=>null),
            'security'=>array("php_functions"=>array("format_date"=>null,'format_language'=>null),),    
        ),
       
);        
 
