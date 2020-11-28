<?php

class SaleEmployerQuotationCommissionBase extends mfObject3 {
     
    protected static $fields=array('quotation_id','employer_user_id','company_id','title','price','tax_id',
                                   'created_at','updated_at');    
   const table="t_sale_employer_quotation_commission"; 
   protected static $foreignKeys=array('company_id'=>'EmployerCompany', 
                                       'employer_user_id'=>'EmployerUser',                                       
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
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);         
      }   
    }
            
       
    
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
   
}

