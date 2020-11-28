<?php


class DayNameI18n {
       
    function __construct(DayName $value) {
        $this->value=$value;
    }
    
    function getDayName()
    {
        return $this->value;
    }
     
     
    function getAbbr()
    {
         return new mfString(__("day_".$this->getDayName()->getAbbr(),array(),'date','utils'));
    }
    
    function getShortAbbr()
    {
        return new mfString(__("day_short_".$this->getDayName()->getAbbr(),array(),'date','utils'));
    }
    
    function getText()
    {
        return new mfString(__("day_".$this->getDayName()->getName(),array(),'date','utils'));
    }
    
    function __toString() {
        return (string)$this->getText();
    }
}
