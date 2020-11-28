<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                          
                           'widgets'=>array('messages'=>null,'alerts'=>null),                          
                          ),    
     
     /* ================================= S I T E ============================================== */
   
            
     
             'ajaxViewUser'=>array(                                    
                                   'functions'=>array('html_options_format'=>null)
                            ),
             'ajaxNewUser'=>array(                                    
                                   'functions'=>array('html_options_format'=>null)
                            ),
              'ajaxSaveUser'=>array(
                                    "template"=>"users_ajaxViewUser.tpl", 
                                   'functions'=>array('html_options_format'=>null)
                            ),
     
   /*           'accountIdentity'=>array(
                            'layout'=>array(
                                        "template"=>"layout_dashboard.xml",
                                       // "is_secure"=>true,
                                        ),
                            'title'=>'dashboard|my account|identity',
                            'stylesheets'=>array("main.css"=>null),
                            'javascripts'=>array('jquery-1.11.1.min.js'=>null,
                                                 'jquery.custom.js'=>null,
                                                 'jquery.custom.messages.js'=>array("type"=>"url"),
                                                 'ui/jquery-ui-1.8.20.custom.min.js'=>null,
                                                 ),
                            'functions'=>array('html_options_i18n'=>null),
                            'blocks'=>array("JqueryScriptsReady"=>null),
                            'widgets'=>array("banner"=>null),
                             ),  
     
              'ajaxAccountIdentitySave'=>array(
                                "template"=>"users_ajaxAccountIdentityView.tpl",
                                'blocks'=>array("JqueryScriptsReady"=>null),
                            ),
     
              'ajaxAccountIdentityView'=>array(
                                'blocks'=>array("JqueryScriptsReady"=>null),
                            ),
       */       
     
              'ajaxGroupsList'=>array( 
                            'functions'=>array('html_options_format'=>null)
                            ), 
    
              'emailPasswordRegenerated'=>array(
                                    'widgets'=>array("banner"=>null),                
                                    "security"=>array(
                                    "php_functions"=>array(
                                                    "format_country"=>'',
                                                   ),
                                   ),
                            ),
     
   /*            "pdfExport"=>array(
                            "widgets"=>array("banner"=>null),
                            "helpers"=>array("date"=>""),
                            "security"=>array("php_functions"=>array(
                                                        "format_date"=>'',
                                                       ),


                                              ),
                        ),
       */ 
     
      "ajaxSaveCreatePasswordUser"=>array(
                    "template"=>"users_ajaxCreatePasswordUser.tpl"
     ),
     
     
    "ajaxListPartialUser"=>array(
          'helpers'=>array("date"=>null),
          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
    ),
     
      "ajaxListUser"=>array(
          'helpers'=>array("date"=>null),
          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
    ),
     
      "ajaxSaveProfessionI18n"=>array(
          "template"=>"users_ajaxViewProfessionI18n.tpl"
    ),
     
); 
 
