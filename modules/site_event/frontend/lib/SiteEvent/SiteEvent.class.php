<?php


class SiteEvent extends SiteEventBase {
     
    function __construct($parameters = null,$user=null) {
        if ($user instanceof SiteEventUser)
            $this->set('event_user_id',$user);
        $this->getDefaults();
        if (is_numeric($parameters) && $user instanceof SiteEventUser)      
            return $this->loadByIdAndUser($parameters,$user);     
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
            
    
    function upload()
    {
        if ($this->isNotLoaded())
            $this->set('state','UPLOAD')->save();                                        
        return $this;
    }
}
