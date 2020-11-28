<?php


class CustomerClaimTypeNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('type_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('type', new CustomerClaimTypeForm($this->getDefault('type')));
        $this->embedForm('type_i18n', new CustomerClaimTypeI18nBaseForm($this->getDefault('type_i18n')));
        unset($this->type_i18n['id'],$this->type['id']);
    }
    
    function getIcon()
    {
        return $this['type']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['type']['icon']->hasValue();
    }
}

