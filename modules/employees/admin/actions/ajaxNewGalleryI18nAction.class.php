<?php

require_once __DIR__."/../locales/Forms/EmployeeGalleryNewForm.class.php";

class employees_ajaxNewGalleryI18nAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance(); 
         $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward('employees','ajaxListPartialGallery');  
        }       
        $this->form= new EmployeeGalleryNewForm((string)$form['lang'],array());
        $this->item_i18n=new EmployeeGalleryI18n(array('lang'=>(string)$form['lang']));       
    }
}
