<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerNotationCategoryNewForm.class.php";

class employers_notation_ajaxNewCategoryI18nAction extends mfAction {
    
       
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
        $this->form= new EmployerNotationCategoryNewForm((string)$form['lang'],array());
        $this->item_i18n=new EmployerNotationCategoryI18n(array('lang'=>(string)$form['lang']));        
    }

}
