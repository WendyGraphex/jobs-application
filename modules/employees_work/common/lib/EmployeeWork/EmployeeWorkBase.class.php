<?php

 

class EmployeeWorkBase extends mfObject3 {
       
    const STATE_HOLD="HOLD",STATE_ACTIVE='ACTIVE',STATE_DELETE='DELETE',STATE_CLOSE='CLOSE';
    
    protected static $fields=array('name','duration','description',
                                    'start_at','end_at','reference',
                                    'employee_user_id','employer_user_id','quotation_id',  'project_id',
                                    'state_id','state','order_id',
                                    'total_price_without_tax','total_price_with_tax',
                                    'total_paid_without_tax','total_paid_with_tax',
                                    'total_unpaid_without_tax','total_unpaid_with_tax',
                                    'total_required_without_tax','total_required_with_tax','is_completed',
                                    'number_of_payments','number_of_hours','iteration',    'batch' ,                              
                                   'created_at','updated_at');
     protected static $fieldsNull=array('updated_at','state','start_at','end_at','state_id','project_id','batch');        
    const table="t_employee_work"; 
    protected static $foreignKeys=array('employer_user_id'=>'EmployerUser',
                                        'employee_user_id'=>'Employee',    
                                        'quotation_id'=>'SaleEmployeeQuotation',
                                        'order_id'=>'SaleOrder',
                                        'project_id'=>'Project'
                                        );  
    

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
            'is_completed'=>'NO',            
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
          
   /* public function getProject()
    {      
        return $this->_project_id=$this->_project_id===null?new EmployerProject($this->get('project_id')):$this->_project_id;
    }*/
    
     function getEmployerUser()
    {
        return $this->_employer_user_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;
    }
    
      function getEmployeeUser()
    {
        return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;
    }
    
    function getQuotation()
    {
        return $this->_quotation_id=$this->_quotation_id===null?new SaleEmployeeQuotation($this->get('quotation_id')):$this->_quotation_id;
    }
    
      public function getOrder()
    {      
        return $this->_order_id=$this->_order_id===null?new SaleOrder($this->get('order_id')):$this->_order_id;
    }    
    
     public function getProject()
    {      
        return $this->_project_id=$this->_project_id===null?new Project($this->get('project_id')):$this->_project_id;
    } 
    
     function hasState()
    {
        return (boolean)$this->get('state');
    }
    
