<?php


class EmployerActivityNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('activity_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('activity', new EmployerActivityBaseForm($this->getDefault('activity')));
        $this->embedForm('activity_i18n', new EmployerActivityI18nBaseForm($this->getDefault('activity_i18n')));
        unset($this->activity_i18n['id'],$this->activity['id']);
    }
    
    function getIcon()
    {
        return $this['activity']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['activity']['icon']->hasValue();
    }
}

