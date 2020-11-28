<?php


class EmployeeSearchUserLanguageLetter extends mfString {
             
    
     function getUrl()
    {
       return link_i18n('employees_search_user_language_letter',array('letter'=> $this->getValue()),null,'frontend');
    }
    
    
     static function getLetters()
    {     
        $list=new EmployeeSearchUserLanguageLetterCollection();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT UPPER(SUBSTRING(".SiteLanguageI18n::getTableField('title').",1,1)) as letter FROM ".Employee::getTable().                        
                       " INNER JOIN ".EmployeeUserLanguage::getInnerForJoin('employee_user_id'). 
                       " INNER JOIN ".SiteLanguageI18n::getTable()." ON ".SiteLanguageI18n::getTableField('code')."=".EmployeeUserLanguage::getTableField('lang').
                       " WHERE ".Employee::getTableField('is_active')."='YES' ". 
                                " AND ".Employee::getTableField('is_validated')."='YES'".                               
                                " AND ".Employee::getTableField('is_completed')."='YES'".  
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
            $list[]= new EmployeeSearchUserLanguageLetter($row[0]);
        }                   
        return $list->asort();
    }
    
       static function getLanguagesByLetter($letter)
    {              
        $list=new EmployeeSearchUserLanguageLetterCollection();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('letter'=>strtolower($letter),'lang'=>mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT ".EmployeeUserLanguage::getTableField('lang')." as lang FROM ".Employee::getTable().   
                       " INNER JOIN ".EmployeeUserLanguage::getInnerForJoin('employee_user_id'). 
                       " INNER JOIN ".SiteLanguageI18n::getTable()." ON ".SiteLanguageI18n::getTableField('code')."=".EmployeeUserLanguage::getTableField('lang').
                       " WHERE ".SiteLanguageI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '{letter}%%'".
                                " AND ".Employee::getTableField('is_validated')."='YES'".                               
                                " AND ".Employee::getTableField('is_completed')."='YES'".   
                                " AND ".SiteLanguageI18n::getTableField('lang')."='{lang}'".
                       " GROUP BY ".EmployeeUserLanguage::getTableField('lang').   
                       " ORDER BY ".SiteLanguageI18n::getTableField('title')." ASC".
                       ";")
            ->makeSqlQuery();   
         //echo $db->getQuery();
          if (!$db->getNumRows())
            return $list;       
         while ($row=$db->fetchRow())           
            $list[$row[0]]= new LanguageFormatter($row[0]);     
        return $list;
    }
    
    
}
