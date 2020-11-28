<?php


class CustomerAcademyTopicForCategoryI18nNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('topic_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('topic', new CustomerAcademyTopicBaseForm($this->getDefault('topic')));
        $this->embedForm('topic_i18n', new CustomerAcademyTopicI18nBaseForm($this->getDefault('topic_i18n')));        
        unset($this->topic_i18n['id'],$this->topic['id']);
    }
    
    function getIcon()
    {
        return $this['topic']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['topic']['icon']->hasValue();
    }
}

