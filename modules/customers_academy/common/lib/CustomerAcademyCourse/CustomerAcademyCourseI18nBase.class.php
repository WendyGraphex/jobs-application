<?php

  
class CustomerAcademyCourseI18nBase extends mfObject3 {
         
    protected static $fields=array('lang','url','title','short_description','content','reference','price',
                                    'number_of_views','number_of_documents','ranking','is_validated','published_at','refused_at','committed_at',
                                    'started_at','level_id','duration',
                                    'expired_at','state','status','teacher_user_id','created_at','updated_at');    
    const table="t_customer_academy_course_i18n"; 
    protected static $fieldsNull=array('updated_at','teacher_user_id','published_at',  'started_at','expired_at','committed_at','refused_at');  
    protected static $foreignKeys=array(
                                         'level_id'=>'CustomerAcademyLevel',
                                         'teacher_user_id'=>'CustomerAcademyTeacherUser');  

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
    
     
       protected function getDefaults()
    {
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),  
            'is_validated'=>'NO'
            // 'status'=>'ACTIVE'
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
          
      function getSettings()
    {
        return $this->settings=$this->settings===null?new EmployeeSettings():$this->settings;
    }
    
      function getTeacherUser()
    {
        return $this->_teacher_user_id=$this->_teacher_user_id===null?new CustomerAcademyTeacherUser($this->get('teacher_user_id')):$this->_teacher_user_id;
    }
    
    function hasLevel()
    {
        return (boolean)$this->get('level_id');
    }
    
