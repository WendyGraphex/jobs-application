<?php

class mfDurationFormatter extends mfFloatFormatter {
       
     
    function getText($format="{sign}{hh}:{ii}:{ss}")
    {        
        $results=array();            
        $results['{sign}']=$this->getValue() < 0 ? "-":"";
        $results['{sign+}']=$this->getValue() < 0 ? "-":"+";
        $time=$this->getValue() >=0?$this->getValue():-$this->getValue();   
        $results['{hh}']=sprintf("%02d",floor($time / 3600 ));
        $results['{ii}']=sprintf("%02d",($time / 60 ) % 60);
        $results['{i}']=sprintf("%01d",($time / 60 ) % 60);
        $results['{ss}']=sprintf("%02d",$time  % 60);        
        return strtr($this->getOption('format',$format),$results);            
    }
    
    function getHourMinute($format="{sign}{hh}:{ii}")
    {        
        return $this->getText($this->getOption('hour_minute_format',$format));
    }
    
    function getHour()
    {
        return new mfHourFormatter($this->getValue(),array(
                    'choices'=>$this->getOption('choices_hour','[0]no hour|[1]one hour|(1,Inf]%s hours'),
                    'format'=>'#.00',
                    'text_format'=>'{hh}:{ii}'
                ));
    }
    
    function getDistanceInMonth()
    {
        $value = $this->getValue() / 86400;
        if ($value < 31)
            return ceil($this->getValue() / 86400);
        return ceil($value / 31);
    }
    
    function __toString() {
        $number_of_days=$this->getValue() / (3600 *24);
        if ($number_of_days == 1)
            return $number_of_days. __(" Day");           
        if ($number_of_days > 1)
            return $number_of_days. __(" Days");  
        return format_time($this->getValue() ,"{hh}h{ii}");
    }
    
    function getNumberOfDays()
    {        
        return $this->getValue() / (3600 *24 );
    }
    
    function getFormattedNumberOfDays($format="#")
    {
        $number_of_days=format_number($this->getValue() / (3600 *24),$format);
        if ($number_of_days == 1)
            return $number_of_days. __(" Day");           
        if ($number_of_days > 1)
            return $number_of_days. __(" Days");  
        return format_time($this->getValue() ,"{hh}h{ii}");
    }
    
    function getFormattedDistanceInMonth($format="#")
    {
        $value = $this->getValue() / 86400;
        if ($value < 31)
            return format_number($this->getValue() / 86400,$format);
        return format_number($value / 31,$format);
    }
}
