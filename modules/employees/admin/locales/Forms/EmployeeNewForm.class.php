<?php


 class EmployeeNewForm extends EmployeeBaseForm {
 
    protected $_user=null;
    
     function __construct($user,$defaults=array()) {        
        $this->_user=$user;
        parent::__construct($defaults);
    }
    
    
    function configure()
    {
        parent::configure();
        unset($this['id']);       
        
    }
 
}