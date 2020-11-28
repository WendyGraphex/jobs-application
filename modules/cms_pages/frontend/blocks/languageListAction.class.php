<?php


class cms_pages_languageListActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $page_i18n=$request->getRequestParameter('page');
        $this->pages=$page_i18n->getI18nPages();            
        $this->language_active=$request->getLanguage();
        $this->referer=$request->getURI();
    } 
    
    
}