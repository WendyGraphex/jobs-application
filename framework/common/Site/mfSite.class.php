<?php

class mfSite {
    
    protected   $sites=array(),$site=null,
                $cacheHost,
                $request,
                $context,
                $langue,
                $browser,
                $cacheChange=false,
                $host_delete_cache=null,
                $host,
                $directories=array();
      
    function __construct($context)
    {        
      $this->context=$context;
      $this->host=$this->context->getRequest()->getHost();         
      $this->browser=$this->context->getRequest()->getUserAgent()->getBrowserName();   
      $this->country=$this->context->getRequest()->getCountry();               
      register_shutdown_function(array($this,'deleteCache'));
      $this->initialize();
      $this->configure();
    }
    
    function configure()
    {
       $this->isNotExistSiteClient(); // Recherche le site      
       $this->context->getRequest()->setSite($this->site);
    }
    
    function addParameter($name,$value)
    {
        if (!in_array($name,array('site','shops')))
            $this->shops[$name]=$value;
        return $this;
    }
    
    function hasParameter($name)
    {
        return isset($this->clients[$name]);
    }
    
    function getParameter($name,$default=null)
    {
        return $this->hasParameter($name)?$this->shops[$name]:$default;
    }
    
    function initialize()
    {
       $dir=mfConfig::get('mf_cache_dir').DIRECTORY_SEPARATOR.mfConfig::get('mf_app')."/hosts";
       mfFileSystem::mkdirs($dir); // @TODO test
       $this->cacheHost = $dir."/".$this->host.".cache";        
    }
  
    static function getHostCacheDirectory()
    {
        return mfConfig::get('mf_cache_dir').DIRECTORY_SEPARATOR.mfConfig::get('mf_app')."/hosts";
    }
    
    static function getSiteHostCache($site)
    {
       return mfConfig::get('mf_cache_dir')."/frontend/hosts/".$site.".cache"; 
    }
         
    
    function getType()
    {
        return $this->site->get('site_type');
    }
    
    function getSiteName()
    {        
        return $this->site->get('site_db_name');
    }
  
    function isAvailable()
    {
        return ($this->site->get('available')=='YES' && $this->site->get('site_available')=='YES');
    }    
    
    function getSite()
    {
        return $this->site;
    }
    
    function getHost()
    {
        return $this->site->get('site_host');
    }

    function getTheme()
    {
        return $this->site->get('site_theme');
    }
    
    function getThemeDirectory()
    {
        return mfConfig::get('mf_themes_app_dir')."/".$this->getTheme();
    }
    
    function setTheme($theme)
    {
       $this->site->site_theme=$theme;
       return $this;
    }
    
    function getDesign()
    {
        return $this->client->get('design');
    }
    
    function getBanner()
    {
       if ($this->getSiteClient('banner'))
            return $this->getSiteClient('lang')."/".$this->getSiteClient('banner');
       return null;
    }
    
    function getFavicon()
    {
       if ($this->getSiteClient('favicon'))
            return $this->getSiteClient('lang')."/".$this->getSiteClient('favicon');
       return null;
    }
    
    function getFaviconIco()
    {
       if ($this->getSiteClient('favicon_ico'))
            return $this->getSiteClient('lang')."/".$this->getSiteClient('favicon_ico');
       return null;
    }
    
    function getSiteClient($name=null,$default=null)
    {
       if ($name==null)
            return $this->client;    
       else
         return $this->client->get($name)?$this->client->get($name):$default;
    }
    
     function hasRestrictedAccess()
    {
        return !$this->site->get('site_access_restricted');
    }
    
    function getRestrictedAccess()
    {
        return $this->site->get('site_access_restricted');
    }
    
    function getStyle()
    {
        return $this->client->get('style');
    }

     function getThemesDirectory($value="")
     {
         $retval= mfConfig::get('mf_sites_dir')."/themes".DIRECTORY_SEPARATOR.mfConfig::get('mf_app').DIRECTORY_SEPARATOR.$value;
         return $retval;
     }   
     
