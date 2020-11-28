<?php

class EmployeeSendQuoteForm extends mfForm {
    
    protected $project_request=null;
    
    function __construct(EmployerQuotationProjectRequest $project_request,$defaults = array(), $options = array()) {
        $this->project_request=$project_request;
        parent::__construct($defaults, $options);
    }
    
    function getProjectRequest()
    {
        return $this->project_request;
    }
    
    function configure() {
        $this->setValidators(array(
            'description'=>new mfValidatorString(array('max_length'=>500)),
            'price'=>new mfValidatorI18nNumber(),   
        ));
    }
        
    function getValues()
    {
        $values=parent::getValues();
        $values['employer_user_id']=$this->getProjectRequest()->get('employer_user_id');
        $values['project_id']=$this->getProjectRequest()->get('project_id');
        $values['employee_advert_id']=$this->getProjectRequest()->getRequest()->get('advert_id');
        $values['employee_advert_lang']=$this->getProjectRequest()->getRequest()->get('lang');
        return $values;
    }
}
 
