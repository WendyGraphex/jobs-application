<?php

Class AlphabetItem {
    
    protected $letter="",$items=array();
    
    function __construct($letter="")
    {
        $this->letter=$letter;
    }
}

class AlphabetPager {
    
    protected $items=array();
    
    
    function __construct()
    {
        $this->configure();
    }
    
    function configure()
    {
       foreach (range('A','Z') as $letter)
       {
           $this->items[$letter]=new AlphabetItem($letter);
       }        
    }
    
}


