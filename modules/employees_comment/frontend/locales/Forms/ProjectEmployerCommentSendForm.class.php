<?php

require_once __DIR__."/EmployeeAdvertCommentI18nForm.class.php";
    
class ProjectEmployerCommentSendForm extends mfForm {
    
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
    
    function getAdvertI18n()
    {
        return $this->_advert_i18n=$this->_advert_i18n===null?$this->getProject()->getWork()->getQuotation()->getEmployeeAdvertI18n():$this->_advert_i18n;
    }
    
    function configure() {              
        $this->createEmbedFormForEach('i18n', 'EmployeeAdvertCommentI18nForm', $this->getLanguages()->count());    
    }
  
    function getLanguages()
    {
        return $this->languages=$this->languages===null?LanguageUtils::getActiveLanguagesFrontendByPosition():$this->languages;
    }    
    
    function getValues()
    {
        $values=array();
        $values['comment']=array('employer_user_id'=>$this->getEmployerUser(),
                                 'sender'=>'EMPLOYER',
                                 'employee_user_id'=>$this->getProject()->get('employee_user_id'),
                                 'employee_advert_id'=>$this->getAdvertI18n()->get('advert_id'),
                                 'employee_advert_lang'=>$this->getAdvertI18n()->get('lang'),
                                 'project_id'=>$this->getProject(),
                                 'quotation_id'=>$this->getProject()->getWork()->getQuotation()
                                );
         $values['i18n']=$this['i18n']->getValue();
         return $values;
    }
  
        
}
