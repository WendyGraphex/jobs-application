<?php


class EmployeeExperienceNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('experience_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('experience', new EmployeeExperienceForm($this->getDefault('experience')));
        $this->embedForm('experience_i18n', new EmployeeExperienceI18nForm($this->getDefault('experience_i18n')));
        unset($this->experience_i18n['id'],$this->experience_i18n['experience_id'],$this->experience['id']);
    }
    
    function getIcon()
    {
        return $this['experience']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['experience']['icon']->hasValue();
    }
}

