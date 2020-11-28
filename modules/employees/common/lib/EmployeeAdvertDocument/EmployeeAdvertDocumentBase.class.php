<?php

class EmployeeAdvertDocumentBase extends mfObject3 {
     
     const  EMPLOYEE_USER_ADVERT_DOCUMENT_MAX_SIZE=8 * 1024 *1024;
    
    protected static $fields=array('file','extension','advert_id','is_public','employee_user_id','filesize','created_at','updated_at');    
    const table="t_employee_advert_document"; 
    protected static $foreignKeys=array('advert_id'=>'EmployeeAdvert','employee_user_id'=>'Employee'); // By default
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
            'is_public'=>'Y'
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
          
     function getAdvert()
    {
       return $this->_advert_id=$this->_advert_id===null?new EmployerAdvert($this->get('advert_id')):$this->_advert_id;                 
    } 
    
     function getEmployeeUser()
    {
        return $this->_employee_user_id=$this->_employer_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;
    }
    
    function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new EmployeeAdvertDocumentFormatter($this):$this->formatter;       
    }
      
      public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/data/".$this->getPath();
    }
    
    function getPath()
    {
        return "employees/".$this->get('employee_user_id')."/documents/".$this->get('id');
    }
    
    /*function getFilesize()
    {    
        return $this->get('filesize');   
    }*/
    
    function hasFile()
    {    
        return (boolean)$this->get('file');   
    }
    
     function getFile()
    {    
        return $this->_file=$this->_file===null?new EmployeeAdvertDocumentFileManager($this):$this->_file;   
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
        return parent::delete();
    }
    
    
    function create(mfValidatedFile $file)
    {
        $this->setFile($file);
        $this->save();    
        $this->getAdvert()->set('number_of_documents',$this->getAdvert()->get('number_of_documents') + 1)->save();
        return $this;
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