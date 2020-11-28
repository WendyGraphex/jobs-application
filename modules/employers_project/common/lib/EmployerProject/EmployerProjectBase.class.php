<?php

class EmployerProjectBase extends mfObject3 {
     
    protected static $fields=array('reference','name','budget','employer_user_id','is_active','number_of_languages','number_of_documents','number_of_shares','state','created_at','updated_at');    
    const table="t_employer_project"; 
    protected static $foreignKeys=array('employer_user_id'=>'EmployerUser');  
    protected static $fieldsNull=array('updated_at','state');  


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
            if ($parameters instanceof EmployerUser) 
              return $this->loadProject($parameters);
           if (is_numeric((string)$parameters)) 
              return $this->loadbyId((string)$parameters);         
        } 
    }   
    
     protected function loadProject(EmployerUser $user)
      {              
           $db=mfSiteDatabase::getInstance()->setParameters(array('employer_user_id'=>$user->get('id')));
           $db->setQuery("SELECT * FROM ".self::getTable().
                         " WHERE employer_user_id='{employer_user_id}' AND is_active='YES' AND state!='UPLOAD' ORDER BY id DESC LIMIT 0,1;")
              ->makeSqlQuery();                           
           return $this->rowtoObject($db);
      } 
     
       protected function getDefaults()
    {
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),  
            'is_active'=>'YES'
        ));      
    }
            
      function getValuesForUpdate()
      {
          $this->set('updated_at',date("Y-m-d H:i:s"));   
      }   
            
    /*  protected function executeIsExistQuery($db)    
      {
         $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
        $db->setParameters(array('email'=>$this->get('email'),$this->getKey()))
           ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE email='{email}' ".$key_condition)
           ->makeSqlQuery();  
       
      }*/
          
    function hasI18n()
    {
         return $this->i18n===false?false:$this->getI18n()->isLoaded(); 
    }
    
     public function getI18n($lang=null)
     {       
         if ($this->i18n===null)
         {
             if ($lang==null)
                 $lang=  mfcontext::getInstance()->getUser()->getLanguage();            
             $this->i18n=new EmployerProjectI18n(array('lang'=>$lang,"project"=>$this));
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
                ->setQuery("SELECT ".EmployerProjectI18n::getFieldsAndKeyWithTable()." FROM ".EmployerProjectI18n::getTable().
                           " WHERE lang='{lang}' ORDER BY title ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($item=$db->fetchObject('EmployerProjectI18n'))
        { 
            $values[$item->get('project_id')]=new mfString($item->get('title'));
        }              
        return $values;
    }
    
    static function getAllForSelect()
    {
        $values=new mfArray();        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>mfcontext::getInstance()->getUser()->getLanguage()))
                ->setObjects(array('EmployerProjectI18n','EmployerProject'))
                ->setQuery("SELECT {fields} FROM ".EmployerProject::getTable().
                           " INNER JOIN ".EmployerProjectI18n::getInnerForJoin('project_id').
                           " WHERE lang='{lang}' ORDER BY title ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($items=$db->fetchObjects())
        {             
            $values[$items->getEmployerProject()->get('id')]=$items->getEmployerProject()->setI18n($items->getEmployerProjectI18n());
        }              
        return $values;
    }
    
    static function getProjectsForSelect()
    {
        $values=new mfArray();        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>mfcontext::getInstance()->getUser()->getLanguage()))               
                ->setQuery("SELECT * FROM ".EmployerProjectI18n::getTable().                           
                           " WHERE lang='{lang}' ORDER BY title ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($item=$db->fetchObject('EmployerProjectI18n'))
        {             
            $values[$item->get('project_id')]=ucfirst($item->get('title'));
        }              
        return $values;
    } 
    
      static function  getAllOrdered($lang=null)
    {          
         $list=new mfArray();
        $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('lang'=>$lang?$lang:mfcontext::getInstance()->getUser()->getLanguage()))  
                ->setObjects(array('EmployerProject','EmployerProjectI18n'))
                ->setQuery("SELECT {fields} FROM ".self::getTable(). 
                           " INNER JOIN ".EmployerProjectI18n::getInnerForJoin('project_id')." AND lang='{lang}'".
                           " ORDER BY position ASC".
                           ";")               
                ->makeSqlQuery(); 
       // var_dump($db->getQuery());
        if (!$db->getNumRows())
            return $list;             
        while ($items=$db->fetchObjects())
        {                  
           $item=$items->getEmployerProject();
           $item->setI18n($items->getEmployerProjectI18n());
           $list[$item->get('id')]=$item;
        }                
        return $list;      
    }
    
     function getEmployerUser()
    {
        return $this->_employer_user_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;
    }
    
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployerProjectFormatter($this):$this->formatter;
   }
   
   function setProjectsI18n(EmployerProjectI18nCollection $collection)
   {
       $this->project_i18n_collection = $collection; 
       return $this;
   }
   
  
   function getProjectsI18n()
    {
        if ($this->project_i18n_collection === null)
        {    
            $this->project_i18n_collection = new EmployerProjectI18nCollection(); 
            if ($this->isNotLoaded())
                return $this->project_i18n_collection;   
            $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('project_id'=>$this->get('id')))                
                ->setQuery("SELECT ".EmployerProjectI18n::getFieldsAndKeyWithTable()." FROM ".EmployerProjectI18n::getTable().                         
                           " INNER JOIN ".Language::getTable()." ON ".Language::getTableField('code')."=".EmployerProjectI18n::getTableField('lang').   
                           " WHERE ".EmployerProjectI18n::getTableField('project_id')."='{project_id}' AND application='frontend'".                        
                                " AND ".EmployerProjectI18n::getTableField('status')."='ACTIVE'".
                           " ORDER BY ".Language::getTableField('position')." ASC".
                           ";")               
                ->makeSqlQuery(); 
          //   echo $db->getQuery();
             if (!$db->getNumRows())
                 return $this->project_i18n_collection;             
             while ($item=$db->fetchObject('EmployerProjectI18n'))
             {                            
                $this->project_i18n_collection[]=$item->loaded();
             }   
             $this->project_i18n_collection->loaded();
        }
        return $this->project_i18n_collection;         
    }        
    
    
    function create()
    {     
       $this->set('number_of_languages', $this->getProjectsI18n()->getCollection()->count());
       $this->set('state','DRAFT');       
       $this->save();
       $this->setReference()->save();
       foreach ($this->getProjectsI18n() as $item)
            $item->set('project_id',$this)->process();      
       $this->getProjectsI18n()->getCollection()->save();         
       return $this;
    }
    
    
    function updateProjectsI18n()
    {           
       $this->set('number_of_languages', $this->getProjectsI18n()->getCollection()->count());       
       $this->save();
       foreach ($this->getProjectsI18n() as $item)
            $item->set('project_id',$this)->process();      
       $this->getProjectsI18n()->getCollection()->save();       
       return $this;
    }
     
     function getNumberOfLanguages()
    {
        return intval($this->get('number_of_languages'));
    }
    
     function getNumberOfDocuments()
    {
        return intval($this->get('number_of_documents'));
    }
    
   
     function getSettings()
    {
        return $this->settings=$this->settings===null?new EmployerSettings():$this->settings;
    }
    
    function setReference()
    {        
        $format_reference=$this->getSettings()->get('employer_project_reference_format','{year}{month}{day}{id}');
        $parameters=array('{year}'=>date("Y"),
                          '{month}'=>date("m"),
                          '{day}'=>date("d"),
                          '{id}'=>format_number($this->get('id'),$this->getSettings()->get('employer_project_id_format','00000')));
        $this->set('reference',strtr($format_reference,$parameters));
        return $this;
    }   
   
   
    function getStateI18n()
    {
       return __($this->get('state'));
    }
    
    
    function delete()
    {
        $this->set('status','DELETE')->save();
        return $this;
    }    
    
    function remove()
    {
        return parent::delete();
    }
    
    function isFirstUpload()
    {
        return $this->get('state')=='UPLOAD' && $this->get('number_of_documents') == 1;
    }
    
    function isUpload()
    {
        return $this->get('state')=='UPLOAD';
    }
    
    
    function hasDocuments()
    {
        return !$this->getDocuments()->isEmpty();
    }
    
    function getDocuments()
    {
        if ($this->documents === null)
        {    
            $this->documents = new EmployerProjectDocumentCollection();            
            $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('project_id'=>$this->get('id')))                
                ->setQuery("SELECT * FROM ".EmployerProjectDocument::getTable().                                                    
                           " WHERE ".EmployerProjectDocument::getTableField('project_id')."='{project_id}' ".                                                      
                           ";")               
                ->makeSqlQuery(); 
            // var_dump($db->getQuery());
             if (!$db->getNumRows())
                 return $this->documents;             
             while ($item=$db->fetchObject('EmployerProjectDocument'))
             {                            
                $this->documents[]=$item->loaded();
             }   
             $this->documents->loaded();
        }
        return $this->documents;         
    }
    
    
    static function getProjectsForEmployerAndSelection(EmployerUser $employer_user,mfArray $selection)
    {
        $collection = new EmployerProjectCollection();    
        if ($selection->isEmpty())
            return $collection;
        $db=mfSiteDatabase::getInstance()               
            ->setParameters(array('employer_user_id'=>$employer_user->get('id')))                
            ->setQuery("SELECT * FROM ".EmployerProject::getTable().                                            
                       " WHERE ".EmployerProject::getTableField('id')." IN('".$selection->implode("','")."')".                        
                            " AND ".EmployerProject::getTableField('status')."='ACTIVE'".     
                            " AND ".EmployerProject::getTableField('id')." IN('".$selection->implode("','")."')".
                       ";")               
            ->makeSqlQuery(); 
      //   echo $db->getQuery();
         if (!$db->getNumRows())
             return $collection;             
         while ($item=$db->fetchObject('EmployerProject'))
         {                            
            $collection[]=$item->loaded();
         }   
         $collection->loaded();        
        return  $collection;
    }
    
     function getUrl()
    {
          return url_to("employers_project_reference",array('reference'=>$this->get('reference')),'frontend');     
    }
}