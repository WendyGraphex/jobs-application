<?php


class SiteHelpNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('help_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('help', new SiteHelpForm($this->getDefault('help')));
        $this->embedForm('help_i18n', new SiteHelpI18nForm($this->getDefault('help_i18n')));
        unset($this->help_i18n['id'],$this->help['id'],$this->help_i18n['help_id']);
    }
    
    function getIcon()
    {
        return $this['help']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['help']['icon']->hasValue();
    }
}

