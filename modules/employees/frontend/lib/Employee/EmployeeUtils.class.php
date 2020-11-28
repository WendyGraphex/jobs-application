<?php


class EmployeeUtils extends EmployeeUtilsBase {
    
        
   static function findByEmailOrUsernameAndPassword($emailOrUsername,$password)
    {                       
       $db=mfSiteDatabase::getInstance()
                ->setParameters(array('username'=>$emailOrUsername,'email'=>$emailOrUsername,'password'=>$password))
                ->setObjects(array('Employee'))
                ->setQuery("SELECT {fields} FROM ".Employee::getTable().    
                           " WHERE  ".Employee::getTableField("email='{email}'").
                                " AND ".Employee::getTableField('is_active')."='YES'".
                                " AND ".Employee::getTableField('is_validated')."='YES'". 
                                " AND ".Employee::getTableField("password='{password}'").                               
                           ";")               
                ->makeSqlQuery();   
     //    echo $db->getQuery();  die(__METHOD__);
        if (!$db->getNumRows())
            return null;                              
        return $db->fetchObjects()->getEmployee()->unlock();  
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
          
    
      static function getFormattedCountriesForSelect()
    {
        $list=new mfArray();   
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT ".Employee::getTableField('country')." FROM ".Employee::getTable().                          
                            " WHERE ".Employee::getTableField('is_active')."='YES' ". 
                                " AND ".Employee::getTableField('is_validated')."='YES'".                             
                                " AND ".Employee::getTableField('is_completed')."='YES'". 
                           " GROUP BY ".Employee::getTableField('country').
                           ";")               
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
    
     static function getSkillsForSelect($lang=null)
    {     
        $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>$lang?$lang:mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT ".EmployeeSkillI18n::getFieldsAndKeyWithTable()." FROM ".EmployeeSkill::getTable().
                       " INNER JOIN ".EmployeeSkillI18n::getInnerForJoin('skill_id').
                       " INNER JOIN ".EmployeeUserSkill::getInnerForJoin('skill_id'). 
                       " INNER JOIN ".EmployeeUserSkill::getOuterForJoin('employee_user_id').                     
                       " WHERE ".Employee::getTableField('is_active')."='YES' ". 
                                " AND ".Employee::getTableField('is_validated')."='YES'".                               
                                " AND ".Employee::getTableField('is_completed')."='YES'". 
                                " AND ".EmployeeSkillI18n::getTableField('lang')."='{lang}'".
                       " GROUP BY ".EmployeeSkill::getTableField('id').
                       " ORDER BY ".EmployeeSkillI18n::getTableField('title')." ASC ".
                       ";")
            ->makeSqlQuery();   
          if (!$db->getNumRows())
            return $list;       
         while ($item=$db->fetchObject('EmployeeSkillI18n'))
        {          
            $list[$item->get('skill_id')]= ucfirst($item);
        }              
       // echo "<pre>"; var_dump($list); echo "</pre>"; 
        return $list;
    }    
    
      static function getExperiencesForSelect($lang=null)
    {     
        $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>$lang?$lang:mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT ".EmployeeExperienceI18n::getFieldsAndKeyWithTable()." FROM ".EmployeeExperience::getTable().
                       " INNER JOIN ".EmployeeExperienceI18n::getInnerForJoin('experience_id').
                       " INNER JOIN ".Employee::getInnerForJoin('experience_id').                      
                       " INNER JOIN ".EmployeeAdvert::getInnerForJoin('employee_user_id').                
                        " WHERE ".Employee::getTableField('is_active')."='YES' ". 
                                " AND ".Employee::getTableField('is_validated')."='YES'".                               
                                " AND ".Employee::getTableField('is_completed')."='YES'". 
                                " AND ".EmployeeExperienceI18n::getTableField('lang')."='{lang}'".
                       " GROUP BY ".EmployeeExperience::getTableField('id').
                       " ORDER BY ".EmployeeExperience::getTableField('position')." ASC ".
                       ";")
            ->makeSqlQuery();   
          if (!$db->getNumRows())
            return $list;       
         while ($item=$db->fetchObject('EmployeeExperienceI18n'))
        {          
            $list[$item->get('experience_id')]= ucfirst($item);
        }              
       // echo "<pre>"; var_dump($list); echo "</pre>"; 
        return $list;
    }
    
     static function getLevelsForSelect($lang=null)
    {     
        $list=new mfArray();
        $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>$lang?$lang:mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT ".EmployeeStudyLevelI18n::getFieldsAndKeyWithTable()." FROM ".EmployeeStudyLevel::getTable().
                       " INNER JOIN ".EmployeeStudyLevelI18n::getInnerForJoin('level_id').
                       " INNER JOIN ".Employee::getInnerForJoin('level_id').                                          
                       " WHERE ".Employee::getTableField('is_active')."='YES' ". 
                                " AND ".Employee::getTableField('is_validated')."='YES'".                               
                                " AND ".Employee::getTableField('is_completed')."='YES'". 
                                " AND ".EmployeeStudyLevelI18n::getTableField('lang')."='{lang}'".
                       " GROUP BY ".EmployeeStudyLevel::getTableField('id').
                       " ORDER BY ".EmployeeStudyLevel::getTableField('position')." ASC ".
                       ";")
            ->makeSqlQuery();   
          if (!$db->getNumRows())
            return $list;       
         while ($item=$db->fetchObject('EmployeeStudyLevelI18n'))
        {          
            $list[$item->get('level_id')]= ucfirst($item);
        }             
        // echo "<pre>"; var_dump($list); echo "</pre>"; 
        return $list;
    }
    
    
      static function getLanguagesForSelect($lang=null)
    {     
        $list=new mfArray();
         $db=mfSiteDatabase::getInstance()
            ->setParameters(array('lang'=>$lang?$lang:mfcontext::getInstance()->getUser()->getLanguage()))
            ->setQuery("SELECT ".EmployeeUserLanguage::getTableField('lang')." FROM ".EmployeeUserLanguage::getTable().                                        
                       " INNER JOIN ".EmployeeUserLanguage::getOuterForJoin('employee_user_id').                   
                       " WHERE ".Employee::getTableField('is_active')."='YES' ". 
                                " AND ".Employee::getTableField('is_validated')."='YES'".                               
                                " AND ".Employee::getTableField('is_completed')."='YES'". 
                       " GROUP BY ".EmployeeUserLanguage::getTableField('lang').                     
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
}

