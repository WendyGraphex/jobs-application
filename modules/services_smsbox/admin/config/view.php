<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,"banner"=>null),
                          ),
     
      "ajaxSettings"=>array(
            'functions'=>array('html_options_format'=>null),
      ),
     
     "ajaxList"=>array(
           'helpers'=>array("date"=>null),
                                 'security'=>array(
                                                     "php_functions"=>array("format_date"=>null),
                                                   ),
     ),
     
      "ajaxListPartial"=>array(
         'helpers'=>array("date"=>null),
                                 'security'=>array(
                                                     "php_functions"=>array("format_date"=>null),
                                                   ),
     ),
     "ajaxSaveModel"=>array(
         "template"=>"services_smsbox_ajaxViewModel.tpl"
     ),
     "ajaxListPartialSmsBox"=>array(
         'helpers'=>array("date"=>null),
         'security'=>array(
             "php_functions"=>array("format_date"=>null),
         ),
     ),
     "ajaxListSmsBox"=>array(
         'helpers'=>array("date"=>null),
         'security'=>array(
             "php_functions"=>array("format_date"=>null),
         ),
     ),
 ); 
 