     function getCommonDirectory($value="")
     {
        $retval= mfConfig::get('mf_sites_dir')."/themes/common/".$value;
        return $retval; 
     }
         
     function getSiteDirectory($value="")
     {
         $value=mfConfig::get('mf_sites_dir').DIRECTORY_SEPARATOR.$this->getSiteName().DIRECTORY_SEPARATOR.mfConfig::get('mf_app').DIRECTORY_SEPARATOR.$value;
         return $value;
     }     
     
     function getStyleDirectory($value="")
    {
      switch ($value)
      {
         case 'all':   $dir=array();
                       foreach (array('site','theme','default','base','common.base') as $type)
                            $dir[]=$this->getStyleDirectory($type);                       
                       return $dir;
         case 'site':$dir=$this->getSiteDirectory('view');  break;  // Sur le site/styles/'.$this->getStyle())
         //case 'site.view':$dir=$this->getSiteDirectory('view')  ; break;  
         //case 'site.theme':$dir=$this->getSiteDirectory('themes').'/'.$this->getTheme()."/styles/".$this->getStyle()); break;  
         // case 'common.site': break;  //@TODO see case 2
         case 'default':$dir=$this->getThemesDirectory($this->getTheme()."/styles/default"); break;   // Default
         case 'base':$dir=$this->getThemesDirectory("base/default/styles"); break; // Base
         case 'common.base':$dir=$this->getCommonDirectory("base/default/styles"); break; // Common Base
         default: $dir=$this->getThemesDirectory($this->getTheme()."/styles/".$this->getStyle()); break;  // style
      }
      return $dir;
    }
    
    function isFileExist($filename,$where)
    {
        if ($filename[0]!='/')
            $filename="/".$filename;
        $dirs=array();
        if (preg_match('#^/module/([^/]*)/(.*)?$#',$filename,$matches))
        {
            $dirs[]=mfConfig::get('mf_modules_dir')."/".$matches[1]."/".mfConfig::get('mf_app')."/view";
            $dirs[]=mfConfig::get('mf_modules_dir')."/".$matches[1]."/common/view";
            //@TODO mettre aussi le site app/view et common/view
            $filename="/".$matches[2];
        }   
        $dirs=array_merge($dirs,$this->getStyleDirectory($where));
        foreach ($dirs as $dir)
        {
            $file=$dir.$filename;
            if (is_readable($file))
                return $file;
        }   
        return false;
    }            
    
    function getTemplatesDirectoriesFromSources($moduleName="",$blockTemplate="")
    {
        $dirs=array();
        foreach ($this->directories as $dir)
        {
           if ($blockTemplate)
                $blockTemplate="/blocks/".dirname($blockTemplate);
           if ($moduleName)
                $moduleName="/".$moduleName;
           $dirs[]=$dir."/designs/templates".$moduleName.$blockTemplate;
        }    
        return $dirs;
    }   
    
    function getTemplatesDirectory($value="",$moduleName="",$blockTemplate="") 
    {
        switch ($value)
        {
            case 'all':$dirs=$this->getTemplatesDirectoriesFromSources($moduleName,$blockTemplate);                       
                       //foreach (array('site.view','site.theme','theme','default','base','common.base') as $type)
                       foreach (array('site','theme','default','base','common.base') as $type)
                       {                                 
                          $dirs[]=$this->getTemplatesDirectory($type,$moduleName,$blockTemplate);  // Alternate module and theme dir to speedup scan dir
                          $dirs[]=$this->getTemplatesDirectory($type);
                       } 
                       return $dirs;
            case 'site':$dir=$this->getSiteDirectory('designs/templates'); 
                        break;
             //case 'site.view':$dir=$this->getSiteDirectory('view')  ; break;  
            //case 'site.theme':$dir=$this->getSiteDirectory('themes').'/'.$this->getTheme()."/styles/".$this->getStyle()); break;  
            // case 'common.site': break;  //@TODO see SmartyView case 2
            case 'base':$dir=$this->getThemesDirectory("base/default/designs/templates"); break;   // Base
            case 'default':$dir=$this->getThemesDirectory($this->getTheme()."/designs/default/templates"); break;   // Default
            case 'common.base':$dir=$this->getCommonDirectory("base/default/designs/templates"); break; // Common Base                        
            default:$dir=$this->getThemesDirectory($this->getTheme()."/designs/".$this->getDesign()."/templates"); break;   // style
        }
        if ($blockTemplate)
            $blockTemplate="/blocks/".dirname($blockTemplate);
        if ($moduleName)
            $moduleName="/".$moduleName;
        return $dir.$moduleName.$blockTemplate;
    }
    
