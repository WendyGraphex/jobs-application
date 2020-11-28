<?php


class PaymentMethodEngineCore {
    
    protected $payment=null,$order_total_price_with_tax=0.0,$payment_price_with_tax=0.0,$total_price_with_tax=0.0;
    
    function __construct(PaymentEmployerUser  $payment) {
        $this->payment=$payment;
    }
    
    function getPayment()
    {
        return $this->payment;
    }
    
    function getEngine()
    {
        return $this->getPayment()->getMethod()->getSettings()->getEngine();
    }
            
    function process()
    {        
        $this->order_total_price_with_tax=$this->getPayment()->getOrder()->getGlobalSalePriceWithTax();
        
        $this->getEngine()->setPrice($this->order_total_price_with_tax)->process();
                                
        $this->payment_price_with_tax= $this->getEngine()->getAdder()->getValue();
             
        $this->total_price_with_tax=$this->getEngine()->getTotaWithTax()->getValue();
                
        return $this;
    }
    
    function getOrderTotalPriceWithTax()
    {
        return $this->order_total_price_with_tax;
    }
    
    function getPaymentPriceWithTax()
    {
        return $this->payment_price_with_tax;
    }
    
    function getTotalPriceWithTax()
    {
        return $this->total_price_with_tax;
    }
       
    
    function getNumberOfPayments()
    {
        if ($this->number_of_payments===null)
        {         
            $this->number_of_payments=0;
            $db=mfSiteDatabase::getInstance()
                    ->setParameters(array('order_id'=>$this->getPayment()->getOrder()))                  
                    ->setQuery("SELECT count(id) FROM ".PaymentEmployerUser::getTable().                                
                               " WHERE order_id='{order_id}'".                                 
                               ";")
                    ->makeSqlQuery();
            $row=$db->fetchRow();
            $this->number_of_payments=intval($row[0]);
        }   
        return $this->number_of_payments;
    }
}
