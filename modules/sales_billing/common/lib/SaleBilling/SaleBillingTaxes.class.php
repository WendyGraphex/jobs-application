<?php

class SaleBillingTaxes extends mfArray {
    
     protected $values=null;
     
    function __construct(mfJson $data) {
        $this->collection=$data->decode(true);
    }
    
    function toArray()     
    {
        $values=array();
        foreach ($this as $item) 
        {                       
           $values[(string)(floatval($item['rate']) * 100.0)]=array('amount'=>floatval($item['amount']),'rate'=>floatval($item['rate']));
        }       
        return $values;
    }
    
    
    function getValues()
    {
        if ($this->values===null)
        {    
            $this->values = new mfArray();
            foreach ($this->toArray() as $value)
                $this->values[]=new SaleBillingTaxFormatter($value);
        }
        return $this->values;        
    }
}
