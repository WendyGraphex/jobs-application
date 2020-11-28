<?php


class CustomerAcademyStudentUserUtils extends CustomerAcademyStudentUserUtilsBase {
    
        
   static function findByEmailOrUsernameAndPassword($emailOrUsername,$password)
    {                       
       $db=mfSiteDatabase::getInstance()
                ->setParameters(array('username'=>$emailOrUsername,'email'=>$emailOrUsername,'password'=>$password))
                ->setObjects(array('CustomerAcademyStudentUser'))
                ->setQuery("SELECT {fields} FROM ".CustomerAcademyStudentUser::getTable().    
                           " WHERE  ".CustomerAcademyStudentUser::getTableField("email='{email}'").
                                " AND ".CustomerAcademyStudentUser::getTableField('is_active')."='YES'".
                                " AND ".CustomerAcademyStudentUser::getTableField('is_validated')."='YES'". 
                                " AND ".CustomerAcademyStudentUser::getTableField("password='{password}'").                               
                           ";")               
                ->makeSqlQuery();   
       // echo $db->getQuery(); 
        if (!$db->getNumRows())
            return null;                              
        return $db->fetchObjects()->getCustomerAcademyStudentUser()->unlock();  
    }
    
     
}

