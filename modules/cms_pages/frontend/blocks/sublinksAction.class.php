<?php

class cms_pages_sublinksActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                    
        $page_i18n=$request->getRequestParameter('page');// PageI18n
        $this->sublinks=$page_i18n->getBreadCrumb();           
    } 
    
    
}