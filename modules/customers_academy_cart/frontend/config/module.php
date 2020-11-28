<?php

// key=[action]
return array(
    
    "ajaxAddQuotationToCart"=>array('mode'=>'json','helpers'=>array('number'=>null,'date'=>null)),
    
  /*  "ajaxDeleteCartProductToCart"=>array('mode'=>'json'),
    
    "ajaxAddCartProduct"=>array('mode'=>'json','helpers'=>array('number'=>null,'date'=>null)),
    
    "ajaxSubCartProduct"=>array('mode'=>'json','helpers'=>array('number'=>null,'date'=>null)),
    
    "ajaxDeleteCartProduct"=>array('mode'=>'json','helpers'=>array('number'=>null,'date'=>null)),
     
    "ajaxDeleteCartProductToMyCart"=>array('mode'=>'json','helpers'=>array('number'=>null,'date'=>null)),
     
    "ajaxIncQuantityCartProduct"=>array('mode'=>'json'),
    
    "ajaxDecQuantityCartProduct"=>array('mode'=>'json'),
    
    "ajaxIncQuantityCartProductToMyCart"=>array('mode'=>'json'),
    
    "ajaxDecQuantityCartProductToMyCart"=>array('mode'=>'json'),
    
    "ajaxCreateEventToCart"=>array('mode'=>'json','helpers'=>array('number'=>null,'date'=>null)),
    
    "ajaxSaveCartProductToMyCart"=>array('mode'=>'json','helpers'=>array('number'=>null,'date'=>null)),*/
    
    "ajaxDeleteCartQuotation"=>array("mode"=>"json",'helpers'=>array('number'=>null,'date'=>null)),
    

    "default"=>array(
               "enabled"=>true,
               "actionEnabled"=>true, 
               "mode"=>'mixed'  // mixed : smarty View/Cache  | file: fichier  | uri
                    ),
);