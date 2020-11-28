<?php

class SiteCurrencyUtils extends SiteCurrencyUtilsBase {
    
        
    static function getFieldValues($name)
    {
        $values=array();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array("name"=>$name))
                ->setQuery("SELECT DISTINCT({name}) FROM ".siteCurrency::getTable()." ORDER BY {name} ASC;")               
                ->makeSiteSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($value=$db->fetchArray())
        { 
            $values[$value[$name]]=$value[$name];
        }      
        return $values;
    }
    
     
                                                                        
}
