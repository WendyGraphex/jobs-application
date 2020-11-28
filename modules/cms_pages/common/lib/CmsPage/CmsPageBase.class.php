<?php

class CmsPageBase extends mfObject3 {
 
    protected static $fields=array('name','is_active','created_at','updated_at');
    
    const table="t_site_cms_page";
    
    function __construct($parameters=null) {
      parent::__construct();
      $this->getDefaults();
      if ($parameters===null) return $this; 
      if (is_array($parameters)||$parameters instanceof ArrayAccess) {
          // if (isset($parameters['url']) && isset($parameters['name']))               
         //      return $this->loadByUrlOrName ((string)$parameters['url'], (string)$parameters['name']);
           if (isset($parameters['id']))
               return $this->loadById(intval((string)$parameters['id']));
           if (isset($parameters['name']))
               return $this->loadByName((string)$parameters['name']);
           return $this->add($parameters); 
       }  
       else 
       {    
          if (is_numeric($parameters)) 
             $this->loadById($parameters);  
       } 
    }
    
    
     protected function getDefaults()
    {
        $this->setIfNotNull(array(
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),           
            'is_active'=>"NO",           
        ));      
    }
  /*  protected function loadByUrlOrName($url,$name)
    {        
        $this->set('name',$name);       
        $db=mfSiteDatabase::getInstance()
           ->setParameters(array('url'=>$url,'name'=>$name))           
           ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().
                      " LEFT JOIN ".CmsPageI18n::getInnerForJoin('page_id').
                      " WHERE (url='{url}' AND url!='') OR (name!='' AND name='{name}');")
           ->makeSqlQuery(); ;    
        return $this->rowtoObject($db);
    }*/
    
    
    protected function LoadByName($name)
    {
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array($name))
                ->setQuery("SELECT * FROM ".self::getTable()." WHERE name='%s' AND name!='';")
                ->makeSqlQuery(); ; 
        $this->rowtoObject($db);   
        $this->set('name',$name);     
    }
    
    protected function executeIsExistQuery($db)
    {                  
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('name'=>$this->name,$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE name='{name}' AND name!='' ".$key_condition)
         ->makeSqlQuery(); ; 
    }
    
    
    public function hasI18n()
    {
        return (boolean)$this->i18n;
    }        
    
    public function setI18n($i18n)
     {
         $this->i18n=$i18n;
         return $this;
     } 
     
     public function getI18n($lang=null)
     {        
         if ($this->i18n===null)
         {
              if ($lang==null)
                $lang=  mfcontext::getInstance()->getUser()->getCountry();
             $this->i18n=new CmsPageI18n(array('lang'=>$lang,"page_id"=>$this->get('id')));
         }   
         return $this->i18n;
     } 
     
     function isActive()
    {
        return $this->get('is_active')=='YES';
    }
    
    
    function inMenu()
    {
        return  $this->getNumberOfMenus() ? $this->getNumberOfMenus() > 0 : false;
    }
    
    function getNumberOfMenus()
    {
        return intval($this->number_of_menus);
    }
}

