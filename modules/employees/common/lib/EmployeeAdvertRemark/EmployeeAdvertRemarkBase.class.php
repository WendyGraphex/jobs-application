<?php

 
class EmployeeAdvertRemarkBase extends mfObject3 {
     
    protected static $fields=array('remarks','advert_i18n_id','created_at','updated_at');    
    const table="t_employee_advert_i18n_remark"; 
    protected static $foreignKeys=array('advert_i18n_id'=>'EmployeeAdvertI18n');
    protected static $fieldsNull=array('updated_at'); // By default

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
          if ($parameters instanceof RecruiterAdvertI18n)
              return $this->loadByAdvertI18n($parameters);
           if (is_numeric((string)$parameters)) 
              return $this->loadbyId((string)$parameters);         
        } 
    }   
    
    function loadByAvertI18n(EmployeeAdvertI18n $advert_i18n)
    {
        if ($advert_i18n->isNotLoaded())
            return $this;
        $this->set('advert_i18n_id',$advert_i18n);
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('advert_i18n_id'=>$advert_i18n->get('id')))
                ->setQuery("SELECT * FROM ".self::getTable()." WHERE advert_i18n_id='{advert_i18n_id}';")
                ->makeSqlQuery();                           
        return $this->rowtoObject($db);        
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
      
       function getAdvertI18n()
    {
       return $this->_advert_i18n_id=$this->_advert_i18n_id===null?new EmployeeAdvertI18n($this->get('advert_i18n_id')):$this->_advert_i18n_id;                 
    }   
    
    function __toString() {
        return (string)$this->get('remarks');
    }
}