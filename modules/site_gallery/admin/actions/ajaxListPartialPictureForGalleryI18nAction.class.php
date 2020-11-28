<?php


class site_gallery_ajaxListPartialPictureForGalleryI18nAction extends mfAction {
       
            
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();       
        $this->user=$this->getUser();
        $this->gallery_i18n=$request->getRequestParameter('gallery_i18n',new SiteGalleryI18n($request->getPostParameter('SiteGalleryI18n')));    
      
    }

}
