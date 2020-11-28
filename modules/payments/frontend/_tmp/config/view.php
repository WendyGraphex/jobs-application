<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                                                    
                          ),
    
       'listpayments'=>array(
                              "layout"=>array("template"=>"payment.xml"),
                              'title'=>"Your shopping cart - Payment",
                              'widgets'=>array("banner"=>null,"messages"=>null),     
                              'stylesheets'=>array("main.css"=>null,
                                                    "themes/base/jquery.ui.all.css"=>null
                                                   ),
                    
                               'javascripts'=>array(
                                        'jquery-1.7.min.js'=>null,
                                        'jquery.custom.js'=>null,
                                        'ui/jquery-ui-1.8.20.custom.min.js'=>null,
                             ), 
     ),
); 
 
