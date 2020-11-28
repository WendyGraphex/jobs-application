<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
     
      'article' => array( //'title' => "Home",
       // "layout" => array("template" => "default_index.xml"),
        'widgets' => array("banner" => null, "messages" => null),
        'stylesheets' => array("main.css" => null,
           // "ui/1.11.0/jquery-ui.min.css" => null,
           // "font-awesome/css/font-awesome.min.css" => null,
        ),
        'metas' => array("description" => "", "keywords" => ""),
        'javascripts' => array(
           // 'jquery/1.11.1/jquery-1.11.1.min.js' => null,
            'jquery.custom.js' => null,
          //  'ui/1.11.3/jquery-ui-min.js' => null,
          //  'highcharts.js' => array('module' => 'highcharts'),
        ),
        'helpers'=>array('date'=>null,'number'=>null),
        'blocks' => array("JqueryScriptsReady" => null),
    ),
     
      'articles' => array( //'title' => "Home",
       // "layout" => array("template" => "default_index.xml"),
        'widgets' => array("banner" => null, "messages" => null),
        'stylesheets' => array("main.css" => null,
           // "ui/1.11.0/jquery-ui.min.css" => null,
           // "font-awesome/css/font-awesome.min.css" => null,
        ),
        'metas' => array("description" => "", "keywords" => ""),
        'javascripts' => array(
           // 'jquery/1.11.1/jquery-1.11.1.min.js' => null,
            'jquery.custom.js' => null,
          //  'ui/1.11.3/jquery-ui-min.js' => null,
          //  'highcharts.js' => array('module' => 'highcharts'),
        ),
        'helpers'=>array('date'=>null,'number'=>null),
        'blocks' => array("JqueryScriptsReady" => null),
    ),
     
     
      "activities"=>array(
                 'helpers'=>array("number"=>null,'date'=>null),            
                 'blocks'=>array("JqueryScriptsReady"=>null),
                 'stylesheets'=>array(
                 
                 ),
                 'javascripts'=>array(
              
                 ) 
     ),
     
    
     "ajaxListPartialActivity"=>array(
                 'helpers'=>array("number"=>null,'date'=>null),            
                 'blocks'=>array("JqueryScriptsReady"=>null),                
     ),
         
     
       "activity"=>array(
               // "layout" => array("template" => "default_index.xml"),
        'widgets' => array("banner" => null, "messages" => null),
        'stylesheets' => array("main.css" => null,
           // "ui/1.11.0/jquery-ui.min.css" => null,
           // "font-awesome/css/font-awesome.min.css" => null,
        ),
        'metas' => array("description" => "", "keywords" => ""),
        'javascripts' => array(
           // 'jquery/1.11.1/jquery-1.11.1.min.js' => null,
            'jquery.custom.js' => null,
          //  'ui/1.11.3/jquery-ui-min.js' => null,
          //  'highcharts.js' => array('module' => 'highcharts'),
        ),
        'helpers'=>array('date'=>null,'number'=>null),
        'blocks' => array("JqueryScriptsReady" => null),              
     ),
 ); 
 


