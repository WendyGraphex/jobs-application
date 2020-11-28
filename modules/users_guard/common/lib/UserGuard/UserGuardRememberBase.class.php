<?php

abstract class UserGuardRememberBase extends mfObject2 {

    protected static $fields=array( 'key','ip','user_id');  
    const key="key";
    
    abstract function getUser();
    abstract static function getUserRemember($key);
    
    function __construct($parameters=null) {
      parent::__construct();
      if ($parameters===null) return $this; 
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
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
    
    protected function executeInsertQuery($db)
    {
        $db->makeSqlQuery(); 
    }
    
    protected function executeUpdateQuery($db)
    {
       $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE `".self::getKeyName()."`='%s' ;")
           ->makeSqlQuery(); 
    }
    
    protected function executeDeleteQuery($db)
    {
        $db->setQuery("DELETE FROM ".self::getTable()." WHERE `".self::getKeyName()."`='%s';")
           ->makeSqlQuery();   
    }
    
   // GETTERS
    function getKey()
    {
        return $this->key;        
    }
    
    function getUserId()
    {
        return $this->user_id;
    }
    
    function getIP()
    {
        return $this->ip;
    }
    
   // SETTERS 
    
    function setKey($key)
    {
      $this->set('key',$key);
      return $this;
    }
    
     function setUser($user)
    {
       $this->set('user_id',$user->getId());
       return $this;
    }
    
     function setIP($ip)
    {
        $this->set('ip',$ip);
        return $this;
    }
    
    function generateRandomKey($len = 36)
    {
      $this->set('key',base_convert(sha1(uniqid(mt_rand(), true)), 16, $len));
      return $this;
    }
     
    
    function getCookieName()
    {
        return md5('RememberFrontend'.get_class($this));
    }
    
    static function cleanup($time_expiration,$user)
    {
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array($time_expiration,$user->getId()))
                ->setQuery("DELETE FROM ".static::getTable()." WHERE created_at='%s' OR user_id=%d;")               
                ->makeSqlQuery();
    }
    
    
        
}

