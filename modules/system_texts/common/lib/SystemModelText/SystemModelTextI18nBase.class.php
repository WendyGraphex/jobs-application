<?php

class SystemModelTextI18nBase extends mfObjectI18n {
     
    protected static $fields=array('value','model_id','lang','text','created_at','updated_at');
    const table="t_system_model_text_i18n"; 
    protected static $foreignKeys=array('model_id'=>'SystemModelText'); // By default
    
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['lang']) && isset($parameters['model_id']))
              return $this->loadByLangAndModelId((string)$parameters['lang'],(string)$parameters['model_id']); 
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
    
  /*  protected function loadByEmail($email)
    {
         $this->set('email',$email);
         $db=mfSiteDatabase::getInstance()->setParameters(array($email));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE email='%s';")
            ->makeSqlQuery();                           
         return $this->rowtoObject($db);
    }*/
    
     protected function loadByLangAndModelId($lang,$model_id)
    {
       $this->set('model_id',$model_id);
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('model_id'=>$model_id,"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND model_id='{model_id}';")
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
       $this->created_at=isset($this->created_at)?$this->created_at:date("Y-m-d H:i:s");
       $this->updated_at=isset($this->updated_at)?$this->updated_at:date("Y-m-d H:i:s");      
    }
     
    protected function executeInsertQuery($db)
    {
       $db->makeSqlQuery();   
    }
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
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
      $db->setParameters(array('value'=>$this->get('value'),'lang'=>$this->get('lang'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE value='{value}' AND lang='{lang}' ".$key_condition)
         ->makeSqlQuery();   
    }
    
     protected function hasSibbling()
    {
        $db=mfSiteDatabase::getInstance()           
            ->setParameters(array("model_id"=>$this->get('model_id')))              
            ->setQuery("SELECT count(id) FROM ".self::getTable().                      
                       " WHERE model_id={model_id};")
            ->makeSqlQuery();  
        $row=$db->fetchRow();
        return ($row[0]!=0);      
    }      
    
    
     function delete()
    {
        parent::delete();              
        if (!$this->hasSibbling())
            $this->getModel()->delete();
        return $this;
    }  
   
     function getModel()
    {
       if (!$this->_model_id)
       {
          $this->_model_id=new SystemModelText($this->get('model_id'));          
       }   
       return $this->_model_id;
    }    
    
 
}
