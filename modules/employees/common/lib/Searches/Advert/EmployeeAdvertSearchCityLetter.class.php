<?php


class EmployeeAdvertSearchCityLetter extends mfString {
    
    
    
     function getUrl()
    {
       return link_i18n('employees_search_advert_city_letter',array('letter'=> $this->getValue()),null,'frontend');
    }
    
    
     static function getLetters()
    {     
        $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setQuery("SELECT UPPER(SUBSTRING(".Employee::getTableField('city').",1,1)) as letter FROM ".Employee::getTable().   
                      " INNER JOIN ".EmployeeAdvert::getInnerForJoin('employee_user_id').
                       " INNER JOIN ".EmployeeAdvertI18n::getInnerForJoin('advert_id').
                       " WHERE ".Employee::getTableField('is_active')."='YES' ". 
                                " AND ".Employee::getTableField('is_validated')."='YES'".                               
                                " AND ".Employee::getTableField('is_completed')."='YES'".  
                     " AND ".EmployeeAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                 
                                " AND ".EmployeeAdvertI18n::getTableField('status')."='ACTIVE'".
                       " GROUP BY letter".
                       " ORDER BY letter ASC ".
                       ";")
            ->makeSqlQuery();    
        // echo $db->getquery();
          if (!$db->getNumRows())
            return $list;       
         while ($row=$db->fetchRow())
        {          
            $list[]= new EmployeeAdvertSearchCityLetter($row[0]);
        }                   
        return $list;
    }
    
       static function getCitiesByLetter($letter)
    {              
         $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('letter'=>$letter))
             ->setQuery( "SELECT city FROM ".Employee::getTable().    
                       " INNER JOIN ".EmployeeAdvert::getInnerForJoin('employee_user_id').
                       " INNER JOIN ".EmployeeAdvertI18n::getInnerForJoin('advert_id').
                       " WHERE ".Employee::getTableField('is_active')."='YES' ". 
                                " AND ".Employee::getTableField('is_validated')."='YES'".                               
                                " AND ".Employee::getTableField('is_completed')."='YES'".   
                                " AND ".Employee::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '{letter}%%'".
                                " AND ".EmployeeAdvertI18n::getTableField('published_at')." IS NOT NULL".                                                 
                                " AND ".EmployeeAdvertI18n::getTableField('status')."='ACTIVE'".
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
