<?php

class Session extends mfObject2 {
    
    protected static $fields=array('session','ip','start_time','last_time','user_id');
    const table="t_sessions"; 
    protected static $foreignKeys=array('user_id'=>'User'); 
    
    function __construct($parameters=null,$application=null) {
      parent::__construct($application);
      if ($parameters===null) return $this; // Empty object comes from object creation / update partiallly
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          // DO NOTHING IN THIS CASE
      }   
      else
      {            
           return $this->loadBySession((string)$parameters);     
      }   
    }
    
      protected function loadBySession($session)
    {                  
         $this->set('session',$session);
         $db=mfSiteDatabase::getInstance()->setParameters(array('session'=>$session));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE session='{session}';");        
         $db->makeSqlQuery();                              
         return $this->rowtoObject($db);
    }
    
     protected function getDefaults()
     {
       $this->start_time=date("Y-m-d H:i:s");  
       $this->last_time=date("Y-m-d H:i:s");  
     }
     
     protected function executeLoadById($db)
    {
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getKeyName()."='%s';")
            ->makeSqlQuery();  
    }
    
    protected function executeInsertQuery($db)
    {
        $db->makeSqlQuery(); 
    }
    
    protected function executeUpdateQuery($db)
    {
       $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".self::getKeyName()."='%s' ;")
           ->makeSqlQuery(); 
    }
    
    protected function executeDeleteQuery($db)
    {
        $db->setQuery("DELETE FROM ".self::getTable()." WHERE ".self::getKeyName()."='%s';")
           ->makeSqlQuery();   
    }
     // GETTER
    
    function getUserId()
    {
        return $this->user_id;
    }
    
    function getIP()
    {
        return $this->ip;
    }
    
    function getLastTime()
    {
        return $this->last_time;
    }
    
    function getStartTime()
    {
        return $this->start_time;
    }
    
    // SETTERS
    function setSession($session)
    {
        $this->set('session',$session);
    }
    
    function setIP($ip)
    {
        $this->set('ip',$ip);
    }
    
    function setLastTime($last_time)
    {
        $this->set('last_time',$last_time);        
    }
    
    function setUser(User $user)
    {
        $this->set('user_id',$user);
    }
    
    function getUser()
    {
        return $this->_user_id=$this->_user_id===null?new User($this->get('user_id')):$this->_user_id;
    }
}

