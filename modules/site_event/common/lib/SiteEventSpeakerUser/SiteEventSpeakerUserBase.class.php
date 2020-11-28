<?php

class SiteEventSpeakerUserBase extends mfObject3 {
     
    protected static $fields=array('gender','firstname','lastname','email','phone','mobile','address1','address2','postcode',
                                   'city','country','state','is_active','avatar','event_user_id',
                                   'created_at','updated_at');
    const table="t_site_event_speaker_user";
        protected static $fieldsNull=array('updated_at','event_user_id'); 
          protected static $foreignKeys=array('event_user_id'=>'SiteEventUser'); // By default
    
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
            'is_active'=>'NO'
        ));       
    }        
       
    protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('email'=>$this->get('email'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE email='{email}' ".$key_condition)
         ->makeSqlQuery();       
    }
    

  
    function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new SiteEventSpeakerUserFormatter($this):$this->formatter;
   }
   
    function hasAvatar()
    {    
        return (boolean)$this->get('avatar');   
    }
    
      function getAvatar()
    {    
        return $this->_avatar=$this->_avatar===null?new EmployerAvatarFrame($this):$this->_avatar;   
    }
        
     function setAvatarFile(mfValidatedFile $file)
    {     
        if ($file===null)
            return  $this;       
        $this->__avatar=$file;            
        $this->set('avatar','avatar.'.$file->getExtension());
        return $this;
    }      
    
   
    function save()
    {
         $this->encryptPassword();
         $this->generateUrl();
         if ($this->isLoaded() && $this->__avatar)
        {                
            $this->getAvatar()->removeAll();
        }
        parent::save();
        if ($this->__avatar)
        {                    
           $this->_avatar=null;         
           $this->__avatar->save($this->getAvatar()->getPath(),$this->get('avatar'));            
           $this->getAvatar()->generate();
           $this->__avatar=null; 
        }         
        return $this;
    }
    
    function delete() {
        $this->getAvatar()->delete();
        parent::delete();
        if ($this->hasCompany())
            $this->getCompany()->decUser();
    }
    
    
    function isActive()
    {
        return $this->get('is_active')=='YES';
    }
    
     static function getSpeakerUsersFromSelection(mfArray $selection)
    {      
        $list=new SiteEventSpeakerUserCollection();
        if ($selection->isEmpty())
            return $list;       
        $db=mfSiteDatabase::getInstance()               
                ->setParameters(array())  
                ->setObjects(array('SiteEventSpeakerUser'))
                ->setQuery("SELECT {fields} FROM ".self::getTable().                                                                          
                           " WHERE ".self::getTableField('id')." IN('".$selection->implode("','")."')".                        
                           ";")               
                ->makeSqlQuery(); 
       // var_dump($db->getQuery());
        if (!$db->getNumRows())
            return $list;             
        while ($items=$db->fetchObjects())
        {                  
           $item=$items->getSiteEventSpeakerUser();                              
           $list[$item->get('id')]=$item;
        }                
        return $list;      
    }
    
      function getEventUser()
    {
        return $this->_event_user_id=$this->_event_user_id===null?new SiteEventUSer($this->get('event_user_id')):$this->_event_user_id;
    }
    
}
