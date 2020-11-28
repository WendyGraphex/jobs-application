<?php


class SitePictureI18nCollection extends mfObjectCollection3 {
    
    
    function removeDouble()
    {
        $conditions=new mfArray();
        foreach ($this->collection as $item)
           $conditions[]="(lang='".$item->get('lang')."' AND picture_id='".$item->get('picture_id')."')";
        $db=mfSiteDatabase::getInstance()
          ->setParameters(array())          
          ->setQuery("SELECT lang,picture_id FROM ".SitePictureI18n::getTable().                    
                     " WHERE ".$conditions->implode(' OR ').
                     ";")
          ->makeSqlQuery();  
         if (!$db->getNumRows())
             return $this;
         while ($row=$db->fetchArray())
         { 
             $key=$row['lang']."_".$row['picture_id'];
             if (isset($this->collection[$key]))
                 unset($this->collection[$key]);
         }         
         return $this;
    }
    
}

