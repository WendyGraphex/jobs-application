<?php

class SmsboxCallbackImportForm extends mfForm {
    
    
    
    function configure()
    {
        $this->setOption('disabledCSRF',true);       
        $this->setValidators(array(                                       
            "mobile"=>new mfValidatorString(array()),               
            "statut"=>new mfValidatorString(array()),      
        ));  
        $this->validatorSchema->setOption('keep_fields_unused',true);
    }      
    
      
    
    function getCustomer()
    {                  
        return new MarketingCustomer(array('mobile1'=>$this->getMobile()));               
    }
    
    
    
    
    function getMobile()
    {
        return strpos($this['mobile']->getValue(),"212") ===0?"0".substr($this['mobile']->getValue(),3):$this['mobile']->getValue();                              
    }
    
  
    
    function getErrors()
    {
        $errors=new mfArray();
        foreach ($this->getFields() as $name)
        {                       
           if (!$this[$name]->hasError())
             continue;
           $errors[]=sprintf("%s: ",$name).$this[$name]->getError();
        } 
        return $errors;
    }
    
    
}

