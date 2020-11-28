<?php


class TimeArray extends mfArray {
    
    protected $hour=0,$minute=0,$second=0;
    
    function __construct($hour,$minute=0,$second=null) {     
        parent::__construct(array('hour'=>$hour,'minute'=>$minute,'second'=>$second));      
    }
    
    function implode($separator = ":") {
                
        return parent::implode($separator);
    }
}

