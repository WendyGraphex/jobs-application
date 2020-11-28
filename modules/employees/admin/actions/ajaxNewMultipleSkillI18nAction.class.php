<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeSkillI18nMultipleNewForm.class.php";

class employees_ajaxNewMultipleSkillI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
         $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialSkill');  
        }       
        $this->form= new EmployeeSkillI18nMultipleNewForm($form->getLanguage());       
    }

}

