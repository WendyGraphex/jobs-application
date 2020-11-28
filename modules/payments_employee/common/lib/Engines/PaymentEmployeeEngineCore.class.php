<?php


class PaymentEmployeeEngineCore {
    
    protected $payment_employee=null,$commission_rate=null,$payment_method_default=null;
    
    function __construct(PaymentEmployee  $payment_employee) {
        $this->payment_employee=$payment_employee;        
    }
    
    
    function getPaymentMethodDefault()
    {
        return $this->payment_method_default = $this->payment_method_default ===null? new PaymentEmployeeSettings($this->getPaymentEmployee()->getEmployeeUser()):$this->payment_method_default;
    }
    
    
    function getPaymentEmployee()
    {
        return $this->payment_employee;
    }
    
    function getCommissionRate()
    {
        return $this->commission_rate;
    }
                    
    function process()
    {               
        if (!$this->getPaymentEmployee()->hasRequests())
            return $this;
        $this->getPaymentEmployee()->set('order_total_price_with_tax',$this->getPaymentEmployee()->getRequests()->getTotalPriceWithTax());
        $this->getPaymentEmployee()->set('total_price_with_tax',$this->getPaymentEmployee()->getRequests()->getTotalPriceWithTax());        
        $this->commission_rate= new SaleEmployeeCommissionRate(array('total_sales_with_tax'=>$this->getPaymentEmployee()->getTotalPriceWithTax()));
        if ($this->commission_rate->isLoaded()) 
        {                     
            $this->getPaymentEmployee()->set('commission_rate_id',$this->getCommissionRate());
            $this->getPaymentEmployee()->set('commission_with_tax',$this->getCommissionRate()->getFix() + $this->getPaymentEmployee()->getTotalPriceWithTax() * $this->getCommissionRate()->getRate());
            $this->getPaymentEmployee()->set('commission_without_tax',$this->getCommissionRate()->getFix() + $this->getPaymentEmployee()->getTotalPriceWithoutTax() * $this->getCommissionRate()->getRate());
        }         
        $this->getPaymentEmployee()->set('global_price_with_tax',$this->getPaymentEmployee()->getTotalPriceWithTax() - $this->getPaymentEmployee()->getCommissionWithTax());
        $this->getPaymentEmployee()->set('global_price_without_tax',$this->getPaymentEmployee()->getTotalPriceWithoutTax() -  $this->getPaymentEmployee()->getCommissionWithoutTax());
         if ($this->getPaymentMethodDefault())
        {                  
            $this->getPaymentMethodDefault()->getMethod()->getSettings()->getEngine()->setPrice($this->getPaymentEmployee()->getGlobalPriceWithTax())->process();            
            
            $this->getPaymentEmployee()->set('general_price_with_tax',$this->getPaymentMethodDefault()->getMethod()->getSettings()->getEngine()->getTotalPriceSubAdderWithTax()->getValue());
            $this->getPaymentEmployee()->set('payment_price_with_tax',$this->getPaymentMethodDefault()->getMethod()->getSettings()->getEngine()->getAdder()->getValue());           
        }
        else
        {
            $this->getPaymentEmployee()->set('general_price_with_tax',$this->getPaymentEmployee()->getTotalPriceWithTax() - $this->getPaymentEmployee()->getCommissionWithTax());
            $this->getPaymentEmployee()->set('payment_price_with_tax',0.0);     
        }                
        $this->getPaymentEmployee()->save(); 
        return $this;
    }
         
}
