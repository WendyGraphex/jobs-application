<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeSkillNewForm.class.php";

class employees_ajaxNewSkillI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Skill is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialSkill');  
        }       
        $this->form= new EmployeeSkillNewForm((string)$form['lang'],array());
        $this->item_i18n=new EmployeeSkillI18n(array('lang'=>(string)$form['lang']));        
    }

}
