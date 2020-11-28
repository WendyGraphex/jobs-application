<?php


class EmployerAdvertI18nValidator extends mfValidatorString {

    
    protected function doIsValid($value) 
    {           
         $item=new EmployerAdvertI18n($value);        
         if ($item->isNotLoaded())
        {
           if ($value =="")
           {
               if ($this->getOption('required')==true)
                   throw new mfValidatorError($this, 'required');                    
               return $item;
           }   
           throw new mfValidatorError($this, 'invalid', array('value' => $value));
        }        
        return $item;
    }

}
