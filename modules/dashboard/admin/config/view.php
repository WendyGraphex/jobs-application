<?php
// key = [action][view]
return array('all' => array('classView' => 'SmartyView',
    'widgets' => array('messages' => null,'alerts'=>null),
),

    'index' => array(
        "layout" => array(
            "template" => "layout_dashboard.xml",
            // "is_secure"=>true,
        ),
        'blocks' => array('JqueryScriptsReady' => null),
        'functions' => array('html_options_format' => null), // Mandatory
        'stylesheets' => array(
              "bootstrap/4.1.3/bootstrap.min.css" => null,
           //   "awesome/5.6.1/fontawesome.css" => null,
              "style.css" => null,
          /*  "sb-admin.css" => null,
            "plugins/morris.css" => null,
            "awesome/4.7.0/css/font-awesome.min.css" => null,
            "style.css" => null,
            "ui/jquery-ui.min.css" => null,
            "sweetalert.css" => null,
             "dropzone/4.1.0/dropzone.min.css"=>null,*/
        ),
        'javascripts' => array(
            'jquery/3.3.1/jquery-3.3.1.min.js' => null,
            'jquery.custom.js' => null,
            'jquery.custom.messages.js' => array("type" => "url"),
            'ui/1.12.1/jquery-ui.min.js'=>null,
            'bootstrap/4.1.3/bootstrap.min.js' => null,
          /*  'highcharts.js' => array('module' => 'highcharts'),
            'sweetalert.min.js' => null,
             "dropzone/4.1.0/dropzone.js"=>null, 
            'bootstrap/bootstrap-select.min.js'=>null,*/
            //   'modules/exporting.js'=>array('module'=>'highcharts'),
            //  'bootstrap-filestyle.js'=>null,
            //   'bootstrap/3.0.1/bootstrap.min.js'=>null
        ),
    ),

    "error404" => array(
        'title' => 'page not found',
        'stylesheets' => array("main.css" => null),
    ),

    "_menu" => array(
        "plugins" => array(
            'blocks' => array('JqueryScriptsReady' => null),
        ),
    ),

    "_notificationsManager" => array(
        "plugins" => array(
            'widgets' => array("stylesheets" => null),
            'blocks' => array('JqueryScriptsReady' => null),
        ),
        'stylesheets' => array(
            "sidebar/slidebar.css" => null
        ),
        'javascripts' => array(
            'sidebar/slidebar.js' => null
        ),
    ),
); 
 
