<?php

class SiteCurrencyUtilsBase { 
    
    
    static function getCurrencies()
    {      
        $cache= new mfCacheFile('currencies.list');
        if ($cache->isCached())       
            return unserialize($cache->read());       
         $currencies=new SiteCurrencyCollection();
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT * FROM ".SiteCurrency::getTable()." WHERE is_active='YES' ".
                           " ORDER BY position ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $currencies;       
        while ($row=$db->fetchObject('SiteCurrency'))
        {             
            $currencies[]=$row;
        }  
        $cache->register(serialize($currencies));      
        return $currencies;
    }   
    
   static function getCurrenciesForSelect()
    {               
        $list=new mfArray();
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT * FROM ".SiteCurrency::getTable()." WHERE is_active='YES' ".
                           " ORDER BY position ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $list;     
        while ($item=$db->fetchObject('SiteCurrency'))                    
            $list[$item->get('code')]=(string)$item;            
        return $list;
    } 
 }
 
 