<?php

 class CartProductViewForm extends mfForm {
 
     
    function configure()
    {
            
        $this->setValidators(array(
                  'quantity'=>new mfValidatorInteger(array('required'=>true,'min'=>10000)),
           
        ));
    }
    
    
}


