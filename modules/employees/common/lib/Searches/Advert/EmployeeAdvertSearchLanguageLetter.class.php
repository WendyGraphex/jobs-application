<?php


class EmployeeAdvertSearchLanguageLetter extends mfString {
    
      
   
     function getUrl()
    {
       return link_i18n('employees_search_advert_language_letter',array('letter'=> $this->getValue()),null,'frontend');
    }
    
    
     static function getLetters()
    {     
        $list=new EmployeeAdvertSearchLanguageLetterCollection();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT UPPER(SUBSTRING(".SiteLanguageI18n::getTableField('title').",1,1)) as letter FROM ".EmployeeAdvertI18n::getTable().      
                       " INNER JOIN ".EmployeeAdvertI18n::getOuterForJoin('advert_id'). 
                       " INNER JOIN ".EmployeeAdvert::getOuterForJoin('employee_user_id'). 
                       " INNER JOIN ".SiteLanguageI18n::getTable()." ON ".SiteLanguageI18n::getTableField('code')."=".EmployeeAdvertI18n::getTableField('lang').
                       " WHERE ".Employee::getTableField('is_active')."='YES' ". 
                                " AND ".Employee::getTableField('is_validated')."='YES'".                               
                                " AND ".Employee::getTableField('is_completed')."='YES'".  
                                " AND ".EmployeeAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                 
                                " AND ".EmployeeAdvertI18n::getTableField('status')."='ACTIVE'".
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
            $list[]= new EmployeeAdvertSearchLanguageLetter($row[0]);
        }                   
        return $list->asort();
    }
    
       static function getLanguagesByLetter($letter)
    {              
        $list=new EmployeeAdvertSearchLanguageLetterCollection();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('letter'=>strtolower($letter),'lang'=>mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT ".EmployeeAdvertI18n::getTableField('lang')." as lang FROM ".EmployeeAdvertI18n::getTable().      
                       " INNER JOIN ".EmployeeAdvertI18n::getOuterForJoin('advert_id'). 
                       " INNER JOIN ".EmployeeAdvert::getOuterForJoin('employee_user_id'). 
                       " INNER JOIN ".SiteLanguageI18n::getTable()." ON ".SiteLanguageI18n::getTableField('code')."=".EmployeeAdvertI18n::getTableField('lang').
                       " WHERE ".SiteLanguageI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '{letter}%%'".
                                " AND ".Employee::getTableField('is_active')."='YES' ". 
                                " AND ".Employee::getTableField('is_validated')."='YES'".                               
                                " AND ".Employee::getTableField('is_completed')."='YES'".  
                                " AND ".EmployeeAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                 
                                " AND ".EmployeeAdvertI18n::getTableField('status')."='ACTIVE'".                                 
                       " GROUP BY ".EmployeeAdvertI18n::getTableField('lang').
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
