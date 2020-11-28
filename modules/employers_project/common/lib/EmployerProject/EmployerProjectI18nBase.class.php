<?php

class EmployerProjectI18nBase extends mfObjectI18n {
     
    protected static $fields=array('url','reference','title','short_description','content','project_id','lang','state','created_at','updated_at');
    const table="t_employer_project_i18n"; 
    protected static $foreignKeys=array('project_id'=>'EmployerProject'); // By default
    protected static $fieldsNull=array('updated_at'); 
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null) return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['lang']) && isset($parameters['project']) && $parameters['project'] instanceof EmployerProject)
              return $this->loadByLangAndProject((string)$parameters['lang'],$parameters['project']); 
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']); 
          if (isset($parameters['lang']) && isset($parameters['title']))
              return $this->loadByLangAndTitle((string)$parameters['lang'],(string)$parameters['title']); 
            if (isset($parameters['lang']) && isset($parameters['url']))
              return $this->loadByLangAndUrl((string)$parameters['lang'],(string)$parameters['url']); 
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
    
     protected function loadByLangAndUrl($lang,$url)
    {    
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('url'=>$url,"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND url='{url}';")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
    
     protected function loadByLangAndProject($lang,EmployerProject $project)
    {
       $this->set('project_id',$project);
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('project_id'=>$project->get('id'),"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND project_id={project_id};")
            ->makeSqlQuery();  
    //   echo $db->getQuery();
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
                       " LEFT JOIN ".self::getOuterForJoin('project_id').                      
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
            'is_validated'=>'NO'
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
            ->setParameters(array("project_id"=>$this->get('project_id')))              
            ->setQuery("SELECT count(id) FROM ".self::getTable().                      
                       " WHERE project_id={project_id};")
            ->makeSqlQuery();  
        $row=$db->fetchRow();
        return ($row[0]!=0);      
    }      
    
    
     function delete()
    {
        $this->getProject()->set('number_of_languages',$this->getProject()->getNumberOfLanguages() - 1 )->save();
        $this->set('status','DELETE')->save();
        return $this;
    }
    
      function remove()
    {
        $this->getProject()->set('number_of_languages',$this->getProject()->getNumberOfLanguages() - 1 )->save();
        if (parent::delete()===false)       
            return $this;
        if (!$this->hasSibbling())
            $this->getProject()->delete();
        return $this;
    }  
   
     function getProject()
    {
       return $this->_project_id=$this->_project_id===null?new EmployerProject($this->get('project_id')):$this->_project_id;                 
    }    
              
    function __toString() {
        return (string)$this->get('title');
    }
    
      function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployerProjectI18nFormatter($this):$this->formatter;
   }
     
    function process()
    {
        $this->set('url',$this->get('title'));   
        $this->setReference();
        return $this;
    }    
    
    function getUrl()
    {
          return url_i18n_to("employers_project_project",array('url'=>$this->get('url')),$this->get('lang'),'frontend');     
    }
    
     function getLanguage()
    {
        return new LanguageFormatter($this->get('lang'));
    }
    
      function setReference()
    {              
        $parameters=array('{reference}'=>$this->getProject()->get('reference'),
                          '{lang}'=>(string)$this->getLanguage()->getCode()->upper(),
                         );        
        $this->set('reference',strtr('{reference}/{lang}',$parameters));
        return $this;
    } 
        
}
