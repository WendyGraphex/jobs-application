<?php


class EmployerBudgetUnitNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('unit_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('unit', new EmployerBudgetUnitForm($this->getDefault('unit')));
        $this->embedForm('unit_i18n', new EmployerBudgetUnitI18nBaseForm($this->getDefault('unit_i18n')));
        unset($this->unit_i18n['id'],$this->unit['id']);
    }
    
    function getIcon()
    {
        return $this['unit']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['unit']['icon']->hasValue();
    }
}

