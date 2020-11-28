<?php

class SaleEmployeeQuotationBase extends mfObject3 {
     
    protected static $fields=array('employer_advert_id','employer_advert_lang','employee_advert_id','employee_advert_lang',
                                  'project_id','reference','employer_user_id','employee_user_id','description','version','price',
                                  'employee_state','employer_state','employee_stated_at','employer_stated_at','state',
                                  'in_at','out_at','number_of_hours','schedule_needed','sender','has_history','request_id',
                                  'created_at','updated_at');    
    const table="t_sale_employee_quotation"; 
    protected static $fieldsNull=array('updated_at','employer_advert_id','employee_advert_id','project_id','state','request_id',
                                       'employee_state','employer_state','employee_stated_at','employer_stated_at',
                                       'in_at','out_at',
                                      ); // By default
    protected static $foreignKeys=array('employer_advert_id'=>'EmployerAdvert',        
                                        'employee_advert_id'=>'EmployeeAdvert',        
                                        'employer_user_id'=>'EmployerUser',
                                        'employee_user_id'=>'Employee',
                                        'project_id'=>'EmployerProject',
                                        'request_id'=>'EmployerQuotationRequest'
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
      
      
       protected function getDefaults()
    {
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),  
            'schedule_needed'=>'N',
            'has_history'=>'N'
        ));      
    }
            
      function getValuesForUpdate()
      {
          $this->set('updated_at',date("Y-m-d H:i:s"));   
      }   
            
   /*   protected function executeIsExistQuery($db)    
      {
         $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
        $db->setParameters(array('email'=>$this->get('email'),$this->getKey()))
           ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE email='{email}' ".$key_condition)
           ->makeSqlQuery();  
       
      }*/
          
      
      public function getDirectory()
      {
          return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/data/sales/employees/quotations/".$this->get('id');
      }
            
      function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new SaleEmployeeQuotationFormatter($this):$this->formatter;
   }
               
    function getSettings()
    {
        return $this->settings=$this->settings===null? new SaleQuotationSettings():$this->settings;
    }
    
      function getEmployerAdvertI18n()
   {
       return $this->employer_advert_i18n=$this->employer_advert_i18n===null?new EmployerAdvertI18n(array('lang'=>$this->get('employer_advert_lang'),'advert_id'=>$this->get('employer_advert_id'))):$this->employer_advert_i18n;
   }
   
    function hasEmployerAdvert()
   {
       return (boolean)$this->get('employer_advert_id');
   }
   
     function getEmployerAdvert()
   {
       return $this->_employer_advert_id=$this->_employer_advert_id===null?new EmployerAdvert($this->get('employer_advert_id')):$this->_employer_advert_id;
   }
   
   
     function getEmployeeAdvertI18n()
   {
       return $this->employee_advert_i18n=$this->employee_advert_i18n===null?new EmployeeAdvertI18n(array('lang'=>$this->get('employee_advert_lang'),'advert_id'=>$this->get('employee_advert_id'))):$this->employee_advert_i18n;
   }
   
    function hasEmployeeAdvert()
   {
       return (boolean)$this->get('employee_advert_id');
   }
   
     function getEmployeeAdvert()
   {
       return $this->_employee_advert_id=$this->_employee_advert_id===null?new EmployeeAdvert($this->get('employee_advert_id')):$this->_employee_advert_id;
   }
   
   function hasProject()
   {
       return (boolean)$this->get('project_id');
   }
   
     function getProject()
   {
       return $this->_project_id=$this->_project_id===null?new EmployerProject($this->get('project_id')):$this->_project_id;
   }
   
     function getRequest()
   {
       return $this->_request_id=$this->_request_id===null?new EmployerQuotationRequest($this->get('request_id')):$this->_request_id;
   }
      
   
    function getEmployerUser()
    {
        return $this->_employer_user_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;
    }
    
     function getEmployeeUser()
    {
        return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;
    }
        
   
     function setReference()
    {        
        $format_reference=$this->getSettings()->get('employee_quotation_reference_format','Q{year}{month}{day}{id}');
        $parameters=array('{year}'=>date("Y"),
                          '{month}'=>date("m"),
                          '{day}'=>date("d"),
                          '{id}'=>format_number($this->get('id'),$this->getSettings()->get('employee_quotation_id_format','00000')));
        $this->set('reference',strtr($format_reference,$parameters));
        return $this;
    }  
    
    
    
    function create()
    {
        $this->add(array(
           'employee_state'=>'PROPOSED',
            'sender'=>'EMPLOYEE',
            'employee_stated_at'=>date("Y-m-d H:i:s")
        ));        
        $this->save();
        $this->setReference();
        $this->save();                
        return $this;
    }
        
    
    function isWaitingEmployerAnwser()
    {
        return $this->get('employee_state')  && $this->get('employer_state') == null;
    }
    
    function isGiveEmployerAnswer()
    {
         return $this->get('employee_state')=='PROPOSED'  && $this->get('employer_state') == null;
    }
    
    function isRefused()
    {
         return $this->get('employee_state')=='REFUSED'  || $this->get('employer_state')=='REFUSED';
    }
    
    function isAccepted()
    {
         return $this->get('employee_state')=='ACCEPTED' && $this->get('employer_state')=='ACCEPTED';
    }
    
    function isEmployeeProposed()
    {
        return $this->get('employee_state')=='PROPOSED';
    }
    
    function isEmployeeAccepted()
    {
        return $this->get('employee_state')=='ACCEPTED';
    }
    
      function isEmployeeNegociated()
    {
        return $this->get('employee_state')=='NEGOCIATED';
    }
    
    function isEmployerAccepted()
    {
        return $this->get('employer_state')=='ACCEPTED';
    }
    
     function isEmployerRefused()
    {
        return $this->get('employer_state')=='REFUSED';
    }
    
     function isEmployerNegociated()
    {
        return $this->get('employer_state')=='NEGOCIATED';
    }
    
     function isEmployeeRefused()
    {
        return $this->get('employee_state')=='REFUSED';
    }
      
    function setAccepted()
    {
        $this->set('state',$this->isAccepted()?"ACCEPTED":null);
        return $this;
    }
    
    function setAcceptedByEmployer()
    {
        $this->add(array(
            'employer_state'=>'ACCEPTED',
            'employer_stated_at'=>date("Y-m-d H:i:s"),
            'employee_state'=>null,
            'employee_stated_at'=>null,          
            ));              
        $this->setAccepted();
        return $this;
    }
    
    function setRefusedByEmployer()
    {
         $this->add(array(
            'employer_state'=>'REFUSED',
            'employer_stated_at'=>date("Y-m-d H:i:s"),
            'employee_state'=>null,
            'employee_stated_at'=>null,
            'state'=>'REFUSED',
            ));    
        return $this;
    }
    
    function setNegociatedByEmployer()
    {
         $this->add(array(
            'employer_state'=>'NEGOCIATED',
            'employer_stated_at'=>date("Y-m-d H:i:s"),
            'employee_state'=>null,
            'employee_stated_at'=>null,
            'sender'=>'EMPLOYER',
            'has_history'=>'Y'
            ));      
        return $this;
    }
    
    function setAcceptedByEmployee()
    {
         $this->add(array(
            'employee_state'=>'ACCEPTED',
            'employee_stated_at'=>date("Y-m-d H:i:s"),                  
            )); 
        $this->setAccepted();
        return $this;
    }
    
    function setRefusedByEmployee()
    {
          $this->add(array(
            'employee_state'=>'REFUSED',
            'employee_stated_at'=>date("Y-m-d H:i:s"),  
            'state'=>'REFUSED',
            ));  
        return $this;
    }
    
    function setNegociatedByEmployee()
    {
          $this->add(array(
            'employee_state'=>'PROPOSED',             
            'employee_stated_at'=>date("Y-m-d H:i:s"),
            'employer_state'=>null,
            'employer_stated_at'=>null, 
            'sender'=>'EMPLOYEE',            
            'has_history'=>'Y'
            ));       
        if ($this->hasPropertyChanged('price'))
            $this->set('version',$this->get('version') + 1);
        return $this;
    }
    
    function hasHistory()
    {
       return $this->get('has_history')=='Y';
    }
    
    function hasInAt()
    {
        return (boolean)$this->get('in_at'); 
    }
    
    function hasOutAt()
    {
        return (boolean)$this->get('out_at'); 
    }
    
    function isPaid()
    {
        return $this->get('state')=='PAID';
    }
    
    function isScheduleNeeded()
    {
        return $this->get('schedule_needed')=='Y';
    }
    
    function setScheduleNeededByEmployer()
    {
        $this->set('schedule_needed','Y');
        return $this;
    }
    
    function history()
    {
        $history= new SaleEmployeeQuotationHistory($this);      
        $history->copy();       
        return $this;
    }
    
    function isSenderEmployer()
    {
        return $this->get('sender','EMPLOYER');
    }
    
    function isSenderEmployee()
    {
        return $this->get('sender','EMPLOYEE');
    }
    
   
    function getHistory()
    {
        if ($this->history===null)
        {
            $this->history=new SaleEmployeeQuotationHistoryCollection();
            $db=mfSiteDatabase::getInstance()
                ->setParameters(array('quotation_id'=>$this->get('id')))
                ->setQuery("SELECT * FROM ".SaleEmployeeQuotationHistory::getTable().
                           " WHERE quotation_id='{quotation_id}' ORDER BY id DESC;")               
                ->makeSqlQuery(); 
         //   echo $db->getQuery();
            if (!$db->getNumRows())
                return $this->history;
            while ($item=$db->fetchObject('SaleEmployeeQuotationHistory'))
            { 
                $this->history[$item->get('id')]=$item->loaded();
            }     
        }    
        return $this->history;
    }
    
    
    function getInAt()
    {
        return $this->_in_at=$this->_in_at===null?new DateFormatter($this->get('in_at')):$this->_in_at;
    }
    
    function getOutAt()
    {
        return $this->_out_at=$this->_out_at===null?new DateFormatter($this->get('out_at')):$this->_out_at;
    }
    
    function setDates($in_at,$out_at)
    {
        $this->add(array('in_at' =>$in_at,'out_at' =>$out_at));
        $this->set('number_of_hours',24 * $this->getFormatter()->getInAt()->diffInDay($this->getFormatter()->getOutAt()));      
        return $this;
    }     
    
    
    function isInCart()
    {
        return $this->get('state') == 'INCART';
    }
    
    function setInCart()
    {
        $this->set('state','INCART');
        return $this;
    }
}