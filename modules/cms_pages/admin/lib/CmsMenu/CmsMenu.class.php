<?php

class CmsMenu extends CmsMenuBase {
    
     protected $children_i18n=array();
    
     function getChildrenI18n($lang)
     {                
         if ($this->isNotLoaded())
             return array();
         if (!$this->children_i18n)
         {                
            $db = mfSiteDatabase::getInstance();
            $db->setParameters(array('lang'=>$lang,'lb'=>$this->get('lb'),'rb'=>$this->get('rb')));
            $db->setObjects(array('CmsMenu','CmsPage','CmsMenuI18n','CmsPageI18n'));
            $db->setQuery("SELECT {fields} FROM ".CmsMenu::getTable().
                          " LEFT JOIN ".CmsMenuI18n::getInnerForJoin('menu_id'). 
                                " AND ".cmsMenuI18n::getTableField('lang')."='{lang}'".
                          " LEFT JOIN ".CmsPage::getTable()." ON ".CmsPage::getTableField('id')."=".CmsMenu::getTableField('page_id').
                          " LEFT JOIN ".CmsPageI18n::getInnerForJoin('page_id').
                                " AND ".CmsPageI18n::getTableField('lang')."='{lang}'". 
                          " WHERE lb>={lb} AND rb<={rb}".
                          " ORDER BY lb ASC;");
            $db->makeSqlQuery();
            $tree=$db->fetchTreeObjects(get_class($this));              
            $this->children_i18n= $tree->_getChildren(); 
         }
         return $this->children_i18n;
     } 
               
}

