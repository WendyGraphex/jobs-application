<?php

class ProjectTaskCollection extends mfObjectCollection3 {
     
    
    
    function reNumbering()
    {
        foreach ($this->collection as $item)        
            $item->set('reference',$item->loadReference());        
        $this->save();
        return $this;
    }
        
    
    
}
