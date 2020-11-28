<?php

class PaymentMethodBase extends mfOrderedObject3 {
    
    protected static $fields=array('module','name','position','is_active','created_at','updated_at');
    const table="t_payment_method"; 
     
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
         return $this->loadbyName((string)$parameters);  
        // return $this->loadbyModule((string)$parameters);
      }   
    }   
    
    
     protected function loadByName($name)
    {
        $this->set('name',$name);
        $db=mfSiteDatabase::getInstance()->setParameters(array('name'=>$name));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE name='{name}';")
            ->makeSqlQuery();                           
        return $this->rowtoObject($db); 
    } 
    
    protected function loadByModule($module)
    {
        $this->set('module',$module);
        $db=mfSiteDatabase::getInstance()->setParameters(array('module'=>$module));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE module='{module}';")
            ->makeSqlQuery();                           
        return $this->rowtoObject($db); 
    }   
    
    
    protected function getDefaults()
    {
      $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),   
            'is_active'=>'NO',
        ));   
    }
    
   
     function getValuesForUpdate()
    {
         $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
    
    
    function getModule()
    {
        return $this->get('module');
    }
             
    function disable()
    {
        $this->set('is_active','NO');
        $this->save();
        return $this;
    }
    
    function getI18n()
    {
        return new mfString(__($this->get('name'),array(),'messages',$this->get('module')));
    }
    
     function isActive()
    {
        return $this->get('is_active')=='YES';
    }
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new PaymentMethodFormatter($this):$this->formatter;
   }
   
   function getComponents()
   {
       return $this->components=$this->components===null?new PaymentMethodComponents($this):$this->components;
   }
   
   function getSettings()
   {
       return $this->settings=$this->settings===null?new PaymentMethodSettings($this):$this->settings;
   }
   
   
   function getClassEngine()
   {       
       return "Payment".ucfirst($this->get('name'))."SettingsEngine";
   }
   
   function hasEngine()
   {        
        return class_exists($this->getClassEngine());
   }
   
   function getEngine()
   {
        if ($this->engine===null)
        {                              
            $class=$this->hasEngine()?$this->getClassEngine():"PaymentSettingsEngineCore";
            $this->engine= new $class($this);             
        }
        return $this->engine;
   }
   
  
   
   static function getMethods()
   {
       $list=new PaymentMethodCollection();
       $db=mfSiteDatabase::getInstance()
                    ->setParameters(array())                  
                    ->setQuery("SELECT * FROM ".PaymentMethod::getTable().                                
                               " WHERE is_active='YES'".  
                               " ORDER BY position ASC ".
                               ";")
                    ->makeSqlQuery();
        if (!$db->getNumRows())
                return $list;         
        while ($item=$db->fetchObject('PaymentMethod'))
        {                         
           $list[$item->get('id')]=$item->loaded();
        }  
       return $list;
   }
   
   
   static function getAllByPosition()
   {       
       $list=new PaymentMethodCollection();
       $db=mfSiteDatabase::getInstance()
                    ->setParameters(array())                  
                    ->setQuery("SELECT * FROM ".PaymentMethod::getTable().                                                              
                               " ORDER BY position ASC ".
                               ";")
                    ->makeSqlQuery();
        if (!$db->getNumRows())
                return $list;         
        while ($item=$db->fetchObject('PaymentMethod'))
        {                         
           $list[$item->get('id')]=$item->loaded();
        }  
       return $list->loaded();
   }
   
   
   function __toString() {
       return (string)$this->get('name');
   }
   function toArrayForPdf() {
       $values=parent::toArray();
       $values['i18n']=$this->getI18n();
       return $values;
   }
      
   
  
}
