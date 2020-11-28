<?php

class CustomerAcademyStudentUserForgotPassword extends mfObject3 {
    
    protected static $fields=array('user_id','password','key');
    protected static $foreignKeys=array('user_id'=>'CustomerAcademyStudentUser'); 
    const table="t_customer_academy_student_user_forgot_password";
    
   function __construct($parameters=null) {
      parent::__construct();
       $this->getDefaults(); 
      if ($parameters===null) return $this; 
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {     
          if (isset($parameters['key']))
            return $this->loadbyKey((string)$parameters['key']);
          return $this->add($parameters);
      }   
      else
      {    
         if ($parameters instanceof CustomerAcademyStudentUser)
              return $this->loadByUser($parameters);
         if (is_numeric($parameters))
             return $this->loadbyId((string)$parameters);
         return $this->loadbyKey((string)$parameters);
      }   
    }
    
    protected function loadByKey($key)
    {        
        $this->set('key',$key);
         $db=mfSiteDatabase::getInstance()
             ->setParameters(array('key'=>$key))
            ->setQuery("SELECT * FROM ".self::getTable()." WHERE `key`='{key}';")
            ->makeSqlQuery();                           
         return $this->rowtoObject($db);
    }
    
    protected function loadByUser(EmployerUser $user)
    {
        if ($user->isNotLoaded())
            return ;
        $this->set('user_id',$user);      
    }
            
    protected function getDefaults()
    {
       $this->time=date("Y-m-d H:i:s");    
    }  
        
    
    protected function generateKey()
    {                  
         $this->set('key',sha1(md5(mfTools::generatePassword(8)) . $this->get('user_id')));                    
         return $this;
    }
    
    protected function generateKeyAndPassword()
    {
         $password = mfTools::generatePassword(8);
         $password_md5 = md5($password);
         $this->set('key',sha1($password_md5 . $this->get('user_id')));         
         $this->set('password',$password_md5);
         $this->set('nocrypted_password',$password);     
         return $this;
    }
    
    function getUser()
    {
        return $this->_user_id=$this->_user_id===null?new CustomerAcademyStudentUser($this->get('user_id')):$this->_user_id;
    }
    
    function cleanup()
    {
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('user_id'=>$this->get('user_id')))
                ->setQuery("DELETE FROM ".self::getTable()." WHERE user_id='{user_id}';")               
                ->makeSqlQuery();
    }
   
    function toArray()
    {
        $values=  parent::toArray();
        $values['nocrypted_password']=$this->get('nocrypted_password');
        $values['uri']=link_i18n('customers_academy_student_forgot_password_change')."?k=".$this->get('key');
        return $values;
    }
    
    function createKeyAndPassword()
    {
        if ($this->getUser()->isNotLoaded())
            return $this;
        $this->cleanup();
        $this->generateKeyAndPassword();
        $this->save();
        return $this;
    }
    
    
    function createKey()
    {
        if ($this->getUser()->isNotLoaded())
            return $this;
        $this->cleanup();
        $this->generateKey();
        $this->save();
        return $this;
    }
}

