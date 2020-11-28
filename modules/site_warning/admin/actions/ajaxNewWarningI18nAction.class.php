<?php

require_once dirname(__FILE__)."/../locales/Forms/SiteWarningNewForm.class.php";

class site_warning_ajaxNewWarningI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Warning is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialWarning');  
        }       
        $this->form= new SiteWarningNewForm((string)$form['lang'],array());
        $this->item_i18n=new SiteWarningI18n(array('lang'=>(string)$form['lang']));        
    }

}
