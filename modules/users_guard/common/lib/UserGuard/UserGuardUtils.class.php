<?php

class UserGuardUtils {
    
    static function findByUserNameOrEmailAndPassword($userName,$password)
    {
       $db=mfSiteDatabase::getInstance()
                ->setParameters(array('username'=>$userName,'password'=>$password))
                ->setObjects(array('User','Permission','UserPermission','GroupPermission','Group'))
                ->setQuery("SELECT {fields} FROM ".Permission::getTable().
                           " LEFT JOIN ".UserPermission::getInnerForJoin('permission_id'). // t_user_permission ON t_user_permission.permission_id=t_permissions.id
                           " LEFT JOIN ".GroupPermission::getInnerForJoin('permission_id'). //t_group_permission ON t_group_permission.permission_id=t_permissions.id                      
                           " LEFT JOIN ".UserGroup::getTable()." ON ".UserGroup::getTableField('group_id')."=".GroupPermission::getTableField('group_id')." OR ".
                                UserGroup::getTableField('user_id')."=".UserPermission::getTableField('user_id').
                                //  t_user_group ON t_user_group.group_id=t_group_permission.group_id
                           " LEFT JOIN ".UserGroup::getOuterForJoin('group_id'). // t_groups ON t_groups.id=t_user_group.group_id
                           " LEFT JOIN ".UserGroup::getOuterForJoin('user_id'). //t_users ON t_users.id=t_user_group.user_id
                           " WHERE ".Permission::getTableField('application=@@APPLICATION@@')." AND ".Group::getTableField("application=@@APPLICATION@@").
                           " AND (".User::getTableField("username='{username}'")." OR ".User::getTableField("email='{username}'").") AND ".User::getTableField("password='{password}'")." AND ".User::getTableField("application=@@APPLICATION@@").
                           " AND ".User::getTableField("is_active='YES'")." AND ".UserGroup::getTableField("is_active='YES'")." AND ".Group::getTableField("is_active='YES'").
                           ";")               
                ->makeSqlQuery();      
        if (!$db->getNumRows())
            return null;
        $user=null;
        while ($row=$db->fetchObjects())
        {           
            if ($user==null)
                $user=$row->getUser();
            if ($row->hasGroup() && $user)
            {
                if (!$user->hasGroup($row->getGroup()))
                    $user->addGroup($row->getGroup());
            } 
            if ($row->hasUserPermission())
            {
                $user_permission=$row->getUserPermission();
                $user_permission->set('permission_id',$row->getPermission());
                $user->addPermission($user_permission);
            }  
            if ($row->hasGroupPermission())
            {
                $group_permission=$row->getGroupPermission();
                $group_permission->set('permission_id',$row->getPermission());
                $user->addPermission($group_permission);
            }        
        }         
        
     //  echo "<pre>"; var_dump($user); echo "</pre>"; die(__METHOD__);
        return $user;  
    }
    
