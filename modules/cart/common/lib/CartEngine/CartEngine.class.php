<?php

class CartEngine   {
     
    protected $cart=null,$taxes=null;
    
    function __construct(Cart $cart) {      
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
    
    function getSaleSettings()
    {
        return $this->sale_settings=$this->sale_settings===null?new SaleSettings():$this->sale_settings;
    }
    
    
    function processCommission()
    {
       
        
        
        
        return $this;
    }
     
    function getCommissionRate()
    {
        return $this->commission_rate;
    }
    
    function process()
    {              
       // var_dump($this->getSaleSettings()->getTaxRate());
        
        $this->getCart()->getCartQuotations()->init();       
        foreach ($this->getCart()->getCartQuotations() as $item)
        {
            $item->getEngine()->process();
        }                       
        $this->getCart()->getCartQuotations()->save();                                
                                       
        $this->getCart()->set('total_sale_price_with_tax',$this->getCart()->getCartQuotations()->getTotalSalePriceWithTax());
        $this->getCart()->set('total_sale_price_without_tax',$this->getCart()->getCartQuotations()->getTotalSalePriceWithTax());
        $this->getCart()->set('number_of_quotations',$this->getCart()->getCartQuotations()->count());   
        
        $this->commission_rate= new SaleEmployerCommissionRate(array('total_sales_with_tax'=>$this->getCart()->getTotalSalePriceWithTax()));
        if ($this->commission_rate->isLoaded()) 
        {          
            $this->getCart()->set('commission_rate_id',$this->getCommissionRate());
            $this->getCart()->set('commission_with_tax',$this->getCommissionRate()->getFix() + $this->getCart()->getTotalSalePriceWithTax() * $this->getCommissionRate()->getRate());
            $this->getCart()->set('commission_without_tax',$this->getCommissionRate()->getFix() + $this->getCart()->getTotalSalePriceWithoutTax() * $this->getCommissionRate()->getRate());
        }               
        $this->getCart()->set('global_sale_price_without_tax',$this->getCart()->getTotalSalePriceWithoutTax() + $this->getCart()->getCommissionWithoutTax());
        $this->getCart()->set('tax_amount',$this->getSaleSettings()->getTax()->getRate()->getValue() * $this->getCart()->getGlobalSalePriceWithoutTax());
        $this->getCart()->set('global_sale_price_with_tax',$this->getCart()->getGlobalSalePriceWithoutTax() + $this->getCart()->getTaxAmount()); 
        $this->getCart()->setTaxes(new mfArray(array(array('rate'=>$this->getSaleSettings()->getTax()->getRate()->getValue(),'amount'=>$this->getCart()->getTaxAmount()))));
        $this->getCart()->save(); 
                                               
        return $this;
    }
    
   /* function getTaxes()
    {
        if ($this->taxes===null)
        {    
            $this->taxes=new CartTaxCollection();
            foreach ($this->getCart()->getCartProductsWithTax() as $cart_product)
            {
                if (!isset($this->taxes[$cart_product->getTax()->get('id')]))
                    $this->taxes[$cart_product->getTax()->get('id')]=new CartTax($cart_product->getTax());
                $this->taxes[$cart_product->getTax()->get('id')]->add($cart_product->getTotalTax());
            }
        }
        return $this->taxes;
    }*/
     
}
