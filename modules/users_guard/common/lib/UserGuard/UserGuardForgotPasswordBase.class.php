<?php

class UserGuardForgotPasswordBase extends mfObject2 {
    
    protected static $fields=array('user_id','time','password','key');   
    const key="key";
    
    function __construct($parameters=null) {
      parent::__construct();
       $this->getDefaults(); 
      if ($parameters===null) return $this; 
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          return $this->add($parameters);
      }   
      else
      {    
         $this->loadbyId((string)$parameters);
      }   
    }
    
    protected function executeLoadById($db)
    {
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE `".self::getKeyName()."`='%s';")
             ->makeSqlQuery();   
    }
    
    protected function getDefaults()
    {
       $this->time=date("Y-m-d H:i:s");    
    }
    
    protected function executeInsertQuery($db)
    {
        $db->makeSqlQuery();  
    }
    
    protected function executeUpdateQuery($db)
    {
       $db->setQuery("UPDATE ".self::getTable()." SET ".$this->getFieldsForUpdate()." WHERE `".self::getKeyName()."`='%s' ;")
           ->makeSqlQuery(); 
    }
    
    protected function executeDeleteQuery($db)
    {
        $db->setQuery("DELETE FROM ".self::getTable()." WHERE `".self::getKeyName()."`='%s';")
           ->makeSqlQuery();   
    }
    
    
    function generateKeyAndPasswordForUser($user)
    {
         $password = mfTools::generatePassword(8);
         $password_md5 = md5($password);
         $this->set('key',sha1($password_md5 . $user->getId()));         
         $this->set('password',$password_md5);
         $this->set('nocrypted_password',$password);
         $this->set('user_id',$user);
         $this->save();
    }
    
    static function cleanup($user)
    {
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array($user->get('id')))
                ->setQuery("DELETE FROM ".static::getTable()." WHERE user_id=%d;")               
                ->makeSqlQuery();
    }
       
}

