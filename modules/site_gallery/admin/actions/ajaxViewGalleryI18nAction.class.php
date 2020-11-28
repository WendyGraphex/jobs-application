<?php

require_once __DIR__."/../locales/Forms/SiteGalleryI18nViewForm.class.php";

 
class site_gallery_ajaxViewGalleryI18nAction extends mfAction {
         
    function execute(mfWebRequest $request) {                   
        $messages = mfMessages::getInstance();      
        $this->user=$this->getUser();
        $this->form = new SiteGalleryI18nViewForm($this->getUser());
        $this->item=new SiteGalleryI18n($request->getPostParameter('SiteGalleryI18n'));       
   }

}