    function addDirectory($dir)
    {
       $this->directories[]=$dir;      
       return $this;
    }
    
    function addDirectories($dirs)
    {
       foreach ($dirs as $dir)
            $this->addDirectory($dir);   
       return $this;
    }
    
    function getLayoutsDirectory($value="",$moduleName="")
    {
        switch ($value)
        {
            case 'all':$dir=array();
                       foreach (array('site','theme','default','base','common.base') as $type)
                            $dir[]=$this->getLayoutsDirectory($type,$moduleName);
                       return $dir;
            case 'site':$dir=$this->getSiteDirectory('designs/layouts'); break;
            case 'base':$dir=$this->getThemesDirectory("base/default/designs/layouts"); break;   // Base
            case 'default':$dir=$this->getThemesDirectory($this->getTheme()."/designs/default/layouts"); break;   // Default
            case 'common.base':$dir=$this->getCommonDirectory("base/default/designs/layouts"); break; // Common Base
            default:$dir=$this->getThemesDirectory($this->getTheme()."/designs/".$this->getDesign()."/layouts"); break;   // style
        }
        if ($moduleName)
            $moduleName="/".$moduleName;
        return $dir.$moduleName;
    //    return $dir;
    }
 
     public function writeCache() {
        if ($this->cacheChange) {
            if (is_writable(dirname($this->cacheHost))) {
                file_put_contents($this->cacheHost, serialize($this->clients));
            }
        }
    }

    protected function _isExistSiteClient() {
      
        $db=mfSiteDatabase::getInstance()
                  ->setParameters(array($this->host))
                  ->setQuery($this->getSiteQuery())
                  ->makeSqlQuerySuperAdmin();
        if ($db->isErrorExist())  return false;
        if (!$db->getNumRows()) return false;
        $this->site=$db->fetchObject('Site')->loaded();       
        $db->setParameters(array($this->country,$this->browser))
           ->setQuery($this->getSiteClientQuery())
           ->makeSqlQuery(null,$this->site);        
        if ($db->isErrorExist())  
            return false;     
        if (!$db->getNumRows()) 
            return false;       
        while ($row=$db->fetchObject('SiteClient')) {
            $this->client=$row->loaded();                 
            if ($this->client->get('params')==$this->browser || $this->client->get('lang')==$this->country)
            {                
                break;
            }    
        }
        if ($this->client->get('lang')=='')
            $this->client->set('lang',$this->country);
        return true; 
    }
    
