<?php


class CustomerMessage extends CustomerMessageBase {
     
    
      function __construct($parameters = null,$user) {
        if ($user instanceof User)
            $this->set('user_id',$user);
        $this->getDefaults();
        if (is_numeric($parameters) && $user instanceof User)        
            return $this->loadByIdAndUser($parameters,$user);  
        if ($user) return ;
        parent::__construct($parameters);
    }
    
    function loadByIdAndUser($id,User $user)
    {
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                       " WHERE  ".self::getTableField('user_id')."='{user_id}' AND  id ='{id}'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
}
