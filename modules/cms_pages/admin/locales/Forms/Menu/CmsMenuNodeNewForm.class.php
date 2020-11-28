<?php

class CmsMenuNodeNewForm extends mfForm {

    protected $language=null;
    
    function __construct(Language $language,$defaults=array())
    {       
        $this->language=$language;       
        parent::__construct(array_merge(array('menu_i18n'=>array('lang'=>$this->getLanguage()->get('code'))),$defaults));
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        $this->embedForm('menu_i18n',new CmsMenuI18nForm($this->getDefault('menu_i18n')));
        $this->embedForm('menu', new CmsMenuForm($this->getDefault('menu')));   
        $this->menu['name']->setOption('required',true);
        unset($this->menu_i18n['id'],$this->menu['id']);     
      
    }
    
    
    function getValuesForMenu()
    {
        return $this['menu']->getValue();
    }
    
    function getValuesForMenuI18n()
    {
        $values= $this['menu_i18n']->getValue();
        $values['lang']=$this->getLanguage()->get('code');
        return $values;
    }
       
}

