<?php


class EmployeeNotationCategoryNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('category_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('category', new EmployeeNotationCategoryForm($this->getDefault('category')));
        $this->embedForm('category_i18n', new EmployeeNotationCategoryI18nForm($this->getDefault('category_i18n')));
        unset($this->category_i18n['id'],$this->category['id'],$this->category_i18n['category_id']);
    }
    
    function getIcon()
    {
        return $this['category']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['category']['icon']->hasValue();
    }
}

