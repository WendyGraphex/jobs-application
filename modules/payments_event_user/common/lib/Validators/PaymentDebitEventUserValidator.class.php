<?php


class PaymentDebitEventUserValidator extends  mfValidatorString {
    
    
    protected function configure($options,$messages)
    { 
       parent::configure($options,$messages);
       $this->setOption("empty_value",null); // in case of value is null         
       $this->addMessage('notexist', __("record ({value}) doesn't exists."));
    }
        
    
     protected function doIsValid($value) 
    {       
        $settings=new PaypalSettings();        
        
        $item=new PaymentDebitEventUser(array('reference'=>$value,'payer'=>$settings->getPayerID()));       
        if ($item->isNotLoaded())
        {
           if ($value=="" || $value=="0")
           {
               if ($this->getOption('required')==true)
                   throw new mfValidatorError($this, 'required');                    
               return $item;
           }   
           throw new mfValidatorError($this, 'notexist', array('value' => $value));
        }        
        return $item;
    }
}
