<?php

class SiteEventDocumentBase extends mfObject3 {
     
    protected static $fields=array('lang','file','extension','position','is_public','event_id','filesize','created_at','updated_at');    
    const table="t_site_event_document"; 
    protected static $foreignKeys=array('event_id'=>'SiteEvent'); // By default
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
           if ($parameters instanceof SiteEvent)                
              return  $this->set('event_id',$parameters);        
           if (is_numeric((string)$parameters)) 
              return $this->loadbyId((string)$parameters);         
        } 
    }   
     
     
       protected function getDefaults()
    {
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"), 
            'is_public'=>'Y',
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
       return $this->_event_id=$this->_event_id===null?new SiteEvent($this->get('event_id')):$this->_event_id;                 
    } 
        
    
    function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new SiteEventDocumentFormatter($this):$this->formatter;       
    }
    
      public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/data/".$this->getPath();
    }
    
    function getPath()
    {
        return "/events/".$this->get('event_id')."/documents/".$this->get('id');
    }
    
     function hasFile()
    {    
        return (boolean)$this->get('file');   
    }
    
     function getFile()
    {    
        return $this->_file=$this->_filee===null?new SiteEventDocumentFileManager($this):$this->_file;   
    }
    
   /* function getName($name)
    {
       return (string)mfString::getInstance($name)->I18N_noaccent()->replace(' ','-');
    }*/
    
     function setFile(mfValidatedFile $file)
    {     
        if ($file===null)
            return  $this;       
        $this->__file=$file;       
        $this->set('file',$file->getOriginalName());
        $this->set('filesize',$file->getFilesize());
        $this->set('extension',$file->getExtension());
        return $this;
    }      
     
    function save()
    {
         if ($this->hasPropertyChanged('file') && $this->isLoaded() && $this->__file)
        {                
             $this->getFile()->removeAll(); //????? if picture
        }
        parent::save();
        if ($this->__file)
        {                    
           $this->_file=null;
           $this->__file->save($this->getFile()->getPath(),$this->get('file'));  
           $this->getFile()->generate();
           $this->__file=null; 
        }         
        return $this;
    }
    
    
    function delete()
    {
        $this->getFile()->removeAll();
        $this->getEvent()->set('number_of_documents',$this->getEvent()->get('number_of_documents') - 1)->save();
        return parent::delete();
    }
    
    
    function create(mfValidatedFile $file)
    {
        $this->setFile($file);
        $this->save();    
        $this->getEvent()->set('number_of_documents',$this->getEvent()->get('number_of_documents') + 1)->save();
        return $this;
    }
    
    function getDocuments()
    {
        if ($this->documents === null)
        {    
            $this->documents= new SiteEventDocumentCollection();
        }
        return $this->documents;
    }
    
    function isOpened()
    {
        return $this->get('is_public')=='Y';
    }
    
     function isPrivated()
    {
        return !$this->isPublic();
    }
    
    function privated()
    {
        return $this->set('is_public','N')->save();
    }
    
    function opened()
    {
         return $this->set('is_public','Y')->save();
    }
}