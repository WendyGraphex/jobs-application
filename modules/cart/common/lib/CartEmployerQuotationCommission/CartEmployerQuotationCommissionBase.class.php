<?php

class CartEmployerQuotationCommissionBase extends mfObject3 {
     
    protected static $fields=array('quotation_id','cart_quotation_id','employer_user_id','company_id','cart_id','title','price_with_tax','price_without_tax','tax_id',
                                   'text_id',
                                   'created_at','updated_at');    
   const table="t_cart_quotation_commission"; 
   protected static $foreignKeys=array('cart_id'=>'Cart',
                                       'employer_user_id'=>'EmployerUser',                                       
                                       'company_id'=>'EmployerCompany',  
                                       'cart_quotation_id'=>'CartQuotation',
                                       'quotation_id'=>'SaleEmployeeQuotation'); // By default
   protected static $fieldsNull=array('tax_id'); // By default

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
         // if ($parameters instanceof CartQuotation)
        //    return $this->loadbyCartQuotation($parameters);           
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);         
      }   
    }
          
   /* protected function loadByCartQuotation(CartQuotation $cart_quotation)
    {
        foreach (array('cart_id','employer_user_id','company_id','quotation_id') as $field)
                $this->set($field,$cart_quotation->get($field));
        $this->set('cart_quotation_id',$cart_quotation);                               
    }    */    
       
    
    protected function getDefaults()
    {
       $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
            'status'=>'ACTIVE',
       
        ));                 
    }          
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
    
   
    /*protected function executeIsExistQuery($db)    
    {
       $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
       $db->setParameters(array('signature'=>$this->get('signature'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE signature='{signature}' ".$key_condition)
         ->makeSqlQuery();  
     
    } */
   
     function getPricePriceWithTax()
     {
           return floatval($this->get('price_with_tax'));
     }
     
     function getPriceWithoutTax()
     {
           return floatval($this->get('price_without_tax'));
     }
    
}

