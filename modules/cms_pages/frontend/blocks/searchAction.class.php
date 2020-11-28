<?php
 
class cms_pages_searchActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request) {             
         $this->collection=CmsPageI18nUtils::search($this->getParameter('query'), $this->getUser()->getLanguage());          
    }
    
}    