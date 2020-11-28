<?php


return array('all'=>array('classView'=>'SmartyView',
                           'widgets'=>array('messages'=>null,'alerts'=>null),                             
                          ),
            
      'ajaxNewShopI18n'=>array(                                                                       
                                     'helpers'=>array("date"=>null),                                                                         
      ), 
     
      'ajaxSaveNewShopI18n'=>array(
                                    'template'=>"site_shop_ajaxNewShopI18n.tpl",  
      ), 
     
      'ajaxSaveShopI18n'=>array(
                                    'template'=>"site_shop_ajaxViewShopI18n.tpl",  
      ),
    'ajaxListShop'=>array( 
                                    'helpers'=>array('date'=>null),
                          "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
      'ajaxListPartialShop'=>array(
                               
                            'helpers'=>array('date'=>null),
           "security"=>array("php_functions"=>array(                                                                                          
                                            "format_date"=>null
                                                 ),
                                ),
                            ),
     
     
); 
 
