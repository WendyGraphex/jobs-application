<?php


class CustomerAcademyTeacherUserUtilsBase {
    
        
    
    static function getUserByEmail($email)
    {         
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('email'=>$email))
            ->setQuery("SELECT * FROM ".CustomerAcademyTeacherUser::getTable().
                       " WHERE email='{email}' LIMIT 0,1;")
            ->makeSqlQuery();   
          if (!$db->getNumRows())
            return null;       
        return $db->fetchObject('CustomerAcademyTeacherUser')->loaded();
    }
    
  
   /* static function getPopulars($lang,$options=array())
    {       
        $list= new CustomerAcademyTeacherUserCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>$lang))
            ->setObjects(array('CustomerAcademyTeacherUser','SiteEventCompany','SiteEventContent','SiteEventContentI18n'))
            ->setQuery("SELECT {fields} FROM ".CustomerAcademyTeacherUser::getTable().                       
                       " LEFT JOIN ".SiteEventContent::getInnerForJoin('employer_user_id').
                       " LEFT JOIN ".SiteEventContentI18n::getInnerForJoin('content_id')." AND ".SiteEventContentI18n::getTableField('lang')."='{lang}'".
                       " LEFT JOIN ".CustomerAcademyTeacherUser::getOuterForJoin('company_id').
                       " WHERE  ".CustomerAcademyTeacherUser::getTableField('is_validated')."='YES' ". 
                            " AND ".CustomerAcademyTeacherUser::getTableField('is_active')."='YES' ". 
                            " AND ".CustomerAcademyTeacherUser::getTableField('status')."='ACTIVE' ".
                    //        " AND ".CustomerAcademyTeacherUser::getTableField('is_completed')."='YES'".
                    
                       " ORDER BY ranking DESC ".
                       " LIMIT 0,10;")
            ->makeSqlQuery();   
       // echo $db->getQuery();
        if (!$db->getNumRows())
            return $list; 
         while ($items = $db->fetchObjects()) 
       {                                      
            $item=$items->getCustomerAcademyTeacherUser();             
            $item->set('company_id',$items->hasSiteEventCompany()?$items->getSiteEventCompany():false);                  
            $item->set('content',$items->hasSiteEventContent()?$items->getSiteEventContent():false);   
            if ($item->hasContent())
                $item->getContent()->setI18n($items->hasSiteEventContentI18n()?$items->getSiteEventContentI18n():false);
            $list[$item->get('id')]=$item;               
       }        
        return $list;
    }*/
     
}

