<?php

class PaymentBase extends OrderedObject {
    
    protected static $fields=array('module','position','is_active','created_at','updated_at');
    const table="t_payments"; 
     
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
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);         
         return $this->loadbyModule((string)$parameters);
      }   
    }   
    
    protected function loadByModule($module)
    {
        $this->set('module',$module);
        $db=mfSiteDatabase::getInstance()->setParameters(array('module'=>$module));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE module='{module}';")
            ->makeSqlQuery();                           
        return $this->rowtoObject($db); 
    }   
    
    protected function executeLoadById($db)
    {
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
            ->makeSqlQuery();      
    }
    
    protected function executeUpdateQuery($db)
    {
       $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".self::getKeyName()."=%d ;")
          ->makeSqlQuery();      
    }
     
    protected function getDefaults()
    {
       $this->created_at=date("Y-m-d H:i:s");
       $this->updated_at=date("Y-m-d H:i:s");
       $this->is_active=$this->get('is_active','NO');
    }
    
    protected function executeInsertQuery($db)
    {
        $db->makeSqlQuery();      
    }
    
    protected function executeDeleteQuery($db)
    {
        $db->setQuery("DELETE FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
          ->makeSqlQuery();      
    }
    
     function getValuesForUpdate()
    {
         $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
    
    /* ============= ORDERED OBJECT METHOD ================================= */
     protected function executeLastPositionQuery($db)
    {
     $db->setQuery("SELECT max(position) FROM ".static::getTable().";")
         ->makeSqlQuery();      
    }
    
    protected function executeShiftUpQuery($db)
    {
       $db->setQuery("UPDATE ".static::getTable()." SET position=position + 1 WHERE position < %d AND position >= %d;")
          ->makeSqlQuery();      
    }
    
    protected function executeShiftDownQuery($db)
    {
        $db->setQuery("UPDATE ".static::getTable()." SET position=position - 1 WHERE position > %d AND position <= %d;")
            ->makeSqlQuery();      
    }
    
    protected function executeShiftQuery($db)
    {
        $db->setQuery("UPDATE ".static::getTable()." SET position=position - 1 WHERE position > %d;")
          ->makeSqlQuery();      
    }
    
    protected function executeSiblingQuery($db)
    {
       $db->setQuery("SELECT * FROM ".static::getTable()." WHERE position={position};")
          ->makeSqlQuery();      
    }
    /* ============= G E T T E R S ============================= */
   
     function getRequestName()
    {
       return "payment".ucfirst(str_replace("payments_","",$this->get('module')));       
    }
    
    function getModule()
    {
        return $this->get('module');
    }
    
    function getName()
    {
        return ucfirst(str_replace("payments_","",$this->get('module')));
    }
    /* =============== P R I C E   E N G I N E   E N G I N E ==================== */
    function loadpaymentEngine($cart=null,$culture=null) //,$user=null,$options=array())
    {               
        if (!$this->paymentEngine)
        {    
            $class="payment".ucfirst(str_replace("payments_","",$this->get('module')))."Engine";             
            if (!class_exists($class))
                throw new paymentEngineException(paymentEngineException::ERROR_payment_CLASS_NOT_EXISTS);                     
            $this->paymentEngine=new $class($cart,$this); //,$options);               
        }                       
        $this->loadTextI18N($culture);
        return $this->paymentEngine;
    }
    
    function loadTextI18N($culture)
    {
             
      // if ($culture!=$this->getpaymentEngine()->getCart()->get('culture'))
      //     $culture= mfContext::getInstance()->getUser()->getCulture(); 
       $this->getpaymentEngine()->loadTextI18N($culture,$this->getSite());   
    }
    
    function getpaymentEngine()
    {
        return $this->paymentEngine;
    }
    
    function haspaymentEngine()
    {
        return ($this->paymentEngine!=null);
    }
    
    function getType()
    {
        return str_replace("payments_","",$this->get('module'));
    }
    
    /* ============================== M E T H O D S ===================================== */
    
    function disable()
    {
        $this->set('is_active','NO');
        $this->save();
        return $this;
    }
    
    /* ============================== M E T H O D S ===================================== */
    
    function getCountries()
    {
        if ($this->isNotLoaded())
            return array();            
        $items=array();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("payment_id"=>$this->get('id')))
                ->setQuery("SELECT country FROM ".paymentCountry::getTable()." WHERE payment_id={payment_id} ORDER BY country ASC;")               
                ->makeSiteSqlQuery($this->getSite()); 
        if (!$db->getNumRows())
            return $items;
        while ($item=$db->fetchArray())
        { 
            $items[]=$item['country'];
        }      
        return $items;
    }
    
     function getCurrencies()
    {                                          
        if ($this->isNotLoaded())
            return array();                   
        $items=array();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("payment_id"=>$this->get('id')))
                ->setQuery("SELECT currency FROM ".paymentCurrency::getTable()." WHERE payment_id={payment_id} ORDER BY currency ASC;")               
                ->makeSiteSqlQuery($this->getSite());       
        if (!$db->getNumRows())
            return $items;
        while ($item=$db->fetchArray())
        { 
            $items[]=$item['currency'];
        }      
        return $items;
    }
    
    
    
    /* ============== C A C H E ========================================================== */      
    
    function readCache($name)
    {
        $cache=new mfCacheObject(get_class($this),$this->get('id')."/".$name,'frontend',$this->getSite());
        return $cache->read();
    }
    
    function writeCache($name,$data)
    {  
       if ($this->isNotLoaded())
           return $this;
       $cache=new mfCacheObject(get_class($this),$this->get('id')."/".$name,'frontend',$this->getSite());
       $cache->write($data);   
       return $this;
    }
    
    function isCached($name)
    {        
        $cache=new mfCacheObject(get_class($this),$this->get('id')."/".$name,'frontend',$this->getSite());
        return $cache->isCached();
    }
     
    /* ====================== M E T H O D S   FIELDS ====================================== */
  
    
    function loadTextI18nStatic()
    {       
          if (($i18n=  mfcontext::getInstance()->getI18n()))
          {            
               $i18n->addModuleMessageSource($this->get('module')); 
          }                    
    }
}
