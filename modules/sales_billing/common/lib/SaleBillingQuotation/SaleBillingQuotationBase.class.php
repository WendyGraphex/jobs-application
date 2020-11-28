<?php

class SaleBillingQuotationBase extends mfObject3 {
     
    protected static $fields=array('signature','billing_id','order_id','tax_id',
                                   'in_at','out_at','number_of_hours','employer_user_id',
                                   'order_quotation_id','quotation_id','project_id',
                                   'sale_price_with_tax','sale_price_without_tax','employee_user_id',
                                   'total_sale_price_with_tax','total_sale_price_without_tax',
                                   'quantity','comments','status',
                                   'created_at','updated_at');    
   const table="t_sale_billing_quotation"; 
   protected static $foreignKeys=array('billing_id'=>'SaleBilling',
                                       'employee_user_id'=>'Employee',
                                       'employer_user_id'=>'EmployerUser',                                                         
                                       'tax_id'=>'SaleTax',
                                       'order_id'=>'SaleOrder',
                                       'project_id'=>'EmployerProject',
                                       'order_quotation_id'=>'SaleOrderQuotation',
                                       'quotation_id'=>'SaleEmployeeQuotation'); // By default                                      
   protected static $fieldsNull=array('in_at','out_at','tax_id','project_id'); // By default

    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']);            
          if (isset($parameters['signature']))
             return $this->loadbySignature((string)$parameters['signature']);    
          return $this->add($parameters); 
      }   
      else
      {         
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
         
      }   
    }
            
     protected function loadBySignature($signature)
    {                
         $db=mfSiteDatabase::getInstance()->setParameters(array('signature'=>$signature));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE signature='{signature}';")
            ->makeSqlQuery();                           
         return $this->rowtoObject($db);
    }      
    
    protected function getDefaults()
    {
       $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
            'status'=>'ACTIVE',
            'quantity'=>1
        ));                 
    }          
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
    
   
    protected function executeIsExistQuery($db)    
    {
       $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
       $db->setParameters(array('signature'=>$this->get('signature'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE signature='{signature}' ".$key_condition)
         ->makeSqlQuery();  
     
    } 
    
        function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new SaleBillingQuotationFormatter($this):$this->formatter;
    }
    
    
   /*  function getEngine()
    {
        return $this->engine=$this->engine===null?new CartQuotationEngine($this):$this->engine;
    }*/
        
    function getCart()
    {
        return $this->_cart_id=$this->_cart_id===null?new Cart($this->get('cart_id')):$this->_cart_id;
    } 
    
    function getQuotation()
    {
        return $this->_quotation_id=$this->_quotation_id===null?new SaleEmployeeQuotation($this->get('quotation_id')):$this->_quotation_id;
    } 
    
     function getTax()
    {
        return $this->_tax_id=$this->_tax_id===null?new SaleTax($this->get('tax_id')):$this->_tax_id;
    } 
    
    function setSignature()
    {
        $this->set('signature',md5($this->get('in_at').$this->get('out_at').$this->get('quotation_id').$this->get('comments').$this->get('cart_id').$this->get('quantity')));        
        return $this;
    }
        
    function getSalePriceWithTax()
     {
         return floatval($this->get('sale_price_with_tax'));
     }
     
     function getSalePriceWithoutTax()
     {
           return floatval($this->get('sale_price_without_tax'));
     }
     
     function getTotalSalePriceWithTax()
     {
           return floatval($this->get('total_sale_price_with_tax'));
     }
     
     function getTotalSalePriceWithoutTax()
     {
           return floatval($this->get('total_sale_price_without_tax'));
     }
     
     function getQuantity()
     {
         return floatval($this->get('quantity'));
     }
     
      function getStatusI18n()
    {
        return __($this->get('status'));
    }  
    
    function getTotalTax()
    {
        return $this->getTotalSalePriceWithoutTax() * $this->getTax()->getRate()->getValue();
    }
    
     function getEmployeeUser()
    {
        return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;
    }
}
