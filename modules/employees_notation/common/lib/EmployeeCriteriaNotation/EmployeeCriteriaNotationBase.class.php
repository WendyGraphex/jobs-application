<?php


class EmployeeCriteriaNotationBase extends mfObject3  {
     
    protected static $fields=array('employee_user_id','criteria_id','notation','created_at','updated_at');
    const table="t_employee_criteria_notation";
    protected static $fieldsNull=array('updated_at','employee_user_id','criteria_id'); 
    protected static $foreignKeys=array('employee_user_id'=>'Employee',  
                                        'criteria_id'=>'EmployeeNotationCriteria',
                                        ); // By default
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']); 
          if (isset($parameters['employee']) && $parameters['employee'] instanceof Employee)
          {            
              return $this->loadByEmployee($parameters['employee']);
          }
          return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
        
      }   
    }
         
     protected function  loadByEmployee(Employee $employee_user)
    {     
        $this->add(array(             
            'employee_user_id'=>$employee_user            
        ));       
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
    
    function create()
    {        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array(                                      
                                      'employee_user_id'=>$this->get('employee_user_id'),                                      
                                     ))
                ->setQuery("SELECT SUM(notation)/count(id) as notation,employee_criteria_id FROM ".CustomerAdvertI18nCriteriaNotation::getTable().                          
                           " WHERE ".CustomerAdvertI18nCriteriaNotation::getTableField('employee_user_id')."='{employee_user_id}'".                                   
                           " GROUP BY employee_criteria_id".
                           ";")               
                ->makeSqlQuery();     
        if (!$db->getNumRows())           
             return $this;
        $collection = new EmployeeCriteriaNotationCollection();
        while ($row=$db->fetchArray())
        {
            $item=clone $this;
            $item->set('criteria_id',$row['employee_criteria_id']);
            $item->set('notation', floatval($row['notation']));
            $collection[]=$item;
        }                       
        $collection->save();
        
        // update 
        // average_notation  / number_of_notations 
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array(                                      
                                      'employee_user_id'=>$this->get('employee_user_id'),                                      
                                     ))
                ->setQuery("SELECT SUM(notation)/count(id) as notation,count(id) as number_of_notations FROM ". EmployeeAdvertI18nNotation::getTable().                          
                           " WHERE ". EmployeeAdvertI18nNotation::getTableField('employee_user_id')."='{employee_user_id}'".                                                             
                           ";")               
                ->makeSqlQuery();       
        $row=$db->fetchArray();     
        $this->getEmployeeUser()->add(array('average_notation'=> floatval($row['notation']) * 10 , 'number_of_notations'=>$row['number_of_notations']))->save();                        
        return $this;
    }
}
