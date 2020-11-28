<?php

class UserUtilsBase {   
            
    static function getUsersForSelect($site=null)
    {
        $db=mfSiteDatabase::getInstance()
                ->setParameters()
                ->setQuery("SELECT ".User::getFieldsAndKeyWithTable()." FROM ".User::getTable().                           
                           " WHERE application='admin'".
                           " ORDER BY lastname ASC".
                           ";")               
                ->makeSiteSqlQuery($site); 
        if (!$db->getNumRows())
            return array();
        $users=array();
        while ($user=$db->fetchObject('User'))
        {
           $users[$user->get('id')]=(string)$user;
        }
        return $users;
    }   
    
    static function getUsers($site=null)
    {
        $db=mfSiteDatabase::getInstance()
                ->setParameters()
                ->setQuery("SELECT ".User::getFieldsAndKeyWithTable()." FROM ".User::getTable().                           
                           " WHERE application='admin'".
                           " ORDER BY ".User::getTableField('lastname')." COLLATE UTF8_GENERAL_CI ASC".
                           ";")               
                ->makeSiteSqlQuery($site); 
        if (!$db->getNumRows())
            return array();
        $users=array();
        while ($user=$db->fetchObject('User'))
        {
           $users[$user->get('id')]=$user;
        }
        return $users;
    }   
    
    static function checkUsers($users)
    {
        $db=mfSiteDatabase::getInstance()
                ->setParameters()
                ->setQuery("SELECT id FROM ".User::getTable().                           
                           " WHERE application='admin' AND id IN(".implode(",",$users).");")               
                ->makeSiteSqlQuery($site); 
        if (!$db->getNumRows())
            return array();
        $users=array();
        while ($row=$db->fetchArray())
        {
           $users[]=$row['id'];
        }
        return $users;
    }
    
    static function compareSortUser($a, $b) 
    {        
        if ($a->getUpperCaseLastName() == $b->getUpperCaseLastName()) 
                return 0;
        return ($a->getUpperCaseLastName() < $b->getUpperCaseLastName()) ? -1 : 1;
    }
    

    static function sortUsers(&$users,$upper=false)
    {
        uasort($users,array('self','compareSortUser')); 
        if ($upper)
            $users=self::upperUsers($users);
    }
    
    protected static function upperUsers($users)
    {
        foreach ($users as $name=>$value)
           $users[$name]=strtoupper((string)$value);
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
    
     
}

