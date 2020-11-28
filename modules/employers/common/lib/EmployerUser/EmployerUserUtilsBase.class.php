<?php


class EmployerUserUtilsBase {
    
        
    
    static function getUserByEmail($email)
    {         
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('email'=>$email))
            ->setQuery("SELECT * FROM ".EmployerUser::getTable().
                       " WHERE email='{email}' LIMIT 0,1;")
            ->makeSqlQuery();   
          if (!$db->getNumRows())
            return null;       
        return $db->fetchObject('EmployerUser')->loaded();
    }
    
  
    static function getPopulars($lang,$options=array())
    {       
        $list= new EmployerUserCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>$lang))
            ->setObjects(array('EmployerUser','EmployerCompany','EmployerContent','EmployerContentI18n'))
            ->setQuery("SELECT {fields} FROM ".EmployerUser::getTable().                       
                       " LEFT JOIN ".EmployerContent::getInnerForJoin('employer_user_id').
                       " LEFT JOIN ".EmployerContentI18n::getInnerForJoin('content_id')." AND ".EmployerContentI18n::getTableField('lang')."='{lang}'".
                       " LEFT JOIN ".EmployerUser::getOuterForJoin('company_id').
                       " WHERE  ".EmployerUser::getTableField('is_validated')."='YES' ". 
                            " AND ".EmployerUser::getTableField('is_active')."='YES' ".                     
                            " AND ".EmployerUser::getTableField('status')."='ACTIVE' ".
                            " AND ".EmployerUser::getTableField('is_completed')."='YES'".
                    
                       " ORDER BY ranking DESC ".
                       " LIMIT 0,10;")
            ->makeSqlQuery();   
       // echo $db->getQuery();
        if (!$db->getNumRows())
            return $list; 
         while ($items = $db->fetchObjects()) 
       {                                      
            $item=$items->getEmployerUser();             
            $item->set('company_id',$items->hasEmployerCompany()?$items->getEmployerCompany():false);                  
            $item->set('content',$items->hasEmployerContent()?$items->getEmployerContent():false);   
            if ($item->hasContent())
                $item->getContent()->setI18n($items->hasEmployerContentI18n()?$items->getEmployerContentI18n():false);
            $list[$item->get('id')]=$item;               
       }        
        return $list;
    }
     
}

