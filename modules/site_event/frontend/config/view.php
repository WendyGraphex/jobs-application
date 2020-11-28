<?php
// key = [action][view]
 return array('all'=>array( 'classView'=>'SmartyView',           
                            'widgets'=>array('messages'=>null,'alerts'=>null),      
                          ),    
                   
      'account' => array(
        'blocks'=>array("JqueryScriptsReady"=>null),
        'helpers'=>array('number'=>null,'date'=>null),
       /* 'layout' => array(
            "template" => "default.xml",
        ),*/
        'stylesheets' => array(
         
        ),
        'javascripts' => array(
            
        ),
        'title' => "My account",
        'widgets' => array("banner" => null),
        'metas' => array(
            "description" => "super web",
            "keywords" => "key1,key2...",
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
            'jquery/2.2.4/jquery-2.2.4.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/4.3.1/bootstrap.min.js'=>null
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
                    "bootstrap/4.3.1/bootstrap.min.css"=>null,
                  //  "bootstrap/4.3.1/bootstrap-theme.min.css"=>null,
                    "forgotpassword.css" => null
                    ),
         'javascripts' => array(
            'jquery/2.2.4/jquery-2.2.4.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/4.3.1/bootstrap.min.js'=>null
        ),
    ),

    'forgotPasswordSent' => array(
        'title' => "My Account - Forgot password",
        //  "layout"=>array("template"=>"default.xml"),
        'widgets' => array("banner" => null, "messages" => null),
        'stylesheets' => array(
                    "awesome/4.7.0/css/font-awesome.min.css"=>null,
                    "bootstrap/4.3.1/bootstrap.min.css"=>null,
                 //   "bootstrap/3.2.0/bootstrap-theme.min.css"=>null,
                    "forgotpassword.css" => null),
         'javascripts' => array(
             'jquery/2.2.4/jquery-2.2.4.min.js' => null,
            'jquery.custom.js' => null,   
            'bootstrap/3.2.0/bootstrap.min.js'=>null
        ),
    ),
     
     
       "ajaxMyProfile"=>array(       
            'widgets'=>array('select_country'=>''),
            'helpers'=>array('date'=>null) ,
          'blocks'=>array('JqueryScriptsReady'=>null),
    ),
     
       "ajaxSaveCompletion"=>array(
        "template"=>"./blocks/site_event_completion.tpl",
         'widgets'=>array('select_country'=>''), 
         'blocks'=>array('JqueryScriptsReady'=>null),
        'helpers'=>array('date'=>null)         
    ),
    
    "_completion"=>array(
        "plugins"=>array(
            'widgets'=>array('select_country'=>''), 
             'helpers'=>array('date'=>null)         
        )
    ),
     
     
     "calendar"=>array(
           'blocks'=>array("JqueryScriptsReady"=>null),
          'helpers'=>array('date'=>null)      
     ),
     
      "ajaxCalendar"=>array(
           'blocks'=>array("JqueryScriptsReady"=>null),
           'helpers'=>array('date'=>null)      
     ),
     
      /* =================================PLACE=============================================================== */
      'ajaxListPlace'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialPlace'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ), 
    
     'ajaxNewPlace'=>array(
          'widgets'=>array('select_country'=>''), 
          
      ), 
    
      'ajaxViewPlace'=>array(
          'widgets'=>array('select_country'=>''),          
      ), 
    
     'ajaxSavePlace'=>array(
          'widgets'=>array('select_country'=>''), 
                                    'template'=>"site_event_ajaxViewPlace.tpl",  
         
      ), 
     
     
      'events'=>array(
                          'blocks' => array("JqueryScriptsReady" => null),        
                            'helpers'=>array('date'=>null,'number'=>null),
        
                            ), 
     
     
       'event'=>array(
                          'blocks' => array("JqueryScriptsReady" => null),        
                            'helpers'=>array('date'=>null,'number'=>null),
        
                            ), 
);        
 
