<?php


class tabsManager {

    protected static $instances=array();
    protected $tabs=null,$components=null;
    
    static function getInstance($name)
    {
       if ($site && !$site instanceof Site)
           throw new mfException("site is invalid in menu manager.");   
       if ($site)
           $key=$site->getHost().".".$name;  
       else 
           $key=$name;
       if (self::$instances[$name])
            return self::$instances[$name];
       else
       {
            self::$instances[$name]=new self($name,$site);
            return self::$instances[$name];
       }    
    } 
    
    function __construct($name) { 
       $context=mfContext::getInstance(); // Used to config tab file
       $request=$context->getRequest();  // Used to config tab file
    //   require_once mfContext::getInstance()->getConfigCache()->checkConfig('config/tabs.php',$name,$name);     
       if ($site==null)
           require_once $context->getConfigCache()->checkConfig('config/tabs.php',$name,$name); 
       else                       
           require_once $context->getFactory('configCacheSite')->checkConfig('config/tabs.php',$name,$name,$site);  
       
      // var_dump($this);die(__METHOD__);
    }
    
    function getTabs()
    {
      return $this->tabs;
    }
    
    function getSortedTabs()
    {
      ksort($this->tabs);
      return $this->tabs;
    }
    
    function hasTabs()
    {
        return !empty($this->tabs);
    }
    
    function getComponents()
    {
        if (!$this->components)
        {    
            foreach ($this->tabs as $name=>$tab)
            {
                if (isset($tab['component']))
                    $this->components[$name]=$tab;
            }
        }
        return $this->components;
    }
         
    static function removeCache(Site $site)
    {
        // remove config_menu ...  in root and in site and in all application    
        $files=array_merge(// Superadmin
                           glob(mfConfig::get('mf_cache_dir').'/sites/'.mfConfig::getSuperAdmin('host').'/*/*/config/config_tabs_'.$site->getHost().'*.php'),                          
                           glob(mfConfig::get('mf_cache_dir').'/sites/'.mfConfig::getSuperAdmin('host').'/*/*/config/'.$site->getHost().'/config_tabs*.php'),
                           // Site
                           glob(mfConfig::get('mf_cache_dir').'/sites/'.$site->getHost().'/*/*/config/config_tabs_*.php'),
                           glob(mfConfig::get('mf_cache_dir').'/sites/'.$site->getHost().'/*/*/config/config_tabs*.php')
                          ); 
     //   var_dump($files); 
        foreach ($files as $file)
        {
            if (is_readable($file)) 
                unlink($file);
        }   
        // remove i18n        
        TabsTranslator::removeCache($site);
    }
  
}