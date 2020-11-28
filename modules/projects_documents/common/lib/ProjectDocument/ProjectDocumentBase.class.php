<?php

class ProjectDocumentBase extends mfObject3 {
     
    protected static $fields=array('file','extension','project_id','task_id','employer_user_id','employee_user_id','filesize','created_at','updated_at');    
    const table="t_project_task_document"; 
    protected static $foreignKeys=array('project_id'=>'Project',
                                        'task_id'=>'ProjectTask',
                                        'employer_user_id'=>'EmployerUser',
                                        'employee_user_id'=>'Employee'); // By default
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
          
     function getProject()
    {
       return $this->_project_id=$this->_project_id===null?new Project($this->get('project_id')):$this->_project_id;                 
    } 
    
     function getTask()
    {
       return $this->_task_id=$this->_task_id===null?new ProjectTask($this->get('task_id')):$this->_task_id;                 
    } 
    
     function getEmployeeUser()
    {
        return $this->_employee_user_id=$this->_employer_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;
    }
    
      function getEmployerUser()
    {
        return $this->_employer_user_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;
    }
    
    function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new ProjectDocumentFormatter($this):$this->formatter;       
    }
      
      public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/data/".$this->getPath();
    }
    
    function getPath()
    {
        return "projects/documents/".$this->get('id');
    }
    
     function hasFile()
    {    
        return (boolean)$this->get('file');   
    }
    
     function getFile()
    {    
        return $this->_file=$this->_file===null?new ProjectDocumentFileManager($this):$this->_file;   
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
        $this->getTask()->set('number_of_documents',$this->getTask()->get('number_of_documents') - 1)->save();
        return parent::delete();
    }
    
    
    function create(mfValidatedFile $file)
    {
        if ($this->getTask()->isNotLoaded())
            return $this;
        $this->setFile($file);
        $this->save();    
        $this->getTask()->set('number_of_documents',$this->getTask()->get('number_of_documents') + 1)->save();
        return $this;
    }
        
}