<?php

require_once __DIR__."/../locales/Forms/SiteEventSpeakerUserForm.class.php";

class site_event_ajaxViewSpeakerUserAction extends mfAction {

    function execute(mfWebRequest $request) {                        
        $messages = mfMessages::getInstance();              
        $this->user=$this->getUser();
        $this->item=new SiteEventSpeakerUser($request->getPostParameter('SiteEventSpeakerUser'));  
        $this->form = new SiteEventSpeakerUserForm($this->getUser()->getLanguage());         
    }

}
