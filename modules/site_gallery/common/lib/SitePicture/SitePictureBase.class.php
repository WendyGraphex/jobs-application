<?php

 
class SitePictureBase extends mfObject3 {
    
    const table="t_site_picture";     
    protected static $fields=array('name','height','width','picture','extension','filesize','is_active','start_at','expired_at');  
    protected static $fieldsNull=array('start_at','expired_at',); 
    
   
  function __construct($parameters=null) {
      parent::__construct();    
    $this->getDefaults();  
    if ($parameters===null) return $this;  
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {
           if (isset($parameters['id']))
               return $this->loadById((string)$parameters['id']);
            if (isset($parameters['name']))
               return $this->loadByName((string)$parameters['name']);  
           return $this->add($parameters); 
      }   
      else
      {
         if ($parameters instanceof mfValidatedFile)
             return $this->setPicture($parameters);   
         if (is_numeric((string)$parameters)) 
             $this->loadbyId((string)$parameters);
      }   
    }
    
    protected function loadByName($name)
    {
         $db=mfSiteDatabase::getInstance()
                 ->setParameters(array('name'=>$name))
                 ->setQuery("SELECT * FROM ".self::getTable().
                    " WHERE name='{name}'")
         ->makeSqlQuery();  
         return $this->rowtoObject($db);
    }         
    
    protected function getDefaults()
    {	
	$this->is_active=isset($this->is_active)?$this->is_active:"YES";	
        $this->height=isset($this->height)?$this->height:0;	
        $this->width=isset($this->width)?$this->width:0;	
    }
    
   
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s")); 
    }   
        
    protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('lang'=>$this->lang,'url'=>$this->url,'name'=>$this->name,$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE ((lang='{lang}' AND url='{url}') OR (lang='{lang}' AND name='{name}' AND url='{url}'))".$key_condition)
         ->makeSqlQuery(); 
    }
                                  
    function setI18n($i18n)
    {
        $this->i18n=$i18n;
        return $this;
    }
    
    function hasI18n()
    {
        return (boolean)$this->i18n;
    }
    
    function getI18n($lang=null)
    {
        if ($this->i18n===null)
        {
             $this->i18n=new SitePictureI18n(array('picture_id'=>$this->get('id'),'lang'=>$lang?lang:mfContext::getInstance()->getUser()->getLanguage()));
        }   
        return $this->i18n;
    }
     function isActive()
    {
        return $this->get('is_active')=='YES';
    }
    
    
     public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/view/".$this->getPath();
    }
    
    function getPath()
    {
        return "data/pictures/".$this->get('id');
    }
      
    function getPictureManager()
    {
       return $this->_picture=$this->_picture===null?new SitePictureManager($this):$this->_picture;
    }
    
     function setPicture(mfValidatedFile $file)
    {     
        if ($file===null)
            return $this;       
        $this->__picture=$file;       
        $this->set('picture',$file->getOriginalName());
        $this->set('filesize',$file->getFilesize());
        $this->set('extension',$file->getExtension());
        return $this;
    }      
     
    function save()
    {
        if ($this->hasPropertyChanged('picture') && $this->isLoaded() && $this->__picture)
        {                
             $this->getPictureManager()->removeAll();  
        }
        parent::save();
        if ($this->__picture)
        {                    
           $this->_picture=null;
           $this->__picture->save($this->getDirectory(),$this->get('picture'));  
           $this->getPictureManager()->generate();
           $this->__picture=null; 
        }         
        return $this;
    }
    
    
    function delete()
    {
        $this->getPictureManager()->removeAll();
        return parent::delete();
    }
    
      
    function create(Language $lang)
    {
        parent::save();
        if ($this->__picture)
        {  
           $this->i18n= new SitePictureI18n();
           $this->i18n->add(array('title'=>$this->__picture->getOriginalFilename(),
                                  'lang'=>(string)$lang,
                                  'picture_id'=>$this));
           $this->i18n->save();
                      
           $this->_picture=null;
           $this->__picture->save($this->getDirectory(),$this->get('picture'));  
           $this->getPictureManager()->generate();
           $this->__picture=null; 
                    
        }   
        return $this;
    }
    
    
    static function getPicturesFromSelection(mfArray $selection)
    {
        $list= new SitePictureCollection();
        if ($selection->isEmpty())
            return $list;
         $db=mfSiteDatabase::getInstance()
               ->setParameters(array())             
               ->setQuery("SELECT * FROM ".SitePicture::getTable().                                                         
                          " WHERE ".SitePicture::getTableField('id')." IN('".$selection->implode("','")."')".        
                           ";")
               ->makeSiteSqlQuery(); 
        if (!$db->getNumRows())
               return $list;    
          while ($item=$db->fetchObject('SitePicture'))
          {            
              $list[]=$item->loaded();
          }  
        return $list;   
    }
}



