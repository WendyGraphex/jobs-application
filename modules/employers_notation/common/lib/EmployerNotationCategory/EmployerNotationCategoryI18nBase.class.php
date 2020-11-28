<?php

class EmployerNotationCategoryI18nBase extends mfObjectI18n {
     
    protected static $fields=array('title','category_id','lang','created_at','updated_at');
    const table="t_employer_notation_category_i18n"; 
    protected static $foreignKeys=array('category_id'=>'EmployerNotationCategory'); // By default
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null) return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['lang']) && isset($parameters['category_id']))
              return $this->loadByLangAndCategoryId((string)$parameters['lang'],(string)$parameters['category_id']); 
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
    
     protected function loadByLangAndCategoryId($lang,$language_id)
    {
       $this->set('category_id',$language_id);
       $this->set('lang',$lang);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('category_id'=>$language_id,"lang"=>$lang))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE lang='{lang}' AND category_id={category_id};")
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
                       " LEFT JOIN ".self::getOuterForJoin('category_id').                      
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
      $db->setParameters(array('title'=>$this->get('title'),                           
                              'lang'=>$this->get('lang'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName().
                    " FROM ".self::getTable().                  
                    " WHERE title='{title}' AND lang='{lang}' ".                         
                            $key_condition)
         ->makeSqlQuery();  
    }
    
     protected function hasSibbling()
    {
        $db=mfSiteDatabase::getInstance()           
            ->setParameters(array("category_id"=>$this->get('category_id')))              
            ->setQuery("SELECT count(id) FROM ".self::getTable().                      
                       " WHERE category_id={category_id};")
            ->makeSqlQuery();  
        $row=$db->fetchRow();
        return ($row[0]!=0);      
    } 
    
    /*   protected function getNumberOfSibblings()
    {
        $db=mfSiteDatabase::getInstance()           
            ->setParameters(array("category_id"=>$this->get('category_id')))              
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
            $this->getCategory()->delete();
        return $this;
    }  
   
     function getCategory()
    {
       return $this->_category_id=$this->_category_id===null?new EmployerNotationCategory($this->get('category_id')):$this->_category_id;                 
    }    
              
    function __toString() {
        return (string)$this->get('title');
    }
    
    function getTitle()
    {
        return new mfString($this->get('title'));
    }
    
    
    static function create(mfArray $values,$category,$lang)
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
        $collection_i18n = new EmployerNotationCategoryI18nCollection();
        foreach ($values as $value)        
        {
            $item_i18n = new EmployerNotationCategoryI18n();
            $item_i18n->add(array('lang'=>(string)$lang,'title'=>$value));
            $collection_i18n->push($item_i18n);
        }
        $collection_i18n->create();
    }   
    
}
