<?php

class EmployeeAdvertSearchUserLanguageLetterCollection extends mfArray {
    
    function asortfct($a,$b)
    {
        if ((string)$a==(string)$b)
            return 0;
        return ((string)$a < (string)$b) ? -1 : 1;
    }
        
    function asort()
    {
        uasort($this->collection,array($this,'asortfct'));         
        return $this;
    }
    
    
    function implode($separator)
    {
        $values=new mfArray();
        foreach ($this as $item)
            $values[]=$item->getText()->ucfirst();
        return $values->implode($separator);
    }
}
