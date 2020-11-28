<?php

class LanguageUtils extends LanguageUtilsBase {
         
    
     static function getI18nLanguagesFrontend()
    {
        static $languages=null;
               
        if ($languages)
            return $languages;
        $languages=new languageCollection();
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT code,is_active FROM ".Language::getTable()." WHERE application='frontend';")               
                ->makeSiteSqlQuery(); 
        if (!$db->getNumRows())
            return $languages;                
        while ($language=$db->fetchObject('language'))
        {           
            $languages[]=$language;
        }  
        $languages->sortByCountry();        
        return $languages;
    }
   
     static function getLanguagesExcepted(mfArray $excepted)
    {        
        $list=new mfArray();
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT code  FROM ".Language::getTable().
                           " WHERE application='frontend' AND code NOT IN('".$excepted->implode("','")."');")               
                ->makeSiteSqlQuery(); 
        if (!$db->getNumRows())
            return $list;                
        while ($row=$db->fetchArray())
        {           
            $list[]=$row['code'];
        }               
        return $list;
    }
 }