<?php

class CustomerAcademyCourseDocumentBase extends mfObject3 {
    
    const  CUSTOMER_ACADEMY_COURSE_DOCMENT_MAX_SIZE = 8 * 1024 *1024;
    
    protected static $fields=array('file','extension','position','is_public','teacher_user_id','course_i18n_id','filesize','created_at','updated_at');    
    const table="t_customer_course_document"; 
    protected static $foreignKeys=array('course_i18n_id'=>'CustomerAcademyCourseI18n',
                                        'teacher_user_id'=>'CustomerAcademyTeacherUser'
                                        ); // By default
    protected static $fieldsNull=array('updated_at'); // By default


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
            'is_public'=>'Y',
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
          
     function getCourseI18n()
    {
       return $this->_course_i18n_id=$this->_course_i18n_id===null?new CustomerAcademyCourseI18n($this->get('course_i18n_id')):$this->_course_i18n_id;                 
    } 
    
    function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new CustomerAcademyCourseDocumentDocumentFormatter($this):$this->formatter;       
    }
    
        function getTeacherUser()
    {
        return $this->_teacher_user_id=$this->_teacher_user_id===null?new CustomerAcademyTeacherUser($this->get('teacher_user_id')):$this->_teacher_user_id;
    }
    
      public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/data/".$this->getPath();
    }
    
    function getPath()
    {
        return "academy/courses/".$this->get('course_i18n_id')."/documents/".$this->get('id');
    }
    
     function hasFile()
    {    
        return (boolean)$this->get('file');   
    }
    
     function getFile()
    {    
        return $this->_file=$this->_file===null?new CustomerAcademyCourseDocumentFileManager($this):$this->_file;   
    }
    
   /* function getName($name)
    {
       return (string)mfString::getInstance($name)->I18N_noaccent()->replace(' ','-');
    }*/
    
     function setFile(mfValidatedFile $file)
    {     
        if ($file===null)
            return  $this;       
        $this->__file=$file;       
        $this->set('file',$file->getOriginalName());
        $this->set('filesize',$file->getFilesize());
        $this->set('extension',$file->getExtension());
        return $this;
    }      
     
    function save()
    {
         if ($this->hasPropertyChanged('file') && $this->isLoaded() && $this->__file)
        {                
             $this->getFile()->removeAll(); //????? if picture
        }
        parent::save();
        if ($this->__file)
        {                    
           $this->_file=null;
           $this->__file->save($this->getFile()->getPath(),$this->get('file'));  
           $this->getFile()->generate();
           $this->__file=null; 
        }         
        return $this;
    }
    
    
    function delete()
    {
        $this->getFile()->removeAll();
        $this->getCourseI18n()->set('number_of_documents',$this->getCourseI18n()->get('number_of_documents') - 1)->save();
        return parent::delete();
    }
    
    
    function create(mfValidatedFile $file)
    {
        $this->setFile($file);
        $this->save();    
        $this->getCourseI18n()->set('number_of_documents',$this->getCourseI18n()->get('number_of_documents') + 1)->save();
        return $this;
    }
    
    function getDocuments()
    {
        if ($this->documents === null)
        {    
            $this->documents= new CustomerAcademyCourseDocumentDocumentCollection();
        }
        return $this->documents;
    }
    
    function isOpened()
    {
        return $this->get('is_public')=='Y';
    }
    
     function isPrivated()
    {
        return !$this->isPublic();
    }
    
    function privated()
    {
        return $this->set('is_public','N')->save();
    }
    
    function opened()
    {
         return $this->set('is_public','Y')->save();
    }
}