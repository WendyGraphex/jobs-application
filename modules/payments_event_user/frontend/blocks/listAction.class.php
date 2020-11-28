<?php

class payments_event_user_listActionComponent extends mfActionComponent {
    
    
    function execute(mfWebRequest $request)
    {       
        $this->methods= PaymentDebitEventUserMethod::getMethods();
       // var_dump($this->methods);
    } 
    
   
}

