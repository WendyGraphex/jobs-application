<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',
                           'widgets'=>array('messages'=>null,"banner"=>null),  
                          ),
      
      "PageView"=>array(
                  // "widgets"=>array("_Javascripts"=>null),
                   "javascripts"=>array(//'jquery-1.7.min.js'=>null,
                                       // 'jquery.custom.js'=>null,
                                       // 'ui/jquery-ui-1.8.20.custom.min.js'=>null,
                                       ),
                   "template"=>"",
                   "stylesheets"=>array(//"main.css"=>null,                                       
                                       // "themes/base/jquery.ui.all.css"=>null,              
                                       ),   
                    "blocks"=>array("JqueryScriptsReady"=>null),
                   "security"=>array(
                                    "php_functions"=>array(
                                         
                                            ),
                               ),
                  "settings"=>array(
                            //  "sublink_separator"=>"|"
                  )
     ),
     
/*     "_list"=>array("plugins"=>
                        array("helpers"=>array(
                                        //    "moi"=>null
                                         )
                              )
                   ),*/
     
     "_menu"=>array(  
                     "plugins"=>array("blocks"=>array("JqueryScriptsReady"=>null),
                                      "widgets"=>array("javascripts"=>null,"stylesheets"=>null)
                                    ),
         
                    
         
                   ),
     
     "_nodeMenu"=>array(  
                     "plugins"=>array("blocks"=>array("JqueryScriptsReady"=>null),  
                                      "widgets"=>array("stylesheets"=>null)
                                    ),
                  
         
    ),
     
    "_nodeMenuFrom"=>array(  
                     "plugins"=>array("blocks"=>array("JqueryScriptsReady"=>null),  
                                      "widgets"=>array("stylesheets"=>null)
                                    ),
                    
         
    ),
     
     "_megaDropDownMenu"=>array(  
                     "plugins"=>array("blocks"=>array("JqueryScriptsReady"=>null),  
                                      "widgets"=>array("stylesheets"=>null)
                                    ),
                      "stylesheets"=>array(
                                            "xxxxxx.css"=>null
                                    ),
                      "javascripts"=>array(                                        
                                        "xxxxx.js"=>null
                                          ),
         
    ),
); 
