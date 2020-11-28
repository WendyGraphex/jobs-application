<?php


class SiteEventBase extends mfObject3 {
     
    protected static $fields=array('name','reference','city','place_id','country','number_of_people','number_of_documents','price','is_active','status',
                                   'published_at','committed_at','refused_at','event_user_id','state',
                                   'quantity','available_quantity',
                                   'in_at','out_at','duration','picture','created_at','updated_at');
    const table="t_site_event";
        protected static $fieldsNull=array('updated_at','in_at','out_at','published_at','committed_at','refused_at','event_user_id',); 
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
            'is_active'=>'NO',
            'state'=>'DRAFT'
        ));       
    }        
       
    protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('name'=>$this->get('name'),$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' AND name!='' ".$key_condition)
         ->makeSqlQuery();       
    }
    
    
    
           
    function hasI18n()
    {
         return (boolean)$this->i18n;
    }
    
     public function getI18n($lang=null)
     {       
         if ($this->i18n===null)
         {
             if ($lang==null)
                 $lang=  mfcontext::getInstance()->getUser()->getLanguage();
             $this->i18n=new SiteEventI18n(array('lang'=>$lang,"event_id"=>$this->get('id')));
         }   
         return $this->i18n;
     } 
     
     public function setI18n($i18n)
     {
         $this->i18n=$i18n;
         return $this;
     } 
     
    
      
     static function getAllI18nForSelect()
    {
        $values=new mfArray();        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>mfcontext::getInstance()->getUser()->getLanguage()))
                ->setQuery("SELECT ".SiteEventI18n::getFieldsAndKeyWithTable()." FROM ".SiteEventI18n::getTable().
                           " WHERE lang='{lang}' ORDER BY title ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($item=$db->fetchObject('SiteEventI18n'))
        { 
            $values[$item->get('event_id')]=new mfString($item->get('title'));
        }              
        return $values;
    }
    
    static function getAllForSelect()
    {
        $values=new mfArray();        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>mfcontext::getInstance()->getUser()->getLanguage()))
                ->setObjects(array('SiteEventI18n','SiteEvent'))
                ->setQuery("SELECT {fields} FROM ".SiteEvent::getTable().
                           " INNER JOIN ".SiteEventI18n::getInnerForJoin('event_id').
                           " WHERE lang='{lang}' ORDER BY title ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($items=$db->fetchObjects())
        {             
            $values[$items->getSiteEvent()->get('id')]=$items->getSiteEvent()->setI18n($items->getSiteEventI18n());
        }              
        return $values;
    }
    
    static function getContractFunctionsForSelect()
    {
        $values=new mfArray();        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>mfcontext::getInstance()->getUser()->getLanguage()))               
                ->setQuery("SELECT * FROM ".SiteEventI18n::getTable().                           
                           " WHERE lang='{lang}' ORDER BY title ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($item=$db->fetchObject('SiteEventI18n'))
        {             
            $values[$item->get('event_id')]=ucfirst($item->get('title'));
        }              
        return $values;
    } 
    
      static function  getAllOrdered($lang=null)
    {          
         $list=new mfArray();
        $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('lang'=>$lang?$lang:mfcontext::getInstance()->getUser()->getLanguage()))  
                ->setObjects(array('SiteEvent','SiteEventI18n'))
                ->setQuery("SELECT {fields} FROM ".self::getTable(). 
                           " INNER JOIN ".SiteEventI18n::getInnerForJoin('event_id')." AND lang='{lang}'".
                           " ORDER BY position ASC".
                           ";")               
                ->makeSqlQuery(); 
       // var_dump($db->getQuery());
        if (!$db->getNumRows())
            return $list;             
        while ($items=$db->fetchObjects())
        {                  
           $item=$items->getSiteEvent();
           $item->setI18n($items->getSiteEventI18n());
           $list[$item->get('id')]=$item;
        }                
        return $list;      
    }
       
    
    public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/view/data/events/";
    }
    
    
    static function getName($name)
    {
       return str_replace(" ","-",mfTools::I18N_noaccent($name));
    }  
    
     public function getPictureDirectory()
    {
        return $this->getDirectory()."/pictures/".$this->get('id');
    }
    
    function isActive()
    {
        return $this->get('is_active')=='YES';
    }
       
     function hasPicture()
    {    
        return (boolean)$this->get('picture');   
    }
    
     function getPicture()
    {    
        return $this->_picture=$this->_picture===null?new SiteEventPictureFrame($this):$this->_picture;   
    }
    
    function save()
    {      
       if ($this->get('status')=='UPLOAD') 
           $this->set('status','ACTIVE');
       if ($this->hasPropertyChanged('picture') && $this->isLoaded() && $this->__picture)
        {                
            $this->getPicture()->removeAll();
        }
          if ($this->hasPropertyChanged('icon') && $this->isLoaded() && $this->__icon)
        {                
            $this->getIcon()->removeAll();
        }
        parent::save();
        if ($this->__picture)
        {                    
           $this->_picture=null;
           $this->__picture->save($this->getPicture()->getPath(),$this->get('picture'));  
           $this->getPicture()->generate();
           $this->__picture=null; 
        }        
        if ($this->__icon)
        {                    
           $this->_icon=null;
           $this->__icon->save($this->getIcon()->getPath(),$this->get('icon'));  
           $this->getIcon()->generate();
           $this->__icon=null; 
        }
         if ($this->speakers instanceof SiteEventSpeakerUserCollection)
        {
            $this->updateSpeakers();
        }  
    }
    
    
    function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new SiteEventFormatter($this):$this->formatter;
   }
   
   function getCity()
   {
       return $this->_place_id=$this->_place_id===null?new SiteEventCity($this->get('place_id')):$this->_place_id;
   }
   
   function hasPlace()
   {
       return (boolean)$this->get('place_id'); 
   }
   
   function getPlace()
   {
       return $this->_place_id=$this->_place_id===null?new SiteEventPlace($this->get('place_id')):$this->_place_id; 
   }
   
    function getSettings()
    {
        return $this->settings=$this->settings===null?new SiteEventSettings():$this->settings;
    }
    
    function setReference()
    {        
        $format_reference=$this->getSettings()->get('site_event_reference_format','A{year}{month}{day}{id}');
        $parameters=array('{year}'=>date("Y"),
                          '{month}'=>date("m"),
                          '{day}'=>date("d"),
                          '{id}'=>format_number($this->get('id'),$this->getSettings()->get('site_event_id_format','00000')));
        $this->set('reference',strtr($format_reference,$parameters));
        return $this;
    }   
   
   function create()
    {
       $this->set('status','ACTIVE');
       $this->save();
       $this->setReference()->save();       
       return $this;
    }
    
    
    
     function setPicture(mfValidatedFile $file)
    {     
        if ($file===null)
            return  $this;       
        $this->__picture=$file;       
        $this->set('picture',$file->getOriginalName());
        return $this;
    } 
    
    function upload()
    {
        if ($this->isNotLoaded())
            $this->set('state','UPLOAD')->save();                                        
        return $this;
    }
    
    function isUpload()
    {
        return $this->get('state') =='UPLOAD';
    }
    
    function getStatusI18n()
    {
        return __($this->get('status'));
    }
    
    
    function hasInAt()
    {
        return (boolean)$this->get('in_at');
    }
    
      function hasOutAt()
    {
        return (boolean)$this->get('out_at');
    }
    
    
    function getEventSpeakerUsers()
    {
        if ($this->event_speakers===null)
        {
            $this->event_speakers=new SiteEventSpeakerUsersCollection();
            $db=mfSiteDatabase::getInstance()
                ->setParameters(array('event_id'=>$this->get('id'))) 
                ->setObjects(array('SiteEventSpeakerUsers','SiteEventSpeakerUser'))
                ->setQuery("SELECT {fields} FROM ".SiteEventSpeakerUsers::getTable(). 
                           " INNER JOIN ".SiteEventSpeakerUsers::getOuterForJoin('speaker_user_id').                        
                           " WHERE ".SiteEventSpeakerUsers::getTableField('event_id')."='{event_id}'".
                           ";")               
                ->makeSqlQuery(); 
            if (!$db->getNumRows())
               return $this->event_speakers;
            while ($items=$db->fetchObjects())
            {                            
                $item=$items->getSiteEventSpeakerUsers();
                $item->set('speaker_user_id',$items->getSiteEventSpeakerUser());               
                $this->event_speakers[$item->get('id')]=$item;
            } 
            $this->event_speakers->loaded();
        }   
        return $this->event_speakers;
    }    
    
    function getSpeakers()
    {
        if ($this->speakers===null)
        {
           $this->speakers=new SiteEventSpeakerUserCollection();
        }   
        return $this->speakers;
    }
    
     function updateSpeakers()
    {                  
        $db=mfSiteDatabase::getInstance();
        if ($this->getSpeakers()->isEmpty())
        {
            $db->setParameters(array('event_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".SiteEventSpeakerUsers::getTable().                            
                           " WHERE ".SiteEventSpeakerUsers::getTableField('event_id')."='{event_id}'".                          
                           ";")               
                ->makeSqlQuery(); 
            return $this;
        }             
        $db->setParameters(array('event_id'=>$this->get('id')))              
                ->setQuery("DELETE FROM ".SiteEventSpeakerUsers::getTable().                            
                           " WHERE ".SiteEventSpeakerUsers::getTableField('event_id')."='{event_id}' AND speaker_user_id NOT IN('".$this->getSpeakers()->getKeys()->implode("','")."')".
                           ";")               
                ->makeSqlQuery(); 
        $db->setParameters(array('event_id'=>$this->get('id')))              
                ->setQuery("SELECT speaker_user_id FROM ".SiteEventSpeakerUsers::getTable().                            
                           " WHERE ".SiteEventSpeakerUsers::getTableField('event_id')."='{event_id}'".                          
                           ";")               
                ->makeSqlQuery(); 
         if ($db->getNumRows())
         {
             while ($row=$db->fetchRow())
            {        
                $this->getSpeakers()->removeItemFromIndex($row[0]);                  
            }   
         }                     
         $this->event_speakers = new SiteEventSpeakerUsersCollection();
         foreach ($this->getSpeakers() as $speaker_user)
         {    
             $item= new SiteEventSpeakerUsers();
             $item->add(array('speaker_user_id'=>$speaker_user,'event_id'=>$this));
             $this->getEventSpeakerUsers()->push($item);
         }
         $this->event_speakers->save(); 
         return $this;
    }
    
     function hasDocuments()
    {
        return !$this->getDocuments()->isEmpty();
    }
    
    function getDocuments()
    {
        if ($this->documents === null)
        {               
            $this->documents = new SiteEventDocumentCollection();            
            $db=mfSiteDatabase::getInstance()               
                ->setParameters(array('event_id'=>$this->get('id')))                
                ->setQuery("SELECT * FROM ".SiteEventDocument::getTable().                                                    
                           " WHERE ".SiteEventDocument::getTableField('event_id')."='{event_id}' ".                                                      
                           ";")               
                ->makeSqlQuery(); 
            // var_dump($db->getQuery());
             if (!$db->getNumRows())
                 return $this->documents;             
             while ($item=$db->fetchObject('SiteEventDocument'))
             {                            
                $this->documents[]=$item->loaded();
             }   
             $this->documents->loaded();
        }
        return $this->documents;         
    }
          
      
    function isFirstUpload()
    {
        return $this->get('state')=='UPLOAD' && $this->get('number_of_documents') == 1;
    }
    
      function getNumberOfDocuments()
    {
        return intval($this->get('number_of_documents'));
    }
    
    function hasPublishedAt()
    {
        return (boolean)$this->get('published_at');
    }
    
     function hasRefusedAt()
    {
        return (boolean)$this->get('refused_at');
    }
    
     function hasCommittedAt()
    {
        return (boolean)$this->get('committed_at');
    }
    
    function hasEventUser()
    {
        return (boolean)$this->get('event_user_id');
    }
    
    function getEventUser()
    {
        return $this->_event_user_id=$this->_event_user_id===null?new SiteEventUSer($this->get('event_user_id')):$this->_event_user_id;
    }
    
      function commit()
    {
        if ($this->isNotLoaded())
            return $this;
        $this->add(array('committed_at'=>date("Y-m-d H:i:s"),
                         'state'=>'COMMITTED',
                    ))->save();
        return $this;
    }
    
    
     function refuse()
    {
         $this->add(array('refused_at'=>date("Y-m-d H:i:s"),'published_at'=>null))->save();
        return $this;
    }
    
      function publish()
    {     
        $this->add(array('refused_at'=>null,'published_at'=>date("Y-m-d H:i:s")))->save();       
        return $this;
    }
    
    
    function getInAt()
    {
        return new Day($this->get('in_at'));
    }
    
    function getOutAt()
    {
        return new Day($this->get('out_at'));
    }
    
    function getNumberOfDays()
    {
        if ($this->number_of_days===null)
        {
             $this->number_of_days=$this->getInAt()->diffInDay($this->getOutAt());      
        }   
        return $this->number_of_days;
    }
    
    function isAvailable()
    {
        return $this->get('available_quantity') > 0;
    }
    
    function hasBirthday()
    {    
        return (boolean)$this->get('birthday');   
    }
  
}
