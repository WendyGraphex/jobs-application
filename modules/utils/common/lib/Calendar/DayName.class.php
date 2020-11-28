<?php


class DayName {
       
    function __construct($day_number) {
        $this->day_number=$day_number;
    }
    
    function getNumber()
    {
        return $this->day_number;
    }
     
    function getAbbr()
    {
         return Day::$week_days_abbr[$this->day_number];
    }
    
    function getName()
    {
           return Day::$week_days[$this->day_number];
    }
    
    function __toString() {
        return (string)$this->getName();
    }
        
    function getI18n()
    {
        return $this->i18n=$this->i18n===null?new DayNameI18n($this):$this->i18n;
    }
    
    static function getDays($from='sunday')
    {              
         $values=new mfArray();
         $week_days=range(0,6);    
         $key=array_search($from,Day::$week_days);  
         for($i = 0; $i < $key; $i++)                
            array_push($week_days, array_shift($week_days));                      
         foreach ($week_days as $day_number)                                
            $values[$day_number]=new DayName($day_number);         
         return $values;
    }
}
