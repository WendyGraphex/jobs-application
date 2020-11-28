<?php   
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
     
     "forgotPassword"=>array(
                        'blocks'=>array("JqueryScriptsReady"=>null),
                        'functions'=>array('html_options_format'=>null)
    ),
     
  'account' => array(
        'blocks'=>array("JqueryScriptsReady"=>null),
        'helpers'=>array('number'=>null,'date'=>null),
       /* 'layout' => array(
            "template" => "default.xml",
        ),*/
        'stylesheets' => array(
              "dropzone/4.1.0/dropzone.min.css"=>null,
        ),
        'javascripts' => array(
            //  "jquery/3.4.1/jquery.min.js"=>null,             
            //  "dropzone/5.7.0/dropzone.min.js"=>null,  
        ),
        'title' => "My account",
        'widgets' => array("banner" => null),
        'metas' => array(
            "description" => "super web",
            "keywords" => "key1,key2...",
        ),
    ),
    
     "ajaxSaveCompletion"=>array(
        "template"=>"./blocks/employees_completion.tpl",
        'widgets'=>array('select_country'=>''), 
        'helpers'=>array('date'=>null,'number'=>null) ,
        'blocks'=>array('JqueryScriptsReady'=>null),
          'security'=>array("php_functions"=>array(                                          
                              "format_size"=>null,'format_date'=>null  
                              ),
            ),
    ),
    
    "_completion"=>array(
        "plugins"=>array(
            'widgets'=>array('select_country'=>''), 
             'helpers'=>array('date'=>null,'number'=>null)         
        ),
        'security'=>array("php_functions"=>array(                                          
                              "format_size"=>null,'format_date'=>null  
                              ),
            ),
    ),
     
    "ajaxMyProfile"=>array(       
            'widgets'=>array('select_country'=>''),
            'helpers'=>array('date'=>null,'number'=>null) ,
            'security'=>array("php_functions"=>array(                                          
                              "format_size"=>null,'format_date'=>null  
                              ),
            ),
          'blocks'=>array('JqueryScriptsReady'=>null),
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
     
     'wantMission' => array(
                 //'widgets'=>array('select_country'=>''),
         //'title' => "Home",
       // "layout" => array("template" => "default_index.xml"),
        'widgets' => array(  "messages" => null,'select_country'=>''),
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
        'blocks' => array("JqueryScriptsReady" => null),
          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_gender"=>null
                                                 ),
                                ),
    ),
    
      /* ========================================== A D V E R T ================================================ */
     
     "ajaxSaveAdvert"=>array(
         'template'=>"employees_ajaxViewAdvert.tpl",
           'helpers'=>array('number'=>null,'date'=>null)
     ),
     
      "ajaxViewAdvert"=>array(
               'helpers'=>array('number'=>null,'date'=>null)
     ),
     
      "ajaxNewAdvert"=>array(
            'helpers'=>array('number'=>null,'date'=>null)
     ),            
     
      "ajaxListAdvert"=>array(
            'helpers'=>array('number'=>null,'date'=>null)
     ),
     
      "ajaxListPartialAdvert"=>array(
          'helpers'=>array('number'=>null,'date'=>null)
     ),
     
      "ajaxUploadAdvertDocument"=>array(
          'helpers'=>array('number'=>null)
     ),
     
     "ajaxUploadAdvertDocumentProfile"=>array(
          'helpers'=>array('number'=>null)
     ),
     
     
      "ajaxDisplayAdvert"=>array(
          'helpers'=>array('number'=>null,'date'=>null)
     ),
     
     /* ============== CONTROLLERS ============================================================= */
     
      "adverts"=>array(
                 'helpers'=>array("number"=>null,'date'=>null), 
              //   'widgets' => array("javascripts" => null),
                 'blocks'=>array("JqueryScriptsReady"=>null),
                 'stylesheets'=>array(
                  // '/ui/1.11.0/jquery-ui.min.css'=>null, 
                   //'flyto/style.css'=>null,
                  // 'flyto/reset.css'=>null,
                 ),
                 'javascripts'=>array(
              /*       'jquery/jquery-2.2.4.min.js'=>null,
                     'jquery/1.11.1/jquery-1.11.1.js'=>null,
                     'ui/1.11.1/jquery-ui-min.js'=>null,
                     'jquery/flyto/index.js'=>null,
                    // 'jquery/flyto/prefixfree.min.js'=>null,
                     'ui/1.12.1/jquery-ui.min.js'=>null,*/
                 ) 
     ),
     "employees"=>array(
                 'helpers'=>array("number"=>null,'date'=>null), 
              //   'widgets' => array("javascripts" => null),
                 'blocks'=>array("JqueryScriptsReady"=>null),
                 'stylesheets'=>array(
                  // '/ui/1.11.0/jquery-ui.min.css'=>null, 
                   //'flyto/style.css'=>null,
                  // 'flyto/reset.css'=>null,
                 ),
                 'javascripts'=>array(
              /*       'jquery/jquery-2.2.4.min.js'=>null,
                     'jquery/1.11.1/jquery-1.11.1.js'=>null,
                     'ui/1.11.1/jquery-ui-min.js'=>null,
                     'jquery/flyto/index.js'=>null,
                    // 'jquery/flyto/prefixfree.min.js'=>null,
                     'ui/1.12.1/jquery-ui.min.js'=>null,*/
                 ) 
     ),         
     
      "advert"=>array(
                 'helpers'=>array("number"=>null,'date'=>null), 
              //   'widgets' => array("javascripts" => null),
                 'blocks'=>array("JqueryScriptsReady"=>null),
                 'stylesheets'=>array(
                  // '/ui/1.11.0/jquery-ui.min.css'=>null, 
                   //'flyto/style.css'=>null,
                  // 'flyto/reset.css'=>null,
                 ),
                 'javascripts'=>array(
              /*       'jquery/jquery-2.2.4.min.js'=>null,
                     'jquery/1.11.1/jquery-1.11.1.js'=>null,
                     'ui/1.11.1/jquery-ui-min.js'=>null,
                     'jquery/flyto/index.js'=>null,
                    // 'jquery/flyto/prefixfree.min.js'=>null,
                     'ui/1.12.1/jquery-ui.min.js'=>null,*/
                 ) 
     ),
     
        "ajaxListPartialAdverts"=>array(
           'blocks'=>array("JqueryScriptsReady"=>null),
          'helpers'=>array("number"=>null,'date'=>null), 
     ),
     
      "ajaxListPartialEmployees"=>array(
           'blocks'=>array("JqueryScriptsReady"=>null),
          'helpers'=>array("number"=>null,'date'=>null), 
     ),
     
       /* ================== CATEGORY ====================================*/ 
     
      "categories"=>array(
                 'helpers'=>array("number"=>null,'date'=>null), 
              //   'widgets' => array("javascripts" => null),
                 'blocks'=>array("JqueryScriptsReady"=>null),
                 'stylesheets'=>array(
                  // '/ui/1.11.0/jquery-ui.min.css'=>null, 
                   //'flyto/style.css'=>null,
                  // 'flyto/reset.css'=>null,
                 ),
                 'javascripts'=>array(
              /*       'jquery/jquery-2.2.4.min.js'=>null,
                     'jquery/1.11.1/jquery-1.11.1.js'=>null,
                     'ui/1.11.1/jquery-ui-min.js'=>null,
                     'jquery/flyto/index.js'=>null,
                    // 'jquery/flyto/prefixfree.min.js'=>null,
                     'ui/1.12.1/jquery-ui.min.js'=>null,*/
                 ) 
     ),
       
      "category"=>array(
                 'helpers'=>array("number"=>null,'date'=>null), 
              //   'widgets' => array("javascripts" => null),
                 'blocks'=>array("JqueryScriptsReady"=>null),
                 'stylesheets'=>array(
                  // '/ui/1.11.0/jquery-ui.min.css'=>null, 
                   //'flyto/style.css'=>null,
                  // 'flyto/reset.css'=>null,
                 ),
                 'javascripts'=>array(
              /*       'jquery/jquery-2.2.4.min.js'=>null,
                     'jquery/1.11.1/jquery-1.11.1.js'=>null,
                     'ui/1.11.1/jquery-ui-min.js'=>null,
                     'jquery/flyto/index.js'=>null,
                    // 'jquery/flyto/prefixfree.min.js'=>null,
                     'ui/1.12.1/jquery-ui.min.js'=>null,*/
                 ) 
     ),
     
     
       "ajaxListPartialCategory"=>array(
                 'helpers'=>array("number"=>null,'date'=>null),               
                 'blocks'=>array("JqueryScriptsReady"=>null),                
     ),
     
      "_myaccountLink"=>array(         
            "security"=>array("php_functions"=>array(                                                                                          
                                            "link_i18n"=>null
                                                 ),
                                ),
     ),
     
     
     "ajaxListPartialBlockAdvert"=>array(
          'blocks'=>array("JqueryScriptsReady"=>null),
     ),
     
       "employee"=>array(
           'blocks'=>array("JqueryScriptsReady"=>null),
          'helpers'=>array("number"=>null,'date'=>null,'time'=>null), 
     ),
     
      "ajaxSearchAdvert"=>array(          
          'blocks'=>array("JqueryScriptsReady"=>null),
          'helpers'=>array("number"=>null,'date'=>null), 
     ),
     
                
     "countries"=>array(
         'helpers'=>array("number"=>null,'date'=>null), 
              
                 'blocks'=>array("JqueryScriptsReady"=>null),
                 'stylesheets'=>array(
              
                 ),
                 'javascripts'=>array(
               
                 )
     ),
     
     "cities"=>array(
         'helpers'=>array("number"=>null,'date'=>null), 
              
                 'blocks'=>array("JqueryScriptsReady"=>null),
                 'stylesheets'=>array(
              
                 ),
                 'javascripts'=>array(
               
                 )
     ),
     
     
      "skillsAdverts"=>array(
         'helpers'=>array("number"=>null,'date'=>null), 
              
                 'blocks'=>array("JqueryScriptsReady"=>null),
                 'stylesheets'=>array(
              
                 ),
                 'javascripts'=>array(
               
                 )
     ),
     
      "skillsEmployees"=>array(
         'helpers'=>array("number"=>null,'date'=>null), 
                 'title' => "best employee skills",
                 'blocks'=>array("JqueryScriptsReady"=>null),
                 'stylesheets'=>array(
              
                 ),
                 'javascripts'=>array(
               
                 )
     ),
     
     
     "skills"=>array(
         'helpers'=>array("number"=>null,'date'=>null), 
              
                 'blocks'=>array("JqueryScriptsReady"=>null),
                 'stylesheets'=>array(
              
                 ),
                 'javascripts'=>array(
               
                 )
     ),
     
     
     "skill"=>array(
         'helpers'=>array("number"=>null,'date'=>null), 
              
                 'blocks'=>array("JqueryScriptsReady"=>null),
                 'stylesheets'=>array(
              
                 ),
                 'javascripts'=>array(
               
                 )
     ),
     
     /* FAVOURITE */
        "ajaxListFavourite"=>array(        
          'helpers'=>array("number"=>null,'date'=>null), 
     ),
     
      "ajaxListPartialFavourite"=>array(          
          'helpers'=>array("number"=>null,'date'=>null), 
     ),
     
      /* SEARCH */
        "ajaxListSearch"=>array(        
          'helpers'=>array("number"=>null,'date'=>null), 
     ),
     
      "ajaxListPartialSearch"=>array(          
          'helpers'=>array("number"=>null,'date'=>null), 
     ),
     
      "searchAdvert"=>array(
         'helpers'=>array("number"=>null,'date'=>null), 
              
                 'blocks'=>array("JqueryScriptsReady"=>null),
                 'stylesheets'=>array(
              
                 ),
                 'javascripts'=>array(
               
                 )
     ), 
     
         "ajaxWantAJobAdvert"=>array(
         'helpers'=>array('number'=>null,'date'=>null)
     ),
     
          "ajaxWantNewAdvert"=>array(
         'helpers'=>array('number'=>null,'date'=>null)
     ),
     
      "ajaxSaveWantAJobAdvertProfile"=>array(
          'helpers'=>array('number'=>null,'date'=>null)
     ),
 ); 
 


