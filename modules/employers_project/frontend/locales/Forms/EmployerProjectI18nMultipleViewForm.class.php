<?php

require_once __DIR__."/EmployerProjectI18nMultipleNewForm.class.php";


class EmployerProjectI18nMultipleViewForm extends EmployerProjectI18nMultipleNewForm {
    
    
    function __construct(EmployerProject $project, $defaults = array(), $options = array()) {
        $this->project=$project;
        parent::__construct($project->getEmployerUser(), $defaults, $options);
    }
     
    function configure() {  
        if (!$this->getDefaults())
        {
             $this->setDefaults(array(
                // 'projects'=>$this->getProject()->getProjectsI18n()->toArray()
             ));
        }    
        parent::configure();   
        unset($this['id']);
    }   
        
    function getProject()
    {     
       $this->project->add($this->isValid()?$this->getValues():$this->getDefaults());
       return $this->project;       
    }
}

