<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployeeNotationCategoryNewForm.class.php";

class employees_notation_ajaxNewCategoryI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Category is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialCategory');  
        }       
        $this->form= new EmployeeNotationCategoryNewForm((string)$form['lang'],array());
        $this->item_i18n=new EmployeeNotationCategoryI18n(array('lang'=>(string)$form['lang']));        
    }

}
