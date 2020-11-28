<?php

require_once __DIR__."/../locales/Forms/EmployerGalleryNewForm.class.php";

class employers_ajaxNewGalleryI18nAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance(); 
         $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward('employers','ajaxListPartialGallery');  
        }       
        $this->form= new EmployerGalleryNewForm((string)$form['lang'],array());
        $this->item_i18n=new EmployerGalleryI18n(array('lang'=>(string)$form['lang']));       
    }
}
