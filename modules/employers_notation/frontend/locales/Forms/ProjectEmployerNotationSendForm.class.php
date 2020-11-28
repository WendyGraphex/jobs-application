<?php


class ProjectEmployerNotationSendForm extends mfForm {
    
    protected $employer_user=null,$project=null;
    
    function __construct(EmployerUser $user,Project $project,$defaults = array(), $options = array()) {      
        $this->employer_user=$user;
        $this->project=$project;
        parent::__construct($defaults, $options);
    }
    
    function getEmployerUser()
    {
        return $this->employer_user;
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
        return EmployeeNotationCategoryCollection ::getCriteriasByCategories();           
    }          
    
    
  
        
}
