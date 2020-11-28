<?php

class SiteShopBase extends mfObject3 {
     
    protected static $fields=array( 'icon','logo','favicon','created_at','updated_at');
    const table="t_site_shop"; 
    
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
         $this->loadShop(); 
      }   
    }
    
    protected function loadShop()
    {
        $db=mfSiteDatabase::getInstance()
         ->setParameters(array())
         ->setQuery("SELECT * FROM ".self::getTable()." LIMIT 0,1;")
         ->makeSqlQuery();       
      return $this->rowtoObject($db);
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
        ));
         parent::getDefaults();
    }        
       
  /*   protected function executeIsExistQuery($db)    
    {      
      $key_condition=$this->getKey()?" WHERE ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array($this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." ".$key_condition)
         ->makeSqlQuery();       
    } */
    
    
      
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
             $this->i18n=new SiteShopI18n(array('lang'=>$lang,"shop_id"=>$this->get('id')));
         }   
         return $this->i18n;
     } 
     
     public function setI18n($i18n)
     {
         $this->i18n=$i18n;
         return $this;
     } 
                
    
    public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/view/data/shops/".$this->get('id');
    }
    
    function hasIcon()
    {
        return (boolean)$this->get('icon');
    }
    
    function getIcon()
    {    
        return $this->_icon=$this->_icon===null?new PictureObject2(array(
                 "path"=>$this->getDirectory(),
                 "picture"=>$this->get('icon'),
                 "urlPath"=>url("/data/shops/".$this->get('id'),"web","frontend"),
                 "url"=>url("/data/shops/".$this->get('id')."/".$this->get('icon'),"web","frontend"),
                 "urlAdmin"=>url("/nocache/data/shops/".$this->get('id')."/".$this->get('icon'),"web","frontend")
              )):$this->_icon;   
    }               
    
    function setIcon(mfValidatedFile $file)
    {     
        if ($file===null)
            return  $this;       
        $this->__icon=$file;
         $this->set('icon','icon.'.$file->getExtension());
        return $this;
    }     
    
     function hasLogo()
    {
        return (boolean)$this->get('logo');
    }
    
    function getLogo()
    {    
        return $this->_logo=$this->_logo===null?new PictureObject2(array(
                 "path"=>$this->getDirectory(),
                 "picture"=>$this->get('logo'),
                 "urlPath"=>url("/data/shops/".$this->get('id'),"web","frontend"),
                 "url"=>url("/data/shops/".$this->get('id')."/".$this->get('logo'),"web","frontend"),
                 "urlAdmin"=>url("/nocache/data/shops/".$this->get('id')."/".$this->get('logo'),"web","frontend")
              )):$this->_logo;   
    }               
    
    function setLogo(mfValidatedFile $file)
    {     
        if ($file===null)
            return  $this;       
        $this->__logo=$file;
         $this->set('logo','logo.'.$file->getExtension());
        return $this;
    }   
    
    
     function hasFavicon()
    {
        return (boolean)$this->get('favicon');
    }
    
    function getFavicon()
    {    
        return $this->_favicon=$this->_favicon===null?new PictureObject2(array(
                 "path"=>$this->getDirectory(),
                 "picture"=>$this->get('favicon'),
                 "urlPath"=>url("/data/shops/".$this->get('id'),"web","frontend"),
                 "url"=>url("/data/shops/".$this->get('id')."/".$this->get('favicon'),"web","frontend"),
                 "urlAdmin"=>url("/nocache/data/shops/".$this->get('id')."/".$this->get('favicon'),"web","frontend")
              )):$this->_favicon;   
    }               
    
    function setFavicon(mfValidatedFile $file)
    {     
        if ($file===null)
            return  $this;       
        $this->__favicon=$file;
         $this->set('favicon','favicon.'.$file->getExtension());
        return $this;
    }   
        
    function save()
    {      
        if ($this->isLoaded() && $this->__icon)        
            $this->getIcon()->remove();                   
        if ($this->isLoaded() && $this->__logo)        
            $this->getLogo()->remove(); 
        if ($this->isLoaded() && $this->__favicon)        
            $this->getFavicon()->remove(); 
        parent::save();
        if ($this->__icon)
        {                              
           $this->__icon->save($this->getIcon()->getPath(),$this->get('icon'));    
           $this->__icon=$this->_icon=null; 
        }
        if ($this->__logo)
        {                                  
           $this->__logo->save($this->getLogo()->getPath(),$this->get('logo'));    
           $this->__logo=$this->_logo=null; 
        }
        if ($this->__favicon)
        {                                 
           $this->__favicon->save($this->getFavicon()->getPath(),$this->get('favicon'));    
           $this->__favicon=$this->_favicon=null; 
        }        
        return $this;
    }  
    
    
    static function getShop()
    {
        $db=mfSiteDatabase::getInstance()
         ->setParameters(array())
         ->setQuery("SELECT * FROM ".self::getTable()." LIMIT 0,1;")
         ->makeSqlQuery(); 
        if (!$db->getNumRows())
          return new SiteShop();
      return $db->fetchObject('SiteShop')->loaded();
    }
    
    static function hasShop()
    {
        $db=mfSiteDatabase::getInstance()
         ->setParameters(array())
         ->setQuery("SELECT * FROM ".self::getTable()." LIMIT 0,1;")
         ->makeSqlQuery(); 
       return (boolean)$db->getNumRows();
    }
     function getFormatter()
   {
       return $this->formatter=$this->formatter===null?new SiteShopFormatter($this):$this->formatter;
   }
}
