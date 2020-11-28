<?php


class EmployerSearchCityLetter extends mfString {
    
    
    
     function getUrl()
    {
       return link_i18n('employers_search_city_letter',array('letter'=> $this->getValue()),null,'frontend');
    }
    
    //IF(".EmployerUser::getTableField('company_id')." IS NULL,".EmployerUser::getTableField('country').",".EmployerCompany::getTableField('country').") as country ".
     static function getLetters()
    {     
        $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setQuery("SELECT UPPER(SUBSTRING(IF(".EmployerUser::getTableField('company_id')." IS NULL,".EmployerUser::getTableField('city').",".EmployerCompany::getTableField('city')."),1,1)) as letter FROM ".EmployerUser::getTable().      
                       " LEFT JOIN ".EmployerUser::getOuterForJoin('company_id').   
                       " WHERE ".EmployerUser::getTableField('is_active')."='YES' ". 
                                " AND ".EmployerUser::getTableField('is_validated')."='YES'".                               
                                " AND ".EmployerUser::getTableField('is_completed')."='YES'".                               
                       " GROUP BY letter".
                       " ORDER BY letter ASC ".
                       ";")
            ->makeSqlQuery();    
        // echo $db->getquery();
          if (!$db->getNumRows())
            return $list;       
         while ($row=$db->fetchRow())
        {          
            $list[]= new EmployerSearchCityLetter($row[0]);
        }                   
        return $list;
    }
    
       static function getCitiesByLetter($letter)
    {              
         $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('letter'=>$letter))
             ->setQuery( "SELECT IF(".EmployerUser::getTableField('company_id')." IS NULL,".EmployerUser::getTableField('city').",".EmployerCompany::getTableField('city').") as city FROM ".EmployerUser::getTable().          
                       " LEFT JOIN ".EmployerUser::getOuterForJoin('company_id').   
                       " WHERE ".EmployerUser::getTableField('is_active')."='YES' ". 
                                " AND ".EmployerUser::getTableField('is_validated')."='YES'".                               
                                " AND ".EmployerUser::getTableField('is_completed')."='YES'".   
                                " AND ".EmployerUser::getTableField('city')." COLLATE UTF8_GENERAL_CI LIKE '{letter}%%'".
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
