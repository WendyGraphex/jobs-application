<?php


class CustomerAcademyStudentUserUtilsBase {
    
        
    
    static function getUserByEmail($email)
    {         
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('email'=>$email))
            ->setQuery("SELECT * FROM ".CustomerAcademyStudentUser::getTable().
                       " WHERE email='{email}' LIMIT 0,1;")
            ->makeSqlQuery();            
          if (!$db->getNumRows())
            return null;       
        return $db->fetchObject('CustomerAcademyStudentUser')->loaded();
    }
    
  
   /* static function getPopulars($lang,$options=array())
    {       
        $list= new CustomerAcademyStudentUserCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>$lang))
            ->setObjects(array('CustomerAcademyStudentUser','SiteEventCompany','SiteEventContent','SiteEventContentI18n'))
            ->setQuery("SELECT {fields} FROM ".CustomerAcademyStudentUser::getTable().                       
                       " LEFT JOIN ".SiteEventContent::getInnerForJoin('employer_user_id').
                       " LEFT JOIN ".SiteEventContentI18n::getInnerForJoin('content_id')." AND ".SiteEventContentI18n::getTableField('lang')."='{lang}'".
                       " LEFT JOIN ".CustomerAcademyStudentUser::getOuterForJoin('company_id').
                       " WHERE  ".CustomerAcademyStudentUser::getTableField('is_validated')."='YES' ". 
                            " AND ".CustomerAcademyStudentUser::getTableField('is_active')."='YES' ". 
                            " AND ".CustomerAcademyStudentUser::getTableField('status')."='ACTIVE' ".
                    //        " AND ".CustomerAcademyStudentUser::getTableField('is_completed')."='YES'".
                    
                       " ORDER BY ranking DESC ".
                       " LIMIT 0,10;")
            ->makeSqlQuery();   
       // echo $db->getQuery();
        if (!$db->getNumRows())
            return $list; 
         while ($items = $db->fetchObjects()) 
       {                                      
            $item=$items->getCustomerAcademyStudentUser();             
            $item->set('company_id',$items->hasSiteEventCompany()?$items->getSiteEventCompany():false);                  
            $item->set('content',$items->hasSiteEventContent()?$items->getSiteEventContent():false);   
            if ($item->hasContent())
                $item->getContent()->setI18n($items->hasSiteEventContentI18n()?$items->getSiteEventContentI18n():false);
            $list[$item->get('id')]=$item;               
       }        
        return $list;
    }*/
     
}

