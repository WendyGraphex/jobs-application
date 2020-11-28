<?php

abstract class UserGuardSessionBase extends mfObject3  {
    
    protected static $fields=array('session','ip','lat','lng','started_at','ended_at','user_id');    
    protected static $fieldsNull=array('lat','lng');
   
    abstract function getUser();
    
    function __construct($parameters=null) {
      parent::__construct();
      $this->getDefaults(); 
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
       $this->started_at=date("Y-m-d H:i:s");  
       $this->ended_at=date("Y-m-d H:i:s");  
     }
         
     // GETTER
        
    
    function getIP()
    {
        return $this->ip;
    }
    
    function getLastTime()
    {
        return $this->ended_at;
    }
    
    function getStartTime()
    {
        return $this->started_at;
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
        $this->set('ended_at',$last_time);        
    }
    
    function setUser($user)
    {
        $this->set('user_id',$user);
    }
    
    function setLocation(GPSCoordinate $position)
    {
        $this->add(array('lat'=>$position->getLatitude(),'lng'=>$position->getLongitude()));
    }
    
    static function getNumberOfConnectedUsers()
    {                  
         $db=mfSiteDatabase::getInstance()
                   ->setParameters(array('timeout'=>date("Y-m-d H:i:s",time()-mfContext::getInstance()->getUser()->getOption('timeout')),
                                'time'=>date("Y-m-d H:i:s",time()- 2 * 60 )))                                  
                   ->setQuery("SELECT count(id) FROM ".self::getTable().                            
                             " WHERE started_at >='{timeout}' AND ended_at >= '{time}'".
                              ";")
                   ->makeSqlQuery();  
          if (!$db->getNumRows())
              return 0;
          $row=$db->fetchRow();          
          return $row[0];
    }
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->get('updated_at'));
    }
    
    
    function getStartedAt()
    {
        return new DateTimeFormatter($this->get('started_at'));
    }
    
    function getEndedAt()
    {
        return new DateTimeFormatter($this->get('ended_at'));
    }
    
       
}
