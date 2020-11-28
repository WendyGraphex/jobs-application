<?php


class EmployeeLanguageLevelNewForm extends mfForm {
         
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
        $this->embedForm('level', new EmployeeLanguageLevelForm($this->getDefault('level')));
        $this->embedForm('level_i18n', new EmployeeLanguageLevelI18nForm($this->getDefault('level_i18n')));
        unset($this->level_i18n['id'],$this->level['id'],$this->level_i18n['level_id']);
    }
    
    
}

