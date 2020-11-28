<?php
// key = [action][view]
return array('all' => array('classView' => 'SmartyView',
    'widgets' => array('messages' => null),
),

    'signin' => array(
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

    'login' => array(
        'stylesheets' => array("main.css" => null),
        'javascripts' => array('jquery/1.11.1/jquery-1.11.1.min.js' => null),
        //  'javascripts'=>array('jquery-1.7.min.js'=>null),
        'title' => "Login",
        'widgets' => array("banner" => null),
        'metas' => array(
            "description" => "super web",
            "keywords" => "key1,key2...",
        ),
    ),

    'account' => array(
        'layout' => array(
            "template" => "default.xml",
        ),
        'stylesheets' => array(
           // "bootstrap.min.css" => null,
            "main.css" => null,
            "font-awesome/css/font-awesome.min.css" => null,
            "dropzone/4.1.0/dropzone.min.css"=>null,
            "ui/1.11.0/jquery-ui.min.css" => null,),
        'javascripts' => array('jquery/1.11.1/jquery-1.11.1.min.js' => null,
            'jquery.custom.js' => null,
            'bootstrap/bootstrap-select.min.js'=>null,
            'jquery.custom.messages.js' => array("type" => "url"),
            'ui/jquery-ui.min.js' => null,
            'highcharts.js' => array('module' => 'highcharts'),
             "dropzone/4.1.0/dropzone.js"=>null,  
        ),
        'title' => "My account",
        'blocks'=>array('JqueryScriptsReady'=>null),
        'widgets' => array("banner" => null),
        'metas' => array(
            "description" => "super web",
            "keywords" => "key1,key2...",
        ),
    ),
    
   

    /* ======================== FORGOT EMAIL ======================================================= */
    
     'forgotEmail' => array(
        'title' => "My Account - Forgot email",
        "layout" => array("template" => "default.xml"),
        'widgets' => array("banner" => null, "messages" => null),
          'blocks'=>array('JqueryScriptsReady'=>null),
       'stylesheets' => array(
                    "awesome/4.7.0/css/font-awesome.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap-theme.min.css"=>null,
                    "mystyle.css" => null),
         'javascripts' => array(
            'jquery/2.2.2/jquery-2.2.2.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null
        ),
    ),
    
    'forgotEmailRecoverAccount'=> array(
        'title' => "My Account - Forgot email - Account recovery",
        "layout" => array("template" => "default.xml"),
        'widgets' => array("banner" => null, "messages" => null),
          'blocks'=>array('JqueryScriptsReady'=>null),
       'stylesheets' => array(
                    "awesome/4.7.0/css/font-awesome.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap-theme.min.css"=>null,
                    "mystyle.css" => null),
         'javascripts' => array(
            'jquery/2.2.2/jquery-2.2.2.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null
        ),
    ),
    
    "forgotEmailRecoverAccountFailed"=> array(
        'title' => "My Account - Forgot email - Account recovery failure",
        "layout" => array("template" => "default.xml"),
        'widgets' => array("banner" => null, "messages" => null),
          'blocks'=>array('JqueryScriptsReady'=>null),
       'stylesheets' => array(
                    "awesome/4.7.0/css/font-awesome.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap-theme.min.css"=>null,
                    "mystyle.css" => null),
         'javascripts' => array(
            'jquery/2.2.2/jquery-2.2.2.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null
        ),
    ),
        
    /* ====================== FORGOT PASSWORD ====================================================== */
    
    'forgotPassword' => array(
        'title' => "My Account - Forgot password",
        "layout" => array("template" => "default.xml"),
        'widgets' => array("banner" => null, "messages" => null),
        'blocks'=>array('JqueryScriptsReady'=>null),
        'stylesheets' => array(//"main.css" => null,
           // "themes/base/jquery.ui.all.css" => null
        ),

        'javascripts' => array(
            'jquery/1.11.1/jquery-1.11.1.min.js' => null,
            'jquery.custom.js' => null,
          //  'ui/jquery-ui-1.8.20.custom.min.js' => null,
        ),
    ),

    'forgotPasswordConfirm' => array(
        'title' => "My Account - Forgot password",
        //   "layout"=>array("template"=>"default.xml"),
        'widgets' => array("banner" => null, "messages" => null),
        'stylesheets' => array("main.css" => null,
           // "themes/base/jquery.ui.all.css" => null
        ),

        'javascripts' => array(
            'jquery/1.11.1/jquery-1.11.1.min.js' => null,
            'jquery.custom.js' => null,
          //  'ui/jquery-ui-1.8.20.custom.min.js' => null,
        ),
    ),
    
     'forgotPasswordChange' => array(
        'title' => "My Account - Forgot password - Change password",
        //   "layout"=>array("template"=>"default.xml"),
        'blocks'=>array('JqueryScriptsReady'=>null),
        'widgets' => array("banner" => null, "messages" => null),
        'stylesheets' => array(
                    "awesome/4.7.0/css/font-awesome.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap-theme.min.css"=>null,
                    "mystyle.css" => null),
         'javascripts' => array(
            'jquery/2.2.2/jquery-2.2.2.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null
        ),
    ),

    'forgotPasswordSent' => array(
        'title' => "My Account - Forgot password",
        //  "layout"=>array("template"=>"default.xml"),
        'widgets' => array("banner" => null, "messages" => null),
        'stylesheets' => array(
                    "awesome/4.7.0/css/font-awesome.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap-theme.min.css"=>null,
                    "mystyle.css" => null),
         'javascripts' => array(
            'jquery/2.2.2/jquery-2.2.2.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null
        ),
    ),

    'ConfirmAccount' => array(
        'title' => "My Account - Confirmation",
        "layout" => array("template" => "default.xml"),
        'widgets' => array("banner" => null, "messages" => null),
        'stylesheets' => array("main.css" => null,
           // "themes/base/jquery.ui.all.css" => null
        ),

        'javascripts' => array(
            'jquery/1.11.1/jquery-1.11.1.min.js' => null,
            'jquery.custom.js' => null,
          //  'ui/jquery-ui-1.8.20.custom.min.js' => null,
        ),
    ),


    'address' => array(
        'layout' => array(
            "template" => "default.xml",
        ),
        'stylesheets' => array("main.css" => null),
        'javascripts' => array('jquery-1.11.1.min.js' => null),      
        'title' => "My account - Address",
        'widgets' => array("banner" => null),
        'metas' => array(
            "description" => "super web",
            "keywords" => "key1,key2...",
        ),
    ),

    'accountCreated' => array(
        'layout' => array(
            "template" => "default.xml",
        ),
        'stylesheets' => array("main.css" => null),
        'javascripts' => array('jquery/1.11.1/jquery-1.11.1.min.js' => null),
        //  'javascripts'=>array('jquery-1.7.min.js'=>null),
        'title' => "My account",
        'widgets' => array("banner" => null),
        'metas' => array(
            "description" => "super web",
            "keywords" => "key1,key2...",
        ),
    ),

    "ajaxMyAccount" => array(
        'helpers' => array("number" => null),
        'blocks'=>array('JqueryScriptsReady'=>null),    
        "security" => array("php_functions" => array(           
                "format_size" => null
            ),
        ),
    ),

   /* "ajaxSaveMyAccount" => array(
        'template' => 'customers_ajaxMyAccount.tpl',
        'helpers' => array("number" => null),
        // 'functions'=>array('html_options_format'=>''),
        // 'widgets'=>array('select_country'=>''),
        "security" => array("php_functions" => array(
            // 'format_postal_code'=>'',
            // 'html_options_format'=>'',
            // 'format_state'=>'',
            "format_size" => null
        ),
        ),
    ),*/
    
   

    "ajaxMyAddresses" => array(
        "helpers" => array("degree" => "", "date" => ""),
        "security" => array("php_functions" => array(
            'format_dec_to_dms' => '', 'format_date' => ''
        ),
        ),
    ),

    "ajaxSaveMyLanguages" => array(
        'template' => 'customers_ajaxMyLanguages.tpl',
    ),


    "ajaxSaveForCompany" => array(
        'template' => 'customers_ajaxViewForCompany.tpl',
    ),

    "ajaxListForCompany" => array(
        "helpers" => array("date" => ""),
        "security" => array("php_functions" => array(
            'format_date' => ''
        ),
        ),
    ),

    "ajaxListPartialForCompany" => array(
        "helpers" => array("date" => ""),
        "security" => array("php_functions" => array(
            'format_date' => ''
        ),
        ),
    ),
    
    "accountCreate"=>array(
         'blocks'=>array('JqueryScriptsReady'=>null),
         'stylesheets' => array(
                    "awesome/4.7.0/css/font-awesome.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap-theme.min.css"=>null,
                    "mystyle.css" => null),
         'javascripts' => array(
            'jquery/2.2.2/jquery-2.2.2.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null
        ),
    ),
    
    "debugCongratulations"=>array(
        //'template'=>'customers_ajaxSaveAccountCreate.tpl',
        'blocks'=>array('JqueryScriptsReady'=>null),
         'stylesheets' => array(
                    "awesome/4.7.0/css/font-awesome.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap-theme.min.css"=>null,
                    "mystyle.css" => null),
         'javascripts' => array(
            'jquery/2.2.2/jquery-2.2.2.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null
        ),
    ),
    
    "forgotEmail"=>array(
         'blocks'=>array('JqueryScriptsReady'=>null),
         'stylesheets' => array(
                    "awesome/4.7.0/css/font-awesome.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap-theme.min.css"=>null,
                    "bootstrap/1.13.2/bootstrap-select.css"=>null,
                    "mystyle.css" => null,
                    "selectize.css"=>null),
         'javascripts' => array(
            'jquery/2.2.2/jquery-2.2.2.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null,
            'bootstrap/1.13.2/bootstrap-select.js'=>null,
            'selectize.js'=>null
        ),
    ),
    
    "forgotPassword"=>array(
         'blocks'=>array('JqueryScriptsReady'=>null),
         'stylesheets' => array(
                    "awesome/4.7.0/font-awesome.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap-theme.min.css"=>null,
                    "bootstrap/1.13.2/bootstrap-select.css"=>null,
                    "mystyle.css" => null),
         'javascripts' => array(
            'jquery/2.2.2/jquery-2.2.2.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null,
            'bootstrap/1.13.2/bootstrap-select.js'=>null
        ),
    ),

    "newPassword"=>array(
         'blocks'=>array('JqueryScriptsReady'=>null),
         'stylesheets' => array(
                    "awesome/4.7.0/css/font-awesome.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap-theme.min.css"=>null,
                    "bootstrap/1.13.2/bootstrap-select.css"=>null,
                    "mystyle.css" => null),
         'javascripts' => array(
            'jquery/2.2.2/jquery-2.2.2.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null,
            'bootstrap/1.13.2/bootstrap-select.js'=>null
        ),
    ),
    
    /* ============================ P R O F I L E ========================================== */
   "validateEmail"=>array(
         'blocks'=>array('JqueryScriptsReady'=>null),
         'stylesheets' => array(
                    "awesome/4.7.0/css/font-awesome.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap-theme.min.css"=>null,
                    //"bootstrap/1.13.2/bootstrap-select.css"=>null,
                    "mystyle.css" => null,
                    "selectize.css"=>null),
         'javascripts' => array(
            'jquery/2.2.2/jquery-2.2.2.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null,
            //'bootstrap/1.13.2/bootstrap-select.js'=>null,
            'selectize.js'=>null
        ),
    ),
     
    "CreateProfilePhysician"=>array(
         'title' => "Profile creation - Physician",
         'blocks'=>array('JqueryScriptsReady'=>null),
         'stylesheets' => array(
                    "awesome/4.7.0/css/font-awesome.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap-theme.min.css"=>null,
                    "bootstrap/1.13.2/bootstrap-select.css"=>null,
                    "mystyle.css" => null,
                    "selectize.css"=>null),
         'javascripts' => array(
            'jquery/2.2.2/jquery-2.2.2.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null,
            'bootstrap/1.13.2/bootstrap-select.js'=>null,
            'selectize.js'=>null
        ),
    ),
    
     "CreateProfileIndustrial"=>array(
         'title' => "Profile creation - Industrial",
         'blocks'=>array('JqueryScriptsReady'=>null),
         'stylesheets' => array(
                    "awesome/4.7.0/css/font-awesome.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap-theme.min.css"=>null,
                    "bootstrap/1.13.2/bootstrap-select.css"=>null,
                    "mystyle.css" => null,
                    "selectize.css"=>null),
         'javascripts' => array(
            'jquery/2.2.2/jquery-2.2.2.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null,
            'bootstrap/1.13.2/bootstrap-select.js'=>null,
            'selectize.js'=>null
        ),
    ),
    
     "CreateProfileNotProfessional"=>array(
         'title' => "Profile creation - Not Professional",
         'blocks'=>array('JqueryScriptsReady'=>null),
         'stylesheets' => array(
                    "awesome/4.7.0/css/font-awesome.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap-theme.min.css"=>null,
                    "bootstrap/1.13.2/bootstrap-select.css"=>null,
                    "mystyle.css" => null,
                    "selectize.css"=>null),
         'javascripts' => array(
            'jquery/2.2.2/jquery-2.2.2.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null,
            'bootstrap/1.13.2/bootstrap-select.js'=>null,
            'selectize.js'=>null
        ),
    ),
    
     "CreateProfileProfessional"=>array(
         'title' => "Profile creation - Professional",
         'blocks'=>array('JqueryScriptsReady'=>null),
         'stylesheets' => array(
                    "awesome/4.7.0/css/font-awesome.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap-theme.min.css"=>null,
                    "bootstrap/1.13.2/bootstrap-select.css"=>null,
                    "mystyle.css" => null,
                    "selectize.css"=>null),
         'javascripts' => array(
            'jquery/2.2.2/jquery-2.2.2.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null,
            'bootstrap/1.13.2/bootstrap-select.js'=>null,
            'selectize.js'=>null
        ),
    ),
    
    "CreateProfileDefault"=>array(
         'title' => "Profile creation - Default",
         'blocks'=>array('JqueryScriptsReady'=>null),
         'stylesheets' => array(
                    "awesome/4.7.0/css/font-awesome.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap-theme.min.css"=>null,
                    "bootstrap/1.13.2/bootstrap-select.css"=>null,
                    "mystyle.css" => null,
                    "selectize.css"=>null),
         'javascripts' => array(
            'jquery/2.2.2/jquery-2.2.2.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null,
            'bootstrap/1.13.2/bootstrap-select.js'=>null,
            'selectize.js'=>null
        ),
    ),   
    
    
    "CreateProfileStudent"=>array(
         'title' => "Profile create - Student",
         'blocks'=>array('JqueryScriptsReady'=>null),
         'stylesheets' => array(
                    "awesome/4.7.0/css/font-awesome.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap-theme.min.css"=>null,
                    "bootstrap/1.13.2/bootstrap-select.css"=>null,
                    "mystyle.css" => null,
                    "selectize.css"=>null),
         'javascripts' => array(
            'jquery/2.2.2/jquery-2.2.2.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null,
            'bootstrap/1.13.2/bootstrap-select.js'=>null,
            'selectize.js'=>null
        ),
    ),
    
    /* ============================ CONTACT ========================================== */
    'contact' => array(
        'title' => "Contact",
        "layout" => array("template" => "default.xml"),
        'widgets' => array("banner" => null, "messages" => null),
        'blocks'=>array('JqueryScriptsReady'=>null),
        'stylesheets' => array(
                    "awesome/4.7.0/css/font-awesome.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap-theme.min.css"=>null,
                    "mystyle.css" => null),
         'javascripts' => array(
            'jquery/2.2.2/jquery-2.2.2.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null
        ),
    ),
    
    /* ==========================SEARCH ======================================== */
    
  "search"=>array(
         'blocks'=>array('JqueryScriptsReady'=>null),
         'stylesheets' => array(
                    "awesome/4.7.0/css/font-awesome.min.css"=>null,
                    "bootstrap/4.1.3/bootstrap.min.css"=>null,
                    "Main.css" => null,
                    "selectize.css"=>null),
         'javascripts' => array(
            'jquery/2.2.2/jquery-2.2.2.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null
        ),
    ),
    
    "account"=>array(
         'blocks'=>array('JqueryScriptsReady'=>null),
         'stylesheets' => array(
                    "awesome/4.7.0/css/font-awesome.min.css"=>null,
                    "bootstrap/3.2.0/bootstrap.min.css"=>null,
                    "mystyle.css" => null,
                    "selectize.css"=>null),
         'javascripts' => array(
            'jquery/2.2.2/jquery-2.2.2.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null,
             'selectize.js'=>null,
        ),
    ),
);
 

