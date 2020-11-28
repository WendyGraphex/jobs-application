<?php


class EmployerAdvertSearchCountryLetter extends mfString {
    
      
  
    
     function getUrl()
    {
       return link_i18n('employers_search_advert_country_letter',array('letter'=> $this->getValue()),null,'frontend');
    }
    
    
     static function getLetters()
    {     
        $list=new EmployerAdvertSearchCountryLetterCollection();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT UPPER(SUBSTRING(".SiteCountryI18n::getTableField('title').",1,1)) as letter FROM ".EmployerUser::getTable().  
                       " LEFT JOIN ".EmployerUser::getOuterForJoin('company_id').   
                       " INNER JOIN ".SiteCountryI18n::getTable()." ON ".SiteCountryI18n::getTableField('code')."=".EmployerUser::getTableField('country')." OR ".
                                                                          SiteCountryI18n::getTableField('code')."=".EmployerCompany::getTableField('country').
                       " INNER JOIN ".EmployerAdvert::getInnerForJoin('employer_user_id').
                       " INNER JOIN ".EmployerAdvertI18n::getInnerForJoin('advert_id').
                       " WHERE ".EmployerUser::getTableField('is_active')."='YES' ". 
                                " AND ".EmployerUser::getTableField('is_validated')."='YES'".                               
                                " AND ".EmployerUser::getTableField('is_completed')."='YES'".  
                                " AND ".EmployerAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                 
                                " AND ".EmployerAdvertI18n::getTableField('status')."='ACTIVE'".
                                " AND ".SiteCountryI18n::getTableField('lang')."='{lang}'".
                        " GROUP BY letter".   
                       " ORDER BY letter".                     
                       ";")
            ->makeSqlQuery();         
          if (!$db->getNumRows())
            return $list;       
         while ($row=$db->fetchRow())
        {          
            $list[]= new EmployerAdvertSearchCountryLetter($row[0]);
        }                   
        return $list->asort();
    }
    
       static function getCountriesByLetter($letter)
    {              
        $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('letter'=>$letter,'lang'=>mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT ".SiteCountryI18n::getTableField('code')." as `country` FROM ".EmployerUser::getTable().  
                       " LEFT JOIN ".EmployerUser::getOuterForJoin('company_id').   
                       " INNER JOIN ".EmployerAdvert::getInnerForJoin('employer_user_id').
                       " INNER JOIN ".EmployerAdvertI18n::getInnerForJoin('advert_id').
                       " INNER JOIN ".SiteCountryI18n::getTable()." ON ".SiteCountryI18n::getTableField('code')."=".EmployerUser::getTableField('country')." OR ".
                                                                          SiteCountryI18n::getTableField('code')."=".EmployerCompany::getTableField('country').
                       " WHERE ".SiteCountryI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '{letter}%%'".                     
                                " AND ".EmployerAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                 
                                " AND ".EmployerAdvertI18n::getTableField('status')."='ACTIVE'".
                       " GROUP BY code".            
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
