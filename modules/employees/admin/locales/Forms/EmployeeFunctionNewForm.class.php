<?php


class EmployeeFunctionNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('function_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('function', new EmployeeFunctionForm($this->getDefault('function')));
        $this->embedForm('function_i18n', new EmployeeFunctionI18nForm($this->getDefault('function_i18n')));
        unset($this->function_i18n['id'],$this->function_i18n['function_id'],$this->function['id']);
    }
    
    function getIcon()
    {
        return $this['function']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['function']['icon']->hasValue();
    }
}

