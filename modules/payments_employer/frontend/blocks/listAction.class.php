<?php

class payments_employer_listActionComponent extends mfActionComponent {
    
    
    function execute(mfWebRequest $request)
    {       
        $this->methods= PaymentEmployerMethod::getMethods();
       // var_dump($this->methods);
    } 
    
   
}

