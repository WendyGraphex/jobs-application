<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',
                           'widgets'=>array('messages'=>array()),
                          ),
     
    "ajaxMyCompany"=>array(
                      'widgets'=>array('select_country'=>''),                                                                      
                      'security'=>array(
                                   "php_functions"=>array("format_postal_code"=>'')
                                  ),
                   ),
     
        "ajaxSave"=>array(
                                'template'=>"site_company_ajaxPartialMyCompany.tpl",                                   
                                'widgets'=>array('select_country'=>''),
                                'security'=>array(
                                            "php_functions"=>array("format_postal_code"=>'')
                                           ),
                            ),
); 
 
