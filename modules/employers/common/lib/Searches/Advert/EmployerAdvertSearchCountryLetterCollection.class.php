<?php

class EmployerAdvertSearchCountryLetterCollection extends mfArray {
    
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
    
}
