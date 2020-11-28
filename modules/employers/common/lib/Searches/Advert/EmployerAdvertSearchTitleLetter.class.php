<?php


class EmployerAdvertSearchTitleLetter extends mfString {
    
    
    
     function getUrl()
    {
       return link_i18n('employers_search_advert_title_letter',array('letter'=> $this->getValue()),null,'frontend');
    }
    
    
     static function getLetters()
    {     
        $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array())
            ->setQuery("SELECT UPPER(SUBSTRING(".EmployerAdvertI18n::getTableField('title').",1,1)) as letter FROM ".EmployerUser::getTable().   
                      " INNER JOIN ".EmployerAdvert::getInnerForJoin('employer_user_id').
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
            $list[]= new EmployerAdvertSearchTitleLetter($row[0]);
        }    
       //  echo "<pre>"; var_dump($list);
        return $list;
    }
    
   
}
