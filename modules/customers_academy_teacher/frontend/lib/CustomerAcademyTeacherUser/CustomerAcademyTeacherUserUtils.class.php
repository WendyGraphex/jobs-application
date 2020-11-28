<?php


class CustomerAcademyTeacherUserUtils extends CustomerAcademyTeacherUserUtilsBase {
    
        
   static function findByEmailOrUsernameAndPassword($emailOrUsername,$password)
    {                       
       $db=mfSiteDatabase::getInstance()
                ->setParameters(array('username'=>$emailOrUsername,'email'=>$emailOrUsername,'password'=>$password))
                ->setObjects(array('CustomerAcademyTeacherUser'))
                ->setQuery("SELECT {fields} FROM ".CustomerAcademyTeacherUser::getTable().    
                           " WHERE  ".CustomerAcademyTeacherUser::getTableField("email='{email}'").
                                " AND ".CustomerAcademyTeacherUser::getTableField('is_active')."='YES'".
                                " AND ".CustomerAcademyTeacherUser::getTableField('is_validated')."='YES'". 
                                " AND ".CustomerAcademyTeacherUser::getTableField("password='{password}'").                               
                           ";")               
                ->makeSqlQuery();   
       //echo $db->getQuery(); die(__METHOD__);
        if (!$db->getNumRows())
            return null;                              
        return $db->fetchObjects()->getCustomerAcademyTeacherUser()->unlock();  
    }
    
     
}

