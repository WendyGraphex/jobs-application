<?php


class SiteWarningNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('warning_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('warning', new SiteWarningForm($this->getDefault('warning')));
        $this->embedForm('warning_i18n', new SiteWarningI18nForm($this->getDefault('warning_i18n')));
        unset($this->warning_i18n['id'],$this->warning['id'],$this->warning_i18n['warning_id']);
    }
    
    function getIcon()
    {
        return $this['warning']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['warning']['icon']->hasValue();
    }
}

