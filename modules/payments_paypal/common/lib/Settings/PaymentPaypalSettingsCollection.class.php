<?php

class PaymentPaypalSettingsCollection extends mfObjectCollection3 {
    
   
    function toArray()
    {
        $values=array();
        foreach ($this as $item)
        {
            $values[]=$item->toArray(array('client','secret','mode','payer')) ;
        }   
        return $values;
    }
}

