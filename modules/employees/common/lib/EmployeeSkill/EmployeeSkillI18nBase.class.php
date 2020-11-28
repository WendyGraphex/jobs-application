<?php

class EmployeeSkillI18nBase extends mfObjectI18n {
     
    protected static $fields=array('title','url','skill_id','meta_description','meta_keyword','content','lang','created_at','updated_at');
    const table="t_employee_skill_i18n"; 
    protected static $foreignKeys=array('skill_id'=>'EmployeeSkill'); // By default
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null) return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['lang']) && isset($parameters['skill_id']))
              return $this->loadByLangAndSkillId((string)$parameters['lang'],(string)$parameters['skill_id']); 
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']); 
          if (isset($parameters['lang']) && isset($parameters['title']))
              return $this->loadByLangAndTitle((string)$parameters['lang'],(string)$parameters['title']); 
          if (isset($parameters['title']))
              return $this->loadByTitle((string)$parameters['title']); 
          if (isset($parameters['name']))
              return $this->loadByName((string)$parameters['name']); 
          return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
         return $this->loadByTitle((string)$parameters);
      }   
    }        
    
     protected function loadByLangAndSkillId($lang,$language_id)
    {
       $this->set('skill_id',$language_id);
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('skill_id'=>$language_id,"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND skill_id={skill_id};")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
     protected function loadByLangAndTitle($lang,$title)
    {
       $this->set('title',$title);
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('title'=>$title,"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND title='{title}';")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
     protected function loadByTitle($title)
    {
       $this->set('title',$title);      
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('title'=>$title))              
            ->setQuery("SELECT * FROM ".self::getTable().                        
                       " WHERE title='{title}';")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
     protected function loadByName($name)
    {     
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('name'=>$name))              
            ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().  
                       " LEFT JOIN ".self::getOuterForJoin('skill_id').                      
                       " WHERE name='{name}';")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
    protected function executeLoadById($db)
    {
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getKeyName()."='%d';")
            ->makeSqlQuery();  
    }
    
    protected function getDefaults()
    {
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
        ));   
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
      $db->setParameters(array('title'=>$this->get('title'),'lang'=>$this->get('lang'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE title='{title}' AND lang='{lang}' ".$key_condition)
         ->makeSqlQuery();  
    }
    
     protected function hasSibbling()
    {
        $db=mfSiteDatabase::getInstance()           
            ->setParameters(array("skill_id"=>$this->get('skill_id')))              
            ->setQuery("SELECT count(id) FROM ".self::getTable().                      
                       " WHERE skill_id={skill_id};")
            ->makeSqlQuery();  
        $row=$db->fetchRow();
        return ($row[0]!=0);      
    } 
    
    /*   protected function getNumberOfSibblings()
    {
        $db=mfSiteDatabase::getInstance()           
            ->setParameters(array("skill_id"=>$this->get('skill_id')))              
            ->setQuery("SELECT count(id) FROM ".self::getTable().                      
                       " WHERE language_id={language_id};")
            ->makeSqlQuery();  
        $row=$db->fetchRow();
        return ($row[0]!=0);      
    } */
    
    function getTitle()
    {
        return  new mfString($this->get('title'));
    }
    
      function delete()
    {
        if (parent::delete()===false)       
            return $this;
        if (!$this->hasSibbling())
            $this->getSkill()->delete();
        return $this;
    }  
   
     function getSkill()
    {
       return $this->_skill_id=$this->_skill_id===null?new EmployeeSkill($this->get('skill_id')):$this->_skill_id;                 
    }    
              
    function __toString() {
        return (string)$this->get('title');
    }
    
    
    
    static function create(mfArray $values,$lang)
    {
         if ($values->isEmpty())
             return ;
         $db=mfSiteDatabase::getInstance()           
            ->setParameters(array("lang"=>(string)$lang))              
            ->setQuery("SELECT title FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND title IN('".$values->implode("','")."');")
            ->makeSqlQuery(); 
        // echo $db->getQuery();
        if ($db->getNumRows())
        {
            while ($row=$db->fetchArray())       
                $values->findAndRemove($row['title']);
        }
        if ($values->isEmpty())
            return ;       
        $collection_i18n = new EmployeeSkillI18nCollection();
        foreach ($values as $value)        
        {
            $item_i18n = new EmployeeSkillI18n();
            $item_i18n->add(array('lang'=>(string)$lang,'title'=>$value));
            $item_i18n->setUrl();
            $collection_i18n->push($item_i18n);
        }
        $collection_i18n->create();
    }   
    
    function getAdvertUrl()
    {       
       return link_i18n('employees_skill_adverts',array('skill'=> $this->get('url')),null,'frontend');
    }
    
     function getEmployeeUrl()
    {       
       return link_i18n('employees_employees_skill',array('skill'=> $this->get('url')),null,'frontend');
    }
    
     function getUrl()
    {       
       return link_i18n('employees_skill',array('skill'=> $this->get('url')),null,'frontend');
    }
    
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployeeSkillI18nFormatter($this):$this->formatter;
   }
   
   function hasContent()
   {
       return (boolean)$this->get('content');
   }
   
   function setUrl()
   {       
       $this->set('url',(string)mfString::getInstance($this->get('title'))->lower()->makeUrl());    
       return $this;
   }
    
    function process()
    {
        $this->setUrl();       
        return $this;
    }   
   
   function save()
   {
       if ($this->hasPropertyChanged('title') || $this->isNotLoaded())
           $this->setUrl();
       parent::save();
       return $this;
   }
}

