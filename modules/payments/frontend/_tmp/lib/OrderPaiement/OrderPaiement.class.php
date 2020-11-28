<?php

 
class Orderpayment extends OrderpaymentBase {
    
    function setResponse($response)
    {
        if ($response)
            $this->set('response',serialize($response));
        else
            $this->set('response','');
        return $this;
    }
    
    function getResponse()
    {
        if ($this->get('response'))
            return unserialize($this->get('response'));
        return "";
    }
}



