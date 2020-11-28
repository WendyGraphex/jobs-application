
<?php

class CmsPageI18nBase extends mfObject3 {
 
    const table="t_site_cms_page_i18n";
    
    protected static $fields=array('page_id','lang','url','meta_title','meta_description','meta_keywords','meta_robots','layout',
                                   'template','content','in_menu','is_cached','is_active','start_at',
                                   'expired_at','created_at','updated_at');    
    
    protected static $fieldsNull=array('start_at','expired_at'); 
    
    protected static $foreignKeys=array('page_id'=>'CmsPage');
    
    
    function __construct($parameters=null) {
      parent::__construct();   
      $this->getDefaults();
      if ($parameters===null) return ; 
      if (is_array($parameters)||$parameters instanceof ArrayAccess) {
           if (isset($parameters['id']))
               return $this->loadById((string)$parameters['id']);            
           if (isset($parameters['page_id']) && isset($parameters['lang']))
               return $this->loadByPageIdAndLang((string)$parameters['page_id'],(string)$parameters['lang']);
           // For import - order is mandatory -1
           if (isset($parameters['url']) && isset($parameters['name']) && isset($parameters['lang']))               
               return $this->loadByUrlOrNameAndLang((string)$parameters['url'],(string)$parameters['name'],(string)$parameters['lang']); 
            // For import - order is mandatory -2
           if (isset($parameters['url']) && isset($parameters['name']))               
                return $this->loadByUrlOrName((string)$parameters['url'],(string)$parameters['name']);            
           // For import - order is mandatory -3
           if (isset($parameters['lang']) && isset($parameters['url']))
               return $this->loadByUrlAndLang ((string)$parameters['url'], (string)$parameters['lang']);
            // For import - order is mandatory -4
           if (isset($parameters['name']) && isset($parameters['lang']))             
               return $this->loadByNameAndLang ((string)$parameters['name'],(string)$parameters['lang']);            
           return $this->add($parameters); 
       }  
       else 
       {    
          if (is_numeric((string)$parameters)) 
             $this->loadById((string)$parameters);            
       } 
    }
    
    protected function loadByUrlOrNameAndLang($url,$name,$lang)
    {                
        $db=mfSiteDatabase::getInstance()
           ->setParameters(array('name'=>$name,'url'=>$url,'lang'=>$lang))  
           ->setObjects(array('CmsPageI18n','CmsPage'))
           ->setQuery("SELECT {fields} FROM ".CmsPage::getTable().
                      " LEFT JOIN ".CmsPageI18n::getInnerForJoin('page_id')." AND lang='{lang}'".
                      " WHERE ((url!='' AND url='{url}') OR (name!='' AND name='{name}'));")
           ->makeSqlQuery(); ;    
        $row=$db->fetchObjects();          
        if ($row)
        {    
            if ($row->hasCmsPageI18n())
            {
                $this->toObject($row->getCmsPageI18n());
            }    
            $this->set('page_id',$row->getCmsPage());
        }
       // var_dump($row);
        //return $this->rowtoObject($db);
        return $this;
    }
    
    protected function loadByUrlOrName($url,$name)
    {                
        $db=mfSiteDatabase::getInstance()
           ->setParameters(array('name'=>$name,'url'=>$url))  
           ->setObjects(array('CmsPageI18n','CmsPage'))
           ->setQuery("SELECT {fields} FROM ".CmsPage::getTable().
                      " LEFT JOIN ".CmsPageI18n::getInnerForJoin('page_id'). 
                      " WHERE (url!='' AND url='{url}') OR (name!='' AND name='{name}');")
           ->makeSqlQuery(); ;    
        $row=$db->fetchObjects();         
        if ($row)
        {    
            if ($row->hasCmsPageI18n())
            {
                $this->toObject($row->getCmsPageI18n());
            }    
            $this->set('page_id',$row->getCmsPage());
        }
       // var_dump($row);
        //return $this->rowtoObject($db);
        return $this;
    }
    
