<?php

class SiteEventSpeakerUsersBase extends mfObject3 {
    
     protected static $fields=array('speaker_user_id','event_id','created_at','updated_at');    
    const table="t_site_event_speaker_users"; 
    protected static $foreignKeys=array('speaker_user_id'=>'SiteEventSpeakerUser','event_id'=>'SiteEvent'); // By default
    protected static $fieldsNull=array('updated_at'); // By default


    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']);                    
          return $this->add($parameters); 
      }
      else
        {         
           if (is_numeric((string)$parameters)) 
              return $this->loadbyId((string)$parameters);
         
        } 
    }   
     /* protected function loadByPhoneOrMobile($phone)
      {       
           $this->set('phone',$phone);
           $db=mfSiteDatabase::getInstance()->setParameters(array('phone'=>$phone));
           $db->setQuery("SELECT * FROM ".self::getTable()." WHERE phone='{phone}' OR mobile='{phone}';")
              ->makeSqlQuery();                           
           return $this->rowtoObject($db);
      }*/
      
     
       protected function getDefaults()
    {
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),           
        ));      
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
        
    function getEvent()
    {
       return $this->_speaker_id=$this->_speaker_id===null?new SiteEvent($this->get('speaker_id')):$this->_speaker_id;                 
    }
    
     function getSpeakerUser()
    {
       return $this->_speaker_user_id=$this->_speaker_user_id===null?new SiteEventSpeakerUser($this->get('speaker_user_id')):$this->_speaker_user_id;                 
    }
}
