<?php


class EmployerSearchCountryLetter extends mfString {
             
    
     function getUrl()
    {
       return link_i18n('employers_search_country_letter',array('letter'=> $this->getValue()),null,'frontend');
    }
    
    
     static function getLetters()
    {     
        $list=new EmployerSearchCountryLetterCollection();
         $db=mfSiteDatabase::getInstance()
             ->setParameters(array('lang'=>mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT UPPER(SUBSTRING(".SiteCountryI18n::getTableField('title').",1,1)) as letter FROM ".EmployerUser::getTable().    
                       " LEFT JOIN ".EmployerUser::getOuterForJoin('company_id').   
                       " INNER JOIN ".SiteCountryI18n::getTable()." ON ".SiteCountryI18n::getTableField('code')."=".EmployerUser::getTableField('country')." OR ".
                                                                          SiteCountryI18n::getTableField('code')."=".EmployerCompany::getTableField('country').
                       " WHERE ".EmployerUser::getTableField('is_active')."='YES' ". 
                                " AND ".EmployerUser::getTableField('is_validated')."='YES'".                               
                                " AND ".EmployerUser::getTableField('is_completed')."='YES'".  
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
            $list[]= new EmployerSearchCountryLetter($row[0]);
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
                       " INNER JOIN ".SiteCountryI18n::getTable()." ON ".SiteCountryI18n::getTableField('code')."=".EmployerUser::getTableField('country')." OR ".
                                                                         SiteCountryI18n::getTableField('code')."=".EmployerCompany::getTableField('country').
                       " WHERE ".SiteCountryI18n::getTableField('title')." COLLATE UTF8_GENERAL_CI LIKE '{letter}%%'".
                       " GROUP BY code".                
                       " ORDER BY ".SiteCountryI18n::getTableField('title')." ASC".
                       ";")
            ->makeSqlQuery();   
        // echo $db->getQuery();
          if (!$db->getNumRows())
            return $list;       
         while ($row=$db->fetchArray())           
            $list[$row['country']]= new CountryFormatter($row['country']);     
        return $list;
    }
    
    
}
