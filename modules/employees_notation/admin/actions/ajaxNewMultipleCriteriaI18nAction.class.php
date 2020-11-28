<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeNotationCriteriaI18nMultipleNewForm.class.php";

class employees_notation_ajaxNewMultipleCriteriaI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
         $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialCriteria');  
        }       
        $this->form= new EmployeeNotationCriteriaI18nMultipleNewForm($form->getLanguage());       
    }

}

