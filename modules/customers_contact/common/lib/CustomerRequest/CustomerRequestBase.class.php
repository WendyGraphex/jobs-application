<?php

class CustomerRequestBase extends mfObject3 {
     
    protected static $fields=array('firstname','lastname','civility','email','phone','adress1',
                                   'adress2','fax','postcode','city','web','function',
                                   'country', 'created_at','updated_at');    
   const table="t_customer_request"; 
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

    protected function loadByAdress1($address1)
    {
         $this->set('adress1',$address1);
         $db=mfSiteDatabase::getInstance()->setParameters(array($address1));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE adress1='%s';")
            ->makeSqlQuery();                           
         return $this->rowtoObject($db);
    }
    protected function loadByAdress2($address2)
    {
         $this->set('adress2',$address2);
         $db=mfSiteDatabase::getInstance()->setParameters(array($address2));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE adress2='%s';")
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
        
   
    /* ======================== F O R M A T T E R ================================================================= */
    
    function getFormattedPhone()
    {
        return mfString::splitter($this->get('phone'));
    }
    

     function getFormattedCreated_at()
    {
        return format_date($this->get('created_at'),['d','q']);
    }
     function getFormattedUpdated_at()
    {
        return format_date($this->get('updated_at'),['d','q']);
    }
       
   
    function getSignature()
    {
        $str="";
        foreach (array('firstname','lastname','email','phone','civility') as $name)
          $str.=$this->get($name);
        return sha1($str);
    }
   

        
    function toArrayForSelect()
    {
        $values=$this->toArray(array('id'));
        $values['name']=mb_strtoupper((string)$this);
        return $values;
    }
    
    function toArrayForEmail()
    {
        $values=$this->toArray();
         if (empty($fields) || in_array('name',$fields))
            $values['name']=ucwords((string)$this);
        if (empty($fields) || in_array('courtesy',$fields))
            $values['courtesy']=format_courtesy('Dear',$this->getGender());
        if (empty($fields) || in_array('gender',$fields))
            $values['gender']=format_gender($this->getGender(),1,true,true);        
        return $values;
    }
    
    function getEmailWithName()
    {
        return array($this->get('email')=>$this->getName());
    }
    
    
    function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new CustomerRequestFormatter($this):$this->formatter;
    }
    
   
}
