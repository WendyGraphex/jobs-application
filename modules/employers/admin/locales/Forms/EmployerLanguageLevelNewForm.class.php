<?php


class EmployerLanguageLevelNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('level_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('level', new EmployerLanguageLevelBaseForm($this->getDefault('level')));
        $this->embedForm('level_i18n', new EmployerLanguageLevelI18nBaseForm($this->getDefault('level_i18n')));
        unset($this->level_i18n['id'],$this->level['id']);
    }
    
    function getIcon()
    {
        return $this['level']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['level']['icon']->hasValue();
    }
}

