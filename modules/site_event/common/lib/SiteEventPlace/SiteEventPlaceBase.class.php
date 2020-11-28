<?php


class SiteEventPlaceBase extends mfObject3 {
     
    protected static $fields=array('name','picture','event_user_id','email','phone','mobile','fax','web','address1','address2','postcode','city','city_id','country','is_active','status','created_at','updated_at');
    const table="t_site_event_place";
    protected static $foreignKeys=array('event_user_id'=>'SiteEventUser'); // By default
    protected static $fieldsNull=array('updated_at','event_user_id',); 
    
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
         
   
    function getValuesForUpdate()
    {
      $this->set('updated_at',date("Y-m-d H:i:s"));   
    }   
    
    
     protected function getDefaults()
    {
          $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
            "is_active"=>'NO'
        ));       
    }        
       
    protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' AND name!='' ".$key_condition)
         ->makeSqlQuery();       
    }
    

  
    function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new SiteEventPlaceFormatter($this):$this->formatter;
   }
   
   static function getActivePlacesForSelect()
   {
      $values=new mfArray();        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array())
                ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().
                           " WHERE is_active='YES' AND event_user_id IS NULL ORDER BY name ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($item=$db->fetchObject(__CLASS__))
        { 
            $values[$item->get('id')]=(string)$item->getFormatter()->getName()->ucfirst();
        }              
        return $values; 
   }
   
   function isActive()
   {
       return $this->get('is_active')=='YES';
   }
   
     function getEventUser()
    {
        return $this->_event_user_id=$this->_event_user_id===null?new SiteEventUSer($this->get('event_user_id')):$this->_event_user_id;
    }
    
}
