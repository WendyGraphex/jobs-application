<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',
                           'widgets'=>array('messages'=>array()),
                          ),
     
   'Emailer'=>array(
                                  'layout'=>array(
                                        "template"=>"layout_dashboard.xml",
                                       // "is_secure"=>true,
                                        ),
                                  'stylesheets'=>array("main.css"=>null,
                                                ),
                                  'javascripts'=>array('jquery-1.7.min.js'=>null,
                                                       'jquery.custom.js'=>null,
                                                       'jquery.custom.messages.js'=>array("type"=>"url"),
                                                       'ui/jquery-ui-1.8.20.custom.min.js'=>null,
                                                      ), 
                                  'title'=>"Emailer system",         
                                  'metas'=>array(
                                                "description"=>"super web",
                                                "keywords"=>"key1,key2...",
                                           ),                              
                                  'widgets'=>array('messages'=>null,"banner"=>null),                                                           
                                  'blocks'=>array('JqueryScriptsReady'=>null),
                                  'helpers'=>array('number'=>''),
     ),           
     
    'ajaxEmailer'=>array(     
                             'blocks'=>array('JqueryScriptsReady'=>null),                            
    ),
); 
 
