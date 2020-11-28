<?php

class CustomerAcademyCourseI18nUtils {
    
    
     static function getFormattedLanguagesForSelect()
    {
          $languages=new mfArray();   
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT lang FROM ".CustomerAcademyCourseI18n::getTable().
                           " GROUP BY lang".
                           ";")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return  $languages;      
        while ($row=$db->fetchArray())
        {          
            $languages[$row['lang']]= ucfirst(format_language($row['lang']));
        }               
        return $languages->asort();
    }
    
    
     static function getLevelsForSelect()
    {
          $languages=new mfArray();   
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('lang'=>mfContext::getInstance()->getUser()->getLanguage()))
                ->setQuery("SELECT ".CustomerAcademyLevelI18n::getFieldsAndKeyWithTable()." FROM ".CustomerAcademyCourseI18n::getTable().
                           " INNER JOIN ".CustomerAcademyCourseI18n::getOuterForJoin('level_id').
                           " INNER JOIN ".CustomerAcademyLevelI18n::getInnerForJoin('level_id').
                           " WHERE ".CustomerAcademyLevelI18n::getTableField('lang')."='{lang}'".
                           " GROUP BY level_id".
                           ";")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return  $languages;      
        while ($item=$db->fetchObject('CustomerAcademyLevelI18n'))
        {          
            $languages[$item->get('level_id')]=(string) $item;
        }               
        return $languages->asort();
    }
}
