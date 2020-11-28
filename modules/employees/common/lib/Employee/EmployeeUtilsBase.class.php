<?php


class EmployeeUtilsBase {
    
        
    
    static function getUserByEmail($email)
    {         
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('email'=>$email))
            ->setQuery("SELECT * FROM ".Employee::getTable().
                       " WHERE email='{email}' LIMIT 0,1;")
            ->makeSqlQuery();   
          if (!$db->getNumRows())
            return null;       
        return $db->fetchObject('Employee')->loaded();
    }
    
  
    
     static function getPopulars($lang,$options=array())
    {       
        $list= new EmployeeCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>$lang))
            ->setObjects(array('Employee','EmployeeContent','EmployeeContentI18n'))
            ->setQuery("SELECT {fields} FROM ".Employee::getTable().                       
                       " LEFT JOIN ".EmployeeContent::getInnerForJoin('employee_user_id').
                       " LEFT JOIN ".EmployeeContentI18n::getInnerForJoin('content_id')." AND ".EmployeeContentI18n::getTableField('lang')."='{lang}'".                      
                       " WHERE  ".Employee::getTableField('is_validated')."='YES' ". 
                            " AND ".Employee::getTableField('is_active')."='YES' ". 
                            " AND ".Employee::getTableField('status')."='ACTIVE' ".
                            " AND ".Employee::getTableField('is_completed')."='YES'".
                    
                       " ORDER BY ranking DESC ".
                       " LIMIT 0,10;")
            ->makeSqlQuery();   
       // echo $db->getQuery();
        if (!$db->getNumRows())
            return $list; 
         while ($items = $db->fetchObjects()) 
       {                                      
            $item=$items->getEmployee();                   
            $item->set('content',$items->hasEmployeeContent()?$items->getEmployeeContent():false);   
            if ($item->hasContent())
                $item->getContent()->setI18n($items->hasEmployeeContentI18n()?$items->getEmployeeContentI18n():false);
            $list[$item->get('id')]=$item;               
       }        
        return $list;
    }
    
    
   
}

