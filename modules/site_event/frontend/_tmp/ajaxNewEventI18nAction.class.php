<?php

require_once dirname(__FILE__)."/../locales/Forms/SiteEventNewForm.class.php";

class site_event_ajaxNewEventI18nAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {    
           if (!$this->getUser()->isEventUser())             
           $this->forwardTo401Action();       
        $messages = mfMessages::getInstance();            
        $form=new LanguageFrontendForm($this->getUser()->getLanguage());
        $form->bind($request->getPostParameter('lang'));
        if (!$form->isValid())
        {
            $messages->addError(__("Event is not valid."));
            $request->addRequestParameter('lang',$this->getUser()->getLanguage());
            $this->forward($this->getModuleName(),'ajaxListPartialEvent');  
        }       
        $this->form= new SiteEventNewForm((string)$form['lang'],array());
        $this->event_i18n=new SiteEventI18n(array('lang'=>(string)$form['lang']));        
    }

}
