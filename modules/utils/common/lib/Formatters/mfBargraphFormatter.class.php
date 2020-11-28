<?php

class mfBargraphFormatter extends mfFloatFormatter {
    
    
    
    function getFull()
    {
        return intval($this->getValue());
    }
    
    function isHalf()
    {
        return ($this->getValue() - floatval($this->getFull())) >= 0.5;
    }
    
}
