<?php

class GroupI18n extends mfObjectI18n {
     
    protected static $fields=array('title','group_id','lang','created_at','updated_at');
    const table="t_groups_i18n"; 
    protected static $foreignKeys=array('group_id'=>'Group'); // By default
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['lang']) && isset($parameters['group_id']))
              return $this->loadByLangAndGroupId((string)$parameters['lang'],(string)$parameters['group_id']); 
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
    
 
     protected function loadByLangAndGroupId($lang,$group_id)
    {
       $this->set('group_id',$group_id);
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('group_id'=>$group_id,"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND group_id={group_id};")
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
            ->setParameters(array("group_id"=>$this->get('group_id')))              
            ->setQuery("SELECT count(id) FROM ".self::getTable().                      
                       " WHERE group_id={group_id};")
            ->makeSqlQuery();  
        $row=$db->fetchRow();
        return ($row[0]!=0);      
    }      
    
    
      function delete()
    {
        if (parent::delete()===false)       
            return $this;
        if (!$this->hasSibbling())
            $this->getGroup()->delete();
        return $this;
    }  
   
     function getGroup()
    {
       if (!$this->_group_id)
       {
          $this->_group_id=new Group($this->get('group_id'));          
       }   
       return $this->_group_id;
    }    
    
    
   
   
}