    protected function loadByUrlAndLangAndName($url,$lang,$name)
    {
        $this->set('url',$url);
        $this->set('lang',$lang);
        $db=mfSiteDatabase::getInstance()
           ->setParameters(array('url'=>$url,"lang"=>$lang,'name'=>$name))
           
           ->setQuery("SELECT {fields} FROM ".self::getTable().
                      " LEFT JOIN ".self::getOuterForJoin('page_id').
                      " WHERE url='{url}' AND lang='{lang}' AND ".CmsPage::getTableField('name')."name='{name}';")
           ->makeSqlQuery(); ;    
        return $this->rowtoObject($db);
    }  
    
    protected function loadByUrlAndLang($url,$lang)
    {
        $this->set('url',$url);
        $this->set('lang',$lang);
        $db=mfSiteDatabase::getInstance()
           ->setParameters(array('url'=>$url,"lang"=>$lang))
           ->setQuery("SELECT * FROM ".self::getTable()." WHERE url='{url}' AND lang='{lang}';")
           ->makeSqlQuery(); ;    
        return $this->rowtoObject($db);
    }  
    
    protected function loadByPageIdAndLang($page_id,$lang)
    {
        $this->set('page_id',$page_id);
        $this->set('lang',$lang);
        $db=mfSiteDatabase::getInstance()
           ->setParameters(array('page_id'=>$page_id,"lang"=>$lang))
           ->setQuery("SELECT * FROM ".self::getTable()." WHERE ".self::getTableField('page_id')."={page_id} AND ".self::getTableField('lang')."='{lang}';")
           ->makeSqlQuery(); ;    
        return $this->rowtoObject($db);
    }   
    
   
    protected function getDefaults() {      
       $this->created_at=date("Y-m-d H:i:s");
       $this->updated_at=date("Y-m-d H:i:s");
       $this->in_menu=isset($this->in_menu)?$this->in_menu:"YES";
       $this->is_active=isset($this->is_active)?$this->is_active:"NO";
       $this->is_cached=isset($this->is_cached)?$this->is_cached:"NO";
       $this->start_at=isset($this->start_at)?$this->start_at:null;
       $this->expired_at=isset($this->expired_at)?$this->expired_at:null;
       $this->url=isset($this->url)?$this->url:"";
       $this->layout=isset($this->layout)?$this->layout:'default.xml';
       $this->template=isset($this->template)?$this->template:'default.tpl';
       parent::getDefaults();
    }
     
     protected function executeIsExistQuery($db)
    {                  
      $key_condition=($this->getKey())?" AND ".self::getKeyName()."!='%s';":"";
      $db->setParameters(array('url'=>$this->url,$this->getKey()))
         ->setQuery("SELECT ".self::getKeyName()." FROM ".self::getTable()." WHERE url='{url}' AND url NOT IN('','#')".$key_condition)
         ->makeSqlQuery(); ; 
    }
    
    
    function getPage()
    {
       return $this->_page_id=$this->_page_id===null?new CmsPage($this->get('page_id')):$this->_page_id;
    }
    /* ************************************************************ */
    
   /* function isExtern()
    {
        return (strpos($this->url,"http")===0);
    }
    
    function isLink()
    {
        return (strpos($this->url,"/")===0);
    }
    
    function isUrl()
    {
        return ($this->url!=null && $this->url!='#');
    }*/
    
    function hasUrl()
    {
        return (boolean)$this->get('url');
    }
        
    function getURL()
    {
         return $this->_url=$this->_url===null?new CmsPageI18nUrl($this->get('url')):$this->_url;
    }
    
   /* function getPageStatus()
    {
        $active=($this->is_active=='NO'||$this->is_active==NULL)?"_inactive":"";      
        $status="";
        if (strpos($this->url,"http")===0)
           return "_link".$status.$active;
        if (strpos($this->url,"/")===0)
           return "_shortcut".$status.$active;
        return $active;
    }*/
    
     function getFormatter()
    {
       return $this->formatter=$this->formatter===null?new CmsPageI18nFormatter($this):$this->formatter;
    }
    
}

