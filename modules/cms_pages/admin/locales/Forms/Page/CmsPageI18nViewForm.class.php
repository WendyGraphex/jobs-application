<?php

class CmsPageI18nViewForm extends mfForm {
   
    function configure()
    {
        $this->embedForm('page', new CmsPageBaseForm($this->getDefault('page')));
        $this->embedForm('page_i18n', new CmsPageI18nBaseForm($this->getDefault('page_i18n')));
        unset($this->page['id'],$this->page_i18n['id'],$this->page_i18n['in_menu']);
        if (isset($this->defaults['page_i18n']['url']) && $this->defaults['page_i18n']['url']!="")
            $this->page['name']->setOption('required',false);
        if (isset($this->defaults['page']['name']) && $this->defaults['page']['name']!="")
           $this->page_i18n['url']->setOption('required',false);  
        $this->page_i18n->addValidator('lang', new LanguagesExistsValidator(array(),'frontend'));
    }
}
