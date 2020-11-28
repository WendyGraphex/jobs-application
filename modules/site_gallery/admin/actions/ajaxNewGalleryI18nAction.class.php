<?php

require_once __DIR__."/../locales/Forms/SiteGalleryNewForm.class.php";

class site_gallery_ajaxNewGalleryI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();                  
        $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {            
            $messages->addError(__("language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward('site_gallery','ajaxListPartialGallery');  
        }
        $this->user=$this->getUser();
        $this->form= new SiteGalleryNewForm($this->user,(string)$form['lang']);        
        $this->gallery_i18n=new SiteGalleryI18n(array('lang'=>(string)$form['lang']));            
    }

}
