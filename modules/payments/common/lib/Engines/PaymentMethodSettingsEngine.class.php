<?php


class PaymentMethodSettingsEngine {
    
    protected $settings=null,$price=0;
    
    function __construct(PaymentMethodSettings $settings) {
         $this->settings=$settings;
     }
     
     
     function getSettings()
     {
         return $this->settings;
     }
     
     function setPrice($price)
     {
         $this->price=$price;
         return $this;
     }
     
     function getPrice()
     {
         return $this->price;
     }
     
     function process()
     {
         $this->adder=new FloatFormatter($this->getSettings()->getAdder() + $this->getPrice() * $this->getSettings()->getAdderRate());
         $this->total_with_tax=new FloatFormatter($this->getPrice() + $this->getAdder()->getValue());    
         
         $this->total_price_sub_adder_with_tax =new FloatFormatter($this->getPrice() - $this->getAdder()->getValue());     
         return $this;
     }
     
      function getTotalPriceSubAdderWithTax()
    {
        return $this->total_price_sub_adder_with_tax;
    }
    
     
     function getTotaWithTax()
     {
         return $this->total_with_tax;
     }
     
     
     function getAdder()
     {
         return $this->adder;
     }
}
