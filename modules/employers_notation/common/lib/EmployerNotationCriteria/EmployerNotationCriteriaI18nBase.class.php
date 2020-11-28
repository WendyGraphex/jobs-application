<?php

class EmployerNotationCriteriaI18nBase extends mfObjectI18n {
     
    protected static $fields=array('title','criteria_id','lang','created_at','updated_at');
    const table="t_employer_notation_criteria_i18n"; 
    protected static $foreignKeys=array('criteria_id'=>'EmployerNotationCriteria'); // By default
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null) return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['lang']) && isset($parameters['criteria_id']))
              return $this->loadByLangAndCriteriaId((string)$parameters['lang'],(string)$parameters['criteria_id']); 
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
    
     protected function loadByLangAndCriteriaId($lang,$language_id)
    {
       $this->set('criteria_id',$language_id);
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('criteria_id'=>$language_id,"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND criteria_id={criteria_id};")
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
                       " LEFT JOIN ".self::getOuterForJoin('criteria_id').                      
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
      
        $key_condition=($this->getKey())?" AND ".self::getTableField('id')."!='%s';":"";
      $db->setParameters(array('title'=>$this->get('title'),
                              'category_id'=>$this->getCriteria()->get('category_id'),
                              'lang'=>$this->get('lang'),$this->getKey()))
         ->setQuery("SELECT ".self::getTableField('id').
                    " FROM ".self::getTable().
                    " INNER JOIN ".self::getOuterForJoin('criteria_id').
                    " WHERE title='{title}' AND lang='{lang}' ".
                            " AND category_id ".($this->getCriteria()->get('category_id')?"='{category_id}'":" IS NULL").
                            $key_condition)
         ->makeSqlQuery();  
    }
    
     protected function hasSibbling()
    {
        $db=mfSiteDatabase::getInstance()           
            ->setParameters(array("criteria_id"=>$this->get('criteria_id')))              
            ->setQuery("SELECT count(id) FROM ".self::getTable().                      
                       " WHERE criteria_id={criteria_id};")
            ->makeSqlQuery();  
        $row=$db->fetchRow();
        return ($row[0]!=0);      
    } 
    
    /*   protected function getNumberOfSibblings()
    {
        $db=mfSiteDatabase::getInstance()           
            ->setParameters(array("criteria_id"=>$this->get('criteria_id')))              
            ->setQuery("SELECT count(id) FROM ".self::getTable().                      
                       " WHERE language_id={language_id};")
            ->makeSqlQuery();  
        $row=$db->fetchRow();
        return ($row[0]!=0);      
    } */
    
    
      function delete()
    {
        if (parent::delete()===false)       
            return $this;
        if (!$this->hasSibbling())
            $this->getCriteria()->delete();
        return $this;
    }  
   
     function getCriteria()
    {
       return $this->_criteria_id=$this->_criteria_id===null?new EmployerNotationCriteria($this->get('criteria_id')):$this->_criteria_id;                 
    }    
              
    function __toString() {
        return (string)$this->get('title');
    }
    
    function getTitle()
    {
        return new mfString($this->get('title'));
    }
    
    static function create(mfArray $values,$category,$max,$lang)
    {        
         if ($values->isEmpty())
             return ;
         $db=mfSiteDatabase::getInstance()           
            ->setParameters(array("lang"=>(string)$lang,"category_id"=>($category?$category->get('id'):null)))              
            ->setQuery("SELECT title FROM ".self::getTable().         
                      " INNER JOIN ".self::getOuterForJoin('criteria_id').
                       " WHERE lang='{lang}' AND title IN('".$values->implode("','")."')".
                           " AND category_id ".($category?"='{category_id}'":" IS NULL").
                       ";")
            ->makeSqlQuery(); 
        // echo $db->getQuery();
        if ($db->getNumRows())
        {
            while ($row=$db->fetchArray())       
                $values->findAndRemove($row['title']);
        }
        if ($values->isEmpty())
            return ;       
        $collection_i18n = new EmployerNotationCriteriaI18nCollection();
        foreach ($values as $value)        
        {
            $item_i18n = new EmployerNotationCriteriaI18n();
            $item_i18n->add(array('lang'=>(string)$lang,'title'=>$value));
            $collection_i18n->push($item_i18n);
        }       
        $collection_i18n->create($category,$max);
    }   
    
}
