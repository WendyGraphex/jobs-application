<?php

return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,"banner"=>null),
                          ),
    
        'login'=>array(     
                             'stylesheets'=>array("main.css"=>null),
                             'javascripts'=>array('jquery/1.11.1/jquery-1.11.1.min.js'=>null),                                
                           //  'javascripts'=>array('jquery-1.7.min.js'=>null),
                             'title'=>"Login", 
                             'widgets'=>array("banner"=>null),
                             'metas'=>array(
                                                "description"=>"super web",
                                                "keywords"=>"key1,key2...",
                                           ),
                             ), 
    'logout'=>array(     
                             'stylesheets'=>array("main.css"=>null),
                             'javascripts'=>array('jquery-1.11.1.min.js'=>null),                                
                           //  'javascripts'=>array('jquery-1.7.min.js'=>null),
                             'title'=>"Logout", 
                             'widgets'=>array("banner"=>null),
                             'metas'=>array(
                                                "description"=>"super web",
                                                "keywords"=>"key1,key2...",
                                           ),
                             ), 
    
     'profile'=>array(     
                             'stylesheets'=>array("main.css"=>null),
                             'javascripts'=>array('jquery-1.11.1.min.js'=>null),                                
                           //  'javascripts'=>array('jquery-1.7.min.js'=>null),
                             'title'=>"Logout", 
                             'widgets'=>array("banner"=>null),
                             'metas'=>array(
                                                "description"=>"super web",
                                                "keywords"=>"key1,key2...",
                                           ),
                             ), 
     "testEmail"=>array(
         "helpers"=>array('date'=>null,'number'=>null)
     )
);