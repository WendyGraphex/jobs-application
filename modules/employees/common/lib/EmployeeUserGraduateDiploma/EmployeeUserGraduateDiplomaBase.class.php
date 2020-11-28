<?php


class EmployeeUserGraduateDiplomaBase extends mfOrderedObject3 {
     
    protected static $fields=array('city_id','graduate_id','employee_user_id','country','year','position','created_at','updated_at');
    const table="t_employee_user_graduate_diploma";
         protected static $foreignKeys=array( 'graduate_id'=>'EmployeeGraduateDiploma',
                                               'employee_user_id'=>'EmployeeUser'
                                            ); 
        protected static $fieldsNull=array('updated_at'); 
    
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
         parent::getDefaults();
    }        
       
    protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' AND name!='' ".$key_condition)
         ->makeSqlQuery();       
    }        
           
    function hasI18n()
    {
         return (boolean)$this->i18n; 
    }
    
     public function getI18n($lang=null)
     {       
         if ($this->i18n===null)
         {
             if ($lang==null)
                 $lang=  mfcontext::getInstance()->getUser()->getLanguage();
             $this->i18n=new EmployeeUserGraduateDiplomaI18n(array('lang'=>$lang,"language_id"=>$this->get('id')));
         }   
         return $this->i18n;
     } 
     
     public function setI18n($i18n)
     {
         $this->i18n=$i18n;
         return $this;
     }          
     
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new EmployeeUserGraduateDiplomaFormatter($this):$this->formatter;
   }      
    
    function getI18ns()
    {
        if ($this->i18ns===null)
        {    
            $this->i18ns = new EmployeeUserGraduateDiplomaI18nCollection();
        }
        return $this->i18ns;
    }
    
     function hasGraduate()
    {
        return (boolean)$this->get('graduate_id');
    }
                      
     function getGraduate()
    {
       return $this->_graduate_id=$this->_graduate_id===null?new EmployeeGraduateDiploma($this->get('graduate_id')):$this->_graduate_id;                 
    }  
    
    
    function getYear()
    {
        return $this->get('year');
    }
    
    
    function toArray()
    {
         $values=parent::toArray(array('country','year','graduate_id'));
         $values['i18n']=$this->getI18ns()->toArray();
         return $values;
    }
}
