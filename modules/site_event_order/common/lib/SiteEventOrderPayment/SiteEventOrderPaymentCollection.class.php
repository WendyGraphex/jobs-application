<?php

class SiteEventOrderPaymentCollection extends mfObjectCollection3 {
 
    protected $payment_event_user=null;

    function __construct($data) {
         if ($data instanceof PaymentDebitEventUser)
         {
             $this->payment_event_user=$data;
             return parent::__construct();
         }
         parent::__construct($data);
     }
    
    function getPaymentDebitEventUser()
    {
        return $this->payment_event_user;
    }
    
    /*
     * 'total_price_without_tax','total_price_with_tax',
                                   'order_id','event_user_id','event_id', 'payment_id', 
                                   'status','created_at','updated_at'
     */
    
    function create()
    {              
      //  if (!$this->getPaymentDebitEventUser()->getState()->isAccepted())
      //      return $this;       
        foreach ($this->getPaymentDebitEventUser()->getOrder()->getOrderEvents() as $order_event)
        {           
            $payment = new SiteEventOrderPayment($order_event);
            $this[]=$payment->transfer();                                     
        }
        $this->save();
        foreach ($this as $payment)        
             $payment->setReference();         
        $this->save(); 
        return $this;
    }
    
    

    
}

