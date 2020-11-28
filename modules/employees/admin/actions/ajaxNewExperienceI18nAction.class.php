<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeExperienceNewForm.class.php";

class employees_ajaxNewExperienceI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialExperience');  
        }       
        $this->form= new EmployeeExperienceNewForm((string)$form['lang'],array());
        $this->item_i18n=new EmployeeExperienceI18n(array('lang'=>(string)$form['lang']));        
    }

}
