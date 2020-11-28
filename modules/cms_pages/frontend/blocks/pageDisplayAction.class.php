<?php

class cms_pages_pageDisplayActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
        $this->page=CmsPageI18nUtils::getPageByNameAndLang($this->getParameter('page'),$this->getUser()->getLanguage());
        if ($this->page==null)
            return mfView::NONE; 
        $this->tpl=$this->getParameter('tpl','default.tpl');
    } 
    
    
}