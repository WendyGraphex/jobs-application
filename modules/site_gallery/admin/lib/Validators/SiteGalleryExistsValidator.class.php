<?php


class SiteGalleryExistsValidator extends mfValidatorString {

    
   
   
    
    protected function configure($options,$messages)
    { 
       parent::configure($options,$messages);
       $this->setOption("empty_value",0); // in case of value is null
       $this->addOption('key',true);
       $this->addMessage('notexist', __("record ({value}) doesn't exists."));
    }
  
    protected function doIsValid($value) 
    {
        $item=new Gallery($value);
         if ($item->isNotLoaded())
        {
           if ($value=="" || $value=="0")
           {
               if ($this->getOption('required')==true)
                   throw new mfValidatorError($this, 'required');
               if ($this->getOption('key'))
                     return $item->getKey();             
               return $item;
           }   
           throw new mfValidatorError($this, 'notexist', array('value' => $value));
        }  
        if ($this->getOption('key'))
             return $item->getKey();
        return $item;
    }

}
