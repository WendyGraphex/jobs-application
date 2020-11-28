<?php


class CustomerAcademySoftwareForCategoryI18nNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('software_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('software', new CustomerAcademySoftwareBaseForm($this->getDefault('software')));
        $this->embedForm('software_i18n', new CustomerAcademySoftwareI18nBaseForm($this->getDefault('software_i18n')));        
        unset($this->software_i18n['id'],$this->software['id']);
    }
    
    function getIcon()
    {
        return $this['software']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['software']['icon']->hasValue();
    }
}

