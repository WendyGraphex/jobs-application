<?php


class SiteEventPlace extends SiteEventPlaceBase {
     
    function __construct($parameters = null,$user=null) {
        if ($user instanceof SiteEventUser)
           $this->set('event_user_id',$user);
        if (is_numeric($parameters) && $user instanceof SiteEventUser)
            return $this->loadByIdAndUser($parameters,$user);
         if (is_array($parameters) && isset($parameters['id']) && $user instanceof SiteEventUser)
            return $this->loadByIdAndUser($parameters['id'],$user);
        if ($user) return ;
        parent::__construct($parameters);
    }
    
    
     function loadByIdAndUser($id,SiteEventUser $user)
    {              
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'event_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                       " WHERE  ".self::getTableField('event_user_id')."='{event_user_id}' AND  id ='{id}'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
    static function getActivePlacesForSelectForUser(SiteEventUser $user)
   {
      $values=new mfArray();        
        $db=mfSiteDatabase::getInstance()
                ->setParameters(array('event_user_id'=>$user->get('id')))
                ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().
                           " WHERE is_active='YES' AND event_user_id='{event_user_id}' ORDER BY name ASC;")               
                ->makeSqlQuery(); 
        if (!$db->getNumRows())
            return $values;
        while ($item=$db->fetchObject(__CLASS__))
        { 
            $values[$item->get('id')]=(string)$item->getFormatter()->getName()->ucfirst();
        }              
        return $values; 
   }
}
