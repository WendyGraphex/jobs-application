<?php


class SaleBillingStateNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('state_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('state', new SaleBillingStateForm($this->getDefault('state')));
        $this->embedForm('state_i18n', new SaleBillingStateI18nForm($this->getDefault('state_i18n')));
        unset($this->state_i18n['id'],$this->state['id']);
    }
    
    function getIcon()
    {
        return $this['state']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['state']['icon']->hasValue();
    }
}

