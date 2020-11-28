<?php



class mfLanguageCollection extends mfArray {
    
    protected $text=null,$codes=null;
   
    function asortfct($a,$b)
    {
        if ($a->getLanguage()==$b->getLanguage())
            return 0;
        return ($a->getLanguage() < $b->getLanguage()) ? -1 : 1;
    }
    
    
    function asort()
    {
        uasort($this->collection,array($this,'asortfct')); 
        
        return $this;
    }
  
    
    function getText()
    {
        if ($this->text===null)
        {
            $this->text=new mfArray();
            foreach ($this as $item)
            {                              
              $this->text[]=(string)$item->getText()->ucfirst();
            }
        }   
        return $this->text;
    }
    
    function getCodes()
    {
        if ($this->codes===null)
        {
            $this->codes=new mfArray();
            foreach ($this as $item)
                $this->codes[]=$item->getValue();
        }   
        return $this->codes;
    }
}