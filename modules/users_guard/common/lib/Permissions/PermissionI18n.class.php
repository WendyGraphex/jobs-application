<?php

class PermissionI18n extends mfObjectI18n {
     
    protected static $fields=array('title','permission_id','lang','created_at','updated_at');
    const table="t_permissions_i18n"; 
    protected static $foreignKeys=array('permission_id'=>'Permission'); // By default
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['lang']) && isset($parameters['permission_id']))
              return $this->loadByLangAndPermissionId((string)$parameters['lang'],(string)$parameters['permission_id']); 
          if (isset($parameters['lang']) && isset($parameters['title'])&& isset($parameters['name']) && isset($parameters['application']))
              return $this->loadByLangAndNameAndTitle((string)$parameters['lang'],(string)$parameters['title'],(string)$parameters['name'],(string)$parameters['application']); 
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
    
 
     protected function loadByLangAndPermissionId($lang,$permission_id)
    {
       $this->set('permission_id',$permission_id);
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('permission_id'=>$permission_id,"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND permission_id={permission_id};")
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
      $db->setParameters(array('title'=>$this->str_escape($this->get('title')),'lang'=>$this->get('lang'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE title='{title}' AND lang='{lang}' ".$key_condition)
         ->makeSqlQuery();   
    }
    
     protected function hasSibbling()
    {
        $db=mfSiteDatabase::getInstance()           
            ->setParameters(array("permission_id"=>$this->get('permission_id')))              
            ->setQuery("SELECT count(id) FROM ".self::getTable().                      
                       " WHERE permission_id={permission_id};")
            ->makeSqlQuery();  
        $row=$db->fetchRow();
        return ($row[0]!=0);      
    }      
    
    
      function delete()
    {
        if (parent::delete()===false)       
            return $this;
        if (!$this->hasSibbling())
            $this->getPermission()->delete();
        return $this;
    }  
   
     function getPermission()
    {
       if (!$this->_permission_id)
       {
          $this->_permission_id=new Permission($this->get('permission_id'));          
       }   
       return $this->_permission_id;
    }    
    
    
    protected function loadByLangAndNameAndTitle($lang,$title,$name,$application)
    {
        $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('title'=>$title,
                                  'lang'=>$lang,
                                  'name'=>$name,
                                  'application'=>$application,                                 
                        ))  
            ->setObjects(array('Permission','PermissionI18n'))
            ->setQuery("SELECT {fields} FROM ".self::getTable().  
                       " LEFT JOIN ".self::getOuterForJoin('permission_id').
                       " WHERE ((lang='{lang}' AND title='{title}') OR name='{name}') AND application='{application}';")
            ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $this;        
        $items=$db->fetchObjects();
        $this->toObject($items->getPermissionI18n());
        $this->set('permission_id',$items->getPermission());
        return $this;
    }
    
   
}
