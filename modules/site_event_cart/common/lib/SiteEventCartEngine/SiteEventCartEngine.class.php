<?php

class SiteEventCartEngine   {
     
    protected $cart=null,$taxes=null;
    
    function __construct(SiteEventCart $cart) {      
        $this->cart=$cart;
    }
    
    function getCart()
    {
        return $this->cart;
    }
    
    function getLanguage()
    {
        return $this->getCart()->getLanguage();
    }
    
    function clean()
    {
        $this->getCart()->clean();
       // $this->taxes=null;
        return $this;
    }
    
   /* function updateCommissions()
    {
          
    }*/
    
    function getSettings()
    {
        return $this->settings=$this->settings===null?new SiteEventSettings():$this->settings;
    }
      
    function processCommission()
    {
       
        
        
        
        return $this;
    }
     
   /* function getCommissionRate()
    {
        return $this->commission_rate;
    }*/
    
    function process()
    {               
        $this->getCart()->getCartEvents()->init();       
        foreach ($this->getCart()->getCartEvents() as $item)
        {
            $item->getEngine()->process();
        }                       
        $this->getCart()->getCartEvents()->save();                                
                                       
        $this->getCart()->set('total_sale_price_with_tax',$this->getCart()->getCartEvents()->getTotalSalePriceWithTax());
        $this->getCart()->set('total_sale_price_without_tax',$this->getCart()->getCartEvents()->getTotalSalePriceWithTax());
        $this->getCart()->set('number_of_events',$this->getCart()->getCartEvents()->getTotalQuantity());   
        $this->getCart()->set('number_of_items',$this->getCart()->getCartEvents()->count());   
      //  var_dump($this->getCart()->getCartEvents()->count());
      /*  $this->commission_rate= new SaleEmployerCommissionRate(array('total_sales_with_tax'=>$this->getCart()->getTotalSalePriceWithTax()));
        if ($this->commission_rate->isLoaded()) 
        {          
            $this->getCart()->set('commission_rate_id',$this->getCommissionRate());
            $this->getCart()->set('commission_with_tax',$this->getCommissionRate()->getFix() + $this->getCart()->getTotalSalePriceWithTax() * $this->getCommissionRate()->getRate());
            $this->getCart()->set('commission_without_tax',$this->getCommissionRate()->getFix() + $this->getCart()->getTotalSalePriceWithoutTax() * $this->getCommissionRate()->getRate());
        }            */   
        $this->getCart()->set('global_sale_price_without_tax',$this->getCart()->getTotalSalePriceWithoutTax()); // + $this->getCart()->getCommissionWithoutTax());
        $this->getCart()->set('tax_amount',$this->getSettings()->getTax()->getRate()->getValue() * $this->getCart()->getGlobalSalePriceWithoutTax());
        $this->getCart()->set('global_sale_price_with_tax',$this->getCart()->getGlobalSalePriceWithoutTax() + $this->getCart()->getTaxAmount()); 
        $this->getCart()->setTaxes(new mfArray(array(array('rate'=>$this->getSettings()->getTax()->getRate()->getValue(),'amount'=>$this->getCart()->getTaxAmount()))));  
        $this->getCart()->save(); 
         
        
        return $this;
    }
    
   
     
}
