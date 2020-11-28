<?php

class PaymentEmployeeMethodCollection extends mfObjectCollection3 {
             
     
    
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
    
    
  /*  function byIndex()
    {
        if ($this->by_index===null)
        {
            $this->by_index =new self();
            foreach ($this as $item)
               $this->by_index[]=$item;
        }   
        return $this->by_index  ;
    }*/
    
   
}

