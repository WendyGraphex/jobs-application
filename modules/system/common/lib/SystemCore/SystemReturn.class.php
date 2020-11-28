<?php


class  SystemReturn extends mfArray
{
  
       
    function __construct($values=array()) {
        foreach ($values as $value)
            $this[]=new mfString($value);        
    }
    
        
    
}
