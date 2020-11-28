<?php

class SystemModelEmailBase extends mfObject2 {
     
    protected static $fields=array('name','type');
    const table="t_system_model_email"; 
         
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
         return $this->loadByName((string)$parameters);
      }   
    }
    
   protected function loadByName($name)
    {
         $this->set('name',$name);
         $db=mfSiteDatabase::getInstance()->setParameters(array($name));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE name='%s';")
            ->makeSqlQuery();                           
         return $this->rowtoObject($db);
    }
    
    protected function executeLoadById($db)
    {
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
            ->makeSqlQuery();  
    }
    
    protected function getDefaults()
    {
      
    }
     
    protected function executeInsertQuery($db)
    {
       $db->makeSqlQuery();   
    }
    
    function getValuesForUpdate()
    {
      
    }   
    
    protected function executeUpdateQuery($db)
    {
       $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".self::getKeyName()."=%d ;")
          ->makeSqlQuery(); 
    }
    
    protected function executeDeleteQuery($db)
    {
        $db->setQuery("DELETE FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
           ->makeSqlQuery();   
    }
    
    protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' AND name!='' ".$key_condition)
         ->makeSqlQuery();      
    }
    
    public function getI18n($lang=null)
     {        
         if (!$this->i18n)
         {
              if ($lang==null)
                $lang=  mfcontext::getInstance()->getUser()->getCountry();
             $this->i18n=new SystemModelEmailI18n(array('lang'=>$lang,"model_id"=>$this->get('id')));
         }   
         return $this->i18n;
     } 
       
    static function getModelsForSelect($lang=null)
    {
        static $list=null;
        
        if ($list) return $list;
        if ($lang==null)
            $lang=mfContext::getInstance()->getUser()->getCountry();
        $list=new mfArray();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('lang'=>$lang))
                ->setQuery("SELECT ".SystemModelEmailI18n::getFieldsAndKeyWithTable()." FROM ".SystemModelEmailI18n::getTable().                                                 
                           " WHERE lang='{lang}';")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $list;        
        while ($item=$db->fetchObject('SystemModelEmailI18n'))
        {
           $list[$item->get('model_id')]=$item->get('value');
        }     
        return $list;
    }
//    function getFormatter()
//    {
//       return $this->formatter=$this->formatter===null?new SystemModelBaseFormatter($this):$this->formatter;
//    }
    
   
}
