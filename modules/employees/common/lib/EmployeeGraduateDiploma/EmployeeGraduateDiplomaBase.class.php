<?php


class EmployeeGraduateDiplomaBase extends mfOrderedObject3 {
     
    protected static $fields=array('name','position','created_at','updated_at');
    const table="t_employee_graduate_diploma";
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
             $this->i18n=new EmployeeGraduateDiplomaI18n(array('lang'=>$lang,"language_id"=>$this->get('id')));
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
                ->setQuery("SELECT ".EmployeeGraduateDiplomaI18n::getFieldsAndKeyWithTable()." FROM ".EmployeeGraduateDiplomaI18n::getTable().
                           " WHERE lang='{lang}' ORDER BY title ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($item=$db->fetchObject('EmployeeGraduateDiplomaI18n'))
        { 
            $values[$item->get('graduate_id')]=new mfString($item->get('title'));
        }              
        return $values;
    }
    
    static function getAllForSelect()
    {
        $values=new mfArray();        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>mfcontext::getInstance()->getUser()->getLanguage()))
                ->setObjects(array('EmployeeGraduateDiplomaI18n','EmployeeGraduateDiploma'))
                ->setQuery("SELECT {fields} FROM ".EmployeeGraduateDiploma::getTable().
                           " INNER JOIN ".EmployeeGraduateDiplomaI18n::getInnerForJoin('graduate_id').
                           " WHERE lang='{lang}' ORDER BY title ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($items=$db->fetchObjects())
        {             
            $values[$items->getEmployeeGraduateDiploma()->get('id')]=$items->getEmployeeGraduateDiploma()->setI18n($items->getEmployeeGraduateDiplomaI18n());
        }              
        return $values;
    }
    
    static function getGraduateDiplomasForSelect()
    {
        $values=new mfArray();        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>mfcontext::getInstance()->getUser()->getLanguage()))               
                ->setQuery("SELECT * FROM ".EmployeeGraduateDiplomaI18n::getTable().                           
                           " WHERE lang='{lang}' ORDER BY title ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($item=$db->fetchObject('EmployeeGraduateDiplomaI18n'))
        {             
            $values[$item->get('graduate_id')]=ucfirst($item->get('title'));
        }              
        return $values;
    } 
    
      static function  getAllOrdered($lang=null)
    {          
         $list=new mfArray();
        $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('lang'=>$lang?$lang:mfcontext::getInstance()->getUser()->getLanguage()))  
                ->setObjects(array('EmployeeGraduateDiploma','EmployeeGraduateDiplomaI18n'))
                ->setQuery("SELECT {fields} FROM ".self::getTable(). 
                           " INNER JOIN ".EmployeeGraduateDiplomaI18n::getInnerForJoin('graduate_id')." AND lang='{lang}'".
                           " ORDER BY position ASC".
                           ";")               
                ->makeSqlQuery(); 
       // var_dump($db->getQuery());
        if (!$db->getNumRows())
            return $list;             
        while ($items=$db->fetchObjects())
        {                  
           $item=$items->getEmployeeGraduateDiploma();
           $item->setI18n($items->getEmployeeGraduateDiplomaI18n());
           $list[$item->get('id')]=$item;
        }                
        return $list;      
    }
       
    static function getGraduateDiplomasByPositionForSelect()
    {        
        $values=new mfArray();        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>mfcontext::getInstance()->getUser()->getLanguage()))               
                ->setQuery("SELECT title,graduate_id FROM ".EmployeeGraduateDiplomaI18n::getTable().    
                           " INNER JOIN ".EmployeeGraduateDiplomaI18n::getOuterForJoin('graduate_id').    
                           " WHERE lang='{lang}' ORDER BY position ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($row=$db->fetchArray())
        {             
            $values[$row['graduate_id']]=ucfirst($row['title']);
        }              
        return $values;
    }
     
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployeeGraduateDiplomaFormatter($this):$this->formatter;
   }
}
