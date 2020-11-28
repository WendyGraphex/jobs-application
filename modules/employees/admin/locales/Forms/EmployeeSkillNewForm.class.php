<?php


class EmployeeSkillNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('skill_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('skill', new EmployeeSkillForm($this->getDefault('skill')));
        $this->embedForm('skill_i18n', new EmployeeSkillI18nForm($this->getDefault('skill_i18n')));
        unset($this->skill_i18n['id'],$this->skill['id'],$this->skill_i18n['skill_id']);
    }
    
    function getIcon()
    {
        return $this['skill']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['skill']['icon']->hasValue();
    }
    
    function getPicture()
    {
        return $this['skill']['picture']->getValue();
    }
    
    function hasPicture()
    {
        return $this['skill']['picture']->hasValue();
    }
}

