<?php

require_once dirname(__FILE__)."/../locales/Forms/SiteHelpNewForm.class.php";

class site_help_ajaxNewHelpI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();            
        $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Help is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialHelp');  
        }       
        $this->form= new SiteHelpNewForm((string)$form['lang'],array());
        $this->item_i18n=new SiteHelpI18n(array('lang'=>(string)$form['lang']));        
    }

}
