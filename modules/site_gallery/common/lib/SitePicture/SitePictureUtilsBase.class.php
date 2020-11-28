<?php


class SitePictureUtilsBase {
    
    
    
    static function copyPicturesI18nToLangugages(mfArray $pictures_i18n,mfArray $languages)
    {      
        // get id of all picture
         $db=mfSiteDatabase::getInstance()
          ->setParameters(array())          
          ->setQuery("SELECT * FROM ".SitePictureI18n::getTable().                    
                     " WHERE id IN('".$pictures_i18n->implode("','")."')".
                     ";")
          ->makeSqlQuery();      
         if (!$db->getNumRows())
             return ;
         $picture_i18n_list=new mfArray();
         while ($item=$db->fetchObject('SitePictureI18n'))
             $picture_i18n_list[$item->get('picture_id')]=$item->loaded();
         $picture_i18n_collection=new SitePictureI18nCollection();
         foreach ($languages as $language)
         {
             foreach ($picture_i18n_list as $picture_i18n)
             {
                 $item=new PictureI18n(null,$site);
                 $item->set('lang',$language);
                 $item->copyFromPictureI18n($picture_i18n);
                 $picture_i18n_collection[$item->get('lang')."_".$item->get('picture_id')]=$item;
             }    
         }
         $picture_i18n_collection->removeDouble();   // Remove double
         $picture_i18n_collection->save();
         
         // copy picture files
         foreach ($picture_i18n_collection as $item)
         {
             if (isset($picture_i18n_list[$item->get('picture_id')]))
             {
                $item->picture()->copyFrom($picture_i18n_list[$item->get('picture_id')]->picture());
             }    
         }
         
    }        
}

