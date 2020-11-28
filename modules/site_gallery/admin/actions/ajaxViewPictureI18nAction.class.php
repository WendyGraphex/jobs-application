<?php

 require_once __DIR__."/../locales/Forms/SitePictureI18nViewForm.class.php";
 
class site_gallery_ajaxViewPictureI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {             
     
        $messages = mfMessages::getInstance();        
        $this->form = new SitePictureI18nViewForm();
        $this->item_i18n=new SitePictureI18n($request->getPostParameter('SitePictureI18n'));                       
   }

}

