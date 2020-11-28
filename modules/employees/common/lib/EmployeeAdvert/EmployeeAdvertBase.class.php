<?php

class EmployeeAdvertBase extends mfObject3 {
     
   protected static $fields=array('reference','budget','employee_user_id','number_of_languages','number_of_categories','number_of_documents','state','committed_at','status','refused_at','expired_at','published_at','created_at','updated_at');    
    const table="t_employee_advert"; 
    protected static $foreignKeys=array('employee_user_id'=>'Employee'); // By default
    protected static $fieldsNull=array('updated_at','published_at','refused_at','committed_at','expired_at'); // By default


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
     /* protected function loadByPhoneOrMobile($phone)
      {       
           $this->set('phone',$phone);
           $db=mfSiteDatabase::getInstance()->setParameters(array('phone'=>$phone));
           $db->setQuery("SELECT * FROM ".self::getTable()." WHERE phone='{phone}' OR mobile='{phone}';")
              ->makeSqlQuery();                           
           return $this->rowtoObject($db);
      }*/
      
     
       protected function getDefaults()
    {
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),      
            'status'=>'ACTIVE'
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
         return (boolean)$this->i18n; 
    }
    
     public function getI18n($lang=null)
     {       
         if ($this->i18n===null)
         {
             if ($lang==null)
                 $lang=  mfcontext::getInstance()->getUser()->getLanguage();
             $this->i18n=new EmployeeAdvertI18n(array('lang'=>$lang,"advert_id"=>$this->get('id')));
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
                ->setQuery("SELECT ".EmployeeAdvertI18n::getFieldsAndKeyWithTable()." FROM ".EmployeeAdvertI18n::getTable().
                           " WHERE lang='{lang}' ORDER BY title ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($item=$db->fetchObject('EmployeeAdvertI18n'))
        { 
            $values[$item->get('advert_id')]=new mfString($item->get('title'));
        }              
        return $values;
    }
    
    static function getAllForSelect()
    {
        $values=new mfArray();        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>mfcontext::getInstance()->getUser()->getLanguage()))
                ->setObjects(array('EmployeeAdvertI18n','EmployeeAdvert'))
                ->setQuery("SELECT {fields} FROM ".EmployeeAdvert::getTable().
                           " INNER JOIN ".EmployeeAdvertI18n::getInnerForJoin('advert_id').
                           " WHERE lang='{lang}' ORDER BY title ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($items=$db->fetchObjects())
        {             
            $values[$items->getEmployeeAdvert()->get('id')]=$items->getEmployeeAdvert()->setI18n($items->getEmployeeAdvertI18n());
        }              
        return $values;
    }
    
    static function getAdvertsForSelect()
    {
        $values=new mfArray();        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>mfcontext::getInstance()->getUser()->getLanguage()))               
                ->setQuery("SELECT * FROM ".EmployeeAdvertI18n::getTable().                           
                           " WHERE lang='{lang}' ORDER BY title ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($item=$db->fetchObject('EmployeeAdvertI18n'))
        {             
            $values[$item->get('advert_id')]=ucfirst($item->get('title'));
        }              
        return $values;
    } 
    
      static function  getAllOrdered($lang=null)
    {          
         $list=new mfArray();
        $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('lang'=>$lang?$lang:mfcontext::getInstance()->getUser()->getLanguage()))  
                ->setObjects(array('EmployeeAdvert','EmployeeAdvertI18n'))
                ->setQuery("SELECT {fields} FROM ".self::getTable(). 
                           " INNER JOIN ".EmployeeAdvertI18n::getInnerForJoin('advert_id')." AND lang='{lang}'".
                           " ORDER BY position ASC".
                           ";")               
                ->makeSqlQuery(); 
       // var_dump($db->getQuery());
        if (!$db->getNumRows())
            return $list;             
        while ($items=$db->fetchObjects())
        {                  
           $item=$items->getEmployeeAdvert();
           $item->setI18n($items->getEmployeeAdvertI18n());
           $list[$item->get('id')]=$item;
        }                
        return $list;      
    }
    
      function getEmployeeUser()
    {
        return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;
    }
    
    function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployeeAdvertFormatter($this):$this->formatter;
   }
   
   function hasPublishedAt()
   {
       return (boolean)$this->get('published_at');
   }
   
    function hasRefusedAt()
   {
       return (boolean)$this->get('refused_at');
   }
   
    function hasCommittedAt()
   {
       return (boolean)$this->get('committed_at');
   }
   
   function setAdvertsI18n(EmployeeAdvertI18nCollection $collection)
   {
       $this->advert_i18n_collection = $collection; 
       return $this;
   }
   
  
   function getAdvertsI18n()
    {
        if ($this->advert_i18n_collection === null)
        {    
            $this->advert_i18n_collection = new EmployeeAdvertI18nCollection(); 
            if ($this->isNotLoaded())
                return $this->advert_i18n_collection;   
            $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('advert_id'=>$this->get('id')))                
                ->setQuery("SELECT ".EmployeeAdvertI18n::getFieldsAndKeyWithTable()." FROM ".EmployeeAdvertI18n::getTable().                         
                           " INNER JOIN ".Language::getTable()." ON ".Language::getTableField('code')."=".EmployeeAdvertI18n::getTableField('lang').   
                           " WHERE ".EmployeeAdvertI18n::getTableField('advert_id')."='{advert_id}' AND application='frontend'".
                                        " AND ".EmployeeAdvertI18n::getTableField('status')."='ACTIVE'".
                           " ORDER BY ".Language::getTableField('position')." ASC".
                           ";")               
                ->makeSqlQuery();             
             if (!$db->getNumRows())
                 return $this->advert_i18n_collection;             
             while ($item=$db->fetchObject('EmployeeAdvertI18n'))
             {                            
                $this->advert_i18n_collection[]=$item->loaded();
             }   
             $this->advert_i18n_collection->loaded();
        }
        return $this->advert_i18n_collection;         
    }   
    
    
    function getPublishedAdvertsI18n()
    {
        if ($this->advert_i18n_collection === null)
        {    
            $this->advert_i18n_collection = new EmployeeAdvertI18nCollection(); 
            if ($this->isNotLoaded())
                return $this->advert_i18n_collection;   
            $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('advert_id'=>$this->get('id')))                
                ->setQuery("SELECT ".EmployeeAdvertI18n::getFieldsAndKeyWithTable()." FROM ".EmployeeAdvertI18n::getTable().                         
                           " INNER JOIN ".Language::getTable()." ON ".Language::getTableField('code')."=".EmployeeAdvertI18n::getTableField('lang').   
                           " WHERE ".EmployeeAdvertI18n::getTableField('advert_id')."='{advert_id}' AND application='frontend'".
                                        " AND ".EmployeeAdvertI18n::getTableField('status')."='ACTIVE'".
                                        " AND ".EmployeeAdvertI18n::getTableField('published_at')." IS NOT NULL".
                           " ORDER BY ".Language::getTableField('position')." ASC".
                           ";")               
                ->makeSqlQuery();             
             if (!$db->getNumRows())
                 return $this->advert_i18n_collection;             
             while ($item=$db->fetchObject('EmployeeAdvertI18n'))
             {                            
                $this->advert_i18n_collection[]=$item->loaded();
             }   
             $this->advert_i18n_collection->loaded();
        }
        return $this->advert_i18n_collection;         
    }   
    
    function create()
    {
       $this->set('number_of_languages', $this->getAdvertsI18n()->getCollection()->count());    
       $this->set('number_of_categories',$this->getCategories()->count());
       $this->set('state','DRAFT');
       $this->save();
       $this->setReference()->save();
       foreach ($this->getAdvertsI18n() as $item)          
             $item->set('advert_id',$this)->process();         
       $this->getAdvertsI18n()->getCollection()->save();    
       $this->updateCategories();
       return $this;
    }
        
    function updateAvertsI18n()
    {            
       $this->set('number_of_languages', $this->getAdvertsI18n()->getCollection()->count());
        $this->set('number_of_categories',$this->getCategories()->count());
       $this->save();
       foreach ($this->getAdvertsI18n() as $item)
            $item->set('advert_id',$this)->process();      
       $this->getAdvertsI18n()->getCollection()->save();     
       $this->updateCategories();
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
    
     function getNumberOfCategories()
    {
        return intval($this->get('number_of_categories'));
    }
    
    function publish()
    {
        if ($this->isNotLoaded())
            return $this;
        $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('advert_id'=>$this->get('id'),'published_at'=>date("Y-m-d H:i:s")))                
                ->setQuery("UPDATE ".EmployeeAdvertI18n::getTable().                               
                           " SET published_at='{published_at}',refused_at=NULL".
                           " WHERE ".EmployeeAdvertI18n::getTableField('advert_id')."='{advert_id}'".                           
                           ";")    
                ->makeSqlQuery();        
        if ($db->getAffectedRows() == $this->getNumberOfLanguages())
            $this->add(array('published_at'=>date("Y-m-d H:i:s"),'state'=>'PUBLISHED','refused_at'=>null))->save();
        return $this;
    }
    
    function refuse()
    {
       if ($this->isNotLoaded())
            return $this;
        $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('advert_id'=>$this->get('id'),'refused_at'=>date("Y-m-d H:i:s")))                
                ->setQuery("UPDATE ".EmployeeAdvertI18n::getTable().                               
                           " SET refused_at='{refused_at}',published_at=NULL ".
                           " WHERE ".EmployeeAdvertI18n::getTableField('advert_id')."='{advert_id}'".                           
                           ";")    
                ->makeSqlQuery();        
        if ($db->getAffectedRows() == $this->getNumberOfLanguages())
           $this->add(array('refused_at'=>date("Y-m-d H:i:s"),'state'=>'REFUSED','published_at'=>null))->save();
    }
    
    function getSettings()
    {
        return $this->settings=$this->settings===null?new EmployeeSettings():$this->settings;
    }
    
     function setReference()
    {        
        $format_reference=$this->getSettings()->get('employee_reference_format','A{year}{month}{day}{id}');
        $parameters=array('{year}'=>date("Y"),
                          '{month}'=>date("m"),
                          '{day}'=>date("d"),
                          '{id}'=>format_number($this->get('id'),$this->getSettings()->get('employee_id_format','00000')));
        $this->set('reference',strtr($format_reference,$parameters));
        return $this;
    }   
    
    
     function setCategories(PartnerWorkCategoryCollection $categories)
    {
        $this->categories=$categories;
        return $this;
    }
    
    function getAdvertCategories()
    {
        if ($this->advert_categories===null)
        {
            $this->advert_categories=new EmployeeAdvertCategoryCollection();
            $db=mfSiteDatabase::getInstance()
                ->setParameters(array('advert_id'=>$this->get('id'),'lang'=>mfContext::getInstance()->getUser()->getLanguage())) 
                ->setObjects(array('EmployeeAdvertCategory','PartnerWorkCategory','PartnerWorkCategoryI18n'))
                ->setQuery("SELECT {fields} FROM ".EmployeeAdvertCategory::getTable(). 
                           " INNER JOIN ".EmployeeAdvertCategory::getOuterForJoin('category_id').
                           " INNER JOIN ".PartnerWorkCategoryI18n::getInnerForJoin('category_id').
                           " WHERE ".EmployeeAdvertCategory::getTableField('advert_id')."='{advert_id}' AND ".PartnerWorkCategoryI18n::getTableField('lang')."='{lang}'".
                           ";")               
                ->makeSqlQuery(); 
            if (!$db->getNumRows())
               return $this->advert_categories;
            while ($items=$db->fetchObjects())
            {                            
                $item=$items->getEmployeeAdvertCategory();
                $item->set('category_id',$items->getPartnerWorkCategory());
                $item->getCategory()->setI18n($items->getPartnerWorkCategoryI18n());
                $this->advert_categories[$item->get('id')]=$item;
            } 
            $this->advert_categories->loaded();
        }   
        return $this->advert_categories;
    }
    
     function getCategories()
    {
        if ($this->categories===null)
        {
           $this->categories=new PartnerWorkCategoryCollection();
        }   
        return $this->categories;
    }
    
     function updateCategories()
    {    
       $db=mfSiteDatabase::getInstance();
        if ($this->getCategories()->isEmpty())
        {
            $db->setParameters(array('advert_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".EmployeeAdvertCategory::getTable().                            
                           " WHERE ".EmployeeAdvertCategory::getTableField('advert_id')."='{advert_id}'".                          
                           ";")               
                ->makeSqlQuery(); 
            return $this;
        }             
        $db->setParameters(array('advert_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".EmployeeAdvertCategory::getTable().                            
                           " WHERE ".EmployeeAdvertCategory::getTableField('advert_id')."='{advert_id}' AND category_id NOT IN('".$this->getCategories()->getKeys()->implode("','")."')".
                           ";")               
                ->makeSqlQuery(); 
        $db->setParameters(array('advert_id'=>$this->get('id')))              
                ->setQuery("SELECT category_id FROM ".EmployeeAdvertCategory::getTable().                            
                           " WHERE ".EmployeeAdvertCategory::getTableField('advert_id')."='{advert_id}'".                          
                           ";")               
                ->makeSqlQuery(); 
         if ($db->getNumRows())
         {
             while ($row=$db->fetchRow())
            {        
                $this->getCategories()->removeItemFromIndex($row[0]);                  
            }   
         }                     
         $this->advert_categories = new EmployeeAdvertCategoryCollection();
         foreach ($this->getCategories() as $category)
         {    
             $item= new EmployeeAdvertCategory();
             $item->add(array('category_id'=>$category,'advert_id'=>$this));
             $this->getAdvertCategories()->push($item);
         }
         $this->advert_categories->save(); 
         return $this;
    }
    
    function commit()
    {
        if ($this->isNotLoaded())
            return $this;
        $this->add(array('committed_at'=>date("Y-m-d H:i:s"),
                         'state'=>'COMMITTED',
                    ))->save();
        return $this;
    }
    
    function getStateI18n()
    {
       return __($this->get('state'));
    }
    
    
    function delete()
    {
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('advert_id'=>$this->get('id')))              
                ->setQuery("UPDATE ".EmployeeAdvertI18n::getTable().                            
                           " SET status='DELETE'".
                           " WHERE ".EmployeeAdvertI18n::getTableField('advert_id')."='{advert_id}'".                          
                           ";")               
                ->makeSqlQuery(); 
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
            $this->documents = new EmployeeAdvertDocumentCollection();            
            $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('advert_id'=>$this->get('id')))                
                ->setQuery("SELECT * FROM ".EmployeeAdvertDocument::getTable().                                                    
                           " WHERE ".EmployeeAdvertDocument::getTableField('advert_id')."='{advert_id}' ".                                                      
                           ";")               
                ->makeSqlQuery(); 
            // var_dump($db->getQuery());
             if (!$db->getNumRows())
                 return $this->documents;             
             while ($item=$db->fetchObject('EmployeeAdvertDocument'))
             {                            
                $this->documents[]=$item->loaded();
             }   
             $this->documents->loaded();
        }
        return $this->documents;         
    }
       
    
    function getFileMaxSize()
    {
        return format_size(EmployeeAdvertDocument::EMPLOYEE_USER_ADVERT_DOCUMENT_MAX_SIZE);
    }
}