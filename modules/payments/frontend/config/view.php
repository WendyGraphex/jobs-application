<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
    
   "proceed"=>array(
          'helpers'=>array('date'=>null,'number'=>null)
     ),
     
   "proceedEventDebit"=>array(
          'helpers'=>array('date'=>null,'number'=>null)
     ),

     
      'Return' => array(
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
            
        ),
    ),
     
     
      'ReturnEventDebit' => array(
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
            
        ),
    ),
 ); 
 
