<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerNotationCriteriaNewForm.class.php";

class employers_notation_ajaxNewCriteriaI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Criteria is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialCriteria');  
        }       
        $this->form= new EmployerNotationCriteriaNewForm((string)$form['lang'],array());
        $this->item_i18n=new EmployerNotationCriteriaI18n(array('lang'=>(string)$form['lang']));        
    }

}
