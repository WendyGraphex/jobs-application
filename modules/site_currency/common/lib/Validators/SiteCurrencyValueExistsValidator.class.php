<?php

class SiteCurrencyValueExistsValidator extends mfValidatorString {


    protected function configure($options,$messages)
    { 
       $this->addMessage('exist', __("{name} already exists."));
    }
  
    protected function doIsValid($value) 
    {
       $item=new siteCurrency($value);
       if ($item->isExist())
       {
           $schema=array();                      
           if (isset($value['rate']) && $value['rate']!='')
              $schema['rate']=new mfValidatorError($this, 'exist',array('name'=>'rate'));                      
           if (isset($value['code']) && $value['code']!='')
              $schema['code']=new mfValidatorError($this, 'exist',array('name'=>'code'));                      
           throw new mfValidatorErrorSchema($this, $schema); 
       }
       return $value;
    }

}
