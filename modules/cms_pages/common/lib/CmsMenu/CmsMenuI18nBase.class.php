<?php

class CmsMenuI18nBase extends mfObject3 {

    const table="t_site_cms_menu_i18n";
    protected static $fields=array('lang','menu_id','title','created_at','updated_at');        
    protected static $foreignKeys=array('menu_id'=>'CmsMenu'); 
    protected $_menu_id=null;
    
    function __construct($parameters=null) {
      parent::__construct();
      $this->getDefaults();
      if ($parameters===null) return $this; 
      if (is_array($parameters)||$parameters instanceof ArrayAccess) {
           if (isset($parameters['menu']) && $parameters['menu'] instanceof CmsMenu && isset($parameters['lang']) && $parameters['lang'] instanceof Language)
               return $this->loadByMenuAndLang($parameters['menu'],$parameters['lang']);  
            if (isset($parameters['menu_id']) && $parameters['menu_id'] instanceof CmsMenu && isset($parameters['lang']) && $parameters['lang'] instanceof Language)
               return $this->loadByMenuAndLang($parameters['menu_id'],$parameters['lang']);  
            if (isset($parameters['menu_id']) && isset($parameters['lang']))
               return $this->loadByMenuIdAndLang((string)$parameters['menu_id'],(string)$parameters['lang']);      
           if (isset($parameters['id']))
               return $this->loadById((string)$parameters['id']);          
           return $this->add($parameters); 
       }  
       else 
       {    
          if ($parameters instanceof Language)
              return $this->loadLanguage($parameters);
          if (is_numeric((string)$parameters)) 
             $this->loadById((string)$parameters);                     
       } 
    }
    
     protected function loadLanguage(Language $lang)
    {      
        $this->set('lang',$lang->get('code'));      
    }   
    
      protected function loadByMenuAndLang(CmsMenu $menu,Language $lang)
    {  
        $this->set('menu_id',$menu);
        $this->set('lang',$lang->get('code'));
        $db=mfSiteDatabase::getInstance()
           ->setParameters(array('menu_id'=>$menu->get('id'),"lang"=>$lang->get('code')))
           ->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getTableField('menu_id')."={menu_id} AND ".self::getTableField('lang')."='{lang}';")
           ->makeSqlQuery();    
        return $this->rowtoObject($db);
    }   
    
    
    protected function loadByMenuIdAndLang($menu_id,$lang)
    {
        $this->set('menu_id',$menu_id);
        $this->set('lang',$lang);
        $db=mfSiteDatabase::getInstance()
           ->setParameters(array('menu_id'=>$menu_id,"lang"=>$lang))
           ->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getTableField('menu_id')."={menu_id} AND ".self::getTableField('lang')."='{lang}';")
           ->makeSqlQuery();    
        return $this->rowtoObject($db);
    }   
    
   
    
    protected function getDefaults()
    {
        $this->setIfNotNull(array(
           'created_at'=>date("Y-m-d H:i:s"),
           'updated_at'=>date("Y-m-d H:i:s"),     
        ));      
    }
    
    function getLanguage()
    {
         return $this->_lang=$this->_lang===null?new Language($this->get('lang'),'frontend'):$this->_lang;
    }
   
    
    function getMenu()
    {
        return $this->_menu_id=$this->_menu_id===null?new CmsMenu($this->get('menu_id')):$this->_menu_id;
    }
    
    function getPageI18n()
    {               
        return $this->_page_i18n_id=$this->_page_i18n_id===null?new CmsPageI18n(array('lang'=>$this->get('lang'),'page_id'=>$this->getMenu()->get('page_id'))):$this->_page_i18n_id;
    }
    
       function getFormatter()
    {
        return $this->formatter=$this->formatter===null?new CmsMenuI18nFormatter($this):$this->formatter;
    }
    
    function hasTitle()
    {
        return (boolean)$this->get('title');
    }
    
    function __toString() {
        return (string)$this->get('title');
    }
    
   
}

