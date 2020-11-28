<?php

class SaleEmployeeQuotationWorkBase extends mfObject3 {
     
    protected static $fields=array('quotation_id','reference','employer_user_id','employee_user_id','description','price','created_at','updated_at');    
    const table="t_sale_employee_quotation_work"; 
    protected static $fieldsNull=array('updated_at'); // By default
    protected static $foreignKeys=array('quotation_id'=>'SaleEmployeeQuotation',
                                        'employer_user_id'=>'EmployerUser',
                                        'employee_user_id'=>'Employee'
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
    
  /*    function getAdvertI18n()
   {
       return $this->advert_i18n=$this->advert_i18n===null?new EmployerAdvertI18n(array('lang'=>$this->get('lang'),'advert_id'=>$this->get('advert_id'))):$this->advert_i18n;
   }
   
     function getAdvert()
   {
       return $this->_advert_id=$this->_advert_id===null?new EmployerAdvert($this->get('advert_id')):$this->_advert_id;
   }*/
   
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
        $format_reference=$this->getSettings()->get('employee_work_reference_format','{year}{month}{day}{id}');
        $parameters=array('{year}'=>date("Y"),
                          '{month}'=>date("m"),
                          '{day}'=>date("d"),
                          '{id}'=>format_number($this->get('id'),$this->getSettings()->get('employee_work_id_format','00000')));
        $this->set('reference',strtr($format_reference,$parameters));
        return $this;
    }  
    
    
    
    function create()
    {
        $this->save();
        $this->setReference();
        $this->save();                
        return $this;
    }
}