<?php


class SitePictureI18nUtils {
    
      static function getPictures($site=null)
    {
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT * FROM ".SitePictureI18n::getTable()." ;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return null;
        $items=array();
        while ($row=$db->fetchObject('SitePictureI18n'))
            $items[]=$row;
        return $items;
    }
}
