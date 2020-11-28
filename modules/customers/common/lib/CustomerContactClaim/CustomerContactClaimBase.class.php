<?php



class CustomerContactClaimBase extends mfObject3 {
     
    protected static $fields=array('firstname','lastname','phone','mobile','email', 'created_at','updated_at');    
   const table="t_customer_contact_claim"; 
    protected static $foreignKeys=array(); // By default


    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']);            
          if (isset($parameters['lastname'])  && isset($parameters['firstname']))
             return $this->loadbyFirstnameAndLastname((string)$parameters['firstname'],(string)$parameters['lastname']); 
          if (isset($parameters['phone']))
             return $this->loadbyPhoneOrMobile((string)$parameters['phone']); 
          return $this->add($parameters); 
      }   
      else
      {         
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
         return $this->loadByEmail((string)$parameters);
      }   
    }
    
    
    
     protected function loadByPhoneOrMobile($phone)
    {       
         $this->set('phone',$phone);
         $db=mfSiteDatabase::getInstance()->setParameters(array('phone'=>$phone));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE phone='{phone}' OR phone='{phone}';")
            ->makeSqlQuery();                           
         return $this->rowtoObject($db);
    }
    
    protected function loadByFirstnameAndLastname($firstname,$lastname)
    {
         $this->set('firstname',$firstname);
         $this->set('lastname',$lastname);
         $db=mfSiteDatabase::getInstance()->setParameters(array('firstname'=>$firstname,'lastname'=>$lastname));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE firstname='{firstname}' AND lastname='{lastname}';")
            ->makeSqlQuery();                           
         return $this->rowtoObject($db);
    }
    
    protected function loadByEmail($email)
    {
         $this->set('email',$email);
         $db=mfSiteDatabase::getInstance()->setParameters(array($email));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE email='%s';")
            ->makeSqlQuery();                           
         return $this->rowtoObject($db);
    }
   
    protected function getDefaults()
    {
       $this->created_at=isset($this->created_at)?$this->created_at:date("Y-m-d H:i:s");
       $this->updated_at=isset($this->updated_at)?$this->updated_at:date("Y-m-d H:i:s");                 
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
        return $this->formatter=$this->formatter===null?new CustomerContactClaimFormatter($this):$this->formatter;
    }
    
   
}
