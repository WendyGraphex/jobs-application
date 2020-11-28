<?php


class ProjectTaskStateNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;
        $defaults=array_merge(array('state_i18n'=>array('lang'=>$this->getLanguage())),$defaults);      
        parent::__construct($defaults);
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('state', new ProjectTaskStateBaseForm($this->getDefault('state')));
        $this->embedForm('state_i18n', new ProjectTaskStateI18nBaseForm($this->getDefault('state_i18n')));
        unset($this->state_i18n['id'],$this->state['id']);
    }
}

