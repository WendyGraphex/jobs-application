<?php




class SaleBillingBase extends mfObject3 {
     
    protected static $fields=array('employer_user_id','company_id','culture','currency_id','state','lang','reference','payment_id',
                                   'number_of_quotations','total_sale_price_with_tax','total_sale_price_without_tax',
                                   'commission_with_tax','commission_without_tax','commission_rate_id',
                                   'global_sale_price_with_tax','global_sale_price_without_tax','order_id','method_id',
                                   'payment_sale_price_with_tax',
                                    'payment_sale_price_without_tax',
                                    'general_sale_price_with_tax',
                                    'general_sale_price_without_tax',
                                   'dated_at','year','month','day','tax_amount','taxes',
                                   'country','ip','message','secure','is_active','status', 'created_at','updated_at');    
    const table="t_sale_billing"; 
     protected static $foreignKeys=array('currency_id'=>'SiteCurrency',                                       
                                        'employer_user_id'=>'EmployerUser',                                       
                                        'company_id'=>'EmployerCompany',  
                                        'commission_id'=>'CartEmployerCommission',
                                        'order_id'=>'SaleOrder',
                                        'method_id'=>'PaymentMethod',
                                        'payment_id'=>'PaymentEmployerUser'
                                        ); // By default
    protected static $fieldsNull=array('updated_at','dated_at','year','month','day',); // By default


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
           if ($parameters instanceof PaymentEmployerUser)
               return $this->loadByPayment($parameters);
           if (is_numeric((string)$parameters)) 
              return $this->loadbyId((string)$parameters);        
        } 
    }   
      
    protected function loadByPayment(PaymentEmployerUser $payment)
    {        
        $this->set('payment_id',$payment);
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('payment_id'=>$payment->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                       " WHERE  ".self::getTableField('payment_id')."='{payment_id}'".                              
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
        ));      
    }
            
      function getValuesForUpdate()
      {
          $this->set('updated_at',date("Y-m-d H:i:s"));   
      }   
            
   /*   protected function executeIsExistQuery($db)    
      {
         $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
        $db->setParameters(array('email'=>$this->get('email'),$this->getKey()))
           ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE email='{email}' ".$key_condition)
           ->makeSqlQuery();  
       
      }*/
                  
      function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new SaleBillingFormatter($this):$this->formatter;
   }
               
    function getSettings()
    {
        return $this->settings=$this->settings===null? new SaleBillingSettings():$this->settings;
    }
    
      
    function getEmployerUser()
    {
        return $this->_employer_user_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;
    }
    function getEmployeeUser()
    {
        return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;
    }
    
    function getCompany()
    {
        return $this->_company_id=$this->_company_id===null?new EmployerCompany($this->get('company_id')):$this->_company_id;
    }
    
    function getMethod()
    {
        return $this->_method_id=$this->_method_id===null?new PaymentMethod($this->get('method_id')):$this->_method_id;
    }
    
    function getOrder()
    {
        return $this->_order_id=$this->_order_id===null?new SaleOrder($this->get('order_id')):$this->_order_id;
    }
    
    function getPayment()
    {
        return $this->_payment_id=$this->_payment_id===null? new PaymentEmployerUser($this->get('payment_id')):$this->_payment_id;
    }
    
     function getState()
    {
        return $this->_state=$this->_state===null?new SaleBillingState($this->get('state')):$this->_state;
    }
    
    function getStatus()
    {
        return $this->_status=$this->_status===null?new SaleBillingStatus($this->get('status')):$this->_status;
    }
    
   
    
     function getUrl()
    {
        return url_to('sales_billing',array('action'=>'ExportPdf'))."?".__('Billing')."=".$this->get('id');
    }
    
    function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/data/sales/billings/".$this->get('id');
    }
    
    function getNameForDocument()
    {
        return __('Billing')."-".$this->get('reference')."-".$this->getFormatter()->getDatedAt()->getDate('d-m-Y');
    }
       
    
     function getPdf()
    {
        return $this->pdf=$this->pdf===null?new File($this->getDirectory()."/".$this->getNameForDocument()."-".$this->get('id').".pdf"):$this->pdf;                            
    }
    
       function getPaymentSalePriceWithTax()
     {
           return floatval($this->get('payment_sale_price_with_tax'));
     }
     
     function getPaymentSalePriceWithoutTax()
     {
           return floatval($this->get('payment_sale_price_without_tax'));
     }
     
          function getTotalSalePriceWithTax()
     {
           return floatval($this->get('total_sale_price_with_tax'));
     }
     
     function getTotalSalePriceWithoutTax()
     {
           return floatval($this->get('total_sale_price_without_tax'));
     }
     
      function getGlobalSalePriceWithTax()
     {
           return floatval($this->get('global_sale_price_with_tax'));
     }
     
     function getGlobalSalePriceWithoutTax()
     {
           return floatval($this->get('global_sale_price_without_tax'));
     }
    
     function getGeneralSalePriceWithTax()
     {
           return floatval($this->get('general_sale_price_with_tax'));
     }
     
     function getGeneralSalePriceWithoutTax()
     {
           return floatval($this->get('general_sale_price_without_tax'));
     }
     
        function getCommissionWithTax()
     {
           return floatval($this->get( 'commission_with_tax'));
     }
     
        function getCommissionWithoutTax()
     {
           return floatval($this->get( 'commission_without_tax'));
     }
     
     function setReference()
    {        
        $format_reference=$this->getSettings()->get('billing_reference_format','B{year}{month}{day}{id}');
        $parameters=array('{year}'=>date("Y"),'{month}'=>date("m"), '{day}'=>date("d"),
                          '{id}'=>format_number($this->get('id'),$this->getSettings()->get('billing_format_number','00000')));
        $this->set('reference',strtr($format_reference,$parameters));
        return $this;
    }  
    
    function generate()
    {
        if ($this->getPayment()->isNotLoaded())
            return $this;
        if ($this->isLoaded())
            return $this;
        $this->add(array(
            'dated_at'=>date("Y-m-d H:i:s"),
            'year'=>date("Y"),
            'month'=>date("m"),
            'day'=>date("d")));
        $this->add($this->getPayment()->toArrayForBilling()); 
        $this->save();
        $this->setReference();
        $this->save();
        $collection = new SaleBillingQuotationCollection();
        foreach($this->getPayment()->getOrder()->getOrderQuotations() as $order_quotation)
        {
            $item=new SaleBillingQuotation();
            $item->add($order_quotation->toArrayForBilling());           
            $item->set('billing_id',$this);
            // payment adder                        
            $collection[]=$item;
        }
        $collection->save();
        
        return $this;
    }
    
    
    function getBillingQuotations()
    {
         if ($this->billing_quotations===null)          
         {    
            $this->billing_quotations = new SaleBillingQuotationCollection();  
            $db=mfSiteDatabase::getInstance()
                  ->setParameters(array('billing_id'=>$this->get('id')))
                  ->setQuery("SELECT * FROM ".SaleBillingQuotation::getTable()." WHERE billing_id='{billing_id}';")
                  ->makeSqlQuery();                            
            if (!$db->getNumRows())
                return $this->billing_quotations;       
            while ($item= $db->fetchObject('SaleBillingQuotation'))
            {
                $this->billing_quotations[]=$item->loaded();  
            }     
            $this->billing_quotations->loaded();
         }
         return $this->billing_quotations;
    }
    
     function getTaxAmount()
     {
           return floatval($this->get('tax_amount'));
     }
     
      function getTaxes()
     {
         return  $this->_taxes = $this->_taxes ===null ?new SaleBillingTaxes(new mfJson($this->get('taxes'))):$this->_taxes;
     }
     
     function setTaxes(mfArray $taxes)
     {
         $this->set('taxes',$taxes->toJson());
         return $this;
     }
}