     function getState()
    {
        return $this->_state=$this->_state===null?new EmployeeWorkState($this,'state'):$this->_state;
    }
    
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployeeWorkFormatter($this):$this->formatter;
   }
  
   
     function getSettings()
    {
        return $this->settings=$this->settings===null?new EmployeeWorkSettings():$this->settings;
    }
    
     function getEngine()
    {
        return $this->engine=$this->engine===null?new EmployeeWorkEngine($this):$this->engine;
    }
     
    function setReference()
    {        
        $format_reference=$this->getSettings()->get('work_reference_format','W{year}{month}{day}{id}');
        $parameters=array('{year}'=>date("Y"),
                          '{month}'=>date("m"),
                          '{day}'=>date("d"),
                          '{id}'=>format_number($this->get('id'),$this->getSettings()->get('work_format_number','00000')));
        $this->set('reference',strtr($format_reference,$parameters));
        return $this;
    }   
   
   
    function getStateI18n()
    {
       return __($this->get('state'));
    }
    
     function hasStartAt()
    {
        return (boolean)$this->get('start_at');
    }
    
     function hasEndAt()
    {
        return (boolean)$this->get('end_at');
    }
    
    function getNumberOfPayments()
    {
        return intval($this->get('number_of_payments'));
    }
    
    function getStartAt()
    {
        return new DateFormatter($this->get('start_at'));
    }
    
    function getEndAt()
    {
        return new DateFormatter($this->get('end_at'));
    }
    
    function getNumberOfHours()
    {
        return intval($this->get('number_of_hours'));
    }
    
    function getTotalPaidWithoutTax()
    {
        return floatval($this->get('total_paid_without_tax')); 
    }   
    
    function getTotalPaidWithTax()
    {
        return floatval($this->get('total_paid_with_tax')); 
    }
    
     function getTotalUnPaidWithTax()
    {
        return floatval($this->get('total_unpaid_with_tax')); 
    }
    
     function getTotalUnPaidWithoutTax()
    {
        return floatval($this->get('total_unpaid_without_tax')); 
    }
    
     function getTotalPriceWithTax()
    {
        return floatval($this->get('total_price_with_tax')); 
    }
    
     function getTotalRequiredWithoutTax()
    {
        return floatval($this->get('total_required_without_tax')); 
    }
    
     function getTotalRequiredWithTax()
    {
        return floatval($this->get('total_required_with_tax')); 
    }
    
     function getTotalPriceWithoutTax()
    {
        return floatval($this->get('total_price_without_tax')); 
    }
    
    
    function toArrayForPayment()
    {
        $values=parent::toArray(array( 'employee_user_id','employer_user_id','quotation_id','project_id'));
        $values['work_id']=$this->get('id');
        return $values;
    }
    
    function hasLastPayment()
    {
        return (boolean)$this->getLastPayment();
    }
    
    function getLastPayment()
    {
        if ($this->last_payment===null)
        {    
          $db=mfSiteDatabase::getInstance()
           ->setParameters(array('work_id'=>$this->get('id')))
           ->setQuery("SELECT * FROM ".EmployeeWorkPaymentRequest::getTable().
                     " WHERE work_id='{work_id}' AND status !='DELETED'".
                     " ORDER BY date DESC ".
                     " LIMIT 0,1".
                     ";")
           ->makeSqlQuery(); 
           if (!$db->getNumRows())           
                return $this->last_payment=false;   
           $this->last_payment=$db->fetchObject('EmployeeWorkPaymentRequest')->loaded();           
        }
        return $this->last_payment;
    }
    
    function getRequests()
    {
        if ($this->requests===null)
        {    
             $this->requests=new EmployeeWorkPaymentRequestCollection();
             $this->requests->setWork($this);                          
        }
        return $this->requests;
    }
    
    
    function updateTotalRequired()
    {
        $db=mfSiteDatabase::getInstance()
           ->setParameters(array('work_id'=>$this->get('id')))
           ->setQuery("SELECT SUM(total_price_without_tax) as total_price_without_tax,SUM(total_price_with_tax) as  total_price_with_tax FROM ".EmployeeWorkPaymentRequest::getTable().
                     " WHERE work_id='{work_id}' AND status !='DELETED'".                 
                     ";")
           ->makeSqlQuery(); 
         $row=$db->fetchArray();                 
      
         $this->set('total_required_with_tax',floatval($row['total_price_with_tax']));      
          $db=mfSiteDatabase::getInstance()
           ->setParameters(array('work_id'=>$this->get('id')))
           ->setQuery("SELECT count(id) FROM ".EmployeeWorkPaymentRequest::getTable().
                     " WHERE work_id='{work_id}' AND status !='DELETED'".                 
                     ";")
           ->makeSqlQuery(); 
         $row=$db->fetchRow();        
         $this->set('number_of_payments',intval($row[0]));
         $this->set('is_completed',($this->getTotalPriceWithTax() == $this->getTotalRequiredWithTax()?"YES":"NO"));
         $this->set('is_accepted',($this->getTotalPaidAndAcceptedWithTax() == 0.0?"YES":"NO"));
         return $this;
    }
    
    function process()
    {
         $db=mfSiteDatabase::getInstance()
           ->setParameters(array('work_id'=>$this->get('id')))
           ->setQuery("SELECT count(id) FROM ".EmployeeWorkPaymentRequest::getTable().
                     " WHERE work_id='{work_id}' AND status !='DELETED'".                 
                     ";")
           ->makeSqlQuery(); 
         $row=$db->fetchRow();
         $this->set('number_of_payments',intval($row[0]));
         
        $this->updateTotalRequired();                
        
         $db=mfSiteDatabase::getInstance()
           ->setParameters(array('work_id'=>$this->get('id')))
           ->setQuery("SELECT SUM(total_price_with_tax) as  total_paid_with_tax FROM ".EmployeeWorkPaymentRequest::getTable().
                     " WHERE work_id='{work_id}' AND status ='PAID'".                 
                     ";")
           ->makeSqlQuery(); 
         $row=$db->fetchArray();
         $this->set('total_paid_with_tax',floatval($row['total_paid_with_tax']));
          
         $this->set('total_unpaid_with_tax',$this->getTotalPriceWithTax() - $this->getTotalPaidWithTax());            
         $this->set('number_of_hours',$this->hasEndAt() && $this->hasStartAt()?24 * $this->getFormatter()->getStartAt()->diffInDay($this->getFormatter()->getEndAt()):0);                 
        return $this;
    }
    
    
    
     /* =============== EMPLOYER ADVERT ==== EMPLOYER ========================================================================== */
    
     static function getEmployeeForEmployerUserAndEmployerAdvertI18n(EmployerUser $employer_user,EmployerAdvertI18n $advert_i18n)
    {                 
          $db=mfSiteDatabase::getInstance()
                ->setParameters(array('advert_id'=>$advert_i18n->get('advert_id'),'lang'=>$advert_i18n->get('lang'),'employer_user_id'=>$employer_user->get('id')))
                ->setQuery("SELECT ".Employee::getFieldsAndKeyWithTable()." FROM ".SaleEmployeeQuotation::getTable().
                           " INNER JOIN ".EmployeeWork::getInnerForJoin('quotation_id').
                           " INNER JOIN ".EmployeeWork::getOuterForJoin('employee_user_id').
                           " WHERE employer_advert_id='{advert_id}' AND employer_advert_lang='{lang}' AND ".EmployeeWork::getTableFIeld("employer_user_id")."='{employer_user_id}'".
                           " GROUP BY ".Employee::getTableField('id').
                           " ORDER BY ".EmployeeWork::getTableField('id')." DESC". 
                           " LIMIT 0,1".
                           ";")               
                ->makeSqlQuery(); 
          if (!$db->getNumRows())           
                return null;
          return  $db->fetchObject('Employee')->loaded();        
    } 
    
    static function getWorkForEmployerAdvertI18nAndEmployeeUser(EmployerAdvertI18n $advert_i18n,Employee $employee,EmployerUser $employer)
    {           
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('advert_id'=>$advert_i18n->get('advert_id'),
                                      'employee_user_id'=>$employee->get('id'),
                                      'employer_user_id'=>$employer->get('id'),
                                     'lang'=>$advert_i18n->get('lang')))
                ->setQuery("SELECT ".EmployeeWork::getFieldsAndKeyWithTable()." FROM ".SaleEmployeeQuotation::getTable().
                           " INNER JOIN ".EmployeeWork::getInnerForJoin('quotation_id').                        
                           " WHERE employer_advert_id='{advert_id}' ". 
                                    " AND employer_advert_lang='{lang}' ". 
                                    " AND ".EmployeeWork::getTableField('employee_user_id')."='{employee_user_id}'".
                                    " AND ".EmployeeWork::getTableField('employer_user_id')."='{employer_user_id}'".
                           ";")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())           
                return null;
        return  $db->fetchObject('EmployeeWork')->loaded();            
    }     
    
     /* =============== EMPLOYER ADVERT ==== EMPLOYEE ========================================================================== */
    
     static function getEmployerForEmployeeUserAndEmployerAdvertI18n(Employee $employee_user,EmployerAdvertI18n $advert_i18n)
    {               
          $db=mfSiteDatabase::getInstance()
                ->setParameters(array('advert_id'=>$advert_i18n->get('advert_id'),'lang'=>$advert_i18n->get('lang'),'employee_user_id'=>$employee_user->get('id')))
                ->setQuery("SELECT ".EmployerUser::getFieldsAndKeyWithTable()." FROM ".SaleEmployeeQuotation::getTable().
                           " INNER JOIN ".EmployeeWork::getInnerForJoin('quotation_id').
                           " INNER JOIN ".EmployeeWork::getOuterForJoin('employer_user_id').
                           " WHERE employer_advert_id='{advert_id}' AND employer_advert_lang='{lang}' AND ".EmployeeWork::getTableField("employee_user_id")."='{employee_user_id}'".
                           " GROUP BY ".EmployerUser::getTableField('id').
                           " ORDER BY ".EmployeeWork::getTableField('id')." DESC". 
                           " LIMIT 0,1".
                           ";")               
                ->makeSqlQuery();          
          if (!$db->getNumRows())           
                return null;
          return  $db->fetchObject('EmployerUser')->loaded();        
    } 
           
     static function getWorkForEmployerAdvertI18nAndEmployerUser(EmployerAdvertI18n $advert_i18n,EmployerUser $employer,Employee $employee)
    {         
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('advert_id'=>$advert_i18n->get('advert_id'),
                                      'employer_user_id'=>$employer->get('id'),
                                      'employee_user_id'=>$employee->get('id'),
                                      'lang'=>$advert_i18n->get('lang')))
                ->setQuery("SELECT ".EmployeeWork::getFieldsAndKeyWithTable()." FROM ".SaleEmployeeQuotation::getTable().
                           " INNER JOIN ".EmployeeWork::getInnerForJoin('quotation_id').                        
                           " WHERE employer_advert_id='{advert_id}' ". 
                                    " AND employer_advert_lang='{lang}' ". 
                                    " AND ".EmployeeWork::getTableField('employer_user_id')."='{employer_user_id}'".
                                    " AND ".EmployeeWork::getTableField('employee_user_id')."='{employee_user_id}'".
                           ";")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())           
                return null;
        return  $db->fetchObject('EmployeeWork')->loaded();            
    }     
      
     /* =============== EMPLOYEE ADVERT ==== EMPLOYER ========================================================================== */
     static function getEmployerForEmployeeUserAndEmployeeAdvertI18n(Employee $employee_user,EmployeeAdvertI18n $advert_i18n)
    {                                  
          $db=mfSiteDatabase::getInstance()
                ->setParameters(array('advert_id'=>$advert_i18n->get('advert_id'),'lang'=>$advert_i18n->get('lang'),'employee_user_id'=>$employee_user->get('id')))
                ->setQuery("SELECT ".EmployerUser::getFieldsAndKeyWithTable()." FROM ".SaleEmployeeQuotation::getTable().
                           " INNER JOIN ".EmployerQuotationProjectRequest::getInnerForJoin('quotation_id').
                           " INNER JOIN ".EmployeeWork::getInnerForJoin('quotation_id').
                           " INNER JOIN ".EmployeeWork::getOuterForJoin('employer_user_id').
                           " WHERE ".EmployerQuotationProjectRequest::getTableField('advert_id')."='{advert_id}' ".
                                    " AND ".EmployerQuotationProjectRequest::getTableField('lang')."='{lang}' ". 
                                    " AND ".EmployeeWork::getTableField("employee_user_id")."='{employee_user_id}'".
                           " GROUP BY ".EmployerUser::getTableField('id').
                           " ORDER BY ".EmployeeWork::getTableField('id')." DESC". 
                           " LIMIT 0,1".
                           ";")               
                ->makeSqlQuery();                 
          if (!$db->getNumRows())           
                return null;
          return  $db->fetchObject('EmployerUser')->loaded();        
    } 
 
     static function getWorkForEmployeeAdvertI18nAndEmployerUser(EmployeeAdvertI18n $advert_i18n,EmployerUser $employer,Employee $employee)
    {       
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('advert_id'=>$advert_i18n->get('advert_id'),
                                       'employer_user_id'=>$employer->get('id'),
                                        'employee_user_id'=>$employee->get('id'),
                                        'lang'=>$advert_i18n->get('lang')))
                ->setQuery("SELECT ".EmployeeWork::getFieldsAndKeyWithTable()." FROM ".SaleEmployeeQuotation::getTable().
                           " INNER JOIN ".EmployerQuotationProjectRequest::getInnerForJoin('quotation_id').
                           " INNER JOIN ".EmployeeWork::getInnerForJoin('quotation_id').
                           " INNER JOIN ".EmployeeWork::getOuterForJoin('employer_user_id').
                           " WHERE ".EmployerQuotationProjectRequest::getTableField('advert_id')."='{advert_id}' ".
                                    " AND ".EmployerQuotationProjectRequest::getTableField('lang')."='{lang}' ".                              
                                    " AND ".EmployeeWork::getTableField('employer_user_id')."='{employer_user_id}'".
                                    " AND ".EmployeeWork::getTableField('employee_user_id')."='{employee_user_id}'".
                           ";")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())           
                return null;
        return  $db->fetchObject('EmployeeWork')->loaded();            
    }
    
     /* =============== EMPLOYEE ADVERT ==== EMPLOYEE ========================================================================== */
     static function getEmployeeForEmployerUserAndEmployeeAdvertI18n(EmployerUser $employer_user,EmployeeAdvertI18n $advert_i18n)
    {                     
          $db=mfSiteDatabase::getInstance()
                ->setParameters(array('advert_id'=>$advert_i18n->get('advert_id'),'lang'=>$advert_i18n->get('lang'),'employer_user_id'=>$employer_user->get('id')))
                ->setQuery("SELECT ".Employee::getFieldsAndKeyWithTable()." FROM ".SaleEmployeeQuotation::getTable().
                           " INNER JOIN ".EmployerQuotationProjectRequest::getInnerForJoin('quotation_id').
                           " INNER JOIN ".EmployeeWork::getInnerForJoin('quotation_id').
                           " INNER JOIN ".EmployeeWork::getOuterForJoin('employee_user_id').
                           " WHERE ".EmployerQuotationProjectRequest::getTableField('advert_id')."='{advert_id}' ".
                                    " AND ".EmployerQuotationProjectRequest::getTableField('lang')."='{lang}' ". 
                                    " AND ".EmployeeWork::getTableField("employer_user_id")."='{employer_user_id}'".
                           " GROUP BY ".Employee::getTableField('id').
                           " ORDER BY ".EmployeeWork::getTableField('id')." DESC". 
                           " LIMIT 0,1".
                           ";")               
                ->makeSqlQuery();                 
          if (!$db->getNumRows())           
                return null;                    
          return  $db->fetchObject('Employee')->loaded();        
    } 
 
     static function getWorkForEmployeeAdvertI18nAndEmployeeUser(EmployeeAdvertI18n $advert_i18n,Employee $employee,EmployerUser $employer)
    {       
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('advert_id'=>$advert_i18n->get('advert_id'),
                                       'employer_user_id'=>$employer->get('id'),
                                        'employee_user_id'=>$employee->get('id'),
                                        'lang'=>$advert_i18n->get('lang')))
                ->setQuery("SELECT ".EmployeeWork::getFieldsAndKeyWithTable()." FROM ".SaleEmployeeQuotation::getTable().
                           " INNER JOIN ".EmployerQuotationProjectRequest::getInnerForJoin('quotation_id').
                           " INNER JOIN ".EmployeeWork::getInnerForJoin('quotation_id').
                           " INNER JOIN ".EmployeeWork::getOuterForJoin('employer_user_id').
                           " WHERE ".EmployerQuotationProjectRequest::getTableField('advert_id')."='{advert_id}' ".
                                    " AND ".EmployerQuotationProjectRequest::getTableField('lang')."='{lang}' ".                              
                                    " AND ".EmployeeWork::getTableField('employer_user_id')."='{employer_user_id}'".
                                    " AND ".EmployeeWork::getTableField('employee_user_id')."='{employee_user_id}'".
                           ";")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())           
                return null;
        return  $db->fetchObject('EmployeeWork')->loaded();            
    }
    
  /*  static function deleteAll()
    {
       $db=mfSiteDatabase::getInstance()
                ->setParameters(array())
                ->setQuery("DELETE FROM ".SaleEmployeeQuotation::getTable().";")               
                ->makeSqlQuery();   
    }*/
    
    function isCompleted()
    {
        return $this->get('is_completed')=='YES';
    }
    
    
    function close()
    {      
       
       return $this;
    }
    
    
    
    function getTotalPaidAndAcceptedWithTax()
    {
        if ($this->total_paid_and_accepted_with_tax===null)
        {    
            $db=mfSiteDatabase::getInstance()
              ->setParameters(array('work_id'=>$this->get('id')))
              ->setQuery("SELECT SUM(total_price_with_tax) as  total_paid_accepted_with_tax FROM ".EmployeeWorkPaymentRequest::getTable().
                        " WHERE work_id='{work_id}' AND status IN('PAID','ACCEPTED')".                 
                        ";")
              ->makeSqlQuery(); 
            $row=$db->fetchArray();
            
            $this->total_paid_and_accepted_with_tax = $this->getTotalPriceWithTax() - floatval($row['total_paid_accepted_with_tax']);
        }
        return $this->total_paid_and_accepted_with_tax;
    }
    
    
    function isAccepted()
    {
       return $this->get('is_accepted')=='YES'; 
    }
    
    
}