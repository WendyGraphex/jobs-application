<?php

require_once dirname(__FILE__)."/../locales/Forms/EmployerActivityNewForm.class.php";

class employers_ajaxNewActivityI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Language is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialActivity');  
        }       
        $this->form= new EmployerActivityNewForm((string)$form['lang'],array());
        $this->item_i18n=new EmployerActivityI18n(array('lang'=>(string)$form['lang']));        
    }

}
