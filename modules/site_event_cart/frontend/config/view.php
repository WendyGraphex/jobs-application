<?php
// key = [action][view]
 return array('all'=>array('classView'=>'SmartyView',                        
                           'widgets'=>array('messages'=>null,'alerts'=>null),
                          ),
     
     
     "ajaxSmallCartDisplay"=>array(
         'helpers'=>array('date'=>null,'number'=>null)
     ),
     
        "ajaxSmallCartDisplayAccount"=>array(
         'helpers'=>array('date'=>null,'number'=>null)
     ),
     
     "ajaxMyCart"=>array(
         'blocks' => array("JqueryScriptsReady" => null),
         'helpers'=>array('date'=>null,'number'=>null)
     ),
     
    "ajaxSelectQuantityToCart"=>array(
          
         'helpers'=>array('number'=>null)
     ),
 ); 
 
