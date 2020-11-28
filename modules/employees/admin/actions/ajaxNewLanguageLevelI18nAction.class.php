<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeLanguageLevelNewForm.class.php";

class employees_ajaxNewLanguageLevelI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialLanguageLevel');  
        }       
        $this->form= new EmployeeLanguageLevelNewForm((string)$form['lang'],array());
        $this->item_i18n=new EmployeeLanguageLevelI18n(array('lang'=>(string)$form['lang']));        
    }

}
