<?php

class LanguageUtilsBase { 
    
    
    static function getLanguages($application=null,$site=null)
    {
      //  $fileCache=self::getFileCache('languages.list',$application,$site);   
     //   if (is_readable($fileCache))
     //       return unserialize(self::readCacheFile($fileCache));
        
        $cache= new mfCacheFile('languages.list',$application,$site);
        if ($cache->isCached())       
            return unserialize($cache->read());       
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT code FROM t_languages WHERE is_active='YES' AND application=@@APPLICATION@@ ORDER BY position ASC;")               
                ->makeSqlQuery($application,$site); 
        if (!$db->getNumRows())
            return null;
        $languages=new mfArray();
        while ($row=$db->fetchObject('language'))
        {             
            $languages[]=$row;
        }  
        $cache->register(serialize($languages));
        // registered cache
       // var_dump($application);      
     //   self::registerCache("languages.list",serialize($languages),$application,$site);
      //  register_shutdown_function('mfCacheFile::writeCacheFile','languages.list',serialize($languages),$application,$site);
        return $languages;
    }   
    
    static function cmpCountry($a,$b)
    {
       if ($a->get('country')==$b->get('country'))
           return 0;
       if ($a->get('country')<$b->get('country'))
           return -1;
       else
           return 1;
    }
    
    static function sortByCountry(&$languages)
    {
        foreach ($languages as $language)
               $language->country=format_country($language->get('code'));
        usort($languages,'languageUtils::cmpCountry');
    }
    
    static function sortByCountryToArray($languages)
    {
        $sortedLanguages=array();
        foreach ($languages as $language)
               $sortedLanguages[$language]=format_country($language);
        asort($sortedLanguages);
        return $sortedLanguages;
    }
    
    static function getFrontendLanguages($site=null)
    {
              
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT code FROM t_languages WHERE is_active='YES' AND application='frontend' ORDER BY position ASC;")               
                ->makeSiteSqlQuery($site); 
        if (!$db->getNumRows())
            return null;
        $languages=array();
        while ($row=$db->fetchArray())
        {          
            $languages[$row['code']]=$row['code'];
        }               
        return $languages;
    }  
    
    static function getFormattedFrontendLanguages()
    {       
          $languages=new mfArray();   
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT code FROM t_languages WHERE application='frontend' ORDER BY position ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return  $languages;      
        while ($row=$db->fetchArray())
        {          
            $languages[$row['code']]= ucfirst(format_language($row['code']));
        }               
        return $languages->asort();
    }  
    
    static function getFormattedActiveFrontendLanguages()
    {
          $languages=new mfArray();   
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT code FROM t_languages WHERE is_active='YES' AND application='frontend' ORDER BY position ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return  $languages;      
        while ($row=$db->fetchArray())
        {          
            $languages[$row['code']]= ucfirst(format_language($row['code']));
        }               
        return $languages->asort();
    } 
    
    
    static function getLanguagesFrontend()
    {
        $languages=new LanguageCollection();       
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT * FROM ".Language::getTable()." WHERE application='frontend'".
                           ";")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $languages;        
        while ($item=$db->fetchObject('Language'))
        {          
            $languages[$item->get('id')]=$item->loaded();
        }          
       // $languages->sortByCountry();
        return $languages;
    }  
    
    
     static function getFrontendLanguagesByCodeForSelect()
    {
         $list=new mfArray();
        $db=mfSiteDatabase::getInstance()               
                ->setParameters(array())                 
                ->setQuery("SELECT code FROM ".Language::getTable()." WHERE application='frontend';")               
                ->makeSqlQuery(); 
       // var_dump($db->getQuery());
        if (!$db->getNumRows())
            return $list;             
        while ($row=$db->fetchArray())
        {                            
           $list[$row['code']]=$row['code'];
        }                
        return $list;                                    
    }
    
    
    static function getFrontendLanguagesForSelect()
    {
         $list=new LanguageCollection(null,'frontend');
        $db=mfSiteDatabase::getInstance()               
                ->setParameters(array())                 
                ->setQuery("SELECT * FROM ".Language::getTable()." WHERE application='frontend';")               
                ->makeSqlQuery(); 
       // var_dump($db->getQuery());
        if (!$db->getNumRows())
            return $list;             
        while ($item=$db->fetchObject('Language'))
        {                            
           $list[$item->get('code')]=$item->loaded();
        }                
        return $list;                                    
    }
    
    static function getActiveLanguagesFrontend()
    {
        $languages=new LanguageCollection();       
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT * FROM ".Language::getTable()." WHERE is_active='YES' AND application='frontend'".
                           ";")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $languages;        
        while ($item=$db->fetchObject('Language'))
        {          
            $languages[$item->get('id')]=$item->loaded();
        }                 
        return $languages;
    } 
    
    static function getActiveLanguagesFrontendByPosition()
    {
        $languages=new LanguageCollection();       
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT * FROM ".Language::getTable()." WHERE is_active='YES' AND application='frontend' ".
                           " ORDER BY position".
                           ";")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $languages;        
        while ($item=$db->fetchObject('Language'))
        {          
            $languages[$item->get('id')]=$item->loaded();
        }                 
        return $languages;
    } 
    
 }
 
 