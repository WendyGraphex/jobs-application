<?php

return array(
    "all"=>array( "widgets"=>array("component"=>null), 
                  "security"=>array("enabled"=>true,
                                    "php_handling"=>SmartyView::PHP_REMOVE,
                                    "php_functions"=>array(
                                                    "url"=>'',"link_to"=>'',"link_i18n_to"=>'',"url_to"=>'','url_i18n_to'=>'','link_i18n'=>'', // urlHelper                                                    
                                                    "__"=>'',"format_gender"=>"","format_country"=>'',   // i18nHelper
                                                    "format_number_choice"=>'',"format_size"=>'',   // numberHelper                                                                  
                                                    "current"=>'',"strtolower"=>'',
                                                  //  'var_dump',
                                                   ),
                                    'static_classes'=>array('mfForm'=>'','mfConfig'),
                                  //  "php_modifiers"=>array("__"),
                                        //"php_modifiers"=>null, //array('glob','strlen'),
                                   ),
                      
                  "options"=>array(
                                     "compile_check"=>true,    
                                 //  "allow_php_tag"=>true,
                                   ),
                ),
    "default"=>array("metas_http"=>array("Content-Type"=>"text/html",
                     
                    ), 
           ),
);