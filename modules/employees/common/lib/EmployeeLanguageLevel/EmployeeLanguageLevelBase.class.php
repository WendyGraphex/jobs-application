<?php


class EmployeeLanguageLevelBase extends mfOrderedObject3 {
     
    protected static $fields=array('name','position','created_at','updated_at');
    const table="t_employee_language_level";
        protected static $fieldsNull=array('updated_at'); 
    
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
        
      }   
    }
         
   
    function getValuesForUpdate()
    {
      $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
    
    
     protected function getDefaults()
    {
          $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
        ));
         parent::getDefaults();
    }        
       
    protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' AND name!='' ".$key_condition)
         ->makeSqlQuery();       
    }
    
    
           
    function hasI18n()
    {
         return (boolean)$this->i18n; 
    }
    
     public function getI18n($lang=null)
     {       
         if ($this->i18n===null)
         {
             if ($lang==null)
                 $lang=  mfcontext::getInstance()->getUser()->getLanguage();
             $this->i18n=new EmployeeLanguageLevelI18n(array('lang'=>$lang,"level_id"=>$this->get('id')));
         }   
         return $this->i18n;
     } 
     
     public function setI18n($i18n)
     {
         $this->i18n=$i18n;
         return $this;
     } 
     
    
      
     static function getAllI18nForSelect()
    {        
        $values=new mfArray();        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>mfcontext::getInstance()->getUser()->getLanguage()))
                ->setQuery("SELECT ".EmployeeLanguageLevelI18n::getFieldsAndKeyWithTable()." FROM ".EmployeeLanguageLevelI18n::getTable().
                           " WHERE lang='{lang}' ORDER BY title ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($item=$db->fetchObject('EmployeeLanguageLevelI18n'))
        { 
            $values[$item->get('level_id')]=new mfString($item->get('title'));
        }              
        return $values;
    }
    
    static function getAllForSelect()
    {
        $values=new mfArray();        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>mfcontext::getInstance()->getUser()->getLanguage()))
                ->setObjects(array('EmployeeLanguageLevelI18n','EmployeeLanguageLevel'))
                ->setQuery("SELECT {fields} FROM ".EmployeeLanguageLevel::getTable().
                           " INNER JOIN ".EmployeeLanguageLevelI18n::getInnerForJoin('level_id').
                           " WHERE lang='{lang}' ORDER BY title ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($items=$db->fetchObjects())
        {             
            $values[$items->getEmployeeLanguageLevel()->get('id')]=$items->getEmployeeLanguageLevel()->setI18n($items->getEmployeeLanguageLevelI18n());
        }              
        return $values;
    }
    
    static function getLevelsByPositionForSelect()
    {
        static $values=null;        
        if ($values!==null)
            return $values;
        $values=new mfArray();        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>mfcontext::getInstance()->getUser()->getLanguage()))               
                ->setQuery("SELECT ".EmployeeLanguageLevelI18n::getFieldsAndKeyWithTable()." FROM ".EmployeeLanguageLevelI18n::getTable().       
                           " INNER JOIN ".EmployeeLanguageLevelI18n::getOuterForJoin('level_id').       
                           " WHERE lang='{lang}' ORDER BY position ASC;")               
                ->makeSqlQuery();        
        if (!$db->getNumRows())
            return $values;
        while ($item=$db->fetchObject('EmployeeLanguageLevelI18n'))
        {             
            $values[$item->get('level_id')]=ucfirst($item->get('title'));
        }              
        return $values;
    } 
    
      static function  getAllOrdered($lang=null)
    {          
         $list=new mfArray();
        $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('lang'=>$lang?$lang:mfcontext::getInstance()->getUser()->getLanguage()))  
                ->setObjects(array('EmployeeLanguageLevel','EmployeeLanguageLevelI18n'))
                ->setQuery("SELECT {fields} FROM ".self::getTable(). 
                           " INNER JOIN ".EmployeeLanguageLevelI18n::getInnerForJoin('level_id')." AND lang='{lang}'".
                           " ORDER BY position ASC".
                           ";")               
                ->makeSqlQuery(); 
       // var_dump($db->getQuery());
        if (!$db->getNumRows())
            return $list;             
        while ($items=$db->fetchObjects())
        {                  
           $item=$items->getEmployeeLanguageLevel();
           $item->setI18n($items->getEmployeeLanguageLevelI18n());
           $list[$item->get('id')]=$item;
        }                
        return $list;      
    }
                  
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployeeLanguageLevelFormatter($this):$this->formatter;
   }
}
