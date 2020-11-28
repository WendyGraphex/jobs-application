<?php

class cms_pages_Page404Action extends mfAction {
    
    function execute(mfWebRequest $request) {                  
        $this->page_i18n=$request->getRequestParameter('page404',CmsPageI18nUtils::getPageByNameandLang('404',$this->getUser()->getLanguage()));             
        $this->forwardIf(($this->page_i18n==null),mfConfig::get('mf_error_404_module'), mfConfig::get('mf_error_404_action'));        
        // If page exist
        $this->uri=$request->getURI();
        $request->addRequestParameter('page_i18n', $this->page_i18n);
        $this->getViewManager()->getLayoutManager(array("template"=>"/cms_pages/".$this->page_i18n->get('layout')))->compile();
        $this->getViewManager()->setTemplate($this->page_i18n->get('template'));
        $this->getResponse()->setTitle($this->page_i18n->get('meta_title'));
        $this->getResponse()->addMeta('description',$this->page_i18n->get('meta_description'));
        $this->getResponse()->addMeta('keywords',$this->page_i18n->get('meta_keywords'));
    }
}

