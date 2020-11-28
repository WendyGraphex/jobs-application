<?php


class EmployeeAdvertSearchTitleLetter extends mfString {
    
    
    
     function getUrl()
    {
       return link_i18n('employees_search_advert_title_letter',array('letter'=> $this->getValue()),null,'frontend');
    }
    
    
     static function getLetters()
    {     
        $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setQuery("SELECT UPPER(SUBSTRING(".EmployeeAdvertI18n::getTableField('title').",1,1)) as letter FROM ".Employee::getTable().   
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
       //   echo $db->getquery();
          if (!$db->getNumRows())
            return $list;       
         while ($row=$db->fetchRow())
        {          
            $list[]= new EmployeeAdvertSearchTitleLetter($row[0]);
        }                    
        return $list;
    }
    
    
}
