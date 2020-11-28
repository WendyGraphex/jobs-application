<?php


class EmployeeGraduateDiplomaNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('graduate_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('graduate', new EmployeeGraduateDiplomaForm($this->getDefault('graduate')));
        $this->embedForm('graduate_i18n', new EmployeeGraduateDiplomaI18nForm($this->getDefault('graduate_i18n')));
        unset($this->graduate_i18n['id'],$this->graduate['id'],$this->graduate_i18n['graduate_id']);
    }
    
   
}

