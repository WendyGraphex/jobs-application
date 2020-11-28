<?php


class EmployeeAdvertI18nNotationBase extends mfObject3  {
     
    protected static $fields=array('employer_user_id','employee_user_id',
                                   'employee_advert_id','employee_advert_lang',
                                   'employer_advert_id','employer_advert_lang',
                                   'work_id',
                                   'notation','created_at','updated_at');
    const table="t_employee_advert_i18n_notation";
    protected static $fieldsNull=array('updated_at','employee_user_id','employer_user_id','employee_advert_id','work_id','employer_advert_id'); 
    protected static $foreignKeys=array('employer_user_id'=>'EmployerUser',    
                                        'employee_user_id'=>'Employee',    
                                        'employer_advert_id'=>'EmployerAdvert',
                                        'employee_advert_id'=>'EmployeeAdvert',
                                        'work_id'=>'EmployeeWork',                                      
                                        ); // By default
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']); 
          if (isset($parameters['advert_i18n']) && $parameters['advert_i18n'] instanceof EmployeeAdvertI18n && 
              isset($parameters['employee']) && $parameters['employee'] instanceof Employee &&
              isset($parameters['work']) && $parameters['work'] instanceof EmployeeWork)
          {            
              return $this->loadByEmployeeAdvertAndEmployeeAndWork($parameters['advert_i18n'],$parameters['employee'],$parameters['work']);
          }
          if (isset($parameters['advert_i18n']) && $parameters['advert_i18n'] instanceof EmployeeAdvertI18n && 
              isset($parameters['employee']) && $parameters['employee'] instanceof Employee)
          {            
              return $this->loadByEmployeeAdvertAndEmployee($parameters['advert_i18n'],$parameters['employee']);
          }
          