    public function isNotExistSiteClient()
     {
       
         $clients=array(); 
         if (is_readable($this->cacheHost) && file_exists($this->cacheHost)) {
           $clients=unserialize(file_get_contents($this->cacheHost));                
           if ($clients!==false)
           {
             $this->site=$clients['site'];
             $client_key=$this->country.".".$this->browser;
             if (isset($clients['clients'][$client_key]))
             {
                $this->client=$clients['clients'][$client_key];  
                mfConfig::set('mf_site_db_name',$this->site->get('site_db_name'));
                mfConfig::set('mf_site_host',$this->site->get('site_host'));            
                if ($this->country!=$this->client->get('lang'))
                   $this->context->getRequest()->setCulture($this->client->get('lang'));  
                return false; 
             }               
           }            
        }          
        if ($this->_isExistSiteClient()) {                                                
            $client_key=$this->country.".".$this->browser;
            $this->clients['site']=$this->site;
            $this->clients['clients']=array_merge((array)$clients['clients'],array($client_key =>$this->client));           
            mfConfig::set('mf_site_db_name',$this->site->get('site_db_name'));
            mfConfig::set('mf_site_host',$this->site->get('site_host'));           
            if ($this->country!=$this->client->get('lang'))
            {    
                   $this->context->getRequest()->setCulture($this->client->get('lang'));  
            }       
            $this->cacheChange=true;
            register_shutdown_function(array($this,'writeCache'));           
            return false; //Site trouvé
        }        
        return true;
     }
    

     public function debug()
     {
         echo "[Debug Site]<br/>";
         echo "Cache File=".$this->cacheFileHosts."<br/>" ;
         echo "Site=".print_r($this->site,true)."<br/>";
         echo "getOfficeDirectory()=".$this->getOfficeDirectory()."<br/>";
         echo "getTmpOfficeSiteDirectory=".$this->getTmpOfficeSiteDirectory()."<br/>";
         echo "getTemplatesDirectory('site')=".$this->getTemplatesDirectory('site')."<br/>";
         echo "getTemplatesDirectory('base')=".$this->getTemplatesDirectory('base')."<br/>";
         echo "getTemplatesDirectory('default')=".$this->getTemplatesDirectory('default')."<br/>";
         echo "getTemplatesDirectory()=".$this->getTemplatesDirectory()."<br/>";
         echo "getStyleDirectory('site)=".$this->getStyleDirectory('site')."<br/>";
         echo "getStyleDirectory('base')=".$this->getStyleDirectory('base')."<br/>";
         echo "getStyleDirectory('default')=".$this->getStyleDirectory('default')."<br/>";
         echo "getStyleDirectory()=".$this->getStyleDirectory()."<br/>";
     }
     
     protected function _getHost($site)
     {
         return ($site instanceof Site)?$site->get('site_host'):$site; 
     }
     
     function clearHostCache($sites)
     {
         $sites=$this->_getHost($sites);
         $this->hosts_cache_todelete=$sites;     
         if (is_array($sites) && in_array($this->host,$sites))
         {
            $this->cacheChange=false; // Don't generate current site cache
         }   
     }
     
     function clearHostCacheFrontend($site)
     {
          $host=$this->_getHost($site);
          $file = mfConfig::get('mf_cache_dir')."/frontend/hosts/".$host.".cache";
          if (file_exists($file))
              file_put_contents($file, "");
        //      unlink($file);  // Don't work with unlink ????
     }
     
      function clearHostCacheAdmin($site)
     {
         $host=$this->_getHost($site);
         $file = mfConfig::get('mf_cache_dir')."/admin/hosts/".$host.".cache";
         if (file_exists($file))
            file_put_contents($file, "");
         //     unlink($file);  // Don't work with unlink
     }
     
     function deleteCache() {          
         if ($this->hosts_cache_todelete)
         {   
           // Efface le cache sur toutes les applications
           if (!is_array($this->hosts_cache_todelete))
              $this->hosts_cache_todelete=array($this->hosts_cache_todelete);
           foreach ($this->hosts_cache_todelete as $host)
           {    
                $this->clearHostCacheFrontend($host);
                $this->clearHostCacheAdmin($host);
           }     
         }  
    }
    
    function deleteAllCacheHost()
    {
         foreach (glob(mfConfig::get('mf_cache_dir')."/*/hosts/*.cache") as $file)
         {        
             if (file_exists($file))
                   file_put_contents($file, ""); //unlink($file); //
         }    
    }
    
}
