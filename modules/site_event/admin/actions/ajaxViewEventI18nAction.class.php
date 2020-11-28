<?php

require_once dirname(__FILE__)."/../locales/Forms/SiteEventViewForm.class.php";
 
class site_event_ajaxViewEventI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new SiteEventViewForm();
        $this->event_i18n=new SiteEventI18n($request->getPostParameter('SiteEventI18n'));   
        if ($this->event_i18n->hasEventUser())
        {
            $request->addRequestParameter('event_i18n', $this->event_i18n);
            $this->forward ($this->getModuleName (), 'ajaxDisplayEventI18n');
        }
   }

}

