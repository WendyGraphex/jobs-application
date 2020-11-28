<?php

class groupPermissionUtils {
    
    static function getAllPermissions(Group $group)
    {
        if (!$group->isLoaded())
           return false;
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array($group->get('id')))
                 ->setQuery("SELECT t_permissions.id,t_permissions.name,t_permissions.application,
                                   t_group_permission.group_id
                            FROM t_permissions
                            LEFT JOIN t_group_permission ON t_group_permission.permission_id = t_permissions.id AND t_group_permission.group_id=%d
                            WHERE t_permissions.application@@IN_APPLICATION@@
                            ORDER BY  t_permissions.name ASC
                            ")            
                ->makeSqlQuery($group->get('application')); 
        if (!$db->getNumRows())
            return false;
        $permissions=array();
        while ($row=$db->fetchObject('Permission'))
        {
           $permissions[]=$row;
        }
        return $permissions;
    }
    
    static function getAllPermissionsGroupByPermissionGroup(Group $group)
    {
        if (!$group->isLoaded())
           return false;
        $lang=mfContext::getInstance()->getUser()->getCountry();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('group_id'=>$group->get('id'),'lang'=>$lang))
                ->setObjects(array('Permission','PermissionGroup','PermissionGroupI18n','GroupPermission'))
                ->setQuery("SELECT {fields} ".
                           " FROM ".Permission::getTable().                         
                           " LEFT JOIN ".GroupPermission::getInnerForJoin('permission_id')." AND ".GroupPermission::getTableField('group_id')."={group_id}".
                           " LEFT JOIN ".Permission::getOuterForJoin('group_id').
                           " LEFT JOIN ".PermissionGroupI18n::getInnerForJoin('group_id')." AND ".PermissionGroupI18n::getTableField('lang')."='{lang}'".
                           " WHERE t_permissions.application@@IN_APPLICATION@@ ".
                           " ORDER BY  t_permissions.name ASC".
                           ";")                       
                ->makeSqlQuery($group->get('application')); 
        if (!$db->getNumRows())
            return false;
        $permissions_group=array(); 
        while ($items=$db->fetchObjects())
        {                        
           if ($items->hasPermissionGroup())               
           {    
                if ($items->hasPermissionGroupI18n())
                    $items->getPermissionGroup()->setPermissionGroupI18n($items->getPermissionGroupI18n());
                if (!isset($permissions_group[$items->getPermissionGroup()->get('id')]))
                    $permissions_group[$items->getPermissionGroup()->get('id')]=$items->getPermissionGroup();                
                $items->getPermission()->set('in_group',$items->hasGroupPermission());
                $permissions_group[$items->getPermissionGroup()->get('id')]->addPermission($items->getPermission());
              //  echo "Group=".$items->getPermissionGroup()->get('name')." permission=".$items->getPermission()->get('name')."<br/>";
           }
           else
           {
             if (!isset($permissions_group["null"]))
                 $permissions_group["null"]=new PermissionGroup();
             $permissions_group["null"]->addPermission($items->getPermission()) ;
           }          
        }      
       // var_dump($permissions_group);
        return $permissions_group;
    }
    
 /*   static function getPermissionsAllowedGroupList($group_id,$application=null)
    {
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array($group_id))
                ->setQuery("SELECT t_permissions.id FROM t_permissions
                            LEFT JOIN t_group_permission ON t_group_permission.permission_id = t_permissions.id AND group_id=%d
                            WHERE t_permissions.application@@IN_APPLICATION@@ AND group_id IS NULL
                            ")               
                ->makeSqlQuery($application,$site); 
        if (!$db->getNumRows())
            return array();
        $permissions=array();
        while ($row=my_sql_fetch_assoc($db->getResource()))
        {
           $permissions[]=$row['id'];
        }
        return $permissions;
    }*/
    
     static function getPermissionsGroupbyGroupList(Group $group,$application=null)
    {
        if (!$group->isLoaded())
           return array();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array($group->get('id')))
                ->setQuery("SELECT t_group_permission.id
                            FROM t_permissions
                            LEFT JOIN t_group_permission ON t_group_permission.permission_id = t_permissions.id 
                            WHERE t_permissions.application@@IN_APPLICATION@@ AND t_group_permission.group_id=%d;
                            ")               
                ->makeSqlQuery($application); 
        if (!$db->getNumRows())
            return array();
        $permissions=array();
        while ($row=$db->fetchArray())
        {
           $permissions[]=$row['id'];
        }
        return $permissions;
    }
    
    static function isPermissionsGroupNotAllowed($group_id,$permissions=array(),$application=null)
    {
        if (!$permissions)
           return false;
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array($group_id))
                ->setQuery("SELECT t_permissions.id
                            FROM t_permissions
                            LEFT JOIN t_group_permission ON t_group_permission.permission_id = t_permissions.id AND t_group_permission.group_id=%d
                            WHERE t_permissions.application@@IN_APPLICATION@@ AND t_group_permission.group_id IS NULL AND t_permissions.id IN (".implode(",",(array)$permissions).");")               
                ->makeSqlQuery($application); 
        if (!$db->getNumRows())
            return false;
        $permissions_exist=array();
        while ($row=$db->fetchArray())
               $permissions_exist[]=$row['id'];
        return array_diff($permissions,$permissions_exist);
        
    }
}

