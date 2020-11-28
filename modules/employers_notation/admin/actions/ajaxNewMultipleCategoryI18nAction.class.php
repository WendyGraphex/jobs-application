<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerNotationCategoryI18nMultipleNewForm.class.php";

class employers_notation_ajaxNewMultipleCategoryI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
         $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialCategory');  
        }       
        $this->form= new EmployerNotationCategoryI18nMultipleNewForm($form->getLanguage());       
    }

}

