<?php

class EmployerUserValidationTokenBase extends mfObject3 {
    
    protected static $fields=array('user_id','token','created_at');
    protected static $foreignKeys=array('user_id'=>'EmployerUser'); 
    const table="t_employer_user_validation_token";
    
    function __construct($parameters=null) {
      parent::__construct();
       $this->getDefaults(); 
      if ($parameters===null) return $this; 
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
           if (isset($parameters['token']) && isset($parameters['email']))
               return $this->loadbyTokenAndEmail((string)$parameters['token'],(string)$parameters['email']);        
          if (isset($parameters['token']))
               return $this->loadbyToken((string)$parameters['token']);         
          
          return $this->add($parameters);
      }   
      else
      {  
         if ($parameters instanceof EmployerUser)
              return $this->loadByUser($parameters);     
         return $this->loadbyId((string)$parameters);
      }   
    }
    
     protected function loadByToken($token)
    {       
         $this->set('token',$token);
         $db=mfSiteDatabase::getInstance()->setParameters(array('token'=>$token));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE token='{token}';")
            ->makeSqlQuery();                           
         return $this->rowtoObject($db);
    }
    
     protected function loadByTokenAndEmail($token,$email)
    {               
         $this->set('token',$token);
         $this->set('email',$email);
         $db=mfSiteDatabase::getInstance()
                 ->setParameters(array('token'=>$token,'email'=>$email))
                 ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().
                       " INNER JOIN ".self::getOuterForJoin('user_id').
                       " WHERE token='{token}' AND email='{email}'".
                       " ORDER BY ".self::getTableField('id')." ASC".
                       " LIMIT 0,1".
                       ";")
            ->makeSqlQuery();                           
         return $this->rowtoObject($db);
    }
    
    function loadByUser(EmployerUser $user)
    {
        if ($user->isNotLoaded())
            return $this;
        $this->set('user_id',$user);
         $db=mfSiteDatabase::getInstance()
                 ->setParameters(array('user_id'=>$user->get('id')))
                 ->setQuery("SELECT * FROM ".self::getTable()." WHERE user_id='{user_id}'".
                            ";")
                 ->makeSqlQuery();                           
         return $this->rowtoObject($db);                        
    }
    
   
    protected function getDefaults()
    {       
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),            
        ));    
    }
    
    function getUser()
    {
        return $this->_user_id=$this->_user_id===null?new EmployerUser($this->get('user_id')):$this->_user_id;
    }
    
    function create()
    {
        $this->cleanUp();
        $this->set('token',sha1(mfTools::generatePassword(64)));
        $this->save();        
        return $this;
    }
    
    protected function cleanUp()
    {
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array($this->get('id')))
                ->setQuery("DELETE FROM ".self::getTable()." WHERE user_id='%d';")               
                ->makeSqlQuery();
    }
    
    function toArrayForEmail()
    {
        return array('url'=>link_i18n('employers_validate_email',array(),null,'frontend')."?token=".$this->get('token')."&email=".$this->getUser()->get('email'));
    }
    
    function validate() 
    {
        if ($this->isNotLoaded())
            return $this;
        $this->getUser()->validate();                        
      //  $this->delete();
        $this->clean();
        return $this;
    }
    
    function clean()
    {
         $db=mfSiteDatabase::getInstance()
                 ->setParameters(array())
                 ->setQuery("DELETE FROM ".self::getTable().
                            " WHERE created_at <  DATE_SUB(NOW(), INTERVAL 1 HOUR)".
                            ";")
                 ->makeSqlQuery();  
         return $this;
    }
    
    static function cleanUpForUser(User $user)
    {
       $db=mfSiteDatabase::getInstance()
                 ->setParameters(array('user_id'=>$user->get('id')))
                 ->setQuery("DELETE FROM ".self::getTable().
                            " WHERE user_id='{user_id}'".
                            ";")
                 ->makeSqlQuery();  
    }
}

