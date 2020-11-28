<?php

class CmsPageI18nUtilsBase {
    
    
    static function getLanguages()
    {
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT DISTINCT(lang) FROM ".CmsPageI18n::getTable().";")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return array();
        $languages=array();
        while ($language=$db->fetchArray())
        { 
            $languages[$language['lang']]=$language['lang'];
        }      
        
        return $languages;
    }
    
    static function getPageByUrlandLang($url,$lang)
    {
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array($url,$lang))
            ->setQuery("SELECT ".CmsPageI18n::getFieldsAndKeyWithTable().
                        " FROM ".CmsPage::getTable().
                        " LEFT JOIN ".CmsPageI18n::getInnerForJoin('page_id').
                        " WHERE url='%s' AND lang='%s' AND ".CmsPage::getTableField('is_active')."='YES' ".
                        ";")  // @TODO mettre date start et date expiration
            ->makeSiteSqlQuery(); 
        if (!$db->getNumRows())
            return null;
        return $db->fetchObject('CmsPageI18n')->loaded();        
    }
    
    static function getPageByNameAndLang($name,$lang)
    {
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array($name,$lang))
            ->setQuery("SELECT ".CmsPageI18n::getFieldsAndKeyWithTable().
                       " FROM ".CmsPage::getTable().
                       " LEFT JOIN ".CmsPageI18n::getInnerForJoin('page_id').
                       " WHERE name='%s' AND lang='%s' AND ".CmsPage::getTableField('is_active')."='YES' ".
                       ";")  // @TODO mettre date start et date expiration
            ->makeSiteSqlQuery(); 
        if (!$db->getNumRows())
            return null;
        return $db->fetchObject('CmsPageI18n')->loaded();        
    }
    
    
    static function getPagesI18nForSelect()
    {
        $list=new mfArray();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>mfContext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT ".CmsPageI18n::getFieldsAndKeyWithTable().
                        " FROM ".CmsPage::getTable().
                        " LEFT JOIN ".CmsPageI18n::getInnerForJoin('page_id').
                        " WHERE  lang='{lang}' AND ".CmsPageI18n::getTableField('is_active')."='YES' ".
                        ";")  // @TODO mettre date start et date expiration
            ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $list;        
        while ($item=$db->fetchObject('CmsPageI18n'))   
        { 
            $list[$item->get('id')]=$item->get('meta_title');
        }      
        return $list;         
    }
    
 }
 
 