<?php
// Classes des sites
// env=
return array("default" => array(
    "event" => array("class" => "mfEventDispatcher"),  // MANDATORY FIRST
    "logger" => array("class" => "mfLogger"),
    "storage" => array("class" => "mfSessionStorage",
        "params" => array("session_cookie_lifetime" => 3600 * 24 * 15,
            'auto_shutdown' => false,
        ),
    ),
    "user" => array("class" => "mfBasicSecurityUser",
        "params" => array("timeout" => 3600 * 24 * 15, 'auto_shutdown' => false),
    ),
    "response" => array("class" => "mfWebResponse",
        "options" => array("charset" => "UTF-8", "http_protocol" => "HTTP/1.1"),
    ),
    "i18n" => array("class" => "mfI18n"),
    "controller" => array("class" => "mfFrontController"),
    "controllerComponent" => array("class" => "mfFrontComponentController"),
    "controllerRewrite" => array("class" => "mfFrontRewriteController"),
    "routing" => array("class" => "mfRoutings"),
    /*      "storage"=>array("class"=>"mfSessionStorage",
                           "params"=>array("session_cookie_lifetime"=>3600*4,
                                           'auto_shutdown'=>false,
                                          ),
                           ),*/
    /*    "user"=>array("class"=>"mfBasicSecurityUser",
                      "params"=>array("timeout"=>3600,'auto_shutdown'=>false),
                     ),       */
    "mailer" => array("class" => "mfMailer",
        "params" => array(
            "delivery_strategy" => "realtime",
            "transport" => array("class" => "Swift_SmtpTransport",
                "param" => array("host" => "localhost",
                    "port" => 25,
                    "encryption" => "",
                    "username" => "",
                    "password" => "")
            ),
        ),
    ),
),

    /*  "prod" => array(
        "mailer" => array( //"class"=>"mfMailer",
            "params" => array(
                "delivery_strategy" => "realtime",
                "transport" => array(
                    "class" => "Swift_SmtpTransport",
                    "param" => array("host" => "email-smtp.us-east-1.amazonaws.com",
                        "port" => 587,
                        // "timeout"=>10,
                        "encryption" => "tls",
                        "username" => "AKIATL3M3OFD4KSSGNOX",
                        "password" => "BG5wgM+JYB0FuefFdwah94SwNf5pPvjhri8lPzOomTa/")
                ),
            ),
        ),
    ),*/

   /*     "prod" => array(
        "mailer" => array( //"class"=>"mfMailer",
            "params" => array(
                "delivery_strategy" => "realtime",
                "transport" => array(
                    "class" => "Swift_SmtpTransport",
                    "param" => array("host" => "ewebsolutions.fr",
                        "port" => 587,
                        // "timeout"=>10,
                        "encryption" => "tls",
                        "username" => "recrut@ewebsolutions.fr",
                        "password" => "xxxxxxxxxx")
                ),
            ),
        ),
    ),*/
 
"prod" => array(
        "mailer" => array( //"class"=>"mfMailer",
            "params" => array(
                "delivery_strategy" => "realtime",
                "transport" => array(
                    "class" => "Swift_SmtpTransport",
                    "param" => array("host" => "smtp-relay.sendinblue.com",
                        "port" => 587,
                        //  "timeout"=>10,
                        "encryption" => "tls",
                        "username" => "contact@graphex.net",
                        "password" => "AMGm23k9hgRFYVOc")
                ),
            ),
        ),
    ),
);

