<?php

class PaymentEmployeeMethodAddForm extends mfForm {
    
    
    function configure() {
        if (!$this->hasDefaults())
        {
            $this->setDefault('methods',PaymentEmployeeMethod::getAlls()->getMethods()->getKeys()->toArray());         
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
