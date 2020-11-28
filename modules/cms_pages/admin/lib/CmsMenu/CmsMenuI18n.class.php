<?php

class CmsMenuI18n extends CmsMenuI18nBase {
    
    
    function getMenuAndPageI18n()
    {
        $db=mfSiteDatabase::getInstance()
           ->setObjects(array('cmsMenu','cmsI18nMenu','cmsPage','cmsI18nPage'))
           ->setParameters(array('menu_id'=>$this->get('menu_id'),"lang"=>$this->get('lang')))
           ->setQuery("SELECT {fields} FROM ".CmsMenu::getTable().
                      " LEFT JOIN ".CmsMenuI18n::getInnerForJoin('menu_id')." AND ".CmsMenuI18n::getTableField('lang')."='{lang}'".
                      " LEFT JOIN ".CmsMenu::getOuterForJoin('page_id').
                      " LEFT JOIN ".CmsPageI18n::getInnerForJoin('page_id')." AND ".CmsPageI18n::getTableField('lang')."='{lang}'".
                      " WHERE ".CmsMenu::getTableField('id')."={menu_id};")
           ->makeSiteSqlQuery($this->getSite());  
        if (!$db->getNumRows())
            return null;
        while ($row=$db->fetchObjects())
        {           
            $this->set('menu_id',$row->getCmsMenu());           
            if ($row->hasCmsPage())
            {
               $this->getCmsMenu()->set('page_id',$row->getCmsPage());
               if ($row->hasCmsPageI18n())
               {
                   $row->getCmsPage()->setCmsPageI18n($row->getCmsI18nPage());
               } 
               else
               {
                   $row->getCmsPage()->setCmsPageI18n(new CmsPageI18n(null,$this->getSite())); 
                   $row->getCmsPage()->getCmsPageI18n()->set('lang',$this->get('lang'));
               }    
            } 
            else
            {
                $this->getCmsMenu()->set('page_id',new cmsPage(null,$this->getSite()));
                $this->getCmsMenu()->getCmsPage()->setCmsI18nPage(new CmsPageI18n(null,$this->getSite())); 
                $this->getCmsMenu()->getCmsPage()->getCmsI18nPage()->set('lang',$this->get('lang'));
            }    
        }        
    }
    
    function isEmpty()
    {
        return ($this->get('target')=='' && $this->get('is_link')=='YES' && $this->get('picture')=="" && $this->get('icon')=="");            
    }
    
}

