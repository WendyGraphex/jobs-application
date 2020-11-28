<?php
// key = [action][view]
return array('all' => array('classView' => 'SmartyView',
    'widgets' => array('messages' => null),
),

    'ajaxTest' => array(
        /*  "layout"=>array(
                   // "template"=>"layout_dashboard.xml",
                  // "is_secure"=>true,
                   ),*/
        'blocks' => array('JqueryScriptsReady' => null),
        'functions' => array('html_options_format' => null), // Mandatory
        'stylesheets' => array("ui/jquery-ui.min.css" => null,
            //  "bootstrap/3.0.1/bootstrap.min.css"=>null,
            //  "font-awesome-4.2.0/css/font-awesome.min.css"=>null,
            "main.css" => null,
        ),
        'javascripts' => array('jquery/1.11.1/jquery-1.11.1.min.js' => null,
            'jquery.custom.js' => null,
            'jquery.custom.messages.js' => array("type" => "url"),
            'ui/jquery-ui.min.js' => null,
            'highcharts.js' => array('module' => 'highcharts'),
        ),
    ),
); 
 
