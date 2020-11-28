<?php


class CmsMenuFormatter extends mfFormatter {
   
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
    function getTitle()
    {
        if ($this->getValue()->hasI18n())
            return $this->getValue()->getI18n()->getFormatter()->getTitle();
        elseif ($this->getValue()->get('name'))
           return $this->getValue()->getFormatter()->getName(); 
        return __('---');            
    }
    
    function getName()
    {        
           return new mfString($this->getValue()->get('name'))     ;
    }
    
    
    function getNameOrTitle()
    {
        if ($this->getValue()->hasI18n())
            return $this->getValue()->getI18n()->hasTitle()?$this->getValue()->getI18n()->getFormatter()->getTitle():"[".$this->getValue()->getFormatter()->getName()."]"; 
        elseif ($this->getValue()->get('name'))
           return "[".$this->getValue()->getFormatter()->getName()."]"; 
        return __('---');            
    }
}
