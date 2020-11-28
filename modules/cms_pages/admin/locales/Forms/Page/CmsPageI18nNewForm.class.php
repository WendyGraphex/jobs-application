<?php


class CmsPageI18nNewForm extends mfForm {

    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('page_i18n'=>array('lang'=>$this->getLanguage())),$defaults));
    }
           
    function getLanguage()
    {
        if ($this->isValid())       
           return $this['page_i18n']['lang']->getValue()->get('code');
        if ($this->hasDefaults() && $this->defaults['page_i18n']['lang'])
            return $this->defaults['page_i18n']['lang'];
        return $this->language;
    }
    
    function configure()
    {                
        $this->embedForm('page', new CmsPageForm($this->getDefault('page')));
        $this->embedForm('page_i18n', new CmsPageI18nForm($this->getDefault('page_i18n')));
        unset($this->page['id'],$this->page_i18n['id'],$this->page_i18n['page_id']);
        if (isset($this->defaults['page_i18n']['url']) && $this->defaults['page_i18n']['url']!="")
            $this->page['name']->setOption('required',false);
        if (isset($this->defaults['page']['name']) && $this->defaults['page']['name']!="")
           $this->page_i18n['url']->setOption('required',false);             
    }
    
}

