<?php

 
class PaymentDebitEventUser extends PaymentDebitEventUserBase  {
     
    function __construct($parameters = null,$user=null) {        
        if ($user instanceof SiteEventUser)
            $this->set('event_user_id',$user);
        $this->getDefaults();
        if ($parameters instanceof SiteEventOrder && $user instanceof SiteEventUser)
             $this->loadByOrderAndUser($parameters,$user);    
        if (is_numeric($parameters) && $user instanceof SiteEventUser)      
            return $this->loadByIdAndUser($parameters,$user);          
        if ((is_array($parameters) || $parameters instanceof ArrayAccess) && $user instanceof SiteEventUser)
        {
            if (isset($parameters['reference']) && isset($parameters['payer']))
               return $this->loadbyReferenceAndPayerAndUser($parameters['reference'],$parameters['payer'],$user);    
            if (isset($parameters['reference']))
               return $this->loadbyReferenceAndUser((string)$parameters['reference'],$user);            
        }       
         if ($user) return ;
        parent::__construct($parameters);
    }
    
    function loadByOrderAndUser(SaleOrder $order,SiteEventUser $user)
    {              
       $this->set('order_id',$order);
       $this->set('event_user_id',$user);    
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
    
    
    function loadByReferenceAndUser($reference,SiteEventUser $user)
    {             
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('reference'=>$reference,'event_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                       " WHERE  ".self::getTableField('event_user_id')."='{event_user_id}' AND  reference ='{reference}'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
     function loadByReferenceAndPayerAndUser($reference,$payer,SiteEventUser $user)
    {             
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('reference'=>$reference,'payer'=>$payer,'event_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                       " WHERE  ".self::getTableField('event_user_id')."='{event_user_id}' AND payer='{payer}' AND  reference ='{reference}'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
}
