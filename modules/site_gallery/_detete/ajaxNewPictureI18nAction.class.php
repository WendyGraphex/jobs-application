<?php

require_once __DIR__."/../locales/Forms/SitePictureNewForm.class.php";

class site_gallery_ajaxNewPictureI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();               
        $this->item_i18n=new SitePictureI18n($request->getPostParameter('SitePictureI18n'));             
    }

}
