<?php


class SiteEventUserUtilsBase {
    
        
    
    static function getUserByEmail($email)
    {         
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('email'=>$email))
            ->setQuery("SELECT * FROM ".SiteEventUser::getTable().
                       " WHERE email='{email}' LIMIT 0,1;")
            ->makeSqlQuery();   
          if (!$db->getNumRows())
            return null;       
        return $db->fetchObject('SiteEventUser')->loaded();
    }
    
  
   /* static function getPopulars($lang,$options=array())
    {       
        $list= new SiteEventUserCollection();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>$lang))
            ->setObjects(array('SiteEventUser','SiteEventCompany','SiteEventContent','SiteEventContentI18n'))
            ->setQuery("SELECT {fields} FROM ".SiteEventUser::getTable().                       
                       " LEFT JOIN ".SiteEventContent::getInnerForJoin('employer_user_id').
                       " LEFT JOIN ".SiteEventContentI18n::getInnerForJoin('content_id')." AND ".SiteEventContentI18n::getTableField('lang')."='{lang}'".
                       " LEFT JOIN ".SiteEventUser::getOuterForJoin('company_id').
                       " WHERE  ".SiteEventUser::getTableField('is_validated')."='YES' ". 
                            " AND ".SiteEventUser::getTableField('is_active')."='YES' ". 
                            " AND ".SiteEventUser::getTableField('status')."='ACTIVE' ".
                    //        " AND ".SiteEventUser::getTableField('is_completed')."='YES'".
                    
                       " ORDER BY ranking DESC ".
                       " LIMIT 0,10;")
            ->makeSqlQuery();   
       // echo $db->getQuery();
        if (!$db->getNumRows())
            return $list; 
         while ($items = $db->fetchObjects()) 
       {                                      
            $item=$items->getSiteEventUser();             
            $item->set('company_id',$items->hasSiteEventCompany()?$items->getSiteEventCompany():false);                  
            $item->set('content',$items->hasSiteEventContent()?$items->getSiteEventContent():false);   
            if ($item->hasContent())
                $item->getContent()->setI18n($items->hasSiteEventContentI18n()?$items->getSiteEventContentI18n():false);
            $list[$item->get('id')]=$item;               
       }        
        return $list;
    }*/
     
}

