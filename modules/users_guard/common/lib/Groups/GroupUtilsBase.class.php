<?php


class GroupUtilsBase {
    
 
    
      function isGroupsExists($name,$list)
    {
       $db=mfSiteDatabase::getInstance()                      
            ->setQuery("SELECT ".$name." FROM ".Group::getTable().                      
                       " WHERE ".Group::getTableField($name)." IN('".implode("','",$list)."')".
                       ";")               
            ->makeSiteSqlQuery($site);   
        if (!$db->getNumRows())
            return $list;
        $unknown=$list;    
        while ($row=$db->fetchArray())
        {          
            if (($key=array_search($row[$name],$list))!==false)
            {
                unset($unknown[$key]);
            }                   
        }  
        return $unknown;   
    }
    
    function setGroupsForUserImport(User $user,$groups)
    {
        if ($user->isNotLoaded())
           return ;        
        // Find unknown categories
        $unKnown=self::isGroupsExists('name',$groups,$user->getSite());       
        // take only existing ProductCategoryI18N not yet linked with group
        $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('user_id'=>$user->get('id')))
            ->setQuery("SELECT ".Group::getFieldsAndKeyWithTable()." FROM ".Group::getTable().
                       " LEFT JOIN ".UserGroup::getInnerForJoin('group_id').
                            " AND ".UserGroup::getTableField('user_id')."={user_id}".
                       " WHERE ".UserGroup::getTableField('id')." IS NULL".                    
                       " AND ".Group::getTableField('name')." IN('".implode("','",$groups)."')".
                       ";")               
            ->makeSiteSqlQuery($user->getSite());  
        if (!$db->getNumRows())
            return $unKnown;;
        $collection=new UserGroupCollection(null,$user->getSite());
        while ($item=$db->fetchObject('Group'))
        {               
            $join=new UserGroup(null,$user->getSite());
            $join->add(array('user_id'=>$user,'group_id'=>$item,'is_active'=>'YES'));
            $collection[]=$join;
        }
        $collection->save();           
        return $unKnown;
    }
    
     function getGroups($application)
    {
       $db=mfSiteDatabase::getInstance()                      
            ->setQuery("SELECT * FROM ".Group::getTable(). 
                       " WHERE application='".$application."'".
                       ";")               
            ->makeSiteSqlQuery($site);   
        if (!$db->getNumRows())
            return array();
        $groups=array();
        while ($item=$db->fetchObject('Group'))
        {          
             $item->site=$site;
             $groups[$item->get('id')]=$item->loaded();                 
        }  
        return $groups;   
    }
}
