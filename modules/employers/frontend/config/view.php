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
    
       "ajaxMyCompany"=>array(
          'widgets'=>array('select_country'=>''), 
    ),
    
    "ajaxSaveMyCompany"=>array(
        "template"=>"employers_ajaxMyCompany.tpl",
        'widgets'=>array('select_country'=>''), 
    ),
     
     
     "ajaxSaveCompletion"=>array(
        "template"=>"./blocks/employers_completion.tpl",
         'widgets'=>array('select_country'=>''), 
         'blocks'=>array('JqueryScriptsReady'=>null),
        'helpers'=>array('date'=>null,'number'=>null),        
    ),
    
    "_completion"=>array(
        "plugins"=>array(
            'widgets'=>array('select_country'=>''), 
             'helpers'=>array('date'=>null,'number'=>null)         ,            
        ),
          'security'=>array("php_functions"=>array(                                          
                              "format_size"=>null,'format_date'=>null  
                              ),
            ),
    ),
     
        "ajaxMyProfile"=>array(       
            'widgets'=>array('select_country'=>''),
            'helpers'=>array('date'=>null,'number'=>null),
            'blocks'=>array('JqueryScriptsReady'=>null),
            'security'=>array("php_functions"=>array(                                          
                              "format_size"=>null,'format_date'=>null  
                              ),
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
     
     /* ========================================== A D V E R T ================================================ */
     
     "ajaxSaveAdvert"=>array(
         'template'=>"employers_ajaxViewAdvert.tpl",
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
     
       "ajaxDisplayAdvert"=>array(
          'helpers'=>array('number'=>null,'date'=>null)
     ),
     
         "ajaxUploadAdvertDocumentProfile"=>array(
          'helpers'=>array('number'=>null)
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
     
     "employers"=>array(
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
     "companies"=>array(
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
     
       /* ================== U S E R ====================================*/ 
     "ajaxSaveUser"=>array(
         "template"=>"employers_ajaxViewUser.tpl"
     ),
     
     "ajaxListPartialAdverts"=>array(
           'blocks'=>array("JqueryScriptsReady"=>null),
          'helpers'=>array("number"=>null,'date'=>null), 
     ),
     
     "ajaxListPartialEmployers"=>array(
           'blocks'=>array("JqueryScriptsReady"=>null),
          'helpers'=>array("number"=>null,'date'=>null), 
     ),
     
        "ajaxListPartialCompanies"=>array(
           'blocks'=>array("JqueryScriptsReady"=>null),
          'helpers'=>array("number"=>null,'date'=>null), 
     ),
     
     "_myaccountLink"=>array(
          //"plugins"=>array('helpers'=>array("url"=>null)),
            "security"=>array("php_functions"=>array(                                                                                          
                                            "link_i18n"=>null
                                                 ),
                                ),
     ),
     
       "ajaxListPartialBlockAdvert"=>array(
          'blocks'=>array("JqueryScriptsReady"=>null),
     ),
     
     
     "employer"=>array(
           'blocks'=>array("JqueryScriptsReady"=>null),
          'helpers'=>array("number"=>null,'date'=>null,'time'=>null), 
     ),
     
      "company"=>array(
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
     
         
       "ajaxPostAJobAdvert"=>array(
         'helpers'=>array('number'=>null,'date'=>null)
     ),
     
     "ajaxPostNewAdvert"=>array(
         'helpers'=>array('number'=>null,'date'=>null)
     ),
     
     "ajaxSavePostAJobAdvertProfile"=>array(
          'helpers'=>array('number'=>null,'date'=>null)
     ),
 ); 
 


