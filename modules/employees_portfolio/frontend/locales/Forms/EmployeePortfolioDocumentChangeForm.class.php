<?php

class EmployeePortfolioDocumentChangeForm extends mfForm {
    
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
     
    
    function configure()
    {
        $this->setValidators(array(
                 "id"=>new EmployeePortfolioDocumentValidator($this->getEmployeeUser()),
                 "value"=> new mfValidatorChoice(array("choices"=>array("NO","YES"))),                
                ));
    }
    
    function getIsActiveValue()
    {
        return ((string)$this['value']=='YES')?"NO":"YES";
    }
    
    function getToggle()
    {
         return ((string)$this['value']=='YES')?"NO":"YES";
    }
    
    function getDocument()
    {
        return $this['id']->getValue();
    }
}
