<?php


class UserRememberUtils {   

    static function cleanup($time_expiration,$user)
    {
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array($time_expiration,$user->getId()))
                ->setQuery("DELETE FROM t_user_remember WHERE created_at='%s' OR user_id=%d;")               
                ->makeSqlQuery();
    }
    
    static function getUserRemember($key)
    {
         $db=mfSiteDatabase::getInstance()
                ->setParameters(array($key))
                ->setQuery("SELECT `key`,ip,user_id
                            FROM t_user_remember 
                            LEFT JOIN t_users on t_users.id=t_user_remember.user_id
                            WHERE `key`='%s' LIMIT 1;
                           ")               
                ->makeSqlQuery();
        if (!$db->getNumRows())
            return false;
        $row=$db->fetchObject('userRemember');
        return $row;
    }
}


        
