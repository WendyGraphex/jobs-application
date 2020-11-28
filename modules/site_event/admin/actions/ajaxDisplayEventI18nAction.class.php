<?php


class site_event_ajaxDisplayEventI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new SiteEventViewForm();
        $this->event_i18n=$request->getRequestParameter('event_i18n',new SiteEventI18n($request->getPostParameter('SiteEventI18n')));        
   }

}

