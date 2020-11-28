<?php

return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,"banner"=>null),
                          ),
    
    "validator"=>array(
        "helpers"=>array('date'=>'')
    ),
    
    'overlay'=>array(
                   "layout"=>array(
                            "template"=>"layout_dashboard.xml",
                           // "is_secure"=>true,
                            ),
                    'blocks'=>array('JqueryScriptsReady'=>null),
                               // Mandatory
                              'stylesheets'=>array( // "bootstrap.min.css"=>null,
                                                   //  "sb-admin.css"=>null,
                                                  //   "plugins/morris.css"=>null,                                                 
                                                     "font-awesome/css/font-awesome.min.css"=>null,
                                                //     "style.css"=>null,                                    
                                                     "ui/jquery-ui.min.css"=>null,                                                                                          
                                                  ),
                              'javascripts'=>array('jquery-1.11.1.min.js'=>null,
                                                   'jquery.custom.js'=>null,
                                                   'jquery.custom.messages.js'=>array("type"=>"url"),                                                
                                                   'ui/jquery-ui.min.js'=>null,
                                                 //  'bootstrap-filestyle.js'=>null,
                                                //   'bootstrap/3.0.1/bootstrap.min.js'=>null
                                                  ),    
                  ),
);
