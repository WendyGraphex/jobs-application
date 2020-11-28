<?php


class SiteCurrencyBase extends mfObject3 {
    
    const table="t_site_currency";     
    protected static $fields=array('rate','code','position','is_active','created_at','updated_at');
    protected static $foreignKeys=array(); 
    protected static $fieldsNull=array(); 
    
  function __construct($parameters=null) {
      parent::__construct();    
    $this->getDefaults();  
    if ($parameters===null) return $this;  
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
           if (isset($parameters['id']))
               return $this->loadById((string)$parameters['id']);
          /* if (isset($parameters['name']))
               return $this->loadByName((string)$parameters['name']); */
           return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
             $this->loadbyId((string)$parameters);
         else
             $this->loadByCode((string)$parameters);
      }   
    }
    
    protected function loadByCode($code)
    {     
         $db=mfSiteDatabase::getInstance()->setParameters(array($code));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE code='%s';")
            ->makeSqlQuery();                           
        return $this->rowtoObject($db);
    }      
    
    protected function getDefaults()
    {    	
        $this->setIfNotNull(array(
            'rate'=>0.0,
            'is_active'=>"NO",
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
        ));
    }
        
    function getValuesForUpdate()
    {
          $this->set('updated_at',date("Y-m-d H:i:s"));     
    }   
    
    protected function executeIsExistQuery($db)    
    {
      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('code'=>$this->code,$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE (code='{code}')".$key_condition)
         ->makeSiteSqlQuery($this->site); 
    }
    
   
    
    function getRate()
    {
      return new FloatFormatter($this->get('rate'));
    }
    
    function getCode()
    {
      return new CurrencyFormatter($this->get('code'));
    }
    
    
    function __toString()
    {
        return (string)$this->get('code');
    }
   
    public function isBase()
    {
        return ($this->get('rate')==1);
    }        
    
    function isActive()
    {
        return $this->get('is_active')=='YES';
    }
    function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new SiteCurrencyFormatter($this):$this->formatter;
   }
}



