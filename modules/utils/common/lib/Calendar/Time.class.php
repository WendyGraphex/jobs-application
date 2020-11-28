<?php

// hour:minutes:second

class Time {
    
    protected $hour=0,$minute=0,$second=0;
    
      static function getInstance($value)
    {
        return new static($value);
    }
    
    function __construct($hour,$minute=0,$second=null) {     
        $this->hour=new mfInteger($hour);
        $this->minute=new mfInteger($minute);    
        $this->second=new mfInteger($second);
    }
    
    function getHour()
    {
        return $this->hour;
    }
    
    function getMinute()
    {
        return $this->minute;
    }
    
    function getSecond()
    {
        return $this->second;
    }
    
    function getHourMinute($separator=":")
    {
        return  sprintf("%02d",$this->hour->getValue()).$separator.sprintf("%02d",$this->minute->getValue());
    }        
    
    function getTime($separator=":")
    {
        $time=sprintf("%02d",$this->hour->getValue()).$separator.sprintf("%02d",$this->minute->getValue());
        if ($this->second===null)
            return $time;        
        return $time.$separator.sprintf("%02d",$this->second->getValue());
    }
    
    function getTimeWithSecond($separator=":")
    {
       return sprintf("%02d",$this->hour->getValue()).$separator.sprintf("%02d",$this->minute->getValue()).$separator.sprintf("%02d",$this->second->getValue()); 
    }
    
    function isAm()
    {
        if ($this->second->getValue()===null)                  
           return ($this->hour->getValue() == 12)?$this->minute->getValue() <= 59:$this->hour->getValue() >=0 && $this->hour->getValue() < 12;        
        return ($this->hour->getValue() == 12)?$this->minute->getValue() <= 59 && $this->second <= 59:$this->hour->getValue() >=0 && $this->hour->getValue() < 12;
    }
    
    function isPM()
    {
        return !$this->isAm();
    }
    
    function addHour($hour)
    {        
        return new $this($this->hour->getValue()+$hour,$this->minute->getValue(),$this->second->getValue());
    }
    
    function getHourMinuteToArray()
    {
        return array('hour'=>$this->getHour(),'minute'=>$this->getMinute());
    }
    
    function getValue()
    {
        return strtotime(date('Y-m-d')." ".$this->getTimeWithSecond());
    }
    
    function range($start,$stop,$step=1,$format="{hour}:00")
    {
        $values=new mfArray();
        foreach (range($start,$stop,$step) as $idx)       
           $values[sprintf("%2d",$idx)]= strtr($format, array('{hour}'=>sprintf("%2d",$idx)));          
        return $values;
    }
}

