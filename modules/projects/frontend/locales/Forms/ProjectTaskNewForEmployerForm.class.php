<?php

class ProjectTaskNewForEmployerForm extends ProjectTaskBaseForm {
    
    protected $project=null;
    
    function __construct(Project $project,$defaults=array()) {
        $this->project=$project;
        parent::__construct($defaults);
    }
    
    function getProject()
    {
        return $this->project;
    }
    
    function configure() {
        parent::configure();
        $this->setValidator('state_id',new mfValidatorChoice(array('required'=>false,'key'=>true,'choices'=>ProjectTaskState::getStatesForI18nSelect()->unshift(array(''=>'')))));
        unset($this['id']);
    }
    
    function getValues()
    {
        $values=parent::getValues();
        $values['project_id']=$this->getProject();
        $values['employee_user_id']=$this->getProject()->get('employee_user_id');
        $values['employer_user_id']=$this->getProject()->get('employer_user_id');
        $values['creator']='EMPLOYER';
        return $values;
    }
}
