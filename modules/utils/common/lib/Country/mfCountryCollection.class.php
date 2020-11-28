<?php



class mfCountryCollection extends mfArray {
    
 
    function asortfct($a,$b)
    {
        if ($a->getCountry()==$b->getCountry())
            return 0;
        return ($a->getCountry() < $b->getCountry()) ? -1 : 1;
    }
    
    
    function asort()
    {
        uasort($this->collection,array($this,'asortfct')); 
        
        return $this;
    }
  
}