<?php
 
class site_gallery_picturesGalleryDisplayFromNameActionComponent extends mfActionComponent {
    
    function execute(mfWebRequest $request) {          
         $this->gallery_pictures=SitePictureGalleryUtils::getPictureSiteGalleryByLangAndName($this->getParameter('id'),$this->getUser()->getLanguage());       
         $this->gallery_i18n=SiteGalleryUtils::getSiteGalleryByLangAndName($this->getParameter('id'),$this->getUser()->getLanguage());    
         $this->options=$this->getParameter('options');
         $this->theme=$this->getParameter('theme');
         $this->tpl=$this->getParameter('tpl');
         
//         var_dump($this->gallery_i18n);
    }
    
}    