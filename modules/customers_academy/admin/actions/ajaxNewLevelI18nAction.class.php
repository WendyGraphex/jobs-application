<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerAcademyLevelNewForm.class.php";

class customers_academy_ajaxNewLevelI18nAction extends mfAction {
    
       
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
        $this->form= new CustomerAcademyLevelNewForm((string)$form['lang'],array());
        $this->item_i18n=new CustomerAcademyLevelI18n(array('lang'=>(string)$form['lang']));        
    }

}
