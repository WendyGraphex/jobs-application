<?php


class SaleTaxBase extends mfObject3 {
    
    const table="t_sale_tax";     
        protected static $fields=array('rate','description','created_at','updated_at');
   
  function __construct($parameters=null,$site=null) {
      parent::__construct(null,$site);    
    $this->getDefaults();  
    if ($parameters===null) return $this;  
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
           if (isset($parameters['id']))
               return $this->loadById((string)$parameters['id']);          
           if (isset($parameters['rate']))
               return $this->loadByRate((string)$parameters['rate']);                     
            return $this->add($parameters);
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
             return $this->loadbyId((string)$parameters);
         return $this->loadByRate((string)$parameters['rate']);     
      }   
    }
    
    protected function loadByRate($rate)
    {             
        $this->set('rate',$rate);       
        $db=mfSiteDatabase::getInstance()
          ->setParameters(array('rate'=>$rate))
          ->setQuery("SELECT * FROM ".self::getTable()." WHERE `rate`='{rate}';")
          ->makeSiteSqlQuery($this->site);          
         return $this->rowtoObject($db);
    }   
    
    
    
    protected function getDefaults()
    {
        $this->setIfNotNull(array(
            'rate'=>0.0,
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
      $db->setParameters(array('rate'=>$this->rate,$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE `rate`='{rate}'".$key_condition)
         ->makeSiteSqlQuery($this->site); 
    }
    
    
    
      function getRate()
    {
      return new FloatFormatter($this->rate);
    }
    
   function getDescription()
    {
      return new mfString($this->description);
    }
    

    
        function getCreatedAt()
    {
      return new DateTimeFormatter($this->created_at);
    }
    
        function getUpdatedAt()
    {
      return new DateTimeFormatter($this->updated_at);
    }
    
          
    
    function __toString() {
        return (string)($this->get('rate') * 100);
    }
    
    function getFormattedTax()
    {
        return format_pourcentage($this->get('rate'));
    }
}



