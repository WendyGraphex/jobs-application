<?php

class UserGroupUtils {
       
    static function getGroupsUserList(User $user)
    {
        if (!$user->isLoaded())
           return false;
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array($user->get('id')))
                ->setQuery("SELECT t_groups.id,t_groups.name,t_user_group.user_id
                            FROM t_groups
                            LEFT JOIN t_user_group ON t_user_group.group_id = t_groups.id AND user_id=%d
                            WHERE t_groups.application = @@APPLICATION@@
                            ")               
                ->makeSqlQuery($user->get('application'),$user->getSite()); 
        if (!$db->getNumRows())
            return false;
        $groups=array();
        while ($row=$db->fetchObject('Group'))
        {
           $groups[]=$row;
        }
        return $groups;
    }

  /*  static function getGroupsAllowedUserList(User $user)
    {
        if (!$user->isValid())
           return array();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array($user->get('id')))
                ->setQuery("SELECT t_groups.id FROM t_groups
                            LEFT JOIN t_user_group ON t_user_group.group_id = t_groups.id AND user_id=%d
                            WHERE t_groups.application = @@APPLICATION@@ AND user_id IS NULL
                            ")               
                ->makeSqlQuery($user->get('application'),$this->getSite()); 
        if (!$db->getNumRows())
            return array();
        $groups=array();
        while ($row=$db->fetchArray())
        {
           $groups[]=$row['id'];
        }
        return $groups;
    }*/
    
     static function getGroupsUserbyUserList(User $user)
    {
        if (!$user->isLoaded())
           return array();
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array($user->get('id')))
                ->setQuery("SELECT t_user_group.id
                            FROM t_groups
                            LEFT JOIN t_user_group ON t_user_group.group_id = t_groups.id 
                            WHERE t_groups.application = @@APPLICATION@@ AND user_id=%d;
                            ")               
                ->makeSqlQuery($user->get('application'),$user->getSite()); 
        if (!$db->getNumRows())
            return array();
        $groups=array();
        while ($row=$db->fetchArray())
        {
           $groups[]=$row['id'];
        }
        return $groups;
    } 
    
     static function isGroupsUserNotAllowed($user_id,$groups=array(),$application=null)
    {
        if (!$groups)
           return false;
        $db=mfSiteDatabase::getInstance()
                ->setParameters((array)$user_id)
                ->setQuery("SELECT t_groups.id
                            FROM t_groups
                            LEFT JOIN t_user_group ON t_user_group.group_id = t_groups.id AND user_id=%d
                            WHERE t_groups.application@@IN_APPLICATION@@ AND user_id IS NULL AND t_groups.id IN (".implode(",",(array)$groups).");")               
                ->makeSqlQuery($application,$site); 
        if (!$db->getNumRows())
            return false;
        $groups_exist=array();
        while ($row=$db->fetchArray())
               $groups_exist[]=$row['id'];
        return array_diff($groups,$groups_exist);
        
    }
}