<?php

class payments_listActionComponent extends mfActionComponent {
    
    
    function execute(mfWebRequest $request)
    {       
        $this->methods= PaymentMethod::getMethods();
       // var_dump($this->methods);
    } 
    
   
}

