<?php


class sitesAdmin {
    
    static function getlistSites()
    {
        static $sites=array();
          if ($sites)
            return $sites;
          $db=mfSiteDatabase::getInstance()
                  ->setQuery("SELECT site_id,site_db_name,site_admin_theme,site_frontend_theme,site_admin_available,site_frontend_available,site_type,site_master,site_available,site_host FROM t_sites;")
                  ->makeSqlQuerySuperAdmin();
           if (!$db->getNumRows()) return null;
           while ($row = $db->fetchObject("Site")) {
               $sites[]=$row;
           }
         return $sites;                   
    }
    
    static function getListSiteName()
    {
        static $sites=array();
          if ($sites)
            return $sites;
          $db=mfSiteDatabase::getInstance()
                  ->setQuery("SELECT * FROM t_sites GROUP BY site_db_name;")
                  ->makeSqlQuerySuperAdmin();
           if (!$db->getNumRows()) return null;
           while ($row = $db->fetchObject("Site")) {
               $sites[]=$row;
           }
         return $sites;                   
    }
    
    static function getlistSitesByHost()
    {
        static $sites=array();
        if ($sites)
            return $sites;
        $db=mfSiteDatabase::getInstance()
                  ->setQuery("SELECT site_host FROM t_sites;")
                  ->makeSqlQuerySuperAdmin();
        if (!$db->getNumRows()) return null;
        $sites=array();
        while ($row = $db->fetchArray()) {
             $sites[]=$row['site_host'];
        }
        return $sites;                   
    }
    
    static function disableGlobalSites()
    {
       $db=mfSiteDatabase::getInstance()
                  ->setQuery("UPDATE t_sites SET site_available='NO' WHERE site_available='YES';")
                  ->makeSqlQuerySuperAdmin(); 
       mfContext::getInstance()->getSite()->deleteAllCacheHost();
    }
    
    
    static function getlistSitesByName()
    {
        static $sites=array();
          if ($sites)
            return $sites;
          $db=mfSiteDatabase::getInstance()
                  ->setQuery("SELECT * FROM t_sites GROUP BY site_db_name;")
                  ->makeSqlQuerySuperAdmin();
           if (!$db->getNumRows()) return null;
           while ($row = $db->fetchObject("Site")) {
               $sites[]=$row;
           }
         return $sites;                   
    }
    
}