       function getLevel()
    {
        return $this->_level_id=$this->_level_id===null?new CustomerAcademyLevel($this->get('level_id')):$this->_level_id;
    }
    
    
    function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new CustomerAcademyCourseI18nFormatter($this):$this->formatter;
   }
   
   
    function create()
    {
       $this->set('status','ACTIVE');
       $this->set('state','DRAFT');
       $this->setUrl() ;
       $this->save();
       $this->setReference();
       $this->save();       
       $this->getTeacherUser()->set('number_of_courses',$this->getTeacherUser()->getNumberOfCourses() + 1)->save();
       return $this;
    }
    
      function isPublished()
    {
        return (boolean)$this->get('published_at');
    }
   
   
   function getDocuments()
    {
        if ($this->documents === null)
        {               
            $this->documents = new CustomerAcademyCourseDocumentCollection();            
            $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('course_i18n_id'=>$this->get('id')))                
                ->setQuery("SELECT * FROM ".CustomerAcademyCourseDocument::getTable().                                                    
                           " WHERE ".CustomerAcademyCourseDocument::getTableField('course_i18n_id')."='{course_i18n_id}' ".                                                      
                           ";")               
                ->makeSqlQuery(); 
            // var_dump($db->getQuery());
             if (!$db->getNumRows())
                 return $this->documents;             
             while ($item=$db->fetchObject('CustomerAcademyCourseDocument'))
             {                            
                $this->documents[]=$item->loaded();
             }   
             $this->documents->loaded();
        }
        return $this->documents;         
    }
          
      
    function isFirstUpload()
    {
        return $this->get('state')=='UPLOAD' && $this->get('number_of_documents') == 1;
    }
    
      function getNumberOfDocuments()
    {
        return intval($this->get('number_of_documents'));
    }
    
    function save()
    {      
       if ($this->get('state')=='UPLOAD') 
           $this->set('status','ACTIVE');     
       if ($this->hasPropertyChanged('title'))
           $this->setUrl();
        parent::save();        
        if ($this->categories instanceof CustomerCourseCategoryCollection)
        {
            $this->updateCategories();
        }    
    }
    
     function getCourseCategories()
    {
        if ($this->course_categories===null)
        {
            $this->course_categories=new CustomerCourseCategoryCourseCollection();
            $db=mfSiteDatabase::getInstance()
                ->setParameters(array('course_i18n_id'=>$this->get('id'),'lang'=>mfContext::getInstance()->getUser()->getLanguage())) 
                ->setObjects(array('CustomerCourseCategoryCourse','CustomerCourseCategory','CustomerCourseCategoryI18n'))
                ->setQuery("SELECT {fields} FROM ".CustomerCourseCategoryCourse::getTable(). 
                           " INNER JOIN ".CustomerCourseCategoryCourse::getOuterForJoin('category_id').
                           " INNER JOIN ".CustomerCourseCategoryI18n::getInnerForJoin('category_id').
                           " WHERE ".CustomerCourseCategoryCourse::getTableField('course_i18n_id')."='{course_i18n_id}' AND ".CustomerCourseCategoryI18n::getTableField('lang')."='{lang}'".
                           ";")               
                ->makeSqlQuery(); 
         //   echo $db->getQuery();
            if (!$db->getNumRows())
               return $this->course_categories;
            while ($items=$db->fetchObjects())
            {                            
                $item=$items->getCustomerCourseCategoryCourse();
                $item->set('category_id',$items->getCustomerCourseCategory());
                $item->getCategory()->setI18n($items->getCustomerCourseCategoryI18n());
                $this->course_categories[$item->get('id')]=$item;
            } 
            $this->course_categories->loaded();
        }   
        return $this->course_categories;
    }    
    
    function getCategories()
    {
        if ($this->categories===null)
        {
           $this->categories=new CustomerCourseCategoryCollection();
        }   
        return $this->categories;
    }
    
     function updateCategories()
    {          
        $db=mfSiteDatabase::getInstance();
        if ($this->getCategories()->isEmpty())
        {
            $db->setParameters(array('course_i18n_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".CustomerCourseCategoryCourse::getTable().                            
                           " WHERE ".CustomerCourseCategoryCourse::getTableField('course_i18n_id')."='{course_i18n_id}'".                          
                           ";")               
                ->makeSqlQuery(); 
            return $this;
        }             
        $db->setParameters(array('course_i18n_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".CustomerCourseCategoryCourse::getTable().                            
                           " WHERE ".CustomerCourseCategoryCourse::getTableField('course_i18n_id')."='{course_i18n_id}' AND category_id NOT IN('".$this->getCategories()->getKeys()->implode("','")."')".
                           ";")               
                ->makeSqlQuery(); 
        $db->setParameters(array('course_i18n_id'=>$this->get('id')))              
                ->setQuery("SELECT category_id FROM ".CustomerCourseCategoryCourse::getTable().                            
                           " WHERE ".CustomerCourseCategoryCourse::getTableField('course_i18n_id')."='{course_i18n_id}'".                          
                           ";")               
                ->makeSqlQuery(); 
         if ($db->getNumRows())
         {
             while ($row=$db->fetchRow())
            {        
                $this->getCategories()->removeItemFromIndex($row[0]);                  
            }   
         }                     
         $this->course_categories = new CustomerCourseCategoryCourseCollection();
         foreach ($this->getCategories() as $category)
         {    
             $item= new CustomerCourseCategoryCourse();
             $item->add(array('category_id'=>$category,'course_i18n_id'=>$this));
             $this->getCourseCategories()->push($item);
         }
         $this->course_categories->save(); 
         return $this;
    }
    
    function publish()
    {     
        $this->add(array('refused_at'=>null,'published_at'=>date("Y-m-d H:i:s")))->save();       
        return $this;
    }
    
     function setUrl()
   {       
       $this->set('url',(string)mfString::getInstance($this->get('title'))->lower()->makeUrl());    
       return $this;
   }
   
     function setReference()
    {        
        $format_reference=$this->getSettings()->get('academy_course_i18n_reference_format','A{year}{month}{day}{id}');
        $parameters=array('{year}'=>date("Y"),
                          '{month}'=>date("m"),
                          '{day}'=>date("d"),
                          '{id}'=>format_number($this->get('id'),$this->getSettings()->get('academy_course_i18n_id_format','00000')));
        $this->set('reference',strtr($format_reference,$parameters));
        return $this;
    }   
    
    function process()
    {
        $this->setUrl() ;
        $this->setReference();        
        return $this;
    }     
    
     function getUrl()
    {
        return url_i18n_to("customers_course",array('url'=>$this->get('url'),'id'=>$this->get('id'),'lang'=>$this->get('lang')),"",'frontend');
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
        $this->set('status','DELETE')->save();
        $this->getTeacherUser()->set('number_of_courses',$this->getTeacherUser()->getNumberOfCourses() - 1)->save(); 
        return $this;
    }    
    
    function remove()
    {
        return parent::delete();
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
   
     function hasStartedAt()
   {
       return (boolean)$this->get('started_at');
   }
   
     function hasExpiredAt()
   {
       return (boolean)$this->get('expired_at');
   }
   
    
    function refuse()
    {
         $this->add(array('refused_at'=>date("Y-m-d H:i:s"),'published_at'=>null))->save();
        return $this;
    }
    
      function getNumberOfViews()
    {
        return intval($this->get('number_of_views'));
    }
    
    function getFileMaxSize()
    {
        return format_size(CustomerAcademyCourseDocument::CUSTOMER_ACADEMY_COURSE_DOCMENT_MAX_SIZE);
    }
    
}