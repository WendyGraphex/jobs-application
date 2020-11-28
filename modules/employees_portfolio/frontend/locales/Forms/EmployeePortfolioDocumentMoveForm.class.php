<?php

class EmployeePortfolioDocumentMoveForm extends mfForm {
    
     protected $user=null;
    
    function __construct(Employee $user,$options=array())
    {
        $this->user=$user;        
        parent::__construct($options);       
    }
    
    function getEmployeeUser()
    {
        return $this->user;
    }
     
    function configure() {
          $this->setValidators(array(
              "id"=>new EmployeePortfolioDocumentValidator($this->getEmployeeUser()),
              'sibling'=>new EmployeePortfolioDocumentValidator($this->getEmployeeUser(),array('required'=>false,'empty_value'=>null)),
          ));       
    }
    
    function getDocument()
    {
        return $this['id']->getValue();
    }
    
    function hasSibling()
    {
        return (boolean)$this['sibling']->getValue(); 
    }
    
    function getSibling()
    {
        return $this['sibling']->getValue();
    }
    
}
