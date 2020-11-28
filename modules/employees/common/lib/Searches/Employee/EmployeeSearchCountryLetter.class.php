<?php


class EmployeeSearchCountryLetter extends mfString {
    
    
     function getUrl()
    {
       return link_i18n('employees_search_country_letter',array('letter'=> $this->getValue()),null,'frontend');
    }
    
    
     static function getLetters()
    {     
        $list=new EmployeeSearchCountryLetterCollection();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT UPPER(SUBSTRING(".Employee::getTableField('country').",1,1)) as letter FROM ".Employee::getTable().   
                       " INNER JOIN ".SiteCountryI18n::getTable()." ON ".SiteCountryI18n::getTableField('code')."=".Employee::getTableField('country').
                       " WHERE ".Employee::getTableField('is_active')."='YES' ". 
                                " AND ".Employee::getTableField('is_validated')."='YES'".                               
                                " AND ".Employee::getTableField('is_completed')."='YES'".  
                                " AND ".SiteCountryI18n::getTableField('lang')."='{lang}'".
                       " GROUP BY letter". 
                       " ORDER BY letter".
                       ";")
            ->makeSqlQuery();    
       //  echo $db->getQuery();
          if (!$db->getNumRows())
            return $list;       
         while ($row=$db->fetchRow())
        {          
            $list[]= new EmployeeSearchCountryLetter($row[0]);
        }                   
        return $list->asort();
    }
    
       static function getCountriesByLetter($letter)
    {              
        $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('letter'=>$letter,'lang'=>mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT country FROM ".Employee::getTable().                                         
                       " INNER JOIN ".SiteCountryI18n::getTable()." ON ".SiteCountryI18n::getTableField('code')."=".Employee::getTableField('country').
                       " WHERE ".SiteCountryI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '{letter}%%'".
                       " GROUP BY country".                
                       " ORDER BY ".SiteCountryI18n::getTableField('title')." ASC".
                       ";")
            ->makeSqlQuery();         
          if (!$db->getNumRows())
            return $list;       
         while ($row=$db->fetchArray())           
            $list[$row['country']]= new CountryFormatter($row['country']);     
        return $list;
    }
    
    
}
