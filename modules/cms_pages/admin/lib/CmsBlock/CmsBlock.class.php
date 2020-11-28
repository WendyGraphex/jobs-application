<?php

class CmsBlock extends cmsBlockBase  {
   
    protected  $collection=null;
    
    function getPageI18nCollection($lang)
    {
         $this->_collection=array();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array("lang"=>$lang,"id"=>$this->get('id')))
            ->setObjects(array('CmsBlockPage','CmsPageI18n','CmsPage'))
            ->setQuery("SELECT {fields} FROM ".CmsBlockPage::getTable().
                       " LEFT JOIN ".CmsBlockPage::getOuterForJoin('block_id').   
                       " LEFT JOIN ".CmsBlockPage::getOuterForJoin('page_id').   
                       " LEFT JOIN ".CmsPageI18n::getInnerForJoin('page_id')." AND lang='{lang}'".                    
                       " WHERE ".CmsBlockPage::getTableField('block_id')."={id} ORDER BY position ASC;"
                       )
            ->makeSiteSqlQuery($this->getSite()); 
        if (!$db->getNumRows())
            return null; 
        while ($item=$db->fetchObjects())
        {
            $item->site=$this->getSite();
            $this->collection[]=$item;
        }        
        return $this->collection;
    }
    
}

