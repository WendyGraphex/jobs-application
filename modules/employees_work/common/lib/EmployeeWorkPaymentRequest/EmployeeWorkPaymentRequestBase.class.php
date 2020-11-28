<?php
 
class EmployeeWorkPaymentRequestBase extends mfObject3 {
         
    protected static $fields=array('reference','date','requested_at' ,'total_price_without_tax','total_price_with_tax',
                                   'work_id','employee_user_id','employer_user_id','quotation_id', 'payment_id', 'project_id',
                                   'iteration', 'sms_sent_at','email_sent_at','confirmed_at','accepted_at','refused_at','status',
                                   'is_active_email_send',
                                   'created_at','updated_at');
    protected static $fieldsNull=array('updated_at','date','requested_at','payment_id','confirmed_at' ,'sms_sent_at','email_sent_at','accepted_at','refused_at',);        
    const table="t_employee_work_payment_request"; 
    protected static $foreignKeys=array('employer_user_id'=>'EmployerUser',
                                        'employee_user_id'=>'Employee',    
                                        'quotation_id'=>'SaleEmployeeQuotation',
                                         'work_id'=>'EmployeeWork',
                                         'payment_id'=>'PaymentEmployee',
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
            'status'=>EmployeeWorkPaymentRequestStatus::PLANNED,
            'is_active_email_send'=>'NO',
            
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
          
   /*public function getOrder()
    {      
        return $this->_order_id=$this->_order_id===null?new SaleOrder($this->get('order_id')):$this->_order_id;
    }
    */
     function getEmployerUser()
    {
        return $this->_employer_user_id=$this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')):$this->_employer_user_id;
    }
    
      function getEmployeeUser()
    {
        return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;
    }
    
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployeeWorkPaymentRequestFormatter($this):$this->formatter;
   }
     
     function getSettings()
    {
        return $this->settings=$this->settings===null?new EmployeeWorkSettings():$this->settings;
    }
    
    function getQuotation()
    {
        return $this->_quotation_id=$this->_quotation_id===null?new SaleEmployeeQuotation($this->get('quotation_id')):$this->_quotation_id;
    }
    
     function getWork()
    {
        return $this->_work_id=$this->_work_id===null?new EmployeeWork($this->get('work_id')):$this->_work_id;
    }
    
     function getProject()
    {
        return $this->_project_id=$this->_project_id===null?new Project($this->get('project_id')):$this->_project_id;
    }
     
    function setReference()
    {        
        $format_reference=$this->getSettings()->get('work_payment_reference_format','PW{year}{month}{day}{id}');
        $parameters=array('{year}'=>date("Y"),
                          '{month}'=>date("m"),
                          '{day}'=>date("d"),
                          '{id}'=>format_number($this->get('id'),$this->getSettings()->get('work_payment_format_number','00000')));
        $this->set('reference',strtr($format_reference,$parameters));
        return $this;
    }   
   
    function getStatus()
    {
        return $this->_status=$this->_status===null?new EmployeeWorkPaymentRequestStatus($this):$this->_status;
    }
    
     function getPreviousTotalPriceWithTax()
    {
        return floatval($this->get('previous_total_price_with_tax')); 
    }
      
     function getTotalPriceWithTax()
    {
        return floatval($this->get('total_price_with_tax')); 
    }
    
     function getTotalPriceWithoutTax()
    {
        return floatval($this->get('total_price_without_tax')); 
    }
    
    function setState($state)
    {
        return $this->set('state',$state);
    }
    
    function getDate()
    {
        return $this->_date= $this->_date===null?new Day($this->get('date')):$this->_date;
    }
       
    
     function  hasAcceptedAt()
    {
        return (boolean)$this->get('accepted_at');
    }
    
     function getRequestedAt()
    {
        return $this->_requested_at= $this->_requested_at===null?new DayTime($this->get('requested_at')):$this->_requested_at;
    }
    
    function isConfirmed()
    {
        return (boolean)$this->get('confirmed_at');
    }
    
