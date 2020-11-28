<?php

class PaymentCreditEventUserMethodCollection extends mfObjectCollection3 {
                      
     function getMethods()
    {      
        if ($this->methods===null)
        {
            $this->methods = new PaymentMethodCollection();
            foreach ($this as $item)
               $this->methods[$item->get('method_id')]=$item->getMethod();
        }   
        return $this->methods;  
    }
       
}

