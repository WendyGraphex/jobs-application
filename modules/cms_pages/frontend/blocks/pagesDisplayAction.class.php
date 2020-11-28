<?php

class cms_pages_pagesDisplayActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
        $this->pages=CmsPageI18nUtils::getPagesByNameAndLang($this->getParameter('pages'),$this->getUser()->getLanguage());
        if ($this->pages==null)
            return mfView::NONE;    
        $this->tpl=$this->getParameter('tpl','default.tpl');   
    } 
    
    
}