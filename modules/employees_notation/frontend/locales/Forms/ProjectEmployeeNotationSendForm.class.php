<?php


class ProjectEmployeeNotationSendForm extends mfForm {
    
    protected $employee_user=null,$project=null;
    
    function __construct(Employee $user,Project $project,$defaults = array(), $options = array()) {      
        $this->employee_user=$user;
        $this->project=$project;
        parent::__construct($defaults, $options);
    }
    
    function getEmployeeUser()
    {
        return $this->employee_user;
    }
    
    function getProject()
    {
        return $this->project;
    }       
      
    function configure() {              
       $this->createEmbedFormForEach('notations', 'CustomerNotationForm',$this->getCriteriasByCategories()->getCriterias()->count()) ;
    }
  
    function getCriteriasByCategories()
    {
        return EmployerNotationCategoryCollection ::getCriteriasByCategories();           
    }          
    
    
  
        
}
