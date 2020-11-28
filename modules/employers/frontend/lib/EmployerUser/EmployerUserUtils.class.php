<?php


class EmployerUserUtils extends EmployerUserUtilsBase {
    
        
   static function findByEmailOrUsernameAndPassword($emailOrUsername,$password)
    {                       
       $db=mfSiteDatabase::getInstance()
                ->setParameters(array('username'=>$emailOrUsername,'email'=>$emailOrUsername,'password'=>$password))
                ->setObjects(array('EmployerUser'))
                ->setQuery("SELECT {fields} FROM ".EmployerUser::getTable().    
                           " WHERE  ".EmployerUser::getTableField("email='{email}'").
                                " AND ".EmployerUser::getTableField('is_active')."='YES'".
                                " AND ".EmployerUser::getTableField('is_validated')."='YES'". 
                                " AND ".EmployerUser::getTableField("password='{password}'").                               
                           ";")               
                ->makeSqlQuery();   
       // echo $db->getQuery(); die(__METHOD__);
        if (!$db->getNumRows())
            return null;                              
        return $db->fetchObjects()->getEmployerUser()->unlock();  
    }
    
    /*
     static function findByEmailOrUsernameAndPassword($email,$password)
    {                      
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('email'=>$email,'password'=>$password))
                ->setObjects(array('CustomerUser','CustomerUserPermission','CustomerUserGroupPermission','CustomerUserGroup'))
                ->setQuery("SELECT {fields} FROM ".CustomerUserPermission::getTable().
                           " LEFT JOIN ".CustomerUsersPermissions::getInnerForJoin('permission_id'). 
                           " LEFT JOIN ".CustomerUserGroupPermission::getInnerForJoin('permission_id').
                           " LEFT JOIN ".CustomerUsersGroups::getTable()." ON ".CustomerUsersGroups::getTableField('group_id')."=".CustomerUserGroupPermission::getTableField('group_id')." OR ".
                                CustomerUsersGroups::getTableField('user_id')."=".CustomerUsersPermissions::getTableField('user_id').                                
                           " LEFT JOIN ".CustomerUsersGroups::getOuterForJoin('group_id').
                           " LEFT JOIN ".CustomerUsersGroups::getOuterForJoin('user_id').
                           " WHERE ".CustomerUser::getTableField("email='{email}'").                                    
                                    " AND ".CustomerUser::getTableField("password='{password}'").                                
                                    " AND ".CustomerUser::getTableField("is_active='YES'").
                                    " AND ".CustomerUsersGroups::getTableField("is_active='YES'").
                                    " AND ".CustomerUserGroup::getTableField("is_active='YES'").
                           ";")               
                ->makeSqlQuery();  
     //  echo $db->getQuery();
    //   die(__METHOD__);
        if (!$db->getNumRows())
            return null;
        $user=null;
        while ($row=$db->fetchObjects())
        {           
            if ($user==null)
                $user=$row->getCustomerUser();
            if ($row->hasCustomerUserGroup() && $user)
            {
                if (!$user->hasGroup($row->getCustomerUserGroup()))
                    $user->addGroup($row->getCustomerUserGroup());
            } 
            if ($row->hasCustomerUsersPermissions())
            {
                $user_permission=$row->getCustomerUsersPermissions();
                $user_permission->set('permission_id',$row->getCustomerUserPermission());
                $user->addPermission($user_permission);
            }  
            if ($row->hasCustomerUserGroupPermission())  
            {
                $group_permission=$row->getCustomerUserGroupPermission(); 
                $group_permission->set('permission_id',$row->getCustomerUserPermission());
                $user->addPermission($group_permission);
            }        
        }   
        
        // echo "<pre>"; var_dump($user); echo "</pre>"; die(__METHOD__);
        return $user;  
    }
     */
    
      static function getLanguagesForSelect($lang=null)
    {     
        $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>$lang?$lang:mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT ".EmployerUserLanguage::getTableField('lang')." FROM ".EmployerUserLanguage::getTable().                                        
                       " INNER JOIN ".EmployerUserLanguage::getOuterForJoin('employer_user_id').                   
                       " WHERE ".EmployerUser::getTableField('is_active')."='YES' ". 
                                " AND ".EmployerUser::getTableField('is_validated')."='YES'".                               
                                " AND ".EmployerUser::getTableField('is_completed')."='YES'". 
                       " GROUP BY ".EmployerUserLanguage::getTableField('lang').                     
                       ";")
            ->makeSqlQuery();   
          if (!$db->getNumRows())
            return $list;       
       while ($row=$db->fetchArray())
        {          
            $list[$row['lang']]= ucfirst(format_language($row['lang']));
        }              
     //   echo "<pre>"; var_dump($list); echo "</pre>"; 
        return $list;
    }
    
       static function getFormattedCountriesForSelect()
    {
        $list=new mfArray();   
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT IF(".EmployerUser::getTableField('company_id')." IS NULL,".EmployerUser::getTableField('country').",".EmployerCompany::getTableField('country').") as country ".
                           " FROM ".EmployerUser::getTable().   
                           " LEFT JOIN ".EmployerUser::getOuterForJoin('company_id').
                            " WHERE ".EmployerUser::getTableField('is_active')."='YES' ". 
                                " AND ".EmployerUser::getTableField('is_validated')."='YES'".                             
                                " AND ".EmployerUser::getTableField('is_completed')."='YES'". 
                           " GROUP BY country".                          
                           ";")
               /* ->setQuery("SELECT ".EmployerUser::getTableField('country')." FROM ".EmployerUser::getTable().                          
                            " WHERE ".EmployerUser::getTableField('is_active')."='YES' ". 
                                " AND ".EmployerUser::getTableField('is_validated')."='YES'".                             
                                " AND ".EmployerUser::getTableField('is_completed')."='YES'". 
                           " GROUP BY ".EmployerUser::getTableField('country').                          
                           ";")  */             
                ->makeSqlQuery();
       // echo $db->getQuery();
        if (!$db->getNumRows())
            return  $list;      
        while ($row=$db->fetchArray())
        {          
            $list[$row['country']]= ucfirst(format_country($row['country']));
        }              
        return $list->asort();
    } 
}

