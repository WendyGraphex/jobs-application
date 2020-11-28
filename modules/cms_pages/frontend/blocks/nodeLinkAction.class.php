<?php

class cms_pages_nodeLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {      
        // display node 
        $this->page_i18n=CmsPageI18nUtils::getPageByNameAndLang($this->getParameter('node'),$this->getUser()->getLanguage());  
        $this->target=$this->getParameter('target','_blank');  
        $this->tpl=$this->getParameter('tpl','default');                 
    } 
    
    
}