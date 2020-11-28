<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerAcademyLevelI18nMultipleNewForm.class.php";

class customers_academy_ajaxNewMultipleLevelI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
         $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialLevel');  
        }       
        $this->form= new CustomerAcademyLevelI18nMultipleNewForm($form->getLanguage());       
    }

}

