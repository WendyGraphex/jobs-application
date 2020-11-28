<?php


class EmployerAdvertPopularUtilsBase {
    
        
     static function getPopulars($options=null)
     {
         $list= new EmployerAdvertI18nCollection();
         $db=mfSiteDatabase::getInstance()
                ->setParameters(array("lang"=>mfcontext::getInstance()->getUser()->getLanguage()))
                ->setObjects(array("EmployerAdvert","EmployerAdvertI18n","EmployerUser"))
                ->setQuery("SELECT {fields} FROM ".EmployerAdvertI18n::getTable().  
                           " INNER JOIN ".EmployerAdvertI18n::getOuterForJoin('advert_id').
                           " INNER JOIN ".EmployerAdvert::getOuterForJoin('employer_user_id').                     
                           " WHERE   ".EmployerAdvertI18n::getTableField('status')."='ACTIVE'".
                                 " AND ".EmployerAdvertI18n::getTableField('published_at')." IS NOT NULL".                        
                           // " AND ".EmployerAdvert::getTableField('status')."='ACTIVE'".
                           " ORDER BY ".EmployerAdvertI18n::getTableField('number_of_views')." DESC".
                           " LIMIT 0,10".
                           ";")               
                ->makeSqlQuery(); 
     //    echo $db->getQuery(); die(__METHOD__);
        if (!$db->getNumRows())
            return $list;
        $adverts = new EmployerAdvertCollection(); 
        while ($items=$db->fetchObjects())
        { 
            $item=$items->getEmployerAdvertI18n();                          
            if (!$adverts->hasItemByKey($items->getEmployerAdvert()->get('id')))
                  $adverts[$items->getEmployerAdvert()->get('id')] = $items->getEmployerAdvert();
            $item->set('advert_id',$adverts[$items->getEmployerAdvert()->get('id')]);
            $item->getAdvert()->set('employer_user_id',$items->getEmployerUser());    
            $list[$item->get('id')]=$item;               
        }                              
         EmployerAdvertDocument::getMediasForCollection($adverts);               
         return $list;
     }
    
     
}

