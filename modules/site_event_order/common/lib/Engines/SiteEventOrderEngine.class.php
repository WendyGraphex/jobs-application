<?php

class SiteEventOrderEngine   {
     
    protected $order=null,$taxes=null;
    
    function __construct(SiteEventOrder $order) {      
        $this->order=$order;
    }
    
    function getOrder()
    {
        return $this->order;
    }
    
    function getLanguage()
    {
        return $this->getOrder()->getLanguage();
    }
    
   /* function clean()
    {
        $this->getCart()->clean();
       // $this->taxes=null;
        return $this;
    }*/
    
   /* function updateCommissions()
    {
          
    }*/
           
    
    function process()
    {       
      /*  $this->getCart()->getCartQuotations()->init();
        // load products AND tax
      //  $this->getCart()->getCartQuotations()->loadProductsAndTaxes($this->getLanguage());
        foreach ($this->getCart()->getCartQuotations() as $item)
        {
            $item->getEngine()->process();
        }                       
        $this->getCart()->getCartQuotations()->save();                                
       // $this->updateCommissions();                                        
        $this->getCart()->set('total_sale_price_with_tax',$this->getCart()->getCartQuotations()->getTotalSalePriceWithTax());
        $this->getCart()->set('total_sale_price_without_tax',$this->getCart()->getCartQuotations()->getTotalSalePriceWithoutTax());
        $this->getCart()->set('number_of_quotations',$this->getCart()->getCartQuotations()->count());   
        
        $this->commission_rate= new SaleCommissionRate(array('total_sales_with_tax'=>$this->getCart()->getTotalSalePriceWithTax()));
        if ($this->commission_rate->isLoaded()) 
        {          
            $this->getCart()->set('commission_rate_id',$this->getCommissionRate());
            $this->getCart()->set('commission_with_tax',$this->getCommissionRate()->getFix() + $this->getCart()->getTotalSalePriceWithTax() * $this->getCommissionRate()->getRate());
            $this->getCart()->set('commission_without_tax',$this->getCommissionRate()->getFix() + $this->getCart()->getTotalSalePriceWithoutTax() * $this->getCommissionRate()->getRate());
        }
        $this->getCart()->set('global_sale_price_with_tax',$this->getCart()->getTotalSalePriceWithTax() + $this->getCart()->getCommissionWithTax());
        $this->getCart()->set('global_sale_price_without_tax',$this->getCart()->getTotalSalePriceWithoutTax() + $this->getCart()->getCommissionWithoutTax());
        $this->getCart()->save(); */
                                               
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
