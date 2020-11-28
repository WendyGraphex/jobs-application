<?php


class SiteGalleryUtilsBase {
    
    
    
    static function copyGalleriesI18nToLangugages(mfArray $galleries_i18n,mfArray $languages)
    {             
        // get id of all gallery
         $db=mfSiteDatabase::getInstance()
          ->setParameters(array())          
          ->setQuery("SELECT * FROM ".SiteGalleryI18n::getTable().                    
                     " WHERE id IN('".$galleries_i18n->implode("','")."')".
                     ";")
          ->makeSqlQuery();      
         if (!$db->getNumRows())
             return ;
         $site_gallery_i18n_list=new mfArray();
         while ($item=$db->fetchObject('SiteGalleryI18n'))
             $gallery_i18n_list[$item->get('gallery_id')]=$item->loaded();
         $gallery_i18n_collection=new GalleryI18nCollection();
         foreach ($languages as $language)
         {
             foreach ($gallery_i18n_list as $gallery_i18n)
             {
                 $item=new SiteGalleryI18n();
                 $item->set('lang',$language);
                 $item->copyFromGalleryI18n($gallery_i18n);
                 $site_gallery_i18n_collection[$item->get('lang')."_".$item->get('gallery_id')]=$item;
             }    
         }
         $site_gallery_i18n_collection->removeDouble();   // Remove double
         $site_gallery_i18n_collection->save();
         
         // get I18N pictures of galleries
         $db=mfSiteDatabase::getInstance()
          ->setParameters(array('lang'=>$gallery_i18n_list->getFirst()->get('lang')))          
          ->setQuery("SELECT ".SitePictureI18n::getFieldsAndKeyWithTable()." FROM ".SitePictureI18n::getTable().   
                     " INNER JOIN ".SitePictureGallery::getTable()." ON ".SitePictureGallery::getTableField('picture_id')."=".SitePictureI18n::getTableField('picture_id').   
                     " WHERE site_gallery_id IN('".$gallery_i18n_list->getKeys()->implode("','")."') AND lang='{lang}'".
                     ";")
          ->makeSqlQuery();  
          if (!$db->getNumRows())
             return ;
          $picture_i18n_list=new mfArray();
          while ($item=$db->fetchObject('SitePictureI18n'))
             $picture_i18n_list[$item->get('picture_id')]=$item->loaded();
         // Create pictures
         $picture_i18n_collection=new SitePictureI18nCollection();
         foreach ($languages as $language)
         {
             foreach ($picture_i18n_list as $picture_i18n)
             {
                 $item=new SitePictureI18n();
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

