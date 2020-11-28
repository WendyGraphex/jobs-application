<?php


class cmsBlockUtils { 
    
    
    static function getBlockByNameAndCountry($name,$lang)
    {
        if ($name=="" || $lang=="")
            return null;
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array($name,$lang))
            ->setQuery("SELECT t_cms_i18n_pages.id,t_cms_i18n_pages.url,t_cms_i18n_pages.meta_title,target".
                       " FROM ".cmsBlock::getTable().                                                     
                       " LEFT JOIN ".cmsBlockPage::getInnerForJoin('block_id').                         
                       " LEFT JOIN ".cmsBlockPage::getOuterForJoin('page_id').                                                
                       " LEFT JOIN ".CmsPageI18n::getInnerForJoin('page_id').
                       " WHERE ".cmsBlock::getTableField('name')."='%s' AND ".CmsPageI18n::getTableField('lang')."='%s'".                            
                            " AND ".cmsBlockPage::getTableField('is_active')."='YES'".
                            " AND (start_at<=NOW() OR start_at IS NULL)".
                            " AND (expired_at>=NOW() OR expired_at IS NULL)".
                       " ORDER BY position".
                       ";")               
            ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return null;
        $pages=array();
        while ($page=$db->fetchObject('CmsPageI18n'))
        {
          $pages[]=$page;  
        }                
        return $pages;
    }
    
    static function getPagesInBlocks($lang)
    {
       $db=mfSiteDatabase::getInstance()
            ->setParameters(array("lang"=>$lang))
            ->setQuery("SELECT t_cms_i18n_pages.id,t_cms_i18n_pages.url,t_cms_i18n_pages.meta_title,target".
                       " FROM ".cmsBlock::getTable().                                                     
                       " LEFT JOIN ".cmsBlockPage::getInnerForJoin('block_id').                         
                       " LEFT JOIN ".cmsBlockPage::getOuterForJoin('page_id').                                                
                       " LEFT JOIN ".CmsPageI18n::getInnerForJoin('page_id').
                       " WHERE ".CmsPageI18n::getTableField('lang')."='{lang}'".
                            " AND (start_at<=NOW() OR start_at IS NULL) AND (expired_at>=NOW() OR expired_at IS NULL)".
                            " AND ".cmsBlockPage::getTableField('is_active')."='YES'".                           
                       " ORDER BY ".cmsBlock::getTableField('name')." ASC, position ASC".
                       ";")               
            ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return null;
        $pages=array();
        while ($page=$db->fetchObject('CmsPageI18n'))
        {
          $pages[]=$page;  
        }                
        return $pages; 
    }
}

