<?php

class PartnerWorkCategoryUtilsBase {   
        
            
    static function getFormattedLanguages()
    {
        $languages=new mfArray();   
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT lang FROM ".PartnerWorkCategoryI18n::getTable().
                           " GROUP BY lang".
                           ";")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return  $languages;      
        while ($row=$db->fetchArray())
        {          
            $languages[$row['lang']]= ucfirst(format_language($row['lang']));
        }               
        return $languages->asort();
    } 
         
    
    
}    
