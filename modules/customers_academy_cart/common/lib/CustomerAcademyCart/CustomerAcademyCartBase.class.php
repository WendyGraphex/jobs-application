<?php


class CustomerAcademyCartBase extends mfObject3 {
     
    protected static $fields=array('student_user_id','company_id','culture','currency_id','state','lang','reference',
                                   'number_of_courses','total_sale_price_with_tax','total_sale_price_without_tax',
                                   'has_commission','commission_with_tax','commission_without_tax','commission_rate_id',
                                   'global_sale_price_with_tax','global_sale_price_without_tax','tax_amount','taxes',
                                   'country','ip','message','secure','is_active','status', 'created_at','updated_at');    
    const table="t_cart"; 
    protected static $foreignKeys=array('currency_id'=>'SiteCurrency',                                       
                                       // 'employer_user_id'=>'EmployerUser',                                       
                                       
                                     //   'commission_id'=>'CartEmployerCommission',
                                      //  'commission_rate_id'=>'SaleEmployerCommissionRate'
                                        ); // By default
    protected static $fieldsNull=array('updated_at'); // By default

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
            'has_commission'=>'NO'
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
        
       function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new CartFormatter($this):$this->formatter;
    }
    
    function hasEmployerUser()
    {
        return (boolean)$this->employer_user_id;
    }
    
    function getEmployerUser()
    {
        return $this->_employer_user_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;
    }
    
    function getCompany()
    {
        return $this->_company_id=$this->_company_id===null?new EmployerCompany($this->get('company_id')):$this->_company_id;
    }
    
    function getCurrency()
    {
        return $this->_currency_id=$this->_currency_id===null?new SiteCurrency($this->get('currency_id')):$this->_currency_id;
    }            
    
      function getState()
    {
        return $this->_state=$this->_state===null?new CartState($this->get('state')):$this->_state;
    }
    
    function getStatus()
    {
        return $this->_status=$this->_status===null?new CartStatus($this->get('status')):$this->_status;
    }
    
    
    function addQuotation(CartQuotation $item)
    {
        if ($this->cart_quotations===null)          
            $this->cart_quotations = new CartQuotationCollection();                           
        $item->set('cart_id',$this);          
        $this->cart_quotations[]=$item;        
        return $this;
    }
    
  /*  function deleteQuotation(CartQuotation $cart_quotation)
    {        
        $cart_quotation->set('status','DELETE')->save();
        $this->getCartQuotations()->deleteQuotation($cart_quotation);                 
        return $this;
    }*/
    
    function getEngine()
    {
        return $this->engine=$this->engine===null?new CartEngine($this):$this->engine;
    }
    
    function clean()
    {
        $this->cart_quotations = null; 
        $this->cart_quotations_with_tax= null;
        return $this;
    }
    
    function getCartQuotations()
    {
         if ($this->cart_quotations===null)          
         {    
            $this->cart_quotations = new CartQuotationCollection();  
            $db=mfSiteDatabase::getInstance()
                  ->setParameters(array('cart_id'=>$this->get('id')))
                  ->setQuery("SELECT * FROM ".CartQuotation::getTable()." WHERE cart_id='{cart_id}';")
                  ->makeSqlQuery();                            
            if (!$db->getNumRows())
                return $this->cart_quotations;       
            while ($item= $db->fetchObject('CartQuotation'))
            {
                $this->cart_quotations[]=$item->loaded();  
            }     
            $this->cart_quotations->loaded();
         }
         return $this->cart_quotations;
    }
    
    
   /* function getCartCommissions()
    {
         if ($this->cart_commissions===null)          
         {    
            $this->cart_commissions = new CartEmployerQuotationCommissionCollection();  
            $db=mfSiteDatabase::getInstance()
                  ->setParameters(array('cart_id'=>$this->get('id')))
                  ->setQuery("SELECT * FROM ".CartEmployerQuotationCommission::getTable()." WHERE cart_id='{cart_id}';")
                  ->makeSqlQuery();                            
            if (!$db->getNumRows())
                return $this->cart_commissions;       
            while ($item= $db->fetchObject('CartEmployerQuotationCommission'))
            {
                $this->cart_commissions[]=$item->loaded();  
            }     
            $this->cart_commissions->loaded();
         }
         return $this->cart_commissions;
    }*/
    
    
   /*  function getCartProductsWithTax()
    {
         if ($this->cart_products_with_tax===null)          
         {    
            $this->cart_products_with_tax = new CartProductCollection();  
            $db=mfSiteDatabase::getInstance()
                  ->setParameters(array('cart_id'=>$this->get('id')))
                  ->setObjects(array('CartProduct','ProductTax'))
                  ->setQuery("SELECT {fields} FROM ".CartProduct::getTable().
                             " INNER JOIN ".CartProduct::getOuterForJoin('tax_id').
                             " WHERE cart_id='{cart_id}';")
                  ->makeSqlQuery();                            
            if (!$db->getNumRows())
                return $this->cart_products_with_tax;       
            while ($items= $db->fetchObjects())
            {
                $item=$items->getCartProduct();
                $item->set('tax_id',$items->getProductTax());
                $this->cart_products_with_tax[]=$item;  
            }               
         }
         return $this->cart_products_with_tax;
    }*/
    
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
        return $this->settings=$this->settings===null?new CartSettings():$this->settings;
    }
    
      function setReference()
    {        
        $format_reference=$this->getSettings()->get('cart_format_reference');
        $parameters=array('{year}'=>$this->get('year'),
                          '{month}'=>$this->get('month'),
                          '{id}'=>format_number($this->get('id'),$this->getSettings()->get('cart_format_number','0000')));
        $this->set('reference',strtr($format_reference,$parameters));
        return $this;
    }    
    
    
    function getCommission()
    {
        return $this->_commission_rate_id=$this->_commission_rate_id===null?new SaleEmployerCommissionRate($this->get('commission_rate_id')):$this->_commission_rate_id;
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
     
     function getTaxAmount()
     {
           return floatval($this->get('tax_amount'));
     }
     
      function getTaxes()
     {
         return  $this->_taxes = $this->_taxes ===null ?new CartTaxes(new mfJson($this->get('taxes'))):$this->_taxes;
     }
     
     function setTaxes(mfArray $taxes)
     {
         $this->set('taxes',$taxes->toJson());
         return $this;
     }
}
