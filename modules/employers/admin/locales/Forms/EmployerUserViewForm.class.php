<?php


 
 class EmployerUserViewForm extends  EmployerUserBaseForm {
 
     protected $_user=null;
     
     function __construct($user,$defaults=array()) {        
        $this->_user=$user;
        parent::__construct($defaults);
    }
    
    function getUser()
    {
        return $this->user;
    }
    
    function getAvatar()
    {
        return $this['avatar']->getValue();
    }
    
    function hasAvatar()
    {
        return $this['avatar']->hasValue();
    }
    
    
}

