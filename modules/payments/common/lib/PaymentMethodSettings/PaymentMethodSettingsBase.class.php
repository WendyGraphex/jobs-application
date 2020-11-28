<?php


class PaymentMethodSettingsBase extends mfObject3 {
    
    protected static $fields=array('method_id','amount_maximum','amount_minimum','adder','adder_rate','tax_rate','created_at','updated_at');
    const table="t_payment_method_settings"; 
      protected static $foreignKeys=array('method_id'=>'PaymentMethod',); // By default
     
    function __construct($parameters=null) {
      parent::__construct();
      $this->getDefaults();
      if ($parameters === null)
         return $this;
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
              return $this->loadbyId((string)$parameters['id']);           
          return $this->add($parameters); 
      }   
      else
      {
         if ($parameters instanceof PaymentMethod)
             return $this->loadByMethod($parameters);
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);            
         return $this->loadbyName((string)$parameters);  
        // return $this->loadbyModule((string)$parameters);
      }   
    }   
    
    
    protected function loadByMethod(PaymentMethod $method)
    {        
        $db=mfSiteDatabase::getInstance()->setParameters(array('method_id'=>$method->get('id')));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE method_id='{method_id}';")
            ->makeSqlQuery();                           
        return $this->rowtoObject($db); 
    } 
    
 /*   protected function loadByModule($module)
    {
        $this->set('module',$module);
        $db=mfSiteDatabase::getInstance()->setParameters(array('module'=>$module));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE module='{module}';")
            ->makeSqlQuery();                           
        return $this->rowtoObject($db); 
    }   */
    
    
    protected function getDefaults()
    {
      $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),   
           'amount_maximum'=>0.0,
          'amount_minimum'=>0.0,
          'adder'=>0.0,
          'adder_rate'=>0.0,
          'tax_rate'=>0.0,
        ));   
    }
    
    
    function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new PaymentSettingsFormatter($this):$this->formatter;
    }
   
     function getValuesForUpdate()
    {
         $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
    
    function getEngine()
    {
        return $this->engine=$this->engine===null?new PaymentMethodSettingsEngine($this):$this->engine;
    } 
        
    
    function getAdder()
    {
        return  floatval($this->get('adder'));
    }
    
    function getAdderRate()
    {
        return  floatval($this->get('adder_rate'));
    }
    
     function getTaxRate()
    {
        return  floatval($this->get('tax_rate'));
    }
        
    static function getAll()
   {
        static $list=null;
       if ($list) return $list;
       $list=new PaymentMethodSettingsCollection();
       $db=mfSiteDatabase::getInstance()
                    ->setParameters(array())                  
                    ->setQuery("SELECT * FROM ".PaymentMethodSettings::getTable().                                                                                 
                               ";")
                    ->makeSqlQuery();
        if (!$db->getNumRows())
                return $list;         
        while ($item=$db->fetchObject('PaymentMethodSettings'))
        {                         
           $list[$item->get('id')]=$item->loaded();
        }  
       return $list;
   }
   
}
