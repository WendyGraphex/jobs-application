<?php


class EmployerValidator extends mfValidatorString {

    
    protected function doIsValid($value) 
    {      
         $item=new EmployerUser(new mfString($value));             
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
