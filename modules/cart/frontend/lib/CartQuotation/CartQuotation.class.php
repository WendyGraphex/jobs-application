<?php

class CartQuotation extends CartQuotationBase {
     
   function __construct($parameters = null,$user=null) {
        if ($user instanceof EmployerUser)
            $this->set('employer_user_id',$user);
         if ($user instanceof Cart)
            $this->set('cart_id',$user);
        $this->getDefaults();
        if (is_numeric($parameters) && $user instanceof EmployerUser)      
            return $this->loadByIdAndEmployer($parameters,$user);     
        if (is_numeric($parameters) && $user instanceof Cart)      
            return $this->loadByIdAndCart($parameters,$user);    
        if ($user) return ;
        parent::__construct($parameters);
    }
    
    function loadByIdAndEmployer($id,EmployerUser $user)
    {       
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'employer_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                       " WHERE  ".self::getTableField('employer_user_id')."='{employer_user_id}' AND  id ='{id}'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
     function loadByIdAndCart($id,Cart $cart)
    {       
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'cart_id'=>$cart->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                       " WHERE  ".self::getTableField('cart_id')."='{cart_id}' AND  id ='{id}'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
}
