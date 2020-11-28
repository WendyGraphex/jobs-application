<?php

require_once __DIR__."/../locales/Forms/SiteEventSpeakerUsersAddForm.class.php";
    
 
class site_event_ajaxAddSpeakersForEventAction extends mfAction {
    

    function execute(mfWebRequest $request) {   
        $messages = mfMessages::getInstance();
        $this->user=$this->getUser();              
        $this->form=new SiteEventSpeakerUsersAddForm($request->getPostParameter('SiteEventSpeakerUsers'));
        $this->form->bind($request->getPostParameter('SiteEventSpeakerUsers'));                     
    }

}


