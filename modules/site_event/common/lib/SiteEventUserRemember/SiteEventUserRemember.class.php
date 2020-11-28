<?php

class SiteEventUserRemember extends mfObject3 {

    protected static $fields=array( 'key','ip','user_id','created_at');
    protected static $foreignKeys=array('user_id'=>'SiteEventUser');
    const table="t_site_event_user_remember";
    
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
    
    
    function getDefaults() {
        $this->set('created_at',date("Y-m-d H:i:s"));
        return $this;
    }
        
    function getKey()
    {
        return $this->key;        
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
    
     function setUser(SiteEventUser $user)
    {
       $this->set('user_id',$user->get('id'));
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
  
    function getUser()
    {
        return $this->_user_id=$this->_user_id===null?new SiteEventUser($this->get('user_id')):$this->_user_id;
    }
    
    static function getCookieName()
    {
        return md5('SiteEventUserRememberFrontend');
    }
    
    static function cleanup($time_expiration,SiteEventUser $user)
    {
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array($time_expiration,$user->get('id')))
                ->setQuery("DELETE FROM ".self::getTable()." WHERE created_at='%s' OR user_id=%d;")               
                ->makeSqlQuery();
    }
    
    static function getUserRemember($key)
    {
         $db=mfSiteDatabase::getInstance()
                ->setParameters(array('key'=>$key))
                ->setObjects(array('SiteEventUserRemember','SiteEventUser'))
                ->setQuery("SELECT {fields} FROM ".self::getTable().
                           " INNER JOIN ".self::getOuterForJoin('user_id').                            
                           " WHERE `key`='{key}' LIMIT 1".
                           ";")               
                ->makeSqlQuery();
        if (!$db->getNumRows())
            return false;
        $items=$db->fetchObjects();
        $items->getSiteEventUserRemember()->set('user_id',$items->getSiteEventUser());
        return $items->getSiteEventUserRemember();
    }
        
}

