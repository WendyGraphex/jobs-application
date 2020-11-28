<?php

require_once __DIR__."/EmployerAdvertCommentI18nForm.class.php";
    
class EmployerAdvertCommentSendForm extends mfForm {
    
    protected $user=null;
    
    function __construct($user,$defaults = array(), $options = array()) {      
        $this->user=$user;
        parent::__construct($defaults, $options);
    }
    
    function getEmployeeUser()
    {
        return $this->getUser()->getGuardUser();
    }
    
    function getUser()
    {
        return $this->user;
    }
    
    function configure() {
        $this->setValidators(array(
            'advert_id'=>new ObjectExistsValidator('EmployerAdvert',array('key'=>false)),                      
            "advert_lang"=> new LanguagesExistsValidator(array(),'frontend'),            
        ));       
        $this->createEmbedFormForEach('i18n', 'EmployerAdvertCommentI18nForm', $this->getLanguages()->count());    
    }
  
    function getLanguages()
    {
        return $this->languages=$this->languages===null?LanguageUtils::getActiveLanguagesFrontendByPosition():$this->languages;
    }    
    
    function getValues()
    {
        $values=array();
        $values['comment']=array('employee_user_id'=>$this->getEmployeeUser(),
                                 'employer_user_id'=>$this['advert_id']->getValue()->get('employer_user_id'),
                                 'advert_id'=>$this['advert_id']->getValue(),
                                 'advert_lang'=>$this['advert_lang']->getValue()
                                );
         $values['i18n']=$this['i18n']->getValue();
         return $values;
    }
  
}
