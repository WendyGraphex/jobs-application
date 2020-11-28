<?php
 

class SiteEventCommissionRateBase extends mfObject3 {
     
    protected static $fields=array('commission_id','from','to','fix','rate','start_at','expired_at','is_active','created_at','updated_at');
    const table="t_sale_employee_commission_rate";
    protected static $foreignKeys=array('commission_id'=>'SaleEmployeeCommission'); // By default
    protected static $fieldsNull=array('updated_at','start_at','expired_at'); 
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']); 
         if (isset($parameters['total_sales_with_tax']))
             return $this->loadByTotalSalesWithTax($parameters['total_sales_with_tax']);
          return $this->add($parameters); 
      }   
      else
      {        
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
        
      }   
    } 
        
    function loadByTotalSalesWithTax($total_sales_with_tax)
    {
         $db=mfSiteDatabase::getInstance()
                ->setParameters(array('total_sales_with_tax'=>$total_sales_with_tax))
                ->setQuery("SELECT * FROM ".self::getTable().                           
                            " WHERE `from` < {total_sales_with_tax} AND `to` >= {total_sales_with_tax}".
                            ";")               
                ->makeSqlQuery(); 
        //  echo $db->getQuery();
         return $this->rowtoObject($db);
    }
   
    function getValuesForUpdate()
    {
      $this->set('updated_at',date("Y-m-d H:i:s"));   
    }       
    
     protected function getDefaults()
    {
          $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
            'is_active'=>'NO',
        ));       
    }        
       
    protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' AND name!='' ".$key_condition)
         ->makeSqlQuery();       
    }
       
    
     function getCommission()
    {
       return $this->_commission_id=$this->_commission_id===null?new SaleEmployeeCommission($this->get('commission_id')):$this->_commission_id;                 
    }   
    
           function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new SaleEmployeeCommissionRateFormatter($this):$this->formatter;
   }
 
   function getFix()
   {
       return floatval($this->get('fix'));
   }
   
   function getRate()
   {
       return floatval($this->get('rate'));
   }
}