          if (isset($parameters['advert_i18n']) && $parameters['advert_i18n'] instanceof EmployerAdvertI18n && 
              isset($parameters['employee']) && $parameters['employee'] instanceof Employee &&
              isset($parameters['work']) && $parameters['work'] instanceof EmployeeWork)
          {            
              return $this->loadByEmployerAdvertAndEmployeeAndWork($parameters['advert_i18n'],$parameters['employee'],$parameters['work']);
          }
          if (isset($parameters['advert_i18n']) && $parameters['advert_i18n'] instanceof EmployerAdvertI18n && 
              isset($parameters['employee']) && $parameters['employee'] instanceof Employee)
          {            
              return $this->loadByEmployerAdvertAndEmployee($parameters['advert_i18n'],$parameters['employee']);
          }
          return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
        
      }   
    }
    
     protected function  loadByEmployeeAdvertAndEmployeeAndWork(EmployeeAdvertI18n $advert_i18n,Employee $employee_user,EmployeeWork $work)
    {     
        $this->add(array(
            'employee_advert_id'=>$advert_i18n->get('advert_id'),
            'employee_advert_lang'=>$advert_i18n->get('lang'),
            'work_id'=>$work,
            'employee_user_id'=>$employee_user            
        ));
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('work_id'=>$work->get('id'),
                                      'employee_advert_id'=>$advert_i18n->get('advert_id'),
                                      'employee_user_id'=>$employee_user->get('id'),                                      
                                      'employee_advert_lang'=>$advert_i18n->get('lang')))
                ->setQuery("SELECT * FROM ".self::getTable().                          
                           " WHERE ".self::getTableField('employee_advert_id')."='{employee_advert_id}' ".   
                                    " AND ".self::getTableField('employee_advert_lang')."='{employee_advert_lang}'".
                                    " AND ".self::getTableField('employee_user_id')."='{employee_user_id}'".
                                    " AND ".self::getTableField('work_id')."='{work_id}'".
                           ";")               
                ->makeSqlQuery(); 
        return $this->rowtoObject($db);
    }
    
     protected function  loadByEmployeeAdvertAndEmployee(EmployeeAdvertI18n $advert_i18n,Employee $employer_user)
    {                     
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('employee_advert_id'=>$advert_i18n->get('advert_id'),
                                      'employee_user_id'=>$employer_user->get('id'),                                      
                                      'employee_advert_lang'=>$advert_i18n->get('lang')))
                ->setQuery("SELECT * FROM ".self::getTable().                          
                           " WHERE ".self::getTableField('employee_advert_id')."='{employee_advert_id}' ".   
                                    " AND ".self::getTableField('employee_advert_lang')."='{employee_advert_lang}'".
                                    " AND ".self::getTableField('employee_user_id')."='{employee_user_id}'".                                    
                           ";")               
                ->makeSqlQuery(); 
        return $this->rowtoObject($db);
    }
    
     protected function  loadByEmployerAdvertAndEmployeeAndWork(EmployerAdvertI18n $advert_i18n,Employee $employee_user,EmployeeWork $work)
    {     
        $this->add(array(
            'employer_advert_id'=>$advert_i18n->get('advert_id'),
            'employer_advert_lang'=>$advert_i18n->get('lang'),
            'work_id'=>$work,
            'employee_user_id'=>$employee_user            
        ));   
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('work_id'=>$work->get('id'),
                                      'employer_advert_id'=>$advert_i18n->get('advert_id'),
                                      'employee_user_id'=>$employee_user->get('id'),                                      
                                      'employer_advert_lang'=>$advert_i18n->get('lang')))
                ->setQuery("SELECT * FROM ".self::getTable().                          
                           " WHERE ".self::getTableField('employer_advert_id')."='{employer_advert_id}' ".   
                                    " AND ".self::getTableField('employer_advert_lang')."='{employer_advert_lang}'".
                                    " AND ".self::getTableField('employee_user_id')."='{employee_user_id}'".
                                    " AND ".self::getTableField('work_id')."='{work_id}'".
                           ";")               
                ->makeSqlQuery(); 
        return $this->rowtoObject($db);
    }
    
      protected function  loadByEmployerAdvertAndEmployee(EmployerAdvertI18n $advert_i18n,Employee $employee_user)
    {                     
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('employer_advert_id'=>$advert_i18n->get('advert_id'),
                                      'employee_user_id'=>$employee_user->get('id'),                                      
                                      'employer_advert_lang'=>$advert_i18n->get('lang')))
                ->setQuery("SELECT * FROM ".self::getTable().                          
                           " WHERE ".self::getTableField('employer_advert_id')."='{employer_advert_id}' ".   
                                    " AND ".self::getTableField('employer_advert_lang')."='{employer_advert_lang}'".
                                    " AND ".self::getTableField('employee_user_id')."='{employee_user_id}'".                                    
                           ";")               
                ->makeSqlQuery(); 
        return $this->rowtoObject($db);
    }
    
                 
     function getValuesForUpdate()
    {
      $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
    
    
     protected function getDefaults()
    {
          $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
        ));        
    }     
     
   
     function getEmployeeUser()
    {
       return $this->_employee_user_id=$this->_employee_user_id===null?new Employee($this->get('employee_user_id')):$this->_employee_user_id;                 
    } 
    
    function hasEmployerAdvertI18n()
    {
        return (boolean)$this->get('employer_advert_id');
    }
    
      function getEmployerAdvertI18n()
    {
       return $this->employer_advert_i18n_id=$this->employer_advert_i18n_id===null?new EmployerAdvertI18n(array('advert_id'=>$this->get('employer_advert_id'),'lang'=>$this->get('employer_advert_lang'))):$this->employer_advert_i18n_id;                 
    }
    
    function hasEmployeeAdvertI18n()
    {
        return (boolean)$this->get('employee_advert_id');
    }
    
     function getEmployeeAdvertI18n()
    {
       return $this->employee_advert_i18n_id=$this->employee_advert_i18n_id===null?new EmployeeAdvertI18n(array('advert_id'=>$this->get('employee_advert_id'),'lang'=>$this->get('employee_advert_lang'))):$this->employee_advert_i18n_id;                 
    }
    
    
     function create()
     {
         if ($this->isLoaded())
             return $this;
         if ($this->hasEmployerAdvertI18n())
         {    
           $db=mfSiteDatabase::getInstance()
                ->setParameters(array('work_id'=>$this->get('work_id'),
                                      'employer_advert_id'=>$this->get('employer_advert_id'),
                                      'employee_user_id'=>$this->get('employee_user_id'),                                      
                                      'employer_advert_lang'=>$this->get('employer_advert_lang')))
                ->setQuery("SELECT SUM(notation)/count(id) as notation FROM ".CustomerAdvertI18nCriteriaNotation::getTable().                          
                           " WHERE ".CustomerAdvertI18nCriteriaNotation::getTableField('employer_advert_id')."='{employer_advert_id}' ". 
                                    " AND ".CustomerAdvertI18nCriteriaNotation::getTableField('employer_advert_lang')."='{employer_advert_lang}'".
                                    " AND ".CustomerAdvertI18nCriteriaNotation::getTableField('employee_user_id')."='{employee_user_id}'".
                                    " AND ".CustomerAdvertI18nCriteriaNotation::getTableField('work_id')."='{work_id}'".
                           ";")               
                ->makeSqlQuery(); 
            $row=$db->fetchArray();
            $this->set('notation', floatval($row['notation']));
            $this->save(); 
         }
         elseif ($this->hasEmployeeAdvertI18n()) 
         {            
             $db=mfSiteDatabase::getInstance()
                ->setParameters(array('work_id'=>$this->get('work_id'),
                                      'employee_advert_id'=>$this->get('employee_advert_id'),
                                      'employee_user_id'=>$this->get('employee_user_id'),                                      
                                      'employee_advert_lang'=>$this->get('employee_advert_lang')))
                ->setQuery("SELECT SUM(notation)/count(id) as notation FROM ".CustomerAdvertI18nCriteriaNotation::getTable().                          
                           " WHERE ".CustomerAdvertI18nCriteriaNotation::getTableField('employee_advert_id')."='{employee_advert_id}' ". 
                                    " AND ".CustomerAdvertI18nCriteriaNotation::getTableField('employee_advert_lang')."='{employee_advert_lang}'".
                                    " AND ".CustomerAdvertI18nCriteriaNotation::getTableField('employee_user_id')."='{employee_user_id}'".
                                    " AND ".CustomerAdvertI18nCriteriaNotation::getTableField('work_id')."='{work_id}'".
                           ";")               
                ->makeSqlQuery();            
            $row=$db->fetchArray();
            $this->set('notation', floatval($row['notation']));
            $this->save();
         }        
         return $this;
     }
}
