<?php

class PaymentMethod extends PaymentMethodBase {
    
   
    
    function register()
    {      
        $this->save();        
        return $this;
    }
    
    
    function unregister()
    {      
        $this->delete();        
        return $this;
    }
    
}
