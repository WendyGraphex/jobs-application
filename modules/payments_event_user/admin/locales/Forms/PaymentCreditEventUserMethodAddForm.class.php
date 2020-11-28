<?php

class PaymentCreditEventUserMethodAddForm extends mfForm {
    
    
   function configure() {
        if (!$this->hasDefaults())
        {
            $this->setDefault('methods',PaymentCreditEventUserMethod::getAlls()->getMethods()->getKeys()->toArray());
        }    
        $this->setValidators(array(
           'methods' => new mfValidatorChoice(array('required'=>false,'key'=>true,'multiple'=>true,'choices'=> PaymentMethod::getMethods()))            
        ));
    }
    
    
    function getMethods()
    {
        return $this['methods']->getArray();
    }
}
