<?php

 
class PaymentEmployerUserBase extends mfObject3 {
     
      const STATE_TOVALID='TOVALID',STATE_ACCEPTED='ACCEPTED',STATE_REFUSED='REFUSED',STATE_CANCELLED='CANCELLED';
      
    protected static $fields=array('employer_user_id',
                                   'order_id',
                                   'method_id',
                                   'currency','currency_id',           
                                   'reference',
                                   'authorization',
                                   'ip',
                                   'order_total_price_with_tax',
                                   'payment_price_with_tax',       
                                   'total_price_with_tax',       
                                   'transaction_time',
                                   'transaction_reference',
                                   'transaction_fee',
                                   'transaction_fee_currency',
                                   'payer',
                                   'state',
                                   'created_at','updated_at');
    const table="t_payment_employer_user"; 
    protected static $foreignKeys=array('employer_user_id'=>'EmployerUser', 
                                        'order_id'=>'SaleOrder',                                       
                                        'currency_id'=>'SiteCurrency',
                                        'method_id'=>'PaymentMethod'
                                        ); 
    protected static $fieldsNull=array(); // By default
   
    function __construct($parameters=null) {
        parent::__construct();   
        $this->getDefaults(); 
        if ($parameters === null)  return $this;      
        if (is_array($parameters)||$parameters instanceof ArrayAccess)
        {          
            if (isset($parameters['id']))
               return $this->loadbyId((string)$parameters['id']);                   
             if (isset($parameters['reference']) && isset($parameters['payer']))
               return $this->loadbyReferenceAndPayer($parameters['reference'],$parameters['payer']);             
            return $this->add($parameters); 
        }   
        else
        {        
            if (is_numeric((string)$parameters)) 
               return $this->loadbyId((string)$parameters);
        }   
    }

    
      function loadByReferenceAndPayer($reference,$payer)
    {              
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('reference'=>$reference,'payer'=>$payer))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                       " WHERE  payer='{payer}' AND  reference ='{reference}'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
    protected function getDefaults()
    {               
          $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),           
            'state'=>'INPROGRESS',        
        ));    
    }
         
    function getValuesForUpdate()
    {
       $this->set('updated_at',date("Y-m-d H:i:s"));    
    }   
         
    public function getEmployerUser()
    {      
        return $this->_employer_user_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;
    }
    
     function getCurrency()
    {
        return $this->_currency_id=$this->_currency_id===null?new SiteCurrency($this->get('currency_id')):$this->_currency_id;
    }
    
    function getSettings()
    {
        return $this->settings =$this->settings ===null?new PaymentSettings():$this->settings;
    }
    
     function getState()
    {
        return $this->_state=$this->_state===null?new PaymentEmployerUserState($this->get('state')):$this->_state;
    }
    
     function loadReference()
    {        
        $format_reference=$this->getSettings()->get('payment_reference_format','P{year}{month}{day}{id}');
        $parameters=array('{year}'=>date("Y"),'{month}'=>date("m"), '{day}'=>date("d"),
                          '{id}'=>format_number($this->get('id'),$this->getSettings()->get('payment_format_number','00000')));
        $this->set('reference',strtr($format_reference,$parameters));
        return $this;
    }   
    
    
     public function getOrder()
    {      
        return $this->_order_id=$this->_order_id===null?new SaleOrder($this->get('order_id'),$this->getEmployerUser()):$this->_order_id;
    }
    
    function getMethod()
    {
        return $this->_method_id=$this->_method_id===null?new PaymentMethod($this->get('method_id')):$this->_method_id;
    }
    
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new PaymentEmployerUserFormatter($this):$this->formatter;
   }
    
    function getOrderTotalPriceWithTax()
    {
        return floatval($this->get('order_total_price_with_tax'));
    }
    
    function getPaymentPriceWithTax()
    {
        return floatval($this->get('payment_price_with_tax'));
    }
    
    
    function getTotalPriceWithTax()
    {
        return floatval($this->get('total_price_with_tax'));
    }
    
        
    function setMethod(PaymentMethod $method)
    {
        $this->set('method_id',$method);
        return $this;
    }
    
    function setPayer($payer)
    {
        $this->set('payer',$payer);
        return $this;
    }        
    
    
     function setReference($reference)
    {
        $this->set('reference',$reference);
        return $this;
    }   
    
    function setState($state)
    {
         $this->set('state',$state);
        return $this;
    }
    
    function isToValid()
    {
        return $this->get('state')=='TOVALID';
    }
    
    function isAccepted()
    {
        return $this->get('state')=='ACCEPTED';
    }
    
     function isRefused()
    {
        return $this->get('state')=='REFUSED';
    }
    
      function isCancelled()
    {
        return $this->get('state')=='CANCELLED';
    }
             
    function getEngine()
   {
       if ($this->engine===null)
       {
            $class = "PaymentMethod".$this->getMethod()->get('name')."Engine";
            if (!class_exists($class))
                $class = "PaymentMethodEngine";
            $this->engine = new $class($this);
       }     
       return $this->engine; 
   }
            
    function create()
    {
        if (!$this->get('order_id') || !$this->get('employer_user_id'))
          return $this;               
        $this->set('currency',$this->getOrder()->getCurrency()->get('code'));
        $this->set('currency_id',$this->getOrder()->getCurrency());     
        $this->set('ip',$this->getOrder()->get('ip'));
        
        $this->getEngine()->process();
        
        $this->set('order_total_price_with_tax',$this->getEngine()->getOrderTotalPriceWithTax());
        $this->set('payment_price_with_tax',$this->getEngine()->getPaymentPriceWithTax());
        $this->set('total_price_with_tax',$this->getEngine()->getTotalPriceWithTax());
        
        
        $this->save();
        if (!$this->get('reference'))
        {    
            $this->loadReference();
            $this->save();
        }
        
        $this->getOrder()->add(array('number_of_payments',$this->getEngine()->getNumberOfPayments(),
                                     'payment_id'=>$this,
                                     'payment_sale_price_with_tax'=>$this->get('payment_price_with_tax'),
                                   //  'payment_sale_price_without_tax',
                                  //   'general_price_without_tax',
                                     'general_price_with_tax'=>$this->get('payment_price_with_tax')
                                    ))                         
                         ->save();
        return $this;
    }
    
    function getStateI18n()
    {
        return __($this->get('state'),array(),'messages','payments');
    }
    
    function validate()
    {
        $this->set('state',self::STATE_ACCEPTED);
        $this->save();
        $this->getOrder()->set('state', SaleOrderState::PAID)->save();
        return $this;
    }
    
    function setQuotationsToPaid()
    {
        $db=mfSiteDatabase::getInstance()
                  ->setParameters(array('order_id'=>$this->get('order_id')))
                  ->setQuery("UPDATE ".SaleEmployeeQuotation::getTable().
                             " INNER JOIN ".SaleOrderQuotation::getInnerForJoin('quotation_id').
                             " SET state='PAID'".
                             " WHERE order_id='{order_id}';")
                  ->makeSqlQuery();                             
    }
    
    
    function getQuotations()
    {
        return $this->quotations =$this->quotations===null?new SaleEmployeeQuotationCollection($this):$this->quotations;
    }
    
    
    function toArrayForBilling()
    {
        $values=$this->getOrder()->toArrayForBilling();
        $values['order_id']=$this->getOrder()->get('id');
        return $values;
    }
    
    
    function accepted()
    {
        $this->set('state', PaymentEmployerUserState::ACCEPTED);
        return $this->save();
    }
    
    function refused()
    {
        $this->set('state', PaymentEmployerUserState::REFUSED);
        return $this->save();
    }
    
    function cancel()
    {
        $this->set('state', PaymentEmployerUserState::CANCELLED);
        return $this->save();
    }
    
    
    function setFee($value,$curreny)
    {
        $this->set('transaction_fee',$value);
        $this->set('transaction_fee_currency',$curreny);
        return $this;
    }
    
    function setError()
    {
        $this->set('state','ERROR')->save();
        $this->getOrder()->setError(); 
        $this->getQuotations()->release();
        
        
        return $this;
    }
     
    function getHookFile()
    {
        if ($this->file===null)
        {                  
           $this->file= new File(mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/data/payments/paypal/hooks_".$this->get('id').".json"); 
        }
       return $this->file;
    }
}
