<?php

class LetterForPager {
    
    protected $letters=array(),$letter="";
    
    function __construct($letter)
    {
        $this->letter=$letter;
    }        
    
    function add($item)
    {
        $this->letters[$item->get('id')]=$item;
        return $this;
    }
    
    function getItems()
    {
        return $this->letters;
    }
    
    function getLetter()
    {
        return $this->letter;
    }
    
}
