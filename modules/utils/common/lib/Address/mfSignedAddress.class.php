<?php


abstract class mfSignedAddress extends mfObject2 {
    
    function __construct($parameters=null) {
      parent::__construct();
      $this->getDefaults();
      if ($parameters === null)  return $this;
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
        /*  if (isset($parameters['id']) && is_numeric((string)$parameters['id']) && isset($parameters['customer']) && $parameters['customer'] instanceof Customer)
              return $this->loadByIdAndCustomer((string)$parameters['id'],$parameters['customer']); */
          if (isset($parameters['id']))
             return $this->loadbyId((string)$parameters['id']); 
          if (isset($parameters['lat']) && isset($parameters['lng']))
             return $this->loadbyCoordinates((string)$parameters['lat'],(string)$parameters['lng']); 
          return $this->add($parameters); 
      }   
      else
      {
         if (is_numeric((string)$parameters)) 
            return $this->loadbyId((string)$parameters);
         return $this->loadBySignature((string)$parameters);
      }   
    }
    
    protected function loadbyCoordinates($lat,$lng)
    {
       $this->set('lat',$lat);
       $this->set('lng',$lng);
       $db=mfSiteDatabase::getInstance()->setParameters(array('lng'=>$lng,'lat'=>$lat));
         $db->setQuery("SELECT * FROM ".static::getTable()." WHERE lat={lat} AND lng={lng};")
            ->makeSqlQuery();                           
        return $this->rowtoObject($db);  
    }   
    
    protected function loadBySignature($signature)
    {
        $this->set('signature',$signature);
        $db=mfSiteDatabase::getInstance()->setParameters(array('signature'=>$signature));
         $db->setQuery("SELECT * FROM ".static::getTable()." WHERE signature='{signature}';")
            ->makeSqlQuery();                           
        return $this->rowtoObject($db); 
    }  
    
    protected function loadBySignatureAndCoordinates()
    {      
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('signature'=>$this->get('signature'),
                                  'lat'=>$this->get('lat'),
                                  'lng'=>$this->get('lng')
                        ))
            ->setQuery("SELECT * FROM ".static::getTable().
                       " WHERE (signature='{signature}' AND signature!='') OR (lat='{lat}' AND lng='{lng}');")
            ->makeSqlQuery();                           
        return $this->rowtoObject($db); 
    }  
    
    protected function executeLoadById($db)
    {
         $db->setQuery("SELECT * FROM ".static::getTable()." WHERE ".static::getKeyName()."=%d;")
            ->makeSqlQuery();   
    }
    
    protected function getDefaults()
    {
       $this->created_at=isset($this->created_at)?$this->created_at:date("Y-m-d H:i:s");
       $this->updated_at=isset($this->updated_at)?$this->updated_at:date("Y-m-d H:i:s");      
       $this->country=isset($this->country)?$this->country:"FR";
       $this->status=isset($this->status)?$this->status:"ACTIVE";      
       $this->is_active=isset($this->is_active)?$this->is_active:"YES";
    }
     
    protected function executeInsertQuery($db)
    {
       $db->makeSqlQuery();   
    }
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
    
    protected function executeUpdateQuery($db)
    {
       $db->setQuery("UPDATE ".static::getTable()." SET " . $this->getFieldsForUpdate() . " WHERE ".static::getKeyName()."=%d ;")
          ->makeSqlQuery();   
    }
    
    protected function executeDeleteQuery($db)
    {
        $db->setQuery("DELETE FROM ".static::getTable()." WHERE ".static::getKeyName()."=%d;")
           ->makeSqlQuery();      
    }
    
    protected function executeIsExistQuery($db)    
    {
     /* $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s'":"";
      $db->setParameters(array('alias'=>$this->get('alias'),"user_id"=>$this->get('user_id'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE alias='{alias}' AND user_id={user_id} ".$key_condition.";")
         ->makeSqlQuery();  */
    }
    
    function getFullAddress()
    {
        $address="";
        foreach (array('address1','address2','postcode','city') as $field)
                $address.=$this->get($field)." ";
        return $address;
    }
    
    function getPartialAddress()
    {
        return $this->get('address1')."\n".$this->get('address2');
    }
    
    function getAddress($fields=array())
    {
        $value="";
        if (empty($fields))
            $fields=array('address1','address2','postcode','city','country');
        foreach ($fields as $field)
        {
           if ($field=='country')
             $value.=" ".format_country($this->get($field));
           else
            $value.=" ".$this->get($field);
        }   
        return $value;
    }
  
    function hasCoordinates()
    {               
      return   ($this->get('lat')!=0 && $this->get('lng')!=0);
    }
    
    function calculateCoordinates()
    {
        $googlemap_api=new GoogleMapApi();        
       // var_dump($this->getFullAddress());
        if (!$coordinates=$googlemap_api->getCoordinatesFromAddress($this->getFullAddress()))
            return false;         
        $this->set('lat',$coordinates->getLatitude());
        $this->set('lng',$coordinates->getLongitude());
        return true;
    }      
    
    function calculateAddressFromCoordinates()
    {
         $googlemap_api=new GoogleMapApi();   
         if (!$address=$googlemap_api->getAddressFromCoordinates($this->get('lat'), $this->get('lng'), $this))
            return false; 
         $this->setSignature();
         return true;
    }    
    
     
    protected function getAddressEscape()
    {
        return strtoupper(str_replace(array(","),"", $this->getFullAddress()));
    }
    
    function getSignature()
    {
        return sha1($this->getAddressEscape().$this->country.$this->state);
    }
    
    function setSignature()
    {
        $this->set('signature',$this->getSignature());
        return $this;
    }       
    
    function getBySignature($values=array())
    {
        $this->add($values);        
        $this->loadBySignature($this->getSignature());
        return $this;
    }
    
    function getBySignatureOrCoordinates()
    {            
        $this->setSignature();
        $this->loadBySignatureAndCoordinates();
        return $this;
    }
    
    function getCoordinates($separator=',')
    {
        return $this->get('lat').$separator.$this->get('lng');
    }
    
    function getFormattedCoordinates()
    {
       return $this->getGPSCoordinates()->getFormattedCoordinates();    
    }
    
    function getCoordinatesToJson()
    {
        return $this->getGPSCoordinates()->toJson();
    }
    
    function toJson()
    {
        return json_encode($this->toArray(array('address1','address2','city','postcode','lat','lng')));
    }
    
    function getGPSCoordinates()
    {
        return new GPSCoordinate($this->get('lat'),$this->get('lng'));
    }
    
}


