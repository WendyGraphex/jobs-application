<?php

class PaymentEmployeeBase extends mfObject3 {
         
    //    const STATE_TOVALID='TOVALID',STATE_ACCEPTED='ACCEPTED',STATE_REFUSED='REFUSED',STATE_CANCELLED='CANCELLED';
      
    protected static $fields=array('employee_user_id',                               
                                   'method_id','currency','currency_id','reference','authorization',
                                   'ip','order_total_price_with_tax',
                                   'commission_rate_id','commission_with_tax','commission_without_tax',
                                   'global_price_with_tax','global_price_without_tax','has_commission',
                                   'total_price_with_tax',
                                   'general_price_with_tax','general_price_without_tax',
                                   'payment_price_with_tax','payment_price_without_tax',
                                   'transaction_time', 'transaction_reference','number_of_requests',
                                   'state', 'options','transaction_fee_currency','transaction_fee',
                                   'created_at','updated_at');
    const table="t_payment_employee_user"; 
    protected static $fieldsNull=array('method_id'); // By default
    protected static $foreignKeys=array('employee_user_id'=>'Employee',                                       
                                        'method_id'=>'PaymentMethod', 
                                        'currency_id'=>"SiteCurrency",
                                        'commission_rate_id'=>'SaleEmployeeCommissionRate'
                                       // 'status_id'=>'CustomerContractBillingStatus'
                                        ); 

    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']);                    
          return $this->add($parameters); 
      }
      else
        {                    
           if (is_numeric((string)$parameters)) 
              return $this->loadbyId((string)$parameters);         
        } 
    }   
    
      
     
       protected function getDefaults()
    {
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),   
            'has_commission'=>'NO',
            'state'=>'INPROGRESS',
            'number_of_requests'=>0
        ));      
    }
            
      function getValuesForUpdate()
      {
          $this->set('updated_at',date("Y-m-d H:i:s"));   
      }   
            
    /*  protected function executeIsExistQuery($db)    
      {
         $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
        $db->setParameters(array('email'=>$this->get('email'),$this->getKey()))
           ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE email='{email}' ".$key_condition)
           ->makeSqlQuery();  
       
      }*/
          
   public function getOrder()
    {      
        return $this->_order_id=$this->_order_id===null?new SaleOrder($this->get('order_id')):$this->_order_id;
    }
    
     function getEmployerUser()
    {
        return $this->_employer_user_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;
    }
    
      function getEmployeeUser()
    {
        return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;
    }
    
       function getMethod()
   {
       return $this->_method_id=$this->_method_id===null?new PaymentMethod($this->get('method_id')):$this->_method_id;
   }
   
    function getCurrency()
    {
        return $this->_currency_id=$this->_currency_id===null?new SiteCurrency($this->get('currency_id')):$this->_currency_id;
    }
    
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new PaymentEmployeeFormatter($this):$this->formatter;
   }
   
    function getState()
    {
        return $this->_state=$this->_state===null?new PaymentEmployeeState($this->get('state')):$this->_state;
    }
  
    function getOptions()
    {
        return $this->_options=$this->_options===null?new PaymentEmployeeOptions($this->get('options')):$this->_options;
    } 
    
    function setOptions($options)
    {
        $this->set('options',json_encode($options));
        $this->_options=null;
        return $this;
    }
   
     function getSettings()
    {
        return $this->settings=$this->settings===null?new EmployeeWorkSettings():$this->settings;
    }
    
     function getEngine()
    {
        return $this->engine=$this->engine===null?new PaymentEmployeeEngine($this):$this->engine;
    }
     
    function setReference()
    {        
        $format_reference=$this->getSettings()->get('work_reference_format','W{year}{month}{day}{id}');
        $parameters=array('{year}'=>date("Y"),
                          '{month}'=>date("m"),
                          '{day}'=>date("d"),
                          '{id}'=>format_number($this->get('id'),$this->getSettings()->get('work_format_number','00000')));
        $this->set('reference',strtr($format_reference,$parameters));
        return $this;
    }   
   
   
    function getStateI18n()
    {
       return __($this->get('state'));
    }
    
    function hasRequests()
    {
        return !$this->getRequests()->isEmpty();
    }
    
    function getRequests()
    {
        if ($this->requests===null)
        {
            $this->requests=new EmployeeWorkPaymentRequestCollection();
             $db=mfSiteDatabase::getInstance()
                    ->setParameters(array('payment_id'=>$this->get('id')))                    
                    ->setQuery("SELECT * FROM ".EmployeeWorkPaymentRequest::getTable().   
                               " WHERE ". EmployeeWorkPaymentRequest::getTableField('payment_id')."='{payment_id}'"    .
                               ";")
                    ->makeSqlQuery();
                if (!$db->getNumRows())
                        return $this->requests;         
                while ($item=$db->fetchObject('EmployeeWorkPaymentRequest'))
                {                                   
                   $this->requests[$item->get('id')]=$item->loaded();
                }  
                $this->requests->loaded();
        }   
        return $this->requests;
    }
    
    
    
    
    function getTotalPriceWithTax()
     {
           return floatval($this->get('total_price_with_tax'));
     }
     
     function getTotalPriceWithoutTax()
     {
           return floatval($this->get('total_price_without_tax'));
     }
     
      function getOrderTotalPriceWithTax()
     {
           return floatval($this->get('order_total_price_with_tax'));
     }
     
     function setMethod(PaymentMethod $method)
    {        
        $this->set('method_id',$method);       
        return $this;
    }
    
     function setState($state)
    {                
        $this->set('state',$state);       
        return $this;
    }        
    
    
    function paid()
    {
        $this->set('state',PaymentEmployeeState::PAID);
        $this->save();
        $this->getRequests()->paid();
        return $this;
    }
    
    function inprogress()
    {
        $this->set('state',PaymentEmployeeState::INPROGRESS);
        $this->save();
        $this->getRequests()->inprogress();
        return $this;
    }
    
    function getCommission()
    {
        return $this->_commission_rate_id=$this->_commission_rate_id===null?new SaleEmployeeCommissionRate($this->get('commission_rate_id')):$this->_commission_rate_id;
    }
       
    
    function hasCommission()
    {
        return $this->get('has_commission')=='YES';
    }
    
    function getCommissionWithTax()
     {
           return floatval($this->get('commission_with_tax'));
     }
     
     function getCommissionWithoutTax()
     {
           return floatval($this->get('commission_without_tax'));
     }
     
     function getNumberOfRequests()
     {
         return intval($this->get('number_of_requests'));
     }
     
     function getGeneralPriceWithTax()
     {
           return floatval($this->get('general_price_with_tax'));
     }
     
      function getGeneralPriceWithoutTax()
     {
           return floatval($this->get('general_price_without_tax'));
     }
     
     function getPaymentPriceWithTax()
     {
           return floatval($this->get('payment_price_with_tax'));
     }
     
      function getPaymentPriceWithoutTax()
     {
           return floatval($this->get('payment_price_without_tax'));
     }
     
       function getGlobalPriceWithTax()
     {
           return floatval($this->get('global_price_with_tax'));
     }
     
      function getGlobalPriceWithoutTax()
     {
           return floatval($this->get('global_price_without_tax'));
     }
     
     
  /*   function getTotalPriceCommissionWithTax()
     {
         return $this->getTotalPriceWithTax() - $this->getCommissionWithTax();
     }*/
}