    function isRefused()
    {
        return (boolean)$this->get('refused_at');
    }     
    
    function setTotalPriceWithTax($amount)
    {
        $this->set('previous_total_price_with_tax',$this->get('total_price_with_tax'));       
        if ($amount > $this->getTotalPriceWithTax())
        {
            // Remove all planned excepted this
             $db=mfSiteDatabase::getInstance()
                ->setParameters(array('work_id'=>$this->getWork()->get('id'),'id'=>$this->get('id')))
                ->setQuery("DELETE FROM ".EmployeeWorkPaymentRequest::getTable().
                          " WHERE work_id='{work_id}' AND status IN('ACTIVE','PLANNED') AND id !='{id}'".                    
                          ";")
                ->makeSqlQuery();                           
        }    
        $this->set('total_price_with_tax',$amount);       
        return $this;
    }
    
    
    static function getRequestsFromSelection(mfArray $selection)
    {
         $list = new EmployeeWorkPaymentRequestCollection();
         if ($selection->isEmpty())
             return $list;
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setQuery("SELECT * FROM ".self::getTable().
                       " WHERE id IN('".$selection->implode("','")."');")
            ->makeSqlQuery();   
          if (!$db->getNumRows())
            return $list;       
         while ($item=$db->fetchObject('EmployeeWorkPaymentRequest'))
         {
            $list[$item->get('id')] =$item->loaded();
         }
         return $list->loaded();
    }
    
    
    function process()
    {        
        $this->getWork()->updateTotalRequired()->save();
        return $this;
    }
    
    function delete()
    {
        $this->set('status','DELETED')->save();
        $this->getWork()->set('is_completed','NO');
        $this->getWork()->updateTotalRequired()->save();
         
        return $this;
    }
    
     function remove()
    {
        parent::delete();
        $this->getWork()->updateTotalRequired()->save();         
        return $this;
    }
    
    function getRestOfTotalPriceWithTax()
    {
        if ($this->rest_total_price_with_tax===null)
        {    
         $db=mfSiteDatabase::getInstance()
           ->setParameters(array('work_id'=>$this->get('work_id'),'id'=>$this->get('id')))
           ->setQuery("SELECT SUM(total_price_without_tax) as total_price_without_tax,SUM(total_price_with_tax) as  total_price_with_tax FROM ".EmployeeWorkPaymentRequest::getTable().
                     " WHERE work_id='{work_id}' AND status NOT IN('PAID','ACCEPTED')".                 
                     ";")
           ->makeSqlQuery(); 
         $row=$db->fetchArray();                 
      
         $this->rest_total_price_with_tax= floatval($row['total_price_with_tax']);      
        }
        return $this->rest_total_price_with_tax;

    }
    
    /*
     *  'employee_user_id','employer_user_id','quotation_id',  'project_id',
                                    'state_id','state','order_id',
                                    'total_price_without_tax','total_price_with_tax',
                                    'total_paid_without_tax','total_paid_with_tax',
                                    'total_unpaid_without_tax','total_unpaid_with_tax',
                                    'total_required_without_tax','total_required_with_tax','is_completed',
                                    'number_of_payments','number_of_hours','iteration',    'batch' ,       
     */
     static function deleteAll()
    {
       $db=mfSiteDatabase::getInstance()
                ->setParameters(array())
                ->setQuery("DELETE FROM ".self::getTable().";")               
                ->makeSqlQuery();   
        $db=mfSiteDatabase::getInstance()
           ->setParameters(array())
           ->setQuery("UPDATE ".EmployeeWork::getTable().
                      " SET number_of_payments = NULL,".
                            "total_unpaid_without_tax= total_price_with_tax,".
                            "total_unpaid_with_tax =total_price_with_tax,".      
                            "total_required_without_tax =0,".
                            "total_required_with_tax =0,".
                            "is_completed='NO',".
                            "iteration=0,".
                            "batch=NULL,".
                            "state = NULL".
                     ";")
           ->makeSqlQuery(); 
       
       
    }
}