<?php


class SaleEmployerCommissionRateCollection extends mfObjectCollection3 {
    
        
    function toArray()
    {
        $values=new mfArray();
        foreach ($this as $item)
            $values[]=$item->toArray();
        return $values;
    }
    
    function byIndex()
    {
        if ($this->index===null)
        {
            $this->index=new $this();
            foreach ($this as $item)
                $this->index[]=$item;
        }   
        return $this->index;
    }
    
}

