<?php

class mfHourFormatter extends mfFloatFormatter {
    
     
   
    
     function __toString() {
         return (string)$this->getText();
     }
            
   
    function getText($format="{sign}{hh}:{ii}:{ss}")
    {        
        $results=array();            
        $results['{sign}']=$this->getValue() < 0 ? "-":"";
        $results['{sign+}']=$this->getValue() < 0 ? "-":"+";
        $time=$this->getValue() >=0?$this->getValue():-$this->getValue();   
        $results['{hh}']=sprintf("%02d",floor($time / 3600));
        $results['{ii}']=sprintf("%02d",($time / 60 ) % 60);
        $results['{i}']=sprintf("%01d",($time / 60 ) % 60);
        $results['{ss}']=sprintf("%02d",$time  % 60);        
        return format_number_choice($this->getOption('choices',$format),strtr($this->getOption('text_format',$format),$results),$this->getValue());            
    }
    
   
   
}
