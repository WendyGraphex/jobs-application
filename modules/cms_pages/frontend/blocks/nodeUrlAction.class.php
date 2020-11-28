<?php

class cms_pages_nodeUrlActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->pageI18n=CmsPageI18nUtils::getPageByNameandLang($this->getParameter('page'),$this->getUser()->getLanguage());          
        if (!$this->pageI18n)
            return mfView::NONE;
        $this->target=$this->getParameter('target');
        $this->meta_title=$this->getParameter('meta_title');
        $this->subject=http_build_query(array("info"=>array("subject"=>$this->getParameter('subject'))));  
        $this->tpl=$this->getParameter('tpl','default.tpl');
    } 
    
    
}