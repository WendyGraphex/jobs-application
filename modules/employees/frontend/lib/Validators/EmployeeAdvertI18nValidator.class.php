<?php


class EmployeeAdvertI18nValidator extends mfValidatorString {

    
    protected function doIsValid($value) 
    {      
         $item=new EmployeeAdvertI18n($value);      
         if ($item->isNotLoaded())
        {
           if ($value=="" || $value=="0")
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
