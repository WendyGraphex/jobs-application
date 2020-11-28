<?php

class cms_pages_blockActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
        $this->pages=CmsBlockUtils::getBlockByNameAndCountry($this->getParameter('id'),$this->getUser()->getLanguage());
    } 
    
    
}