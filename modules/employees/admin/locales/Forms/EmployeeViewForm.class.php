<?php


 
 class EmployeeViewForm extends  EmployeeBaseForm {
 
     protected $_user=null;
     
     function __construct($user,$defaults=array()) {        
        $this->_user=$user;
        parent::__construct($defaults);
    }
    
    function getUser()
    {
        return $this->user;
    }
    
    
}

