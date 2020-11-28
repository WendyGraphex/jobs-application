<?php


class CustomerAcademyCartTaxFormatter   {
     
    function __construct($values = array()) {
        $this->amount=new FloatFormatter($values['amount']);
        $this->rate=new FloatFormatter($values['rate']);
    }
    
    
    function getAmount()
    {
        return $this->amount;
    }
    
    function getRate()
    {
        return $this->rate;
    }
}
