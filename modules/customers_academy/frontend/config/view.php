<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
     
     'contactUs' => array( //'title' => "Home",
      
        'widgets' => array("banner" => null, "messages" => null),
       
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
     
     
     'index' => array( //'title' => "Home",
      
        'blocks' => array("JqueryScriptsReady" => null),
    ),
 ); 
 


