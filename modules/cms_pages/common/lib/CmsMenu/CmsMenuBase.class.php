<?php

class CmsMenuBase extends CmsMenuCore {
    
                          
    function getDefaults() {        
        $this->setIfNotNull(array(
            'is_active'=>'NO',
                   'is_link'=>"YES", 
        ));
        parent::getDefaults();
    }
       
     protected function executeIsExistQuery($db)
    {                  
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('name'=>$this->name,$this->getKey()))
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
             $this->i18n=new CmsMenuI18n(array('lang'=>$lang,"menu_id"=>$this->get('id')));
         }   
         return $this->i18n;
     } 
     
     public function setI18n($i18n)
     {
         $this->i18n=$i18n;
         return $this;
     } 	
     
   
    public function removeDirectory()
    {
        $dir=$this->getDirectory();
        if ($dir)
           mfFileSystem::net_rmdir($dir);
    }
    
   
     function getURL()
    {
        if ($this->url===null)
           return "#";
        if (strpos($this->url,"http")===0)
           return $this->url;
        if (strpos($this->url,"/")===0)
           return url($this->url,"url","frontend","",$this->lang);
        //return url("/cms/".$this->url.".html","url",'frontend',"",$this->lang);
        return url("/cms/".$this->url,"url",'frontend',"",$this->lang);
    }

     // directory data
    public function getDirectory()
    {
        return mfConfig::get('mf_sites_dir')."/".$this->getSiteName()."/frontend/view/menu/pictures/".$this->get('id')."/";
    }
    
    public function getPicture()
    {
      if (!$this->get('_picture'))      
         $this->_picture=new PictureObject(array(
                 "path"=>$this->getDirectory(),
                 "picture"=>$this->get('picture'),
                 "url"=>"/menu/".$this->get('menu_id')."/".$this->get('lang')."/",
                 "parameters"=>array("urlType"=>"picture")
             ),'frontend',$this->getSite());
      return $this->_picture;     
    }
    
    public function getIcon()
    {
      if (!$this->get('_icon'))      
         $this->_icon=new PictureObject(array(
                 "path"=>$this->getDirectory(),
                 "picture"=>$this->get('icon'),
                 "url"=>"/menu/".$this->get('menu_id')."/".$this->get('lang')."/",
                 "parameters"=>array("urlType"=>"picture")
             ),'frontend',$this->getSite());
      return $this->_icon;     
    }
    
    
    function hasPage()
    {
      return (boolean)$this->get('page_id');  
    }
    
    function getPage()
    {
        return $this->_page_id=$this->_page_id===null?new CmsPage($this->get('page_id')):$this->_page_id;
    }
    
   /* function getPageI18n()
    {
        return $this->_page_i18n_id=$this->_page_i18n_id===null?new CmsPageI18n(array('lang'=>$this->get('page_id')):$this->_page_i18n_id;         
    }*/
    
        function isActive()
    {
        return $this->get('is_active')=='YES';
    }
    
       function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new CmsMenuFormatter($this):$this->formatter;
    }
}

