<?php

class cms_pages_sitemapActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
        $node=new CmsMenu($this->getParameter('parent','root'));             
        $this->children=$node->getChildrenI18n($this->getUser()->getLanguage(),array("is_sitemap"=>"YES"));     
        $this->pages_in_blocks=  CmsBlockUtils::getPagesInBlocks($this->getUser()->getLanguage());      
        $this->pages_alone=CmsPageI18nUtils::getOrpholinPages($this->getUser()->getLanguage());       
    } 
    
    
}