<?php

class SiteEventOrderBase extends mfObject3 {
     
    protected static $fields=array('event_user_id','company_id','culture','currency_id','state','lang','reference',
                                   'number_of_events','total_sale_price_with_tax','total_sale_price_without_tax',
                                   'has_commission','commission_with_tax','commission_without_tax','commission_rate_id',
                                   'global_sale_price_with_tax','global_sale_price_without_tax','cart_id','method_id',
                                   'payment_price_without_tax','payment_price_with_tax','general_price_without_tax','general_price_with_tax',
                                   // paiement fees
                                    'dated_at','year','month','day',
                                    'number_of_payments','tax_amount','taxes',
                                    'payment_id',  'number_of_items',
                                   'country','ip','message','secure','is_active','status', 'created_at','updated_at'
                                   );    
    const table="t_site_event_order"; 
    protected static $foreignKeys=array('currency_id'=>'SiteCurrency',                                       
                                        'event_user_id'=>'SiteEventUser',                                       
                                       // 'company_id'=>'EmployerCompany',  
                                        'commission_id'=>'CartEmployerCommission',
                                        'cart_id'=>'SiteEventCart',
                                        'method_id'=>'PaymentMethod',
                                       //  'payment_id'=>'PaymentEmployerUser',
                                        ); // By default
    protected static $fieldsNull=array('updated_at','method_id','dated_at','year','month','day', 'payment_id'); // By default

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
         if ($parameters instanceof SiteEventCart)
            return $this->loadbyCart($parameters); 
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
         
      }   
    }
    
    
    function loadByCart(SiteEventCart $cart)
    {
        $this->set('cart_id',$cart);
    }
    
   /*  protected function loadByPhoneOrMobile($phone)
    {       
         $this->set('phone',$phone);
         $db=mfSiteDatabase::getInstance()->setParameters(array('phone'=>$phone));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE phone='{phone}' OR phone='{phone}';")
            ->makeSqlQuery();                           
         return $this->rowtoObject($db);
    }*/      
    
    protected function getDefaults()
    {
         $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
            'status'=>'ACTIVE',
            'is_active'=>'YES',
            'state'=>'INPROGRESS',
            'number_of_events'=>0,
            'number_of_items'=>0,
        ));            
    }     
    
    
    function isInProgress()
    {
        return $this->get('state')=='INPROGRESS';
    }
    
     function isOrdered()
    {
        return $this->get('state')=='ORDERED';
    }
    
     function isPaid()
    {
        return $this->get('state')=='PAID';
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
        
       function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new SiteEventOrderFormatter($this):$this->formatter;
    }
    
    function getState()
    {
        return $this->_state=$this->_state===null?new SiteEventOrderState($this->get('state')):$this->_state;
    }
    
    function getStatus()
    {
        return $this->_status=$this->_status===null?new SiteEventOrderStatus($this->get('status')):$this->_status;
    }
    
    
  
    
    function getEventUser()
    {
        return $this->_event_user_id=$this->_event_user_id===null?new SiteEventUser($this->get('event_user_id')):$this->_event_user_id;
    } 
    
    /*function getCompany()
    {
        return $this->_company_id=$this->_company_id===null?new EmployerCompany($this->get('company_id')):$this->_company_id;
    }*/
    
    function getCurrency()
    {
        return $this->_currency_id=$this->_currency_id===null?new SiteCurrency($this->get('currency_id')):$this->_currency_id;
    }
    
    function hasPayment()
    {
        return (boolean)$this->get('payment_id');
    }
    
  /*   function getPayment()
    {
        return $this->_payment_id=$this->_payment_id===null?new PaymentEmployerUser($this->get('payment_id')):$this->_payment_id;
    }*/
    
    function hasMethod()
    {
        return (boolean)$this->get('method_id');
    }
       
    function getEngine()
    {
        return $this->engine=$this->engine===null?new SiteEventOrderEngine($this):$this->engine;
    }         
    
     function getOrderEvents()
    {
         if ($this->order_events===null)          
         {    
            $this->order_events = new SiteEventOrderEventCollection();  
            $db=mfSiteDatabase::getInstance()
                  ->setParameters(array('order_id'=>$this->get('id')))
                  ->setQuery("SELECT * FROM ".SiteEventOrderEvent::getTable()." WHERE order_id='{order_id}';")
                  ->makeSqlQuery();                            
            if (!$db->getNumRows())
                return $this->order_events;       
            while ($item= $db->fetchObject('SiteEventOrderEvent'))
            {
                $this->order_events[]=$item->loaded();  
            }     
            $this->order_events->loaded();
         }
         return $this->order_events;
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
    
          function getCommissionWithTax()
     {
           return floatval($this->get( 'commission_with_tax'));
     }
     
        function getCommissionWithoutTax()
     {
           return floatval($this->get( 'commission_without_tax'));
     }
     
      function getPaymentSalePriceWithTax()
     {
           return floatval($this->get('payment_sale_price_with_tax'));
     }
     
     function getPaymentSalePriceWithoutTax()
     {
           return floatval($this->get('payment_sale_price_without_tax'));
     }
    
      
     function getGeneralPriceWithoutTax()
     {
           return floatval($this->get('general_price_without_tax'));
     }
     
     function getGeneralSalePriceWithTax()
     {
           return floatval($this->get('general_price_with_tax'));
     }
     
    function getStatusI18n()
    {
        return __($this->get('status'));
    }
    
    function getStateI18n()
    {
        return __($this->get('state'));
    }
    
    function getLanguage()
    {
        return $this->get('lang'); //mfContext::getInstance()->getUser()->getLanguage();
    }
    
    function getSettings()
    {
        return $this->settings=$this->settings===null?new SiteEventOrderSettings():$this->settings;
    }
    
      function setReference()
    {                 
        $format_reference=$this->getSettings()->get('site_event_order_format_reference');
        $parameters=array('{year}'=>$this->get('year'),
                          '{month}'=>$this->get('month'),
                          '{day}'=>$this->get('day'),
                          '{id}'=>format_number($this->get('id'),$this->getSettings()->get('site_event_order_format_number','0000')));
        $this->set('reference',strtr($format_reference,$parameters));
        return $this;
    }    
    
    function getCart()
    {
        return $this->_cart_id=$this->_cart_id===null?new SiteEventCart($this->get('cart_id')):$this->_cart_id;
    }
        
    function getMethod()
    {
        return $this->_method_id=$this->_method_id===null?new PaymentMethod($this->get('method_id')):$this->_method_id; 
    }
    
    
         
    function create()
    {
        if ($this->getCart()->isNotLoaded())
            return $this;                  
        $this->add($this->getCart()->toArray(array('event_user_id','company_id','currency_id','lang',
                                   'number_of_events','total_sale_price_with_tax','total_sale_price_without_tax',
                                   'has_commission','commission_with_tax','commission_without_tax','commission_rate_id',
                                   'tax_amount','taxes', 'number_of_items',
                                   'global_sale_price_with_tax','global_sale_price_without_tax')));               
        $this->add(array(
            'ip'=> mfcontext::getInstance()->getRequest()->getIP(),                  
            'culture'=>mfcontext::getInstance()->getUser()->getCulture(),
            'lang'=>mfcontext::getInstance()->getUser()->getLanguage(),
            'country'=>mfcontext::getInstance()->getUser()->getCountry(),
            'dated_at'=>date("Y-m-d H:i:s"),
            'year'=>date("Y"),
            'month'=>date("m"),
            'day'=>date("d")
            ));
        $this->save();       
        $this->setReference();
        $this->save();
        
        $this->order_events = new SiteEventOrderEventCollection();  
        foreach ($this->getCart()->getCartEvents() as $cart_event)
        {
            $item=new SiteEventOrderEvent();  
            $item->add($cart_event->toArray(array('event_id','tax_id','seller_user_id','event_user_id'                                   ,
                                   'sale_price_with_tax','sale_price_without_tax',
                                   'total_sale_price_with_tax','total_sale_price_without_tax',
                                   'quantity')));          
            $item->set('cart_event_id',$cart_event);
            $item->set('cart_id',$this->getCart());
            $item->set('order_id',$this);
            $item->setSignature();
            $this->order_events[]=$item;
        }    
        $this->order_events->save(); 
        
        //$this->getEngine()->process();
        
        
        $this->getCart()->set('state','ORDERED')->save();    // PAYMENT IN PROGRESS
        return $this;
    }
    
    
    
    function setMethod(PaymentMethod $method)
    {
        
        $this->set('method_id',$method);
       // $this->set('state','ORDERED');
        //$this->getEngine()->process();
        
        // cart update
        
        return $this;
    }
    
    function setOrdered()
    {
        return $this->set('state','ORDERED');
    }
    
    /*
     * 'employer_advert_id'=>'EmployerAdvert',        
                                        'employee_advert_id'=>'EmployeeAdvert',        
                                        'employer_user_id'=>'EmployerUser',
                                        'employee_user_id'=>'Employee',
                                        'project_id'=>'EmployerProject'
     */
    
  /*   function getQuotations()
    {
        if ($this->quotations===null)          
         {    
            $this->quotations = new SaleEmployeeQuotationCollection();  
            $db=mfSiteDatabase::getInstance()
                  ->setParameters(array('order_id'=>$this->get('id')))
                  ->setObjects(array('EmployerAdvert','EmployerProject','SaleEmployeeQuotation','EmployerAdvertI18n','EmployeeAdvertI18n'))
                  ->setQuery("SELECT {fields} FROM ".SaleEmployeeQuotation::getTable().
                             " LEFT JOIN ".SaleEmployeeQuotation::getOuterForJoin('project_id'). 
                             " LEFT JOIN ".SaleEmployeeQuotation::getOuterForJoin('employee_advert_id').  
                             " LEFT JOIN ".SaleEmployeeQuotation::getOuterForJoin('employer_advert_id').  
                             " LEFT JOIN ".EmployerAdvertI18n::getInnerForJoin('advert_id')." AND ". EmployerAdvertI18n::getTableField('lang')."=".SaleEmployeeQuotation::getTableField('employer_advert_lang').  
                             " LEFT JOIN ".EmployeeAdvertI18n::getInnerForJoin('advert_id')." AND ". EmployeeAdvertI18n::getTableField('lang')."=".SaleEmployeeQuotation::getTableField('employee_advert_lang').
                             " INNER JOIN ".SaleOrderQuotation::getInnerForJoin('quotation_id').
                             " WHERE order_id='{order_id}'".                          
                             ";")
                  ->makeSqlQuery();   
           // echo $db->getQuery();
            if (!$db->getNumRows())
                return $this->quotations;       
            while ($items= $db->fetchObjects())
            {
                $item=$items->getSaleEmployeeQuotation();                      
                $item->set('project_id',$items->hasEmployerProject()?$items->getEmployerProject():false);
                $item->set('employer_advert_id',$items->hasEmployerAdvert()?$items->getEmployerAdvert():false);
                if ($item->hasEmployerAdvert())
                    $item->getEmployerAdvert()->setI18n($items->getEmployerAdvertI18n());
                $item->set('employee_advert_id',$items->hasEmployeeAdvert()?$items->getEmployeeAdvert():false);
                if ($item->hasEmployeeAdvert())
                    $item->getEmployeeAdvert()->setI18n($items->getEmployeeAdvertI18n());
                $this->quotations[]=$item;  
            }     
            $this->quotations->loaded();
         }
         return $this->quotations;
    }*/
    
    
    function toArrayForBilling()
    {
       return $this->toArray(array('event_user_id','company_id','culture','currency_id','lang',
                                   'number_of_events','total_sale_price_with_tax','total_sale_price_without_tax',
                                   'commission_with_tax','commission_without_tax','commission_rate_id','number_of_items',
                                   'global_sale_price_with_tax','global_sale_price_without_tax','method_id','tax_amount','taxes',
                                   // paiement fees
                                   'country','ip','message','secure'));
    }
    
    
     function getUrl()
    {
        return url_to('site_event_order',array('action'=>'ExportPdf'))."?".__('Billing')."=".$this->get('id');
    }
    
    function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/data/events/orders/".$this->get('id');
    }
    
    function getNameForDocument()
    {
        return __('Order')."-".$this->get('reference')."-".$this->getFormatter()->getDatedAt()->getDate('d-m-Y');
    }
       
    
     function getPdf()
    {
        return $this->pdf=$this->pdf===null?new File($this->getDirectory()."/".$this->getNameForDocument()."-".$this->get('id').".pdf"):$this->pdf;                            
    }
    
    function getNumberOfPayments()
    {
        return intval($this->get('number_of_payments'));
    }
    
     function ordered()
    {
        return $this->set('state','ORDERED')->save();
    }
        
     function inprogress()
    {
        return $this->set('state','INPROGRESS')->save();
    }
    
     function paid()
    {
        return $this->set('state','PAID')->save();
    }
    
     function getTaxAmount()
     {
           return floatval($this->get('tax_amount'));
     }
     
      function getTaxes()
     {
         return  $this->_taxes = $this->_taxes ===null ?new SiteEventOrderTaxes(new mfJson($this->get('taxes'))):$this->_taxes;
     }
     
     function setTaxes(mfArray $taxes)
     {
         $this->set('taxes',$taxes->toJson());
         return $this;
     }
     
     
     function cancel()
     {
         if ($this->isNotLoaded()) return $this;
         $this->set('state','CANCELLED');
         return $this->save();
     }
}
