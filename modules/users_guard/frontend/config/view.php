<?php
// key = [action][view]
return array('all' => array('classView' => 'SmartyView',
    'widgets' => array('messages' => null),
),

    'error401' => array('layout' => array(
        "template" => "default.xml",
    ),
        'stylesheets' => array("main.css" => null),
        'javascripts' => array('jquery/1.11.1/jquery-1.11.1.min.js' => null),
        'title' => "Page required credentials",
        'widgets' => array("banner" => null),
        /*  'metas'=>array(
                             "description"=>"super web",
                             "keywords"=>"key1,key2...",
                        ),*/
    ),


    'login' => array('layout' => array(
        "template" => "default.xml",
    ),
        'stylesheets' => array("main.css" => null),
        'javascripts' => array('jquery/1.11.1/jquery-1.11.1.min.js' => null),
        'title' => "Login",
        'widgets' => array("banner" => null),
        /*  'metas'=>array(
                             "description"=>"super web",
                             "keywords"=>"key1,key2...",
                        ),*/
    ),

    'customersSignin' => array(
        'layout' => array(
            "template" => "default.xml",
        ),
        'stylesheets' => array("main.css" => null),
        'javascripts' => array('jquery/1.11.1/jquery-1.11.1.min.js' => null,
            'jquery.custom.js' => null,
            'jquery.custom.messages.js' => array("type" => "url"),
            'ui/jquery-ui.min.js' => null,
        ),
        'title' => "Signin",
        'functions' => array('html_options_format' => null),
        'widgets' => array("banner" => null,),
        'metas' => array(
            "description" => "super web",
            "keywords" => "key1,key2...",
        ),
    ),

    '_createProfile' => array(
        "plugins" => array(
            "blocks" => array("JqueryScriptsReady" => null),
        ),
    )
); 
 
