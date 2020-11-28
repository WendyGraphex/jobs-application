<?php


class SiteGalleryI18nCollection extends mfObjectCollection3 {
    
    
    function removeDouble()
    {
        $conditions=new mfArray();
        foreach ($this->collection as $item)
           $conditions[]="(lang='".$item->get('lang')."' AND gallery_id='".$item->get('site_gallery_id')."')";
        $db=mfSiteDatabase::getInstance()
          ->setParameters(array())          
          ->setQuery("SELECT lang,site_gallery_id FROM ".SiteGalleryI18n::getTable().                    
                     " WHERE ".$conditions->implode(' OR ').
                     ";")
          ->makeSqlQuery();  
         if (!$db->getNumRows())
             return $this;
         while ($row=$db->fetchArray())
         { 
             $key=$row['lang']."_".$row['gallery_id'];
             if (isset($this->collection[$key]))
                 unset($this->collection[$key]);
         }         
         return $this;
    }
    
    function getGalleries()
    {
        $values=new mfArray();
        foreach ($this->collection as $item)
            $values[$item->get('gallery_id')]=$item;
        return $values;
    }
    
    
    
}

