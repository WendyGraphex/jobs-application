<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeGraduateDiplomaNewForm.class.php";

class employees_ajaxNewGraduateI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialGraduate');  
        }       
        $this->form= new EmployeeGraduateDiplomaNewForm((string)$form['lang'],array());
        $this->item_i18n=new EmployeeGraduateDiplomaI18n(array('lang'=>(string)$form['lang']));        
    }

}
