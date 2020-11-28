<?php

class UserForgotPassword extends mfObject2 {
    
    protected static $fields=array('user_id','time','password','key');
    const key="key",table="t_users_forgot_password";
    
    function __construct($parameters=null) {
      parent::__construct();
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
    
    static function cleanup($user)
    {
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array($user->get('id')))
                ->setQuery("DELETE FROM ".self::getTable()." WHERE user_id=%d;")               
                ->makeSqlQuery();
    }
   
}

