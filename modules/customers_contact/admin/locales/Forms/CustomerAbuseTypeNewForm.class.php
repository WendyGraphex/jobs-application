<?php


class CustomerAbuseTypeNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('abuse_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('abuse', new CustomerAbuseTypeForm($this->getDefault('abuse')));
        $this->embedForm('abuse_i18n', new CustomerAbuseTypeI18nForm($this->getDefault('abuse_i18n')));
        unset($this->abuse_i18n['id'],$this->abuse['id'],$this->abuse_i18n['abuse_id']);
    }
    
    function getIcon()
    {
        return $this['abuse']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['abuse']['icon']->hasValue();
    }
}

