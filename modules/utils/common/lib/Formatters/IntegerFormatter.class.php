<?php

class IntegerFormatter extends mfInteger {
    
    
    function getText($format="#")
    {
        return format_number($this->getValue(),$format);
    }
   
      function getSize()
    {
        return format_size($this->getValue());
    }
    
    function getFilesize()
    {
        return $this->getSize();
    }
    
    function getChoicesText($format='[0]no result|[1]one result|(1,Inf]%s results')
    {
        return format_number_choice($format,$this->getValue(),$this->getValue());
    }
    
     function getChoices($format='[0]no result|[1]one result|(1,Inf]%s results')
    {         
        return format_number_choice($format,$this->getValue(),$this->getValue());
    }
}
