<?php

class SessionUtilsBase {
    
    static function getUserLastConnexion($user) {
        static $lastconnections=array();
        $user_id=$user->getId();      
        if (isset($lastconnections[$user_id]))
            return $lastconnections[$user_id];
        $db = mfSiteDatabase::getInstance()
                ->setParameters(array($user_id))
                ->setQuery("SELECT * FROM ".Session::getTable()." WHERE user_id=%d ORDER BY last_time DESC LIMIT 1,1;")
                ->makeSqlQuery();
        if ($db->getNumRows())
        {        
           $lastconnections[$user_id]=$db->fetchObject('session');
           $lastconnections[$user_id]->loaded();
        }   
        else
          $lastconnections[$user_id]=new Session();        
        return $lastconnections[$user_id];
    }
    
   
}

