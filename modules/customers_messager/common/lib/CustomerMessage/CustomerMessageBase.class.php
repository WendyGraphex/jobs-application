<?php

/*
 * FROM : employee => employer  
 * TO : employer => employee
 * FROM : employee => user, employer => user
 * TO : user => employee   , user => employer
 */

class CustomerMessageBase extends mfObject3 {
     
    protected static $fields=array('employer_user_id','sender','user_id','employee_user_id','subject','message',
                                   'parent_id','state','number_of_files','read_at','deleted_at',
                                   'employer_deleted_at','employee_deleted_at','created_at');    
   const table="t_customer_message"; 
    protected static $fieldsNull=array('state','read_at','sender','parent_id','employer_user_id','user_id','employee_user_id','number_of_files','read_at','employer_deleted_at','employee_deleted_at','deleted_at');  
    protected static $foreignKeys=array('employer_user_id'=>'EmployerUser',
                                        'employee_user_id'=>'Employee',
                                        'user_id'=>'User',
                                        'parent_id'=>'CustomerMessage'
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
            'number_of_files'=>0,      
        ));   
    }
    
    function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new CustomerMessageFormatter($this):$this->formatter;
    }
    
    function hasEmployerUser()
    {
        return $this->get('employer_user_id');
    }
    
    function getEmployerUser()
    {
        return $this->_employer_user_id= $this->_employer_user_id===null?new EmployerUser($this->get('employer_user_id')): $this->_employer_user_id;
    }
    
    function hasEmployeeUser()
    {
        return $this->get('employee_user_id');
    }
    
    function getEmployeeUser()
    {
        return $this->_employee_user_id= $this->_employee_user_id===null?new Employee($this->get('employee_user_id')): $this->_employee_user_id;
    }
    
    function hasUser()
    {
        return $this->get('user_id');
    }
    
    function getUser()
    {
        return $this->_user_id= $this->_user_id===null?new User($this->get('user_id'),'admin'): $this->_user_id;
    }    
    
    function getCreatedAt()
    {
        return new DateTimeFormatter($this->get('created_at'));
    }
    
    function isDeleted()
    {
         return (boolean)$this->get('deleted_at');
    }
    
     function isRead()
    {
         return (boolean)$this->get('read_at');
    }
    
   /* function isDeletedByEmployee()
    {
        return (boolean)$this->get('employee_deleted_at');
    }
    
     function isDeletedByEmployeer()
    {
       return (boolean)$this->get('employer_deleted_at');  
    }
    
    function deleteForEmployee()
    {
        if ($this->isTo())
            return $this;
        $this->set('employee_deleted_at',date("Y-m-d H:i:s"))->save();
        return $this;
    }
    
    function deleteForEmployeee()
    {
        if ($this->isTo())
            return $this;
        $this->set('employeee_deleted_at',date("Y-m-d H:i:s"))->save();
        return $this;
    }*/
    
    function delete()
    {      
        $this->set('deleted_at',date("Y-m-d H:i:s"))->save();
        return $this;
    }
    
    function create()
    {
        if ($this->isLoaded())
            return $this;        
        $this->save();        
        return $this;
    }
    
    
    function send()
    {
        $this->set('state','SENT');
        $this->save();
        return $this;
    }
    
    function incFile()
    {
         $this->set('number_of_files',$this->get('number_of_files')+1)->save();
         return $this;
    }
    
    function decFile()
    {
         $this->set('number_of_files',$this->get('number_of_files')-1)->save();
         return $this;
    }
    
    function hasFiles()
    {
        return (boolean)$this->get('number_of_files');
    }
    
    function isSender()
    {
        return $this->get('sender')=='ADMIN';
    }
    
    function getFiles()
    {
        if ($this->files===null)
        {
            $this->files= new CustomerMessageFileCollection();
            $db=mfSiteDatabase::getInstance()
                ->setParameters(array('message_id'=>$this->get('id')))         
                ->setQuery("SELECT * FROM ".CustomerMessageFile::getTable().                   
                           " WHERE ".CustomerMessageFile::getTableField('message_id')."='{message_id}'".                                                   
                            ";")
                ->makeSqlQuery();  
             if (!$db->getNumRows())
                 return $this->files;
             while ($item=$db->fetchObject('CustomerMessageFile'))
             {
                 $this->files[$item->get('id')]=$item->loaded();
             }        
        }   
        return $this->files;
    }
    
    function read()
    {
        if ($this->isNotLoaded() || $this->isRead())
            return $this;
         $this->set('read_at',date("Y-m-d H:i:s"))->save();
        return $this;
    }
    
    function isEmployeeSender()
    {
        return $this->get('sender')=='EMPLOYEE';
    }
    
    function isEmployerSender()
    {
        return $this->get('sender')=='EMPLOYER';
    }
    
    function isAdminSender()
    {
        return $this->get('sender')=='ADMIN';
    }
    
    function getSender()
    {
        if ($this->isEmployeeSender())
            return $this->getEmployeeUser();
        if ($this->isEmployerSender())
            return $this->getEmployerUser();
        return $this->getUser();
    }
    
    function getReceiver()
    {
        if (!$this->isEmployeeSender() && $this->hasEmployeeUser())
            return $this->getEmployeeUser();
        if (!$this->isEmployerSender() && $this->hasEmployerUser())
            return $this->getEmployerUser();       
        return $this->getUser();
    }
}
