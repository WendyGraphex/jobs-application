<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView','widgets'=>array('messages'=>null)),
            
   /* ================================== C O U N T R Y  =============================================== */
     
        "ajaxSaveCountry"=>array(
            "template"=>"site_countries_ajaxViewCountry.tpl"
        ),
           
        "ajaxListCountry"=>array(
             'helpers'=>array("date"=>null),
            'security'=>array("php_functions"=>array("format_date"=>null),),    
        ),
     
         "ajaxListPartialCountry"=>array(
             'helpers'=>array("date"=>null),
            'security'=>array("php_functions"=>array("format_date"=>null),),    
        ),
     
      "ajaxAddCountry"=>array(
             
            'security'=>array("php_functions"=>array("format_country"=>null),),    
        ),
 ); 
 
