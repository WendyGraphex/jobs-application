<?php


class EmployerAdvertSearchCityLetter extends mfString {
    
    
    
     function getUrl()
    {
       return link_i18n('employers_search_advert_city_letter',array('letter'=> $this->getValue()),null,'frontend');
    }
    
    
     static function getLetters()
    {     
        $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setQuery("SELECT UPPER(SUBSTRING(IF(".EmployerUser::getTableField('company_id')." IS NULL,".EmployerUser::getTableField('city').",".EmployerCompany::getTableField('city')."),1,1)) as letter FROM ".EmployerUser::getTable().   
                      " INNER JOIN ".EmployerAdvert::getInnerForJoin('employer_user_id').
                      " LEFT JOIN ".EmployerUser::getOuterForJoin('company_id').   
                       " INNER JOIN ".EmployerAdvertI18n::getInnerForJoin('advert_id').
                       " WHERE ".EmployerUser::getTableField('is_active')."='YES' ". 
                                " AND ".EmployerUser::getTableField('is_validated')."='YES'".                               
                                " AND ".EmployerUser::getTableField('is_completed')."='YES'".  
                     " AND ".EmployerAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                 
                                " AND ".EmployerAdvertI18n::getTableField('status')."='ACTIVE'".
                       " GROUP BY letter".
                       " ORDER BY letter ASC ".
                       ";")
            ->makeSqlQuery();    
        // echo $db->getquery();
          if (!$db->getNumRows())
            return $list;       
         while ($row=$db->fetchRow())
        {          
            $list[]= new EmployerAdvertSearchCityLetter($row[0]);
        }                   
        return $list;
    }
    
       static function getCitiesByLetter($letter)
    {              
         $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('letter'=>$letter))
             ->setQuery( "SELECT IF(".EmployerUser::getTableField('company_id')." IS NULL,".EmployerUser::getTableField('city').",".EmployerCompany::getTableField('city').") as city FROM ".EmployerUser::getTable().    
                       " INNER JOIN ".EmployerAdvert::getInnerForJoin('employer_user_id').
                       " LEFT JOIN ".EmployerUser::getOuterForJoin('company_id').   
                       " INNER JOIN ".EmployerAdvertI18n::getInnerForJoin('advert_id').
                       " WHERE ".EmployerUser::getTableField('is_active')."='YES' ". 
                                " AND ".EmployerUser::getTableField('is_validated')."='YES'".                               
                                " AND ".EmployerUser::getTableField('is_completed')."='YES'".   
                                " AND (".EmployerUser::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '{letter}%%' OR ".
                                        EmployerCompany::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '{letter}%%'".
                                       ")".
                                " AND ".EmployerAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                 
                                " AND ".EmployerAdvertI18n::getTableField('status')."='ACTIVE'".
                       " GROUP BY city".                      
                       ";")
            ->makeSqlQuery();  
         // echo $db->getQuery();
          if (!$db->getNumRows())
            return $list;       
         while ($row=$db->fetchArray())           
            $list[$letter]= ucfirst(mb_strtolower($row['city']));     
        return $list;
    }
    
    
}
