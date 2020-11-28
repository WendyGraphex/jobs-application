<?php


class EmployerNotationCriteriaBase extends mfOrderedObject3 {
     
      protected static $fields=array('category_id','name','icon','color','max','position','created_at','updated_at');
    const table="t_employer_notation_criteria";
        protected static $fieldsNull=array('updated_at','category_id');
         protected static $foreignKeys=array('category_id'=>'EmployerNotationCategory'); // By default
    
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
      $key_condition=($this->getKey())?" AND ".self::getTableField('id')."!='%s';":"";
      $db->setParameters(array('name'=>$this->get('name'),'category_id'=>$this->get('category_id'),$this->getKey()))
         ->setQuery("SELECT ".self::getTableField('id')." FROM ".self::getTable().
                    " WHERE name='{name}' AND name!='' ".
                        "AND category_id ".($this->get('category_id')?"='{category_id}'":" IS NULL").
                        $key_condition)
         ->makeSqlQuery();       
    }
    
     function getMax()
    {
        return new IntegerFormatter($this->get('max'));
    }
    
    function hasColor()
    {
        return (boolean)$this->get('color');
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
             $this->i18n=new EmployerNotationCriteriaI18n(array('lang'=>$lang,"language_id"=>$this->get('id')));
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
                ->setQuery("SELECT ".EmployerNotationCriteriaI18n::getFieldsAndKeyWithTable()." FROM ".EmployerNotationCriteriaI18n::getTable().
                           " WHERE lang='{lang}' ORDER BY title ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($item=$db->fetchObject('EmployerNotationCriteriaI18n'))
        { 
            $values[$item->get('criteria_id')]=new mfString($item->get('title'));
        }              
        return $values;
    }
    
    static function getAllForSelect()
    {
        $values=new mfArray();        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>mfcontext::getInstance()->getUser()->getLanguage()))
                ->setObjects(array('EmployerNotationCriteriaI18n','EmployerNotationCriteria'))
                ->setQuery("SELECT {fields} FROM ".EmployerNotationCriteria::getTable().
                           " INNER JOIN ".EmployerNotationCriteriaI18n::getInnerForJoin('criteria_id').
                           " WHERE lang='{lang}' ORDER BY title ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($items=$db->fetchObjects())
        {             
            $values[$items->getEmployerNotationCriteria()->get('id')]=$items->getEmployerNotationCriteria()->setI18n($items->getEmployerNotationCriteriaI18n());
        }              
        return $values;
    }
    
    static function getCriteriasForSelect()
    {
        $values=new mfArray();        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>mfcontext::getInstance()->getUser()->getLanguage()))               
                ->setQuery("SELECT * FROM ".EmployerNotationCriteriaI18n::getTable().                           
                           " WHERE lang='{lang}' ORDER BY title ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($item=$db->fetchObject('EmployerNotationCriteriaI18n'))
        {             
            $values[$item->get('criteria_id')]=ucfirst($item->get('title'));
        }              
        return $values;
    } 
    
      static function  getAllOrdered($lang=null)
    {          
         $list=new mfArray();
        $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('lang'=>$lang?$lang:mfcontext::getInstance()->getUser()->getLanguage()))  
                ->setObjects(array('EmployerNotationCriteria','EmployerNotationCriteriaI18n'))
                ->setQuery("SELECT {fields} FROM ".self::getTable(). 
                           " INNER JOIN ".EmployerNotationCriteriaI18n::getInnerForJoin('criteria_id')." AND lang='{lang}'".
                           " ORDER BY position ASC".
                           ";")               
                ->makeSqlQuery(); 
       // var_dump($db->getQuery());
        if (!$db->getNumRows())
            return $list;             
        while ($items=$db->fetchObjects())
        {                  
           $item=$items->getEmployerNotationCriteria();
           $item->setI18n($items->getEmployerNotationCriteriaI18n());
           $list[$item->get('id')]=$item;
        }                
        return $list;      
    }
       
    
    public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/view/data/employers/unit/icons/".$this->get('id');
    }
    
    function hasIcon()
    {
        return (boolean)$this->get('icon');
    }
    
    function getIcon()
    {    
        return $this->_icon=$this->_icon===null?new PictureObject3(array(
                 "path"=>$this->getDirectory(),
                 "picture"=>$this->get('icon'),
                 "urlPath"=>url("/data/employers/unit/icons/".$this->get('id'),"web","frontend"),
                 "url"=>url("/data/employers/unit/icons/".$this->get('id')."/".$this->get('icon'),"web","frontend"),
                 "urlAdmin"=>url("/nocache/data/employers/unit/icons/".$this->get('id')."/".$this->get('icon'),"web","frontend")
              )):$this->_icon;   
    }               
    
    function setIcon(mfValidatedFile $file)
    {     
        if ($file===null)
            return  $this;       
        $this->__icon=$file;
         $this->set('icon','icon.'.$file->getExtension());
        return $this;
    }        
  
    
    static function getName($name)
    {
       return str_replace(" ","-",mfTools::I18N_noaccent($name));
    }  
        
    function save()
    {      
        if ($this->isLoaded() && $this->__icon)
        {                  
            $this->getIcon()->remove();
        }
        parent::save();
        if ($this->__icon)
        {                       
           $this->_icon=null;
           $this->__icon->save($this->getIcon()->getPath(),$this->get('icon'));    
           $this->__icon=null; 
        }        
        return $this;
    }
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployerNotationCriteriaFormatter($this):$this->formatter;
   }
   
    static function getLastPosition()
    {
      $db=mfSiteDatabase::getInstance()
        ->setQuery("SELECT max(position) FROM ".static::getTable().";")
        ->makeSqlQuery();   
      $row=$db->fetchRow();
      return intval($row[0]);
    }
   
    function hasCategory()
    {
       return (boolean)$this->get('category_id'); 
    }
    
      function getCategory()
    {
       return $this->_category_id=$this->_category_id===null?new EmployerNotationCategory($this->get('category_id')):$this->_category_id;                 
    } 
    
     function getNotations()
    {
        return $this->notations=$this->notations===null?new EmployerNotationCriteriaNotationsFormatter():$this->notations;
    }
    
    
    function hasReview()
    {
        return $this->review;
    }
    
     function getReview()
    {
        return $this->review=$this->review===null?new EmployerAdvertI18nEmployerCriteriaNotation($this):$this->review;
    }
    
}
