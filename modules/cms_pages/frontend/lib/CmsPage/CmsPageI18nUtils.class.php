<?php


class CmsPageI18nUtils extends CmsPageI18nUtilsBase {
    
          
    static function search($query,$lang)
    {
         if (!$query)
            return array();       
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('q'=>$query,'lang'=>$lang))
            ->setQuery("SELECT * FROM ".CmsPageI18n::getTable().                    
                       " WHERE lang='{lang}'".
                       " AND url!=''".
                       " AND ".CmsPageI18n::getTableField('is_active')."='YES' AND (".
                       " meta_title LIKE '%%%%{q}%%%%' OR".
                       " meta_description LIKE '%%%%{q}%%%%' OR".
                       " content LIKE '%%%%{q}%%%%'".                       
                       ");")  // @TODO mettre date start et date expiration
            ->makeSqlQuery();              
        if (!$db->getNumRows())
            return array();
        $collection=new CmsPageI18nCollection();
        while ($item=$db->fetchObject('CmsPageI18n'))
        {
            $collection[]=$item;
        }        
        return $collection;
    }
    
    static function getOrpholinPages($lang)
    {
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>$lang))
            ->setQuery("SELECT * FROM ".CmsPageI18n::getTable().                    
                       " LEFT JOIN ".CmsPageI18n::getOuterForJoin('page_id').                       
                       " LEFT JOIN ".cmsMenu::getInnerForJoin('page_id').                      
                       " LEFT JOIN ".cmsBlockPage::getInnerForJoin('page_id').
                       " WHERE lang='{lang}'".
                                " AND ".cmsMenu::getTableField('page_id')." IS NULL".
                                " AND ".cmsBlockPage::getTableField('page_id')." IS NULL".
                                " AND ".cmsPage::getTableField('name')."=''".
                       ";")
                ->makeSqlQuery();              
        if (!$db->getNumRows())
            return array();
        $pages=array();
        while ($page=$db->fetchObject('CmsPageI18n'))
        {
            $pages[]=$page;
        }        
        return $pages;
    }
    
    static function getSitemap()
    {
        $db=mfSiteDatabase::getInstance()           
            ->setQuery("SELECT * FROM ".CmsPageI18n::getTable().                                          
                       " WHERE is_active='YES' AND url NOT IN('','#');". 
                    // @TODO mettre date start et date expiration                                
                       ";")
                ->makeSqlQuery();              
        if (!$db->getNumRows())
            return array();
        $pages=array();
        while ($page=$db->fetchObject('CmsPageI18n'))
        {
            $pages[]=$page;
        }        
        return $pages;
    }
    
    static function getPagesByNameAndLang($names,$lang)
    {
        
        if (!$names)
            return array();
           
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array($lang))
            ->setObjects(array('cmsPage','CmsPageI18n'))
            ->setQuery("SELECT {fields} FROM ".CmsPageI18n::getTable().
                       " LEFT JOIN ".CmsPageI18n::getOuterForJoin('page_id')." AND lang='%s' ".
                       " WHERE name IN('".implode("','",(array)$names)."') ".
                      // " AND ".CmsPageI18n::getTableField('id')." IS NOT NULL".
                       " AND ".CmsPageI18n::getTableField('is_active')."='YES'".
                       " ;")  // @TODO mettre date start et date expiration
            ->makeSqlQuery(); 
      
        if (!$db->getNumRows())
            return null;
        $pages=array();
        while ($items=$db->fetchObjects())
        {
            $item=$items->getCmsPageI18n();
            $item->set('page_id',$items->getCmsPage());
            $pages[]=$item;
        }                  
        return $pages;
    }
}

