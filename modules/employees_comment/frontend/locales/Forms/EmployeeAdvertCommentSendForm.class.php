<?php

require_once __DIR__."/EmployeeAdvertCommentI18nForm.class.php";
    
class EmployeeAdvertCommentSendForm extends mfForm {
    
    protected $user=null;
    
    function __construct($user,$defaults = array(), $options = array()) {      
        $this->user=$user;
        parent::__construct($defaults, $options);
    }
    
    function getEmployerUser()
    {
        return $this->getUser()->getGuardUser();
    }
    
    function getUser()
    {
        return $this->user;
    }
    
    function configure() {
        $this->setValidators(array(
            'advert_id'=>new ObjectExistsValidator('EmployeeAdvert',array('key'=>false)),                      
            "advert_lang"=> new LanguagesExistsValidator(array(),'frontend'),            
        ));       
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
                                 'employee_user_id'=>$this['advert_id']->getValue()->get('employee_user_id'),
                                 'advert_id'=>$this['advert_id']->getValue(),
                                 'advert_lang'=>$this['advert_lang']->getValue()
                                );
         $values['i18n']=$this['i18n']->getValue();
         return $values;
    }
  
}