    static function getUserNameOrEmail($userName)
    {
      //  var_dump($userName);
      //  die(__METHOD__);
         $db=mfSiteDatabase::getInstance()
                ->setParameters(array($userName,$userName))
                ->setQuery("SELECT t_users.id,firstname,lastname,email,password, t_permissions.name AS permission,t_group_permission.group_id,t_permissions.id as permission_id,
                                    lastlogin,last_password_gen,username
                            FROM t_permissions
                            LEFT JOIN t_user_permission ON t_user_permission.permission_id=t_permissions.id
                            LEFT JOIN t_group_permission ON t_group_permission.permission_id=t_permissions.id
                            LEFT JOIN t_user_group ON t_user_group.user_id=t_user_permission.user_id OR t_user_group.group_id=t_group_permission.group_id
                            LEFT JOIN t_users ON t_users.id=t_user_group.user_id
                            LEFT JOIN t_groups ON t_groups.id=t_user_group.group_id
                            WHERE (t_users.username='%s' OR t_users.email='%s') 
                            AND t_users.is_active='YES' AND t_user_group.is_active='YES' AND t_users.is_active='YES' AND t_groups.is_active='YES'
                            AND t_users.application=@@APPLICATION@@ AND t_groups.application=@@APPLICATION@@ AND t_permissions.application=@@APPLICATION@@
                           ")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return null;
        $user=null;
        while ($row=$db->fetchObject('User'))
        {
            if (!$user)
            {
                $user=clone $row;
                foreach (array('group_id','permission_id','permission') as $name)
                    unset($user->$name);
            }    
            $user->addPermission(($row->get('group_id')==null)? 
                new userPermission(array('name'=>$row->get('permission'),'user_id'>$user->getId(),'id'=>$row->get('permission_id'))): 
                new groupPermission(array('name'=>$row->get('permission'),'group_id'=>$row->get('group_id'),'id'=>$row->get('permission_id'))));
        }           
        return $user;
    }
    

    
    
    static function getUsers($site=null)
    {
        $db=mfSiteDatabase::getInstance()
                ->setQuery("SELECT id,firstname,lastname,email,username,updated_at FROM ".user::getTable()." WHERE application='admin';")               
                ->makeSqlQuery(null,$site); 
        if (!$db->getNumRows())
            return null;
        $users=array();
        while ($row=$db->fetchObject('user'))
        { 
            $users[]=$row;
        }            
        return $users;
    }

    static function findAdminOrSuperAdminUserByNameOrEmailAndPassword($userName,$password)
    {
         $db=mfSiteDatabase::getInstance()
                ->setParameters(array($userName,$userName,$password))
                ->setQuery("SELECT * FROM ".User::getTable().                          
                           " WHERE (username='%s' OR email='%s') AND password='%s'".
                           " AND is_active='YES' AND application IN ('admin','superadmin')".
                           ";")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return false;             
        return $db->fetchObject('User')->loaded();
    }
    
    
    static function findByUserIdWithGroupsAndPermissions($user_id)
    {

       $db=mfSiteDatabase::getInstance()
                ->setParameters(array('user_id'=>$user_id))
                ->setObjects(array('User','Permission','UserPermission','GroupPermission','Group'))
                ->setQuery("SELECT {fields} FROM ".Permission::getTable().
                           " LEFT JOIN ".UserPermission::getInnerForJoin('permission_id'). // t_user_permission ON t_user_permission.permission_id=t_permissions.id
                           " LEFT JOIN ".GroupPermission::getInnerForJoin('permission_id'). //t_group_permission ON t_group_permission.permission_id=t_permissions.id                      
                           " LEFT JOIN ".UserGroup::getTable()." ON ".UserGroup::getTableField('group_id')."=".GroupPermission::getTableField('group_id')." OR ".
                                UserGroup::getTableField('user_id')."=".UserPermission::getTableField('user_id').
                                //  t_user_group ON t_user_group.group_id=t_group_permission.group_id
                           " LEFT JOIN ".UserGroup::getOuterForJoin('group_id'). // t_groups ON t_groups.id=t_user_group.group_id
                           " LEFT JOIN ".UserGroup::getOuterForJoin('user_id'). //t_users ON t_users.id=t_user_group.user_id
                           " WHERE ".Permission::getTableField('application=@@APPLICATION@@')." AND ".Group::getTableField("application=@@APPLICATION@@").
                           " AND ".User::getTableField("id='{user_id}'")." AND ".User::getTableField("application=@@APPLICATION@@").
                           " AND ".User::getTableField("is_active='YES'")." AND ".UserGroup::getTableField("is_active='YES'")." AND ".Group::getTableField("is_active='YES'").
                           ";")               
                ->makeSqlQuery();      
        if (!$db->getNumRows())
            return null;
        $user=null;
        while ($row=$db->fetchObjects())
        {           
            if ($user==null)
                $user=$row->getUser();
            if ($row->hasGroup() && $user)
            {
                if (!$user->hasGroup($row->getGroup()))
                    $user->addGroup($row->getGroup());
            } 
            if ($row->hasUserPermission())
            {
                $user_permission=$row->getUserPermission();
                $user_permission->set('permission_id',$row->getPermission());
                $user->addPermission($user_permission);
            }  
            if ($row->hasGroupPermission())
            {
                $group_permission=$row->getGroupPermission();
                $group_permission->set('permission_id',$row->getPermission());
                $user->addPermission($group_permission);
            }        
        }         
        return $user;  
    }
    
    static function findByEmailAndPassword($email, $password)
    {        
         $profiles=new UserProfiles();        
         $db=mfSiteDatabase::getInstance()
                ->setParameters(array('email'=>$email,'password'=>$password))
              // ->setObjects(array('CustomerUser','CustomerCompanyUser','PartnerUser'))
                ->setQuery("SELECT * FROM ".CustomerUser::getTable().  
                           " WHERE ".CustomerUser::getTableField('email')."='{email}' AND ".CustomerUser::getTableField('password')."='{password}'".                                 
                           ";")               
                ->makeSqlQuery(); 
        if ($db->getNumRows())
        {           
            $profiles->setUser($db->fetchObject('CustomerUser')->loaded());
        }
        $db->setParameters(array('email'=>$email,'password'=>$password))
           ->setQuery("SELECT * FROM ".CustomerCompanyUser::getTable().  
                      " WHERE ".CustomerCompanyUser::getTableField('email')."='{email}' AND ".CustomerCompanyUser::getTableField('password')."='{password}'".                                 
                      ";")               
                ->makeSqlQuery();
        if ($db->getNumRows())
        {           
            $profiles->setCompanyUser($db->fetchObject('CustomerCompanyUser')->loaded());
        }
        $db->setParameters(array('email'=>$email,'password'=>$password))
           ->setQuery("SELECT * FROM ".PartnerUser::getTable().  
                      " WHERE ".PartnerUser::getTableField('email')."='{email}' AND ".PartnerUser::getTableField('password')."='{password}'".                                 
                      ";")               
                ->makeSqlQuery();
        if ($db->getNumRows())
        {           
            $profiles->setPartnerUser($db->fetchObject('PartnerUser')->loaded());
        }       
        return $profiles;
    }  
    
     static function findCustomerByEmailAndPassword($email, $password)
    {        
         $profiles=new UserProfiles();        
         $db=mfSiteDatabase::getInstance()
                ->setParameters(array('email'=>$email,'password'=>$password))
              // ->setObjects(array('CustomerUser','CustomerCompanyUser','PartnerUser'))
                ->setQuery("SELECT * FROM ".CustomerUser::getTable().  
                           " WHERE ".CustomerUser::getTableField('email')."='{email}' AND ".CustomerUser::getTableField('password')."='{password}'".                                 
                           ";")               
                ->makeSqlQuery(); 
        if ($db->getNumRows())
        {           
            $profiles->setUser($db->fetchObject('CustomerUser')->loaded());
        }
        $db->setParameters(array('email'=>$email,'password'=>$password))
           ->setQuery("SELECT * FROM ".CustomerCompanyUser::getTable().  
                      " WHERE ".CustomerCompanyUser::getTableField('email')."='{email}' AND ".CustomerCompanyUser::getTableField('password')."='{password}'".                                 
                      ";")               
                ->makeSqlQuery();
        if ($db->getNumRows())
        {           
            $profiles->setCompanyUser($db->fetchObject('CustomerCompanyUser')->loaded());
        }          
        return $profiles;
    }  
}

