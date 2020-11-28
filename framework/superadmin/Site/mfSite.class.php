<?php

class mfSiteSuperAdmin extends mfSite {
    
    function configure()
    {
        
      // Demande SuperAdmin sur le bon host ?
      if ($this->host!=mfConfig::getSuperAdmin('host'))
      {
          trigger_error("SuperAdmin is not on this site");
          header("HTTP/1.1 500 Internal Server Error");
	  header("Status: 500 Internal Server Error");
          die("Internal Server Error");
      }
      $this->site=new Site();      
      $this->site->add(array(
          'site_host'=>$this->host,
          'site_theme'=>mfConfig::getSuperAdmin('theme'),
          'site_db_name'=>mfConfig::getSuperAdmin('site'),
          'site_access_restricted'=>false,
          'site_master'=>"",
          'site_type'=>"",
          'available'=>'YES'  // ALWAYS YES            
      ))->loaded(); 
      $culture=$this->context->getRequest()->getCulture();
      $this->client=new SiteClient();
      $this->client->add(array(
          'is_active'=>'YES',  // ALWAYS YES
          'design'=>mfConfig::getSuperAdmin('design'),
          'style'=>mfConfig::getSuperAdmin('style'),
          'lang'=>$culture
      ));
      mfConfig::set('mf_site_db_name',$this->site->get('site_db_name'));  
      mfConfig::set('mf_site_host',$this->site->get('site_host'));
      // Here Site is initialized         
      // Banner  && Favicons
      if (class_exists('PreferencesSettings'))
      {                      
        $settings=new PreferencesSettings();               
        if ($settings->get('favicon'))
           $this->client->set('favicon',$settings->get('favicon')); 
        if ($settings->get('favicon_ico'))
           $this->client->set('favicon_ico',$settings->get('favicon_ico')); 
         if ($settings->get('banner'))
           $this->client->set('banner',$settings->get('banner'));        
      }      
      if (!in_array($this->client->get('lang'),array('fr')))
      {
          if ($settings)
            $this->client->set('lang',$settings->get('default_language','fr'));
          else
            $this->client->set('lang','fr');  
      }    
      $this->context->getRequest()->setCulture($this->client->get('lang'));      
      return false;
    } 

    public function isNotExistSiteClient()
    {
      return false; //Site trouvé (toujours)
    }

    function getFaviconIco()
    {
       if ($this->getSiteClient('favicon_ico'))
            return $this->getSiteClient('favicon_ico');
      return $this->getSite()->get('favicon_ico');
    }
    
    function getFavicon()
    {
       if ($this->getSiteClient('favicon'))
            return $this->getSiteClient('favicon');
       return $this->getSite()->get('favicon');
    }
    
    function getBanner()
    {
       if ($this->getSiteClient('banner'))
            return $this->getSiteClient('banner');
       return $this->getSite()->get('banner');
    }
}