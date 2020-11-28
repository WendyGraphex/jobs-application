<?php

 
class SitePictureI18nBase extends mfObject3 {
    
    const table="t_site_picture_i18n";     
    protected static $fields=array('picture_id','lang','picture','title','extension','filesize',
                                   'link','target','content',
                                   'description','updated_at','created_at');  
    protected static $foreignKeys=array('picture_id'=>'SitePicture'); 
    
   
  function __construct($parameters=null) {
      parent::__construct();    
    $this->getDefaults();  
    if ($parameters===null) return $this;  
      if (is_array($parameters)||$parameters instanceof ArrayAccess)
      {          
           if (isset($parameters['lang']) && isset($parameters['picture_id']))
               return $this->loadByPictureAndLang((string)$parameters['picture_id'],(string)$parameters['lang']);
           if (isset($parameters['id']))
               return $this->loadById((string)$parameters['id']);    
           // For import
           if (isset($parameters['lang']) && isset($parameters['name']) && isset($parameters['title']))
               return $this->loadByLangAndNameAndTitle((string)$parameters['lang'],(string)$parameters['name'],(string)$parameters['title']);
           return $this->add($parameters); 
      }   
      else
      {      
         if (is_numeric((string)$parameters)) 
             $this->loadbyId((string)$parameters);
      }   
    }
    
    protected function loadByLangAndNameAndTitle($lang,$name,$title)
    {
        $this->set('lang',$lang);
        $this->set('name',$name);
        $this->set('title',$title);
        $db=mfSiteDatabase::getInstance()
          ->setParameters(array('name'=>$name,'title'=>$title,'lang'=>$lang))
          ->setObjects(array('SitePictureI18n','SitePicture'))
          ->setQuery("SELECT {fields} FROM ".self::getTable().
                     " LEFT JOIN ".self::getOuterForJoin('picture_id').
                     " WHERE name='{name}' AND lang='{lang}' AND title='{title}';")
          ->makeSqlQuery();      
         if (!$db->getNumRows())
         {
            $this->getSitePicture()->set('name',$name);
            return ;
         }   
         $item=$db->fetchObjects();    
         $this->toObject($item->getSitePictureI18n());
         $this->set('picture_id',$item->getSitePicture());        
    }   
    
     protected function loadByPictureAndLang($picture_id,$lang)
    {
        $this->set('lang',$lang);
        $this->set('picture_id',$picture_id);
        $db=mfSiteDatabase::getInstance()         
          ->setParameters(array('picture_id'=>$picture_id,'lang'=>$lang))
          ->setQuery("SELECT * FROM ".self::getTable()." WHERE picture_id='{picture_id}' AND lang='{lang}';")
          ->makeSqlQuery();          
        return $this->rowtoObject($db);
    }   
    
    protected function getDefaults()
    {	
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s")
        ));	
    }
  
    
    function getValuesForUpdate()
    {
        $this->set('updated_at',date("Y-m-d H:i:s")); 
    }   
    
    function hasLink()
    {
        return (boolean)$this->get('link');
    }
   
   /* protected function executeIsExistQuery($db)    
    {      
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('lang'=>$this->lang,'title'=>$this->title,$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE ((lang='{lang}' AND url='{url}') OR (lang='{lang}' AND name='{name}' AND url='{url}'))".$key_condition)
         ->makeSqlQuery(); 
    }*/
          
    public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/view/".$this->getPath();
    }
    
    function getPath()
    {
        return "data/pictures/".$this->get('picture_id')."/".$this->get('lang');
    }
      
  /*  function getPictureManager()
    {
       return $this->_picture=$this->_picture===null?new SitePictureI18nManager($this):$this->_picture;
    }*/
       
    function getPicture()
     {
        return $this->_picture_id=$this->_picture_id===null?new SitePicture($this->get('picture_id')):$this->_picture_id;
     }
    
  /*  function setPicture(mfValidatedFile $file)
    {     
        if ($file===null)
            return $this;       
        $this->__picture=$file;       
        $this->set('picture',$file->getOriginalName());
        $this->set('filesize',$file->getFilesize());
        $this->set('extension',$file->getExtension());
        return $this;
    }   */   
     
    function save()
    {
      /*  if ($this->hasPropertyChanged('picture') && $this->isLoaded() && $this->__picture)
        {                
             $this->getPictureManager()->removeAll();  
        }*/
        parent::save();
      /*  if ($this->__picture)
        {                    
           $this->_picture=null;
           $this->__picture->save($this->getDirectory(),$this->get('picture'));  
           $this->getPictureManager()->generate();
           $this->__picture=null; 
        }         */
        return $this;
    }
    
    
   /* function delete()
    {
        $this->getPictureManager()->removeAll();
        return parent::delete();
    }
    
      
    function create()
    {
        $item= new SitePicture();
        $item->save();
        $this->set('picture_id',$item);
        parent::save();
        if ($this->__picture)
        {                    
           $this->_picture=null;
           $this->__picture->save($this->getDirectory(),$this->get('picture'));  
           $this->getPictureManager()->generate();
           $this->__picture=null; 
        }   
        return $this;
    }*/
}



