<?php

class cms_pages_PageViewAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {       
        $this->page_i18n=new CmsPageI18n(new mfDirname($request->getRequestParameter('url')),$this->getUser()->getLanguage());      
        $this->forwardIf(($this->page_i18n->isNotLoaded()),$this->getModuleName(),'Page404');
         // If page exist
        $request->addRequestParameter('page_i18n', $this->page_i18n);              
        // @TODO Check if layout exists ???
        $this->getViewManager()->getLayoutManager(array("template"=>"/cms_pages/".$this->page_i18n->get('layout')))->compile();
        $this->getViewManager()->setTemplate("./cms_pages/".$this->page_i18n->get('template'));
        $this->getResponse()->setTitle($this->page_i18n->get('meta_title'));
        $this->getResponse()->addMeta('description',$this->page_i18n->get('meta_description'));
        $this->getResponse()->addMeta('keywords',$this->page_i18n->get('meta_keywords'));
        $this->getResponse()->addMeta('robots',$this->page_i18n->get('meta_robots'));
         $this->max_characters=500;
    }
}

