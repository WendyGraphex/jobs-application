<?php


class SiteEventUserUtils extends SiteEventUserUtilsBase {
    
        
   static function findByEmailOrUsernameAndPassword($emailOrUsername,$password)
    {                       
       $db=mfSiteDatabase::getInstance()
                ->setParameters(array('username'=>$emailOrUsername,'email'=>$emailOrUsername,'password'=>$password))
                ->setObjects(array('SiteEventUser'))
                ->setQuery("SELECT {fields} FROM ".SiteEventUser::getTable().    
                           " WHERE  ".SiteEventUser::getTableField("email='{email}'").
                                " AND ".SiteEventUser::getTableField('is_active')."='YES'".
                                " AND ".SiteEventUser::getTableField('is_validated')."='YES'". 
                                " AND ".SiteEventUser::getTableField("password='{password}'").                               
                           ";")               
                ->makeSqlQuery();   
       // echo $db->getQuery(); 
        if (!$db->getNumRows())
            return null;                              
        return $db->fetchObjects()->getSiteEventUser()->unlock();  
    }
    
     
}

