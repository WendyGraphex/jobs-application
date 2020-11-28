<?php

class PaymentMethodSettingsCollection extends mfObjectCollection3 {
                      
    function byMethod()
    {
        if ($this->by_method===null)
        {
            $this->by_method = new PaymentMethodSettingsCollection();
            foreach ($this as $item)
               $this->by_method[$item->get('method_id')]=$item; 
        }   
        return $this->by_method;
    }
}

