<?php

class GoogleMapAddressBase extends mfObject2 {
     
    protected static $fields=array('address','lat','lng','signature','error','created_at','updated_at');
    const table="t_google_map_address"; 
    protected static $foreignKeys=array('customer_id'=>'Customer'); // By default
    protected static $fieldsNull=array('lat','lng','coordinates'); // By default

    function __construct($parameters=null,$site=null) {
      parent::__construct(null,$site);   
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
         else
            return $this->loadBySignature((string)$parameters);  
      }   
    }
    
    
     protected function loadBySignature($signature)
    {      
         $this->set('signature',$signature);
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('signature'=>$signature))
            ->setQuery("SELECT * FROM ".static::getTable().
                       " WHERE signature='{signature}' AND signature!='';")
            ->makeSqlSiteQuery($this->site);                       
        return $this->rowtoObject($db); 
    }  
  /*  protected function loadByEmail($email)
    {
         $this->set('email',$email);
         $db=mfSiteDatabase::getInstance()->setParameters(array($email));
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE email='%s';")
            ->makeSiteSqlQuery($this->site);                           
         return $this->rowtoObject($db);
    }*/
    
    protected function executeLoadById($db)
    {
         $db->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
            ->makeSqlSiteQuery($this->site);  
    }
    
    protected function getDefaults()
    {
       $this->created_at=isset($this->created_at)?$this->created_at:date("Y-m-d H:i:s");
       $this->updated_at=isset($this->updated_at)?$this->updated_at:date("Y-m-d H:i:s");         
    }
     
    protected function executeInsertQuery($db)
    {
       $db->makeSiteSqlQuery($this->site);   
    }
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
    
    protected function executeUpdateQuery($db)
    {
       $db->setQuery("UPDATE ".self::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".self::getKeyName()."=%d ;")
          ->makeSiteSqlQuery($this->site); 
    }
    
    protected function executeDeleteQuery($db)
    {
        $db->setQuery("DELETE FROM ".self::getTable()." WHERE ".self::getKeyName()."=%d;")
           ->makeSiteSqlQuery($this->site);   
    }
    
    
     protected function getAddressEscape()
    {
        return strtoupper(str_replace(array(","," "),"", $this->get('address')));
    }
   
    function getSignature()
    {
        return sha1($this->getAddressEscape()); 
    }
    
    function setSignature()
    {     
        $this->set('signature',$this->getSignature());      
        return $this;
    }       
   
    function getCoordinates()
    {
        if ($this->coordinates===null)
        {
           $this->coordinates=new  CoordinateFormatter(new GPSCoordinate($this->get('lat'),$this->get('lng')));
        }   
        return $this->coordinates;
    }
    
    
    function getCreatedAt()
    {
        return new DateFormatter($this->get('created_at'));
    }
    
    function hasError()
    {
        return (boolean)$this->get('error');
    }
    
    function record(GoogleMapApi $api)
    {
       $this->setFromApi($api);
       $this->save();
       return $this;
    }
    
    function setFromApi(GoogleMapApi $api)
    {
         if ($api->hasError())            
            $this->add(array('address'=>$api->getParameter ('address'),'error'=>$api->getError()));
        else
            $this->add(array('address'=>$api->getParameter ('address'),'lat'=>$api->getLatitude(),'lng'=>$api->getLongitude())); 
       $this->setSignature();
       return $this;
    }
    
    
      static function initializeSite($site=null)
    {
         $db=mfSiteDatabase::getInstance()
                ->setParameters(array())                
                ->setQuery("TRUNCATE ".GoogleMapAddress::getTable().";")               
                ->makeSiteSqlQuery($site);                     
    }
}
