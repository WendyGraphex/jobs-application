<?php
  
class EmployerQuotationRequestBase extends mfObject3 {
     
    protected static $fields=array('reference','quoted_at','quotation_id','advert_id','lang','employee_user_id','employer_user_id','revival_iteration','revival_at','number_of_projects','description','created_at','updated_at');    
    const table="t_employer_quotation_request"; 
    protected static $fieldsNull=array('updated_at','revival_at','quoted_at'); // By default
 protected static $foreignKeys=array('advert_id'=>'EmployeeAdvert',                                    
                                        'employee_user_id'=>'Employee',
                                        'employer_user_id'=>'EmployerUser',  
                                          'quotation_id'=>'SaleEmployeeQuotation',
                                        ); // By default

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
            'revival_iteration'=>0,
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
      
   function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployerQuotationRequestFormatter($this):$this->formatter;
   }
          
    function getAdvert()
    {
       return $this->_advert_id=$this->_advert_id===null?new EmployeeAdvert($this->get('advert_id')):$this->_advert_id;                 
    }
    
        function getAdvertI18n()
   {
       return $this->advert_i18n=$this->advert_i18n===null?new EmployeeAdvertI18n(array('lang'=>$this->get('lang'),'advert_id'=>$this->get('advert_id'))):$this->advert_i18n;
   }
    
     function getEmployerUser()
    {
        return $this->_employer_user_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;
    }
    
     function getEmployeeUser()
    {
        return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;
    }
    
    function getSettings()
    {
        return $this->settings=$this->settings===null?new SaleQuotationSettings():$this->settings;
    }
    
    
    function setDescription($description)
    {
        $this->set('description',$description);
        return $this;
    }
    
    function setProjects(EmployerProjectCollection $projects)
    {
        $this->projects=$projects;
        return $this;
    }
    
    function getProjects()
    {
        if ($this->projects===null)
        {
            $this->projects=new EmployerProjectCollection();
        }   
        return $this->projects;
    }
    
     function getProjectRequests()
    {
        if ($this->project_requests===null)
        {
            $this->project_requests=new EmployerQuotationProjectRequestCollection();
        }   
        return $this->project_requests;
    }
    
     function setReference()
    {        
        $format_reference=$this->getSettings()->get('employee_quotation_request_reference_format','{year}{month}{day}{id}');
        $parameters=array('{year}'=>date("Y"),
                          '{month}'=>date("m"),
                          '{day}'=>date("d"),
                          '{id}'=>format_number($this->get('id'),$this->getSettings()->get('employee_quotation_request_id_format','00000')));
        $this->set('reference',strtr($format_reference,$parameters));
        return $this;
    }  
    
    function isQuotedAt()
   {
       return (boolean)$this->get('quoted_at');
   }
   
   function getQuotedAt()
   {
       return $this->_quoted_at=$this->_quoted_at===null?new DateTimeFormatter($this->get('quoted_at')):$this->_quoted_at;
   }
   
     function setQuotedAt()
   {
       return $this->set('quoted_at',date("Y-m-d H:i:s"));
   }
   
    function hasQuotation()
    {
       return (boolean)$this->get('quotation_id'); 
    }
    
      function getQuotation()
   {
       return $this->_quotation_id=$this->_quotation_id===null?new SaleEmployeeQuotation($this->get('quotation_id')):$this->_quotation_id;
   }
       
    
    function create()
    {
        $this->save();
        $this->setReference(); 
        $this->set('number_of_projects',$this->getProjects()->count());
        $this->save();       
        // Project request
        $collection = new EmployerQuotationProjectRequestCollection();
        foreach ($this->getProjects() as $project)
        {
            $item=new EmployerQuotationProjectRequest();
            $item->add(array(
                'advert_id'=>$this->getAdvert(),
                'lang'=>$this->get('lang'),
                'request_id'=>$this,
                'project_id'=>$project,               
                'employee_user_id'=>$this->getEmployeeUser(),
                'employer_user_id'=>$this->getEmployerUser(),
            ));
            $collection[]=$item;
        }  
        $collection->save();      
        return $this;
    }
    
    
    function getRevivalIteration()
    {
        return intval($this->get('revival_iteration'));
    }
}