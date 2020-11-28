<?php

require_once __DIR__."/../locales/Forms/EmployerCityGalleryNewForm.class.php";

class employers_ajaxNewCityI18nAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {
      
        $messages = mfMessages::getInstance(); 
         $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward('employers_gallery','ajaxListPartialCity');  
        }       
        $this->form= new EmployerCityGalleryNewForm((string)$form['lang'],array());
        $this->item_i18n=new EmployerCityGalleryI18n(array('lang'=>(string)$form['lang']));       
    }
}
