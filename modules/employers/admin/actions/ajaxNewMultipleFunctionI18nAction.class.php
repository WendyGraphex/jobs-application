<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerFunctionI18nMultipleNewForm.class.php";

class employers_ajaxNewMultipleFunctionI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
         $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialFunction');  
        }       
        $this->form= new EmployerFunctionI18nMultipleNewForm($form->getLanguage());       
    }

}

