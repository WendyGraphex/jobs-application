<?php

class PermissionUtilsBase {
    
    function isPermissionsExists($name,$permissions)
    {
       $db=mfSiteDatabase::getInstance()                      
            ->setQuery("SELECT ".$name." FROM ".Permission::getTable().                      
                       " WHERE ".Permission::getTableField($name)." IN('".implode("','",$permissions)."')".
                       ";")               
            ->makeSqlQuery();   
        if (!$db->getNumRows())
            return $permissions;
        $unknown=$permissions;    
        while ($row=$db->fetchArray())
        {          
            if (($key=array_search($row[$name],$permissions))!==false)
            {
                unset($unknown[$key]);
            }                   
        }  
        return $unknown;   
    }
function setPermissionsForGroupImport(Group $group,$permissions)
    {
        if ($group->isNotLoaded())
           return ;        
        // Find unknown categories
        $unKnown=self::isPermissionsExists('name',$permissions,$group->getSite());       
        // take only existing ProductCategoryI18N not yet linked with group
        $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('group_id'=>$group->get('id')))
            ->setQuery("SELECT ".Permission::getFieldsAndKeyWithTable()." FROM ".Permission::getTable().
                       " LEFT JOIN ".GroupPermission::getInnerForJoin('permission_id').
                            " AND ".GroupPermission::getTableField('group_id')."={group_id}".
                       " WHERE ".GroupPermission::getTableField('id')." IS NULL".                    
                       " AND ".Permission::getTableField('name')." IN('".implode("','",$permissions)."')".
                       ";")               
            ->makeSqlQuery();  
        if (!$db->getNumRows())
            return $unKnown;;
        $collection=new GroupPermissionCollection(null,$group->getSite());
        while ($item=$db->fetchObject('Permission'))
        {               
            $join=new GroupPermission(null,$group->getSite());
            $join->add(array('group_id'=>$group,'permission_id'=>$item));
            $collection[]=$join;
        }
        $collection->save();           
        return $unKnown;
    }
    
}    