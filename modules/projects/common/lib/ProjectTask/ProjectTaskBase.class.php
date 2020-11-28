<?php
   
class ProjectTaskBase extends mfObject3 {
     
    protected static $fields=array('name','project_id',                                    
                                    'reference','creator','number_of_documents',
                                    'start_at','end_at','estimated_duration','total_duration',
                                    'before_at','employee_user_id','employer_user_id',
                                    'priority','color','requested_by','requested_at',                                  
                                    'description','state_id','is_active','status','created_at','updated_at');
    protected static $fieldsNull=array('start_at','end_at','requested_at','state_id','priority','before_at'); 
    protected static $foreignKeys=array('project_id'=>'Project',
                                       //'category_id'=>'ProjectTaskCategory', 
                                        'employee_user_id'=>'Employee',
                                        'employer_user_id'=>'EmployerUser',
                                        'manager_id'=>'ProjectManager',
                                        'state_id'=>'ProjectTaskState'
                    ); 
    const table="t_project_task"; 
    
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
           'is_active'=>'YES',
           'status'=>'ACTIVE',
       ));   
    }                 
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
            
   
    function __toString() {
        return (string)$this->get('name');
    }
    
    function getProject()
    {
        if ($this->_project_id===null)
        {
            $this->_project_id= new Project($this->get('project_id'));
        }    
        return $this->_project_id;
    }
    
   /*  function hasCategory()
    {
         return (boolean)$this->get('category_id');
    }*/
    
    
    function hasState()
    {
        return (boolean)$this->get('state_id');
    }
    
    function getState()
    {
        if ($this->_state_id===null)
        {
            $this->_state_id=new ProjectTaskState($this->get('state_id'));
        }   
        return $this->_state_id;
    }
    
     function getFormatter()
    {
        if ($this->formatter===null)
        {
            $this->formatter=new ProjectTaskFormatter($this);
        }
        return $this->formatter;
    }
    
    
   
    
    function process()
    {
         $db=mfSiteDatabase::getInstance()
                    ->setParameters(array('task_id'=>$this->get('id')))
                    ->setQuery("SELECT sum(duration) FROM ".ProjectTaskWork::getTable().            
                               " WHERE task_id='{task_id}'".
                               ";")               
                    ->makeSqlQuery();         
        $row=$db->fetchRow();        
        $this->set('total_duration',$row[0]);
        $this->save();
        // process project
        $this->getProject()->process();
        return $this;
    }
    
    function hasEstimatedDuration()
    {
        return (boolean)$this->get('estimated_duration');
    }
    
    function hasPriority()
    {
        return (boolean)$this->get('priority');
    }
    
     
    function create()
    {
        $this->set('reference',$this->loadReference());
        $this->save();          
        return $this;
    }
    
    function hasStartAt()
    {
        return (boolean)$this->get('start_at');
    }
    
    function hasEndAt()
    {
        return (boolean)$this->get('end_at');
    }
    
    function hasRequestedAt()
    {
        return (boolean)$this->get('requested_at');
    }
    
     function hasBeforeAt()
    {
        return (boolean)$this->get('before_at');
    }
    
     
    
    function getSettings()
    {
        if ($this->settings===null)
        {
           $this->settings =new ProjectSettings();
        }  
        return $this->settings;
    }
    
    function loadReference()
    {          
        $parameters=array('{nnnn}'=>sprintf("%04d",$this->get('id')),
                          '{nnn}'=>sprintf("%03d",$this->get('id')),                          
                         );                         
        return strtr($this->getSettings()->get('project_task_reference_format','T{nnnn}'), $parameters);                              
    }
      
    function enable()
    {
        if ($this->isNotLoaded())
            return $this;
        $this->set('status','ACTIVE');
        return $this->save();
    }
    
     function disable()
    {
          if ($this->isNotLoaded())
            return $this;
        $this->set('status','DELETE');
        return $this->save();
    }
    
    function isDisable()
    {
        return !$this->isEnable();
    }
    
    function isEnable()
    {
        return $this->get('status')=='YES';
    }
    
    function isActive()
    {
        return $this->get('is_active')=='YES';
    }
    
    
    function isEmployee()
    {
        return $this->get('creator')=='EMPLOYEE';
    }
    
    function isEmployer()
    {
        return $this->get('creator')=='EMPLOYER';
    }
    
     function getEmployerUser()
    {
        return $this->_employer_user_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;
    }
    
      function getEmployeeUser()
    {
        return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;
    }
    
    function getCreator()
    {
        if ($this->isEmployee())
            return $this->getEmployeeUser ();
        return $this->getEmployerUser ();
    }
    
    static function getCollectionFromSelection(mfArray $selection,$user)
    {
        $list = new ProjectTaskCollection();
        if ($user instanceof Employee)
        {
            $db=mfSiteDatabase::getInstance()
                ->setParameters(array('employee_user_id'=>$user->get('id')))                
                ->setQuery("SELECT * FROM ".ProjectTask::getTable().                          
                           " WHERE id IN('".$selection->implode("','")."') AND employee_user_id='{employee_user_id}'".                         
                           ";")                        
                ->makeSqlQuery();              
        }   
        elseif ($user instanceof EmployerUser)
        {
             $db=mfSiteDatabase::getInstance()
                ->setParameters(array('employer_user_id'=>$user->get('id')))                
                ->setQuery("SELECT * FROM ".ProjectTask::getTable().                          
                           " WHERE id IN('".$selection->implode("','")."') AND employer_user_id='{employer_user_id}'".                         
                           ";")                        
                ->makeSqlQuery();  
        } 
        if (!$db->getNumRows())
                return $list;           
        while ($item=$db->fetchObject('ProjectTask'))
        {               
            $list[$item->get('id')]=$item->loaded();
        } 
        return $list;
    }
    
      function getNumberOfDocuments()
    {
        return intval($this->get('number_of_documents'));
    }
}
