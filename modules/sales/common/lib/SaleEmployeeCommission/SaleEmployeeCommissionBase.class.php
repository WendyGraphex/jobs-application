<?php


class SaleEmployeeCommissionBase extends mfObject3 {
     
    protected static $fields=array('name','is_active','number_of_rates','start_at','expired_at','created_at','updated_at');
    const table="t_sale_employee_commission";
     protected static $fieldsNull=array('updated_at','start_at','expired_at'); 
    
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
      
    function hasExpired()
    {
        return (boolean)$this->get('expired_at');
    }
    
    function hasStarted()
    {
        return (boolean)$this->get('started_at');
    }
    
       function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new SaleEmployeeCommissionFormatter($this):$this->formatter;
   }
   
   function getRates()
   {
       if ($this->rates===null)
       {
           $this->rates=new SaleEmployeeCommissionRateCollection();
           $db=mfSiteDatabase::getInstance()
                ->setParameters(array('commission_id'=>$this->get('id')))
                ->setQuery("SELECT * FROM ".SaleEmployeeCommissionRate::getTable().                           
                            " WHERE commission_id='{commission_id}'".
                            ";")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $this->rates;       
        while ($item=$db->fetchObject('SaleEmployeeCommissionRate'))
        {
           $this->rates[$item->get('id')]=$item->loaded();
        }
       }   
       return $this->rates;
   }
   
   function updateRates(mfArray $rates)
   {
       if ($rates->isEmpty())
           return $this;
       $db=mfSiteDatabase::getInstance()
                ->setParameters(array())
                ->setQuery("DELETE FROM ".SaleEmployeeCommissionRate::getTable().";")               
                ->makeSqlQuery(); 
       $this->rates=new SaleEmployeeCommissionRateCollection();
       foreach ($rates as $values)
       {
           $item=new SaleEmployeeCommissionRate();
           $item->set('commission_id',$this);
           $item->add($values);
           $this->rates[]=$item;       
       }       
       $this->rates->save();
       $this->set('number_of_rates',$this->rates->count())->save();
       return $this;
   }
}
