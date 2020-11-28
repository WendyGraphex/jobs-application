<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView','widgets'=>array('messages'=>null,'alerts'=>null),),
            
  
           
        "ajaxList"=>array(
             'helpers'=>array("date"=>null),
            'security'=>array("php_functions"=>array("format_date"=>null,'format_language'=>null),),
            'functions'=>array('html_options_format'=>''),
            'widgets'=>array('select_country'=>''), 
        ),
     
         "ajaxListPartial"=>array(
             'helpers'=>array("date"=>null),
            'security'=>array("php_functions"=>array("format_date"=>null,'format_language'=>null),),
            'functions'=>array('html_options_format'=>''),
            'widgets'=>array('select_country'=>''), 
        ),
     
     "ajaxSave"=>array(
         'template'=>'site_client_ajaxView.tpl'
     )
 ); 
 
