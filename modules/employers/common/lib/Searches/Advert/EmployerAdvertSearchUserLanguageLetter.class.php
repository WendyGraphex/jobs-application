<?php


class EmployerAdvertSearchUserLanguageLetter extends mfString {
    
   
     function getUrl()
    {
       return link_i18n('employers_search_advert_user_language_letter',array('letter'=> $this->getValue()),null,'frontend');
    }
    
    
     static function getLetters()
    {     
        $list=new EmployerAdvertSearchUserLanguageLetterCollection();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT UPPER(SUBSTRING(".SiteLanguageI18n::getTableField('title').",1,1)) as letter FROM ".EmployerUser::getTable().      
                       " INNER JOIN ".EmployerUserLanguage::getInnerForJoin('employer_user_id'). 
                       " INNER JOIN ".SiteLanguageI18n::getTable()." ON ".SiteLanguageI18n::getTableField('code')."=".EmployerUserLanguage::getTableField('lang').
                       " WHERE ".EmployerUser::getTableField('is_active')."='YES' ". 
                                " AND ".EmployerUser::getTableField('is_validated')."='YES'".                               
                                " AND ".EmployerUser::getTableField('is_completed')."='YES'".                             
                                " AND ".SiteLanguageI18n::getTableField('lang')."='{lang}'".
                       " GROUP BY letter ".                     
                       " ORDER BY letter ".                      
                       ";")
            ->makeSqlQuery();         
        // echo $db->getQuery();
          if (!$db->getNumRows())
            return $list;       
         while ($row=$db->fetchRow())
        {          
            $list[]= new EmployerAdvertSearchUserLanguageLetter($row[0]);
        }                   
        return $list->asort();
    }
    
       static function getLanguagesByLetter($letter)
    {              
        $list=new EmployerAdvertSearchUserLanguageLetterCollection();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('letter'=>strtolower($letter),'lang'=>mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT ".EmployerUserLanguage::getTableField('lang')." as lang FROM ".EmployerUser::getTable().   
                       " INNER JOIN ".EmployerUserLanguage::getInnerForJoin('employer_user_id'). 
                       " INNER JOIN ".SiteLanguageI18n::getTable()." ON ".SiteLanguageI18n::getTableField('code')."=".EmployerUserLanguage::getTableField('lang').
                        " WHERE ".SiteLanguageI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '{letter}%%'".
                                " AND ".EmployerUser::getTableField('is_validated')."='YES'".                               
                                " AND ".EmployerUser::getTableField('is_completed')."='YES'".   
                                " AND ".SiteLanguageI18n::getTableField('lang')."='{lang}'".
                       " GROUP BY ".EmployerUserLanguage::getTableField('lang').  
                       " ORDER BY ".SiteLanguageI18n::getTableField('title')." ASC".
                       ";")
            ->makeSqlQuery();   
       //  echo $db->getQuery();
          if (!$db->getNumRows())
            return $list;       
         while ($row=$db->fetchRow())           
            $list[$row[0]]= new LanguageFormatter($row[0]);     
        return $list;
    }
    
    
}
