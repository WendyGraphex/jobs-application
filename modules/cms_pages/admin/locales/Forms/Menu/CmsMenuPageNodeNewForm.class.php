<?php

class CmsMenuPageNodeNewForm extends mfForm {

    protected $language=null;
    
    function __construct(Language $language,$defaults=array())
    {       
        $this->language=$language;       
        parent::__construct($defaults);
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {        
        $this->embedForm('menu_i18n',new CmsMenuI18nForm($this->getDefault('menu_i18n')));
        $this->embedForm('menu', new CmsMenuForm($this->getDefault('menu')));
        if ($this->getDefault('page') || !$this->getDefaults())
        {                                
            $this->embedForm('page', new CmsPageForm($this->getDefault('page')));
            $this->embedForm('page_i18n', new CmsPageI18nForm($this->getDefault('page_i18n')));        
        }
        unset($this->menu_i18n['id'],$this->menu['id'],
              $this->page_i18n['page_id'],$this->page_i18n['lang'], 
              $this->page_i18n['id'],$this->page['id']);         
        if (isset($this->defaults['page_i18n']['url']) && $this->defaults['page_i18n']['url']!="" && $this->hasValidator('page'))
            $this->page['name']->setOption('required',false);
        if (isset($this->defaults['page']['name']) && $this->defaults['page']['name']!="" && $this->hasValidator('page_i18n'))
           $this->page_i18n['url']->setOption('required',false);      
        if (isset($this->defaults['menu']['name']) && $this->defaults['menu']['name']!="" && $this->hasValidator('page_i18n'))       
          $this->page_i18n['url']->setOption('required',false);          
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
    
    function getValuesForPage()
    {
        return $this['page']->getValue();
    }
    
    function getValuesForPageI18n()
    {
        $values= $this['page_i18n']->getValue();
         $values['lang']=$this->getLanguage()->get('code');
        return $values;
    }
    
    function hasPage()
    {
       /* if ($this->hasErrors())
             return $this->defaults['page']['name'] || $this->defaults['page_i18n']['url'];
        return $this->values['page']['name'] || $this->values['page_i18n']['url'];*/
        return $this->getDefaults() && $this->hasValidator('page');
    }
}

