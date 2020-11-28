<?php


class GroupNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;
        $defaults=array_merge(array('group_i18n'=>array('lang'=>$this->getLanguage())),$defaults);      
        parent::__construct($defaults);
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('group', new GroupBaseForm($this->getDefault('group')));
        $this->embedForm('group_i18n', new GroupI18nBaseForm($this->getDefault('group_i18n')));
        unset($this->group_i18n['id'],$this->group['id']);
    }
}

