<?php

class SmsBoxSentBase extends mfObject3 {
     
    protected static $fields=array('mobile','reference','message','parameters','error_api','error_callback','is_sent',
                                   'is_received' ,'sent_at','created_at');
    const table="t_services_sms_box_sent"; 
   
     protected static $errors=array("-3"=>"Message recrédité",
                            "-2"=>"En attente d'envoi",
                            "-1"=>"Statut inconnu",
                            "0"=>"Message reçu",
                            "1"=>"Echec de la transmission",
                            "2"=>"Message rejeté",
                            "3"=>"Mobile de destination inactif",
                            "4"=>"Mobile de destination ne répond pas",
                            "5"=>"Erreur lors de la réception",
                            "6"=>"Mobile de destination saturé",
                            "7"=>"Numéro de destination inconnu",
                            "8"=>"Message non-routable",
                            "9"=>"Message transmis",
                            "10"=>"Message envoyé",
                            "11"=>"Envoi en cours",                          
                           );
    
    function __construct($parameters=null,$site=null) {
      parent::__construct(null,$site);   
      $this->getDefaults(); 
      if ($parameters === null)  return $this;      
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']); 
          if (isset($parameters['reference']) && isset($parameters['mobile']))
              return $this->loadByReferenceAndMobile((string)$parameters['reference'],(string)$parameters['mobile']);
          if (isset($parameters['reference']))
              return $this->loadByReference((string)$parameters['reference']);          
          return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
            return $this->loadbyMobile((string)$parameters);   
            
      }   
    }
    
    protected function loadByReferenceAndMobile($reference,$mobile)
    {        
         $this->set('reference',$reference);
         $this->set('mobile',$mobile);
         $db=mfSiteDatabase::getInstance()->setParameters(array('reference'=>$reference,'mobile'=>$mobile));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE reference='{reference}' AND mobile='{mobile}';")
            ->makeSqlQuery();               
         return $this->rowtoObject($db);    
    }
    
     protected function loadByReference($reference)
    {        
         $this->set('reference',$reference);
         $db=mfSiteDatabase::getInstance()->setParameters(array($reference));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE reference='%s';")
            ->makeSqlQuery();                                  
         return $this->rowtoObject($db);    
    }   
    
    protected function loadByMobile($mobile)
    {        
         $db=mfSiteDatabase::getInstance()->setParameters(array($mobile));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE mobile='%s';")
            ->makeSqlQuery();                           
         return $this->rowtoObject($db);    
    }   
    
    
    
    protected function getDefaults()
    {
      $this->created_at=isset($this->created_at)?$this->created_at:date("Y-m-d H:i:s");
      $this->is_sent=isset($this->is_sent)?$this->is_sent:"NO";
      $this->is_received=isset($this->is_received)?$this->is_received:"NO";          
    }            
    
    protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('reference'=>$this->get('reference'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE reference='{reference}' ".$key_condition)
         ->makeSiteSqlQuery($this->site);      
    }
  
    
    function setErrorApi($errors)
    {       
        $this->set('error_api',serialize($errors));
    }
    
    function getErrorApi()
    {
        return unserialize($this->get('error_api'));
    }
    
    function setErrorCallback($errors)
    {
        $this->set('error_callback',serialize($errors));//eroor_api,error_callback
    }
    
    function setParameters($parameters)
    {
        $this->set('parameters',serialize($parameters));
        return $this;
    }
    
    function getParameters() 
    {
        $values=new mfArray();
        foreach ((array)unserialize($this->get('parameters')) as $name=>$value)
            $values[]=__($name).":".$value;
        return $values;
    }
    
    function setSentAt($timestamp)
    {
        $this->set("sent_at", date("Y-m-d H:i:s",$timestamp));
    }
            
    function toArray()
    {
        $item = new mfArray();
        foreach (array("reference","error_callback","is_sent","is_received" ,"sent_at") as $field)
            $item[$field]= $this->get($field);
        return $item->toArray();
    }
    
    function toArrayForNotify()
    {
        $item = new mfArray();
        foreach (array('id'=>'num_message','mobile'=>'num_tel','reference'=>'reference','message'=>'message','parameters'=>'parameters') as $key=>$field)
            $item[$field]= $this->get($key);
        $item["server"]= $this->getSite()->get('site_host');
        return $item->toArray();
    }
    
    function fillFromObject($obj)
    {
        foreach (array('num_tel'=>'mobile','reference'=>'reference','message'=>'message','parameters'=>'parameters') as $key=>$field)
            $this->set($field,$obj->get($key));
    }
    
    
    function setResponseFromApi($mobile,$message,SmsBoxApi $sms_api)
    {
        $this->set('message',$message);
        $this->set('mobile',$mobile);
        if ($sms_api->hasError())
        {                          
            $this->setErrorApi($sms_api->getResponse());
        }   
        else
        {
           $this->set("reference",$sms_api->getReference());    
           $this->set("is_sent","YES");
           $this->set("sent_at",date("Y-m-d H:i:s"));
        }   
        $this->setParameters($sms_api->getParameters());       
        return $this;
    }
    
    function setResponseFromApiAndSave($mobile,$message,SmsBoxApi $sms_api)
    {
        $this->setResponseFromApi($mobile,$message,$sms_api);
        $this->save();
        return $this;
    }
    
    
    static function initializeSite($site=null)
    {
         mfSiteDatabase::getInstance()                      
                ->setQuery("TRUNCATE ".self::getTable().";")               
                ->makeSiteSqlQuery($site);                                       
    }

    function getSentAt()
    {
        return new DateTimeFormatter($this->get('sent_at'));

    }
    
    function getMobile()
    {
        return strpos($this->get('mobile'),"+212") ===0?"0".substr($this->get('mobile'),4):$this->get('mobile');                              
    }
    
    
    function hasCallbackError()
    {
        return !in_array($this->get('error_callback'),array(-2,0,9,10,11,12));
    }
    
    function getCallbackError()
   {
       return isset(self::$errors[$this->get('error_callback')])?self::$errors[$this->get('error_callback')]:"";       
   }
   
   function getCallbackErrorForSelect()
   {
       return  new mfArray(self::$errors);
   }
}
