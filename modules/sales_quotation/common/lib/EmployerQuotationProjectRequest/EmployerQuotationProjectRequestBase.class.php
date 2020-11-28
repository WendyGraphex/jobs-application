<?php

class EmployerQuotationProjectRequestBase extends mfObject3 {
     
    protected static $fields=array('advert_id','lang','request_id','project_id','quotation_id','quoted_at','employee_user_id','employer_user_id','created_at','updated_at');    
    const table="t_employer_quotation_project_request"; 
    protected static $fieldsNull=array('updated_at','quotation_id','quoted_at'); // By default
    protected static $foreignKeys=array('advert_id'=>'EmployerAdvert',
                                        'request_id'=>'EmployerQuotationRequest',
                                        'project_id'=>'EmployerProject',
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
       return $this->formatter=$this->formatter===null?new EmployerQuotationProjectRequestFormatter($this):$this->formatter;
   }
     
     function getAdvert()
   {
       return $this->_advert_id=$this->_advert_id===null?new EmployerAdvert($this->get('advert_id')):$this->_advert_id;
   }
   
    function getEmployerUser()
    {
        return $this->_employer_user_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;
    }
    
     function getEmployeeUser()
    {
        return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;
    }
      
    function hasQuotation()
    {
       return (boolean)$this->get('quotation_id'); 
    }
    
      function getQuotation()
   {
       return $this->_quotation_id=$this->_quotation_id===null?new SaleEmployeeQuotation($this->get('quotation_id')):$this->_quotation_id;
   }
   
     function getProject()
   {
       return $this->_project_id=$this->_project_id===null?new EmployerProject($this->get('project_id')):$this->_project_id;
   }
   
     function getRequest()
   {
       return $this->_request_id=$this->_request_id===null?new EmployerQuotationRequest($this->get('request_id')):$this->_request_id;
   }
   
   function isQuotedAt()
   {
       return (boolean)$this->get('quoted_at');
   }
   
   function getQuotedAt()
   {
       return $this->_quoted_at=$this->_quoted_at===null?new DateTimeFormatter($this->get('quoted_at')):$this->_quoted_at;
   }
   
   static function getProjectRequestsForPager(Pager $pager)
   {                
         $db=mfSiteDatabase::getInstance()
           ->setParameters(array()) 
           ->setObjects(array('EmployerQuotationProjectRequest','EmployerProject','SaleEmployeeQuotation'))
           ->setQuery("SELECT {fields} FROM ".EmployerQuotationProjectRequest::getTable().   
                      " INNER JOIN ".EmployerQuotationProjectRequest::getOuterForJoin('project_id').   
                      " LEFT JOIN ".EmployerQuotationProjectRequest::getOuterForJoin('quotation_id').  
                      " WHERE  ".EmployerQuotationProjectRequest::getTableField('request_id')." IN('".implode("','",$pager->getKeys())."')".                                                                                      
                      ";")
           ->makeSqlQuery(); 
       //  echo $db->getQuery();        
          if (!$db->getNumRows())
                 return ;             
        while ($items=$db->fetchObjects())
        {             
            $item=$items->getEmployerQuotationProjectRequest();
            $item->set('project_id',$items->getEmployerProject());
            $item->set('quotation_id',$items->hasSaleEmployeeQuotation()?$items->getSaleEmployeeQuotation():false);
            $pager[$item->get('request_id')]->getProjectRequests()->push($item->loaded());    
        }       
   }
   
   function setQuotedAt()
   {
       return $this->set('quoted_at',date("Y-m-d H:i:s"));
   }
}