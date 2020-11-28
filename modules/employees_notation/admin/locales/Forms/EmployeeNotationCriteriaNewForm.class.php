<?php


class EmployeeNotationCriteriaNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('criteria_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('criteria', new EmployeeNotationCriteriaForm($this->getDefault('criteria')));
        $this->embedForm('criteria_i18n', new EmployeeNotationCriteriaI18nForm($this->getDefault('criteria_i18n')));
        $this->criteria->setValidator('category_id',new mfValidatorCHoice(array('key'=>true,'required'=>false,'choices'=> EmployeeNotationCategory::getCategoriesByPositionForSelect()->unshift(array(''=>'')))));
        unset($this->criteria_i18n['id'],$this->criteria['id'],$this->criteria_i18n['criteria_id']);
    }
    
    function getIcon()
    {
        return $this['criteria']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['criteria']['icon']->hasValue();
    }
}

