<?php


class EmployeeSearchCityLetter extends mfString {
    
    
    
     function getUrl()
    {
       return link_i18n('employees_search_city_letter',array('letter'=> $this->getValue()),null,'frontend');
    }
    
    
     static function getLetters()
    {     
        $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setQuery("SELECT UPPER(SUBSTRING(".Employee::getTableField('city').",1,1)) as letter FROM ".Employee::getTable().                                      
                       " WHERE ".Employee::getTableField('is_active')."='YES' ". 
                                " AND ".Employee::getTableField('is_validated')."='YES'".                               
                                " AND ".Employee::getTableField('is_completed')."='YES'".                               
                       " GROUP BY letter".
                       " ORDER BY letter ASC ".
                       ";")
            ->makeSqlQuery();    
        // echo $db->getquery();
          if (!$db->getNumRows())
            return $list;       
         while ($row=$db->fetchRow())
        {          
            $list[]= new EmployeeSearchCityLetter($row[0]);
        }                   
        return $list;
    }
    
       static function getCitiesByLetter($letter)
    {              
         $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('letter'=>$letter))
             ->setQuery( "SELECT city FROM ".Employee::getTable().                                
                       " WHERE ".Employee::getTableField('is_active')."='YES' ". 
                                " AND ".Employee::getTableField('is_validated')."='YES'".                               
                                " AND ".Employee::getTableField('is_completed')."='YES'".   
                                " AND ".Employee::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '{letter}%%'".
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
