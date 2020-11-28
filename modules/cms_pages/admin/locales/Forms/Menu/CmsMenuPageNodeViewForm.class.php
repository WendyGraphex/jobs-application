<?php

require_once __DIR__."/CmsMenuPageI18nForm.class.php";

class CmsMenuPageNodeViewForm extends CmsMenuPageI18nForm {

    protected $language=null;
    
    function __construct(CmsMenuI18n $menu_i18n,$defaults=array())
    {       
        $this->language=$menu_i18n->getLanguage();       
        parent::__construct($defaults);
    }
           
    function getLanguage()
    {
        return $this->language;
    }
    
    function configure()
    {
        parent::configure();
        $this->embedForm('menu_i18n',new CmsMenuI18nForm($this->getDefault('menu_i18n')));
        $this->embedForm('menu', new CmsMenuForm($this->getDefault('menu')));    
        $this->menu->setValidator('page_id',new ObjectExistsValidator('CmsPage',array('key'=>false,'required'=>false)));
        unset($this->menu_i18n['id'],$this->menu['id'],
              $this->page_i18n['page_id'],$this->page_i18n['lang'], 
              $this->page_i18n['id'],$this->page['id']);                
        if (isset($this->defaults['page_i18n']['url']) && $this->defaults['page_i18n']['url']!="")
            $this->page['name']->setOption('required',false);
        if (isset($this->defaults['page']['name']) && $this->defaults['page']['name']!="")
           $this->page_i18n['url']->setOption('required',false);      
        if (isset($this->defaults['menu']['name']) && $this->defaults['menu']['name']!="")       
          $this->page_i18n['url']->setOption('required',false);          
    }
    
    
    function getValuesForMenu()
    {
        $values= $this['menu']->getValue();
        if ($this['menu']['page_id']->getValue())
            $values['page_id']=$this['menu']['page_id']->getValue();
        else 
            $values['page_id']=null;
        return $values;
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
        return $this->values['page']['name'] || $this->values['page_i18n']['url'] || $this['menu']['page_id']->getValue();
    }
}

