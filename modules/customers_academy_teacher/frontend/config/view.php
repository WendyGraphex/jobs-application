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
     
     
       "ajaxSaveCompletion"=>array(
        "template"=>"./blocks/customers_academy_teacher_completion.tpl",
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
     
        "ajaxMyProfile"=>array(       
            'widgets'=>array('select_country'=>''),
            'helpers'=>array('date'=>null),
             'blocks'=>array('JqueryScriptsReady'=>null),
    ),
     
         "ajaxNewCourseI18n"=>array(       
           
            'helpers'=>array('date'=>null,'number'=>null),
           
    ),
     
        "ajaxUploadCourseDocument"=>array(
          'helpers'=>array('number'=>null)
     ),
     
     "ajaxListPartialCourse"=>array(
          'helpers'=>array('date'=>null,'number'=>null)
     ),
     
      "ajaxListCourse"=>array(
          'helpers'=>array('date'=>null,'number'=>null)
     ),
     
      "ajaxSaveCourseI18n"=>array(
         'template'=>"customers_academy_teacher_ajaxViewCourseI18n.tpl",
           'helpers'=>array('number'=>null,'date'=>null)
     ),
     
      "ajaxViewCourseI18n"=>array(
            'helpers'=>array('number'=>null,'date'=>null)
     ),
     
       "ajaxDisplayCourseI18n"=>array(
            'helpers'=>array('number'=>null,'date'=>null)
     ),
);        
 
