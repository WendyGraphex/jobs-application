<?php

class site_gallery_ajaxPositionGalleryPictureAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();                       
        try
        {
           $this->gallery_i18n=new SiteGalleryI18n($request->getPostParameter('SiteGalleryI18n'));             
        }
        catch (mfException $e)
        {
             $messages->addError($e);
        }
    }

}
